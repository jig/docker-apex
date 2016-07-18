FROM golang

RUN apt-get update && apt-get -y install emacs24-nox unzip
# && apt-get -y install curl
RUN curl https://raw.githubusercontent.com/apex/apex/master/install.sh | sh
RUN go get github.com/apex/go-apex github.com/tj/go-gateway

# docker run -v ~/.aws:/root/.aws:ro -ti jordi/apex
RUN mkdir /root/terraform 
WORKDIR /root/terraform 
RUN curl https://releases.hashicorp.com/terraform/0.6.16/terraform_0.6.16_linux_amd64.zip > tf.zip && \
    unzip tf.zip && \
    rm tf.zip
RUN echo 'PATH=$PATH:~/terraform' >> /root/.bashrc
RUN echo 'alias ll="ls -l"' >> /root/.bashrc
WORKDIR /root/apex
RUN go get github.com/apex/apex-shell
RUN go get github.com/go-logfmt/logfmt

# DO docker run -v ~/.aws:/root/.aws:ro -v $PWD:/root/apex -ti jordi/apex 
