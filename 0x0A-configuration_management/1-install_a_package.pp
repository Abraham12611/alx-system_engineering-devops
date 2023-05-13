# install_flask.pp

# Install pip3
package { 'python3-pip':
  ensure => installed,
}

# Install Flask 2.1.0 using pip3
exec { 'install_flask':
  command => '/usr/bin/pip3 install Flask==2.1.0',
  path    => '/usr/bin',
  require => Package['python3-pip'],
}

# Run puppet-lint
# Note: Make sure puppet-lint is installed
exec { 'puppet_lint':
  command => 'puppet-lint install_flask.pp',
  path    => '/usr/bin',
  require => Exec['install_flask'],
}

