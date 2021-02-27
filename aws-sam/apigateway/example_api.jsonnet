local method = import './method.jsonnet.TEMPLATE';
local resource = import './resource.jsonnet.TEMPLATE';

local api = {
  id: 'example_api_id',
  rootResourceId: 'example_root_resource_id',
};

local resources = {
  v1: resource.newResource(api.id, '/v1', api.rootResourceId),
  allOrdersV1: resource.newResource(api.id, '/v1/orders'),
  oneOrderV1: resource.newResource(api.id, '/v1/orders/{order_id}'),
};

local methods = {
  getOrders: method.newMethod(api.id, '/v1/orders', props={
    HttpMethod: 'GET',
    Integration: {
      Type: 'MOCK',
    },
  }),
  createOrder: method.newMethod(api.id, '/v1/orders/{order_id}', props={
    HttpMethod: 'POST',
    Integration: {
      Type: 'MOCK',
    },
  }),
};

{
  [resource.logicalId]: resource.definition
  for resource in std.objectValues(resources)
} + {
  [method.logicalId]: method.definition
  for method in std.objectValues(methods)
}
