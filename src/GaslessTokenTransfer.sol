// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface IERC20Permit {
    function approve(address spender, uint256 amount) external returns (bool);
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);
     function permit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;
}

contract GaslessTokenTransfer  {
    function send(
        address token,
        address sender,
        address receiver,
        uint256 amount,
        uint256 fee,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external {
        //permiit the contract to spend a particular amount
        IERC20Permit(token).permit(
            sender, address(this), amount + fee, deadline, v, r, s
        );
        // Send amount to receiver
        IERC20Permit(token).transferFrom(sender, receiver, amount);
        // Send the fee to the msg.sender
        IERC20Permit(token).transferFrom(sender, msg.sender, fee);
    }
}