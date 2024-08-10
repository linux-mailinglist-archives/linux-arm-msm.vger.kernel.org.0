Return-Path: <linux-arm-msm+bounces-28266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C83F594DF42
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Aug 2024 01:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 476991F21B1B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Aug 2024 23:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B3C11442ED;
	Sat, 10 Aug 2024 23:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IiTDnyS1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4225413D889;
	Sat, 10 Aug 2024 23:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723334054; cv=none; b=GNVee2FO8ds+7zmBkYVojRo9ydBWXBB+94M85QN4zshGlk7lzpWuHi3J4cM9/TKFaZTB4pznUY0DU+p9X0wThmt86w95uzahJ9C8CQiM01PUozAF4NhfOjw39hfumM2WNXuwUcteRPCRxBkSOeGX5/R3vq/jUIsUfoLWlFLCZm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723334054; c=relaxed/simple;
	bh=cdUzVchCaRhLUnErCbZsZUKbLBcgxHpYnYNip9ALhpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fUBxSeAtlfgLLlEOLrUvhxFnhZh0HnwvJB2iMeF1oBDaA43Rc8v1hSHZxFjKhB3mc98IVKbVfH2FBBQE+oHotHsfooGm8XkxZe8sohgb7U593t6CpSuIhleibtgazXa6g9xKQAS/dr1pTTfaH1nSoKC20ZBZ62oMdN6EgRhllYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IiTDnyS1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723334053; x=1754870053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cdUzVchCaRhLUnErCbZsZUKbLBcgxHpYnYNip9ALhpI=;
  b=IiTDnyS15D/jSc4DtBXJW46r58u2dNGL3wtT6pNMh1z1B4iVUPSciQXw
   qZxeyQ2VHtmkqAJB0ZWkQHyGy26KM1Wc0IDIrt5TfOSgKQhXPkMqfvAKv
   8EznXvYkWmjqVflkg/k5f0k4ZtOKb474oKU+alEBZcYAaamlqUSMwlKG4
   WfKCGsT/TQAqs4kWbpQhw/cAp8/im0mrwJSrZyYV7f35MxaPWng/CL+ww
   K8g+MYTLRJl4HsfH7xQOgf3Y47+DlzXVEXm/uPc8QdzCg1FSAbBHunBGg
   jKONhOPn+WmO5esubqFqlpTMtC8JbKsdFOZUoeYpvkbgAQ8m+cyFveoVZ
   Q==;
X-CSE-ConnectionGUID: 927cxkWtRAOHvyja/Go48A==
X-CSE-MsgGUID: lQ51+Kf5RQG7viCB2nmnDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="25341576"
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="25341576"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 16:54:13 -0700
X-CSE-ConnectionGUID: bKTUh9daSDKjYaYFacB/9A==
X-CSE-MsgGUID: H/ZbzCnHRWWnZV8q+ukxLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="62566867"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 10 Aug 2024 16:54:09 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scvuQ-000AOl-2S;
	Sat, 10 Aug 2024 23:54:06 +0000
Date: Sun, 11 Aug 2024 07:53:45 +0800
From: kernel test robot <lkp@intel.com>
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com,
	quic_pavir@quicinc.com, quic_linchen@quicinc.com,
	quic_leiwei@quicinc.com, Luo Jie <quic_luoj@quicinc.com>
Subject: Re: [PATCH 2/4] clk: qcom: Add common PLL clock controller driver
 for IPQ SoC
Message-ID: <202408110756.rSXn1ZRu-lkp@intel.com>
References: <20240808-qcom_ipq_cmnpll-v1-2-b0631dcbf785@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808-qcom_ipq_cmnpll-v1-2-b0631dcbf785@quicinc.com>

Hi Luo,

kernel test robot noticed the following build errors:

[auto build test ERROR on 222a3380f92b8791d4eeedf7cd750513ff428adf]

url:    https://github.com/intel-lab-lkp/linux/commits/Luo-Jie/dt-bindings-clock-qcom-Add-common-PLL-clock-controller-for-IPQ-SoC/20240808-221059
base:   222a3380f92b8791d4eeedf7cd750513ff428adf
patch link:    https://lore.kernel.org/r/20240808-qcom_ipq_cmnpll-v1-2-b0631dcbf785%40quicinc.com
patch subject: [PATCH 2/4] clk: qcom: Add common PLL clock controller driver for IPQ SoC
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240811/202408110756.rSXn1ZRu-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408110756.rSXn1ZRu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408110756.rSXn1ZRu-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/qcom/clk-ipq-cmn-pll.c: In function 'ipq_cmn_pll_config':
>> drivers/clk/qcom/clk-ipq-cmn-pll.c:96:24: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      96 |                 val |= FIELD_PREP(CMN_PLL_REFCLK_INDEX, 3);
         |                        ^~~~~~~~~~


vim +/FIELD_PREP +96 drivers/clk/qcom/clk-ipq-cmn-pll.c

    77	
    78	static int ipq_cmn_pll_config(struct device *dev, unsigned long parent_rate)
    79	{
    80		void __iomem *base;
    81		u32 val;
    82	
    83		base = devm_of_iomap(dev, dev->of_node, 0, NULL);
    84		if (IS_ERR(base))
    85			return PTR_ERR(base);
    86	
    87		val = readl(base + CMN_PLL_REFCLK_CONFIG);
    88		val &= ~(CMN_PLL_REFCLK_EXTERNAL | CMN_PLL_REFCLK_INDEX);
    89	
    90		/*
    91		 * Configure the reference input clock selection as per the given rate.
    92		 * The output clock rates are always of fixed value.
    93		 */
    94		switch (parent_rate) {
    95		case 25000000:
  > 96			val |= FIELD_PREP(CMN_PLL_REFCLK_INDEX, 3);
    97			break;
    98		case 31250000:
    99			val |= FIELD_PREP(CMN_PLL_REFCLK_INDEX, 4);
   100			break;
   101		case 40000000:
   102			val |= FIELD_PREP(CMN_PLL_REFCLK_INDEX, 6);
   103			break;
   104		case 48000000:
   105			val |= FIELD_PREP(CMN_PLL_REFCLK_INDEX, 7);
   106			break;
   107		case 50000000:
   108			val |= FIELD_PREP(CMN_PLL_REFCLK_INDEX, 8);
   109			break;
   110		case 96000000:
   111			val |= FIELD_PREP(CMN_PLL_REFCLK_INDEX, 7);
   112			val &= ~CMN_PLL_REFCLK_DIV;
   113			val |= FIELD_PREP(CMN_PLL_REFCLK_DIV, 2);
   114			break;
   115		default:
   116			return -EINVAL;
   117		}
   118	
   119		writel(val, base + CMN_PLL_REFCLK_CONFIG);
   120	
   121		/* Update the source clock rate selection. Only 96 MHZ uses 0. */
   122		val = readl(base + CMN_PLL_REFCLK_SRC_SELECTION);
   123		val &= ~CMN_PLL_REFCLK_SRC_DIV;
   124		if (parent_rate != 96000000)
   125			val |= FIELD_PREP(CMN_PLL_REFCLK_SRC_DIV, 1);
   126	
   127		writel(val, base + CMN_PLL_REFCLK_SRC_SELECTION);
   128	
   129		/*
   130		 * Reset the common PLL block by asserting/de-asserting for 100 ms
   131		 * each, to ensure the updated configurations take effect.
   132		 */
   133		val = readl(base + CMN_PLL_POWER_ON_AND_RESET);
   134		val &= ~CMN_ANA_EN_SW_RSTN;
   135		writel(val, base);
   136		msleep(100);
   137	
   138		val |= CMN_ANA_EN_SW_RSTN;
   139		writel(val, base + CMN_PLL_POWER_ON_AND_RESET);
   140		msleep(100);
   141	
   142		return 0;
   143	}
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

