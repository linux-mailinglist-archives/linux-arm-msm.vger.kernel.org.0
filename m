Return-Path: <linux-arm-msm+bounces-66972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E00B14AC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 11:08:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E7C14E6AD9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 09:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0764A2874F1;
	Tue, 29 Jul 2025 09:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YoILE9fe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59286286D64;
	Tue, 29 Jul 2025 09:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753780085; cv=none; b=L0YGsO43oYd8wIo+1GExjn4zQvaZc7ONX5T87ggkPybwez1WUHXieQ9k2Z9zCKsxNkZmnVY3Wg30QDBI4SiDqLNYDSEi84/8c4RUutI5cF/vL4O95xsMna7rW8Pfkm90h7MFIMIpbRC/vOs36glDvxji1D0A7hbg0V2WcEdPaMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753780085; c=relaxed/simple;
	bh=6xqd3ZGPvMT14nG70kPsq5tJ9sNdsKyLjJnQfae58F8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCXEZ1nC1U/FpwtC/Wk+UX5yY/keyrJmmy6UymnIeMgTioe1WjSlo4U8M6ccblqsVFBj6GKnhMsnCtPkxb2muQ0cg5WptQTtXxkxkT3gzE2WgWdXUhbe2LrigNJJ7I+lsUmi8lWxnudcSNmtG2Vqa3+9QwPL4DjRzmJ/hnJ4ShU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YoILE9fe; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753780084; x=1785316084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6xqd3ZGPvMT14nG70kPsq5tJ9sNdsKyLjJnQfae58F8=;
  b=YoILE9feTRKcaGS517ILBoZkzjjwOJjeTwSOACVSZ1GorwhzoThomxzQ
   z2V4wi4YlM2HV3PVp4WJIBs59rQnu0cC6GJVHSyzSaoaaEGrVy2dx2/ui
   +++RAfxiKyo6YbTlvwV+INNPnlQkKw3BCV8PVILSqwlEnMlpfgTkyTLsx
   W0faFyxxIm8tZn8qv9e3mGsEeYD0AfUS/9OeXVIM9qnoR1TQ/hDr23ttD
   I6SHjIh/AXT66RdSZFkst7TFQ9FyV+aS5PNoJ9NGhm/ZR7mBLd4PaI8Je
   oO2juvv43aDSS31xYGhSnMe9KVWfN6lentUURjD0UxzBCf+0XXn4AxzT2
   g==;
X-CSE-ConnectionGUID: OTetJJfDRx2BIG6dy3scsA==
X-CSE-MsgGUID: rtfw9CwvTdmSJzu5Vwh6EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55980657"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="55980657"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 02:08:02 -0700
X-CSE-ConnectionGUID: TyZw7sn9S422x4l1rFBgQA==
X-CSE-MsgGUID: s8Ah/v+2SsKq8DjNu4eM7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="162360901"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Jul 2025 02:07:59 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uggJP-00018t-1o;
	Tue, 29 Jul 2025 09:07:55 +0000
Date: Tue, 29 Jul 2025 17:07:10 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] drm/msm: Fix a7xx debugbus read
Message-ID: <202507291635.fl7cCAyl-lkp@intel.com>
References: <20250728203412.22573-6-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728203412.22573-6-robin.clark@oss.qualcomm.com>

Hi Rob,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on next-20250729]
[cannot apply to drm-exynos/exynos-drm-next linus/master drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip v6.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Clark/drm-msm-Add-missing-location-s-to-devcoredump/20250729-043615
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20250728203412.22573-6-robin.clark%40oss.qualcomm.com
patch subject: [PATCH 5/7] drm/msm: Fix a7xx debugbus read
config: powerpc-randconfig-002-20250729 (https://download.01.org/0day-ci/archive/20250729/202507291635.fl7cCAyl-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507291635.fl7cCAyl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507291635.fl7cCAyl-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c: In function 'debugbus_read':
>> drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:180:9: error: implicit declaration of function 'FIELD_PREP'; did you mean 'FIELD'? [-Werror=implicit-function-declaration]
      reg = FIELD_PREP(GENMASK(7, 0), offset) |
            ^~~~~~~~~~
            FIELD
   cc1: some warnings being treated as errors


vim +180 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c

   172	
   173	/* read a value from the GX debug bus */
   174	static int debugbus_read(struct msm_gpu *gpu, u32 block, u32 offset,
   175			u32 *data)
   176	{
   177		u32 reg;
   178	
   179		if (to_adreno_gpu(gpu)->info->family >= ADRENO_7XX_GEN1) {
 > 180			reg = FIELD_PREP(GENMASK(7, 0), offset) |
   181				FIELD_PREP(GENMASK(24, 16), block);
   182		} else {
   183			reg = A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(offset) |
   184				A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block);
   185		}
   186	
   187		gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_A, reg);
   188		gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_B, reg);
   189		gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_C, reg);
   190		gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_D, reg);
   191	
   192		/* Wait 1 us to make sure the data is flowing */
   193		udelay(1);
   194	
   195		data[0] = gpu_read(gpu, REG_A6XX_DBGC_CFG_DBGBUS_TRACE_BUF2);
   196		data[1] = gpu_read(gpu, REG_A6XX_DBGC_CFG_DBGBUS_TRACE_BUF1);
   197	
   198		return 2;
   199	}
   200	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

