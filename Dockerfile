FROM ghcr.io/astral-sh/uv:debian-slim

ENV UV_LINK_MODE=copy \
    UV_COMPILE_BYTECODE=1 \
    UV_PYTHON=python3.13 \
    UV_PROJECT_ENVIRONMENT=/app

RUN apt-get update && \
    apt-get install -y gcc libgdal-dev && \
    rm -rf /var/cache/apt/archives /var/lib/apt/lists

COPY pyproject.toml .
RUN --mount=type=cache,target=/root/.cache \
    --mount=type=bind,source=uv.lock,target=uv.lock \
    --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
    uv sync \
        --locked \
        --no-dev \
        --no-install-project

WORKDIR /jupyter
EXPOSE 8888
ENTRYPOINT uv run jupyter lab --ip=0.0.0.0 --IdentityProvider.token='' --no-browser --allow-root
