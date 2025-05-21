Return-Path: <linux-arm-msm+bounces-58967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CAAAC00B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 01:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87BA23A6FD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 23:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E05323C8BE;
	Wed, 21 May 2025 23:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TV0aBVRS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2055A17A2EF;
	Wed, 21 May 2025 23:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747870894; cv=none; b=sv5Mr5kk15PUfYzef/spfr0rg/AeYxaz2Td0uTRkj9R+cUDJ8KiGsoG3KdNExYzEw7mDHgRhxgks7VjT3JNTOr9YKOZYZu8dTGTYEkGlUoFEmnKcW61FHvwzuORGXbAQdbUds5IGEPs95V3OoP1n6ZCGpDVxxGbyVWfqU2lUa7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747870894; c=relaxed/simple;
	bh=C5lRt9o6oozpH1yv7cQ/1mE4W8MldKnxycR94t3ACls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NP0jDmt8c5KoRNFlSsAi06aaMACbMO/du5pliBO6s6UVvnfuzwXw3Cmc40FPFioMGn/052rHjnc2ddKugqeVI1/nMxN207hMlJWUMwJC3EiOzk2FZVd+xBoP4hI8LnmWmm5mLiaCYR3zZ5GekyHQbCCIHSjOLbRtrxJBqs9f0s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TV0aBVRS; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747870893; x=1779406893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C5lRt9o6oozpH1yv7cQ/1mE4W8MldKnxycR94t3ACls=;
  b=TV0aBVRSG0PnvG0TjOkU0iphhmn+kcH3h5dReG5H7uQM+0gPvd6g8wNY
   uyP5C/quWspSBymFhzVby4V5YRpLYBJNXknX4Go3ktUX+N4HGcbU2x04d
   wmf5WFG8Yxf8LbcIkeUHfglW2l7W5c47inNjwMhrMnvnEvvbXb/ASyNlT
   SulX+saCUR+fFB9V5BVJ47dDQsOOD166AufFxx9inpXiWVo/RzTfo+lMH
   qDLurBok8tenGBpGXJoNx4v2Kk6b/isrvH2pUZsQQfq/ZnnO8ffH3Yse+
   8AuoMHOC1teqczzmYg0zytID6edGiN5ST4aTg0ldM6WpBeK2nTqFL+Cd/
   g==;
X-CSE-ConnectionGUID: cHV1iZKtRvqxBb+3/prGqg==
X-CSE-MsgGUID: W6xXV6gIRNGVj2BluJ1b0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49864377"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="49864377"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 16:41:32 -0700
X-CSE-ConnectionGUID: VZiSyD0eTIKD3pxH059vpQ==
X-CSE-MsgGUID: lHPW0BhBRTiRyg/+OoZblA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="144282397"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 May 2025 16:41:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHt3u-000Oji-1D;
	Wed, 21 May 2025 23:41:26 +0000
Date: Thu, 22 May 2025 07:40:28 +0800
From: kernel test robot <lkp@intel.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Doug Anderson <dianders@chromium.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] soc: qcom: qcom_stats: Add support to read DDR
 statistic
Message-ID: <202505220739.yseb9RQm-lkp@intel.com>
References: <20250521-ddr_stats_-v2-1-2c54ea4fc071@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521-ddr_stats_-v2-1-2c54ea4fc071@oss.qualcomm.com>

Hi Maulik,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 393d0c54cae31317deaa9043320c5fd9454deabc]

url:    https://github.com/intel-lab-lkp/linux/commits/Maulik-Shah/soc-qcom-qcom_stats-Add-support-to-read-DDR-statistic/20250521-163434
base:   393d0c54cae31317deaa9043320c5fd9454deabc
patch link:    https://lore.kernel.org/r/20250521-ddr_stats_-v2-1-2c54ea4fc071%40oss.qualcomm.com
patch subject: [PATCH v2 1/3] soc: qcom: qcom_stats: Add support to read DDR statistic
config: arc-randconfig-001-20250522 (https://download.01.org/0day-ci/archive/20250522/202505220739.yseb9RQm-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505220739.yseb9RQm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505220739.yseb9RQm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/qcom/qcom_stats.c: In function 'qcom_ddr_stats_print':
>> drivers/soc/qcom/qcom_stats.c:172:53: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'long unsigned int' [-Wformat=]
     172 |                 seq_printf(s, "DDR LPM Stat Name:0x%x\tcount:%u\tDuration (ticks):%llu\n",
         |                                                    ~^
         |                                                     |
         |                                                     unsigned int
         |                                                    %lx
>> drivers/soc/qcom/qcom_stats.c:180:42: warning: format '%u' expects argument of type 'unsigned int', but argument 3 has type 'long unsigned int' [-Wformat=]
     180 |                 seq_printf(s, "DDR Freq %uMhz:\tCP IDX:%u\tcount:%u\tDuration (ticks):%llu\n",
         |                                         ~^
         |                                          |
         |                                          unsigned int
         |                                         %lu


vim +172 drivers/soc/qcom/qcom_stats.c

   144	
   145	static void qcom_ddr_stats_print(struct seq_file *s, struct ddr_stats_entry *data)
   146	{
   147		u32 cp_idx;
   148	
   149		/*
   150		 * DDR statistic have two different types of details encoded.
   151		 * (1) DDR LPM Stats
   152		 * (2) DDR Frequency Stats
   153		 *
   154		 * The name field have details like which type of DDR stat (bits 8:15)
   155		 * along with other details as explained below
   156		 *
   157		 * In case of DDR LPM stat, name field will be encoded as,
   158		 * Bits	 -  Meaning
   159		 * 0:7	 -  DDR LPM name, can be of 0xd4, 0xd3, 0x11 and 0xd0.
   160		 * 8:15	 -  0x0 (indicates its a LPM stat)
   161		 * 16:31 -  Unused
   162		 *
   163		 * In case of DDR FREQ stats, name field will be encoded as,
   164		 * Bits  -  Meaning
   165		 * 0:4   -  DDR Clock plan index (CP IDX)
   166		 * 5:7   -  Unused
   167		 * 8:15  -  0x1 (indicates its Freq stat)
   168		 * 16:31 -  Frequency value in Mhz
   169		 */
   170		switch (DDR_STATS_TYPE(data->name)) {
   171		case 0:
 > 172			seq_printf(s, "DDR LPM Stat Name:0x%x\tcount:%u\tDuration (ticks):%llu\n",
   173				   DDR_STATS_LPM_NAME(data->name), data->count, data->duration);
   174			break;
   175		case 1:
   176			if (!data->count || !DDR_STATS_FREQ(data->name))
   177				return;
   178	
   179			cp_idx = DDR_STATS_CP_IDX(data->name);
 > 180			seq_printf(s, "DDR Freq %uMhz:\tCP IDX:%u\tcount:%u\tDuration (ticks):%llu\n",
   181				   DDR_STATS_FREQ(data->name), cp_idx, data->count, data->duration);
   182			break;
   183		}
   184	}
   185	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

