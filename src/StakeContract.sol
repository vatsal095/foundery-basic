// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
error Transferfailed();
contract StakeContract {

    mapping(address => mapping(address => uint)) s_balances;

    function stake(address token, uint256 amount ) external returns(bool) {
        s_balances[msg.sender][token] += amount;
        bool sucess = IERC20(token).transferFrom(msg.sender, address(this), amount);
        if(!sucess) revert Transferfailed();
        return sucess;
    }

}
