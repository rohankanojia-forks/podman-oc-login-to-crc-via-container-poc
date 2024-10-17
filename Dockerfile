FROM registry.access.redhat.com/ubi9/openjdk-17:1.20-2.1726695177

LABEL org.opencontainers.image.authors="CRCQE <devtools-crc-qe@redhat.com>"
ARG OSTYPE

USER root
# Install oc
RUN curl -o oc.tar https://downloads-openshift-console.apps.sandbox-m4.g2pi.p1.openshiftapps.com/amd64/linux/oc.tar
RUN tar -xf oc.tar
RUN mv oc /usr/local/bin/oc
# Install Git
RUN microdnf install -y git 
USER default

RUN git clone https://github.com/eclipse-jkube/jkube.git
COPY <<-EOT /script.sh
  oc login -u developer -p developer https://host.containers.internal:6443 --insecure-skip-tls-verify -v=9
  cd jkube/quickstarts/maven/quarkus
  mvn -U package oc:build oc:resource oc:apply 
EOT
ENTRYPOINT ["sh", "/script.sh"]
