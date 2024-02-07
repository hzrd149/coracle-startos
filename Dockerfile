FROM node:lts as builder

WORKDIR /app

COPY ./coracle/package*.json .
COPY ./coracle/yarn.lock .
RUN yarn config set unsafe-perm true && yarn install

COPY ./coracle .

RUN yarn build

FROM nginx:stable-alpine-slim
EXPOSE 8080
COPY --from=builder /app/dist /usr/share/nginx/html

ADD ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/docker_entrypoint.sh
