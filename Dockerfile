FROM ghcr.io/linuxserver/wireguard

COPY ./src /wgdashboard

RUN apt-get update
RUN apt-get install -y python3.7 python3-pip build-essential python3.7-dev libjpeg-dev zlib1g-dev

RUN pip3 install -r /wgdashboard/requirements.txt

COPY ./wireguard.sh /
RUN chmod +x /wireguard.sh
RUN chmod +x /wgdashboard/wgd.sh

ENTRYPOINT [ "/wireguard.sh" ]
