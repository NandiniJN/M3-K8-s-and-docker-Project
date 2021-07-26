FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM node:alpine as prod

WORKDIR '/app'

COPY --from=builder /usr/app/ .

RUN node server.js