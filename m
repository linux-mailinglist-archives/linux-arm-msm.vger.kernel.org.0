Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6272D46D5B4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 15:32:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235144AbhLHOfi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 09:35:38 -0500
Received: from mga03.intel.com ([134.134.136.65]:25321 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231398AbhLHOfi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 09:35:38 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="237780795"
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; 
   d="scan'208";a="237780795"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2021 06:31:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; 
   d="scan'208";a="612105379"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 08 Dec 2021 06:31:46 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1muxyz-0000fQ-Eg; Wed, 08 Dec 2021 14:31:45 +0000
Date:   Wed, 8 Dec 2021 22:31:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Vamsi Krishna Lanka <quic_vamslank@quicinc.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: qcom: Add clock driver for SM8450
Message-ID: <202112082235.Hpn8OyQQ-lkp@intel.com>
References: <20211207114003.100693-3-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211207114003.100693-3-vkoul@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vinod,

I love your patch! Yet something to improve:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on robh/for-next v5.16-rc4 next-20211208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Vinod-Koul/clk-qcom-Add-clocks-for-SM8450-SoC/20211207-194218
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: riscv-randconfig-c006-20211208 (https://download.01.org/0day-ci/archive/20211208/202112082235.Hpn8OyQQ-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1cb1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/42c0d6d58aceb3d76e99fd9738235962ab7a8e87
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Vinod-Koul/clk-qcom-Add-clocks-for-SM8450-SoC/20211207-194218
        git checkout 42c0d6d58aceb3d76e99fd9738235962ab7a8e87
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/clk/qcom/ drivers/iio/proximity/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/clk/qcom/gcc-sm8450.c:40:29: error: use of undeclared identifier 'CLK_ALPHA_PLL_TYPE_LUCID_EVO'; did you mean 'CLK_ALPHA_PLL_TYPE_LUCID'?
           .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                      CLK_ALPHA_PLL_TYPE_LUCID
   drivers/clk/qcom/clk-alpha-pll.h:17:2: note: 'CLK_ALPHA_PLL_TYPE_LUCID' declared here
           CLK_ALPHA_PLL_TYPE_LUCID = CLK_ALPHA_PLL_TYPE_TRION,
           ^
>> drivers/clk/qcom/gcc-sm8450.c:50:12: error: use of undeclared identifier 'clk_alpha_pll_fixed_lucid_evo_ops'; did you mean 'clk_alpha_pll_fixed_lucid_5lpe_ops'?
                           .ops = &clk_alpha_pll_fixed_lucid_evo_ops,
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   clk_alpha_pll_fixed_lucid_5lpe_ops
   drivers/clk/qcom/clk-alpha-pll.h:149:29: note: 'clk_alpha_pll_fixed_lucid_5lpe_ops' declared here
   extern const struct clk_ops clk_alpha_pll_fixed_lucid_5lpe_ops;
                               ^
   drivers/clk/qcom/gcc-sm8450.c:66:29: error: use of undeclared identifier 'CLK_ALPHA_PLL_TYPE_LUCID_EVO'; did you mean 'CLK_ALPHA_PLL_TYPE_LUCID'?
           .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                      CLK_ALPHA_PLL_TYPE_LUCID
   drivers/clk/qcom/clk-alpha-pll.h:17:2: note: 'CLK_ALPHA_PLL_TYPE_LUCID' declared here
           CLK_ALPHA_PLL_TYPE_LUCID = CLK_ALPHA_PLL_TYPE_TRION,
           ^
>> drivers/clk/qcom/gcc-sm8450.c:73:11: error: use of undeclared identifier 'clk_alpha_pll_postdiv_lucid_evo_ops'
                   .ops = &clk_alpha_pll_postdiv_lucid_evo_ops,
                           ^
   drivers/clk/qcom/gcc-sm8450.c:79:29: error: use of undeclared identifier 'CLK_ALPHA_PLL_TYPE_LUCID_EVO'; did you mean 'CLK_ALPHA_PLL_TYPE_LUCID'?
           .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                      CLK_ALPHA_PLL_TYPE_LUCID
   drivers/clk/qcom/clk-alpha-pll.h:17:2: note: 'CLK_ALPHA_PLL_TYPE_LUCID' declared here
           CLK_ALPHA_PLL_TYPE_LUCID = CLK_ALPHA_PLL_TYPE_TRION,
           ^
   drivers/clk/qcom/gcc-sm8450.c:89:12: error: use of undeclared identifier 'clk_alpha_pll_fixed_lucid_evo_ops'; did you mean 'clk_alpha_pll_fixed_lucid_5lpe_ops'?
                           .ops = &clk_alpha_pll_fixed_lucid_evo_ops,
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   clk_alpha_pll_fixed_lucid_5lpe_ops
   drivers/clk/qcom/clk-alpha-pll.h:149:29: note: 'clk_alpha_pll_fixed_lucid_5lpe_ops' declared here
   extern const struct clk_ops clk_alpha_pll_fixed_lucid_5lpe_ops;
                               ^
   drivers/clk/qcom/gcc-sm8450.c:96:29: error: use of undeclared identifier 'CLK_ALPHA_PLL_TYPE_LUCID_EVO'; did you mean 'CLK_ALPHA_PLL_TYPE_LUCID'?
           .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                      CLK_ALPHA_PLL_TYPE_LUCID
   drivers/clk/qcom/clk-alpha-pll.h:17:2: note: 'CLK_ALPHA_PLL_TYPE_LUCID' declared here
           CLK_ALPHA_PLL_TYPE_LUCID = CLK_ALPHA_PLL_TYPE_TRION,
           ^
   drivers/clk/qcom/gcc-sm8450.c:106:12: error: use of undeclared identifier 'clk_alpha_pll_fixed_lucid_evo_ops'; did you mean 'clk_alpha_pll_fixed_lucid_5lpe_ops'?
                           .ops = &clk_alpha_pll_fixed_lucid_evo_ops,
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   clk_alpha_pll_fixed_lucid_5lpe_ops
   drivers/clk/qcom/clk-alpha-pll.h:149:29: note: 'clk_alpha_pll_fixed_lucid_5lpe_ops' declared here
   extern const struct clk_ops clk_alpha_pll_fixed_lucid_5lpe_ops;
                               ^
   8 errors generated.


vim +40 drivers/clk/qcom/gcc-sm8450.c

    37	
    38	static struct clk_alpha_pll gcc_gpll0 = {
    39		.offset = 0x0,
  > 40		.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
    41		.clkr = {
    42			.enable_reg = 0x62018,
    43			.enable_mask = BIT(0),
    44			.hw.init = &(struct clk_init_data){
    45				.name = "gcc_gpll0",
    46				.parent_data = &(const struct clk_parent_data){
    47					.fw_name = "bi_tcxo",
    48				},
    49				.num_parents = 1,
  > 50				.ops = &clk_alpha_pll_fixed_lucid_evo_ops,
    51			},
    52		},
    53	};
    54	
    55	static const struct clk_div_table post_div_table_gcc_gpll0_out_even[] = {
    56		{ 0x1, 2 },
    57		{ }
    58	};
    59	
    60	static struct clk_alpha_pll_postdiv gcc_gpll0_out_even = {
    61		.offset = 0x0,
    62		.post_div_shift = 10,
    63		.post_div_table = post_div_table_gcc_gpll0_out_even,
    64		.num_post_div = ARRAY_SIZE(post_div_table_gcc_gpll0_out_even),
    65		.width = 4,
    66		.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
    67		.clkr.hw.init = &(struct clk_init_data){
    68			.name = "gcc_gpll0_out_even",
    69			.parent_data = &(const struct clk_parent_data){
    70				.hw = &gcc_gpll0.clkr.hw,
    71			},
    72			.num_parents = 1,
  > 73			.ops = &clk_alpha_pll_postdiv_lucid_evo_ops,
    74		},
    75	};
    76	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
