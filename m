Return-Path: <linux-arm-msm+bounces-41321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B329EB3CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 15:45:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDA07281F21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 14:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB2A1A08C5;
	Tue, 10 Dec 2024 14:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JdCZz+k/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9628513D8B1;
	Tue, 10 Dec 2024 14:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733841949; cv=none; b=KVEEeZF1OQHPm+2WII9gfsEmBXnDukW0y6dyRJN9/EpcBuZIBpQjsXkfXkComcx6x80sixwZC41V7tVLnvAacu19QPh8WetHLysq61ogQxU/IUiMuYo1XkEACaU2PiyJ0z5iO3kkF6b5ZFXk/c335AFANjXSeQjr8vMuScCXER4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733841949; c=relaxed/simple;
	bh=ACWubjbg/0OAMr73e1vjVeOan2O+yI5lU5+DUnXaa1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lrx74cwc3CXLIKeHGChz/4e4i3bP36geLqK+pCxg2D54gXkn929L4jHOqOmfDpBcNnvfbh0+CWuZOatM4y/fbVomvYqQsE23PXK/2RVpRBkUMUKNT012pXY38OSqeC7TU08H4KdXYz2SYNes2MZ4C4uSUASkJOy47nWTrS/Fkkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JdCZz+k/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733841948; x=1765377948;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ACWubjbg/0OAMr73e1vjVeOan2O+yI5lU5+DUnXaa1c=;
  b=JdCZz+k/WnhFWnypVo1j2iyejU/rM22LVmSmIW3qMqRej6cecVRIO6bQ
   CRQa5gPozX0uzQ/ztd02o4InMNwVr2i7icKZZWw4YsLUw5GsEtvHB9nTd
   3GTd3XU7d/UV7P10ev6+IX0NpDHretKPXVzydlW1e7R5OlQAwASRaDJZh
   6E0LBhOWqJpBOpNptrBSE0Gql7HLdP4lvRQJmv+ER8JAxg6mjUlLIhwMz
   LlV8iOrjy7oGxsedw34zQG/06DHwIpQubZS2oIQg5TdH1c2B9rflG3qAl
   eiNeNNCWc6mb7MTTVFZMg5hvSIO/4pDpCa7oiIi454jyV0TPQz6K2FJGQ
   A==;
X-CSE-ConnectionGUID: ebPGIQJiRpCB4MKbLvdA0g==
X-CSE-MsgGUID: dObyvy4WRN2C4oHue82xJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="33918487"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="33918487"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 06:45:47 -0800
X-CSE-ConnectionGUID: qT8wLg0PSEW6xc/uf1vFWA==
X-CSE-MsgGUID: mHHXr/tqQRG98djWwKiR/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="95904071"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Dec 2024 06:45:44 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tL1Ub-0005fh-23;
	Tue, 10 Dec 2024 14:45:41 +0000
Date: Tue, 10 Dec 2024 22:45:17 +0800
From: kernel test robot <lkp@intel.com>
To: Douglas Anderson <dianders@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Julius Werner <jwerner@chromium.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Roxana Bradescu <roxabee@google.com>,
	bjorn.andersson@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: errata: Add QCOM_KRYO_5XX_GOLD to the
 spectre_bhb_k24_list
Message-ID: <202412102250.hPlsx2c8-lkp@intel.com>
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
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20241210/202412102250.hPlsx2c8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412102250.hPlsx2c8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412102250.hPlsx2c8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/cache.h:43,
                    from include/linux/cache.h:6,
                    from include/linux/jiffies.h:5,
                    from include/linux/ktime.h:25,
                    from include/linux/timer.h:6,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:10,
                    from arch/arm64/kernel/proton-pack.c:21:
   arch/arm64/kernel/proton-pack.c: In function 'spectre_bhb_loop_affected':
>> arch/arm64/kernel/proton-pack.c:870:43: error: 'MIDR_QCOM_KRYO_5XX_GOLD' undeclared (first use in this function); did you mean 'MIDR_QCOM_KRYO_4XX_GOLD'?
     870 |                         MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_5XX_GOLD),
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/cputype.h:251:26: note: in definition of macro 'MIDR_RANGE'
     251 |                 .model = m,                                     \
         |                          ^
   arch/arm64/kernel/proton-pack.c:870:25: note: in expansion of macro 'MIDR_ALL_VERSIONS'
     870 |                         MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_5XX_GOLD),
         |                         ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:870:43: note: each undeclared identifier is reported only once for each function it appears in
     870 |                         MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_5XX_GOLD),
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/cputype.h:251:26: note: in definition of macro 'MIDR_RANGE'
     251 |                 .model = m,                                     \
         |                          ^
   arch/arm64/kernel/proton-pack.c:870:25: note: in expansion of macro 'MIDR_ALL_VERSIONS'
     870 |                         MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_5XX_GOLD),
         |                         ^~~~~~~~~~~~~~~~~


vim +870 arch/arm64/kernel/proton-pack.c

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

