// SPDX-License-Identifier: BUSL-1.1
pragma solidity =0.7.6;
pragma abicoder v2;

import {CLPoolFactory} from "contracts/core/CLPoolFactory.sol";
import {GaugeV2Factory} from "contracts/gauge/GaugeV2Factory.sol";
import {IVoter} from "contracts/interfaces/IVoter.sol";
import {IVotingEscrow} from "contracts/interfaces/IVotingEscrow.sol";
// import {IFactoryRegistry} from "contracts/core/interfaces/IFactoryRegistry.sol";
import {IGaugeV2} from "contracts/interfaces/IGaugeV2.sol";

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import {ICLPool} from "contracts/interfaces/ICLPool.sol";
import {IVotingRewardsFactory} from "contracts/test/interfaces/IVotingRewardsFactory.sol";

contract MockVoter is IVoter {
    // mock addresses used for testing gauge creation, a copy is stored in Constants.sol
    address public forwarder = address(11);

    // Rewards are released over 7 days
    uint256 internal constant DURATION = 7 days;

    /// @dev pool => gauge
    mapping(address => address) public override gauges;
    /// @dev gauge => isAlive
    mapping(address => bool) public override isAlive;
    mapping(address => address) public override gaugeToFees;
    mapping(address => address) public override gaugeToBribes;

    IERC20 internal immutable rewardToken;
    // IFactoryRegistry public immutable override factoryRegistry;
    IVotingEscrow public immutable override ve;
    address public immutable override emergencyCouncil;

    constructor(address _rewardToken, address _factoryRegistry, address _ve) {
        rewardToken = IERC20(_rewardToken);
        // factoryRegistry = IFactoryRegistry(_factoryRegistry);
        ve = IVotingEscrow(_ve);
        emergencyCouncil = msg.sender;
    }

    function claimFees(address[] memory, address[][] memory, uint256) external override {}

    function distribute(address[] memory) external pure override {
        revert("Not implemented");
    }

    function createGauge(address _poolFactory, address _pool) external override returns (address) {
        //TODO: Implement
    }

    function distribute(address gauge) external override {
        // uint256 _claimable = rewardToken.balanceOf(address(this));
        // if (_claimable > IGaugeV2(gauge).left() && _claimable > DURATION) {
        //     rewardToken.approve(gauge, _claimable);
        //     IGaugeV2(gauge).notifyRewardAmount(rewardToken.balanceOf(address(this)));
        // }
    }

    function killGauge(address gauge) external override {
        isAlive[gauge] = false;
    }

    function vote(uint256 _tokenId, address[] calldata _poolVote, uint256[] calldata _weights) external override {}

    function claimRewards(address[] memory _gauges) external override {
        // uint256 _length = _gauges.length;
        // for (uint256 i = 0; i < _length; i++) {
        //     IGaugeV2(_gauges[i]).getReward(msg.sender);
        // }
    }
}
