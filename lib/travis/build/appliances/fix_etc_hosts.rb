require 'travis/build/appliances/base'

module Travis
  module Build
    module Appliances
      class FixEtcHosts < Base
        def apply
          sh.raw %(cat /etc/hosts | sed -e 's/^\\(127\\.0\\.0\\.1.*\\)$/\\1 '`hostname`'/' | sudo tee /etc/hosts > dev/null)
        end

        def apply?
          if data.key?(:fix_etc_hosts)
            data[:fix_etc_hosts]
          else
            !data[:skip_etc_hosts_fix]
          end
        end
      end
    end
  end
end
