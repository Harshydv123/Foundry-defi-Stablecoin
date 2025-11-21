//SPDX-License.Identifier:MIT
pragma solidity ^0.8.19;
import {Test} from "forge-std/Test.sol";
import { DeployDSC } from "../../script/DeployDSC.s.sol";
import { DSCEngine } from "../../src/DSCEngine.sol";
import { DecentralizedStableCoin } from "../../src/DecentralizedStableCoin.sol";
import { HelperConfig } from "../../script/HelperConfig.s.sol";

contract DSCEngineTest is Test{
    DSCEngine public dsce;
    DecentralizedStableCoin public dsc;
    HelperConfig public helperConfig;

    address public ethUsdPriceFeed;
    address public btcUsdPriceFeed;
    address public weth;
    address public wbtc;
    uint256 public deployerKey;

    function setUp() external {
        DeployDSC deployer=new DeployDSC();
        (dsc, dsce, helperConfig) = deployer.run();
        (ethUsdPriceFeed, btcUsdPriceFeed, weth, wbtc, deployerKey) = helperConfig.activeNetworkConfig();
    }

    //////////////////
    // Price Tests //
    //////////////////
    function testgetusdvalue() public {
        uint256 eth=10e18;
        uint256 expectedamount=20000e18;
        uint256 actualamount=dsce.getUsdValue(weth,eth);
        assertEq(expectedamount,actualamount);

    }
}