Return-Path: <linux-arm-msm+bounces-66754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9883B12A0B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 12:26:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7611F3A92F1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 10:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E610A242927;
	Sat, 26 Jul 2025 10:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kyZKaqLR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D4623E324;
	Sat, 26 Jul 2025 10:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753525591; cv=none; b=rUjaX1EPJ2NqK54tP0tR7IWD6lyg7TjU7qSA2uiJdBxhvl4byLIV+RZnm6qoLg5vYsEJU4e+dFoTezNkjX9YIOwLE+HvUCIle1W+ZKXMsBPAaegabCYfGUS2GTtYRYsXTpiACjsMJ2UaFrnEMK+AqrcR0Pv6XaO6f4RhgpjttPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753525591; c=relaxed/simple;
	bh=iE8cIDfFLQ8B5WGZtqZKWPN4Ek+qnInv2VJkerYcv0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TihFBHFKoYWPuBIRQJ8IX3eMg4orDABkWp98Nh7Dmp5sRByXwf5b8hpd1DxTa6LRmm1dL1hGwh0Jtn/ad7rymofgNyKdTfZkAtMSx8nEvJfuRzIDClIOrzHKNydPPMyxPS7w1hxJSlJimwG9RVsk6a8XNdHpEmJ4CYl9cBochEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kyZKaqLR; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753525590; x=1785061590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iE8cIDfFLQ8B5WGZtqZKWPN4Ek+qnInv2VJkerYcv0E=;
  b=kyZKaqLRxvC2WkhrDmGHErsG0lLABaYfhmE+26ith5w1aUR9CUP0QojC
   fX5411FHMIN2KUh4EzPb6qrWQpgZCaIIr7V6VCwBBapuvaTIvstlNESgb
   Oq3VB9guGWB+BLvISoT7u6JUHg89sZS182aPYMXtnGjw1mW8aJmS3WYSr
   xDzAQ1HFoV4VZB4KQk6MkrGsfDgTsizw1cTZjj3YFau1C+FA5KvkijflA
   g7je2rbEoj4XY6dL8JcwajCxkGNbVyinLRVhOr9JDGYKxlvh4prZfU15V
   IUYmMdv+z5K2FHQJDlPWvh4ID5RODGbAyWUyuUNKWb+BFbA7ix0jFoJeE
   A==;
X-CSE-ConnectionGUID: I4BwidOuS7yJ3Q5r7a98fw==
X-CSE-MsgGUID: drgkOW9CSY6eIluhWUh5vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55996066"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55996066"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 03:26:30 -0700
X-CSE-ConnectionGUID: W+MjwdixSHuhX3TInEHXeg==
X-CSE-MsgGUID: +c3Ix+1iSi691V+f/dZLvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="192406716"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Jul 2025 03:26:26 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufc6h-000LsC-2j;
	Sat, 26 Jul 2025 10:26:23 +0000
Date: Sat, 26 Jul 2025 18:26:12 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] clk: qcom: Add a driver for SM8750 GPU clocks
Message-ID: <202507261830.IirBJ9dS-lkp@intel.com>
References: <20250723-topic-8750_gpucc-v2-2-56c93b84c390@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723-topic-8750_gpucc-v2-2-56c93b84c390@oss.qualcomm.com>

Hi Konrad,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0be23810e32e6d0a17df7c0ebad895ba2c210fc4]

url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/dt-bindings-clock-qcom-Add-SM8750-GPU-clocks/20250724-044303
base:   0be23810e32e6d0a17df7c0ebad895ba2c210fc4
patch link:    https://lore.kernel.org/r/20250723-topic-8750_gpucc-v2-2-56c93b84c390%40oss.qualcomm.com
patch subject: [PATCH v2 2/3] clk: qcom: Add a driver for SM8750 GPU clocks
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250726/202507261830.IirBJ9dS-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507261830.IirBJ9dS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507261830.IirBJ9dS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/qcom/gpucc-sm8750.c:521:1: error: redefinition of '__inittest'
     521 | module_platform_driver(gx_cc_sm8750_driver);
         | ^
   include/linux/platform_device.h:292:2: note: expanded from macro 'module_platform_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^
   include/linux/device/driver.h:261:3: note: expanded from macro 'module_driver'
     261 | } \
         |   ^
   include/linux/module.h:132:42: note: expanded from macro '\
   module_init'
     132 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^
   drivers/clk/qcom/gpucc-sm8750.c:469:1: note: previous definition is here
     469 | module_platform_driver(gpu_cc_sm8750_driver);
         | ^
   include/linux/platform_device.h:292:2: note: expanded from macro 'module_platform_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^
   include/linux/device/driver.h:261:3: note: expanded from macro 'module_driver'
     261 | } \
         |   ^
   include/linux/module.h:132:42: note: expanded from macro '\
   module_init'
     132 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^
>> drivers/clk/qcom/gpucc-sm8750.c:521:1: error: redefinition of 'init_module'
     521 | module_platform_driver(gx_cc_sm8750_driver);
         | ^
   include/linux/platform_device.h:292:2: note: expanded from macro 'module_platform_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^
   include/linux/device/driver.h:261:3: note: expanded from macro 'module_driver'
     261 | } \
         |   ^
   include/linux/module.h:134:6: note: expanded from macro '\
   module_init'
     134 |         int init_module(void) __copy(initfn)                    \
         |             ^
   drivers/clk/qcom/gpucc-sm8750.c:469:1: note: previous definition is here
     469 | module_platform_driver(gpu_cc_sm8750_driver);
         | ^
   include/linux/platform_device.h:292:2: note: expanded from macro 'module_platform_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^
   include/linux/device/driver.h:261:3: note: expanded from macro 'module_driver'
     261 | } \
         |   ^
   include/linux/module.h:134:6: note: expanded from macro '\
   module_init'
     134 |         int init_module(void) __copy(initfn)                    \
         |             ^
>> drivers/clk/qcom/gpucc-sm8750.c:521:1: error: redefinition of '__exittest'
     521 | module_platform_driver(gx_cc_sm8750_driver);
         | ^
   include/linux/platform_device.h:292:2: note: expanded from macro 'module_platform_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^
   include/linux/device/driver.h:266:3: note: expanded from macro 'module_driver'
     266 | } \
         |   ^
   include/linux/module.h:140:42: note: expanded from macro '\
   module_exit'
     140 |         static inline exitcall_t __maybe_unused __exittest(void)                \
         |                                                 ^
   drivers/clk/qcom/gpucc-sm8750.c:469:1: note: previous definition is here
     469 | module_platform_driver(gpu_cc_sm8750_driver);
         | ^
   include/linux/platform_device.h:292:2: note: expanded from macro 'module_platform_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^
   include/linux/device/driver.h:266:3: note: expanded from macro 'module_driver'
     266 | } \
         |   ^
   include/linux/module.h:140:42: note: expanded from macro '\
   module_exit'
     140 |         static inline exitcall_t __maybe_unused __exittest(void)                \
         |                                                 ^
>> drivers/clk/qcom/gpucc-sm8750.c:521:1: error: redefinition of 'cleanup_module'
     521 | module_platform_driver(gx_cc_sm8750_driver);
         | ^
   include/linux/platform_device.h:292:2: note: expanded from macro 'module_platform_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^
   include/linux/device/driver.h:266:3: note: expanded from macro 'module_driver'
     266 | } \
         |   ^
   include/linux/module.h:142:7: note: expanded from macro '\
   module_exit'
     142 |         void cleanup_module(void) __copy(exitfn)                \
         |              ^
   drivers/clk/qcom/gpucc-sm8750.c:469:1: note: previous definition is here
     469 | module_platform_driver(gpu_cc_sm8750_driver);
         | ^
   include/linux/platform_device.h:292:2: note: expanded from macro 'module_platform_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^
   include/linux/device/driver.h:266:3: note: expanded from macro 'module_driver'
     266 | } \
         |   ^
   include/linux/module.h:142:7: note: expanded from macro '\
   module_exit'
     142 |         void cleanup_module(void) __copy(exitfn)                \
         |              ^
   4 errors generated.


vim +/__inittest +521 drivers/clk/qcom/gpucc-sm8750.c

   513	
   514	static struct platform_driver gx_cc_sm8750_driver = {
   515		.probe = gx_cc_sm8750_probe,
   516		.driver = {
   517			.name = "gx_cc-sm8750",
   518			.of_match_table = gx_cc_sm8750_match_table,
   519		},
   520	};
 > 521	module_platform_driver(gx_cc_sm8750_driver);
   522	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

