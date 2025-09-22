Return-Path: <linux-arm-msm+bounces-74390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F294FB8F541
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 09:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4B6B1722AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 07:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0581426F463;
	Mon, 22 Sep 2025 07:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fYkVa7vr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C1686329;
	Mon, 22 Sep 2025 07:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758527120; cv=none; b=SKySCclZGHmvG8TVB0jHn5H0Bt+E59mn1Fad1MQNS0sn1CN3hjTs2HUeWoR0v5YxB50RStflzNmdjvMk/hZDyehDsm7HYZ8Yrf7HJCnbyYq9hbyDEZepLVNtjEW7oKpkgPLV1GBHoyY5yXVVjfQFgiR4Sy6EBqPhnggZQ0yiODU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758527120; c=relaxed/simple;
	bh=H1RyaGQe908wgP+9DtCfGX//XxA1/HxhCRdfcWfFnz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDbws+FQH/DQ5cPNw4Nqeiruet82jx9Ctnoo8+UIxlvW4GlcskIut531Rgco50WICSAtSmsBlY2etyvEVTLyDlLMW6DrBDM1lL4+NzKC5taY2gqG/eMKgSD1FXbGSyY3nZ9n3MkgSS7jPFUaxz3FJ2p8iTR9SqOMuxwf4TYkf9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fYkVa7vr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758527120; x=1790063120;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H1RyaGQe908wgP+9DtCfGX//XxA1/HxhCRdfcWfFnz4=;
  b=fYkVa7vr2GGEbJfEFsfcOIrvUaFBw6nSD1prLtP5u0+sytar615BsP6g
   xOgPSut/HEYAxDjvwp19/n+CWjb80H+hG1SMxijGOtkJgrm/WWI1EXG2a
   TolX1H3myh8IBYrMvWjyvGSjKeRPTQl26cB7I6Qfg6GPpi08gkkHn1su/
   xAkdPrXaGN4xXT06/uj33KbOTPUp3Jfb3rI+NV4K4n7NUfFqbcU/m2fUc
   OLiMvRqB8nqrBlB0PTuzq0AmUXFQ5AjP75V3BeiUCMUuHc2lkDSCcI/f/
   GhWc5oEHP5Psqber+rYtYuo+wfxZ9pUaS18i8qyEjyMUO4AwtiyoP2Tgi
   Q==;
X-CSE-ConnectionGUID: dOodfSctSOq24iLZ62LSuw==
X-CSE-MsgGUID: cKjAn5KfRiW1Yzw0vc8IHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="78224477"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="78224477"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 00:45:19 -0700
X-CSE-ConnectionGUID: h9HCINiUTMCizWZCP4GPqw==
X-CSE-MsgGUID: /oSvEyXuS/2s/wbNz4RHQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="207149858"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Sep 2025 00:45:16 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0bEV-0001QP-0U;
	Mon, 22 Sep 2025 07:45:11 +0000
Date: Mon, 22 Sep 2025 15:45:03 +0800
From: kernel test robot <lkp@intel.com>
To: Ma Ke <make24@iscas.ac.cn>, srini@kernel.org, lgirdwood@gmail.com,
	broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	pierre-louis.bossart@linux.dev
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	Ma Ke <make24@iscas.ac.cn>, stable@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: wcd934x: fix error handling in
 wcd934x_codec_parse_data()
Message-ID: <202509221535.es8PWacQ-lkp@intel.com>
References: <20250922013507.558-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922013507.558-1-make24@iscas.ac.cn>

Hi Ma,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.17-rc7 next-20250919]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ma-Ke/ASoC-wcd934x-fix-error-handling-in-wcd934x_codec_parse_data/20250922-094038
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250922013507.558-1-make24%40iscas.ac.cn
patch subject: [PATCH v2] ASoC: wcd934x: fix error handling in wcd934x_codec_parse_data()
config: i386-buildonly-randconfig-005-20250922 (https://download.01.org/0day-ci/archive/20250922/202509221535.es8PWacQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509221535.es8PWacQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509221535.es8PWacQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/wcd934x.c:5862:38: warning: cast from 'void (*)(struct device *)' to 'void (*)(void *)' converts to incompatible function type [-Wcast-function-type-strict]
    5862 |         ret = devm_add_action_or_reset(dev, (void (*)(void *))put_device, &wcd->sidev->dev);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device/devres.h:166:34: note: expanded from macro 'devm_add_action_or_reset'
     166 |         __devm_add_action_or_reset(dev, action, data, #action)
         |                                         ^~~~~~
   1 warning generated.


vim +5862 sound/soc/codecs/wcd934x.c

  5837	
  5838	static int wcd934x_codec_probe(struct platform_device *pdev)
  5839	{
  5840		struct device *dev = &pdev->dev;
  5841		struct wcd934x_ddata *data = dev_get_drvdata(dev->parent);
  5842		struct wcd934x_codec *wcd;
  5843		int ret, irq;
  5844	
  5845		wcd = devm_kzalloc(dev, sizeof(*wcd), GFP_KERNEL);
  5846		if (!wcd)
  5847			return -ENOMEM;
  5848	
  5849		wcd->dev = dev;
  5850		wcd->regmap = data->regmap;
  5851		wcd->extclk = data->extclk;
  5852		wcd->sdev = to_slim_device(data->dev);
  5853		mutex_init(&wcd->sysclk_mutex);
  5854		mutex_init(&wcd->micb_lock);
  5855		wcd->common.dev = dev->parent;
  5856		wcd->common.max_bias = 4;
  5857	
  5858		ret = wcd934x_codec_parse_data(wcd);
  5859		if (ret)
  5860			return ret;
  5861	
> 5862		ret = devm_add_action_or_reset(dev, (void (*)(void *))put_device, &wcd->sidev->dev);
  5863		if (ret)
  5864			return ret;
  5865	
  5866		/* set default rate 9P6MHz */
  5867		regmap_update_bits(wcd->regmap, WCD934X_CODEC_RPM_CLK_MCLK_CFG,
  5868				   WCD934X_CODEC_RPM_CLK_MCLK_CFG_MCLK_MASK,
  5869				   WCD934X_CODEC_RPM_CLK_MCLK_CFG_9P6MHZ);
  5870		memcpy(wcd->rx_chs, wcd934x_rx_chs, sizeof(wcd934x_rx_chs));
  5871		memcpy(wcd->tx_chs, wcd934x_tx_chs, sizeof(wcd934x_tx_chs));
  5872	
  5873		irq = regmap_irq_get_virq(data->irq_data, WCD934X_IRQ_SLIMBUS);
  5874		if (irq < 0)
  5875			return dev_err_probe(wcd->dev, irq, "Failed to get SLIM IRQ\n");
  5876	
  5877		ret = devm_request_threaded_irq(dev, irq, NULL,
  5878						wcd934x_slim_irq_handler,
  5879						IRQF_TRIGGER_RISING | IRQF_ONESHOT,
  5880						"slim", wcd);
  5881		if (ret)
  5882			return dev_err_probe(dev, ret, "Failed to request slimbus irq\n");
  5883	
  5884		wcd934x_register_mclk_output(wcd);
  5885		platform_set_drvdata(pdev, wcd);
  5886	
  5887		return devm_snd_soc_register_component(dev, &wcd934x_component_drv,
  5888						       wcd934x_slim_dais,
  5889						       ARRAY_SIZE(wcd934x_slim_dais));
  5890	}
  5891	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

