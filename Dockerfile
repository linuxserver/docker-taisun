FROM lsiobase/alpine:3.9

# set version label
ARG BUILD_DATE
ARG TAISUN_RELEASE
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer"

RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache --virtual=build-dependencies \
	curl \
	gcc \
	libffi-dev \
	make \
	musl-dev \
	nodejs-npm \
	openssl-dev \
	py-pip \
	python-dev && \
 echo "**** install runtime packages ****" && \
 apk add --no-cache \
	nodejs \
	docker \
	libcap \
	tcl \
	expect \
	python2 && \
 pip install --upgrade pip && \
 npm config set unsafe-perm true && \
 npm i npm@latest -g && \
 pip install docker-compose && \
 echo "**** install Taisun ****" && \
 mkdir -p \
	/usr/src/Taisun && \
 if [ -z ${TAISUN_RELEASE+x} ]; then \
	TAISUN_RELEASE=$(curl -sX GET "https://api.github.com/repos/Taisun-Docker/taisun/releases/latest" \
	| awk '/tag_name/{print $4;exit}' FS='[""]'); \
 fi && \
 curl -o \
 /tmp/taisun.tar.gz -L \
	"https://github.com/Taisun-Docker/taisun/archive/${TAISUN_RELEASE}.tar.gz" && \
 tar -xzf \
 /tmp/taisun.tar.gz -C \
	/usr/src/Taisun/ --strip-components=1 && \
 echo ${TAISUN_RELEASE} > /usr/src/Taisun/version && \
 echo "**** install node modules ****" && \
 npm install --prefix /usr/src/Taisun && \
 chown -R abc:abc /usr/src/Taisun && \
 echo "**** cleanup ****" && \
 apk del --purge \
	build-dependencies && \
 rm -rf \
	/tmp/*

# add local files
COPY root/ /

# ports
EXPOSE 3000
