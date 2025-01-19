Return-Path: <linux-arm-msm+bounces-45484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D5EA16010
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 04:11:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B3DD18861D9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 03:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF953A1CD;
	Sun, 19 Jan 2025 03:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JvX0DKkp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AED82905;
	Sun, 19 Jan 2025 03:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737256307; cv=none; b=Zz5swg2LAOyyiSiUEx8us9vDxKSAKnH7WeOTzRkbyAsSepGnq0NSwnhQ0fdoqG+XDTGiLSqdz+cLMFTQCQEqstbvYCbv+A7+v025Vo/9jjXlCR69hdkPqXUY3Fn9ML0OCR4uZnUwYGCUruqRcQbtlOELP/QDojHu4CBlLznp61c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737256307; c=relaxed/simple;
	bh=YDocvPDZtke6usa5GreQZRU5XBOOqLpG4SECucxRfBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZglfAqHB6EL4xiZlY0J0/m8cQYKJLWJDK7kXIb+YYy6IEbhNOrdcJI21In/Qj34h3xCdgoEI6Ldt2+zqCvgUWABO/+aPRmUEijOb9mW0DVhyUWcyHU0bzQaNROOgY+iZnRmCHk5994t9L7CnHUxV916Gexkyzxr/uYUPEK493o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JvX0DKkp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737256305; x=1768792305;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YDocvPDZtke6usa5GreQZRU5XBOOqLpG4SECucxRfBg=;
  b=JvX0DKkp4Zz8FbCxVpEYbrjdWWNCmPsuHExm9yV1M6SblFOGKPs9RBph
   ImeLd/cDOS8p9llm2G9sVV3JjffRicOb4fJWIYwTE1Y7C5SiX7ZFVke7e
   l0lj1fuczjs7gJTr5vSac+AehXXzD5xI+0UTKVGpRmYltzpg+vgZFce8k
   Y/WDKfCqj95OV4CVtRa3B27vfkpx5dLN7dsyklc3rkhChgsMS/Lc/r7FY
   jmKb7cwVvCYxx0PQQpEM8HI628vFLkWX0BMZ2yLHvjCBKQH7vBZJS8/Z5
   1oyFO3xjRvP69gvxLe4nP5XQvs4AzcEQuPAJsguy5m+/0GPBeTQMN0b/P
   A==;
X-CSE-ConnectionGUID: P62kyXuyS+m+9Vy3ycb+mw==
X-CSE-MsgGUID: RVH9hSPpT4GxU4ddZNMo1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="40459012"
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="40459012"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 19:11:44 -0800
X-CSE-ConnectionGUID: 1aeU0cT5SfyLhpKxYLad9g==
X-CSE-MsgGUID: 5UqFK7rlSOyicGp5v9XBDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110204854"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Jan 2025 19:11:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZLis-000V3P-10;
	Sun, 19 Jan 2025 03:11:38 +0000
Date: Sun, 19 Jan 2025 11:10:57 +0800
From: kernel test robot <lkp@intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: Re: [PATCH v5 2/3] platform: arm64: add Huawei Matebook E Go EC
 driver
Message-ID: <202501191043.a0w9KqJ6-lkp@intel.com>
References: <20250117140348.180681-3-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117140348.180681-3-mitltlatltl@gmail.com>

Hi Pengyu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0907e7fb35756464aa34c35d6abb02998418164b]

url:    https://github.com/intel-lab-lkp/linux/commits/Pengyu-Luo/dt-bindings-platform-Add-Huawei-Matebook-E-Go-EC/20250117-220936
base:   0907e7fb35756464aa34c35d6abb02998418164b
patch link:    https://lore.kernel.org/r/20250117140348.180681-3-mitltlatltl%40gmail.com
patch subject: [PATCH v5 2/3] platform: arm64: add Huawei Matebook E Go EC driver
config: powerpc64-randconfig-r121-20250119 (https://download.01.org/0day-ci/archive/20250119/202501191043.a0w9KqJ6-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250119/202501191043.a0w9KqJ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501191043.a0w9KqJ6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/arm64/huawei-gaokun-ec.c:134:32: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected unsigned char [usertype] *buf @@     got unsigned char const [usertype] *req @@
   drivers/platform/arm64/huawei-gaokun-ec.c:134:32: sparse:     expected unsigned char [usertype] *buf
   drivers/platform/arm64/huawei-gaokun-ec.c:134:32: sparse:     got unsigned char const [usertype] *req
>> drivers/platform/arm64/huawei-gaokun-ec.c:113:20: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got unsigned char const [usertype] * @@
   drivers/platform/arm64/huawei-gaokun-ec.c:113:20: sparse:     expected void *
   drivers/platform/arm64/huawei-gaokun-ec.c:113:20: sparse:     got unsigned char const [usertype] *

vim +134 drivers/platform/arm64/huawei-gaokun-ec.c

   110	
   111	static inline void *extr_resp_shallow(const u8 *src)
   112	{
 > 113		return src + RESP_HDR_SIZE;
   114	}
   115	
   116	struct gaokun_ec {
   117		struct i2c_client *client;
   118		struct mutex lock; /* EC transaction lock */
   119		struct blocking_notifier_head notifier_list;
   120		struct device *hwmon_dev;
   121		struct input_dev *idev;
   122		bool suspended;
   123	};
   124	
   125	static int gaokun_ec_request(struct gaokun_ec *ec, const u8 *req,
   126				     size_t resp_len, u8 *resp)
   127	{
   128		struct i2c_client *client = ec->client;
   129		struct i2c_msg msgs[] = {
   130			{
   131				.addr = client->addr,
   132				.flags = client->flags,
   133				.len = REQ_LEN(req),
 > 134				.buf = req,
   135			}, {
   136				.addr = client->addr,
   137				.flags = client->flags | I2C_M_RD,
   138				.len = resp_len,
   139				.buf = resp,
   140			},
   141		};
   142		int ret;
   143	
   144		guard(mutex)(&ec->lock);
   145		ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
   146		if (ret != ARRAY_SIZE(msgs)) {
   147			dev_err(&client->dev, "I2C transfer error %d\n", ret);
   148			goto out_after_break;
   149		}
   150	
   151		ret = *resp;
   152		if (ret)
   153			dev_err(&client->dev, "EC transaction error %d\n", ret);
   154	
   155	out_after_break:
   156		usleep_range(2000, 2500); /* have a break, ACPI did this */
   157	
   158		return ret;
   159	}
   160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

