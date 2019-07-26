FROM arm64v8/node:lts-alpine

ARG APP_VERSION=0.16.2

ENV NODE_ENV production

RUN wget https://github.com/nondanee/UnblockNeteaseMusic/archive/v${APP_VERSION}.tar.gz -O - | tar -xz -C / \
 && mv /UnblockNeteaseMusic-${APP_VERSION} /UnblockNeteaseMusic \
 && cd /UnblockNeteaseMusic \
 && npm install --production

WORKDIR /UnblockNeteaseMusic

EXPOSE 8080

ENTRYPOINT ["node", "app.js"]
