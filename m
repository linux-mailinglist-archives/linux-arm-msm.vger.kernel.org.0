Return-Path: <linux-arm-msm+bounces-21543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 240CC8FA80D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 04:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE8B028A8D7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 02:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97471386B9;
	Tue,  4 Jun 2024 02:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yf9mXlIE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB487339BC;
	Tue,  4 Jun 2024 02:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717466602; cv=none; b=Zby2ADGDrVEHEDCVF7ft9IysK/rAQ/rQqB3jUpRe4gQ883n8bHSOQgGklvKxSVnjoWqUW6LNYE5aOvRXhyL5lkNXIuUA9sXXJ/XSn3/yCTzyMq8EO1XseGAzOnXXmjWei6fG8wvyCZL8z0Qcv1+TQ6eGtcC6AT7sM84NauMNvJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717466602; c=relaxed/simple;
	bh=A1VJ7Kg+25xUFxA9IX1CWPDqIcCTtBx8/S3fEPVKlPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CUvMOhLFRBph71WMuL9SliRTPPCg/zHrV21Ju7Mz+lWY4GOwsyGm47ofN560PqknbYPHrsAfEeLOzgex+0ZaVbOw3u4ftrVVWKDfqecB8Y8KFedmuY6jQSh1V57vDUk5TQFvpuB9/oXP8N/NLBCfSY9osqFVkqd9FCNtpr6paDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yf9mXlIE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717466601; x=1749002601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A1VJ7Kg+25xUFxA9IX1CWPDqIcCTtBx8/S3fEPVKlPw=;
  b=Yf9mXlIEgXIaDX29J6FBhALTA5snYQl+H1ZXIwcPD2sif5eE6ez9SDQL
   t9GKPW2Yz3yfgXASYvYxhkUukV9ZwuO2pgNixwyvu08EdTePzo8dpz6+3
   z4Njr78dZGx25oJRh27b9YQRVpEREdbZPeWbdBWXUsJ66KokcXTI5DAnv
   sPbSKcfGYuhmek4tf6ivSh7v/6R9xbKlOrlhkgm+TmOfyPNspZcOVHg8l
   G/RsMAC7H/lo4uZilHl2nH3xSwrAQVn2gcHzGkccgCGX1LOlWK6AWUi+W
   S4p2WFZl3WfQQN5wUmxEN02v3XlpxWEcosI811eweCTDUhzCtUHYvnFAw
   g==;
X-CSE-ConnectionGUID: RuBTzHsCR7CmKqc3eti0fA==
X-CSE-MsgGUID: ja2j2rTDR/yOffNMIE5rIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="11884917"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="11884917"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 19:03:16 -0700
X-CSE-ConnectionGUID: /RXsYtFYTHSOGyfKAl8y0A==
X-CSE-MsgGUID: 5yEXjRrIQJSy0rqrvoI25A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="74557148"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 03 Jun 2024 19:03:12 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEJVz-000MQw-2v;
	Tue, 04 Jun 2024 02:03:09 +0000
Date: Tue, 4 Jun 2024 10:02:30 +0800
From: kernel test robot <lkp@intel.com>
To: Mao Jinlong <quic_jinlmao@quicinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Tingwei Zhang <quic_tingweiz@quicinc.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Tao Zhang <quic_taozha@quicinc.com>,
	songchai <quic_songchai@quicinc.com>
Subject: Re: [PATCH v2 2/3] coresight: Add support to get preferred id for
 system trace sources
Message-ID: <202406040902.AybuHOVD-lkp@intel.com>
References: <20240603094354.2348-3-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603094354.2348-3-quic_jinlmao@quicinc.com>

Hi Mao,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on atorgue-stm32/stm32-next linus/master v6.10-rc2 next-20240603]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mao-Jinlong/dt-bindings-arm-Add-trace-id-for-coresight-dummy-source/20240603-175023
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240603094354.2348-3-quic_jinlmao%40quicinc.com
patch subject: [PATCH v2 2/3] coresight: Add support to get preferred id for system trace sources
config: arm64-randconfig-001-20240604 (https://download.01.org/0day-ci/archive/20240604/202406040902.AybuHOVD-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240604/202406040902.AybuHOVD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406040902.AybuHOVD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hwtracing/coresight/coresight-tpda.c:6:
   In file included from include/linux/amba/bus.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2253:
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
>> drivers/hwtracing/coresight/coresight-tpda.c:254:42: error: too few arguments to function call, single argument 'id' was not specified
     254 |         atid = coresight_trace_id_get_system_id();
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/hwtracing/coresight/coresight-trace-id.h:126:5: note: 'coresight_trace_id_get_system_id' declared here
     126 | int coresight_trace_id_get_system_id(int id);
         |     ^                                ~~~~~~
   5 warnings and 1 error generated.


vim +/id +254 drivers/hwtracing/coresight/coresight-tpda.c

5b7916625c017e Mao Jinlong 2023-01-17  243  
5b7916625c017e Mao Jinlong 2023-01-17  244  static int tpda_init_default_data(struct tpda_drvdata *drvdata)
5b7916625c017e Mao Jinlong 2023-01-17  245  {
5b7916625c017e Mao Jinlong 2023-01-17  246  	int atid;
5b7916625c017e Mao Jinlong 2023-01-17  247  	/*
5b7916625c017e Mao Jinlong 2023-01-17  248  	 * TPDA must has a unique atid. This atid can uniquely
5b7916625c017e Mao Jinlong 2023-01-17  249  	 * identify the TPDM trace source connected to the TPDA.
5b7916625c017e Mao Jinlong 2023-01-17  250  	 * The TPDMs which are connected to same TPDA share the
5b7916625c017e Mao Jinlong 2023-01-17  251  	 * same trace-id. When TPDA does packetization, different
5b7916625c017e Mao Jinlong 2023-01-17  252  	 * port will have unique channel number for decoding.
5b7916625c017e Mao Jinlong 2023-01-17  253  	 */
5b7916625c017e Mao Jinlong 2023-01-17 @254  	atid = coresight_trace_id_get_system_id();
5b7916625c017e Mao Jinlong 2023-01-17  255  	if (atid < 0)
5b7916625c017e Mao Jinlong 2023-01-17  256  		return atid;
5b7916625c017e Mao Jinlong 2023-01-17  257  
5b7916625c017e Mao Jinlong 2023-01-17  258  	drvdata->atid = atid;
5b7916625c017e Mao Jinlong 2023-01-17  259  	return 0;
5b7916625c017e Mao Jinlong 2023-01-17  260  }
5b7916625c017e Mao Jinlong 2023-01-17  261  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

