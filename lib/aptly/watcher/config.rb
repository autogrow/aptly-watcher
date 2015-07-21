require 'yaml'

module Aptly
  module Watcher
    module Config
      class << self

        def parse(config_file)
          config = YAML.load_file(config_file)
          valid_config!(config)
          config
        end

        def valid_config!(config)
          raise ArgumentError, "Config file missing :pidfile:"      unless config[:pidfile]
          raise ArgumentError, "Config file missing :conf:"         unless config[:conf]
          raise ArgumentError, "Config file missing :log:"          unless config[:log]
          raise ArgumentError, "Config file missing :repos:"        unless config[:repos]
          raise ArgumentError, "Config file missing :distrib:"      unless config[:distrib]
          raise ArgumentError, "Config file missing :incoming_dir:" unless config[:incoming_dir]
        end

      end
    end
  end
end