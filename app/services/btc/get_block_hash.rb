module Btc
  class GetBlockHash

    extend LightService::Action
    expects :bitcoiner_client, :block_height
    promises :block_hash

    executed do |c|
      c.block_hash = of_height(c.block_height, {
        bitcoiner_client: c.bitcoiner_client,
      })
    end

    def self.of_height(
      height,
      bitcoiner_client: InitBitcoinerClient.execute.bitcoiner_client
    )
      bitcoiner_client.request("getblockhash", height)
    end

  end
end
