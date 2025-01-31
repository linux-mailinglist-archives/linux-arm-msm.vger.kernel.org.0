Return-Path: <linux-arm-msm+bounces-46624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0529CA243AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 21:08:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 656F5167540
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 20:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8831F2C33;
	Fri, 31 Jan 2025 20:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l0XR6LBg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB07155C88;
	Fri, 31 Jan 2025 20:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738354090; cv=none; b=Cm0iRQlAAft+2GDNbzjGi7fjJYIa2G/uMWT4kDvwSyVjc+0yeT7eNoYicXmp8oXx+l10n0Flzb4LSbUrotSFZhqXMb2AHaBq1hZ9WVoSw9cRFnq7r0Dfem5kOZdkPZ5XkTmeI290zPFVl5PZV86puxIV120+wkdATCnrRy4oLdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738354090; c=relaxed/simple;
	bh=COXth9vzC9L4DLry/6VVSSD8GXZn+nuLwV2IJYzQEqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ds3/R01Z3/jaDpLYHkitihVfZHjCilQJ9StT1SK3LzPhPCfBwnvzBWM1PtSqUSgUP4O/YZf0F3IBAvHoRva3AoRhYzwna+ywGZJJTwlLmmzNz+WTE4c8kM8Xv8rIHaDxng6HSPdQb8aggEkyfEgosDqX/GX4KXkLzXX4L55nVkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l0XR6LBg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738354088; x=1769890088;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=COXth9vzC9L4DLry/6VVSSD8GXZn+nuLwV2IJYzQEqY=;
  b=l0XR6LBgA9yOp/GxMcF0BLCdUMbGXMF2KQAWDL/GCsZHH3y8oxoJirH+
   IU1NlIt4PW8IBGWAIdt3SP0qma4PAQKm3x0B+1aI8/YzsVZr77YthADBN
   AaRxoRCNQaLXptxubWenhp7fv+aYUfnEtsZwptJ4Fz4k/itGJ4DmGWnus
   yQ1MnLgvDFDIdJIXtus8emyTJuJBg61JcKdeTsfXF6A1EK5o+jJD9uHpO
   98zViztUHLetMl2VuGY+rK16i9xM3zQQyNociiYQKdRCNBcMks8B2IEst
   iHQfYhfhBEtByFnM8c0ieCNaYT4NmY6DOsRwphDvExd3JEt/HCxWDi7Dq
   A==;
X-CSE-ConnectionGUID: 2Y6NpFr/RiGI7pRPy9GyCg==
X-CSE-MsgGUID: qLNJIE9uTy6XsIPl8ed78w==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="50316415"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="50316415"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 12:08:08 -0800
X-CSE-ConnectionGUID: h5yofnzcQ4u8Trpgo7S3FQ==
X-CSE-MsgGUID: PxFX4g1OS/GH68anfo97Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="109655773"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Jan 2025 12:08:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdxJ3-000n3L-1P;
	Fri, 31 Jan 2025 20:08:01 +0000
Date: Sat, 1 Feb 2025 04:07:19 +0800
From: kernel test robot <lkp@intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: Re: [PATCH RESEND v6 2/3] platform: arm64: add Huawei Matebook E Go
 EC driver
Message-ID: <202502010344.KWDBQUG9-lkp@intel.com>
References: <20250131092139.6065-3-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131092139.6065-3-mitltlatltl@gmail.com>

Hi Pengyu,

kernel test robot noticed the following build errors:

[auto build test ERROR on 853d1f41ba73e78d22e7075d9a95670aab187eba]

url:    https://github.com/intel-lab-lkp/linux/commits/Pengyu-Luo/dt-bindings-platform-Add-Huawei-Matebook-E-Go-EC/20250131-172427
base:   853d1f41ba73e78d22e7075d9a95670aab187eba
patch link:    https://lore.kernel.org/r/20250131092139.6065-3-mitltlatltl%40gmail.com
patch subject: [PATCH RESEND v6 2/3] platform: arm64: add Huawei Matebook E Go EC driver
config: powerpc64-randconfig-003-20250201 (https://download.01.org/0day-ci/archive/20250201/202502010344.KWDBQUG9-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502010344.KWDBQUG9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502010344.KWDBQUG9-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `devm_hwmon_device_register_with_info'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: drivers/platform/arm64/huawei-gaokun-ec.o: in function `gaokun_ec_probe':
>> drivers/platform/arm64/huawei-gaokun-ec.c:786:(.text+0x16ac): undefined reference to `devm_hwmon_device_register_with_info'


vim +786 drivers/platform/arm64/huawei-gaokun-ec.c

   740	
   741	static int gaokun_ec_probe(struct i2c_client *client)
   742	{
   743		struct device *dev = &client->dev;
   744		struct gaokun_ec *ec;
   745		int ret;
   746	
   747		ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
   748		if (!ec)
   749			return -ENOMEM;
   750	
   751		ret = devm_mutex_init(dev, &ec->lock);
   752		if (ret)
   753			return ret;
   754	
   755		ec->client = client;
   756		i2c_set_clientdata(client, ec);
   757		BLOCKING_INIT_NOTIFIER_HEAD(&ec->notifier_list);
   758	
   759		/* Lid switch */
   760		ec->idev = devm_input_allocate_device(dev);
   761		if (!ec->idev)
   762			return -ENOMEM;
   763	
   764		ec->idev->name = "LID";
   765		ec->idev->phys = "gaokun-ec/input0";
   766		input_set_capability(ec->idev, EV_SW, SW_LID);
   767	
   768		ret = input_register_device(ec->idev);
   769		if (ret)
   770			return dev_err_probe(dev, ret, "Failed to register input device\n");
   771	
   772		ret = gaokun_aux_init(dev, GAOKUN_DEV_PSY, ec);
   773		if (ret)
   774			return ret;
   775	
   776		ret = gaokun_aux_init(dev, GAOKUN_DEV_UCSI, ec);
   777		if (ret)
   778			return ret;
   779	
   780		ret = devm_request_threaded_irq(dev, client->irq, NULL,
   781						gaokun_ec_irq_handler, IRQF_ONESHOT,
   782						dev_name(dev), ec);
   783		if (ret)
   784			return dev_err_probe(dev, ret, "Failed to request IRQ\n");
   785	
 > 786		ec->hwmon_dev = devm_hwmon_device_register_with_info(dev, "gaokun_ec_hwmon",
   787								     ec, &gaokun_ec_hwmon_chip_info, NULL);
   788		if (IS_ERR(ec->hwmon_dev))
   789			return dev_err_probe(dev, PTR_ERR(ec->hwmon_dev),
   790					     "Failed to register hwmon device\n");
   791	
   792		return 0;
   793	}
   794	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

