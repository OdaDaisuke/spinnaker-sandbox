ARG HALYARD_VERSION=1.44.1
FROM us-docker.pkg.dev/spinnaker-community/docker/halyard:${HALYARD_VERSION}

USER root
RUN mkdir -p /var/secrets/google
RUN chmod 755 /var/secrets/google
RUN chown -R spinnaker:spinnaker /var/secrets/google
RUN chown -R spinnaker:spinnaker /home/spinnaker

USER spinnaker
ENV HOME '/home/spinnaker'
RUN curl -sSL https://sdk.cloud.google.com | bash
ENV PATH $PATH:/home/spinnaker/google-cloud-sdk/bin

RUN pwd \
  KUBECTL_LATEST=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt) \
  cd home \
  curl -LO https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_LATEST/bin/linux/amd64/kubectl \
  chmod +x kubectl \
  sudo mv kubectl /usr/local/bin/kubectl \
  kubectl version \
  sudo apt update \
  sudo apt install default-jdk \
  curl -O https://raw.githubusercontent.com/spinnaker/halyard/master/install/debian/InstallHalyard.sh \
  sudo bash InstallHalyard.sh \
  hal -v \
  . ~/.bashrc
