FROM node:$version

RUN apt-get -y update && \
    apt-get -y install default-jre && \
    apt-get -y install default-jdk && \
    apt-get -y install ca-certificates-java && \
    apt-get -y clean && \
    update-ca-certificates -f;

ENV JAVA_HOME $(which java)
RUN echo $JAVA_HOME

RUN npm install -g firebase-tools firebase-bolt

RUN firebase setup:emulators:database && \
    firebase setup:emulators:firestore && \
    firebase setup:emulators:pubsub && \
    firebase setup:emulators:storage