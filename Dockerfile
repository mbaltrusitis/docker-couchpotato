FROM ubuntu:16.04
MAINTAINER Matthew Baltrusitis <matthew@baltrusitis.com>

ENV DEBIAN_FRONTEND="noninteractive"
ENV HOME=/opt/couchpotato
ENV CONFIGS=$HOME/.couchpotato

RUN mkdir -p "${HOME}" \
    && apt-get -qy update \
    && apt-get install -qy --fix-missing \
        git \
        gcc \
        python-pip \
        python-lxml \
        python-openssl \
    && git clone https://github.com/RuudBurger/CouchPotatoServer.git "${HOME}"/src

VOLUME ["${CONFIGS}"]
EXPOSE 5050

CMD ["python", "/opt/couchpotato/src/CouchPotato.py", "--console_log", "--config_file=/opt/couchpotato/.couchpotato/config.ini", "--data_dir=/opt/couchpotato/.couchpotato"]
