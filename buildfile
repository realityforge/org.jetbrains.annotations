require 'buildr/git_auto_version'
require 'buildr/gpg'
require 'buildr/gwt'

desc 'org.jetbrains.annotations: A minimal, J2CL compatible org.jetbrains.annotations library'
define 'org.jetbrains.annotations' do
  project.group = 'org.realityforge.org.jetbrains.annotations'
  compile.options.source = '1.8'
  compile.options.target = '1.8'
  compile.options.lint = 'all'

  project.version = ENV['PRODUCT_VERSION'] if ENV['PRODUCT_VERSION']

  doc.options['Xdoclint:none'] = true
  pom.add_apache_v2_license
  pom.add_github_project('realityforge/org.jetbrains.annotations')
  pom.add_developer('realityforge', 'Peter Donald')

  gwt_enhance(project)

  package(:jar)
  package(:sources)
  package(:javadoc)

  ipr.add_component_from_artifact(:idea_codestyle)
end
