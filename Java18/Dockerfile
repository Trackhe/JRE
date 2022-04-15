FROM openjdk:18-buster
ARG BUILD
ARG JVM_ARGS $JVM_ARGS
ENV JVM_ARGS $JVM_ARGS

COPY application /application
COPY setup.sh /setup/setup.sh

WORKDIR /application

RUN if [ [ -z "$BUILD"] ] ; then javac main.java ; fi

WORKDIR /usr/src/app

VOLUME /usr/src/app

RUN apt install screen

CMD ["sh", "-c", "chmod +x /setup/setup.sh && /setup/setup.sh && cd /usr/src/app && java $JVM_ARGS"]
