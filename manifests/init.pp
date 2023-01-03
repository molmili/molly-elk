# elk
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include elk
class elk {
  class {'logstash':}
  logstash::plugin {'logstash-input-beats':}
  logstash::configfile{'beats':
    source => 'puppet:///modules/elk/files/beats.conf',
  }


  include ::java
  class { 'elasticsearch':
    jvm_options => ['-Xms256m','-Xmx256m']  
  }

  class {'kibana': 
    config => {
      'server.host' => '0.0.0.0'
    }
  }

}
