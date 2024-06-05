Return-Path: <linux-arm-msm+bounces-21697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C5F8FC2E3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 07:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AE802852B7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 05:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE5B139D1A;
	Wed,  5 Jun 2024 05:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eUidmhsw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A7861FCC;
	Wed,  5 Jun 2024 05:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717563879; cv=none; b=UPbYmhaff1PUUS+35bPbRIF86fwGx+/ugsT/H+JOutcu970dx7iJorggJv5bLdAdD/9ut9fwE/plH79sKSasJ9Pk0pGenCvwcuxXfzWpL5WFAlKjbwaYRCIh7oqV7PgDBI1NqP+Kjl1R6dz69IvBGYA6FHG/LSNLP9sBnQQP7+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717563879; c=relaxed/simple;
	bh=x2ZW8cijAAACiOfJr+MbErW0fJMSAWOe6vL0+p9HPsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNSIa0suwSMwzV6sSAkiQOLTRkuLqyzGvGpqpwHKu/qBIf5kzaqbe8tJXOF1Gcp6VULIb3r/u6TcmebdUVThOPcqzRX/bcFDFFqVsLgnLNvItKgMdZb28z1HpKLvAWk+ij8BOoHv4wtjMlO+GXJZBeRCEEUIf0fmVM1uCb/TFj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eUidmhsw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717563877; x=1749099877;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x2ZW8cijAAACiOfJr+MbErW0fJMSAWOe6vL0+p9HPsc=;
  b=eUidmhswdYaldfYrY4XLZCycCpFB2qQcb9lGOyEryDiCp0EZidmGvElv
   iDIbmmVzIkK22lKXCPZVMNvPehvzRQ8n+hFCddX12XjrNd0ffAUmmn0eu
   wzSU5iKXa4httFgEvV2QrjUA58euoQQivHd6TjaLQ9cHBgYK7Aq/7s4tS
   f4theceAcPG8qjW6Jr0tHsHpEEcnOFScjaVRaSrpi0POiDotfK3l9CZyw
   ibreHOtZIjo0Gz+dZyLRQcdkoyd6aSv/KNQi/1NdYWy9aRqqNC1efEHHB
   EmucQaTYhpQjuHmNijmpgVk6FBi2v9eoYZ9DpGYM4g1nck329DzJwZTdY
   g==;
X-CSE-ConnectionGUID: ym3eVshlSMStnm+hZPKbbg==
X-CSE-MsgGUID: a/sPvPTSRlOphEWSdxDfdg==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="25257246"
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; 
   d="scan'208";a="25257246"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 22:04:36 -0700
X-CSE-ConnectionGUID: GJ7hVspwS1eWwapyAKcxKQ==
X-CSE-MsgGUID: 1Q08XN4PTlG6z6cEZDUvkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; 
   d="scan'208";a="68598678"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 04 Jun 2024 22:04:32 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEip4-0000vn-0q;
	Wed, 05 Jun 2024 05:04:30 +0000
Date: Wed, 5 Jun 2024 13:03:57 +0800
From: kernel test robot <lkp@intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Connor Abbott <cwabbott0@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	seanpaul@chromium.org, quic_jesszhan@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/a6xx: use __always_unused to fix compiler
 warnings for gen7_* includes
Message-ID: <202406051244.xdNC6LyO-lkp@intel.com>
References: <20240604215105.4057278-1-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604215105.4057278-1-quic_abhinavk@quicinc.com>

Hi Abhinav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next-fixes]
[also build test WARNING on drm-tip/drm-tip linus/master v6.10-rc2 next-20240604]
[cannot apply to drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhinav-Kumar/drm-msm-a6xx-use-__always_unused-to-fix-compiler-warnings-for-gen7_-includes/20240605-055341
base:   git://anongit.freedesktop.org/drm-intel for-linux-next-fixes
patch link:    https://lore.kernel.org/r/20240604215105.4057278-1-quic_abhinavk%40quicinc.com
patch subject: [PATCH] drm/msm/a6xx: use __always_unused to fix compiler warnings for gen7_* includes
config: i386-buildonly-randconfig-001-20240605 (https://download.01.org/0day-ci/archive/20240605/202406051244.xdNC6LyO-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240605/202406051244.xdNC6LyO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406051244.xdNC6LyO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:13:
>> drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h:114:18: warning: 'gen7_9_0_cx_debugbus_blocks' defined but not used [-Wunused-const-variable=]
     114 | static const u32 gen7_9_0_cx_debugbus_blocks[] = {
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/gen7_9_0_cx_debugbus_blocks +114 drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h

6408a1b5a7d7a9 Connor Abbott 2024-05-03  113  
6408a1b5a7d7a9 Connor Abbott 2024-05-03 @114  static const u32 gen7_9_0_cx_debugbus_blocks[] = {
106414f8b60346 Connor Abbott 2024-05-03  115  	A7XX_DBGBUS_CX,
106414f8b60346 Connor Abbott 2024-05-03  116  	A7XX_DBGBUS_GMU_CX,
106414f8b60346 Connor Abbott 2024-05-03  117  	A7XX_DBGBUS_GBIF_CX,
6408a1b5a7d7a9 Connor Abbott 2024-05-03  118  };
6408a1b5a7d7a9 Connor Abbott 2024-05-03  119  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

