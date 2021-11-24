Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B07545B139
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 02:45:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234183AbhKXBse (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 20:48:34 -0500
Received: from mga01.intel.com ([192.55.52.88]:1272 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231955AbhKXBse (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 20:48:34 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="259061090"
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; 
   d="scan'208";a="259061090"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 17:45:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; 
   d="scan'208";a="591415984"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Nov 2021 17:45:22 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mphLe-00048n-4r; Wed, 24 Nov 2021 01:45:22 +0000
Date:   Wed, 24 Nov 2021 09:45:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, Vinod Koul <vkoul@kernel.org>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: clk-alpha-pll: Don't reconfigure running Trion
Message-ID: <202111240901.R3Fzm2O3-lkp@intel.com>
References: <20211123161630.123222-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211123161630.123222-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

I love your patch! Yet something to improve:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on v5.16-rc2 next-20211123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Bjorn-Andersson/clk-qcom-clk-alpha-pll-Don-t-reconfigure-running-Trion/20211124-001628
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: riscv-randconfig-r042-20211123 (https://download.01.org/0day-ci/archive/20211124/202111240901.R3Fzm2O3-lkp@intel.com/config.gz)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 49e3838145dff1ec91c2e67a2cb562775c8d2a08)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/1c6539db17125d4d4eaf17c4071063fe8a7e2ca6
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Bjorn-Andersson/clk-qcom-clk-alpha-pll-Don-t-reconfigure-running-Trion/20211124-001628
        git checkout 1c6539db17125d4d4eaf17c4071063fe8a7e2ca6
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=riscv 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/clk/qcom/clk-alpha-pll.c:1437:3: error: implicit declaration of function 'pr_dbg' [-Werror,-Wimplicit-function-declaration]
                   pr_dbg("Trion PLL is already enabled, skipping configuration\n");
                   ^
   1 error generated.


vim +/pr_dbg +1437 drivers/clk/qcom/clk-alpha-pll.c

  1421	
  1422	/**
  1423	 * clk_lucid_pll_configure - configure the lucid pll
  1424	 *
  1425	 * @pll: clk alpha pll
  1426	 * @regmap: register map
  1427	 * @config: configuration to apply for pll
  1428	 */
  1429	void clk_trion_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
  1430				     const struct alpha_pll_config *config)
  1431	{
  1432		/*
  1433		 * If the bootloader left the PLL enabled it's likely that there are
  1434		 * RCGs that will lock up if we disable the PLL below.
  1435		 */
  1436		if (trion_pll_is_enabled(pll, regmap)) {
> 1437			pr_dbg("Trion PLL is already enabled, skipping configuration\n");
  1438			return;
  1439		}
  1440	
  1441		clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l);
  1442		regmap_write(regmap, PLL_CAL_L_VAL(pll), TRION_PLL_CAL_VAL);
  1443		clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->alpha);
  1444		clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll),
  1445					     config->config_ctl_val);
  1446		clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U(pll),
  1447					     config->config_ctl_hi_val);
  1448		clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U1(pll),
  1449					     config->config_ctl_hi1_val);
  1450		clk_alpha_pll_write_config(regmap, PLL_USER_CTL(pll),
  1451						config->user_ctl_val);
  1452		clk_alpha_pll_write_config(regmap, PLL_USER_CTL_U(pll),
  1453						config->user_ctl_hi_val);
  1454		clk_alpha_pll_write_config(regmap, PLL_USER_CTL_U1(pll),
  1455						config->user_ctl_hi1_val);
  1456		clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll),
  1457						config->test_ctl_val);
  1458		clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll),
  1459						config->test_ctl_hi_val);
  1460		clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U1(pll),
  1461						config->test_ctl_hi1_val);
  1462	
  1463		regmap_update_bits(regmap, PLL_MODE(pll), PLL_UPDATE_BYPASS,
  1464				   PLL_UPDATE_BYPASS);
  1465	
  1466		/* Disable PLL output */
  1467		regmap_update_bits(regmap, PLL_MODE(pll),  PLL_OUTCTRL, 0);
  1468	
  1469		/* Set operation mode to OFF */
  1470		regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
  1471	
  1472		/* Place the PLL in STANDBY mode */
  1473		regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
  1474	}
  1475	EXPORT_SYMBOL_GPL(clk_trion_pll_configure);
  1476	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
