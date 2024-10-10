Return-Path: <linux-arm-msm+bounces-33779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE4E997D38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 08:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2062E285DF0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 06:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B42D1A0AEA;
	Thu, 10 Oct 2024 06:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WpyS+KIH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBFF18DF81;
	Thu, 10 Oct 2024 06:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728541919; cv=none; b=i35yZiF54O4JKFEL9YYNYY2258NHW6Pd8IskHU5H6xU954AN18zqD6qkjZehe3FOR5Aj4+3iReXt566WHfoZWPZ2kgMWohcORO7LY2/ufLWL0s7y1NI/iOYVfVfXl5L9OHULIXyEtZ6g3C2Udu985Cz0k1hjkSSvnQoZkgPigkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728541919; c=relaxed/simple;
	bh=AOXY/7XJtJw0s2SV+scdj5EAD0vNp2265poPJb6jL9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOeonlvjN8LMZ4XMIF2mfgPJuSYr0g6EKtpVm7V0SzvTr+bWk/pxNM+Jj8qHaBd/S8ObXICWbgv/Bv84JNa3m/GNaNl9hmkaArUtvkhSK4zRdJnKlw7FQfYn3uHOjV9Mhd+cSXHhgdNVxQYWYyiOYMVlSj3fEWmM+LghvEQdnrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WpyS+KIH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728541917; x=1760077917;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AOXY/7XJtJw0s2SV+scdj5EAD0vNp2265poPJb6jL9w=;
  b=WpyS+KIHktYXv481QYTJDhMTEmPX3Rh0RxDwPVBp6NvLZK9mMD1xYNHb
   vi+hwlbLkmQcmBmnv8lByXW6oc43IgN9KtGhYJZHJiTKuUXwC74q8sZ9a
   sQg4FWNO8E9ftAxT7jNaVWFqltx5uq5Wuc/4LcwfzCLoY9fwv6appMWMY
   79nNWDYtGrIQsrROnA1SG53Na50fFCebFs9MA4v+I+gwjTR/t+vNVLET+
   zjlyCngSA61NV0vNhRPgLkDKgSFj4kgobVc/1m8uIb9GWioZ2KsJ46aEl
   KIjUPng6hyuywVzSGPUjPMie8nJ8ULr8rU4YBoI4CUYMxtB1lDJWwu+vK
   A==;
X-CSE-ConnectionGUID: 2me4YTnzSD6Od4EwQjO+ZQ==
X-CSE-MsgGUID: nY6kRwlFRJayu7ry55Bm6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="53284277"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="53284277"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 23:31:56 -0700
X-CSE-ConnectionGUID: CSBrZBxxSSaRjHZRjd9Ufw==
X-CSE-MsgGUID: b11rVd95R0WakFa04NsjHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="81020464"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Oct 2024 23:31:51 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1symiC-000AHD-2s;
	Thu, 10 Oct 2024 06:31:48 +0000
Date: Thu, 10 Oct 2024 14:31:30 +0800
From: kernel test robot <lkp@intel.com>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
	catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
	richardcochran@gmail.com, geert+renesas@glider.be,
	dmitry.baryshkov@linaro.org, neil.armstrong@linaro.org,
	arnd@arndb.de, nfraprado@collabora.com, quic_anusha@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, quic_srichara@quicinc.com,
	quic_varada@quicinc.com
Subject: Re: [PATCH v7 4/6] clk: qcom: Add NSS clock Controller driver for
 IPQ9574
Message-ID: <202410101431.tjpSRNTY-lkp@intel.com>
References: <20241009074125.794997-5-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009074125.794997-5-quic_mmanikan@quicinc.com>

Hi Manikanta,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on robh/for-next arm64/for-next/core linus/master v6.12-rc2 next-20241009]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Manikanta-Mylavarapu/dt-bindings-clock-gcc-ipq9574-Add-definition-for-GPLL0_OUT_AUX/20241009-154517
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20241009074125.794997-5-quic_mmanikan%40quicinc.com
patch subject: [PATCH v7 4/6] clk: qcom: Add NSS clock Controller driver for IPQ9574
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20241010/202410101431.tjpSRNTY-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410101431.tjpSRNTY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410101431.tjpSRNTY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/qcom/nsscc-ipq9574.c:80:36: error: 'CLK_ALPHA_PLL_TYPE_NSS_HUAYRA' undeclared here (not in a function); did you mean 'CLK_ALPHA_PLL_TYPE_HUAYRA'?
      80 |         .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_NSS_HUAYRA],
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    CLK_ALPHA_PLL_TYPE_HUAYRA

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +80 drivers/clk/qcom/nsscc-ipq9574.c

    77	
    78	static struct clk_alpha_pll ubi32_pll_main = {
    79		.offset = 0x28000,
  > 80		.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_NSS_HUAYRA],
    81		.flags = SUPPORTS_DYNAMIC_UPDATE,
    82		.clkr = {
    83			.hw.init = &(const struct clk_init_data) {
    84				.name = "ubi32_pll_main",
    85				.parent_data = &(const struct clk_parent_data) {
    86					.index = DT_XO,
    87				},
    88				.num_parents = 1,
    89				.ops = &clk_alpha_pll_huayra_ops,
    90			},
    91		},
    92	};
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

