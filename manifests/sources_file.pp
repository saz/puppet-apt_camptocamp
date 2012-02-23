class apt::sources_file ( $ensure = "present" ) {
    file { '/etc/apt/sources.list':
        owner => root,
        group => root,
        mode => 644,
        ensure => $ensure,
        source => $lsbdistcodename ? {
            squeeze => 'puppet:///files/global/etc/apt/sources.list-squeeze',
            default => 'puppet:///files/global/etc/apt/sources.list-lenny',
        },
        notify => Exec['apt-get_update'],
    }
}
