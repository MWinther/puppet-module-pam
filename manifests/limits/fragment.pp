# == Define: pam::limits::fragment
#
# Places a fragment in /etc/security/limits.d/
#
define pam::limits::fragment (
  $source,
) {

  include pam
  include pam::limits

  file { "${pam::limits::limits_d_dir}/${name}.conf":
    ensure  => file,
    source  => $source,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['pam_package'],
  }
}
