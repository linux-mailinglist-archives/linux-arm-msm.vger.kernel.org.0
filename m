Return-Path: <linux-arm-msm+bounces-41350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF049EB759
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 18:03:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F139162DC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 17:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02EBC233D96;
	Tue, 10 Dec 2024 17:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z7B3ViMC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1D7230D30;
	Tue, 10 Dec 2024 17:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850193; cv=none; b=b6DQ9ZtQfaTrgfcA6QKhq7IYi1sd2yIGlcD/HraQklUS/EuKdjQnIyk/N2X24q/5jOBc8TSIakkMtrEXzaxaRcPz62O7L9ilKRYJpgRxe707juMUXpbVMuvLhg1m7aKg4tcHPHURlVPLv3NZGJDrFDB1wyHQvpKg9cKuVfhrAqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850193; c=relaxed/simple;
	bh=f1uDp17DDJ/J/DvndkER4E+QcGCcpN2FmP6SxQ+irRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LWXgx7rZfSZF4snrBQvHXQme7HRgyCR4nLqSpqbrHi+E+jwvL5X4NWHRdeWSy3t+ZY6KjEa5Y5GHi4dd036SuXLUOuT4vJxG6BLMh/ySJ+HmhooiPoOygL1YKlWmSwof3iyWLefNoLvVZcZC6qpafV4jtAyjJOdMYD1y4sODQLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z7B3ViMC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733850193; x=1765386193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f1uDp17DDJ/J/DvndkER4E+QcGCcpN2FmP6SxQ+irRw=;
  b=Z7B3ViMC3YUGOYmK+ns1QEtp8qugHYx3eSOrISuvvok/d/tekUR+o8A1
   xuI93Z2ft7nhojERE4P42Q6ch69zXKVbuHaFuUzsGvtd9bjaYge+yimyk
   Wh0x65xT6IUYM9AncIEFWPlmEvaNHbLNLWtUzKs6C4P0GJqoSOENCLrcX
   U628c3OGqHk5mUCRnzVxJHFYa/4pGLw4fcYCZPKbEBz+7WIgoqf6KBERG
   ajYQhQDJeE8di8g2s47Ob0JiSW7kQRRWEM6ov/NS/tpW2hC1vxBKz8nH2
   CIOGWn6CuMLvACmW6KiRADRivYneVQuFhN3o1mwNJ2Q5VImzY5JiETvgm
   w==;
X-CSE-ConnectionGUID: 8fdzjVx7ScuyiOYf6wx6kw==
X-CSE-MsgGUID: MTjn5NsWSMqkE0ED+5ye+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34089286"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; 
   d="scan'208";a="34089286"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 09:03:12 -0800
X-CSE-ConnectionGUID: G85RQGGIS3SYVxkvj13IyA==
X-CSE-MsgGUID: 7A5EG28lTrOQUe4ZG1m6nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; 
   d="scan'208";a="95333830"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Dec 2024 09:03:08 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tL3da-0005nJ-0f;
	Tue, 10 Dec 2024 17:03:06 +0000
Date: Wed, 11 Dec 2024 01:02:12 +0800
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
Subject: Re: [PATCH 6/6] arm64: errata: Add QCOM_KRYO_6XX_GOLD/PRIME to the
 spectre_bhb_k32_list
Message-ID: <202412110032.Sku0iZvD-lkp@intel.com>
References: <20241209094310.6.I722621804be859e4ae4b7479ce191c5e3367b37c@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209094310.6.I722621804be859e4ae4b7479ce191c5e3367b37c@changeid>

Hi Douglas,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on arm-perf/for-next/perf kvmarm/next soc/for-next arm/for-next arm/fixes linus/master v6.13-rc2 next-20241210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Douglas-Anderson/arm64-errata-Add-QCOM_KRYO_4XX_GOLD-to-the-spectre_bhb_k24_list/20241210-014833
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20241209094310.6.I722621804be859e4ae4b7479ce191c5e3367b37c%40changeid
patch subject: [PATCH 6/6] arm64: errata: Add QCOM_KRYO_6XX_GOLD/PRIME to the spectre_bhb_k32_list
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20241211/202412110032.Sku0iZvD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241211/202412110032.Sku0iZvD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412110032.Sku0iZvD-lkp@intel.com/

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
>> arch/arm64/kernel/proton-pack.c:863:43: error: 'MIDR_QCOM_KRYO_6XX_GOLD' undeclared (first use in this function); did you mean 'MIDR_QCOM_KRYO_4XX_GOLD'?
     863 |                         MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_6XX_GOLD),
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/cputype.h:251:26: note: in definition of macro 'MIDR_RANGE'
     251 |                 .model = m,                                     \
         |                          ^
   arch/arm64/kernel/proton-pack.c:863:25: note: in expansion of macro 'MIDR_ALL_VERSIONS'
     863 |                         MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_6XX_GOLD),
         |                         ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:863:43: note: each undeclared identifier is reported only once for each function it appears in
     863 |                         MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_6XX_GOLD),
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/cputype.h:251:26: note: in definition of macro 'MIDR_RANGE'
     251 |                 .model = m,                                     \
         |                          ^
   arch/arm64/kernel/proton-pack.c:863:25: note: in expansion of macro 'MIDR_ALL_VERSIONS'
     863 |                         MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_6XX_GOLD),
         |                         ^~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/proton-pack.c:864:43: error: 'MIDR_QCOM_KRYO_6XX_PRIME' undeclared (first use in this function); did you mean 'MIDR_QCOM_KRYO_3XX_SILVER'?
     864 |                         MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_6XX_PRIME),
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/cputype.h:251:26: note: in definition of macro 'MIDR_RANGE'
     251 |                 .model = m,                                     \
         |                          ^
   arch/arm64/kernel/proton-pack.c:864:25: note: in expansion of macro 'MIDR_ALL_VERSIONS'
     864 |                         MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_6XX_PRIME),
         |                         ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:872:43: error: 'MIDR_QCOM_KRYO_5XX_GOLD' undeclared (first use in this function); did you mean 'MIDR_QCOM_KRYO_4XX_GOLD'?
     872 |                         MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_5XX_GOLD),
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/cputype.h:251:26: note: in definition of macro 'MIDR_RANGE'
     251 |                 .model = m,                                     \
         |                          ^
   arch/arm64/kernel/proton-pack.c:872:25: note: in expansion of macro 'MIDR_ALL_VERSIONS'
     872 |                         MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_5XX_GOLD),
         |                         ^~~~~~~~~~~~~~~~~


vim +863 arch/arm64/kernel/proton-pack.c

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
 > 863				MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_6XX_GOLD),
 > 864				MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_6XX_PRIME),
   865				{},
   866			};
   867			static const struct midr_range spectre_bhb_k24_list[] = {
   868				MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
   869				MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
   870				MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
   871				MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_GOLD),
   872				MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_5XX_GOLD),
   873				{},
   874			};
   875			static const struct midr_range spectre_bhb_k11_list[] = {
   876				MIDR_ALL_VERSIONS(MIDR_AMPERE1),
   877				{},
   878			};
   879			static const struct midr_range spectre_bhb_k8_list[] = {
   880				MIDR_ALL_VERSIONS(MIDR_CORTEX_A72),
   881				MIDR_ALL_VERSIONS(MIDR_CORTEX_A57),
   882				{},
   883			};
   884	
   885			if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k32_list))
   886				k = 32;
   887			else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k24_list))
   888				k = 24;
   889			else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k11_list))
   890				k = 11;
   891			else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k8_list))
   892				k =  8;
   893	
   894			max_bhb_k = max(max_bhb_k, k);
   895		} else {
   896			k = max_bhb_k;
   897		}
   898	
   899		return k;
   900	}
   901	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

