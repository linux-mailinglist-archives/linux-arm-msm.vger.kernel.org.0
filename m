Return-Path: <linux-arm-msm+bounces-83677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35396C908C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 02:59:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC99C3AADEF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 01:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5951A24A067;
	Fri, 28 Nov 2025 01:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPPyMRFU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869251C861A;
	Fri, 28 Nov 2025 01:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764295196; cv=none; b=RlhszW8/u86s/5XkRNPCWhJebT9BvHkfGrYJEDIQuNUeXpqE/hpvNWBZKOg+xEgvRJxqC4fLhL2iSfGxoXAaaVlNBQEZipEkeK9rFqFV/DtZEi/hNdWs2o4seQNqFDe2pM8fqk4vpSUCEuVzHuKE5P520tWlnv1s4ORQlcun1iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764295196; c=relaxed/simple;
	bh=jG+Q3vKVz8tj9mgaLr+HMnR7/uIPrxtNMPCHuccxSdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jk8N6Rfy1flA6FPjVCPpeMSU0YYSROYUqeCkG3BC+Zi+RWRxRrnJwWPs8GuN/JvXxpc99otktGASeLrxrBqtAC7J9V6LSrAIwarv6haRIPV7x352qlzSuc+Z6TuX+nQCj+7cV5QnTljeYF5qUlM6ruY2ADACT0T6v/1i8VA6HZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZPPyMRFU; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764295195; x=1795831195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jG+Q3vKVz8tj9mgaLr+HMnR7/uIPrxtNMPCHuccxSdA=;
  b=ZPPyMRFUznFTy23LZz7Ga6D4s1iLuDBdI1MaRix4mLFm5Bii64UaaccJ
   An7vhBuxNZ8qOjrmSib/6VN/6ZYfSZUwAR+IZ3zUkrzdnG8FjGR3V46IE
   vPwtoLVrHA5Epf/x1VEx/dgNWkJn015PvKwJ33EWtv6QAoMBbd0IhipJG
   Ur9+/P3BH54ZBACoOikun6tPDXOvGKBhIzsnpBGlOLbknN6ox7K3BkadS
   w5+z8g/OzOfYgq/JTfvGq/45ClaVIvEBbERRjWwqIU6t8p5hv7Vld3TFp
   BhGwvSFVEFy8PysKNanYHmP2r+O4L4XzidREkPsYiO1DzfLFirT4aENk+
   Q==;
X-CSE-ConnectionGUID: T9dELlFSSaeg0nVkXX3NpQ==
X-CSE-MsgGUID: MCiP2F4hS2ypUOsa7P63GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="68925548"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="68925548"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 17:59:54 -0800
X-CSE-ConnectionGUID: ddZGwDcEQ66Xb8fiKIQDbw==
X-CSE-MsgGUID: m60YY/UUSkGdERHuslMpnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="192475967"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Nov 2025 17:59:49 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOnly-000000005v3-2oCr;
	Fri, 28 Nov 2025 01:59:46 +0000
Date: Fri, 28 Nov 2025 09:59:39 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Anna Maniscalco <anna.maniscalco2000@gmail.com>
Subject: Re: [PATCH] drm/msm: Fix a7xx per pipe register programming
Message-ID: <202511280900.x5OzOOoJ-lkp@intel.com>
References: <20251127-gras_nc_mode_fix-v1-1-5c0cf616401f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127-gras_nc_mode_fix-v1-1-5c0cf616401f@gmail.com>

Hi Anna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7bc29d5fb6faff2f547323c9ee8d3a0790cd2530]

url:    https://github.com/intel-lab-lkp/linux/commits/Anna-Maniscalco/drm-msm-Fix-a7xx-per-pipe-register-programming/20251127-074833
base:   7bc29d5fb6faff2f547323c9ee8d3a0790cd2530
patch link:    https://lore.kernel.org/r/20251127-gras_nc_mode_fix-v1-1-5c0cf616401f%40gmail.com
patch subject: [PATCH] drm/msm: Fix a7xx per pipe register programming
config: loongarch-randconfig-001-20251128 (https://download.01.org/0day-ci/archive/20251128/202511280900.x5OzOOoJ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511280900.x5OzOOoJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511280900.x5OzOOoJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/msm/adreno/a6xx_gpu.c: In function 'a7xx_patch_pwrup_reglist':
>> drivers/gpu/drm/msm/adreno/a6xx_gpu.c:984:71: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
     984 |                         if (pipe_reglist->regs[i].pipe & BIT(pipe_id) == 0)


vim +984 drivers/gpu/drm/msm/adreno/a6xx_gpu.c

   931	
   932	static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
   933	{
   934		struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
   935		struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
   936		const struct adreno_reglist_list *reglist;
   937		const struct adreno_reglist_pipe_list *pipe_reglist;
   938		void *ptr = a6xx_gpu->pwrup_reglist_ptr;
   939		struct cpu_gpu_lock *lock = ptr;
   940		u32 *dest = (u32 *)&lock->regs[0];
   941		u32 pipe_reglist_count = 0;
   942		int i;
   943	
   944		lock->gpu_req = lock->cpu_req = lock->turn = 0;
   945	
   946		reglist = adreno_gpu->info->a6xx->ifpc_reglist;
   947		lock->ifpc_list_len = reglist->count;
   948	
   949		/*
   950		 * For each entry in each of the lists, write the offset and the current
   951		 * register value into the GPU buffer
   952		 */
   953		for (i = 0; i < reglist->count; i++) {
   954			*dest++ = reglist->regs[i];
   955			*dest++ = gpu_read(gpu, reglist->regs[i]);
   956		}
   957	
   958		reglist = adreno_gpu->info->a6xx->pwrup_reglist;
   959		lock->preemption_list_len = reglist->count;
   960	
   961		for (i = 0; i < reglist->count; i++) {
   962			*dest++ = reglist->regs[i];
   963			*dest++ = gpu_read(gpu, reglist->regs[i]);
   964		}
   965	
   966		/*
   967		 * The overall register list is composed of
   968		 * 1. Static IFPC-only registers
   969		 * 2. Static IFPC + preemption registers
   970		 * 3. Dynamic IFPC + preemption registers (ex: perfcounter selects)
   971		 *
   972		 * The first two lists are static. Size of these lists are stored as
   973		 * number of pairs in ifpc_list_len and preemption_list_len
   974		 * respectively. With concurrent binning, Some of the perfcounter
   975		 * registers being virtualized, CP needs to know the pipe id to program
   976		 * the aperture inorder to restore the same. Thus, third list is a
   977		 * dynamic list with triplets as
   978		 * (<aperture, shifted 12 bits> <address> <data>), and the length is
   979		 * stored as number for triplets in dynamic_list_len.
   980		 */
   981		pipe_reglist = adreno_gpu->info->a6xx->pipe_reglist;
   982		for (u32 pipe_id = PIPE_BR; pipe_id <= PIPE_BV; pipe_id++) {
   983			for (i = 0; i < pipe_reglist->count; i++) {
 > 984				if (pipe_reglist->regs[i].pipe & BIT(pipe_id) == 0)
   985					continue;
   986				*dest++ = A7XX_CP_APERTURE_CNTL_HOST_PIPE(pipe_id);
   987				*dest++ = pipe_reglist->regs[i].offset;
   988				*dest++ = a7xx_read_pipe(gpu, pipe_id,
   989							 pipe_reglist->regs[i].offset);
   990				pipe_reglist_count++;
   991			}
   992		}
   993		lock->dynamic_list_len = pipe_reglist_count;
   994	}
   995	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

