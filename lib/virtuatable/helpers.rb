# frozen_string_literal: true

module Virtuatable
  # The helpers are used inside the controllers to dynamically
  # add features and functions.
  # @author Vincent Courtois <courtois.vincent@outlook.com>
  module Helpers
    autoload :Accounts, 'virtuatable/helpers/accounts'
    autoload :Applications, 'virtuatable/helpers/applications'
    autoload :Declarators, 'virtuatable/helpers/declarators'
    autoload :Fields, 'virtuatable/helpers/fields'
    autoload :Gateways, 'virtuatable/helpers/gateways'
    autoload :Parameters, 'virtuatable/helpers/parameters'
    autoload :Routes, 'virtuatable/helpers/routes'
    autoload :Sessions, 'virtuatable/helpers/sessions'
  end
end
