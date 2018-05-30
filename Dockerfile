FROM java:8
MAINTAINER Jon Packard <jon@packard.tech>

RUN mkdir -p /opt/ftb/world
WORKDIR /opt/ftb
RUN apt-get install -y curl wget
env DOWNLOADURL="https://minecraft.curseforge.com/projects/sevtech-ages/files/2560178/download"
RUN curl -L -o server.zip $DOWNLOADURL && unzip server.zip && rm -f server.zip
RUN echo eula=true > /opt/ftb/eula.txt
COPY ops.json server.properties ./
RUN sed -i 's/2048M/4096M/g' settings.sh
RUN /bin/bash Install.sh

CMD ["sh", "ServerStart.sh"]
