Pod::Spec.new do |s|
  s.name         = 'TXAttachmentPickerController'
  s.version      = '1.1.4'
  s.authors = { 'Denis Bogatyrev' => 'denis.bogatyrev@gmail.com' }
  s.summary      = 'This powerful component allows to select different types of files from different sources on your device'
  s.homepage     = 'https://github.com/tualatrix/DBAttachmentPickerController'
  s.license      = { :type => 'MIT' }
  s.requires_arc = true
  s.platform     = :ios, '8.0'
  s.source       = { :git => 'https://github.com/tualatrix/DBAttachmentPickerController.git', :branch => "master" }
  s.source_files = 'Source/**/*.{h,m}'
  s.resources = 'Source/**/*.{xib}'
  s.resource_bundle = { 'DBAttachmentPickerController' => ['Source/Localization/*.lproj'] }
  s.public_header_files = 'Source/**/*.h'
end
