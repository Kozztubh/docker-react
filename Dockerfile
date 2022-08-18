FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm config set strict-ssl false
RUN npm install
COPY . .
# RUN npm run build
CMD ["npm", "run", "build"]

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html