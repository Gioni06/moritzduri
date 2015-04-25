axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
less         = require 'less'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
contentful   = require 'roots-contentful'
marked       = require 'marked'
slugify      = require 'slug'

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf']

  extensions: [
    js_pipeline(files: 'assets/js/*.coffee')
    css_pipeline(files: 'assets/css/*.less')
    contentful
      access_token: ''
      space_id: ''
      content_types:
        blog_posts:
          id: ''
          template: 'views/_single.jade'
          path: (e) -> "blog/#{slugify(e.title)}"
  ]

  less:
    sourcemap: true

  'coffee-script':
    sourcemap: true
  server:
    clean_urls: true
    error_page: '404.html'  
  jade:
    pretty: true
  locals:
    markdown: marked
    contentful: contentful
    slugify: slugify   