require 'dragonfly'
require 'rack/cache'
require 'refinerycms-core'

module Refinery
  module Images

    class << self
      attr_accessor :root
      def root
        @root ||= Pathname.new(File.expand_path('../../', __FILE__))
      end
    end

    class Engine < ::Rails::Engine

      initializer 'serve static assets' do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        ::Refinery::Plugin.register do |plugin|
          plugin.pathname = root
          plugin.name = 'refinery_images'
          plugin.directory = 'images'
          plugin.version = %q{1.0.0}
          plugin.menu_match = /(refinery|admin)\/image(_dialog)?s$/
          plugin.activity = {
            :class => Image
          }
        end
      end
    end
  end
end

::Refinery.engines << 'dashboard'
