module SystemCheck
  module App
    class DatabaseConfigExistsCheck < SystemCheck::BaseCheck
      set_name 'Database config exists?'

      def check?
        database_config_file = Rails.root.join('config', 'database.yml')

        File.exist?(database_config_file)
      end

      def show_error
        try_fixing_it(
          'Copy config/database.yml.<your db> to config/database.yml',
          'Check that the information in config/database.yml is correct'
        )
        for_more_information(
          see_database_guide,
          'http://guides.rubyonrails.org/getting_started.html#configuring-a-database'
        )
        fix_and_rerun
      end

      private

      def see_database_guide
        'doc/install/databases.md'
      end
    end
  end
end
