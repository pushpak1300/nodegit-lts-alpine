FROM node:lts-alpine

WORKDIR /srv

# Install build tools
RUN mkdir /nodegit && \
    cd /nodegit && \
    apk update && \
    apk upgrade && \
    apk add git libgit2-dev && \
    apk add python tzdata pkgconfig build-base
       
RUN npm i nodegit

# Remove unnecessary packages and tools
RUN apk del python tzdata pkgconfig build-base && \
    rm package-lock.json && \
    rm -rf /tmp/* /var/cache/apk/*