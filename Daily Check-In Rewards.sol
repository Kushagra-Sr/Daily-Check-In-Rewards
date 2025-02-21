pragma solidity ^0.8.0;

contract DailyLoginRewards {
    mapping(address => uint256) public lastLogin;
    mapping(address => uint256) public rewards;
    uint256 public rewardAmount = 1 ether;

    function login() public {
        require(block.timestamp >= lastLogin[msg.sender] + 1 days, "Already logged in today");
        lastLogin[msg.sender] = block.timestamp;
        rewards[msg.sender] += rewardAmount;
    }
    
    function getRewardBalance(address user) public view returns (uint256) {
        return rewards[user];
    }
}
