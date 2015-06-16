Pod::Spec.new do |s|
  s.name = 'ADVOperation'
  s.version = '1.0.0'
  s.license = 'UNLICENSE'
  s.summary = 'Advanced Operations'
  s.homepage = 'https://github.com/gsempe/ADVOperation'
  s.social_media_url = 'http://twitter.com/gsempe'
  s.authors = { 'Guillaume Sempe' => 'guillaume@sempe.net' }
  s.source = { :git => 'https://github.com/gsempe/ADVOperation.git', :tag => s.version }

  s.ios.deployment_target = '9.0'

  s.source_files = 'Source/*.swift'

  s.requires_arc = true
end
