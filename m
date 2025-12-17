Return-Path: <linux-arm-msm+bounces-85432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C68FCC5F16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 05:07:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 25EA63022589
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 04:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEBD52737EE;
	Wed, 17 Dec 2025 04:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QR7Y/VDX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C73238C16;
	Wed, 17 Dec 2025 04:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765944417; cv=none; b=ujGi/0072sDs1TBYJEQqY9nEaH8vQIqYv2q6S2CqExS90X29Dx9EeuffmLNvEGUr0FcoU5nWhzvleDtirwvxgoA+Iz5Lt4E9/qGp6aStxD3DXsZzIj077SvwtH6BFJHG2MbEocRYCxVtVmAFrtss2IvFk7p26JgWuqK4s03BvuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765944417; c=relaxed/simple;
	bh=OjAwINyKQ1MUxnEaRrjG70fGlGQQE/ByQWcqTj43Ghs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JsuhnVfT8Rnh9DNF9uCqt+F91HQ2LdTVQj2LXQVKksw3LD5NbzAREOZ+0uUMvaQkxVaF4aGO/j9JrD/usYJZsGdG+cedNoL5AM6T3Yjopl57D1CT2caRN53RdtwUFoDBZPjXbchdG5/n+wB+95LjQnY37tqDp/6Qy/R1t14n5uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QR7Y/VDX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765944416; x=1797480416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OjAwINyKQ1MUxnEaRrjG70fGlGQQE/ByQWcqTj43Ghs=;
  b=QR7Y/VDXUeob0WAxBVfg+iYi9wnUpqZENBPCYslAk4J4rhA+tq7Vvn26
   VcMHRZ+KNCwZJdA4mKNPkGyK+jwJKON4Kfw9nagGLgTsWgotI1cC8R23c
   Ly55JbIRuqj9gqI0aArk3ITAq3fA196ObO1r79LWe92WK7MJMBs9UmvCz
   0NZABNel7AMIdMgpMXlHVutXiq20DKGUCYieEN9pZZGXzUysspdQZdurC
   +URM1IAt5lZ+SYAakedj2jKf6GFddn3jwg5T49xjo/UK6RYqx4CYpd97l
   IHNvXH/mm3TUhNRePz6F1aDRZQaEO5IaBMZL5tM4Fsg7bY649PEcqW7+W
   w==;
X-CSE-ConnectionGUID: llqnxI+LQcCGRQQmWKToLQ==
X-CSE-MsgGUID: uNjwlglQQHqNZajALb+euw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67944587"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="67944587"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 20:06:55 -0800
X-CSE-ConnectionGUID: nmWCp0OqQQOWgJLaINxs2g==
X-CSE-MsgGUID: qhgqTwwSQ8qMcQ1q2oSf7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="203112031"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 16 Dec 2025 20:06:50 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVioK-0000000049k-1tgD;
	Wed, 17 Dec 2025 04:06:48 +0000
Date: Wed, 17 Dec 2025 12:06:40 +0800
From: kernel test robot <lkp@intel.com>
To: Ram Prakash Gupta <quic_rampraka@quicinc.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
	quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
	quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com,
	Sachin Gupta <quic_sachgupt@quicinc.com>
Subject: Re: [PATCH v6 5/5] mmc: sdhci-msm: Rectify DLL programming sequence
 for SDCC
Message-ID: <202512171135.hzSvlDE9-lkp@intel.com>
References: <20251215120009.3877889-6-quic_rampraka@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215120009.3877889-6-quic_rampraka@quicinc.com>

Hi Ram,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on krzk-dt/for-next v6.19-rc1]
[cannot apply to robh/for-next krzk/for-next ulf-hansson-mmc-mirror/next next-20251216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ram-Prakash-Gupta/dt-bindings-mmc-Add-dll-presets-values-for-HS400-and-HS200-modes/20251215-200814
base:   linus/master
patch link:    https://lore.kernel.org/r/20251215120009.3877889-6-quic_rampraka%40quicinc.com
patch subject: [PATCH v6 5/5] mmc: sdhci-msm: Rectify DLL programming sequence for SDCC
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251217/202512171135.hzSvlDE9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512171135.hzSvlDE9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512171135.hzSvlDE9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:193,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/module.h:12,
                    from drivers/mmc/host/sdhci-msm.c:8:
   drivers/mmc/host/sdhci-msm.c: In function 'sdhci_msm_configure_dll':
>> include/linux/kern_levels.h:5:25: warning: format '%u' expects argument of type 'unsigned int', but argument 4 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:484:25: note: in definition of macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:555:9: note: in expansion of macro 'printk'
     555 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:555:16: note: in expansion of macro 'KERN_ERR'
     555 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/mmc/host/sdhci-msm.c:930:33: note: in expansion of macro 'pr_err'
     930 |                                 pr_err("%s: %s: Non standard clk freq =%u\n",
         |                                 ^~~~~~
--
   In file included from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:193,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/module.h:12,
                    from sdhci-msm.c:8:
   sdhci-msm.c: In function 'sdhci_msm_configure_dll':
>> include/linux/kern_levels.h:5:25: warning: format '%u' expects argument of type 'unsigned int', but argument 4 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:484:25: note: in definition of macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:555:9: note: in expansion of macro 'printk'
     555 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:555:16: note: in expansion of macro 'KERN_ERR'
     555 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   sdhci-msm.c:930:33: note: in expansion of macro 'pr_err'
     930 |                                 pr_err("%s: %s: Non standard clk freq =%u\n",
         |                                 ^~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

