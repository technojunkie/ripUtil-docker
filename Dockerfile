FROM ubuntu:16.04
MAINTAINER technojunkie

RUN apt-get -y update && apt-get install -y \
    build-essential \
    handbrake-cli \
    libdvdnav4 \
    libdvdread4 \
    libudev-dev \
    openssh-server \
    software-properties-common
RUN mkdir /home/makemkv; \
    cd /home/makemkv

ADD http://www.makemkv.com/download/makemkv-bin-1.10.2.tar.gz
ADD http://www.makemkv.com/download/makemkv-oss-1.10.2.tar.gz

RUN cd /home/makemkv/makemkv-oss-1.10.2 && make install; \
    cd /home/makemkv/makemkv-bin-1.10.2 && make install; \
    rm -r /home/makemkv
RUN groupadd -r ripbot && useradd -r -g ripbot ripbot; \
    apt-get -y remove build-essential && apt-get -y autoremove

EXPOSE 22
