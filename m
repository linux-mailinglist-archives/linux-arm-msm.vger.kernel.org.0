Return-Path: <linux-arm-msm+bounces-40940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9319E8A2F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 05:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FBDB280CDE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 04:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A38156F44;
	Mon,  9 Dec 2024 04:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HyB5l5Sq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0923C156872;
	Mon,  9 Dec 2024 04:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717653; cv=none; b=I2dONf3WSseKTRWTphTl/PFnbzbcCuHgoxB7iXYisuFfSvKFKIkTFA8LjLlu/X2BnzjUsqP4Cq5WxTtJFo6RCPruaY7orRRGw39ceIwxyas4B+h8h1WWDpRFRiKmql+L/BoFveIvYtvvPx7esRB79rDFT80BIIo2fGmqDZ088dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717653; c=relaxed/simple;
	bh=JIcsHLVaQXDNxXHbfmPvkui92K3mZSu6YIA1YrNXmFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KcxOwLWhOtx4diSF85YcOpmu1KvLAEeVQhyIjYRjZbxAji37iyWXdAgcuc/F8LesC3sVrv0RcXbdvMQB9b/MEqrWyKw8g11j+dw1LUbYSkASopW3xzhNFy4QvhaAmZrZfEQcS4uH6FBMtyHUlPm2s33/wy4wAVH6e026vlesxKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HyB5l5Sq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717652; x=1765253652;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JIcsHLVaQXDNxXHbfmPvkui92K3mZSu6YIA1YrNXmFA=;
  b=HyB5l5SqE8A+hNc3RBraPbg8DtI4LI3m75KUB1U1JIUjiPToCEIEQrMX
   B3L1aDy2fJODOFMdC1l3SoXNIQ7iIJHbCVbmDSdlmUp0wGtYz3HLsLYCB
   lpKZd3Wy5sJrzsufkKxLfdND6G6HIT37/5a2UfusUE1KoPf40evnJa3H1
   e6sBiTufNKXxtm+Z3ihe+sTpjHtBJn4mNz91AYGdduIXaGDJQOaMdEbd0
   2FHrAwWrjhwhv/5+xsPi/jZ+FEkcsP2kXHG2wztVV1tVxLtEmXofN2MRI
   Fc8zXPh5BGfPgpXGEsKg8Q9Epaq6grQvCJEOzHEB8ky7e02i7eZP7IE7t
   A==;
X-CSE-ConnectionGUID: qliOTb5GRuaecjLOVPQA0Q==
X-CSE-MsgGUID: jEaBHM19SZ62UxpMkaeI1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34122105"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34122105"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:14:12 -0800
X-CSE-ConnectionGUID: QA2esDbzSnSewFNXow8KMA==
X-CSE-MsgGUID: 9puMgUeyQQ+s7vZz2YJDAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99401323"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Dec 2024 20:14:08 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKV9p-0003ob-33;
	Mon, 09 Dec 2024 04:14:05 +0000
Date: Mon, 9 Dec 2024 12:13:16 +0800
From: kernel test robot <lkp@intel.com>
To: Taniya Das <quic_tdas@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Taniya Das <quic_tdas@quicinc.com>
Subject: Re: [PATCH 3/3] clk: qcom: videocc-sm8750: Add video clock
 controller driver for SM8750
Message-ID: <202412071610.5vUMFjRk-lkp@intel.com>
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
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241207/202412071610.5vUMFjRk-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412071610.5vUMFjRk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412071610.5vUMFjRk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/qcom/videocc-sm8750.c:56:36: error: 'CLK_ALPHA_PLL_TYPE_TAYCAN_ELU' undeclared here (not in a function); did you mean 'CLK_ALPHA_PLL_TYPE_RIVIAN_EVO'?
      56 |         .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_ELU],
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    CLK_ALPHA_PLL_TYPE_RIVIAN_EVO
>> drivers/clk/qcom/videocc-sm8750.c:64:33: error: 'clk_alpha_pll_taycan_elu_ops' undeclared here (not in a function); did you mean 'clk_alpha_pll_rivian_evo_ops'?
      64 |                         .ops = &clk_alpha_pll_taycan_elu_ops,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                 clk_alpha_pll_rivian_evo_ops
   drivers/clk/qcom/videocc-sm8750.c: In function 'video_cc_sm8750_probe':
>> drivers/clk/qcom/videocc-sm8750.c:426:9: error: implicit declaration of function 'clk_taycan_elu_pll_configure'; did you mean 'clk_rivian_evo_pll_configure'? [-Wimplicit-function-declaration]
     426 |         clk_taycan_elu_pll_configure(&video_cc_pll0, regmap, &video_cc_pll0_config);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         clk_rivian_evo_pll_configure


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

