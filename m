Return-Path: <linux-arm-msm+bounces-75823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C09E2BB4488
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 17:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69DBB1C3909
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 15:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4030C188734;
	Thu,  2 Oct 2025 15:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eGldDdYu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93711175D53;
	Thu,  2 Oct 2025 15:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759418065; cv=none; b=aF/n2ki5hN0KyRsiqJpzjqK5fY+TDn4L3b3y+GAkxP3uWLQFXsVyz+WhLk69QbnUx2Xk/XWO/3n4jlpFza22yXi7DtosxkDJzpKcsxobmyKESW1xdsisdEr0swOn7B34XOekm1AsOTr78Bmmu8YYrPdMQhdXh4Isutw3xJj6hiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759418065; c=relaxed/simple;
	bh=sjIOPYdX4qJbJxV2DmMmA4rLEpf5cDAztd85PV9jfpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qu1jdunihrxX1T6TYUKKtFbk0ufo8S7G3hsAeGKIeAHbh+Od8+WFfTw9vIS6Tg95+mzO85cmxAG88kC5HKzKNnSqJN7uc1h/Ih5aYefeejUmV2l5ZVGHdUdIpX6rwg14o2EaGskf4yszHEiRdbD4/ARg2JVu7/EYTecJqTgncrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eGldDdYu; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759418063; x=1790954063;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sjIOPYdX4qJbJxV2DmMmA4rLEpf5cDAztd85PV9jfpo=;
  b=eGldDdYuZZXOG5MryYl21AiRX0PgbfmLRsUW+8DbFCokqIgeAKnejAZp
   aX7PsVbEmPMChHjpHJlg/0xr7vrsXVHH6qtlGykeCceB8FcdkbLAPACQG
   u5Po02OnTLfjOAyyDMu58t7iIMb9AJ7dEgaJ/4ghbuMLeP/R2mAUwi1L6
   /p3RlIm9ho1ym0RGYLaWe4Na1Rjo88IRbTBA37BmWPqMz72ILcWcXFq1z
   T2va8shKKXTbwNlCkNejpwzV9i5FCHd8SpPkzXzhzrQMwvZjYzEkzIDLX
   SHqegAfJVymBxeVGXe0J9G8VNbK8PoN4QPccutpoCJF377JePg8kPrjSs
   g==;
X-CSE-ConnectionGUID: HtyZZzlPQ9yvWccXBMYvWw==
X-CSE-MsgGUID: rBL2pvBOQwWcJ8dYiBYgOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="60743551"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="60743551"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 08:14:23 -0700
X-CSE-ConnectionGUID: 5BV9pExnSuuVrrJk0cMXww==
X-CSE-MsgGUID: V0+SX+9NTgi6DfL+S4+8uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="178339629"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Oct 2025 08:14:18 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4L0Z-0003tF-1P;
	Thu, 02 Oct 2025 15:14:15 +0000
Date: Thu, 2 Oct 2025 23:13:38 +0800
From: kernel test robot <lkp@intel.com>
To: Ram Prakash Gupta <quic_rampraka@quicinc.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
	quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
	quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com,
	Sachin Gupta <quic_sachgupt@quicinc.com>
Subject: Re: [PATCH v4 4/4] mmc: sdhci-msm: Rectify DLL programming sequence
 for SDCC
Message-ID: <202510022258.5n14WOx5-lkp@intel.com>
References: <20250929113515.26752-5-quic_rampraka@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929113515.26752-5-quic_rampraka@quicinc.com>

Hi Ram,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk-dt/for-next linus/master ulf-hansson-mmc-mirror/next v6.17 next-20250929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ram-Prakash-Gupta/dt-bindings-mmc-Add-dll-hsr-list-for-HS400-and-HS200-modes/20250929-193817
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250929113515.26752-5-quic_rampraka%40quicinc.com
patch subject: [PATCH v4 4/4] mmc: sdhci-msm: Rectify DLL programming sequence for SDCC
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20251002/202510022258.5n14WOx5-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251002/202510022258.5n14WOx5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510022258.5n14WOx5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/s390/include/asm/bug.h:69,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from arch/s390/include/asm/cmpxchg.h:11,
                    from arch/s390/include/asm/atomic.h:16,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/s390/include/asm/bitops.h:75,
                    from include/linux/bitops.h:67,
                    from arch/s390/include/asm/machine.h:25,
                    from arch/s390/include/asm/lowcore.h:13,
                    from arch/s390/include/asm/current.h:13,
                    from arch/s390/include/asm/preempt.h:5,
                    from include/linux/preempt.h:79,
                    from arch/s390/include/asm/timex.h:13,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/mmc/host/sdhci-msm.c:8:
   drivers/mmc/host/sdhci-msm.c: In function 'sdhci_msm_configure_dll':
>> include/linux/kern_levels.h:5:25: warning: format '%u' expects argument of type 'unsigned int', but argument 4 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:486:25: note: in definition of macro 'printk_index_wrap'
     486 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:557:9: note: in expansion of macro 'printk'
     557 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:557:16: note: in expansion of macro 'KERN_ERR'
     557 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/mmc/host/sdhci-msm.c:927:33: note: in expansion of macro 'pr_err'
     927 |                                 pr_err("%s: %s: Non standard clk freq =%u\n",
         |                                 ^~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

