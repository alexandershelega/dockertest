FROM ubuntu:14.04
ENV DEBIAN_FRONTEND noninteractive
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y && apt-get install shellinabox mcrypt  htop screen gcc g++ make python curl git -y
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - && apt-get install nodejs -y

RUN cd /opt/ && git clone https://github.com/krishnasrinivas/wetty && cd /opt/wetty && npm install


COPY ./run2.sh /root/run2.sh

RUN chmod +x /root/run2.sh

WORKDIR /root

ENTRYPOINT ["/root/run2.sh"]
