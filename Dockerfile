FROM mirror.gcr.io/library/node:22-alpine AS builder
WORKDIR /app
# Install build tools for native modules like bcrypt-nodejs
RUN apk add --no-cache python3 make g++
COPY package*.json ./
RUN npm install
COPY . .

FROM mirror.gcr.io/library/node:22-alpine
WORKDIR /app
COPY --from=builder /app ./
# Prune dev dependencies for production
RUN npm prune --production
ENV NODE_ENV=production
ENV PORT=3000
ENV HOSTNAME=0.0.0.0
EXPOSE 3000
CMD ["node", "./bin/www"]