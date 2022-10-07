FROM debian:bullseye-slim

ARG ADMIN_PW=nimda

RUN apt-get update && \
    apt-get install -y \
    ant \
    apt-utils \
    gettext \
    git \
    gradle \
    maven \
    openjdk-17-jre \
    procps \
    unzip
   
COPY ./commerce.zip . 

RUN mkdir hybris && \
    unzip commerce.zip -d hybris && \
    rm commerce.zip 

WORKDIR hybris/installer

RUN ./install.sh -r cx setup -A initAdminPassword=${ADMIN_PW} 
RUN ./install.sh -r cx initialize -A initAdminPassword=${ADMIN_PW} 

EXPOSE 9001 9002 9003 9004 8000 8983

CMD ["-r", "cx", "start"]
ENTRYPOINT [ "/hybris/installer/install.sh" ]
