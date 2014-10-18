FROM ansible/ubuntu14.04-ansible:stable
MAINTAINER Mark Stillwell <mark@stillwell.me>

COPY . /var/cache/docker/nova-controller
WORKDIR /var/cache/docker/nova-controller

# workaround, some kind of versioning problem in nova...
RUN rm /etc/apt/sources.list.d/proposed.list && \
    apt-get update && \
    if [ ! -f provisioning/group_vars/all.yml ]; then \
      mkdir -p provisioning/group_vars;\
      ln -s ../../defaults/main.yml provisioning/group_vars/all.yml;\
    fi && \
    ansible-playbook -i inventories/local.ini provisioning/install.yml && \
    rm -rf /var/lib/apt/lists/*

VOLUME [ "/etc/nova", "/var/lib/nova", "/var/log/nova", "/var/log/supervisor" ]

CMD [ "/usr/bin/supervisord" ]

EXPOSE 6080 8773 8774 8775
