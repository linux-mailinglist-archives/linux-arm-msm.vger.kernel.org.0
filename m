Return-Path: <linux-arm-msm+bounces-51211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BE9A5EA5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 04:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D0783B81B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 03:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39C613212A;
	Thu, 13 Mar 2025 03:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kGiEvRdO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5ED6A33B;
	Thu, 13 Mar 2025 03:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741838359; cv=none; b=KIONPtfx5WdCI1T5B3viT5MfBO2OCqbPTfymH2CAEuw0akFlPDvrcT+k34+BkeEWXj3pB0nNi+C7+j/tC6QpaOEicAFow+IzbofcApY3T5P49+1VWSekiNbCsLpkfTBBrCKHmU/FyqNymi0x25O93HrqJ+RDiWg5ke827dGZAgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741838359; c=relaxed/simple;
	bh=cYwKWE3qx6aAxxggYpyZsccNMSnGdzKXacMIEiXDO/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4pWUiBCKmeOuA42q8Lw+lPUQQpxeB/O4vqtSqkVlc4X3/eq6gEch8NsMzZuEEUYROjgRfxcHgW6d8z2Usdmlo7hQy2KofO60UqxBXuaAATQrfv+JGvgduNBV7FCnfUVdBwbEiurIm7JIDS5An0kXIrxOgaDLK+zfXbCD6fM8Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kGiEvRdO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741838358; x=1773374358;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cYwKWE3qx6aAxxggYpyZsccNMSnGdzKXacMIEiXDO/w=;
  b=kGiEvRdO7ypxyKy9Dq7ERrqi+cRZELn0kZdpKbsZ9OglnTZ44djU0w9U
   rjeUe0OEb+klJuessPL5uKt88muhj50SvsOaN0V2wnozm05W+p53IaV0a
   uPMjbQl9b2Wg4CAEsb+rHQ25D4+EY3Kcb5EWfESAoWiFyVGheoDM4By5P
   pGxliT9RptJ7/9KXDqWxzxRo5rPJYZBFRFLRvjzFf2pvYkgFRVfIYgFZP
   3ynis5t86WFyYFcm33LJOuri/7AwpZX0p4or3qkgFyNo7gqyMVpXQ2Y/T
   B2xA7uHaZV+RuLH6lzZLfwzcuMwJP+qEWPJKV8zq/4PIF8DjTxuCqN9I0
   g==;
X-CSE-ConnectionGUID: aiFTEeKMQT6QnIFQ0ebjSw==
X-CSE-MsgGUID: KqjYrxgPQReL4mlthIVafQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="68294328"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="68294328"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 20:59:17 -0700
X-CSE-ConnectionGUID: Jk/rBPr/R+CE+fsVXvv0Hg==
X-CSE-MsgGUID: rCVWNuURQ4Kucu2VbRCsgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="121530505"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 12 Mar 2025 20:59:12 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsZij-00096K-1j;
	Thu, 13 Mar 2025 03:59:01 +0000
Date: Thu, 13 Mar 2025 11:58:50 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
	airlied@gmail.com, mripard@kernel.org,
	maarten.lankhorst@linux.intel.com, geert@linux-m68k.org,
	tomi.valkeinen@ideasonboard.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v4 18/25] drm/renesas/rz-du: Compute dumb-buffer sizes
 with drm_mode_size_dumb()
Message-ID: <202503131309.ZzS9Tova-lkp@intel.com>
References: <20250311155120.442633-19-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311155120.442633-19-tzimmermann@suse.de>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250311]
[also build test ERROR on v6.14-rc6]
[cannot apply to drm-exynos/exynos-drm-next rockchip/for-next tegra/for-next drm-xe/drm-xe-next linus/master v6.14-rc6 v6.14-rc5 v6.14-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-dumb-buffers-Sanitize-output-on-errors/20250311-235818
base:   next-20250311
patch link:    https://lore.kernel.org/r/20250311155120.442633-19-tzimmermann%40suse.de
patch subject: [PATCH v4 18/25] drm/renesas/rz-du: Compute dumb-buffer sizes with drm_mode_size_dumb()
config: i386-buildonly-randconfig-003-20250313 (https://download.01.org/0day-ci/archive/20250313/202503131309.ZzS9Tova-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503131309.ZzS9Tova-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503131309.ZzS9Tova-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c:10:
   In file included from include/drm/drm_atomic.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2296:
   include/linux/vmstat.h:507:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     507 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c:80:8: error: call to undeclared function 'drm_mode_size_dumb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      80 |         ret = drm_mode_size_dumb(dev, args, 16 * args->bpp / 8, 0);
         |               ^
   drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c:80:8: note: did you mean 'drm_mode_set_name'?
   include/drm/drm_modes.h:530:6: note: 'drm_mode_set_name' declared here
     530 | void drm_mode_set_name(struct drm_display_mode *mode);
         |      ^
   1 warning and 1 error generated.


vim +/drm_mode_size_dumb +80 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c

    70	
    71	/* -----------------------------------------------------------------------------
    72	 * Frame buffer
    73	 */
    74	
    75	int rzg2l_du_dumb_create(struct drm_file *file, struct drm_device *dev,
    76				 struct drm_mode_create_dumb *args)
    77	{
    78		int ret;
    79	
  > 80		ret = drm_mode_size_dumb(dev, args, 16 * args->bpp / 8, 0);
    81		if (ret)
    82			return ret;
    83	
    84		return drm_gem_dma_dumb_create_internal(file, dev, args);
    85	}
    86	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

