# encoding: utf-8

Gem::Specification.new do |s|
  s.name        = "sinatra-rax"
  s.version     = "1.0.1"
  s.author      = "Steve Shreeve"
  s.email       = "steve.shreeve@gmail.com"
  s.summary     = "A minimal and modern Ruby/IRB console for Sinatra apps"
  s.description = "Provides a simple console to interact with Sinatra apps"
  s.homepage    = "https://github.com/shreeve/sinatra-rax"
  s.license     = "MIT"
  s.files       = `git ls-files`.split("\n") - %w[.gitignore]
  s.executables = `cd bin && git ls-files .`.split("\n")
  s.add_runtime_dependency 'rack-test', '~> 2.0'
end
