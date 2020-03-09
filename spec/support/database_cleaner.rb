require 'database_cleaner.rb'
	
RSpec.configure do |config|
 
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end
  
  config.around do |example| do 
    DatabaseCleaner.cleaning do
        example.run
  end
end