module Jinda_adminlte 
  class InstallGenerator < Rails::Generators::Base

    desc "Install jinda adminlte theme to existing Jinda app "
    def self.source_root
      File.dirname(__FILE__) + "/templates"
    end

    def setup_app
      inside("app/views/layouts") { run "mv application.haml application.haml.bak" }
      inside("app/views/layouts") { run "mv lte lte.bak" }
      inside("app/views/identities") { run "mv new.html.haml new-bak.html.haml" }
      inside("app/views/sessions") { run "mv new.html.haml new-bak.html.haml" }
      inside("app/assets") { run "mv jinda_assets ../../tmp/cache" }
      inside("app/assets") { run "mv javascripts ../../tmp/cache" }
      inside("app/assets") { run "mv stylesheets ../../tmp/cache" }
      directory "app/views/adminltes"
      directory "app/views/layouts/lte"
      directory "app/views/identities"
      directory "app/views/sessions"

    end

    def copy_theme
      copy_file "application.js","app/assets/javascripts/application.js"
      copy_file "application.scss","app/assets/stylesheets/application.scss"
      copy_file "jinda.scss","app/assets/stylesheets/jinda.scss"
      copy_file "application.haml","app/views/layouts/application.haml"
      copy_file "adminltes_controller.rb","app/controllers/adminltes_controller.rb"
    end

    def finish        
      puts "------------------------------------------------\n"
      puts "                                                \n"
      puts "  Jinda Theme installation finished             \n"
      puts "  Note: last jinda_assets was move to tmp/cache \n"
      puts "  To delte run the following command            \n"
      puts "                                                \n"
      puts "rake tmp:cache:clear                            \n"
      puts "------------------------------------------------\n"
    end
  end
end

