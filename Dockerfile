FROM node:18 AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run build -- --configuration production

FROM nginx:stable-alpine

RUN rm -rf /usr/share/nginx/html/*

COPY --from=builder /app/dist/angular-conduit /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
