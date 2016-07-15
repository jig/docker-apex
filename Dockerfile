FROM golang

RUN apt-get update && apt-get -y install emacs24-nox
# && apt-get -y install curl
RUN curl https://raw.githubusercontent.com/apex/apex/master/install.sh | sh
RUN go get github.com/apex/go-apex github.com/tj/go-gateway

# docker run -v ~/.aws:/root/.aws:ro -ti jordi/apex
