# frozen_string_literal: true

# Main module of the application, containing each other one.
# @author Vincent Courtois <courtois.vincent@outlook.com>
module Virtuatable
  autoload :API, 'virtuatable/api'
  autoload :Application, 'virtuatable/application'
  autoload :Builders, 'virtuatable/builders'
  autoload :Controllers, 'virtuatable/controllers'
  autoload :Helpers, 'virtuatable/helpers'
  autoload :Loader, 'virtuatable/application'
  autoload :Specs, 'virtuatable/specs'
end
