if defined?(Merb::Plugins)

  require 'merb-slices'
  Merb::Plugins.add_rakefiles "<%= base_name %>/merbtasks"

  # Register the Slice for the current host application
  Merb::Slices::register(__FILE__)
  
  # Slice configuration - set this in a before_app_loads callback.
  # By default a Slice uses its own layout.
  Merb::Slices::config[:<%= underscored_name %>] = { :layout => :<%= underscored_name %> }
  
  # All Slice code is expected to be namespaced inside a module
  module <%= module_name %>
    
    # Slice metadata
    self.description = "<%= module_name %> is a chunky Merb slice!"
    self.version = "0.0.1"
    self.author = "YOUR NAME"
    
    # Initialization hook - runs before AfterAppLoads BootLoader
    def self.init
    end
    
    # Activation hook - runs after AfterAppLoads BootLoader
    def self.activate
    end
    
    # Deactivation hook - triggered by Merb::Slices#deactivate
    def self.deactivate
    end
    
    # Setup routes inside the host application
    #
    # @param scope<Merb::Router::Behaviour>
    #  Routes will be added within this scope (namespace). In fact, any 
    #  router behaviour is a valid namespace, so you can attach
    #  routes at any level of your router setup.
    def self.setup_router(scope)
    end
    
  end
  
  # Setup the slice layout for <%= module_name %>
  #
  # Use <%= module_name %>.push_path and <%= module_name %>.push_app_path
  # to set paths to <%= base_name %>-level and app-level paths. Example:
  #
  # <%= module_name %>.push_path(:application, <%= module_name %>.root)
  # <%= module_name %>.push_app_path(:application, Merb.root / 'slices' / '<%= base_name %>')
  # ...
  #
  # Any component path that hasn't been set will default to <%= module_name %>.root
  #
  # Or just call setup_default_structure! to setup a basic Merb MVC structure.
  <%= module_name %>.setup_default_structure!
  
end