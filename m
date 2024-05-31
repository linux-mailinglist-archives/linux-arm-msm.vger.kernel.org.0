Return-Path: <linux-arm-msm+bounces-21369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D3C8D6AAC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 22:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E2A52899A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 20:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40AAD7E591;
	Fri, 31 May 2024 20:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g6CWUhfC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F046D2940B;
	Fri, 31 May 2024 20:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717187420; cv=none; b=ceKOLuJK0M/u1T7lhn10qjxNk3e/BMqv/CmUKbbzFIGFTQYBeI1Zy+FrRA5Hejp4zT9ulbm+LoNXVk8eWHzu3qaVXrAy+pAd7MKJG9OPMqg9NAbzj5EoBK3KqdZguwOawXG1oEKa5vn7CUrtDL5jOYUpWbK34XRtiFqY9P5ivQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717187420; c=relaxed/simple;
	bh=FyXrGKtxtK1Ia++Up7p7wWt6dTZYsv9GlxJsgvwjMZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TD1Ut9+zXQW37Gm8Nga6G6nHiTkcNzrf+pL4fV/neVhGtMvt4JyKVWtqqIw0eqzhoEvJApoOkRXpIprqL6rSwzwDFdLekEY7x/X3nIqAvdARAK3nmknWS+8wTDlAUD8uolxNdzcbaxR+eafn9Z0qOtV6Mr9nfb1is9s4ep/Qw+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g6CWUhfC; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717187418; x=1748723418;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FyXrGKtxtK1Ia++Up7p7wWt6dTZYsv9GlxJsgvwjMZ0=;
  b=g6CWUhfCoGHQpbhW0ZS+VnOw/11uR2qnPEHZug3sQoispNJO3eAcf8MQ
   O3DaefJUpspBtTLyIMgo2Jgt+IG9ChmuvSbI6slCMc8fiDBfjPzDmjv76
   d9f5nToxfPLWnYn1ETbwMhkuo3xZH0nIssWijGPTLLkFxA784l5/T6/dd
   D3D6TJ4JOrAKPJgYBV/Y5EcbRM3o7KcD8X8DKCbVTY8hpaaieOQ6rcskv
   5EQi9mScWMCq8FH3JKW+ywEjppjZFB63q1r/bBD18nWRSfd+bObreJGiN
   sTDR7T5hwGq251DBnvERXUzPfMTdDeCZ01WVmT5wW5QNQ7oUvNdTfjrFX
   A==;
X-CSE-ConnectionGUID: eI1aGrTYRTeTduhvMjSsYA==
X-CSE-MsgGUID: /a6n6twJTaWI9hOB3pdTew==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="17544901"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="17544901"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 13:30:17 -0700
X-CSE-ConnectionGUID: VFIwyAj9SgmeTuHViMNcug==
X-CSE-MsgGUID: Og9p9johTY22w0ElFeLTWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="40711149"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 31 May 2024 13:30:15 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sD8tA-000Hmr-2d;
	Fri, 31 May 2024 20:30:12 +0000
Date: Sat, 1 Jun 2024 04:29:37 +0800
From: kernel test robot <lkp@intel.com>
To: Shivnandan Kumar <quic_kshivnan@quicinc.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Shivnandan Kumar <quic_kshivnan@quicinc.com>
Subject: Re: [PATCH] soc: qcom: icc-bwmon: Add tracepoints in
 bwmon_intr_thread
Message-ID: <202406010409.xiR31FVt-lkp@intel.com>
References: <20240531105404.879267-1-quic_kshivnan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531105404.879267-1-quic_kshivnan@quicinc.com>

Hi Shivnandan,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.10-rc1 next-20240531]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shivnandan-Kumar/soc-qcom-icc-bwmon-Add-tracepoints-in-bwmon_intr_thread/20240531-185658
base:   linus/master
patch link:    https://lore.kernel.org/r/20240531105404.879267-1-quic_kshivnan%40quicinc.com
patch subject: [PATCH] soc: qcom: icc-bwmon: Add tracepoints in bwmon_intr_thread
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20240601/202406010409.xiR31FVt-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406010409.xiR31FVt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406010409.xiR31FVt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/trace/trace_events.h:419,
                    from include/trace/define_trace.h:102,
                    from drivers/soc/qcom/trace_icc-bwmon.h:49,
                    from drivers/soc/qcom/icc-bwmon.c:21:
>> include/trace/../../drivers/soc/qcom//trace_icc-bwmon.h:39:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
      39 | );
         | ^~             
   In file included from include/trace/trace_events.h:375:
   include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
      34 | #define __assign_str(dst)                                               \
         | 
   include/trace/../../drivers/soc/qcom//trace_icc-bwmon.h: In function 'trace_event_raw_event_qcom_bwmon_update':
>> include/trace/../../drivers/soc/qcom//trace_icc-bwmon.h:28:17: error: '__assign_str' undeclared (first use in this function)
      28 |                 __assign_str(name, name);
         |                 ^~~~~~~~~~~~
   include/trace/trace_events.h:402:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
     402 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   include/trace/../../drivers/soc/qcom//trace_icc-bwmon.h:13:1: note: in expansion of macro 'TRACE_EVENT'
      13 | TRACE_EVENT(qcom_bwmon_update,
         | ^~~~~~~~~~~
   include/trace/../../drivers/soc/qcom//trace_icc-bwmon.h:27:9: note: in expansion of macro 'TP_fast_assign'
      27 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   include/trace/../../drivers/soc/qcom//trace_icc-bwmon.h:28:17: note: each undeclared identifier is reported only once for each function it appears in
      28 |                 __assign_str(name, name);
         |                 ^~~~~~~~~~~~
   include/trace/trace_events.h:402:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
     402 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   include/trace/../../drivers/soc/qcom//trace_icc-bwmon.h:13:1: note: in expansion of macro 'TRACE_EVENT'
      13 | TRACE_EVENT(qcom_bwmon_update,
         | ^~~~~~~~~~~
   include/trace/../../drivers/soc/qcom//trace_icc-bwmon.h:27:9: note: in expansion of macro 'TP_fast_assign'
      27 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:469:
   include/trace/../../drivers/soc/qcom//trace_icc-bwmon.h: At top level:
>> include/trace/../../drivers/soc/qcom//trace_icc-bwmon.h:39:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
      39 | );
         | ^~             
   include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
      34 | #define __assign_str(dst)                                               \
         | 


vim +/__assign_str +39 include/trace/../../drivers/soc/qcom//trace_icc-bwmon.h

    14	
    15		TP_PROTO(const char *name,
    16			 unsigned int meas_kbps, unsigned int up_kbps, unsigned int down_kbps),
    17	
    18		TP_ARGS(name, meas_kbps, up_kbps, down_kbps),
    19	
    20		TP_STRUCT__entry(
    21			__string(name, name)
    22			__field(unsigned int, meas_kbps)
    23			__field(unsigned int, up_kbps)
    24			__field(unsigned int, down_kbps)
    25		),
    26	
    27		TP_fast_assign(
  > 28			__assign_str(name, name);
    29			__entry->meas_kbps = meas_kbps;
    30			__entry->up_kbps = up_kbps;
    31			__entry->down_kbps = down_kbps;
    32		),
    33	
    34		TP_printk("name=%s meas_kbps=%u up_kbps=%u down_kbps=%u",
    35			__get_str(name),
    36			__entry->meas_kbps,
    37			__entry->up_kbps,
    38			__entry->down_kbps)
  > 39	);
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

