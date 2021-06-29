
# stage 1

FROM node:alpine AS studentshop11
WORKDIR /app
COPY . .
RUN npm ci && npm run build

# stage 2

FROM nginx:alpine
COPY --from=studentshop11 /app/dist/studentshop11 /usr/share/nginx/html
EXPOSE 80