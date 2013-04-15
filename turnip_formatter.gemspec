# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'turnip_formatter/version'

Gem::Specification.new do |spec|
  spec.name          = "turnip_formatter"
  spec.version       = TurnipFormatter::VERSION
  spec.authors       = ["Wataru MIYAGUNI"]
  spec.email         = ["gonngo@gmail.com"]
  spec.description   = %q{aa}
  spec.summary       = %q{aa}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'turnip'
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end