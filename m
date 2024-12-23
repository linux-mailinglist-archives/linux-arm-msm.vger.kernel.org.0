Return-Path: <linux-arm-msm+bounces-43091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D849FA919
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 02:52:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 103A6188590C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 01:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD821EACE;
	Mon, 23 Dec 2024 01:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NMDmi1Zc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2999D528;
	Mon, 23 Dec 2024 01:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734918768; cv=none; b=XrqP0YocCB/CD5IhPuL1UR1BdzeHbdbAaspgIcl9iVqJcba+kligAA9A1T440d79MZSKxazhOKBS5z9xEGwSf4ISTEGqRha9bsqumduWK+N2Gbqdy03JcAGQL+17U+6D85h15ESA3pvMPXsiE/iJOFwKT0MsYr5yi4Zj4UWwsDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734918768; c=relaxed/simple;
	bh=T4sCONtDkgWBgW5Y5liRBMMMB+hz5OrLq7axDA3q130=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UTpM0xjHBXDlbmwU/D3dATXpM1+SXslUjL/ePdeTNjJJczD/8uWZbi0cLG4qgHGGoYyU+mVO79KY8RJyoAahItdoFOP/tny8Evx8VFG6pP13gz4AQ0hDP+1iNFslxNEA5SlhAs6p6/q1Yk5/Z1wb3/C66iu03MVxcz2UW/iRu3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NMDmi1Zc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734918766; x=1766454766;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T4sCONtDkgWBgW5Y5liRBMMMB+hz5OrLq7axDA3q130=;
  b=NMDmi1Zc6EnKghtEGnDlNzly/AoantsecPYpArdRVL+EtJNdWNCJquPq
   sGTnmuiBhKhnMkMDDkB6c0m1d9udo/3WQjPW7HvLFVkh86FTVp9pU+rLI
   TzMXlvbOwdZeJNJNYqLCGLpwrlImKmveG6jKGWha/yhGbaNwdgzyOYlUw
   eCCoUb4KNO6bfJdpPKDHJLdDdidU5M2EEwxynxLrWSit3temmP278+xkT
   h27QJt2fII8yAJEGeUNop7hG0je6Io1Rq06ZPUS0qdzN7lhL+feVZd69y
   G4IUQML4ZYC/C8oho+tTt40iguK8p1COWq0nTgU+fWU/YNDH9s5imbd9Q
   A==;
X-CSE-ConnectionGUID: rhyGjCKSTVexTF7ju3EltA==
X-CSE-MsgGUID: WMH8zYLeQXGlvj++Mp1aiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="35413818"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="35413818"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 17:52:46 -0800
X-CSE-ConnectionGUID: nEucv8zaSSS5RJ7lHaLYXw==
X-CSE-MsgGUID: QPyOoHUSSTaXQrF2qZgLqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122359887"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Dec 2024 17:51:44 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPXbi-0003Lj-1m;
	Mon, 23 Dec 2024 01:51:42 +0000
Date: Mon, 23 Dec 2024 09:50:58 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Paloma Arellano <quic_parellan@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Douglas Anderson <dianders@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 11/11] drm/msm/dp: drop the msm_dp_catalog module
Message-ID: <202412230903.RMun9kc4-lkp@intel.com>
References: <20241222-fd-dp-audio-fixup-v5-11-370f09492cf6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241222-fd-dp-audio-fixup-v5-11-370f09492cf6@linaro.org>

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on c9261bcc1546a564407513e148c35a79a58bc2b9]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-msm-dp-split-MMSS_DP_DSC_DTO-register-write-to-a-separate-function/20241223-041635
base:   c9261bcc1546a564407513e148c35a79a58bc2b9
patch link:    https://lore.kernel.org/r/20241222-fd-dp-audio-fixup-v5-11-370f09492cf6%40linaro.org
patch subject: [PATCH v5 11/11] drm/msm/dp: drop the msm_dp_catalog module
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20241223/202412230903.RMun9kc4-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412230903.RMun9kc4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412230903.RMun9kc4-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/msm/dp/dp_panel.c: In function 'msm_dp_read_link':
>> drivers/gpu/drm/msm/dp/dp_panel.c:33:16: error: implicit declaration of function 'readl_relaxed' [-Wimplicit-function-declaration]
      33 |         return readl_relaxed(panel->link_base + offset);
         |                ^~~~~~~~~~~~~
   drivers/gpu/drm/msm/dp/dp_panel.c: In function 'msm_dp_write_link':
>> drivers/gpu/drm/msm/dp/dp_panel.c:43:9: error: implicit declaration of function 'writel' [-Wimplicit-function-declaration]
      43 |         writel(data, panel->link_base + offset);
         |         ^~~~~~


vim +/readl_relaxed +33 drivers/gpu/drm/msm/dp/dp_panel.c

    30	
    31	static inline u32 msm_dp_read_link(struct msm_dp_panel_private *panel, u32 offset)
    32	{
  > 33		return readl_relaxed(panel->link_base + offset);
    34	}
    35	
    36	static inline void msm_dp_write_link(struct msm_dp_panel_private *panel,
    37				       u32 offset, u32 data)
    38	{
    39		/*
    40		 * To make sure link reg writes happens before any other operation,
    41		 * this function uses writel() instread of writel_relaxed()
    42		 */
  > 43		writel(data, panel->link_base + offset);
    44	}
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

