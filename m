Return-Path: <linux-arm-msm+bounces-28883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA92955A7C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 02:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 046391F217A2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 00:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DD0723AD;
	Sun, 18 Aug 2024 00:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="luH4jFJe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB55E23DE;
	Sun, 18 Aug 2024 00:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723941305; cv=none; b=Bo5cD7O4PunE8at3gdXUQbd22E9oAqzvko6TiXZi6ibmhD7rKLFsN7SdfmrPxAR22ReqtbCWabyiNCzdo0cSoNuLN0cFUohsQQuLKg9hMdxED8RYiLl/DJhyZSl2wdikwC03sMx9JZ/7PJd7UqHuEA/dT5MGggk2Gj1Han+LP7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723941305; c=relaxed/simple;
	bh=YUtKPX24NGFt1ahJB8hjdFaALbagaSaYs077AFGSgpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARmq5C6YTkGouNncy1oujG7IUuhFSDiGHNQyHBgxe+kcMy5v3NIPeWX64YwolUzicnY1gkroI7HfvOF4b0We/gnis8iZpr2FremwlGM3rWmHQ36tBfzPXL6zim6SiTgFW+aYKhWC3ZASQYneMiLRIKIuMPvNRfwWDte8V0ewN6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=luH4jFJe; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723941301; x=1755477301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YUtKPX24NGFt1ahJB8hjdFaALbagaSaYs077AFGSgpM=;
  b=luH4jFJeg0VOfsX/CgcUHR7ptR4PvQoMKb8sdr1HcvU1wlY8GRDz8RfG
   cQHNshvJzQ7oMf5Jo/0fljsJ5uQAX3wFPcpEH0NJAvh//0UD45QUNwUKl
   eKHnNTz+dEMkmWYatcx3/YHwWuGJWv3jd6en2N9/yF+7UhyzG1hD+ALEl
   Qm+7AL0iSLikItSQbOgEbsPf0+0AszYQKrIF4VqewZnTHB5sKIIquW6B9
   rKy742YvnlosTU70Uov8gIOa29SCTw+XL2nQvagc+aWn2PasU2sPQmOQP
   2xOiziudlQQm9bh7u2jOGkx8Usf1IyUregxe4FyCHQDvCc+qEvLXBrQOy
   Q==;
X-CSE-ConnectionGUID: LLpNxaqcS9OnGTchIjokEA==
X-CSE-MsgGUID: EF/wF8e+S1uLCT2++GGjxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="22352656"
X-IronPort-AV: E=Sophos;i="6.10,156,1719903600"; 
   d="scan'208";a="22352656"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2024 17:35:00 -0700
X-CSE-ConnectionGUID: sNZAGN9LTE640PeoEXN7aA==
X-CSE-MsgGUID: 1W/FjaDzRiiTy6ulAyt7jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,156,1719903600"; 
   d="scan'208";a="60053989"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Aug 2024 17:34:56 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfTsk-0007ui-11;
	Sun, 18 Aug 2024 00:34:54 +0000
Date: Sun, 18 Aug 2024 08:34:36 +0800
From: kernel test robot <lkp@intel.com>
To: Antonino Maniscalco <antomani103@gmail.com>,
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Antonino Maniscalco <antomani103@gmail.com>,
	Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [PATCH 4/7] drm/msm/A6xx: Implement preemption for A7XX targets
Message-ID: <202408180848.cWzPm85G-lkp@intel.com>
References: <20240815-preemption-a750-t-v1-4-7bda26c34037@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240815-preemption-a750-t-v1-4-7bda26c34037@gmail.com>

Hi Antonino,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7c626ce4bae1ac14f60076d00eafe71af30450ba]

url:    https://github.com/intel-lab-lkp/linux/commits/Antonino-Maniscalco/drm-msm-Fix-bv_fence-being-used-as-bv_rptr/20240816-023442
base:   7c626ce4bae1ac14f60076d00eafe71af30450ba
patch link:    https://lore.kernel.org/r/20240815-preemption-a750-t-v1-4-7bda26c34037%40gmail.com
patch subject: [PATCH 4/7] drm/msm/A6xx: Implement preemption for A7XX targets
config: x86_64-buildonly-randconfig-001-20240818 (https://download.01.org/0day-ci/archive/20240818/202408180848.cWzPm85G-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240818/202408180848.cWzPm85G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408180848.cWzPm85G-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/msm/adreno/a6xx_preempt.c:49:17: error: unused variable 'cur_wptr' [-Werror,-Wunused-variable]
      49 |         uint32_t wptr, cur_wptr;
         |                        ^~~~~~~~
   1 error generated.


vim +/cur_wptr +49 drivers/gpu/drm/msm/adreno/a6xx_preempt.c

    44	
    45	/* Write the most recent wptr for the given ring into the hardware */
    46	static inline void update_wptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
    47	{
    48		unsigned long flags;
  > 49		uint32_t wptr, cur_wptr;
    50	
    51		if (!ring)
    52			return;
    53	
    54		spin_lock_irqsave(&ring->preempt_lock, flags);
    55	
    56		if (ring->skip_inline_wptr) {
    57			wptr = get_wptr(ring);
    58	
    59			gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
    60	
    61			ring->skip_inline_wptr = false;
    62		}
    63	
    64		spin_unlock_irqrestore(&ring->preempt_lock, flags);
    65	}
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

