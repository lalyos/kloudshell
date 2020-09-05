FROM gcr.io/cloudshell-images/cloudshell:latest

RUN apt-get install fzf
ADD https://github.com/rancher/k3s/releases/download/v1.18.8%2Bk3s1/k3s /usr/local/bin
RUN chmod +x /usr/local/bin/k3s

ADD https://github.com/rancher/k3d/releases/download/v3.0.1/k3d-linux-amd64 /usr/local/bin/k3d
RUN chmod +x /usr/local/bin/k3d
RUN k3d completion bash > /etc/bash_completion.d/k3d
RUN kubectl completion bash > /etc/bash_completion.d/kubectl

# To trigger a rebuild of your Cloud Shell image:
# 1. Commit your changes locally: git commit -a
# 2. Push your changes upstream: git push origin master

# This triggers a rebuild of your image hosted at gcr.io/cs-k8s/kloudshell.
# You can find the Cloud Source Repository hosting this file at https://source.developers.google.com/p/cs-k8s/r/kloudshell
