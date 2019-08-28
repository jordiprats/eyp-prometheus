class prometheus::config inherits prometheus {

  systemd::service { $prometheus::params::service_name:
    description => 'Prometheus Server',
    documentation => 'https://prometheus.io/docs/introduction/overview/',
    after_units => [ 'network-online.target' ],

    user => 'prometheus',
    restart => 'on-failure',
    execstart => "/opt/prometheus/prometheus -config.file=/opt/prometheus/prometheus.yml -storage.local.path=/opt/prometheus/data",
  }

}
