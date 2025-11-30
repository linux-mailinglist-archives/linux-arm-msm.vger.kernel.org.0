Return-Path: <linux-arm-msm+bounces-83888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEE0C94CA5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 10:02:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 599CA4E106D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 09:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93E426F299;
	Sun, 30 Nov 2025 09:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B2UePK/5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D18F26CE0F;
	Sun, 30 Nov 2025 09:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764493374; cv=none; b=FR6vEB/hsLw+dHl4e4NtNGd6+PPXWBzyODrHhLGe5pu9Q2fFj6i+Jac+cbNRD3cbAdpc2ntr9JBwENoand85LVLjVcrfI3wU8stLQzQYe4POpMumm5xVUE9NCDMFivE3CExoWmnbpRw3NbRJPSzWn50brqBduPTzG7dtmLvqdwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764493374; c=relaxed/simple;
	bh=9yT3SZfQNOQdwgi44E5zzGA2Jrzyss4nrUwzxvf+Yts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpLduVo5sijDcJa3Rbc5vKW5TYkegmr0j5gZl9INGXB5Lk058EyHfTpCa/0DEw1LpklfQOJwWl50TEADMbeeN+Nb57Vl1gVc9XlUx3E3jwzZjkfvg0CEKVk4zHQIan5B4tuaLzZuvnt2Z2z4LJ267mwxub3h2ZbRu4lw7Dr5oo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B2UePK/5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764493373; x=1796029373;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9yT3SZfQNOQdwgi44E5zzGA2Jrzyss4nrUwzxvf+Yts=;
  b=B2UePK/5yavtbXMX75zF33Lm+WSs44l1+iL4SF2k2/taWgaldHSDvqjN
   bOniNXeXw4I0ouYSDm9sqcFoDTXsw8fDM24+jjj0Ma3Mwn3FuF9nyvA6I
   PWE79Qv2hG2LlLNO/QelyIvBnnUB9CIWdeFN4pvUXEU+zKL/uI9uglDHw
   35yRThNsABZ7eS5iuxKuv/XQMml/Po60ik6LpzaM78dW5PPmoD65BzBGb
   cVELDSuOj51i5ZWzQZO63fKAK/SnOtotF4hmiCopkqt0zZOkyAhl22fPT
   V5BOkYcIT0TcZUZNJaT4HrPU4BWoAgus/ZV30+apJq78Noe1S4U2aKS8o
   w==;
X-CSE-ConnectionGUID: bVqs2fq3TJaBe9ypXjBJ2w==
X-CSE-MsgGUID: NRtCkRq9RbS1+7yYTV2HBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="66480850"
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="66480850"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 01:02:52 -0800
X-CSE-ConnectionGUID: +ajhYAz8Q2CqwSpWbxIjqw==
X-CSE-MsgGUID: BRMp+JH4RSuHwAWxqfK4Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="193696145"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Nov 2025 01:02:48 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPdKQ-000000007sP-1QO1;
	Sun, 30 Nov 2025 09:02:46 +0000
Date: Sun, 30 Nov 2025 17:02:17 +0800
From: kernel test robot <lkp@intel.com>
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Antonino Maniscalco <antomani103@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Anna Maniscalco <anna.maniscalco2000@gmail.com>
Subject: Re: [PATCH v2] drm/msm: Fix a7xx per pipe register programming
Message-ID: <202511301632.WkPnj4Dg-lkp@intel.com>
References: <20251128-gras_nc_mode_fix-v2-1-634cda7b810f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128-gras_nc_mode_fix-v2-1-634cda7b810f@gmail.com>

Hi Anna,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7bc29d5fb6faff2f547323c9ee8d3a0790cd2530]

url:    https://github.com/intel-lab-lkp/linux/commits/Anna-Maniscalco/drm-msm-Fix-a7xx-per-pipe-register-programming/20251129-012027
base:   7bc29d5fb6faff2f547323c9ee8d3a0790cd2530
patch link:    https://lore.kernel.org/r/20251128-gras_nc_mode_fix-v2-1-634cda7b810f%40gmail.com
patch subject: [PATCH v2] drm/msm: Fix a7xx per pipe register programming
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20251130/202511301632.WkPnj4Dg-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251130/202511301632.WkPnj4Dg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511301632.WkPnj4Dg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/msm/adreno/a6xx_gpu.c:853:22: error: use of undeclared identifier 'A7XX_PIPE_BR'
     853 |                 for (u32 pipe_id = A7XX_PIPE_BR; pipe_id <= A7XX_PIPE_BV; pipe_id++) {
         |                                    ^
>> drivers/gpu/drm/msm/adreno/a6xx_gpu.c:853:47: error: use of undeclared identifier 'A7XX_PIPE_BV'
     853 |                 for (u32 pipe_id = A7XX_PIPE_BR; pipe_id <= A7XX_PIPE_BV; pipe_id++) {
         |                                                             ^
>> drivers/gpu/drm/msm/adreno/a6xx_gpu.c:860:38: error: use of undeclared identifier 'A7XX_PIPE_NONE'
     860 |                           A7XX_CP_APERTURE_CNTL_HOST_PIPE(A7XX_PIPE_NONE));
         |                                                           ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:921:22: error: use of undeclared identifier 'A7XX_PIPE_BR'
     921 |                 for (u32 pipe_id = A7XX_PIPE_BR; pipe_id <= A7XX_PIPE_BV; pipe_id++) {
         |                                    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:921:47: error: use of undeclared identifier 'A7XX_PIPE_BV'
     921 |                 for (u32 pipe_id = A7XX_PIPE_BR; pipe_id <= A7XX_PIPE_BV; pipe_id++) {
         |                                                             ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:934:38: error: use of undeclared identifier 'A7XX_PIPE_NONE'
     934 |                           A7XX_CP_APERTURE_CNTL_HOST_PIPE(A7XX_PIPE_NONE));
         |                                                           ^
   6 errors generated.


vim +/A7XX_PIPE_BR +853 drivers/gpu/drm/msm/adreno/a6xx_gpu.c

   807	
   808	static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
   809	{
   810		struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
   811		const struct qcom_ubwc_cfg_data *cfg = adreno_gpu->ubwc_config;
   812		/*
   813		 * We subtract 13 from the highest bank bit (13 is the minimum value
   814		 * allowed by hw) and write the lowest two bits of the remaining value
   815		 * as hbb_lo and the one above it as hbb_hi to the hardware.
   816		 */
   817		BUG_ON(cfg->highest_bank_bit < 13);
   818		u32 hbb = cfg->highest_bank_bit - 13;
   819		bool rgb565_predicator = cfg->ubwc_enc_version >= UBWC_4_0;
   820		u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
   821		bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
   822		bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
   823		bool min_acc_len_64b = false;
   824		u8 uavflagprd_inv = 0;
   825		u32 hbb_hi = hbb >> 2;
   826		u32 hbb_lo = hbb & 3;
   827	
   828		if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu))
   829			uavflagprd_inv = 2;
   830	
   831		if (adreno_is_a610(adreno_gpu) || adreno_is_a702(adreno_gpu))
   832			min_acc_len_64b = true;
   833	
   834		gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
   835			  level2_swizzling_dis << 12 |
   836			  rgb565_predicator << 11 |
   837			  hbb_hi << 10 | amsbc << 4 |
   838			  min_acc_len_64b << 3 |
   839			  hbb_lo << 1 | ubwc_mode);
   840	
   841		gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL,
   842			  level2_swizzling_dis << 6 | hbb_hi << 4 |
   843			  min_acc_len_64b << 3 |
   844			  hbb_lo << 1 | ubwc_mode);
   845	
   846		gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
   847			  level2_swizzling_dis << 12 | hbb_hi << 10 |
   848			  uavflagprd_inv << 4 |
   849			  min_acc_len_64b << 3 |
   850			  hbb_lo << 1 | ubwc_mode);
   851	
   852		if (adreno_is_a7xx(adreno_gpu)) {
 > 853			for (u32 pipe_id = A7XX_PIPE_BR; pipe_id <= A7XX_PIPE_BV; pipe_id++) {
   854				gpu_write(gpu, REG_A7XX_CP_APERTURE_CNTL_HOST,
   855					  A7XX_CP_APERTURE_CNTL_HOST_PIPE(pipe_id));
   856				gpu_write(gpu, REG_A7XX_GRAS_NC_MODE_CNTL,
   857					  FIELD_PREP(GENMASK(8, 5), hbb_lo));
   858			}
   859			gpu_write(gpu, REG_A7XX_CP_APERTURE_CNTL_HOST,
 > 860				  A7XX_CP_APERTURE_CNTL_HOST_PIPE(A7XX_PIPE_NONE));
   861		}
   862	
   863		gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL,
   864			  min_acc_len_64b << 23 | hbb_lo << 21);
   865	
   866		gpu_write(gpu, REG_A6XX_RBBM_NC_MODE_CNTL,
   867			  cfg->macrotile_mode);
   868	}
   869	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

