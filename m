Return-Path: <linux-arm-msm+bounces-75390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B57BA6024
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 16:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C69E4C1018
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 14:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1CE91EB1AA;
	Sat, 27 Sep 2025 14:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H2IsAtIZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7581625;
	Sat, 27 Sep 2025 14:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758981739; cv=none; b=XNcyO6ip6e5ypxFmPV+DdPcnXR392SpL9CsnWxXk1vj0XjrGv+dLSVpqmlUcAQbRROo8VvadxADss2o4P+BatHGyNJEOLFpr7zDTdUGG9UmeA/KzCYgUVu/CbOnfLb0Z5/V0a9k1pTEml+bSdFxRm/MlGawNTPvQEBZDRA27DYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758981739; c=relaxed/simple;
	bh=e5U1xGvNbO0HvWgSJ7VB6F+ifO4uCe/kW5E1C56z3gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKseVdQHJ6Pf/OKzO0iGjv4tOE6CgUHifH8ADwcaBBfd7VlpWjqHUSsx9yQZ2Z+sWUOhUdD1n1VqlfckxafilmoKl6wAoqPKMTcxCCkviJgGLrh+b37f6ygmxHjOOnbpasxF0hu9/UjKvtYEqn1+4Ol7eEwx3AP6nCimQ327QFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H2IsAtIZ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758981737; x=1790517737;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e5U1xGvNbO0HvWgSJ7VB6F+ifO4uCe/kW5E1C56z3gQ=;
  b=H2IsAtIZcMXBy8zFjONi1PrH8Q0ICvdkT6OBBawTpeE7Nd9bJwS7Eh5t
   v+R0L+Ft3ZWQD0zr+q8s2jef5w7mh/N12vEY6yyrF4ewiyX9qeRdXf1SQ
   vF7Q8fG+Ly/ebsYBM8zjeWas75Ln5rKVqVKPiojypYt0ZblsICYHljnSv
   BiuSEvASodLe+g51LkSIoafrJQM2XbPyRX1Yf1vfA5V+PVBHb9RcAW2Y8
   hLpZtPux0lUlIZ9Gl3GZNQUQDt8TMf9p0A1TXcCqFentWYNK2wzkm8+Go
   jOGkOX7kZa3pOVz9+E3tGDVSJeXDyT5y11P8adBtsW08C0H8q0XWnSWxI
   Q==;
X-CSE-ConnectionGUID: /QaYB+s2R2q0CjJSXCdbBA==
X-CSE-MsgGUID: EaZO7u3kTZu+IydnDWEuqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61248285"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61248285"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 07:02:16 -0700
X-CSE-ConnectionGUID: O0GBdTMRRS+5glIrGQfm1w==
X-CSE-MsgGUID: bttIIo7YSsCxJMgxWtaEdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="177774235"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 27 Sep 2025 07:02:12 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2VV3-00076B-2b;
	Sat, 27 Sep 2025 14:02:09 +0000
Date: Sat, 27 Sep 2025 22:01:45 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: gcc-x1e80100: Add missing USB4
 clocks/resets
Message-ID: <202509272140.wYFpHZfD-lkp@intel.com>
References: <20250926-topic-hamoa_gcc_usb4-v1-2-25cad1700829@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926-topic-hamoa_gcc_usb4-v1-2-25cad1700829@oss.qualcomm.com>

Hi Konrad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8e2755d7779a95dd61d8997ebce33ff8b1efd3fb]

url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/dt-bindings-clock-qcom-x1e80100-gcc-Add-missing-USB4-clocks-resets/20250926-200520
base:   8e2755d7779a95dd61d8997ebce33ff8b1efd3fb
patch link:    https://lore.kernel.org/r/20250926-topic-hamoa_gcc_usb4-v1-2-25cad1700829%40oss.qualcomm.com
patch subject: [PATCH 2/3] clk: qcom: gcc-x1e80100: Add missing USB4 clocks/resets
config: riscv-randconfig-002-20250927 (https://download.01.org/0day-ci/archive/20250927/202509272140.wYFpHZfD-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509272140.wYFpHZfD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509272140.wYFpHZfD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/qcom/gcc-x1e80100.c:580:32: warning: 'gcc_parent_map_33' defined but not used [-Wunused-const-variable=]
     580 | static const struct parent_map gcc_parent_map_33[] = {
         |                                ^~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-x1e80100.c:570:32: warning: 'gcc_parent_map_32' defined but not used [-Wunused-const-variable=]
     570 | static const struct parent_map gcc_parent_map_32[] = {
         |                                ^~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-x1e80100.c:560:32: warning: 'gcc_parent_map_31' defined but not used [-Wunused-const-variable=]
     560 | static const struct parent_map gcc_parent_map_31[] = {
         |                                ^~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-x1e80100.c:550:32: warning: 'gcc_parent_map_30' defined but not used [-Wunused-const-variable=]
     550 | static const struct parent_map gcc_parent_map_30[] = {
         |                                ^~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-x1e80100.c:540:32: warning: 'gcc_parent_map_29' defined but not used [-Wunused-const-variable=]
     540 | static const struct parent_map gcc_parent_map_29[] = {
         |                                ^~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-x1e80100.c:530:32: warning: 'gcc_parent_map_28' defined but not used [-Wunused-const-variable=]
     530 | static const struct parent_map gcc_parent_map_28[] = {
         |                                ^~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-x1e80100.c:520:32: warning: 'gcc_parent_map_27' defined but not used [-Wunused-const-variable=]
     520 | static const struct parent_map gcc_parent_map_27[] = {
         |                                ^~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-x1e80100.c:510:32: warning: 'gcc_parent_map_26' defined but not used [-Wunused-const-variable=]
     510 | static const struct parent_map gcc_parent_map_26[] = {
         |                                ^~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-x1e80100.c:500:32: warning: 'gcc_parent_map_25' defined but not used [-Wunused-const-variable=]
     500 | static const struct parent_map gcc_parent_map_25[] = {
         |                                ^~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-x1e80100.c:490:32: warning: 'gcc_parent_map_24' defined but not used [-Wunused-const-variable=]
     490 | static const struct parent_map gcc_parent_map_24[] = {
         |                                ^~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-x1e80100.c:480:32: warning: 'gcc_parent_map_23' defined but not used [-Wunused-const-variable=]
     480 | static const struct parent_map gcc_parent_map_23[] = {
         |                                ^~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-x1e80100.c:470:32: warning: 'gcc_parent_map_22' defined but not used [-Wunused-const-variable=]
     470 | static const struct parent_map gcc_parent_map_22[] = {
         |                                ^~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-x1e80100.c:460:32: warning: 'gcc_parent_map_21' defined but not used [-Wunused-const-variable=]
     460 | static const struct parent_map gcc_parent_map_21[] = {
         |                                ^~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-x1e80100.c:450:32: warning: 'gcc_parent_map_20' defined but not used [-Wunused-const-variable=]
     450 | static const struct parent_map gcc_parent_map_20[] = {
         |                                ^~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-x1e80100.c:440:32: warning: 'gcc_parent_map_19' defined but not used [-Wunused-const-variable=]
     440 | static const struct parent_map gcc_parent_map_19[] = {
         |                                ^~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-x1e80100.c:430:32: warning: 'gcc_parent_map_18' defined but not used [-Wunused-const-variable=]
     430 | static const struct parent_map gcc_parent_map_18[] = {
         |                                ^~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-x1e80100.c:420:32: warning: 'gcc_parent_map_17' defined but not used [-Wunused-const-variable=]
     420 | static const struct parent_map gcc_parent_map_17[] = {
         |                                ^~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-x1e80100.c:410:32: warning: 'gcc_parent_map_16' defined but not used [-Wunused-const-variable=]
     410 | static const struct parent_map gcc_parent_map_16[] = {
         |                                ^~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-x1e80100.c:400:32: warning: 'gcc_parent_map_15' defined but not used [-Wunused-const-variable=]
     400 | static const struct parent_map gcc_parent_map_15[] = {
         |                                ^~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-x1e80100.c:390:32: warning: 'gcc_parent_map_14' defined but not used [-Wunused-const-variable=]
     390 | static const struct parent_map gcc_parent_map_14[] = {
         |                                ^~~~~~~~~~~~~~~~~
   drivers/clk/qcom/gcc-x1e80100.c:380:32: warning: 'gcc_parent_map_13' defined but not used [-Wunused-const-variable=]
     380 | static const struct parent_map gcc_parent_map_13[] = {
         |                                ^~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_ELF_CORE_EFLAGS
   Depends on [n]: BINFMT_ELF [=n] && ELF_CORE [=y]
   Selected by [y]:
   - RISCV [=y]


vim +/gcc_parent_map_33 +580 drivers/clk/qcom/gcc-x1e80100.c

   389	
 > 390	static const struct parent_map gcc_parent_map_14[] = {
   391		{ P_GCC_USB4_0_PHY_DP1_GMUX_CLK_SRC, 0 },
   392		{ P_USB4_0_PHY_GCC_USB4RTR_MAX_PIPE_CLK, 2 },
   393	};
   394	
   395	static const struct clk_parent_data gcc_parent_data_14[] = {
   396		{ .index = DT_GCC_USB4_0_PHY_DP1_GMUX_CLK_SRC },
   397		{ .index = DT_USB4_0_PHY_GCC_USB4RTR_MAX_PIPE_CLK },
   398	};
   399	
 > 400	static const struct parent_map gcc_parent_map_15[] = {
   401		{ P_USB4_0_PHY_GCC_USB4_PCIE_PIPE_CLK, 0 },
   402		{ P_BI_TCXO, 2 },
   403	};
   404	
   405	static const struct clk_parent_data gcc_parent_data_15[] = {
   406		{ .index = DT_USB4_0_PHY_GCC_USB4_PCIE_PIPE_CLK },
   407		{ .index = DT_BI_TCXO },
   408	};
   409	
 > 410	static const struct parent_map gcc_parent_map_16[] = {
   411		{ P_GCC_USB4_0_PHY_PCIE_PIPEGMUX_CLK_SRC, 0 },
   412		{ P_USB4_0_PHY_GCC_USB4_PCIE_PIPE_CLK, 1 },
   413	};
   414	
   415	static const struct clk_parent_data gcc_parent_data_16[] = {
   416		{ .index = DT_GCC_USB4_0_PHY_PCIE_PIPEGMUX_CLK_SRC },
   417		{ .index = DT_USB4_0_PHY_GCC_USB4_PCIE_PIPE_CLK },
   418	};
   419	
 > 420	static const struct parent_map gcc_parent_map_17[] = {
   421		{ P_QUSB4PHY_0_GCC_USB4_RX0_CLK, 0 },
   422		{ P_BI_TCXO, 2 },
   423	};
   424	
   425	static const struct clk_parent_data gcc_parent_data_17[] = {
   426		{ .index = DT_QUSB4PHY_0_GCC_USB4_RX0_CLK },
   427		{ .index = DT_BI_TCXO },
   428	};
   429	
 > 430	static const struct parent_map gcc_parent_map_18[] = {
   431		{ P_QUSB4PHY_0_GCC_USB4_RX1_CLK, 0 },
   432		{ P_BI_TCXO, 2 },
   433	};
   434	
   435	static const struct clk_parent_data gcc_parent_data_18[] = {
   436		{ .index = DT_QUSB4PHY_0_GCC_USB4_RX1_CLK },
   437		{ .index = DT_BI_TCXO },
   438	};
   439	
 > 440	static const struct parent_map gcc_parent_map_19[] = {
   441		{ P_GCC_USB4_0_PHY_SYS_PIPEGMUX_CLK_SRC, 0 },
   442		{ P_USB4_0_PHY_GCC_USB4_PCIE_PIPE_CLK, 2 },
   443	};
   444	
   445	static const struct clk_parent_data gcc_parent_data_19[] = {
   446		{ .index = DT_GCC_USB4_0_PHY_SYS_PIPEGMUX_CLK_SRC },
   447		{ .index = DT_USB4_0_PHY_GCC_USB4_PCIE_PIPE_CLK },
   448	};
   449	
 > 450	static const struct parent_map gcc_parent_map_20[] = {
   451		{ P_GCC_USB4_1_PHY_DP0_GMUX_CLK_SRC, 0 },
   452		{ P_USB4_1_PHY_GCC_USB4RTR_MAX_PIPE_CLK, 2 },
   453	};
   454	
   455	static const struct clk_parent_data gcc_parent_data_20[] = {
   456		{ .index = DT_GCC_USB4_1_PHY_DP0_GMUX_CLK_SRC },
   457		{ .index = DT_USB4_1_PHY_GCC_USB4RTR_MAX_PIPE_CLK },
   458	};
   459	
 > 460	static const struct parent_map gcc_parent_map_21[] = {
   461		{ P_GCC_USB4_1_PHY_DP1_GMUX_CLK_SRC, 0 },
   462		{ P_USB4_1_PHY_GCC_USB4RTR_MAX_PIPE_CLK, 2 },
   463	};
   464	
   465	static const struct clk_parent_data gcc_parent_data_21[] = {
   466		{ .index = DT_GCC_USB4_1_PHY_DP1_GMUX_CLK_SRC },
   467		{ .index = DT_USB4_1_PHY_GCC_USB4RTR_MAX_PIPE_CLK },
   468	};
   469	
 > 470	static const struct parent_map gcc_parent_map_22[] = {
   471		{ P_USB4_1_PHY_GCC_USB4_PCIE_PIPE_CLK, 0 },
   472		{ P_BI_TCXO, 2 },
   473	};
   474	
   475	static const struct clk_parent_data gcc_parent_data_22[] = {
   476		{ .index = DT_USB4_1_PHY_GCC_USB4_PCIE_PIPE_CLK },
   477		{ .index = DT_BI_TCXO },
   478	};
   479	
 > 480	static const struct parent_map gcc_parent_map_23[] = {
   481		{ P_GCC_USB4_1_PHY_PCIE_PIPEGMUX_CLK_SRC, 0 },
   482		{ P_USB4_1_PHY_GCC_USB4_PCIE_PIPE_CLK, 1 },
   483	};
   484	
   485	static const struct clk_parent_data gcc_parent_data_23[] = {
   486		{ .index = DT_GCC_USB4_1_PHY_PCIE_PIPEGMUX_CLK_SRC },
   487		{ .index = DT_USB4_1_PHY_GCC_USB4_PCIE_PIPE_CLK },
   488	};
   489	
 > 490	static const struct parent_map gcc_parent_map_24[] = {
   491		{ P_QUSB4PHY_1_GCC_USB4_RX0_CLK, 0 },
   492		{ P_BI_TCXO, 2 },
   493	};
   494	
   495	static const struct clk_parent_data gcc_parent_data_24[] = {
   496		{ .index = DT_QUSB4PHY_1_GCC_USB4_RX0_CLK },
   497		{ .index = DT_BI_TCXO },
   498	};
   499	
 > 500	static const struct parent_map gcc_parent_map_25[] = {
   501		{ P_QUSB4PHY_1_GCC_USB4_RX1_CLK, 0 },
   502		{ P_BI_TCXO, 2 },
   503	};
   504	
   505	static const struct clk_parent_data gcc_parent_data_25[] = {
   506		{ .index = DT_QUSB4PHY_1_GCC_USB4_RX1_CLK },
   507		{ .index = DT_BI_TCXO },
   508	};
   509	
 > 510	static const struct parent_map gcc_parent_map_26[] = {
   511		{ P_GCC_USB4_1_PHY_SYS_PIPEGMUX_CLK_SRC, 0 },
   512		{ P_USB4_1_PHY_GCC_USB4_PCIE_PIPE_CLK, 2 },
   513	};
   514	
   515	static const struct clk_parent_data gcc_parent_data_26[] = {
   516		{ .index = DT_GCC_USB4_1_PHY_SYS_PIPEGMUX_CLK_SRC },
   517		{ .index = DT_USB4_1_PHY_GCC_USB4_PCIE_PIPE_CLK },
   518	};
   519	
 > 520	static const struct parent_map gcc_parent_map_27[] = {
   521		{ P_GCC_USB4_2_PHY_DP0_GMUX_CLK_SRC, 0 },
   522		{ P_USB4_2_PHY_GCC_USB4RTR_MAX_PIPE_CLK, 2 },
   523	};
   524	
   525	static const struct clk_parent_data gcc_parent_data_27[] = {
   526		{ .index = DT_GCC_USB4_2_PHY_DP0_GMUX_CLK_SRC },
   527		{ .index = DT_USB4_2_PHY_GCC_USB4RTR_MAX_PIPE_CLK },
   528	};
   529	
 > 530	static const struct parent_map gcc_parent_map_28[] = {
   531		{ P_GCC_USB4_2_PHY_DP1_GMUX_CLK_SRC, 0 },
   532		{ P_USB4_2_PHY_GCC_USB4RTR_MAX_PIPE_CLK, 2 },
   533	};
   534	
   535	static const struct clk_parent_data gcc_parent_data_28[] = {
   536		{ .index = DT_GCC_USB4_2_PHY_DP1_GMUX_CLK_SRC },
   537		{ .index = DT_USB4_2_PHY_GCC_USB4RTR_MAX_PIPE_CLK },
   538	};
   539	
 > 540	static const struct parent_map gcc_parent_map_29[] = {
   541		{ P_USB4_2_PHY_GCC_USB4_PCIE_PIPE_CLK, 0 },
   542		{ P_BI_TCXO, 2 },
   543	};
   544	
   545	static const struct clk_parent_data gcc_parent_data_29[] = {
   546		{ .index = DT_USB4_2_PHY_GCC_USB4_PCIE_PIPE_CLK },
   547		{ .index = DT_BI_TCXO },
   548	};
   549	
 > 550	static const struct parent_map gcc_parent_map_30[] = {
   551		{ P_GCC_USB4_2_PHY_PCIE_PIPEGMUX_CLK_SRC, 0 },
   552		{ P_USB4_2_PHY_GCC_USB4_PCIE_PIPE_CLK, 1 },
   553	};
   554	
   555	static const struct clk_parent_data gcc_parent_data_30[] = {
   556		{ .index = DT_GCC_USB4_2_PHY_PCIE_PIPEGMUX_CLK_SRC },
   557		{ .index = DT_USB4_2_PHY_GCC_USB4_PCIE_PIPE_CLK },
   558	};
   559	
 > 560	static const struct parent_map gcc_parent_map_31[] = {
   561		{ P_QUSB4PHY_2_GCC_USB4_RX0_CLK, 0 },
   562		{ P_BI_TCXO, 2 },
   563	};
   564	
   565	static const struct clk_parent_data gcc_parent_data_31[] = {
   566		{ .index = DT_QUSB4PHY_2_GCC_USB4_RX0_CLK },
   567		{ .index = DT_BI_TCXO },
   568	};
   569	
 > 570	static const struct parent_map gcc_parent_map_32[] = {
   571		{ P_QUSB4PHY_2_GCC_USB4_RX1_CLK, 0 },
   572		{ P_BI_TCXO, 2 },
   573	};
   574	
   575	static const struct clk_parent_data gcc_parent_data_32[] = {
   576		{ .index = DT_QUSB4PHY_2_GCC_USB4_RX1_CLK },
   577		{ .index = DT_BI_TCXO },
   578	};
   579	
 > 580	static const struct parent_map gcc_parent_map_33[] = {
   581		{ P_GCC_USB4_2_PHY_SYS_PIPEGMUX_CLK_SRC, 0 },
   582		{ P_USB4_2_PHY_GCC_USB4_PCIE_PIPE_CLK, 2 },
   583	};
   584	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

