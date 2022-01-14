FROM node:$version

RUN npm install -g firebase-tools firebase-bolt
RUN firebase setup:emulators:database && \
    firebase setup:emulators:firestore && \
    firebase setup:emulators:pubsub && \
    firebase setup:emulators:storage