Pod::Spec.new do |s|

  s.name         = "IDZSwiftCommonCrypto"
  s.version      = "0.7.2"
  s.summary      = "A wrapper for Apple's Common Crypto library written in Swift."

  s.homepage     = "https://github.com/iosdevzone/IDZSwiftCommonCrypto"
  s.license      = "MIT"
  s.author             = { "iOSDevZone" => "idz@iosdeveloperzone.com" }
  s.social_media_url   = "http://twitter.com/iOSDevZone"
 
  s.osx.deployment_target = '10.10'
  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source       = { :git => "https://github.com/logicsb/IDZSwiftCommonCrypto.git", :tag => s.version.to_s }

  #
  # Create the dummy CommonCrypto.framework structures
  #
  s.prepare_command = <<-CMD
  touch prepare_command.txt
  echo 'Running prepare_command'
  pwd
  echo Running GenerateCommonCryptoModule
  swift -DSWIFT_VERSION=2.3 ./GenerateCommonCryptoModule.swift macosx .
  swift -DSWIFT_VERSION=2.3 ./GenerateCommonCryptoModule.swift iphonesimulator .
  swift -DSWIFT_VERSION=2.3 ./GenerateCommonCryptoModule.swift iphoneos .
  swift -DSWIFT_VERSION=2.3 ./GenerateCommonCryptoModule.swift appletvsimulator .
  swift -DSWIFT_VERSION=2.3 ./GenerateCommonCryptoModule.swift appletvos .
  swift -DSWIFT_VERSION=2.3 ./GenerateCommonCryptoModule.swift watchsimulator .
  swift -DSWIFT_VERSION=2.3 ./GenerateCommonCryptoModule.swift watchos .

CMD

  s.source_files  = "IDZSwiftCommonCrypto"

  # Stop CocoaPods from deleting dummy frameworks
  s.preserve_paths = "Frameworks"

  # Make sure we can find the dummy frameworks
  s.xcconfig = { 
  "SWIFT_INCLUDE_PATHS" => "${PODS_ROOT}/IDZSwiftCommonCrypto/Frameworks/$(PLATFORM_NAME)",
  "FRAMEWORK_SEARCH_PATHS" => "${PODS_ROOT}/IDZSwiftCommonCrypto/Frameworks/$(PLATFORM_NAME)"
  }

end
