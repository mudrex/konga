FROM node:12.16-alpine

WORKDIR /app

RUN apk upgrade --update \
    && apk add bash git ca-certificates \
    && npm install -g bower \
    && apk del git \
    && rm -rf /var/cache/apk/* \
        /app/.git \
        /app/screenshots \
        /app/test

COPY package.json package-lock.json ./

RUN npm install

COPY . .

EXPOSE 1337

ENTRYPOINT ["/app/start.sh"]
