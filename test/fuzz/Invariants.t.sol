// //SPDX-License-Identifier: MIT

// pragma solidity ^0.8.18;

// import {Test} from "forge-std/Test.sol";
// import {StdInvariant} from "forge-std/StdInvariant.sol";
// import {DeployDSC} from "../../script/deployDSC.s.sol";
// import {DSCEngine} from "../../src/DSCEngine.sol";
// import {DecentralizedStableCoin} from "../../src/DecentralizedStableCoin.sol";
// import {HelperConfig} from "../../script/HelperConfig.s.sol";
// import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
// import {console} from "forge-std/console.sol";
// import {Handler} from "./Handler.t.sol";

// contract Invariants is StdInvariant, Test {
//     DeployDSC deployer;
//     DSCEngine dsce;
//     DecentralizedStableCoin dsc;
//     HelperConfig config;
//     address weth;
//     address wbtc;
//     Handler handler;

//     function setUp() external {
//         deployer = new DeployDSC();
//         (dsc, dsce, config) = deployer.run();
//         (, , weth, wbtc, ) = config.activeNetworkConfig();
//         handler = new Handler(dsce, dsc);
//         targetContract(address(handler));
//     }

//     function invariant_protocolMustHaveMoreValueThanTotalSupply() public view {
//         uint256 totalSupply = dsc.totalSupply();
//         uint256 wethDeposted = IERC20(weth).balanceOf(address(dsce));
//         uint256 wbtcDeposited = IERC20(wbtc).balanceOf(address(dsce));

//         uint256 wethValue = dsce.getUsdValue(weth, wethDeposted);
//         uint256 wbtcValue = dsce.getUsdValue(wbtc, wbtcDeposited);

//         console.log("wethValue: %s", wethValue);
//         console.log("wbtcValue: %s", wbtcValue);
//         console.log("total Supply: %s", totalSupply);
//         //console.log("timesMintIsCalled: %s", handler.timesMintIsCalled);

//         assert(wethValue + wbtcValue >= totalSupply);
//     }

//     // function invariant_gettersCantRevert() public view {
//     //     dsce.getAdditionalFeedPrecision();
//     //     dsce.getCollateralTokens();
//     //     dsce.getLiquidationBonus();
//     //     dsce.getLiquidationThreshold();
//     //     dsce.getMinHealthFactor();
//     //     dsce.getPrecision();
//     //     dsce.getDsc();
//     //     dsce.getTokenAmountFromUsd();
//     //     dsce.getCollateralTokenPriceFeed();
//     //     dsce.getCollateralBalanceOfUser();
//     //     dsce.getAccountCollateralValue();
//     // }
// }
