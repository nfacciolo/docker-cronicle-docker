#!/bin/bash

VERSION=0.9.2

docker build -t nicolasfco/cronicle-docker .
docker scan nicolasfco/cronicle-docker:latest

#docker tag bluet/cronicle-docker:latest bluet/cronicle-docker:0.8.62
#git tag "0.8.62" -a -m "docker 20.10, cronicle 0.8.62"
#git push --tags

# Fixes busybox trigger error https://github.com/tonistiigi/xx/issues/36#issuecomment-926876468
# docker run --privileged -it --rm tonistiigi/binfmt --install all

# docker buildx create --use

while true; do
        read -p "Have I Updated VERSION Info? (Is current VERSION=${VERSION} ?) [y/N]" yn
        case $yn in
                [Yy]* ) docker buildx build -t nicolasfco/cronicle-docker:latest -t nicolasfco/cronicle-docker:${VERSION} --platform linux/amd64,linux/arm64/v8 --push .; break;;
                [Nn]* ) exit;;
                * ) echo "";;
        esac
done


