pragma solidity ^0.7.6;
pragma abicoder v2;

import "./BaseForkFixture.sol";

contract NotifyRewardAmountWithoutClaimForkTest is BaseForkFixture {
    CLPool public pool;
    GaugeV2 public gauge;
    address public feesVotingReward;

    function setUp() public override {
        super.setUp();

       
    }

    function testFork_NotifyRewardAmountWithoutClaimResetsRewardRateInKilledGauge()
        public
    {
        skip(1 days);

        

        
    }
}
