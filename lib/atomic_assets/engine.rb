module AtomicAssets
  class Engine < ::Rails::Engine
    initializer "atomic_assets.setup_autoload_path" do |app|
      app.config.autoload_paths += %w(app/components)
    end

    initializer "atomic_assets.setup_action_controller" do |app|
      ActiveSupport.on_load :action_controller do
        include AtomicAssets::Helper
      end
    end

    initializer "atomic_assets.setup_action_view" do |app|
      ActiveSupport.on_load :action_view do
        include AtomicAssets::Helper
      end
    end
  end
end
