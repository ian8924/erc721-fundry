// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/ERC721A.sol";

contract TestMyERC721A is Test {
    ERC721A c;
    address alice = address(1);
    address bob = address(2);

    function setUp() public {
        c = new ERC721A('My token', 'MYC');
    }
    
    /* MINT TEST */
    function testMint_1() public {
        c._mint(alice , 1);
        // GAS 76277
    }
    function testMint_2() public {
        c._mint(alice , 2);
        // GAS 78207
    }

    function testMint_5() public {
        c._mint(alice , 5);
        // GAS 84019
    }

    /* TRANSFER TEST */
    function testTransfer() public {
        c._mint(alice , 1);
        vm.startPrank(alice);
        c.transferFrom(alice , bob , 0);
        // GAS 109700
    }

    /* APPROVE TEST */
    function testApprove() public {
        c._mint(alice , 1);
        vm.startPrank(alice);
        c.approve(bob , 0);
         // GAS 106798
    }
 
}
