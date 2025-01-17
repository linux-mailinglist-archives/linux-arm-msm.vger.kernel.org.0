Return-Path: <linux-arm-msm+bounces-45394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 799D3A14E24
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 12:04:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B69B37A185A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 11:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C211FCFCE;
	Fri, 17 Jan 2025 11:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IsJj8vAT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264DB1F8905;
	Fri, 17 Jan 2025 11:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737111873; cv=none; b=dPCCDbNV2kIYridVvrBdJIv2DdVs5K0XvKVL7j2F6HXpkfyI602Khgzp6oC9CXdmvJTy1E4MXDuMnuHOloOjED6vaoMYA0AwL3LxtZuIuZ9tkG+ZN/hgAyIj14OFiY4IyBhf586oXAd1Ul52oqmVshgptQF2u2wM6Pp+8Ro9+tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737111873; c=relaxed/simple;
	bh=T71mNzLWCbqBco7l4n+cqt+WC9phoTK4z4rSCBRuXq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVDmSCINJ3LJ/uN0MrHyaf+WOUov9/8hOjnGUcqhncE+VY0w3SN6A5ElODW0oYwfJbb4qUeiJ+ijpkr+EC5SZ6qPmreJ/fNSFGZa5O3kNE+FbGGe+gs1UNhd6kJKb0hSh/X4AeUin3HhdeRnCVj8FSx7Fn0ZA+xdYRJ5YS30PiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IsJj8vAT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737111872; x=1768647872;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T71mNzLWCbqBco7l4n+cqt+WC9phoTK4z4rSCBRuXq0=;
  b=IsJj8vATWnjAzCQ3G+cWdcnkGcCbJqXxsX14TEaxQwPcTSqTT3E3xmE+
   QlEHoXlIL+YdMDz1H9dgvUs3HjIEPva3we6lH6MGPThUWOtjdJLVKBs9U
   EJH5OO2tLYtjguCefL0+9IkJTGXBtSWZqBQTjaJk/LOghjRgG4wtMWMrn
   MvsiQZqCQ0NOzCM/gA6Z4BKstE5Dh9hIvuDjjfJi9s3zV1ucTQqHnm1cm
   FJWgYGvC+1/l8YAeiE16gRU2oeaEzEk/o2ZpZYdG++XOh38mN4We3DQKU
   Ez0p2YXk5SDdYXbCDEF+bYoq191ujzaszLjJDt45mzbj6mHCA0II8lq1W
   Q==;
X-CSE-ConnectionGUID: LOdfaLAFTU6gUf6AN4iVVQ==
X-CSE-MsgGUID: 9lMq5+Y5SyKIAcxUB0K3Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37778477"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="37778477"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 03:04:31 -0800
X-CSE-ConnectionGUID: ExlJaJBFRG6Ud7aN/hExzw==
X-CSE-MsgGUID: caxrbGchQde3DQDs9c8hdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="110777656"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Jan 2025 03:04:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYk9I-000T6J-1L;
	Fri, 17 Jan 2025 11:04:24 +0000
Date: Fri, 17 Jan 2025 19:03:53 +0800
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
Subject: Re: [PATCH v4 2/3] platform: arm64: add Huawei Matebook E Go EC
 driver
Message-ID: <202501171826.NGZwFrgW-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on b323d8e7bc03d27dec646bfdccb7d1a92411f189]

url:    https://github.com/intel-lab-lkp/linux/commits/Pengyu-Luo/dt-bindings-platform-Add-Huawei-Matebook-E-Go-EC/20250116-192206
base:   b323d8e7bc03d27dec646bfdccb7d1a92411f189
patch link:    https://lore.kernel.org/r/20250116111559.83641-3-mitltlatltl%40gmail.com
patch subject: [PATCH v4 2/3] platform: arm64: add Huawei Matebook E Go EC driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250117/202501171826.NGZwFrgW-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171826.NGZwFrgW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171826.NGZwFrgW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/platform/arm64/huawei-gaokun-ec.c: In function 'extr_resp_shallow':
>> drivers/platform/arm64/huawei-gaokun-ec.c:91:20: warning: return discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
      91 |         return src + RESP_HDR_SIZE;
         |                    ^
   drivers/platform/arm64/huawei-gaokun-ec.c: In function 'gaokun_ec_request':
>> drivers/platform/arm64/huawei-gaokun-ec.c:112:32: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     112 |                         .buf = req,
         |                                ^~~


vim +/const +91 drivers/platform/arm64/huawei-gaokun-ec.c

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

