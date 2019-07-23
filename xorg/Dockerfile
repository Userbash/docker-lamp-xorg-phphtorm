FROM spritsail/debian-builder

MAINTAINER Paulo Murer

COPY sources.list /etc/apt
COPY resolv.conf /etc
COPY docker-entrypoint.sh /opt

RUN echo nameserver 8.8.8.8 > /etc/resolv.conf
RUN apt-get update 

ENV packages_to_install wget curl xvfb snapd x11vnc xterm vim \
                       openbox tint2 lxterminal \
                       gmrun mc conky remmina sakura \
                       freerdp2-x11 freerdp2-shadow-x11\
                       tigervnc-viewer pidgin feh \
                       syncthing  git lilyterm mc \
                       gzip unzip unrar htop net-tools \
                       firefox-esr tar 
                                                        


RUN apt install -dy $packages_to_install
RUN apt install -y $packages_to_install

RUN rm -rf /var/cache/apt/*
RUN wget https://download.jetbrains.com/webide/PhpStorm-2019.1.3.tar.gz
RUN tar xvf /tmp/PhpStorm-2019.1.3.tar.gz -C /opt
RUN ln -s /opt/PhpStorm-191.7479.51/bin/phpstorm.sh /usr/local/bin
RUN mkdir /var/www
RUN mkdir /var/www/html

RUN adduser -D -H -u 1000 -s /bin/bash user

ADD config /opt/config

RUN chmod +x /opt/config/docker-entrypoint.sh /opt/config/openbox/autostart

RUN rm -rf /etc/xdg/openbox && \
    cp -R /opt/config/openbox /etc/xdg/openbox

ENV DISPLAY :99
EXPOSE 5900

RUN chmod +x /opt/docker-entrypoint.sh
CMD "/opt/config/docker-entrypoint.sh"
