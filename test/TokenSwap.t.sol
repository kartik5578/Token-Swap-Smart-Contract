// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {TokenSwap} from "../src/TokenSwap.sol";
import {MyToken} from "../src/MyToken.sol";

contract CounterTest is Test {
    TokenSwap public tokenswap;
    MyToken public token1;
    MyToken public token2;
    address public owner1 = address(0x1);
    address public owner2 = address(0x2);
    address public contractadd;


    function setUp() public {
        vm.prank(owner1);
        token1 = new MyToken();

        vm.prank(owner2);
        token2 = new MyToken();

    
        tokenswap = new TokenSwap(address(token1), owner1, 100, address(token2), owner2, 200);

        contractadd =address(tokenswap);
    }

    function testSwap() public{
        vm.prank(owner1);
        token1.approve(contractadd, 100);

        vm.prank(owner2);
        token2.approve(contractadd, 200);

        vm.prank(owner2);
        tokenswap.swap();

        vm.prank(owner2);
       uint owner1bal = token2.balanceOf(owner1);

       assertEq(owner1bal, 200);
    }
    
    function testFailSwap() public{
        vm.prank(owner1);
        token1.approve(contractadd, 100);

        vm.prank(owner2);
        token2.approve(contractadd, 200);

        vm.prank(address(this));
        tokenswap.swap();

        vm.prank(owner2);
       uint owner1bal = token2.balanceOf(owner1);

       assertEq(owner1bal, 200);
    }

    



    
}
