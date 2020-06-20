module Kubes::Compiler::Dsl::Syntax
  class Service < Resource
    attribute_methods :port,
                      :protocol,
                      :targetPort

    # kubectl explain service.spec
    attribute_methods :clusterIP,                # <string>
                      :externalIPs,              # <[]string>
                      :externalName,             # <string>
                      :externalTrafficPolicy,    # <string>
                      :healthCheckNodePort,      # <integer>
                      :ipFamily,                 # <string>
                      :loadBalancerIP,           # <string>
                      :loadBalancerSourceRanges, # <[]string>
                      :ports,                    # <[]Object>
                      :publishNotReadyAddresses, # <boolean>
                      :selector,                 # <map[string]string>
                      :sessionAffinity,          # <string>
                      :sessionAffinityConfig,    # <Object>
                      :type                      # <string>

    # kubectl explain service.spec.ports
    attribute_methods :nodePort,   # <integer>
                      :port,       # <integer> -required-
                      :port_name,  # <string>  (originally named port)
                      :protocol,   # <string>
                      :targetPort  # <string>

    def default_apiVersion
      "v1"
    end

    def default_selector
      labels
    end

    def default_spec
      {
        ports: ports,
        selector: selector,
        type: type,
      }
    end

    def default_type
      "ClusterIP"
    end

    def default_ports
      [
        nodePort: nodePort,    # <integer>
        port: port,            # <integer> -required-
        port_name: port_name,  # <string>  (originally named port)
        protocol: protocol,    # <string>
        targetPort: targetPort # <string>
      ]
    end

    def default_port
      80
    end

    def default_protocol
      "TCP"
    end

    def default_targetPort
      80
    end
  end
end
