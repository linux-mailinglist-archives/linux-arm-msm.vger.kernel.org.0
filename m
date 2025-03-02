Return-Path: <linux-arm-msm+bounces-49932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 812B4A4AEB2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Mar 2025 03:09:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E64123B10B0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Mar 2025 02:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B394D2C1A2;
	Sun,  2 Mar 2025 02:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VtK3+Hr6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C824E288CC;
	Sun,  2 Mar 2025 02:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740881346; cv=none; b=TS6f+umKwfvtS12ErMyp3YDf72uYRbjqMXj3pUzjv5Zt7QSsn8ZmhTCAw/JbELzTyHP9OTq80sNs3m4AyfBk6y/0VidTAFIMg0LfZWkm4FSTaGUnni/Lm7rtJEEbPHyHcdorOgQL+PohfGXkkDtEHkZh4C4z7gk2WJJidYtA34g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740881346; c=relaxed/simple;
	bh=N6bdO5ufvOU4UlMfcbW1V2iVFg9S7pViFB0B1Dp885U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTySZq4jiQbUDh00nXqwqwnrpLuVRaQ3YNR0kuaQQUIMSlZKEAGgTpLI9wK+HHtwrBAHOOvqrcKx09bzEvNK0SnrMj1cxyFCEo688YiXvud4r4vK0N2xlmnZatccMU3RVk+mfUaLAAeAOeMMal8kmEFAVrGWWhJucUIRT6/hb7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VtK3+Hr6; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740881345; x=1772417345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N6bdO5ufvOU4UlMfcbW1V2iVFg9S7pViFB0B1Dp885U=;
  b=VtK3+Hr6GoB1APXb8wX6bO63AhRY6CZQrgfh2SRMToX2nLi5wRuXPPFP
   cxsYaH6aUkh19WXgCC7jeUEu/M9zUNUlei9KSnc9E8z9cCPHGiIVZ3BZZ
   9LrolL3jTZZ0nYL5mLh20ifASIsS4/DMGRljwjVcfbBNS7fP1R0tmdW/0
   Gy6C+/vJHnKJJfuHHM5wmESDznZmuIOvVqbMmBei1WW9s7DCtC/R3uKxv
   EObSEc4IdvznWoNOlpiEblrvYrAGgweEoZAvN/tcSbNWYT9GpkMG9IScz
   pEoEvnBZeJ8iv66P5iB2LkSwa1WDdbOYT9YoCupOYyiBO9GPEofxWFTHA
   g==;
X-CSE-ConnectionGUID: Xfh2t+UaQQeNsX3APORpbA==
X-CSE-MsgGUID: T1iRVskiQNSRuvs6R9mLnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="44596033"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="44596033"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 18:09:04 -0800
X-CSE-ConnectionGUID: kJyzAyBiQCmiU86YmGf5mA==
X-CSE-MsgGUID: EX0HUutsR06iMNtitEBQkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="117696253"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 01 Mar 2025 18:09:00 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toYlF-000GxG-1r;
	Sun, 02 Mar 2025 02:08:57 +0000
Date: Sun, 2 Mar 2025 10:08:48 +0800
From: kernel test robot <lkp@intel.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] phy: phy-snps-eusb2: make repeater optional
Message-ID: <202503020920.Kw0H8Acs-lkp@intel.com>
References: <20250223122227.725233-6-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250223122227.725233-6-ivo.ivanov.ivanov1@gmail.com>

Hi Ivaylo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.14-rc4 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivaylo-Ivanov/dt-bindings-phy-rename-qcom-snps-eusb2-phy-binding-to-snps-eusb2-phy/20250223-202709
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250223122227.725233-6-ivo.ivanov.ivanov1%40gmail.com
patch subject: [PATCH v2 5/8] phy: phy-snps-eusb2: make repeater optional
config: microblaze-randconfig-r123-20250302 (https://download.01.org/0day-ci/archive/20250302/202503020920.Kw0H8Acs-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250302/202503020920.Kw0H8Acs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020920.Kw0H8Acs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/phy-snps-eusb2.c:464:59: sparse: sparse: Using plain integer as NULL pointer

vim +464 drivers/phy/phy-snps-eusb2.c

   398	
   399	static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
   400	{
   401		struct device *dev = &pdev->dev;
   402		struct device_node *np = dev->of_node;
   403		struct snps_eusb2_hsphy *phy;
   404		struct phy_provider *phy_provider;
   405		struct phy *generic_phy;
   406		const struct snps_eusb2_phy_drvdata *drv_data;
   407		int ret, i;
   408		int num;
   409	
   410		phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
   411		if (!phy)
   412			return -ENOMEM;
   413	
   414		drv_data = of_device_get_match_data(dev);
   415		if (!drv_data)
   416			return -EINVAL;
   417		phy->data = drv_data;
   418	
   419		phy->base = devm_platform_ioremap_resource(pdev, 0);
   420		if (IS_ERR(phy->base))
   421			return PTR_ERR(phy->base);
   422	
   423		phy->phy_reset = devm_reset_control_get_exclusive(dev, NULL);
   424		if (IS_ERR(phy->phy_reset))
   425			return PTR_ERR(phy->phy_reset);
   426	
   427		phy->clks = devm_kcalloc(dev,
   428					 phy->data->num_clks,
   429					 sizeof(*phy->clks),
   430					 GFP_KERNEL);
   431		if (!phy->clks)
   432			return -ENOMEM;
   433	
   434		for (int i = 0; i < phy->data->num_clks; ++i)
   435			phy->clks[i].id = phy->data->clk_names[i];
   436	
   437		ret = devm_clk_bulk_get(dev, phy->data->num_clks,
   438					phy->clks);
   439		if (ret)
   440			return dev_err_probe(dev, ret,
   441					     "failed to get phy clock(s)\n");
   442	
   443		phy->ref_clk = NULL;
   444		for (int i = 0; i < phy->data->num_clks; ++i) {
   445			if (!strcmp(phy->clks[i].id, "ref")) {
   446				phy->ref_clk = phy->clks[i].clk;
   447				break;
   448			}
   449		}
   450	
   451		if (IS_ERR_OR_NULL(phy->ref_clk))
   452			return dev_err_probe(dev, PTR_ERR(phy->ref_clk),
   453					     "failed to get ref clk\n");
   454	
   455		num = ARRAY_SIZE(phy->vregs);
   456		for (i = 0; i < num; i++)
   457			phy->vregs[i].supply = eusb2_hsphy_vreg_names[i];
   458	
   459		ret = devm_regulator_bulk_get(dev, num, phy->vregs);
   460		if (ret)
   461			return dev_err_probe(dev, ret,
   462					     "failed to get regulator supplies\n");
   463	
 > 464		phy->repeater = devm_of_phy_optional_get(dev, np, 0);
   465		if (IS_ERR(phy->repeater))
   466			return dev_err_probe(dev, PTR_ERR(phy->repeater),
   467					     "failed to get repeater\n");
   468	
   469		generic_phy = devm_phy_create(dev, NULL, &snps_eusb2_hsphy_ops);
   470		if (IS_ERR(generic_phy)) {
   471			dev_err(dev, "failed to create phy %d\n", ret);
   472			return PTR_ERR(generic_phy);
   473		}
   474	
   475		dev_set_drvdata(dev, phy);
   476		phy_set_drvdata(generic_phy, phy);
   477	
   478		phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
   479		if (IS_ERR(phy_provider))
   480			return PTR_ERR(phy_provider);
   481	
   482		dev_info(dev, "Registered Snps-eUSB2 phy\n");
   483	
   484		return 0;
   485	}
   486	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

