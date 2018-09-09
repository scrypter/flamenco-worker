FROM ubuntu:latest

COPY flamenco-worker-2.1.0 /flamenco
COPY entrypoint.sh /flamenco/entrypoint.sh

WORKDIR /flamenco

RUN \
  yes | apt-get update \
  && apt-get -y install gettext-base vim curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*


ENTRYPOINT ["/flamenco/entrypoint.sh"]
