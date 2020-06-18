module Kubes::Compiler::Dsl::Syntax
  class Resource < Kubes::Compiler::Dsl::Core::Base
    attribute_methods :apiVersion,
                      :kind,
                      :labels,
                      :metadata,
                      :resource,
                      :spec

    # top-level of resource is quite common
    def default_resource
      data = {
        apiVersion: apiVersion,
        kind: kind,
        metadata: metadata,
        spec: spec,
      }.deep_stringify_keys
      data = HashSqueezer.squeeze(data)
      YAML.dump(data)
    end

    def default_metadata
      {
        name: @name,
        labels: labels,
        namespace: @namespace,
      }
    end

    def default_kind
      self.class.to_s.split('::').last # IE: Deployment
    end
  end
end
