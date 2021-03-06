# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask 'adoptopenjdk11-openj9-jre-large' do
  version '11.0.6,10'
  sha256 '1e01a31753c0a549db52d667f65dab5ccf4b6ff876751f62d626a07ed3909767'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.6%2B10_openj9-0.18.1/OpenJDK11U-jre_x64_mac_openj9_macosXL_11.0.6_10_openj9-0.18.1.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 11 (OpenJ9) (JRE) (XL)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK11U-jre_x64_mac_openj9_macosXL_11.0.6_10_openj9-0.18.1.pkg'

  postflight do
    system_command '/usr/sbin/pkgutil', args: ['--pkg-info', 'net.adoptopenjdk.11-openj9.jre'], print_stdout: true
  end

  uninstall pkgutil: 'net.adoptopenjdk.11-openj9.jre'
end
