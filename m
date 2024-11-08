Return-Path: <linux-arm-msm+bounces-37338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A51E19C1A12
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 11:13:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 362301F25F1A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 10:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA391E1C07;
	Fri,  8 Nov 2024 10:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jRt8yXNt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C621D3625;
	Fri,  8 Nov 2024 10:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731060785; cv=none; b=RfbQH+PqgqxBU4fPR1y84AKPwPVM3oF14o8JFYF7izIK9yeB0kc/3V1V0xiPQBiX8kxbIVYlvr2/n8BAM9KZea8bRH1LsFDYRrLhONcBuwDcV4qOZHm6er2AeKDu9297YOlY+37FTAQ3VTCoYIlcjvr5QujRaQ0cQYCrOUhgwT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731060785; c=relaxed/simple;
	bh=Er/tiXvYNotlGr/mneGDlszAar7ahjAVj3NcCM7/bH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ceQcpyp49RACRM9iJ8fU9qQSCwmZF5ZOzvtwdUMVhR1WzLE8g+k6Hz4lezKPvuJVvosdXmXE5zj8QSoRYB0H37MbKNrHdfe1P2otvcC+RSY9PfYKmfpw8uoJny3Up3l/uMx5MHzQp4XEZ0TrQAw2gGB2s67rbRwtvVV7PlCye/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jRt8yXNt; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731060784; x=1762596784;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Er/tiXvYNotlGr/mneGDlszAar7ahjAVj3NcCM7/bH0=;
  b=jRt8yXNtvWL1zFBoUr2JnOw3u5/uWMGs8yHgGo3/XDDuvr/pa4RWEFDH
   befAvK6HqEMqXJcO3tiyuA6ZhRhNrOOPN+pTJfuXHeq8xWawdXWETH1ew
   MdwDCEXzksLQUrcE5pbd8hGX5IcJ8fwiaRNtLVWohV14gHk/UdYkgUoSz
   5BBlWCGnYJ/oTAbaAEVL9VHFB/iYw1Tum0u0EDmMX23eT1uB9lj6chlYt
   J8BH+X4OAHqaJDYNZG2cc/W3wGo5duvqEqAHoi+q6Pbb9JZR++7uAeJZd
   nj1oVnnJGN1pLvWrngcHuhIeVPOKS3u5Fuw6A/41H9IWi8V3xu91YdLGz
   g==;
X-CSE-ConnectionGUID: 3FgmCCXcQwGbYAximJwcNw==
X-CSE-MsgGUID: evb36DKpRXmH0+fTiuixhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31107460"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31107460"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 02:13:03 -0800
X-CSE-ConnectionGUID: jUkMLQ6oRBObxq1OX6AHXA==
X-CSE-MsgGUID: G7grHtHIRay2/KDuPft3zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="85629448"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Nov 2024 02:12:58 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9Lz6-000rIQ-1U;
	Fri, 08 Nov 2024 10:12:56 +0000
Date: Fri, 8 Nov 2024 18:12:26 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Paloma Arellano <quic_parellan@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Douglas Anderson <dianders@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 11/14] drm/msm/dp: move/inline audio related functions
Message-ID: <202411081748.0PPL9MIj-lkp@intel.com>
References: <20241108-fd-dp-audio-fixup-v1-11-40c8eeb60cf5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108-fd-dp-audio-fixup-v1-11-40c8eeb60cf5@linaro.org>

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 74741a050b79d31d8d2eeee12c77736596d0a6b2]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-msm-dp-fix-msm_dp_utils_pack_sdp_header-interface/20241108-082302
base:   74741a050b79d31d8d2eeee12c77736596d0a6b2
patch link:    https://lore.kernel.org/r/20241108-fd-dp-audio-fixup-v1-11-40c8eeb60cf5%40linaro.org
patch subject: [PATCH 11/14] drm/msm/dp: move/inline audio related functions
config: x86_64-buildonly-randconfig-002-20241108 (https://download.01.org/0day-ci/archive/20241108/202411081748.0PPL9MIj-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411081748.0PPL9MIj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411081748.0PPL9MIj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/msm/dp/dp_audio.c:11:
   In file included from include/drm/display/drm_dp_helper.h:27:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/msm/dp/dp_audio.c:213:5: warning: variable 'safe_to_exit_level' is uninitialized when used here [-Wuninitialized]
     213 |                                 safe_to_exit_level);
         |                                 ^~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:636:59: note: expanded from macro 'drm_dbg_dp'
     636 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DP, fmt, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/drm/drm_print.h:540:39: note: expanded from macro 'drm_dev_dbg'
     540 |         __drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
         |                                              ^~~~~~~~~~~
   drivers/gpu/drm/msm/dp/dp_audio.c:198:24: note: initialize the variable 'safe_to_exit_level' to silence this warning
     198 |         u32 safe_to_exit_level, mainlink_levels;
         |                               ^
         |                                = 0
   2 warnings generated.


vim +/safe_to_exit_level +213 drivers/gpu/drm/msm/dp/dp_audio.c

d13e36d7d2227e Abhinav Kumar    2020-09-12  195  
fb7d509b1710d1 Dmitry Baryshkov 2024-10-29  196  static void msm_dp_audio_safe_to_exit_level(struct msm_dp_audio_private *audio)
d13e36d7d2227e Abhinav Kumar    2020-09-12  197  {
568837beeb38ef Dmitry Baryshkov 2024-11-08  198  	u32 safe_to_exit_level, mainlink_levels;
d13e36d7d2227e Abhinav Kumar    2020-09-12  199  
fb7d509b1710d1 Dmitry Baryshkov 2024-10-29  200  	switch (audio->msm_dp_audio.lane_count) {
d13e36d7d2227e Abhinav Kumar    2020-09-12  201  	case 1:
d13e36d7d2227e Abhinav Kumar    2020-09-12  202  		safe_to_exit_level = 14;
d13e36d7d2227e Abhinav Kumar    2020-09-12  203  		break;
d13e36d7d2227e Abhinav Kumar    2020-09-12  204  	case 2:
d13e36d7d2227e Abhinav Kumar    2020-09-12  205  		safe_to_exit_level = 8;
d13e36d7d2227e Abhinav Kumar    2020-09-12  206  		break;
d13e36d7d2227e Abhinav Kumar    2020-09-12  207  	case 4:
d13e36d7d2227e Abhinav Kumar    2020-09-12  208  		safe_to_exit_level = 5;
d13e36d7d2227e Abhinav Kumar    2020-09-12  209  		break;
d13e36d7d2227e Abhinav Kumar    2020-09-12  210  	default:
202aceac8bb3ae Kuogee Hsieh     2022-02-17  211  		drm_dbg_dp(audio->drm_dev,
202aceac8bb3ae Kuogee Hsieh     2022-02-17  212  				"setting the default safe_to_exit_level = %u\n",
d13e36d7d2227e Abhinav Kumar    2020-09-12 @213  				safe_to_exit_level);
d13e36d7d2227e Abhinav Kumar    2020-09-12  214  		safe_to_exit_level = 14;
d13e36d7d2227e Abhinav Kumar    2020-09-12  215  		break;
d13e36d7d2227e Abhinav Kumar    2020-09-12  216  	}
d13e36d7d2227e Abhinav Kumar    2020-09-12  217  
568837beeb38ef Dmitry Baryshkov 2024-11-08  218  	mainlink_levels = msm_dp_read_link(audio->catalog, REG_DP_MAINLINK_LEVELS);
568837beeb38ef Dmitry Baryshkov 2024-11-08  219  	mainlink_levels &= 0xFE0;
568837beeb38ef Dmitry Baryshkov 2024-11-08  220  	mainlink_levels |= safe_to_exit_level;
568837beeb38ef Dmitry Baryshkov 2024-11-08  221  
568837beeb38ef Dmitry Baryshkov 2024-11-08  222  	drm_dbg_dp(audio->drm_dev,
568837beeb38ef Dmitry Baryshkov 2024-11-08  223  		   "mainlink_level = 0x%x, safe_to_exit_level = 0x%x\n",
568837beeb38ef Dmitry Baryshkov 2024-11-08  224  		   mainlink_levels, safe_to_exit_level);
568837beeb38ef Dmitry Baryshkov 2024-11-08  225  
568837beeb38ef Dmitry Baryshkov 2024-11-08  226  	msm_dp_write_link(audio->catalog, REG_DP_MAINLINK_LEVELS, mainlink_levels);
d13e36d7d2227e Abhinav Kumar    2020-09-12  227  }
d13e36d7d2227e Abhinav Kumar    2020-09-12  228  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

