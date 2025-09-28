Return-Path: <linux-arm-msm+bounces-75439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A98BA76C3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 21:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00EB57ACF94
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 19:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4099925A331;
	Sun, 28 Sep 2025 19:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KLjcCQM7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C272F259CA4;
	Sun, 28 Sep 2025 19:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759086628; cv=none; b=OBe70/fMNueDFTAxNqP3uDwfc3Xj0Gn77jwz5VlezcSoa2sFC9Lm6tpzSt8ZGbGkeMeZfof4Tlzh+f1YRSSOtiylQmKws4VG8aMjLume5EIFrgZ1SK6p6mMGglT9UXRBfAjno50ON40u/Pk/R90dwJbJlTcBwZveutBgReGN5y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759086628; c=relaxed/simple;
	bh=ARfTGfLniAH7wUpL/BT0VpywPmBlBLL8BFcDU6AhgMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BL3kLAaRH5jJr5Sy6kplXP83IP1iPHbWtpaguJ01RJ5wTgjKJXDDrAPdbQFttpckHviJlNQBARObW6HKy67QW1WhZpGgSb5xbYLZKzHv/810IT5i80DLbAL3XFHsb5EmHlX5xOeeaNS16apcLJ87sLra3ENfB6kySyB7wRnMYdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KLjcCQM7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759086626; x=1790622626;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ARfTGfLniAH7wUpL/BT0VpywPmBlBLL8BFcDU6AhgMY=;
  b=KLjcCQM72/FpskmIHyhDRtcTLwuoGPBJb4BG12p+EWFr85aBiUKGORo1
   SpH0rMfwvBY7dRN49U64xBhEJ9wqknq8DEJi3dwnzJSwjUz42h13AUyiG
   0rAcLbUqQxWbjrkbbSqhcSmPXxgWzzykGjj9Im6nrd2n9GrZCIMmq2w++
   yw9Y9qxBg24evxp23XrfbK7LzD99qGL5TI46n48pb+b7tTQK0lazclkV4
   OexDZuXZdccowKmFrv5oovFPEunPlHcrIV+e/5rxZQQV1UVs3bcz1uCNQ
   R1J37uqO1uG6ao1jCm6LsE3HbumH70z++8fNDRWym8wbNr8b3Xp1b9Foa
   w==;
X-CSE-ConnectionGUID: dyHLJHLIRgKfC72cNLrv8g==
X-CSE-MsgGUID: cvlfHCa2Rw6nGB8phWaaaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="86789065"
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; 
   d="scan'208";a="86789065"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2025 12:10:25 -0700
X-CSE-ConnectionGUID: 28kYypdTR3+5govQnOWY+w==
X-CSE-MsgGUID: N8rFLA6UT+2MHMdcmrmaDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; 
   d="scan'208";a="177315325"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 28 Sep 2025 12:10:22 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2wml-0007y3-0R;
	Sun, 28 Sep 2025 19:10:16 +0000
Date: Mon, 29 Sep 2025 03:10:14 +0800
From: kernel test robot <lkp@intel.com>
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Akhil Vinod <akhil.vinod@oss.qualcomm.com>,
	Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, quic_vpernami@quicinc.com,
	Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] bus: mhi: ep: Add loopback driver for data path
 testing
Message-ID: <202509290238.4kkJL0x5-lkp@intel.com>
References: <20250923-loopback_mhi-v1-2-8618f31f44aa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923-loopback_mhi-v1-2-8618f31f44aa@oss.qualcomm.com>

Hi Sumit,

kernel test robot noticed the following build errors:

[auto build test ERROR on e6b9dce0aeeb91dfc0974ab87f02454e24566182]

url:    https://github.com/intel-lab-lkp/linux/commits/Sumit-Kumar/bus-mhi-host-Add-loopback-driver-with-sysfs-interface/20250923-144109
base:   e6b9dce0aeeb91dfc0974ab87f02454e24566182
patch link:    https://lore.kernel.org/r/20250923-loopback_mhi-v1-2-8618f31f44aa%40oss.qualcomm.com
patch subject: [PATCH 2/2] bus: mhi: ep: Add loopback driver for data path testing
config: loongarch-randconfig-001-20250929 (https://download.01.org/0day-ci/archive/20250929/202509290238.4kkJL0x5-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250929/202509290238.4kkJL0x5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509290238.4kkJL0x5-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/bus/mhi/ep/mhi_ep_loopback.o: in function `mhi_ep_loopback_dl_callback':
>> mhi_ep_loopback.c:(.text+0x20): undefined reference to `sk_skb_reason_drop'
   loongarch64-linux-ld: drivers/bus/mhi/ep/mhi_ep_loopback.o: in function `mhi_ep_loopback_work_handler':
   mhi_ep_loopback.c:(.text+0x74): undefined reference to `sk_skb_reason_drop'
   loongarch64-linux-ld: drivers/bus/mhi/ep/mhi_ep_loopback.o: in function `mhi_ep_loopback_ul_callback':
>> mhi_ep_loopback.c:(.text+0x19c): undefined reference to `__alloc_skb'
>> loongarch64-linux-ld: mhi_ep_loopback.c:(.text+0x1e4): undefined reference to `skb_put'
>> loongarch64-linux-ld: mhi_ep_loopback.c:(.text+0x2b8): undefined reference to `sk_skb_reason_drop'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

