Return-Path: <linux-arm-msm+bounces-28134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0B794B4CE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 04:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF541281597
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 02:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580AFC8D7;
	Thu,  8 Aug 2024 02:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="keoa00L0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53436A23;
	Thu,  8 Aug 2024 02:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723082677; cv=none; b=BBvaU1nWzXl/IEuiL4Ujz8c3OXe2zLa4zFsRiavfSRLw+91cp9ud+xgLoODNvTG6SAOl3fpDjG5KJHrDmXCSFJn4J1zAVL97+3akpdL3scd3oPv1Gpc6d4S608UpEKBYZXIc1DWUDDKQ/9kbJwD9skfZXdFYmXc0GD/sCpzDJdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723082677; c=relaxed/simple;
	bh=NWRjkgUcEoikx+CjJEuOJ/1jLphaaJ5AIVnJStsdFPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DeSnSRzShrxPF5K6ex7BbCeU0T77jZ9Pivx9/ldkQVHeZrvL1Xr75I2H6/21sPOnUcM9nyoWv9ECwgmjkk7NK+725L9VUDmqQc4oUA32USQSUE5z/HVGz/hSEAcImE4SvXYjBFxxxYTk9qgMoAyWbi86MjIRPgq3aKTDaOKXiPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=keoa00L0; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723082675; x=1754618675;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NWRjkgUcEoikx+CjJEuOJ/1jLphaaJ5AIVnJStsdFPQ=;
  b=keoa00L0qj0KJ/a2OJYlvh42SihtvKj11cUX88lHHdAQHnDA171dSl3E
   mbdWugTPmV1LRCKxdE4TvMPgxC/NnTC2PhklHhFeKrJ7R0kZcITo4wptv
   7xBZmRr4NRVIvMZ4iGGS8tYK+uPGq1hsG/rTVnvn7RN6OLrwTKXw3wyfL
   rpXtbLrc3SZC8Z5tFg0ygE4z6nkujd1Vga88oNM7OP+tJstQMQaTdxZ76
   BzhPGGTFnuamSAQzeBrDDzGw6M/QD3GD232Il0XdII1MJUwJLTpsfetaT
   VNRAvOToAEC1nN7zRdF2lblY4QcoIacb1e/KHp4hXzEbNZf9udxe1c99T
   A==;
X-CSE-ConnectionGUID: pb0TigX0RSOcLBsjhrtuBw==
X-CSE-MsgGUID: q7JD2BMJStiiWMVhZx12HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="38644311"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="38644311"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 19:04:35 -0700
X-CSE-ConnectionGUID: +92kcf7vQJClyAIZfdLVog==
X-CSE-MsgGUID: CzK14wvORn+JNOSsSneZow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="61899686"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 07 Aug 2024 19:04:30 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbsVv-0005rA-1B;
	Thu, 08 Aug 2024 02:04:27 +0000
Date: Thu, 8 Aug 2024 10:03:57 +0800
From: kernel test robot <lkp@intel.com>
To: Mao Jinlong <quic_jinlmao@quicinc.com>,
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
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] coresight: Add remote etm support
Message-ID: <202408080922.hFC9XFAq-lkp@intel.com>
References: <20240807071054.12742-3-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807071054.12742-3-quic_jinlmao@quicinc.com>

Hi Mao,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.11-rc2 next-20240807]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mao-Jinlong/dt-bindings-arm-Add-qcom-inst-id-for-remote-etm/20240807-151315
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240807071054.12742-3-quic_jinlmao%40quicinc.com
patch subject: [PATCH v2 2/2] coresight: Add remote etm support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240808/202408080922.hFC9XFAq-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408080922.hFC9XFAq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408080922.hFC9XFAq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hwtracing/coresight/coresight-remote-etm.c:18:
   In file included from include/linux/coresight.h:9:
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
>> drivers/hwtracing/coresight/coresight-remote-etm.c:298:20: error: incompatible function pointer types initializing 'void (*)(struct platform_device *)' with an expression of type 'int (struct platform_device *)' [-Wincompatible-function-pointer-types]
     298 |         .remove         = remote_etm_remove,
         |                           ^~~~~~~~~~~~~~~~~
   5 warnings and 1 error generated.


vim +298 drivers/hwtracing/coresight/coresight-remote-etm.c

   295	
   296	static struct platform_driver remote_etm_driver = {
   297		.probe          = remote_etm_probe,
 > 298		.remove         = remote_etm_remove,
   299		.driver         = {
   300			.name   = "coresight-remote-etm",
   301			.of_match_table = remote_etm_match,
   302		},
   303	};
   304	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

