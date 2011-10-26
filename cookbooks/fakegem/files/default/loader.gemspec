# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "loader/version"
Gem::Specification.new do |s|
  s.name        = "loader"
  s.version     = Loader::VERSION
  s.authors     = ["Mike Hagedorn"]
  s.email       = ["mike@silverchairsolutions.com"]
  s.homepage    = ""
  s.summary     = %q{ Write a gem summary}
  s.description = %q{Write a gem description}

  s.rubyforge_project = "loader"

  s.files         = "lib/loader.rb"
  s.require_paths = ["lib"]
  s.add_runtime_dependency "passenger"
end
