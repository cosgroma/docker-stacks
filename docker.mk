# Description: Makefile for Docker commands

# `docker --version` - Check the version of Docker installed
# `docker ps -a` - Lists all the containers which are running and which previously ran
# `docker ps` - Lists all the currently running containers
# `docker container ls -a` - Lists all the containers which are running and which previously ran
# `docker container ls` - Lists all the currently running containers
# `docker run <image-name>` - (Old Syntax) Run a docker image locally
# `docker container run <image-name>` - (New Syntax) Run a docker image locally
# `docker container run --publish 8000:80 <image-name>` - Map the host port(8000) with container port(80)
# `docker container run --detach <image-name>` - Run in the background
# `docker container run --name <custom-container-name> <image-name>` - Start a container with custom name
# `docker container rename <container-identifier> <new-name>` - Rename an already running container (Identifier could be the container id or container name)
# `docker container stop <container-identifier>` - Stop a container
# `docker container kill <container-identifier>` - Kill a container
# `docker container start <container-identifier>` - Start any stopped or killed container.(In detached mode as well as retains the previous configs)
# `docker container restart <container-identifier>` - Restart any running container
# `docker container create --publish 8000:80 <image-name>` - Creates a container from the given image
# `docker container start <container-identifier>` - Start the container
# `docker container rm <container-identifier>` - Remove a dangling/stopped container
# `docker container prune` - Remove all dangling containers
# `docker container run --rm <image-name>` - `--rm` Remove the container as soon as it is stopped.
# `docker container start --rm <container-identifier>`
# `docker container run -it ubuntu` - Run a container in interactive mode.
# `docker container run <image-name> <command>` - Run a `command` in the container.
# `docker container run --rm -v <directory-on-filesystem>:<directory-inside-container> <image-name> <command>` - `-v` or `--volume` is used for creating a bind mount for a container
# `docker image build .` - Build an image from the current working directory(must have `Dockerfile` file)
# `docker image build --tag <image-repository>:<image-tag>` - Tag an image with name.
# `docker image tag <image-id> <image-respository>:<image-tag>` - Tag an existing image using the image id.
# `docker image tag <image-repository>:<image-tag> <new-image-repository>:<new-image-tag>` - Change tag of an exisiting image.
# `docker image ls` - List all the images in your local system.
# `docker image rm <image-identifier>` - Remove an image.
# `docker image prune` - Remove all images.
# `docker image history <image-identifier>` - Visualize the many layers of an image.
# `docker image pull <image-name>` - Pull a docker image from the registry
# `docker login` - Login using Dockerhub account
# `docker image push <image-repository>:<image-tag>` - Push a docker image to docker hub.
# `docker image build --file <custom-filename> --tag <image-repository>:<tag>` - Use `custom-filename` as our Dockerfile
# `docker container inspect --format='{{range .NetworkSetting.Networks}} {{.IPAddress}} {{end}}' <container-identifier>` - Finding the exact IP address of a container.
# `docker network ls` - List out the networks in your system.
# `docker network inspect --format='{{range .Containers}}{{.Name}}{{end}}' bridge` - Inspect the `bridge` network.(See all the containers using the bridge network).
# `docker network create <network-name>` - Create a user-defined network.
# `docker network connect <network-identifier> <container-identifier>` - Connect a container to a network.
# `docker container run --network <network-identifier> <container>` - Another way of connecting to the network.
# `docker network disconnect <network> <container>` - Disconnect a container from the network.
# `docker network rm <network>` - Remove a network.
# `docker volume create <volume-name>` - Create a named volume.
# `docker volume ls` - List all named volumes.
# `docker container logs <container>` - See the logs from a particular container.
# `docker container inspect <container>` - Inspect a docker container.
# `docker container exec <container-identifier> <command>` - Execute a command inside a running container.
# `docker container exec -it <container> <command>` - Run a command in interactive mode inside a running container.
# `docker-compose --file docker-compose.yaml up --detach` - Start the servies defined in `docker-compose.yaml` file.
# `docker-compose ps` - List all Service containers started by Compose.


CONTAINER_IDS := $(shell docker ps -aq)
IMAGE_IDS := $(shell docker images -q)

.PHONY: docker-ps
docker-ps:
	docker ps

.PHONY: docker-ps-all
docker-ps-all:
	docker ps -a

.PHONY: docker-summary
docker-summary:
	docker system df

.PHONY: docker-stop-all
docker-stop-all:
	docker stop $(CONTAINER_IDS)

docker-list:
	@for container in $(CONTAINER_IDS); do \
		echo $$container; \
		docker inspect --format='{{.Name}} - {{.State.Status}}' $$container; \
	done