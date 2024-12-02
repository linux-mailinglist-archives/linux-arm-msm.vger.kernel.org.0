Return-Path: <linux-arm-msm+bounces-39925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 678A99E07E7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 17:05:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2762A281134
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 16:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1AB13CA8D;
	Mon,  2 Dec 2024 16:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RTVTybDS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCCF13AA2D;
	Mon,  2 Dec 2024 16:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733155534; cv=none; b=MJr//gGo0Ze6XnJRAa6XyHVa/dJQFVjBpi9FJXV/tinTxQk0jed8utIzEEaEsAfw8P77Kcv36NpG4w9dfrXNF+1wBnCFjcRs9j3Jv1XpXD16ouyLFFXQHGG5RjbI0wF2BaCZ6Nee6Mlv0Lkf6cRhO+rnSOvrN3FkjlpzJPS/LLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733155534; c=relaxed/simple;
	bh=N4GVqKG6ryMn/YmqdxQQG9If52olhBnmsr3/7FW/idk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKnHKyPdrVdkqUKbEJAzixQP41AcHDszWrxdE7BWXwJ8kHzaoKqUhRMDqxopZLzRRWYr+ZFJvodbgJuNO+QQxmnkw90jO8gxAFLS4p2156Tn+1WdYxHxUrMn2Jq55jyc3HoNfh0EruLdQJ56+eBUeIaY6BvrUXEAD5X+fldQcP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RTVTybDS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733155533; x=1764691533;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N4GVqKG6ryMn/YmqdxQQG9If52olhBnmsr3/7FW/idk=;
  b=RTVTybDSp30UETBzhodxYOJXHx0/HhvgRuh/NUNjWhHKREMdHaDDtN5I
   WIB4bjBxByFb9fclYWx4YJjrwVRgeBmOWmT0pBL05EedFL2IQziaOyald
   i70jYySytZMWhe8yYjLjj9eTut08NSsWhy4Sj7OaEPdrH9zzweUqyB2Ju
   vDVUI0Jav1HOondcrrD2Jy/SNCmJz+tSrSBKhVaIY6ohWifr2U0LJEsZ0
   mXmZ7TdW3JWBWMKkSO4NCpSSM14o1vuqDafvw2AonkA3DDFV6SUJjO5q3
   3Iu9Nlq96+jioI+DFSzqa0DUMdrrvqhY53aeKLYqwo3Wdb0XdTKeO7Fgl
   Q==;
X-CSE-ConnectionGUID: F2eu/gq6SJ6PYy/sCqzDJw==
X-CSE-MsgGUID: DddrlT5IQAKNOMbqw1mIpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="37271852"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="37271852"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 08:05:28 -0800
X-CSE-ConnectionGUID: pyzhsdC4QD+rv1Nvv4YSHw==
X-CSE-MsgGUID: ynSyih34TG299Jjh7wmYOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="93241795"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 02 Dec 2024 08:05:24 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI8vJ-0002Yz-0R;
	Mon, 02 Dec 2024 16:05:21 +0000
Date: Tue, 3 Dec 2024 00:05:15 +0800
From: kernel test robot <lkp@intel.com>
To: Sachin Gupta <quic_sachgupt@quicinc.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
	quic_nguyenb@quicinc.com, quic_bhaskarv@quicinc.com,
	quic_mapa@quicinc.com, quic_narepall@quicinc.com,
	quic_nitirawa@quicinc.com, quic_rampraka@quicinc.com,
	quic_sachgupt@quicinc.com, quic_sartgarg@quicinc.com
Subject: Re: [PATCH] mmc: sdhci-msm: Command Queue (CQ) Register changes for
 v5.0
Message-ID: <202412022356.OfhUSoyq-lkp@intel.com>
References: <20241202085631.13468-1-quic_sachgupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202085631.13468-1-quic_sachgupt@quicinc.com>

Hi Sachin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on ulf-hansson-mmc-mirror/next v6.13-rc1 next-20241128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sachin-Gupta/mmc-sdhci-msm-Command-Queue-CQ-Register-changes-for-v5-0/20241202-170044
base:   linus/master
patch link:    https://lore.kernel.org/r/20241202085631.13468-1-quic_sachgupt%40quicinc.com
patch subject: [PATCH] mmc: sdhci-msm: Command Queue (CQ) Register changes for v5.0
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241202/202412022356.OfhUSoyq-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412022356.OfhUSoyq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412022356.OfhUSoyq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mmc/host/sdhci-msm.c:8:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2223:
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
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mmc/host/sdhci-msm.c:2289:17: warning: variable 'cq_host' is uninitialized when used here [-Wuninitialized]
    2289 |                 readl_relaxed(cq_host->mmio + CQHCI_VENDOR_CFG + offset));
         |                               ^~~~~~~
   drivers/mmc/host/sdhci-msm.c:2257:61: note: expanded from macro 'CQHCI_DUMP'
    2257 |         pr_err("%s: " DRV_NAME ": " f, mmc_hostname(host->mmc), ## x)
         |                                                                    ^
   include/linux/printk.h:544:33: note: expanded from macro 'pr_err'
     544 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                        ^~~~~~~~~~~
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   drivers/mmc/host/sdhci-msm.c:2264:28: note: initialize the variable 'cq_host' to silence this warning
    2264 |         struct cqhci_host *cq_host;
         |                                   ^
         |                                    = NULL
   5 warnings generated.


vim +/cq_host +2289 drivers/mmc/host/sdhci-msm.c

  2250	
  2251	#define DRIVER_NAME "sdhci_msm"
  2252	#define SDHCI_MSM_DUMP(f, x...) \
  2253		pr_err("%s: " DRIVER_NAME ": " f, mmc_hostname(host->mmc), ## x)
  2254	
  2255	#define DRV_NAME "cqhci"
  2256	#define CQHCI_DUMP(f, x...) \
  2257		pr_err("%s: " DRV_NAME ": " f, mmc_hostname(host->mmc), ## x)
  2258	
  2259	static void sdhci_msm_dump_vendor_regs(struct sdhci_host *host)
  2260	{
  2261		struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
  2262		struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
  2263		const struct sdhci_msm_offset *msm_offset = msm_host->offset;
  2264		struct cqhci_host *cq_host;
  2265		int offset = 0;
  2266	
  2267		if (msm_host->cqhci_offset_changed)
  2268			offset = CQE_V5_VENDOR_CFG;
  2269	
  2270		SDHCI_MSM_DUMP("----------- VENDOR REGISTER DUMP -----------\n");
  2271	
  2272		SDHCI_MSM_DUMP(
  2273				"DLL sts: 0x%08x | DLL cfg:  0x%08x | DLL cfg2: 0x%08x\n",
  2274			readl_relaxed(host->ioaddr + msm_offset->core_dll_status),
  2275			readl_relaxed(host->ioaddr + msm_offset->core_dll_config),
  2276			readl_relaxed(host->ioaddr + msm_offset->core_dll_config_2));
  2277		SDHCI_MSM_DUMP(
  2278				"DLL cfg3: 0x%08x | DLL usr ctl:  0x%08x | DDR cfg: 0x%08x\n",
  2279			readl_relaxed(host->ioaddr + msm_offset->core_dll_config_3),
  2280			readl_relaxed(host->ioaddr + msm_offset->core_dll_usr_ctl),
  2281			readl_relaxed(host->ioaddr + msm_offset->core_ddr_config));
  2282		SDHCI_MSM_DUMP(
  2283				"Vndr func: 0x%08x | Vndr func2 : 0x%08x Vndr func3: 0x%08x\n",
  2284			readl_relaxed(host->ioaddr + msm_offset->core_vendor_spec),
  2285			readl_relaxed(host->ioaddr +
  2286				msm_offset->core_vendor_spec_func2),
  2287			readl_relaxed(host->ioaddr + msm_offset->core_vendor_spec3));
  2288		CQHCI_DUMP("Vendor cfg 0x%08x\n",
> 2289			readl_relaxed(cq_host->mmio + CQHCI_VENDOR_CFG + offset));
  2290	}
  2291	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

