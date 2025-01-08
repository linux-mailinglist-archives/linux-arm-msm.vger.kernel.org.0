Return-Path: <linux-arm-msm+bounces-44359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3817AA05ADD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 13:01:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D20A51887AAB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 12:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5F71F8AEF;
	Wed,  8 Jan 2025 12:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SEPd46E8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0931A3035;
	Wed,  8 Jan 2025 12:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736337678; cv=none; b=qlPH6W/0ccdroFpwOwBwyopgH0pRQCV8nLXlfq3N3TMQKPus1bho1y2DLL7J6YtNcbPBjv6nA6dwyVOYukbDBqL7BkgqSqCjsRxEMS89LHfEwyXXngiigIeFeqAs5iWkLqkaTXDixejJvU6r2ZrsxTZRmNGQu9NnYyQcYMp783c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736337678; c=relaxed/simple;
	bh=JJMULF85HQ+g833iIeSYXyg14/jDHEhvUM69v/uttSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UuIXTvuq/Rdk9WOc0lG63ttyi6YEGGCsKGaEWDJcxNEa3tzY40f+eblMFdG3ndrqv89PEzjOoO5xuPYkaGCVfeH/val18t/a4UeuU8o155MS5StUKAVEPWnNPwJXTI3YgWPkwXqBAfxfmeg3jFw7wftd7TRARCuVrwEz38D62v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SEPd46E8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736337676; x=1767873676;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JJMULF85HQ+g833iIeSYXyg14/jDHEhvUM69v/uttSM=;
  b=SEPd46E8OuNxQX9ZHmV3ZeZSCP9VsrzJdkqi5mTLktAtkHxB5DUGKFEM
   6yedIN7YQ4/E5t9IiMacd4yUNaIMGdKFYJaz9wLJlEOZg3VrTt25PvrQ0
   6gAfesYwxxJnYFmnaqpL4Ya0Em7f125QQsUoa+BZ0RzhPbbEPTZxpJ2ke
   J4gAlcEU5SgO1RSg2IHkurYTWJIhw+NMaVG7Q4ByKXnN5p+QaUChDW+tf
   51Kwjuxr+RJJu/A/VKic9gSGcRd9y0UX1E1GyJ/rkyridy3kyzRhPZ76T
   hZ6bSFGvFSnraDY3H+sVprxJopDG8HTpwrgFgHqE5PanMEPBnlh7uTNV+
   A==;
X-CSE-ConnectionGUID: 7aB8l3nyT0+BwQ+5Ouoa5g==
X-CSE-MsgGUID: 5RfY3LFvR2e6z0PnOE4CLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47225469"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="47225469"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 04:01:10 -0800
X-CSE-ConnectionGUID: 8wdzcdjyT+G/yW4LXQ+AOg==
X-CSE-MsgGUID: 6uSQIH9bQKeVAvtkN/wkCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133975515"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Jan 2025 04:01:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVUkD-000G1z-0k;
	Wed, 08 Jan 2025 12:01:05 +0000
Date: Wed, 8 Jan 2025 20:00:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>,
	manivannan.sadhasivam@linaro.org,
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
	andersson@kernel.org, bvanassche@acm.org, ebiggers@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>,
	Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: Re: [PATCH V9] scsi: ufs: qcom: Enable UFS Shared ICE Feature
Message-ID: <202501081935.NGoKgB9p-lkp@intel.com>
References: <20250107135624.7628-1-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107135624.7628-1-quic_rdwivedi@quicinc.com>

Hi Ram,

kernel test robot noticed the following build errors:

[auto build test ERROR on jejb-scsi/for-next]
[also build test ERROR on mkp-scsi/for-next mani-mhi/mhi-next linus/master v6.13-rc6 next-20250107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ram-Kumar-Dwivedi/scsi-ufs-qcom-Enable-UFS-Shared-ICE-Feature/20250107-220209
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-next
patch link:    https://lore.kernel.org/r/20250107135624.7628-1-quic_rdwivedi%40quicinc.com
patch subject: [PATCH V9] scsi: ufs: qcom: Enable UFS Shared ICE Feature
config: arm64-randconfig-001-20250108 (https://download.01.org/0day-ci/archive/20250108/202501081935.NGoKgB9p-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501081935.NGoKgB9p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501081935.NGoKgB9p-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/ufs/host/ufs-qcom.c: In function 'ufs_qcom_set_host_caps':
>> drivers/ufs/host/ufs-qcom.c:968:31: error: 'UFS_QCOM_CAP_ICE_CONFIG' undeclared (first use in this function)
     968 |                 host->caps |= UFS_QCOM_CAP_ICE_CONFIG;
         |                               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/host/ufs-qcom.c:968:31: note: each undeclared identifier is reported only once for each function it appears in
   drivers/ufs/host/ufs-qcom.c: At top level:
>> drivers/ufs/host/ufs-qcom.c:223:13: warning: 'ufs_qcom_config_ice_allocator' defined but not used [-Wunused-function]
     223 | static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/UFS_QCOM_CAP_ICE_CONFIG +968 drivers/ufs/host/ufs-qcom.c

   962	
   963	static void ufs_qcom_set_host_caps(struct ufs_hba *hba)
   964	{
   965		struct ufs_qcom_host *host = ufshcd_get_variant(hba);
   966	
   967		if (host->hw_ver.major >= 0x5)
 > 968			host->caps |= UFS_QCOM_CAP_ICE_CONFIG;
   969	}
   970	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

