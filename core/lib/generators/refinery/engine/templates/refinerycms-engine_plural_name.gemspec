# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-<%= engine_plural_name %>'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails <%= engine_plural_name.titleize %> engine for Refinery CMS'
  s.date              = '<%= Time.now.strftime('%Y-%m-%d') %>'
  s.summary           = '<%= engine_plural_name.titleize %> engine for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> <%= Refinery::Version %>'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> <%= Refinery::Version %>'
end
