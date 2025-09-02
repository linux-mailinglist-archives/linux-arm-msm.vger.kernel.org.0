Return-Path: <linux-arm-msm+bounces-71552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB3EB3FDDC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 13:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5FC6205321
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 11:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E782F39BD;
	Tue,  2 Sep 2025 11:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hYwgdgUm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14860247298;
	Tue,  2 Sep 2025 11:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756812914; cv=none; b=qJ3aJD7h+ZGJKR5fbR/6borqhG412HZppJI6n8dWdRWqgaHsYmrYzJpfbLxy98kTpAAmIisdYCmASszNYaykjgaIM/Ye3FlihtViDpKXyF5oHYTumQ74/I4ADbGbbKON2MYtHIT9CuppZAcb4Ocfe25T9NA9D7u8wB76Ee2TCmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756812914; c=relaxed/simple;
	bh=yt2uM6ZT460e9/CuZuT4dZBqUeve53IjK7uLuhmn4Is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gmWXsuPt7Mcev2wvM2beo5DHDbaC43cNzv+gh2GFGLCyrDcOa/5704FdlSEL62pKTozNtghUY3GS304A4TNi7cKMZ+/DJyMZBIMG2neHUs18hadpqLSUoeDt7eLoQLCDIZonUYvYXfnhc9WkK4uO4ZbKZMnbC11lUEQIetjXlt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hYwgdgUm; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756812913; x=1788348913;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yt2uM6ZT460e9/CuZuT4dZBqUeve53IjK7uLuhmn4Is=;
  b=hYwgdgUmVakfcNeQOxx6VPCeBGqDeE550RzHG57zhtTDnoj6ioUBTFCi
   vC3sD46e9BiPQHbt63jc8sxGDEIYOMDg7LQlkNOoakYTMMUJKgsc/gegU
   los/DzYVdjDfUMtOSxmH/xH+8e4q7UtwBj/Rk3UTHJvZN0Luna22tLX9j
   16RgCayXii+rtqQbHcatZld8eh7upTodGvEWyIAcfYm7fuo7GTchPwuDI
   5JzL11FKNQ5CuWPsbIIwBrhRxcpFCHZbiC0eKQ4IG2tIYNBgIIAdP+KA3
   BSJmYCedtfWk0sjIWb7UTCO2A7nS4SJ+TIvUzjtTQas/HwtUw2xEyBNFI
   Q==;
X-CSE-ConnectionGUID: CpkkXTK5S46mbTBAqZTYBA==
X-CSE-MsgGUID: 61IzbI0sT+qMKA8DJPcCRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58116163"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58116163"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 04:35:12 -0700
X-CSE-ConnectionGUID: gCCduhp3Q9m1ZtBAIT8nrA==
X-CSE-MsgGUID: OtdC/3xzSHOpgQ1cxaulAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="175618079"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 02 Sep 2025 04:35:09 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utPI2-0001uZ-1i;
	Tue, 02 Sep 2025 11:35:06 +0000
Date: Tue, 2 Sep 2025 19:34:28 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	conor+dt@kernel.org, srini@kernel.org,
	yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH 1/7] of: base: Add of_property_read_u8_index
Message-ID: <202509021915.6WBFuf9m-lkp@intel.com>
References: <20250901195037.47156-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901195037.47156-2-srinivas.kandagatla@oss.qualcomm.com>

Hi Srinivas,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.17-rc4 next-20250902]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Kandagatla/of-base-Add-of_property_read_u8_index/20250902-035407
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250901195037.47156-2-srinivas.kandagatla%40oss.qualcomm.com
patch subject: [PATCH 1/7] of: base: Add of_property_read_u8_index
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20250902/202509021915.6WBFuf9m-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2e122990391b2ba062e6308a12cfedf7206270ba)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021915.6WBFuf9m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509021915.6WBFuf9m-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from init/main.c:56:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:19:
>> include/linux/of.h:645:8: error: unknown type name 'inlinen'; did you mean 'inline'?
     645 | static inlinen int of_property_read_u8_index(const struct device_node *np,
         |        ^~~~~~~
         |        inline
   1 error generated.


vim +645 include/linux/of.h

   644	
 > 645	static inlinen int of_property_read_u8_index(const struct device_node *np,
   646				const char *propname, u32 index, u8 *out_value)
   647	{
   648		return -ENOSYS;
   649	}
   650	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

