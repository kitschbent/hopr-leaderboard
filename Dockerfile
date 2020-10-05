FROM node:alpine

ARG HOPR_ENVIRONMENT
ARG FIREBASE_PROJECT_ID
ARG FIREBASE_API_KEY
ARG FIREBASE_AUTH_DOMAIN
ARG FIREBASE_DATABASE_URL
ARG FIREBASE_STORAGE_BUCKET

WORKDIR /usr/app
COPY package.json .
RUN yarn install
COPY . .

VOLUME /appdata
RUN NEXT_PUBLIC_HOPR_ENVIRONMENT=$HOPR_ENVIRONMENT \
NEXT_PUBLIC_FIREBASE_PROJECT_ID=$FIREBASE_PROJECT_ID \
NEXT_PUBLIC_FIREBASE_API_KEY=$FIREBASE_API_KEY \
NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN=$FIREBASE_AUTH_DOMAIN \
NEXT_PUBLIC_FIREBASE_DATABASE_URL=$FIREBASE_DATABASE_URLa \
NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET=$FIREBASE_STORAGE_BUCKET \
yarn run build

EXPOSE 3000
ENV NODE_ENV production
CMD ["yarn", "start"]
