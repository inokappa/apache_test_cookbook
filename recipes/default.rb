#
# Cookbook Name:: apache_test
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "apt-get_update" do
  command "apt-get update"
end

package "apache2" do
  action :install
end

bash "enable_mod_proxy" do
  cwd "/tmp"
  user "root"
  code <<-EOH
    a2enmod proxy
    a2enmod proxy_http
    a2enmod proxy_connect
    a2enmod proxy_balancer
  EOH
end
