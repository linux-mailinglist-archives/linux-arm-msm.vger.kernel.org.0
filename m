Return-Path: <linux-arm-msm+bounces-30348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 244F6967285
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 17:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 458871C20FC3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 15:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31923CF4F;
	Sat, 31 Aug 2024 15:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X1RSjuOU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DE3383A9;
	Sat, 31 Aug 2024 15:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725119477; cv=none; b=s3VvK9lSHOs+VNMrBK7cq4xwzeop0wuTaP2t3Td3NUaYxvtSc6hka+3a231uS+7gxncsNxE9RacT7o5DiQzn5HWGKUGj8et7nptryC2ZSelGHn5gCdIrWjy3+TrF9ZcWGw8Bwm88NQSKjvTjQTEpoO+zzSmdLabNpXFQY3feE0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725119477; c=relaxed/simple;
	bh=0b1qxAJPjEhODDylhJjvhEInFQ4MHUnaA5A/2CMwxrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7fLy2v4Pd+7bXV05XFLsjsXf+XAm9PogohAgnyPSaNvh37WBufSLNOnCW41+zDzyD4UDgnvCtcEFhmUn65ZwsblX452EDIY/9rQFp/4pH1ecJ+wUinNpfKoh/dHgx4paXQnBPCASWZyTS0Qh4dLQpFaVpiA0XVnGMvEhwKBac0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X1RSjuOU; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725119476; x=1756655476;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0b1qxAJPjEhODDylhJjvhEInFQ4MHUnaA5A/2CMwxrc=;
  b=X1RSjuOUcBJR48Orof2UIqJbi36hAwhm3nvrvveilHPqTx42Ry3sJnCh
   nMsTxd7WTPRIiMpj02hL4ys54h0ozjD4mWvKkaBacCuermoEe/e8CQ2BR
   CXAWDjV+jF21OArtp4JP6s0NRK+akkqmOkcds3O52p9xT78NtlnCBu9BF
   LqLFovt1DHLCQhuSh2qwbSCeBiGpWaovkIm9dgtk0p8E6klp09JPs5pP2
   fQv3XJMHMqIRfz01Dal/+DOu3NPlhru34yTjf+HDJAn76SD2m2sFQZJCm
   SNxSEBf6sXa8UdtgWDN1EZMeTIQkZiFb/VvTZklOv9701SBf+nVbKSCYQ
   w==;
X-CSE-ConnectionGUID: QiS/D3s0RQ+NRSzzodmH5g==
X-CSE-MsgGUID: PDQ+yYhTS8K9D3+NxovgOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="34365936"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="34365936"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 08:51:15 -0700
X-CSE-ConnectionGUID: 5fgZ/GX4R4GNMAK/TFeNIQ==
X-CSE-MsgGUID: Raew2RKdRYel6mfqLwjrGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="64004377"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 31 Aug 2024 08:51:11 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skQNZ-0002t6-0Y;
	Sat, 31 Aug 2024 15:51:09 +0000
Date: Sat, 31 Aug 2024 23:51:06 +0800
From: kernel test robot <lkp@intel.com>
To: songchai <quic_songchai@quicinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	songchai <quic_songchai@quicinc.com>, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 2/7] coresight: Add coresight TGU driver
Message-ID: <202408312341.AgielsZe-lkp@intel.com>
References: <20240830092311.14400-3-quic_songchai@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830092311.14400-3-quic_songchai@quicinc.com>

Hi songchai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.11-rc5 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/songchai/dt-bindings-arm-Add-support-for-Coresight-TGU-trace/20240830-172716
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240830092311.14400-3-quic_songchai%40quicinc.com
patch subject: [PATCH v1 2/7] coresight: Add coresight TGU driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240831/202408312341.AgielsZe-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 46fe36a4295f05d5d3731762e31fc4e6e99863e9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408312341.AgielsZe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408312341.AgielsZe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/hwtracing/coresight/coresight-tgu.c:6:
   In file included from include/linux/amba/bus.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/hwtracing/coresight/coresight-tgu.c:194:9: warning: missing field 'data' initializer [-Wmissing-field-initializers]
     194 |         { 0, 0 },
         |                ^
   6 warnings generated.


vim +/data +194 drivers/hwtracing/coresight/coresight-tgu.c

   187	
   188	static struct amba_id tgu_ids[] = {
   189		{
   190			.id = 0x0003b999,
   191			.mask = 0x0003ffff,
   192			.data = "TGU",
   193		},
 > 194		{ 0, 0 },
   195	};
   196	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

