#   Copyright 2014 Brainsware
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

# This type handles adding ssl "vhosts" to ssl_multicert.config
#     ssl_hosts         => {
#       'dest_ip'       => '*',
#       'ssl_cert_name' => 'bar.pem',
#       'ssl_key_name'  => 'barKey.pem',
#       'ssl_ca_name'   => 'Ca.pem'
#     },
define trafficserver::config::ssl_host (
  $ssl_cert_name,
  $dest_ip        = undef,
  $ssl_key_name   = undef,
  $ssl_ca_name    = undef,
  $ssl_key_dialog = undef,
){
  include 'trafficserver'
  include 'trafficserver::ssl'


  $configfile  = "${::trafficserver::sysconfdir}/${::trafficserver::params::ssl_config}"

  datacat_fragment { 'SSL Config':
    target => $configfile,
    data   => {
      ssl_cert_name  => $ssl_cert_name,
      dest_ip        => $dest_ip,
      ssl_key_name   => $ssl_key_name,
      ssl_ca_name    => $ssl_ca_name,
      ssl_key_dialog => $ssl_key_dialog,
    }
  }
}
