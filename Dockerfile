FROM centos:7

RUN yum install -y wget make git hg svn bzr gcc docker && \
  yum clean all

ENV GOLANG_VERSION 1.7.1
RUN wget https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz && \
  tar -C /usr/local -xzf go$GOLANG_VERSION.linux-amd64.tar.gz && \
  rm go${GOLANG_VERSION}.linux-amd64.tar.gz

ENV GLIDE_VERSION 0.12.2
ENV GO15VENDOREXPERIMENT 1
RUN wget https://github.com/Masterminds/glide/releases/download/${GLIDE_VERSION}/glide-${GLIDE_VERSION}-linux-amd64.tar.gz && \
  tar -xzf glide-${GLIDE_VERSION}-linux-amd64.tar.gz && \
  mv linux-amd64 /usr/local/glide && \
  rm glide-${GLIDE_VERSION}-linux-amd64.tar.gz

ENV PATH $PATH:/usr/local/go/bin
ENV PATH $PATH:/usr/local/glide
ENV GOROOT /usr/local/go
ENV PATH $PATH:/go/bin
ENV GOPATH=/go
