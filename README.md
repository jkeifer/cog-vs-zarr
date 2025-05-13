# COG vs Zarr

This repo contains a notebook ([./notebooks/cog_vs_zarr.ipynb](./notebooks/cog_vs_zarr.ipynb)) used
to prove out the hypotheses behind the Element 84 blog post <todo> authored by
@jkeifer and @jsignell.

## Running the notebook

The notebook should be viewable within GitHub as-is. Users that want to run the
notebook themselves or are interested in contributing any fixes are welcome to
do so using one of the following three approaches.

### Running in GitHub Codespaces (recommended as easiest approach)

This method is also recommended because it does not require any user
configuration to get up and running. However, it does depend on an external,
web-based service, which may not be ideal in environments with unknown internet
quality (i.e., FOSS4G). This said, it does not require the user to run anything
locally beyond a web browser, which may be necessary for users with Windows or
administratively locked-down machines.

To use GitHub Codespaces, browse to [the project repo in
Github](https://github.com/jkeifer/cog-vs-zarr). There, click the green
`<> Code` dropdown button, select the `Codespaces` tab in the dropdown menu,
then click the button to add a new codespace from the `main` branch.

Once the codespace is fully started, go back into the codespaces dropdown menu
on the project repo page (you will likely need to refresh the page). You should
see the codespace listed, and a button with three dots `...` next to it. Click
that button to open a menu with more actions for the codespace, then select
"Open in JupyterLab". Select and open a notebook from the `notebooks` directory.

### Running locally with docker (recommended for local executions)

Using docker has the advantage of better constraining the execution
environment, which is also set up automatically with the required dependencies.

Note that the instructions below were written with a MacOS/Linux environment in
mind. Windows users will likely need to leverage WSL to access a Linux
environment to run docker.


> [!IMPORTANT]
> Because of some of the compiled dependencies and their lack of prebuilt
> binaries for aarch64 Linux, MacOS users with M-series processors will
> not be able to run the docker container with the native architecture.
>
> The container will run automatically via amd64 arch per the compose.yml,
> but note that performance will not be as fast as native execution.


To begin, clone this repo:

```commandline
git clone https://github.com/jkeifer/cog-vs-zarr.git
cd cog-vs-zarr
```

Ensure the docker daemon or an equivalent is running via whatever mechanism is
preferred (on Linux via the docker daemon or podman; on MacOS via Docker
Desktop, colima, podman, OrbStack, or others), then use `docker compose` to
`up` the project:

```commandline
docker compose up
```

This will start up the Jupyter container within docker in the foreground. If
preferring to run compose in the background, add the detach option to the
compose command via the `-d` flag.

JupyterLab will be started with no authentication, running on port 8888 (by
default; use the env var `JUPYTER_PORT` to change it if that port is already
taken on your machine). Open a web browser and browse to
[`http://127.0.0.1:8888`](http://127.0.0.1:8888) to open the JupyterLab
interface. Select and open a notebook from the `notebooks` directory.

### Running locally without docker (least recommended approach)

This approach is not recommended as it is more subject to local environment
differences than the docker-based approaches. But it does have the benefit of
not requiring docker as a dependency.

Note that the instructions below were written with a MacOS/Linux environment in
mind. Windows users will likely need to leverage something like [git for
Windows](https://gitforwindows.org/) and the included Git BASH tool to follow
along (WSL is also likely a viable solution to get a Linux environment on a
Windows machine).

To get started, clone this repository and set up a python venv. Python >=3.12
is recommended:

```commandline
git clone https://github.com/jkeifer/cog-vs-zarr.git
cd cog-vs-zarr
python -m venv .venv
source .venv/bin/activate
```

With the activated virtual environment, install the required python dependencies:

```commandline
pip install -r requirements.txt
```

Doing so will install Jupyter, which can then be started by running the
following command:

```commandline
jupyter lab
```

Jupyter should automatically launch the JupyterLab interface in a web browser
with this project loaded. Select and open a notebook from the `notebooks` directory.
