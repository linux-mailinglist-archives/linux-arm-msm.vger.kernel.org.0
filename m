Return-Path: <linux-arm-msm+bounces-50754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DD2A5896C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 00:58:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A54051889303
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 23:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C73C21ABAD;
	Sun,  9 Mar 2025 23:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BsseVtY1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDE619D060;
	Sun,  9 Mar 2025 23:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741564709; cv=none; b=f2zNGQ3ipYKZ1Vlq9RCwQu1Uw25r/3qDG9D7TEISyM9L8nGaAtHfBtFO6Xs4sp5s3L7WfvI4EonNQ4HzPvS/zgQl+ZqmAydk9hbD54gkICvnnxLDEqtL0zzMuRHlSxHljPTHjV0mVy19eAlJof05nlo34lwrf6UzbzGnwzAzzI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741564709; c=relaxed/simple;
	bh=3g/+jeRs5nhDAbqAZc0kAv6A5GCo+NTky5mMlZ8s5Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EUuF4FJqkTNCHyzJMwAaRe3GPop43j4yAMiq7QXrAdrReLL/nVejDzQuN/1LaprdGfCy+fHKs+2FLHblPSyvj7m9CHSNO7M4Vt1NO6n8MvK/i40cXtSkOXfgnIlB549SWtoZ+PT3U4/ncJbXEDYrDJCBGRHW3YGr7DFYRyxDnGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BsseVtY1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741564706; x=1773100706;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3g/+jeRs5nhDAbqAZc0kAv6A5GCo+NTky5mMlZ8s5Zw=;
  b=BsseVtY10nORnxgrRtAOVi7iYm6V2jCL5hFT3pJFx1XObJYYOR0Igh5v
   0oC8YxciN3Va9+n9vrrXaMdmcDbrd/rZh61PPqwnzXINVI9ZJHVxclRix
   ARc38pRv2bLfUTgmDMFiDFDJtnXMQhoOTZ5qwHJhMVp8Gln+thpGgn3vq
   9jznR+U7p+Qd4SWTI9Qc/5xeTAGKSsvcjUrE1sPxwuXV7c4Z7tsTutg1s
   Pygaqt2SQ76Gokxsg3CtiyLt3tHCVcoaDrK2G/aksE2EEF2kIqZ7Rcbik
   +uRVRCzCS4Jugz4+YHCFpx1zrRnHPRbeQqD5X3eMznC39VVzse3utaSTe
   g==;
X-CSE-ConnectionGUID: CEaGGiEzQvqJJKc464NNiA==
X-CSE-MsgGUID: Z7HyFwCEQT2qAz8WIJhnbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="52756896"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="52756896"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 16:58:25 -0700
X-CSE-ConnectionGUID: AipAg9jNT0is5bFPMhYlNQ==
X-CSE-MsgGUID: D/npFTWhRJGdziAE2u95Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="124439273"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 09 Mar 2025 16:58:19 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trQX8-0003ZI-02;
	Sun, 09 Mar 2025 23:58:15 +0000
Date: Mon, 10 Mar 2025 07:57:55 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 2/4] drm/msm/hdmi: use new helper for ACR tables
Message-ID: <202503100745.KWEAWjFD-lkp@intel.com>
References: <20250309-drm-hdmi-acr-v1-2-bb9c242f4d4b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309-drm-hdmi-acr-v1-2-bb9c242f4d4b@linaro.org>

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0a2f889128969dab41861b6e40111aa03dc57014]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-display-hdmi-provide-central-data-authority-for-ACR-params/20250309-161610
base:   0a2f889128969dab41861b6e40111aa03dc57014
patch link:    https://lore.kernel.org/r/20250309-drm-hdmi-acr-v1-2-bb9c242f4d4b%40linaro.org
patch subject: [PATCH 2/4] drm/msm/hdmi: use new helper for ACR tables
config: arm-randconfig-004-20250310 (https://download.01.org/0day-ci/archive/20250310/202503100745.KWEAWjFD-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250310/202503100745.KWEAWjFD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503100745.KWEAWjFD-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "drm_hdmi_acr_get_n_cts" [drivers/gpu/drm/msm/msm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

