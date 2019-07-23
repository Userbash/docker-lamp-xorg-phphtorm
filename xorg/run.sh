#!/bin/bash -xe

docker rm -f xvfb-x11vnc-openbox || true
docker run -itd -p 49155:5900 --name xvfb-x11vnc-openbox murer/xvfb-x11vnc-openbox "$@" 

