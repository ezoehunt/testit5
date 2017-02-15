activate :directory_indexes
activate :autoprefixer
activate :gzip
activate :sprockets

set :relative_links, true

set :css_dir, "assets/css"
set :js_dir, "assets/js"
set :images_dir, "assets/images"
set :fonts_dir, "assets/fonts"

# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# Reload browser whenever files change
configure :development do
  activate :livereload
end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  activate :relative_assets
  #activate :minify_css
  #activate :minify_javascript

  # ignore during build so assets arent
  # recreated again in /build
  ignore "assets/js/vendor/*"
  ignore "assets/css/vendor/style.scss"
  ignore "assets/css/vendor/bootstrap/*"
  ignore "assets/css/vendor/font-awesome/*"
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.branch = 'gh-pages'
  deploy.deploy_method = :git
end
