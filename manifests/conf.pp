define apt::conf($ensure, $content = undef, $source = undef) {
    file {"/etc/apt/apt.conf.d/${name}":
      ensure  => $ensure,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => $content,
      source  => $source,
      before  => Exec["apt-get_update"],
      notify  => Exec["apt-get_update"],
    }
  }
}
