// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract TestMyERC721 is Test {
    ERC721 c;
    address alice = address(1);
    address bob = address(2);

    function setUp() public {
        c = new ERC721('My token', 'MYC');
    }

    /* MINT TEST */
    function testMint_1() public {
        c._mint(alice , 1);
        // GAS 54570
    }

    function testMint_2() public {
        c._mint(alice , 1);
        c._mint(alice , 2);
        // GAS 80498
    }

    function testMint_5() public {
        c._mint(alice , 1);
        c._mint(alice , 2);
        c._mint(alice , 3);
        c._mint(alice , 4);
        c._mint(alice , 5);
        // GAS 158304
    }
 
    /* TRANSFER TEST */
    function testTransfer() public {
        c._mint(alice , 1);
        vm.startPrank(alice);
        c.transferFrom(alice , bob , 1);
         // GAS 68809
    }
    

    /* APPROVE TEST */
    function testApprove() public {
        c._mint(alice , 1);
        vm.startPrank(alice);
        c.approve(bob , 1);
         // GAS 85282
    }
}
