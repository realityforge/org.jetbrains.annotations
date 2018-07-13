require 'buildr/git_auto_version'
require 'buildr/gpg'

desc 'org.jetbrains.annotations: A minimal, J2CL compatible org.jetbrains.annotations library'
define 'org.jetbrains.annotations' do
  project.group = 'org.realityforge.org.jetbrains.annotations'
  compile.options.source = '1.8'
  compile.options.target = '1.8'
  compile.options.lint = 'all'

  project.version = ENV['PRODUCT_VERSION'] if ENV['PRODUCT_VERSION']

  pom.add_apache_v2_license
  pom.add_github_project('realityforge/org.jetbrains.annotations')
  pom.add_developer('realityforge', 'Peter Donald')

  package(:jar).include(project._('src/main/java/org'))
  package(:sources)
  package(:javadoc)

  ipr.add_component_from_artifact(:idea_codestyle)
end
