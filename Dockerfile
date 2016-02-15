FROM mbaltrusitis/deb-base:wheezy

ENV LANG "C"

RUN mkdir /app \
    && git clone https://github.com/RuudBurger/CouchPotatoServer.git /app/couchpotato \
    && apt-get -q update \
    && apt-get install -qqfy --fix-missing \
        gcc \
        python-pip \
        python-lxml \
        python-openssl

EXPOSE 5050

CMD ["python", "/app/couchpotato/CouchPotato.py", "--config_file=/configdata/couchpotato/config.ini", "--data_dir=/mediadata"]
