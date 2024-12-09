Return-Path: <linux-arm-msm+bounces-40939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 442459E8A29
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 05:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35521162400
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 04:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5D0156F44;
	Mon,  9 Dec 2024 04:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bR9bceHj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB665156885;
	Mon,  9 Dec 2024 04:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717534; cv=none; b=UOhNJ4Hhh3MB2hRrKJ8B9H99fIUBTH7IzE7SJww7rV4nU7lN99niLoAjbLhkz0X3CyN4I23sT1PoEOHraUsTy7UY9zz30bhcq4ie7qhMWxcv94xbDdqCQlCC3GvTdTg7NafSIA8zojDCmtXGJqB2cqRl3sQQ4VCUae0MYOKO3OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717534; c=relaxed/simple;
	bh=jeaU5cD30qq8KgLp1vwHXVGn1Sa67LzrXjtJZtFG+ds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YF5VVCeKi8ETkSM5vRiRSYt7X9IlXUq1UV05ec3NmNa7aHWaPbbMsNw/sgW9IJoFRlROyWNc0KYc6WJcEVIUJUDyqx+jZyBp/4SYO4T0QHQvUpBafU17wZ871QydW3CgOYMs36eSA39CNegAX1/7djq8btuEZwe8I2Bvs9fyW3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bR9bceHj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717533; x=1765253533;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jeaU5cD30qq8KgLp1vwHXVGn1Sa67LzrXjtJZtFG+ds=;
  b=bR9bceHjHJu3vL4dhS2y4h5pLO2aqfoj4XwPGRJK0W/Ntjp1QSHzKMvO
   hzh5tgJFbNNlPjaRWIICreku4WLemfEGxTsD+RfXCMstaxoYk1+YglVlk
   4Gjbq2hxDhFhp5Qa7n0dwpYje0y5UsKNdat3EDB+MxNSYJHwcbEcrgAPH
   PdEQmRq7j7uvKZvw6EA/5lqCaegEpBsR5fGjjLTxiICl31njB6IkBtHYX
   Xvix0QpLG9uIa3CMe4gCriVs+FHehP6i23CHdnUHXeam90LvI9UtaWde3
   oQujdnOJ6N/SmL7FX3meuK0Dki4vtq0+yhF67MxYrx+IUaAPGtmpnt+RH
   w==;
X-CSE-ConnectionGUID: eZgVmHWTSeeFHdXzNL7bsg==
X-CSE-MsgGUID: jSpzenr6T8+qq/XXZJio/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33891403"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33891403"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:12:13 -0800
X-CSE-ConnectionGUID: 15WYhjCEQKy/SNHF2n3+uA==
X-CSE-MsgGUID: VqFIhV3CSNK1s0SWk9lplw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99004598"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Dec 2024 20:12:08 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKV7t-0003oD-1u;
	Mon, 09 Dec 2024 04:12:05 +0000
Date: Mon, 9 Dec 2024 12:11:39 +0800
From: kernel test robot <lkp@intel.com>
To: Taniya Das <quic_tdas@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Taniya Das <quic_tdas@quicinc.com>
Subject: Re: [PATCH 3/3] clk: qcom: videocc-sm8750: Add video clock
 controller driver for SM8750
Message-ID: <202412071654.X0lSg9EN-lkp@intel.com>
References: <20241206-sm8750_videocc-v1-3-5da6e7eea2bd@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206-sm8750_videocc-v1-3-5da6e7eea2bd@quicinc.com>

Hi Taniya,

kernel test robot noticed the following build errors:

[auto build test ERROR on af2ea8ab7a546b430726183458da0a173d331272]

url:    https://github.com/intel-lab-lkp/linux/commits/Taniya-Das/clk-qcom-branch-Extend-invert-logic-for-branch2-mem-clocks/20241207-015655
base:   af2ea8ab7a546b430726183458da0a173d331272
patch link:    https://lore.kernel.org/r/20241206-sm8750_videocc-v1-3-5da6e7eea2bd%40quicinc.com
patch subject: [PATCH 3/3] clk: qcom: videocc-sm8750: Add video clock controller driver for SM8750
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241207/202412071654.X0lSg9EN-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412071654.X0lSg9EN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412071654.X0lSg9EN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/clk/qcom/videocc-sm8750.c:8:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/videocc-sm8750.c:56:29: error: use of undeclared identifier 'CLK_ALPHA_PLL_TYPE_TAYCAN_ELU'; did you mean 'CLK_ALPHA_PLL_TYPE_RIVIAN_EVO'?
      56 |         .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_ELU],
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    CLK_ALPHA_PLL_TYPE_RIVIAN_EVO
   drivers/clk/qcom/clk-alpha-pll.h:30:2: note: 'CLK_ALPHA_PLL_TYPE_RIVIAN_EVO' declared here
      30 |         CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
         |         ^
>> drivers/clk/qcom/videocc-sm8750.c:64:12: error: use of undeclared identifier 'clk_alpha_pll_taycan_elu_ops'; did you mean 'clk_alpha_pll_rivian_evo_ops'?
      64 |                         .ops = &clk_alpha_pll_taycan_elu_ops,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                 clk_alpha_pll_rivian_evo_ops
   drivers/clk/qcom/clk-alpha-pll.h:195:29: note: 'clk_alpha_pll_rivian_evo_ops' declared here
     195 | extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
         |                             ^
>> drivers/clk/qcom/videocc-sm8750.c:426:2: error: call to undeclared function 'clk_taycan_elu_pll_configure'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     426 |         clk_taycan_elu_pll_configure(&video_cc_pll0, regmap, &video_cc_pll0_config);
         |         ^
   drivers/clk/qcom/videocc-sm8750.c:426:2: note: did you mean 'clk_rivian_evo_pll_configure'?
   drivers/clk/qcom/clk-alpha-pll.h:221:6: note: 'clk_rivian_evo_pll_configure' declared here
     221 | void clk_rivian_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
         |      ^
   4 warnings and 3 errors generated.


vim +56 drivers/clk/qcom/videocc-sm8750.c

    51	
    52	static struct clk_alpha_pll video_cc_pll0 = {
    53		.offset = 0x0,
    54		.vco_table = taycan_elu_vco,
    55		.num_vco = ARRAY_SIZE(taycan_elu_vco),
  > 56		.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_ELU],
    57		.clkr = {
    58			.hw.init = &(const struct clk_init_data) {
    59				.name = "video_cc_pll0",
    60				.parent_data = &(const struct clk_parent_data) {
    61					.index = DT_BI_TCXO,
    62				},
    63				.num_parents = 1,
  > 64				.ops = &clk_alpha_pll_taycan_elu_ops,
    65			},
    66		},
    67	};
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

