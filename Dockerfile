FROM node:13.2.0-buster

LABEL maintainer="pe.weeble@yahoo.fr"

WORKDIR /tmp

RUN apt-get update

RUN \
  npm install -g github-wikito-converter@v1.5.2 && \
  curl -L https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.buster_amd64.deb -o wkhtmltox.deb && \
  apt-get install -y ./wkhtmltox.deb && \
  rm -Rf wkhtmltox.deb

RUN ln -sf /bin/bash /bin/sh

ENTRYPOINT [ "gwtc" ]
