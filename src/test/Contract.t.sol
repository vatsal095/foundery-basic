// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "../StakeContract.sol";
import "../Mocks/MockERC20.sol";

contract ContractTest is DSTest {
    StakeContract public stakeContract;
    MockERC20 public mockERC20;
    function setUp() public {
        stakeContract = new StakeContract();
        mockERC20 = new MockERC20();
    }

    function testExample(uint8 amount) public {
        mockERC20.approve(address(stakeContract),amount);
        bool stakePass = stakeContract.stake(address(mockERC20), amount);
        assertTrue(stakePass);
    }
}
