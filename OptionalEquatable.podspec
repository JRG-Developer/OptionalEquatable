Pod::Spec.new do |s|
  s.platform              = :ios
  s.ios.deployment_target = '8.0'
  s.name          = "OptionalEquatable"
  s.version       = "0.2.0"
  s.summary       = "OptionalEquatable makes optional conform to Equatable... Sorta. ;)"
  s.homepage      = "https://github.com/JRG-Developer/OptionalEquatable"
  s.license       = { :type => "MIT", :file => "LICENSE" }
  s.author        = { "Joshua Greene" => "jrg.developer@gmail.com" }
  s.source        = { :git => "https://github.com/JRG-Developer/OptionalEquatable.git",
                      :tag => "#{s.version}" }
  s.requires_arc = true
  s.framework = "Foundation"
  s.source_files = "OptionalEquatable/Library/*.{swift}"
end
