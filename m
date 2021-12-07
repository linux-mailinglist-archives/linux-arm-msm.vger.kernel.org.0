Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA1F46B71E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Dec 2021 10:32:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233660AbhLGJgC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Dec 2021 04:36:02 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:55522 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233687AbhLGJgB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Dec 2021 04:36:01 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B15A0B80E45;
        Tue,  7 Dec 2021 09:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1970C341C1;
        Tue,  7 Dec 2021 09:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638869549;
        bh=V9cW8oqGAP8cNC7KbPVmeqamo6guvMW4YwPO084eXDA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hPxSmmvQzHpNxZ9VYN7klueDcqgzodJYZSyi4t+vdLQl1cyZXIZLuaYKMXnHbh3E8
         IafOyxew1i4uIDJWXzIaRVSq+qSoElMdbBTAvra+GaKd6y+gSNmRdXDWFqHOvrBiet
         GSvzjswNgYaPrHlqG9K42oCxPrpR2jzT65fyXLDLfwncR0DnB+cAVTExQxFNTZvdPE
         WVBrjci3AxuOenNc6hnq0g16xQmvD24zJCH2g9dLkgsFneXHryQapC7sfOeiViclls
         NxRjef2ve5wy9tpxmh8bMjjpXglq9jLCk2zgIlr4wzZIlCVgCiclK64A3NLDMrjU/s
         198GBfZtFdeZw==
Date:   Tue, 7 Dec 2021 15:02:25 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     kernel test robot <lkp@intel.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        kbuild-all@lists.01.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Vamsi Krishna Lanka <quic_vamslank@quicinc.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: Add clock driver for SM8450
Message-ID: <Ya8qKafMHQVgB3gc@matsya>
References: <20211201072310.3968679-4-vkoul@kernel.org>
 <202112020334.Hw8YGuXD-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202112020334.Hw8YGuXD-lkp@intel.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02-12-21, 03:40, kernel test robot wrote:
> Hi Vinod,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on clk/clk-next]
> [also build test ERROR on robh/for-next v5.16-rc3 next-20211201]
> [cannot apply to agross-msm/qcom/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Vinod-Koul/clk-qcom-Add-clocks-for-SM8450-SoC/20211201-152534
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20211202/202112020334.Hw8YGuXD-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 11.2.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/e1e0cc0fd39b5e08530730ff2e973252bba25fc0
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Vinod-Koul/clk-qcom-Add-clocks-for-SM8450-SoC/20211201-152534
>         git checkout e1e0cc0fd39b5e08530730ff2e973252bba25fc0
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=alpha SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/clk/qcom/gcc-sm8450.c:40:36: error: 'CLK_ALPHA_PLL_TYPE_LUCID_EVO' undeclared here (not in a function); did you mean 'CLK_ALPHA_PLL_TYPE_LUCID'?
>       40 |         .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
>          |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          |                                    CLK_ALPHA_PLL_TYPE_LUCID

This is due to dependency on the lucid evo patchset from Vamsi as
mentioned in the cover letter. So we can ignore this.

> >> drivers/clk/qcom/gcc-sm8450.c:51:33: error: 'clk_alpha_pll_fixed_lucid_evo_ops' undeclared here (not in a function); did you mean 'clk_alpha_pll_fixed_lucid_5lpe_ops'?
>       51 |                         .ops = &clk_alpha_pll_fixed_lucid_evo_ops,
>          |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          |                                 clk_alpha_pll_fixed_lucid_5lpe_ops
> >> drivers/clk/qcom/gcc-sm8450.c:74:25: error: 'clk_alpha_pll_postdiv_lucid_evo_ops' undeclared here (not in a function); did you mean 'clk_alpha_pll_postdiv_lucid_5lpe_ops'?
>       74 |                 .ops = &clk_alpha_pll_postdiv_lucid_evo_ops,
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          |                         clk_alpha_pll_postdiv_lucid_5lpe_ops
> 
> 
> vim +40 drivers/clk/qcom/gcc-sm8450.c
> 
>     37	
>     38	static struct clk_alpha_pll gcc_gpll0 = {
>     39		.offset = 0x0,
>   > 40		.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
>     41		.clkr = {
>     42			.enable_reg = 0x62018,
>     43			.enable_mask = BIT(0),
>     44			.hw.init = &(struct clk_init_data){
>     45				.name = "gcc_gpll0",
>     46				.parent_data = &(const struct clk_parent_data){
>     47					.fw_name = "bi_tcxo",
>     48					.name = "bi_tcxo",
>     49				},
>     50				.num_parents = 1,
>   > 51				.ops = &clk_alpha_pll_fixed_lucid_evo_ops,
>     52			},
>     53		},
>     54	};
>     55	
>     56	static const struct clk_div_table post_div_table_gcc_gpll0_out_even[] = {
>     57		{ 0x1, 2 },
>     58		{ }
>     59	};
>     60	
>     61	static struct clk_alpha_pll_postdiv gcc_gpll0_out_even = {
>     62		.offset = 0x0,
>     63		.post_div_shift = 10,
>     64		.post_div_table = post_div_table_gcc_gpll0_out_even,
>     65		.num_post_div = ARRAY_SIZE(post_div_table_gcc_gpll0_out_even),
>     66		.width = 4,
>     67		.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
>     68		.clkr.hw.init = &(struct clk_init_data){
>     69			.name = "gcc_gpll0_out_even",
>     70			.parent_data = &(const struct clk_parent_data){
>     71				.hw = &gcc_gpll0.clkr.hw,
>     72			},
>     73			.num_parents = 1,
>   > 74			.ops = &clk_alpha_pll_postdiv_lucid_evo_ops,
>     75		},
>     76	};
>     77	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

-- 
~Vinod
