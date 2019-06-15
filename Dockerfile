FROM golang:1.12.6-alpine3.9
  
# Gopkg.toml 等を事前にコピーして dep ensure が実行できるようにする
COPY . /go/src/server/

# dep ensure を行うプロジェクトルートに移動する
WORKDIR /go/src/server/

# 必要なパッケージをイメージにインストールする
RUN apk update \
  && apk add --no-cache \
  curl \
  git \
  bash \
  vim \
  gcc \
  mysql \
  mysql-client \
  mysql-dev \
  && go get -u github.com/golang/dep/cmd/dep \
  && go get -u github.com/gin-gonic/gin \
  && go get -u github.com/pilu/fresh \
  && go get -u github.com/garyburd/redigo/redis \
  && go get -u github.com/motemen/gore \
  && go get -u github.com/nsf/gocode \
  && go get -u github.com/k0kubun/pp \
  && go get -u github.com/joho/godotenv \
  && dep ensure

# コンテナ実行時のデフォルトを設定する
# ライブリロードを実行する
CMD ["fresh"]