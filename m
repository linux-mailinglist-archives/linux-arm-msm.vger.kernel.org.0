Return-Path: <linux-arm-msm+bounces-21695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9285A8FC29F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 06:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E86E284295
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 04:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA08360DFA;
	Wed,  5 Jun 2024 04:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ID06bQGa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7A85C603;
	Wed,  5 Jun 2024 04:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717561418; cv=none; b=tZN+TsYck9QWnsOU2oGbIgK6DgTF5v5GKL+v6qRouS0om94PHhM0VFXyiKMXBGGIwxK4rHQVsQSmscbomqpvYhAwomGLc4b97w3BXYu/Np4oNv9DRG8sjYmudTBRZe9RiXcnMlCbqQPAAjIlLSiMCr1IZGcEHVbc4F+aRO/2RrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717561418; c=relaxed/simple;
	bh=oe2xk2L9DBQy7GU2pkfgXSHX+LZ0yoNjbg7ml65IEag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qKOArZKYMi6ODr0MnK4EECeot83lYikBQ3Ofj61Izz6gyvthWDTgqUz1P6hgeJ/V+N1peaMLTMY+clmKZudSbKo4OMa/5o0es4oWitxPHIaRJvo9W7PfZ8vr8VXgkZ9TTEKyWOiVEK/pjGaL6oBANyCRrS9uL6MUiqWfBLxqg6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ID06bQGa; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717561416; x=1749097416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oe2xk2L9DBQy7GU2pkfgXSHX+LZ0yoNjbg7ml65IEag=;
  b=ID06bQGaPzcSoZlKlhSods3wxFSzqcPExjIh5OurcdQDf3vcMIE3jQFx
   C8Iq9a40GYTaHh84zp8b1yzeZID0g59r/oywyluySqpcjmksn8vevazl6
   1TKkgMokRXuQy17rJjLTgIDiF6b4DhWMgDKdVnkdm+SuhkkH898iOSG1n
   /V28KaRkO8Me44O4K2oRVS9fOIZ54peXZVYuGxS9syNQxr+YHTwzS0J+I
   dXZXYjGau4cg4m1lJAYjFLtTGV6EU36Mk1V4lnlot/n2x99Idh/RK6nK3
   d7S/4AgU+epx4Vu7BlSZ6okVr077Jf9kIvZViKpmuz6glMstgUNE9WfXb
   A==;
X-CSE-ConnectionGUID: hRmpDI4mTXqeRtL/ZyCWkg==
X-CSE-MsgGUID: 2CZFe05JS4W08XGu/jNelg==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="14329248"
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; 
   d="scan'208";a="14329248"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 21:23:35 -0700
X-CSE-ConnectionGUID: Tkj46dYcT9ml409QlF4Tag==
X-CSE-MsgGUID: JimUKZdwTouS37wlROTS/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; 
   d="scan'208";a="37515024"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 04 Jun 2024 21:23:32 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEiBM-0000ud-2h;
	Wed, 05 Jun 2024 04:23:28 +0000
Date: Wed, 5 Jun 2024 12:22:41 +0800
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
Message-ID: <202406051226.b050NPQf-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next-fixes]
[also build test ERROR on drm-tip/drm-tip linus/master v6.10-rc2 next-20240604]
[cannot apply to drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhinav-Kumar/drm-msm-a6xx-use-__always_unused-to-fix-compiler-warnings-for-gen7_-includes/20240605-055341
base:   git://anongit.freedesktop.org/drm-intel for-linux-next-fixes
patch link:    https://lore.kernel.org/r/20240604215105.4057278-1-quic_abhinavk%40quicinc.com
patch subject: [PATCH] drm/msm/a6xx: use __always_unused to fix compiler warnings for gen7_* includes
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20240605/202406051226.b050NPQf-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240605/202406051226.b050NPQf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406051226.b050NPQf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:13:
>> drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h:114:18: error: 'gen7_9_0_cx_debugbus_blocks' defined but not used [-Werror=unused-const-variable=]
     114 | static const u32 gen7_9_0_cx_debugbus_blocks[] = {
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


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

