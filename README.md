nova-controller ansible role
============================

[![Build Status](https://travis-ci.org/marklee77/ansible-role-nova-controller.svg?branch=master)](https://travis-ci.org/marklee77/ansible-role-nova-controller)

The purpose of this role is to deploy nova-controller onto Ubuntu. 

Role Variables
--------------

- openstack_mysql_host: 127.0.0.1
- openstack_mysql_port: 3306
- openstack_rabbitmq_host: 127.0.0.1
- openstack_rabbitmq_port: 5672
- openstack_log_verbose: true
- openstack_log_debug: false
- openstack_compute_cpu_allocation_ratio: 16.0
- openstack_compute_ram_allocation_ratio: 1.5
- openstack_compute_disk_allocation_ratio: 1.0
- openstack_default_region: RegionOne

Example Playbook
-------------------------

    - hosts: all
      sudo: True
      roles:
        - nova-controller

License
-------

GPLv2

Author Information
------------------

http://stillwell.me
