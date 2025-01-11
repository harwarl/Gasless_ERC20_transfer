// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {DeployMockToken} from "script/DeployMockToken.s.sol";
import {DeployGaslessTokenTransfer} from "script/DeployGaslessTokenTranfer.s.sol";
import {GaslessTokenTransfer} from "src/GaslessTokenTransfer.sol";
import {MockToken} from "./mocks/MockToken.sol";
import {IERC20Permit} from "src/interfaces/IERC20Permit.sol";

contract GaslessTokenTransferTest is Test {
    GaslessTokenTransfer gaslessTokenTransfer;
    MockToken mockToken;

    // USERS
    address public USER1 = makeAddr("user1");
    address public USER2 = makeAddr("user2");

    uint256 public constant STARTING_BALANCE = 20 ether;

    function setUp() external {
        DeployMockToken deployMockToken = new DeployMockToken();
        DeployGaslessTokenTransfer deployGaslessTokenTransfer = new DeployGaslessTokenTransfer();

        gaslessTokenTransfer = deployGaslessTokenTransfer.run();
        mockToken = deployMockToken.run();

        vm.deal(USER1, STARTING_BALANCE);
    }

    function testGaslessTokenTransferContractIsValid() public {

    }

    function testMockTokenContractIsValid() public {

    }
}