Return-Path: <linux-arm-msm+bounces-41322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A089EB3CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 15:46:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73CC516654E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 14:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A2C1A08C5;
	Tue, 10 Dec 2024 14:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c5cd9jzt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9192219ADA2;
	Tue, 10 Dec 2024 14:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733842009; cv=none; b=uiV24HGyZO2OGALsLEyebBuHR6cC5LibDMXtINLDDFIb4aDrA3aRMuBphZnRAN4XX72axZ6s/uwXF44U3v3SzIaZBEw2xf71vLzCs9euc+NiRw6JHReqR5BJrNmR/2Rtmh7Nowcu7uMy1NsIypNZcF+VS6Y85tLd9jrp82laMz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733842009; c=relaxed/simple;
	bh=Do7dwzzjllAqqtvBa73eePMIDuR9IMn0/w3h50zwnJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iiiPaHPtGzVPeCKcW2VhBy1nHzsYqyKrqRwRpxooDShnLPPf5cpl/cnDmXqiOuOARW9QxQMP8P3y7hg7MibfwSyXLuRo3wYwc6ZCtw+2n0Qhkk+GvRk1MYm8J5qwODu6EPFSDZjCvSIpk8/JbjOqnMRVSvKo+T64vkNpo125Rvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c5cd9jzt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733842008; x=1765378008;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Do7dwzzjllAqqtvBa73eePMIDuR9IMn0/w3h50zwnJw=;
  b=c5cd9jztjX3CZLQY2Dt4fZP7Ahl7coHY/r+QqruIA3qvQU58UPQUJWhU
   C/qZjXmj/wcMf3O43FicwuG1kO76AohpWBhF8jyzPO7fP8liOrmM2ZjRn
   tTXnyljnwkipRPujyXZgrkMOptHFIfS1yLsrlFc68lk4iMGi7fGw27n6W
   LBIlVn3WiQ7T+Z4nZo+pu/78lKHMI9VQahv8nReUTtqvOD0Ad6qN6uaF8
   O8skTB+EefUkTIHhZJKgYdcSzfQbkWlq1WwMx/BHVbGI3g3mpf31h32v+
   bfi1bZOBvfPZtFd+XxR5UzQ0VxCCcxzunLj2naWXhDOVrG98PARohv4Fx
   A==;
X-CSE-ConnectionGUID: fW68VaGjTROd4e281rCX9A==
X-CSE-MsgGUID: Kwbdr4/KTnuzfD7kpSk9bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="33918595"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="33918595"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 06:46:47 -0800
X-CSE-ConnectionGUID: 8UXF8N9lQmy0iqLdrqk76A==
X-CSE-MsgGUID: dgzL6dt7ThijvCzrvWlGLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="95264819"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Dec 2024 06:46:44 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tL1VZ-0005fp-2N;
	Tue, 10 Dec 2024 14:46:41 +0000
Date: Tue, 10 Dec 2024 22:45:42 +0800
From: kernel test robot <lkp@intel.com>
To: Douglas Anderson <dianders@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Julius Werner <jwerner@chromium.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Roxana Bradescu <roxabee@google.com>,
	bjorn.andersson@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: errata: Add QCOM_KRYO_5XX_GOLD to the
 spectre_bhb_k24_list
Message-ID: <202412102224.bmEeK15u-lkp@intel.com>
References: <20241209094310.5.I41e227ed809ea607114027209b57d02dc0e98384@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209094310.5.I41e227ed809ea607114027209b57d02dc0e98384@changeid>

Hi Douglas,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on arm-perf/for-next/perf kvmarm/next soc/for-next arm/for-next arm/fixes linus/master v6.13-rc2 next-20241210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Douglas-Anderson/arm64-errata-Add-QCOM_KRYO_4XX_GOLD-to-the-spectre_bhb_k24_list/20241210-014833
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20241209094310.5.I41e227ed809ea607114027209b57d02dc0e98384%40changeid
patch subject: [PATCH 5/6] arm64: errata: Add QCOM_KRYO_5XX_GOLD to the spectre_bhb_k24_list
config: arm64-randconfig-002-20241210 (https://download.01.org/0day-ci/archive/20241210/202412102224.bmEeK15u-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412102224.bmEeK15u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412102224.bmEeK15u-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/proton-pack.c:21:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
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
>> arch/arm64/kernel/proton-pack.c:870:22: error: use of undeclared identifier 'MIDR_QCOM_KRYO_5XX_GOLD'
     870 |                         MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_5XX_GOLD),
         |                                           ^
   4 warnings and 1 error generated.


vim +/MIDR_QCOM_KRYO_5XX_GOLD +870 arch/arm64/kernel/proton-pack.c

   843	
   844	/*
   845	 * This must be called with SCOPE_LOCAL_CPU for each type of CPU, before any
   846	 * SCOPE_SYSTEM call will give the right answer.
   847	 */
   848	u8 spectre_bhb_loop_affected(int scope)
   849	{
   850		u8 k = 0;
   851		static u8 max_bhb_k;
   852	
   853		if (scope == SCOPE_LOCAL_CPU) {
   854			static const struct midr_range spectre_bhb_k32_list[] = {
   855				MIDR_ALL_VERSIONS(MIDR_CORTEX_A78),
   856				MIDR_ALL_VERSIONS(MIDR_CORTEX_A78AE),
   857				MIDR_ALL_VERSIONS(MIDR_CORTEX_A78C),
   858				MIDR_ALL_VERSIONS(MIDR_CORTEX_X1),
   859				MIDR_ALL_VERSIONS(MIDR_CORTEX_A710),
   860				MIDR_ALL_VERSIONS(MIDR_CORTEX_X2),
   861				MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
   862				MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
   863				{},
   864			};
   865			static const struct midr_range spectre_bhb_k24_list[] = {
   866				MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
   867				MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
   868				MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
   869				MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_GOLD),
 > 870				MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_5XX_GOLD),
   871				{},
   872			};
   873			static const struct midr_range spectre_bhb_k11_list[] = {
   874				MIDR_ALL_VERSIONS(MIDR_AMPERE1),
   875				{},
   876			};
   877			static const struct midr_range spectre_bhb_k8_list[] = {
   878				MIDR_ALL_VERSIONS(MIDR_CORTEX_A72),
   879				MIDR_ALL_VERSIONS(MIDR_CORTEX_A57),
   880				{},
   881			};
   882	
   883			if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k32_list))
   884				k = 32;
   885			else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k24_list))
   886				k = 24;
   887			else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k11_list))
   888				k = 11;
   889			else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k8_list))
   890				k =  8;
   891	
   892			max_bhb_k = max(max_bhb_k, k);
   893		} else {
   894			k = max_bhb_k;
   895		}
   896	
   897		return k;
   898	}
   899	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

