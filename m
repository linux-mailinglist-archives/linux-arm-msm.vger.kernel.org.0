Return-Path: <linux-arm-msm+bounces-64132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A6FAFE1F3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 10:08:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2B5B5840F7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 08:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A36235072;
	Wed,  9 Jul 2025 08:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PsFBetPa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE53B5383;
	Wed,  9 Jul 2025 08:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752048427; cv=none; b=X5iJKFkM9aBLMlmugiZ1YG2J/3zwnpIpKMLE2lhdjHS8j6GBS9kWZG4FK3ToSE2jvCdFhkKmhaEDF0m/lYFFChQuSfKxXdTOpz9soRlOvqqHvZ2OABkq0fZDJvRCPMA4xL7qJZwYog5kEU8XWjzknwDmwqXBgAAWxbMhy842bV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752048427; c=relaxed/simple;
	bh=9rYqjk+RuKP0TVE1dEJTHl2+jZd9krVm1xmH9sN5xF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2oaWpo9pAZLxi/S7RDvLWP3jsqMdd0Qvsg7OAwYBCs1vsfLwCs6Cf7414fKdmNF4RkxvX3jlpySrR/OC1HwqV5U8xzLQo4/2evsUHgYmViRBFGrWaP32bAQuN+PvFh7EI8Vsx6p1OFPEnv6kYjgjyYPS/bIErineIFb+2RONUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PsFBetPa; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752048425; x=1783584425;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9rYqjk+RuKP0TVE1dEJTHl2+jZd9krVm1xmH9sN5xF0=;
  b=PsFBetPaH+uiqNF/2uisoh9PbwaclJ2w/tT4CLgRXzQAFsVzHytSCElc
   1ZsoOct3/vVQupoLEs1dm2pvPdpG1vLIFHc0JFUEbzBp7Sm4m5TmVPbLj
   vXGwVprS+845/r73LWlXuXIlN5hQWnslzjyXIOAgrvsgkJtlCA965P77p
   1HOXACcRvUkarvLET0kquxhF26hBosuMO3YPV7n/qsw4pemI3FR7BLcqM
   iPAHnorBOmqP/gsdIIu8sUWFwa2r+jY0OGJ3VTDyvl8LoOaapxy42yn3H
   6x1by6lMuy/pbhRAM1iLD1iRctQAxEbS0IFXBxiUTP5nZonqHzNdmO+Ar
   Q==;
X-CSE-ConnectionGUID: 571pRcq0RSWtIJvs7fElrw==
X-CSE-MsgGUID: MVV50DTDSIa6cVL1krlhvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="71746872"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="71746872"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 01:07:04 -0700
X-CSE-ConnectionGUID: CcPwKtcJSh67RZiCNdq1iA==
X-CSE-MsgGUID: pV3BeZKvQMCvEiS9uXnqMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="186677461"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Jul 2025 01:07:01 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZPpS-0003HX-38;
	Wed, 09 Jul 2025 08:06:58 +0000
Date: Wed, 9 Jul 2025 16:06:50 +0800
From: kernel test robot <lkp@intel.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>, mani@kernel.org,
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
	bvanassche@acm.org, avri.altman@wdc.com, ebiggers@google.com,
	neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: Re: [PATCH V3 2/3] scsi: ufs: core: Add ufshcd_dme_rmw to modify DME
 attributes
Message-ID: <202507091547.T2t1t8Wz-lkp@intel.com>
References: <20250708212534.20910-3-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708212534.20910-3-quic_nitirawa@quicinc.com>

Hi Nitin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jejb-scsi/for-next]
[also build test WARNING on mkp-scsi/for-next linus/master v6.16-rc5 next-20250708]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nitin-Rawat/ufs-ufs-qcom-Update-esi_vec_mask-for-HW-major-version-6/20250709-052748
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-next
patch link:    https://lore.kernel.org/r/20250708212534.20910-3-quic_nitirawa%40quicinc.com
patch subject: [PATCH V3 2/3] scsi: ufs: core: Add ufshcd_dme_rmw to modify DME attributes
config: x86_64-buildonly-randconfig-001-20250709 (https://download.01.org/0day-ci/archive/20250709/202507091547.T2t1t8Wz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250709/202507091547.T2t1t8Wz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507091547.T2t1t8Wz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/ufs/core/ufshcd.c:4262 function parameter 'hba' not described in 'ufshcd_dme_rmw'
>> Warning: drivers/ufs/core/ufshcd.c:4262 function parameter 'mask' not described in 'ufshcd_dme_rmw'
>> Warning: drivers/ufs/core/ufshcd.c:4262 function parameter 'val' not described in 'ufshcd_dme_rmw'
>> Warning: drivers/ufs/core/ufshcd.c:4262 function parameter 'attr' not described in 'ufshcd_dme_rmw'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

