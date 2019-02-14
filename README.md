[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)](https://linuxserver.io)

The [LinuxServer.io](https://linuxserver.io) team brings you another container release featuring :-

 * regular and timely application updates
 * easy user mappings (PGID, PUID)
 * custom base image with s6 overlay
 * weekly base OS updates with common layers across the entire LinuxServer.io ecosystem to minimise space usage, down time and bandwidth
 * regular security updates

Find us at:
* [Discord](https://discord.gg/YWrKVTn) - realtime support / chat with the community and the team.
* [IRC](https://irc.linuxserver.io) - on freenode at `#linuxserver.io`. Our primary support channel is Discord.
* [Blog](https://blog.linuxserver.io) - all the things you can do with our containers including How-To guides, opinions and much more!
* [Podcast](https://anchor.fm/linuxserverio) - on hiatus. Coming back soon (late 2018).

# PSA: Changes are happening

From August 2018 onwards, Linuxserver are in the midst of switching to a new CI platform which will enable us to build and release multiple architectures under a single repo. To this end, existing images for `arm64` and `armhf` builds are being deprecated. They are replaced by a manifest file in each container which automatically pulls the correct image for your architecture. You'll also be able to pull based on a specific architecture tag.

TLDR: Multi-arch support is changing from multiple repos to one repo per container image.

# [linuxserver/taisun](https://github.com/linuxserver/docker-taisun)
[![](https://img.shields.io/discord/354974912613449730.svg?logo=discord&label=LSIO%20Discord&style=flat-square)](https://discord.gg/YWrKVTn)
[![](https://images.microbadger.com/badges/version/linuxserver/taisun.svg)](https://microbadger.com/images/linuxserver/taisun "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/linuxserver/taisun.svg)](https://microbadger.com/images/linuxserver/taisun "Get your own version badge on microbadger.com")
![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/taisun.svg)
![Docker Stars](https://img.shields.io/docker/stars/linuxserver/taisun.svg)
[![Build Status](https://ci.linuxserver.io/buildStatus/icon?job=Docker-Pipeline-Builders/docker-taisun/master)](https://ci.linuxserver.io/job/Docker-Pipeline-Builders/job/docker-taisun/job/master/)
[![](https://lsio-ci.ams3.digitaloceanspaces.com/linuxserver/taisun/latest/badge.svg)](https://lsio-ci.ams3.digitaloceanspaces.com/linuxserver/taisun/latest/index.html)

[Taisun](https://www.taisun.io/) is an application for a Docker enabled device with an emphasis on providing a web based interface for managing a single server.
Taisun allows you to:

  - Deploy and manage web based virtual desktops.
  - Deploy Taisun specific stacks of applications
  - Browse available images on popular Docker repositories
  - Import a Docker project from any git repository and start developing on your choice of web based IDE or full Linux desktop
  - Spinup a developer container based on popular frameworks and work from a web based IDE
  - Single click remote server access to Taisun and your Docker applications


[![taisun](https://raw.githubusercontent.com/Taisun-Docker/taisun/master/public/favicon/apple-icon-180x180.png)](https://www.taisun.io/)

## Supported Architectures

Our images support multiple architectures such as `x86-64`, `arm64` and `armhf`. We utilise the docker manifest for multi-platform awareness. More information is available from docker [here](https://github.com/docker/distribution/blob/master/docs/spec/manifest-v2-2.md#manifest-list). 

Simply pulling `linuxserver/taisun` should retrieve the correct image for your arch, but you can also pull specific arch images via tags.

The architectures supported by this image are:

| Architecture | Tag |
| :----: | --- |
| x86-64 | amd64-latest |
| arm64 | arm64v8-latest |
| armhf | arm32v6-latest |


## Usage

Here are some example snippets to help you get started creating a container.

### docker

```
docker create \
  --name=taisun \
  -p 3000:3000 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --restart unless-stopped \
  linuxserver/taisun
```


### docker-compose

Compatible with docker-compose v2 schemas.

```
---
version: "2"
services:
  taisun:
    image: linuxserver/taisun
    container_name: taisun
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    ports:
      - 3000:3000
    mem_limit: 4096m
    restart: unless-stopped
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 3000` | Taisun WebUI. |
| `-v /var/run/docker.sock` | Docker Socket on the system |


&nbsp;
## Application Setup

The webui is at http://localhost:3000, for more information on usage see [here](https://github.com/Taisun-Docker/taisun/wiki/Usage).



## Support Info

* Shell access whilst the container is running: `docker exec -it taisun /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f taisun`
* container version number 
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' taisun`
* image version number
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' linuxserver/taisun`

## Updating Info

Most of our images are static, versioned, and require an image update and container recreation to update the app inside. With some exceptions (ie. nextcloud, plex), we do not recommend or support updating apps inside the container. Please consult the [Application Setup](#application-setup) section above to see if it is recommended for the image.  
  
Below are the instructions for updating containers:  
  
### Via Docker Run/Create
* Update the image: `docker pull linuxserver/taisun`
* Stop the running container: `docker stop taisun`
* Delete the container: `docker rm taisun`
* Recreate a new container with the same docker create parameters as instructed above (if mapped correctly to a host folder, your `/config` folder and settings will be preserved)
* Start the new container: `docker start taisun`
* You can also remove the old dangling images: `docker image prune`

### Via Docker Compose
* Update the image: `docker-compose pull linuxserver/taisun`
* Let compose update containers as necessary: `docker-compose up -d`
* You can also remove the old dangling images: `docker image prune`

## Versions

* **13.02.19:** - Initial release.
