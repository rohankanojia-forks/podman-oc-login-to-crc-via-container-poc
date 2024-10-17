podman build . --tag redhat-ubi-openjdk17-with-oc:latest --build-arg OSTYPE=$OSTYPE
podman run --rm  \
  redhat-ubi-openjdk17-with-oc:latest 
#  --add-host=host.containers.internal:host-gateway \
#  --add-host=oauth-openshift.apps-crc.testing:host-gateway \
#docker build . --tag redhat-ubi-openjdk17-with-oc:latest --build-arg OSTYPE=$OSTYPE
#docker run --rm --network=bridge --add-host=host.docker.internal:host-gateway redhat-ubi-openjdk17-with-oc:latest 


