Return-Path: <linux-arm-msm+bounces-28794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD6C9548AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 14:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFA0D1C22AE8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 12:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5FE11A4F04;
	Fri, 16 Aug 2024 12:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aYqtBBdg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810E81991D2;
	Fri, 16 Aug 2024 12:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723811040; cv=none; b=KBqYiJRuKY0vL4TciiB/dNEt4RRHQUnR+FYJU8jwRk+e6GQhdbv1NJidCEmDPlt3bdYKtWXP9INcDLNiwGJEbeohydZuT0IfMffciLFprrj7JjxFqoP1OcuI2N94kSHCNmAZ8mxCv7h6s110xYSud5vfbexLNvZPKkcQLtbKabw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723811040; c=relaxed/simple;
	bh=0XjBuQ5Ujk4jTqxw19KMbPoC57UVqxNo9JAgL8Zw148=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TdbeGUMBNPHFIPKSU3+ghWvI9T3e9oe6quP+8ZqXRJigwOOu67EejY+uil6tszJNZ5Tvzg2izVp1qt36qSpMYBZg1/wcAZWV8MVNS2SvcdDK2DlL/EeG2BBylyp66BrJr3kFEIjQuQ0tWUPxOsG6nkwfrkq7kLa5wdOZCnHWSwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aYqtBBdg; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723811038; x=1755347038;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0XjBuQ5Ujk4jTqxw19KMbPoC57UVqxNo9JAgL8Zw148=;
  b=aYqtBBdgNnNTSV5pfAszHc7lgscHK0UzHc01ktKYC3lfFZjo0+opPpN2
   4CGEVnstYDzgptBz1bTXFXn+I2617VLhkrt6QB42zVIaqyW6vxj3Lv3lX
   WgO9zFWC1U0GSJdK588geEg4Shrn7ZLN1Q0zd67o8grF964usTZ/nNi8g
   jNo1YO/ZJc9aH0dNk79EtOKUZXRcc5/n9XQpzYei8uGNUzVeVwbxO9RYm
   3wkIfTwoDsx8kMjXuM2NEAY/0CtTV3+8Kjn1RNtKAjyprgEKa5/UQ4lyY
   ++30kDoNYZA8xJ0pyKZtBwBiMBm4kdo44dHULc7xO6oOgzwDWbMuSQboH
   w==;
X-CSE-ConnectionGUID: I82+TdUmQje/iNe2JrIcoA==
X-CSE-MsgGUID: e74t4+9tT2e4mGaXUrmUIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22250475"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="22250475"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 05:23:57 -0700
X-CSE-ConnectionGUID: jTI0ERjdQYOOOYnshjCUog==
X-CSE-MsgGUID: S9gzk8e6RFu1PRuXaiBdrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="60218489"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Aug 2024 05:23:54 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sevzj-0006Os-1J;
	Fri, 16 Aug 2024 12:23:51 +0000
Date: Fri, 16 Aug 2024 20:23:36 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Antonino Maniscalco <antomani103@gmail.com>,
	Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [PATCH 4/7] drm/msm/A6xx: Implement preemption for A7XX targets
Message-ID: <202408161951.81zgvcJ5-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7c626ce4bae1ac14f60076d00eafe71af30450ba]

url:    https://github.com/intel-lab-lkp/linux/commits/Antonino-Maniscalco/drm-msm-Fix-bv_fence-being-used-as-bv_rptr/20240816-023442
base:   7c626ce4bae1ac14f60076d00eafe71af30450ba
patch link:    https://lore.kernel.org/r/20240815-preemption-a750-t-v1-4-7bda26c34037%40gmail.com
patch subject: [PATCH 4/7] drm/msm/A6xx: Implement preemption for A7XX targets
config: i386-buildonly-randconfig-001-20240816 (https://download.01.org/0day-ci/archive/20240816/202408161951.81zgvcJ5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408161951.81zgvcJ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408161951.81zgvcJ5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/msm/adreno/a6xx_preempt.c: In function 'update_wptr':
>> drivers/gpu/drm/msm/adreno/a6xx_preempt.c:49:24: warning: unused variable 'cur_wptr' [-Wunused-variable]
      49 |         uint32_t wptr, cur_wptr;
         |                        ^~~~~~~~


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

