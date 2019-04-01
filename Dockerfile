FROM debian:stretch-slim

RUN apt-get update
RUN apt-get install -y gnupg curl debian-archive-keyring apt-transport-https

RUN echo "deb http://download.tarantool.org/tarantool/1.10/debian/ stretch main" > /etc/apt/sources.list.d/tarantool_1_10.list
RUN echo "deb-src http://download.tarantool.org/tarantool/1.10/debian/ stretch main" >> /etc/apt/sources.list.d/tarantool_1_10.list
RUN curl -L "http://download.tarantool.org/tarantool/1.10/gpgkey" | apt-key add -

RUN echo "deb http://glial-iot.github.io/glial-stable stretch main" > /etc/apt/sources.list.d/glial_nightly.list
RUN curl -L "https://glial-iot.github.io/glial-stable/PUBLIC.KEY" | apt-key add -

RUN apt-get update
RUN apt-get install -y glial

EXPOSE 8080
