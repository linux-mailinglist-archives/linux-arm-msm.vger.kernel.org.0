Return-Path: <linux-arm-msm+bounces-45400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B318A15083
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 14:27:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB2113A130E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 13:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83581FF7BE;
	Fri, 17 Jan 2025 13:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iofmf2oL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0121F9F55;
	Fri, 17 Jan 2025 13:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737120427; cv=none; b=CW3Vl29vnPDp4XYZ9HN59ovB+zdlj/istwDWMj7WnC1KJQMqEOaxP3QA3I20zogj7NbVAHdxF/Lp28YyG1os/An+KBf0S8+Wf5jplmkU/SSaRhaeb6CIbhepGT1vpwYRQOT3rw6ua3UbIt2I93iMV3lrn4YrSmq8hanwdNmywIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737120427; c=relaxed/simple;
	bh=pZ8GrfB//8axkZeEjA8SPuZSPROwvtJF41KknQSFIYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mfrYhGsDrQNEnFDJf9LH+SyjcrHRM11LIShGxQveXxDfd7Y1Q+Fr6mE+EwKitj7U7pv/zEPGKnOU+mk//KfNF7Zi2IJt720tJcNbUjSL6TuhHAL1B59jxspGU/KpGsoejCYqj0Bo7ZtJKwiAGOmC2L6fOcg/4syYkMKqfnlyfjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iofmf2oL; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737120425; x=1768656425;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pZ8GrfB//8axkZeEjA8SPuZSPROwvtJF41KknQSFIYU=;
  b=Iofmf2oL0jKYxss/Mno3HdASo99QErehEVBgbaSIknR5i1INm4JPdDtG
   YC5FLViPkDdsGBeNRJUfgIqyo8q63vdTA+P/CWa5+waOdnNIM5ZOS1uK8
   RNRzPjjn3DZBE1j8RTNwmj0PwmWlMhZrzR5Y81OShow1VCJau1W13TA1r
   NtQ43rW7N01qcSzeXajs6QaG72XEhB4ce4n4Q3GKCllk33tkKJbkKWWFd
   YW0gn5ZdyoRysNPHgdS0MC7lCcFgtBYfMPzqUdcAm+bmW6gZL1BsjnHJx
   rn94NxaXOzKCNv/6ibZSFLYKWuAmQwJjdUzx1DrpOSzEdk2Ewis+S1R3o
   g==;
X-CSE-ConnectionGUID: yi+RWNfuQDWkKHh4LknWOQ==
X-CSE-MsgGUID: xwWI5T+BQuiGQbjb1AiYmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="36829830"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="36829830"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 05:22:47 -0800
X-CSE-ConnectionGUID: s6Wb8N8YR9ay6O3dr+luVA==
X-CSE-MsgGUID: 0CgC1ijGTBaL4h4uG3coeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="129063946"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Jan 2025 05:22:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYmJ6-000TFX-1k;
	Fri, 17 Jan 2025 13:22:40 +0000
Date: Fri, 17 Jan 2025 21:22:15 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
Subject: Re: [PATCH v4 2/3] platform: arm64: add Huawei Matebook E Go EC
 driver
Message-ID: <202501172102.HQ2qqllb-lkp@intel.com>
References: <20250116111559.83641-3-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116111559.83641-3-mitltlatltl@gmail.com>

Hi Pengyu,

kernel test robot noticed the following build errors:

[auto build test ERROR on b323d8e7bc03d27dec646bfdccb7d1a92411f189]

url:    https://github.com/intel-lab-lkp/linux/commits/Pengyu-Luo/dt-bindings-platform-Add-Huawei-Matebook-E-Go-EC/20250116-192206
base:   b323d8e7bc03d27dec646bfdccb7d1a92411f189
patch link:    https://lore.kernel.org/r/20250116111559.83641-3-mitltlatltl%40gmail.com
patch subject: [PATCH v4 2/3] platform: arm64: add Huawei Matebook E Go EC driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250117/202501172102.HQ2qqllb-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501172102.HQ2qqllb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501172102.HQ2qqllb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/platform/arm64/huawei-gaokun-ec.c:8:
   In file included from include/linux/auxiliary_bus.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2224:
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
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/arm64/huawei-gaokun-ec.c:91:9: error: returning 'const u8 *' (aka 'const unsigned char *') from a function with result type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
      91 |         return src + RESP_HDR_SIZE;
         |                ^~~~~~~~~~~~~~~~~~~
>> drivers/platform/arm64/huawei-gaokun-ec.c:112:11: error: initializing '__u8 *' (aka 'unsigned char *') with an expression of type 'const u8 *' (aka 'const unsigned char *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     112 |                         .buf = req,
         |                                ^~~
   3 warnings and 2 errors generated.


vim +91 drivers/platform/arm64/huawei-gaokun-ec.c

    88	
    89	static inline void *extr_resp_shallow(const u8 *src)
    90	{
  > 91		return src + RESP_HDR_SIZE;
    92	}
    93	
    94	struct gaokun_ec {
    95		struct i2c_client *client;
    96		struct mutex lock; /* EC transaction lock */
    97		struct blocking_notifier_head notifier_list;
    98		struct device *hwmon_dev;
    99		struct input_dev *idev;
   100		bool suspended;
   101	};
   102	
   103	static int gaokun_ec_request(struct gaokun_ec *ec, const u8 *req,
   104				     size_t resp_len, u8 *resp)
   105	{
   106		struct i2c_client *client = ec->client;
   107		struct i2c_msg msgs[2] = {
   108			{
   109				.addr = client->addr,
   110				.flags = client->flags,
   111				.len = REQ_LEN(req),
 > 112				.buf = req,
   113			}, {
   114				.addr = client->addr,
   115				.flags = client->flags | I2C_M_RD,
   116				.len = resp_len,
   117				.buf = resp,
   118			},
   119		};
   120	
   121		guard(mutex)(&ec->lock);
   122		i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
   123		usleep_range(2000, 2500); /* have a break, ACPI did this */
   124	
   125		return *resp ? -EIO : 0;
   126	}
   127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

