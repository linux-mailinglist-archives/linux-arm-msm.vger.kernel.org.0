Return-Path: <linux-arm-msm+bounces-78834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A288C0B75C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 00:43:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4B30A4E02E8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 23:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C70C430147E;
	Sun, 26 Oct 2025 23:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/3ny1uQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97BE27F75C;
	Sun, 26 Oct 2025 23:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761522194; cv=none; b=Kr4LEvBorTB8tvsWTe+kT8gohaDI+nPaqEvDAYEt1vmXLabHoh2crToJ0t9aoEt07AjRyZvSCBC52Tt/vBPurUo6zk+Bfa/4I5t1nxO/loEkAnpzxudft5PZOKPY70M57Yd3Bc2gILM8+ZHy87Z+P+w0c8Q95kxs8542FH+aRLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761522194; c=relaxed/simple;
	bh=4CjfzhsTDxD9DRcK2ivVlUezVMzZMKQloqNF5Aic2pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQys2/ULnhzTfEd2fU2XE4MdfvFsDMC7+kZwCUlhihjsQkbBqLoO2guFNvvf+rWGShs0E/3Y0NyxLWo8gkmU0QxKLax9/m32lWeC7z2m0O4OHtQPWPIS5xDrti/CPjPYCv3Emxm9oAFvxxyok/ya+goJGu9SFWBzkwO9K8lGY4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/3ny1uQ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761522192; x=1793058192;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4CjfzhsTDxD9DRcK2ivVlUezVMzZMKQloqNF5Aic2pI=;
  b=X/3ny1uQLOYxq7GA1n32Nj21et2j6Wlb8dvfwDeB2wF8lW9ODNdmROfP
   JA2P3XwGMimVN34i8/twp5jQlODtDe/kHCj4yKp937NWdjGrmy3Bfk6Wf
   +sBmGHckgYVi0TaQbEjxndxh6DERqQWW0RqIXv5rL6mvPd+85+qZym42J
   WNlttCyfuECusgUzNQ10uI5Y6kqtt/72kVIxY3QnTlnyhEibQ/6Ns26tl
   M6yV6Cpj2wwVHmyw1ERF2hwEj5b1hb8g5e6spF8soAl8cyoAXeXn0E/FE
   yqXmJDvdP+GqOkEombPwOdA2a0q1FwlRIqhal5K3Ha0wdDjTwuPXbWovD
   w==;
X-CSE-ConnectionGUID: 7rvUrd1QTJSoMmhmt7iMqA==
X-CSE-MsgGUID: Tpik+rRmSbyvlY82xGdMgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74721960"
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="74721960"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 16:43:11 -0700
X-CSE-ConnectionGUID: vX1q8uVaRhS55w7q3l3fXg==
X-CSE-MsgGUID: pS5jORfYRXCS2zR88DafoA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 26 Oct 2025 16:43:04 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDANk-000GOz-05;
	Sun, 26 Oct 2025 23:42:50 +0000
Date: Mon, 27 Oct 2025 07:41:55 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
	airlied@gmail.com, simona@ffwll.ch, linux@armlinux.org.uk,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	inki.dae@samsung.com, sw0312.kim@samsung.com,
	kyungmin.park@samsung.com, patrik.r.jakobsson@gmail.com,
	jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
	robin.clark@oss.qualcomm.com, lumag@kernel.org,
	abhinav.kumar@linux.dev, sean@poorly.run,
	marijn.suijten@somainline.org, tomi.valkeinen@ideasonboard.com,
	alexander.deucher@amd.com, christian.koenig@amd.com,
	thierry.reding@gmail.com, mperttunen@nvidia.com,
	jonathanh@nvidia.com
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] drm/fb-helper: Allocate and release fb_info in single
 place
Message-ID: <202510270728.dixqTvyI-lkp@intel.com>
References: <20251026173944.219373-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251026173944.219373-1-tzimmermann@suse.de>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on drm-i915/for-linux-next drm-i915/for-linux-next-fixes tegra/for-next linus/master v6.18-rc2 next-20251024]
[cannot apply to rmk-arm/drm-armada-devel rmk-arm/drm-armada-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-fb-helper-Allocate-and-release-fb_info-in-single-place/20251027-014054
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20251026173944.219373-1-tzimmermann%40suse.de
patch subject: [PATCH] drm/fb-helper: Allocate and release fb_info in single place
config: x86_64-buildonly-randconfig-003-20251027 (https://download.01.org/0day-ci/archive/20251027/202510270728.dixqTvyI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510270728.dixqTvyI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510270728.dixqTvyI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/radeon/radeon_fbdev.c: In function 'radeon_fbdev_driver_fbdev_probe':
>> drivers/gpu/drm/radeon/radeon_fbdev.c:275:1: warning: label 'err_drm_framebuffer_unregister_private' defined but not used [-Wunused-label]
     275 | err_drm_framebuffer_unregister_private:
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/gma500/fbdev.c: In function 'psb_fbdev_driver_fbdev_probe':
>> drivers/gpu/drm/gma500/fbdev.c:239:1: warning: label 'err_drm_framebuffer_unregister_private' defined but not used [-Wunused-label]
     239 | err_drm_framebuffer_unregister_private:
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/err_drm_framebuffer_unregister_private +275 drivers/gpu/drm/radeon/radeon_fbdev.c

041f5c416217e37 drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  202  
41d48e557e01582 drivers/gpu/drm/radeon/radeon_fbdev.c Thomas Zimmermann 2024-09-24  203  int radeon_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  204  				    struct drm_fb_helper_surface_size *sizes)
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  205  {
041f5c416217e37 drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  206  	struct radeon_device *rdev = fb_helper->dev->dev_private;
c0a8e4443d768e5 drivers/gpu/drm/radeon/radeon_fbdev.c Imre Deak         2025-08-05  207  	const struct drm_format_info *format_info;
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  208  	struct drm_mode_fb_cmd2 mode_cmd = { };
da786b90bcbd1c5 drivers/gpu/drm/radeon/radeon_fbdev.c Thomas Zimmermann 2025-10-26  209  	struct fb_info *info = fb_helper->info;
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  210  	struct drm_gem_object *gobj;
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  211  	struct radeon_bo *rbo;
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  212  	struct drm_framebuffer *fb;
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  213  	int ret;
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  214  	unsigned long tmp;
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  215  
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  216  	mode_cmd.width = sizes->surface_width;
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  217  	mode_cmd.height = sizes->surface_height;
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  218  
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  219  	/* avivo can't scanout real 24bpp */
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  220  	if ((sizes->surface_bpp == 24) && ASIC_IS_AVIVO(rdev))
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  221  		sizes->surface_bpp = 32;
771fe6b912fca54 drivers/gpu/drm/radeon/radeon_fb.c    Jerome Glisse     2009-06-05  222  
308e5bcbdb10452 drivers/gpu/drm/radeon/radeon_fb.c    Jesse Barnes      2011-11-14  223  	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
308e5bcbdb10452 drivers/gpu/drm/radeon/radeon_fb.c    Jesse Barnes      2011-11-14  224  							  sizes->surface_depth);
771fe6b912fca54 drivers/gpu/drm/radeon/radeon_fb.c    Jerome Glisse     2009-06-05  225  
c0a8e4443d768e5 drivers/gpu/drm/radeon/radeon_fbdev.c Imre Deak         2025-08-05  226  	format_info = drm_get_format_info(rdev_to_drm(rdev), mode_cmd.pixel_format,
c0a8e4443d768e5 drivers/gpu/drm/radeon/radeon_fbdev.c Imre Deak         2025-08-05  227  					  mode_cmd.modifier[0]);
c0a8e4443d768e5 drivers/gpu/drm/radeon/radeon_fbdev.c Imre Deak         2025-08-05  228  	ret = radeon_fbdev_create_pinned_object(fb_helper, format_info, &mode_cmd, &gobj);
aaefcd4284a5399 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2012-03-06  229  	if (ret) {
aaefcd4284a5399 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2012-03-06  230  		DRM_ERROR("failed to create fbcon object %d\n", ret);
aaefcd4284a5399 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2012-03-06  231  		return ret;
aaefcd4284a5399 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2012-03-06  232  	}
7e4d15d90afe46d drivers/gpu/drm/radeon/radeon_fb.c    Simona Vetter     2011-02-18  233  	rbo = gem_to_radeon_bo(gobj);
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  234  
c4aab3499be2abd drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  235  	fb = kzalloc(sizeof(*fb), GFP_KERNEL);
c4aab3499be2abd drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  236  	if (!fb) {
c4aab3499be2abd drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  237  		ret = -ENOMEM;
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  238  		goto err_radeon_fbdev_destroy_pinned_object;
c4aab3499be2abd drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  239  	}
c0a8e4443d768e5 drivers/gpu/drm/radeon/radeon_fbdev.c Imre Deak         2025-08-05  240  	ret = radeon_framebuffer_init(rdev_to_drm(rdev), fb, format_info, &mode_cmd, gobj);
aaefcd4284a5399 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2012-03-06  241  	if (ret) {
8b513d0cf603c0a drivers/gpu/drm/radeon/radeon_fb.c    Masanari Iida     2013-05-21  242  		DRM_ERROR("failed to initialize framebuffer %d\n", ret);
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  243  		goto err_kfree;
aaefcd4284a5399 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2012-03-06  244  	}
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  245  
386516744ba45d5 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  246  	/* setup helper */
41d48e557e01582 drivers/gpu/drm/radeon/radeon_fbdev.c Thomas Zimmermann 2024-09-24  247  	fb_helper->funcs = &radeon_fbdev_fb_helper_funcs;
041f5c416217e37 drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  248  	fb_helper->fb = fb;
771fe6b912fca54 drivers/gpu/drm/radeon/radeon_fb.c    Jerome Glisse     2009-06-05  249  
041f5c416217e37 drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  250  	info->fbops = &radeon_fbdev_fb_ops;
40e324e0d859d76 drivers/gpu/drm/radeon/radeon_fbdev.c Thomas Zimmermann 2023-07-15  251  
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  252  	/* radeon resume is fragile and needs a vt switch to help it along */
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  253  	info->skip_vt_switch = false;
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  254  
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  255  	drm_fb_helper_fill_info(info, fb_helper, sizes);
785b93ef8c30973 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2009-08-28  256  
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  257  	tmp = radeon_bo_gpu_offset(rbo) - rdev->mc.vram_start;
f92e93eb5f4d56d drivers/gpu/drm/radeon/radeon_fb.c    Jerome Glisse     2009-06-22  258  	info->fix.smem_start = rdev->mc.aper_base + tmp;
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  259  	info->fix.smem_len = radeon_bo_size(rbo);
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  260  	info->screen_base = (__force void __iomem *)rbo->kptr;
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  261  	info->screen_size = radeon_bo_size(rbo);
785b93ef8c30973 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2009-08-28  262  
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  263  	memset_io(info->screen_base, 0, info->screen_size);
ed8f0d9e708a1a7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2009-07-29  264  
fb2a99e15ff0d34 drivers/gpu/drm/radeon/radeon_fb.c    Sascha Hauer      2012-02-06  265  	/* Use default scratch pixmap (info->pixmap.flags = FB_PIXMAP_SYSTEM) */
4abe35204af82a0 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  266  
771fe6b912fca54 drivers/gpu/drm/radeon/radeon_fb.c    Jerome Glisse     2009-06-05  267  	DRM_INFO("fb mappable at 0x%lX\n",  info->fix.smem_start);
771fe6b912fca54 drivers/gpu/drm/radeon/radeon_fb.c    Jerome Glisse     2009-06-05  268  	DRM_INFO("vram apper at 0x%lX\n",  (unsigned long)rdev->mc.aper_base);
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  269  	DRM_INFO("size %lu\n", (unsigned long)radeon_bo_size(rbo));
b00c600e91531df drivers/gpu/drm/radeon/radeon_fb.c    Ville Syrjälä     2016-12-14  270  	DRM_INFO("fb depth is %d\n", fb->format->depth);
01f2c7730e18807 drivers/gpu/drm/radeon/radeon_fb.c    Ville Syrjälä     2011-12-20  271  	DRM_INFO("   pitch is %d\n", fb->pitches[0]);
771fe6b912fca54 drivers/gpu/drm/radeon/radeon_fb.c    Jerome Glisse     2009-06-05  272  
771fe6b912fca54 drivers/gpu/drm/radeon/radeon_fb.c    Jerome Glisse     2009-06-05  273  	return 0;
771fe6b912fca54 drivers/gpu/drm/radeon/radeon_fb.c    Jerome Glisse     2009-06-05  274  
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16 @275  err_drm_framebuffer_unregister_private:
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  276  	fb_helper->fb = NULL;
362063619cf67c2 drivers/gpu/drm/radeon/radeon_fb.c    Simona Vetter     2012-12-10  277  	drm_framebuffer_unregister_private(fb);
771fe6b912fca54 drivers/gpu/drm/radeon/radeon_fb.c    Jerome Glisse     2009-06-05  278  	drm_framebuffer_cleanup(fb);
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  279  err_kfree:
771fe6b912fca54 drivers/gpu/drm/radeon/radeon_fb.c    Jerome Glisse     2009-06-05  280  	kfree(fb);
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  281  err_radeon_fbdev_destroy_pinned_object:
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  282  	radeon_fbdev_destroy_pinned_object(gobj);
771fe6b912fca54 drivers/gpu/drm/radeon/radeon_fb.c    Jerome Glisse     2009-06-05  283  	return ret;
771fe6b912fca54 drivers/gpu/drm/radeon/radeon_fb.c    Jerome Glisse     2009-06-05  284  }
771fe6b912fca54 drivers/gpu/drm/radeon/radeon_fb.c    Jerome Glisse     2009-06-05  285  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

