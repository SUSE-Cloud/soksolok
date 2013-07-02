#
# Cookbook Name:: rabbitmq-devwrap
# Recipe:: default
#
# Copyright (c) 2013 SUSE LINUX Products GmbH, Nuernberg, Germany.
#
# All modifications and additions to the file contributed by third parties
# remain the property of their copyright owners, unless otherwise agreed
# upon. The license for this file, and modifications and additions to the
# file, is the same license as for the pristine package itself (unless the
# license for the pristine package is not an Open Source License, in which
# case the license is the MIT License). An "Open Source License" is a
# license that conforms to the Open Source Definition (Version 1.9)
# published by the Open Source Initiative.

include_recipe 'rabbitmq-server'

nova_user = node['openstack']['compute']['rabbit']['username']
nova_vhost = node['openstack']['compute']['rabbit']['vhost']

rabbitmq_vhost nova_vhost do
  action :add
end

rabbitmq_user nova_user do
  password nova_user # this will work only in development mode

  action :add
end

rabbitmq_user nova_user do
  vhost nova_vhost
  permissions '.* .* .*'
  action :set_permissions
end


