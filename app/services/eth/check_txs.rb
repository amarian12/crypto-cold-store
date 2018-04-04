module Eth
  class CheckTxs

    extend LightService::Organizer

    def self.call
      reduce(actions)
    end

    def self.actions
      [
        InitEthereumClient,
        GetCurrentBlock,
        GetBlocksToSync,
        iterate(:unsynced_blocks, [
          EnqueueSyncBlockJob,
        ])
      ]
    end

  end
end
