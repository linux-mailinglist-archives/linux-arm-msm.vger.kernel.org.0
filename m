Return-Path: <linux-arm-msm+bounces-23675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF9B9130F1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 01:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04BA6B25205
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 23:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493CB16F835;
	Fri, 21 Jun 2024 23:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4PJh7OU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559D836AF8;
	Fri, 21 Jun 2024 23:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719013956; cv=none; b=YLA641FLQTLEVbn7OX6bQzEQi/hOTVFLgz6EEBC0gK2Qryusf7fczFecZ1/LiA+WTc1akBkzdaAfDu7L1uKxSLPNHC6qiQV07G5M/cpeWDtzupNL12pgEXeBGE9Jibhrvka7X3GLrWu7yOeNMI7zyOiTqxVeE3wnJXGVdZ+DXfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719013956; c=relaxed/simple;
	bh=IlwUS5voj83yrVnahkbmNFGTdQnaGbO/2+ABzc4IILs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hnu5b/bA0A6JLEXN1NedLXveL9IPAs2z9tSA+YzYtqZWVQpQLUYHd7ZOf6UwKHihTDKDyOsrgH8cc1p9f8kyvRaN2iDNE2pU7IQtffS5Q+wGLHoA8/iIkquQ29KBt3GHl2GNAfs6c82A35m7P/ip/ZYpSa7+IKSz6S88oT2YNo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4PJh7OU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719013955; x=1750549955;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IlwUS5voj83yrVnahkbmNFGTdQnaGbO/2+ABzc4IILs=;
  b=d4PJh7OUCwGsefrIibbslvlvDK60B9hLDDrES4c/cNMomxi44jlJxaGX
   kJWio6/eIk/idQfY7YoOETqVFaUWve2UZrL/Z2Tio89o/dcseoKltAsqi
   GL91zfwz+ljdn/PG3VUIeeQ3F0k4cUmGg4PKLtLHwjBSZIYPbd4eaDPpm
   6tkTTdF1RP13qf/6Qz1e+SKJQzPfiIhYnWPw3+Hy2R0uvXZM+QZ+PAMhQ
   udryJIVO5AEqXQc8jtf7nV4HYQbkSL3dA7HQjN8OWx4FMQsBWWPQX/w7B
   wHqPPgiVM64BJQut24KziSL6S/zihPG06dIDDqk6RtDZsX9jUUoqeQviH
   g==;
X-CSE-ConnectionGUID: bjE72uaEThmVKDxNAZNMJQ==
X-CSE-MsgGUID: G58drpIISv621SA9Sa5hSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="12187910"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="12187910"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 16:52:34 -0700
X-CSE-ConnectionGUID: +x18Je5kQISObAMfhdR0PQ==
X-CSE-MsgGUID: ii9jeeHUSw+zSg9dMw+REQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="43173490"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Jun 2024 16:52:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKo3M-00098S-1O;
	Fri, 21 Jun 2024 23:52:24 +0000
Date: Sat, 22 Jun 2024 07:51:30 +0800
From: kernel test robot <lkp@intel.com>
To: Dzmitry Sankouski <dsankouski@gmail.com>,
	Sebastian Reichel <sre@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Pavel Machek <pavel@ucw.cz>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Chanwoo Choi <cw00.choi@samsung.com>, phone-devel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 12/23] mfd: Add new driver for MAX77705 PMIC
Message-ID: <202406220754.8crTEWeR-lkp@intel.com>
References: <20240618-starqltechn_integration_upstream-v3-12-e3f6662017ac@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-12-e3f6662017ac@gmail.com>

Hi Dzmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6906a84c482f098d31486df8dc98cead21cce2d0]

url:    https://github.com/intel-lab-lkp/linux/commits/Dzmitry-Sankouski/power-supply-add-undervoltage-health-status-property/20240618-222456
base:   6906a84c482f098d31486df8dc98cead21cce2d0
patch link:    https://lore.kernel.org/r/20240618-starqltechn_integration_upstream-v3-12-e3f6662017ac%40gmail.com
patch subject: [PATCH v3 12/23] mfd: Add new driver for MAX77705 PMIC
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240622/202406220754.8crTEWeR-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406220754.8crTEWeR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406220754.8crTEWeR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/mfd/max77705-core.c:14:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:25:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:22:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2214:
   include/linux/vmstat.h:484:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     484 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     485 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:491:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     491 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     492 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:498:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     498 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:512:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     512 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     513 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/mfd/max77705-core.c:20:
>> include/linux/mfd/max77705-private.h:243:19: error: use of undeclared identifier 'MAX77705_USBC_REG_END'; did you mean 'MAX77705_PMIC_REG_END'?
     243 |         u8 reg_muic_dump[MAX77705_USBC_REG_END];
         |                          ^~~~~~~~~~~~~~~~~~~~~
         |                          MAX77705_PMIC_REG_END
   include/linux/mfd/max77705-private.h:96:2: note: 'MAX77705_PMIC_REG_END' declared here
      96 |         MAX77705_PMIC_REG_END,
         |         ^
   5 warnings and 1 error generated.


vim +243 include/linux/mfd/max77705-private.h

   216	
   217	struct max77705_dev {
   218		struct device *dev;
   219		struct i2c_client *i2c; /* 0xCC; Haptic, PMIC */
   220		struct i2c_client *charger; /* 0xD2; Charger */
   221		struct i2c_client *fuelgauge; /* 0x6C; Fuelgauge */
   222		struct i2c_client *muic; /* 0x4A; MUIC */
   223		struct i2c_client *debug; /* 0xC4; Debug */
   224		struct mutex i2c_lock;
   225	
   226		struct regmap *regmap;
   227		struct regmap *regmap_fg;
   228		struct regmap *regmap_charger;
   229		struct regmap *regmap_leds;
   230	
   231		int type;
   232	
   233		int irq;
   234		int irq_base;
   235		int irq_masks_cur[MAX77705_IRQ_GROUP_NR];
   236		int irq_masks_cache[MAX77705_IRQ_GROUP_NR];
   237		bool wakeup;
   238		struct mutex irqlock;
   239	
   240	#ifdef CONFIG_HIBERNATION
   241		/* For hibernation */
   242		u8 reg_pmic_dump[MAX77705_PMIC_REG_END];
 > 243		u8 reg_muic_dump[MAX77705_USBC_REG_END];
   244		u8 reg_led_dump[MAX77705_LED_REG_END];
   245	#endif
   246	
   247		/* pmic VER/REV register */
   248		u8 pmic_rev;	/* pmic Rev */
   249		u8 pmic_ver;	/* pmic version */
   250	
   251		u8 cc_booting_complete;
   252	
   253		wait_queue_head_t queue_empty_wait_q;
   254		int doing_irq;
   255		int is_usbc_queue;
   256	
   257		struct max77705_platform_data *pdata;
   258	};
   259	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

