Return-Path: <linux-arm-msm+bounces-107514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNGTH/tHBWpDUAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 05:56:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2103B53D6D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 05:56:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 799533014375
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 03:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89CB83A2561;
	Thu, 14 May 2026 03:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HYZ+A3Ew"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BB22989B5;
	Thu, 14 May 2026 03:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778731001; cv=none; b=gEghFgiqB92NfrHcPq8x3BAPDG6HzZIcAkdk5q77zEqGCYlYFDRAxwRoicK7pn6fQYDIUd2d38FHYf4dpEEgFhiU+eQIoGNDzpOkGc8k3s5ercU3d6fvSzT5pUuS9h6tclQwz/I4WHoshReQYTf/Kd5BTfTRhXDiBlIC4iJV5Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778731001; c=relaxed/simple;
	bh=nNXzELtutpEq+OmJxmrD51XitSjV4T7MrHzTWpLXGqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q7coakjMEtgpeXqTHD1QKYfc9kxMCL/3kDbXQKmnvOApX+MGAqGkcTI4nwgvulr6RqvZCFyRKnNNS6FrdAogsEBCAIjZIo78CDIyG6MiPI//CRVWyaBkHC5AwtJ0x/Ljr7trfdBKWGhgUQR9hbK9+PV6a/XWTrjAkb0DfpmriDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HYZ+A3Ew; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778731000; x=1810267000;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nNXzELtutpEq+OmJxmrD51XitSjV4T7MrHzTWpLXGqs=;
  b=HYZ+A3EwF52lVNkBtMJjiUPbi4kwcKUltDHunEyzMIQHF11CiqXyQWv2
   lpy0J/JenKlAxjZKTVSt34aPuhD+bwn3KvhiKBXms45FE3N8/i4EI8A2C
   hyEKLOUXMTls/fXQt+jN/rcWgQ3WofG8yJ9C0RQ7BafD1+JyoidhQcggQ
   OPSFpWxTsjBEyx6XV8MHdt0Ao2GHCdHDTB1/UmfwNsEZCAzini6+7iX+L
   A5TfBnqUe1eQYZwc1pTwGAlaYZ+CmBDfjO6BnTwUwcrd+hsiGlcajRPe6
   wRsEoSi0VhRZOsPwq3o0tpBsZvRFcfZIyUA/n6GFtLRny28tSOogINkqs
   g==;
X-CSE-ConnectionGUID: dfI9W93vQ3mq7FcsOpCOOw==
X-CSE-MsgGUID: nLaPdbwCQaq+9dk0J8/JGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79564429"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="79564429"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 20:56:39 -0700
X-CSE-ConnectionGUID: ZFJEVrqUR0CG+RnG12WEVg==
X-CSE-MsgGUID: DhVLug9hRyiwfjGsvKVn5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="243251014"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 May 2026 20:56:35 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNNBX-000000005mN-0hyq;
	Thu, 14 May 2026 03:56:31 +0000
Date: Thu, 14 May 2026 11:56:05 +0800
From: kernel test robot <lkp@intel.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Akash Goel <akash.goel@arm.com>, Chia-I Wu <olvaffe@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/gem: Make the GEM LRU lock part of drm_device
Message-ID: <202605141138.kI3vechU-lkp@intel.com>
References: <20260512-panthor-shrinker-fixes-v3-1-3bf066259471@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-panthor-shrinker-fixes-v3-1-3bf066259471@collabora.com>
X-Rspamd-Queue-Id: 2103B53D6D3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107514-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,arm.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:mid,intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,01.org:url]
X-Rspamd-Action: no action

Hi Boris,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b2ed01e7ad3de80333e9b962a44024b094bc0b2b]

url:    https://github.com/intel-lab-lkp/linux/commits/Boris-Brezillon/drm-gem-Make-the-GEM-LRU-lock-part-of-drm_device/20260514-051749
base:   b2ed01e7ad3de80333e9b962a44024b094bc0b2b
patch link:    https://lore.kernel.org/r/20260512-panthor-shrinker-fixes-v3-1-3bf066259471%40collabora.com
patch subject: [PATCH v3] drm/gem: Make the GEM LRU lock part of drm_device
config: arm-randconfig-002-20260514 (https://download.01.org/0day-ci/archive/20260514/202605141138.kI3vechU-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141138.kI3vechU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141138.kI3vechU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/msm_gem.c:827:26: warning: unused variable 'priv' [-Wunused-variable]
     827 |         struct msm_drm_private *priv = obj->dev->dev_private;
         |                                 ^~~~
   1 warning generated.


vim +/priv +827 drivers/gpu/drm/msm/msm_gem.c

4cd33c48ea25ba1 Rob Clark             2016-05-17  823  
599089c6af68300 Rob Clark             2020-10-23  824  void msm_gem_purge(struct drm_gem_object *obj)
68209390f116034 Rob Clark             2016-05-17  825  {
68209390f116034 Rob Clark             2016-05-17  826  	struct drm_device *dev = obj->dev;
6c7c8fb863f7c31 Rob Clark             2023-03-20 @827  	struct msm_drm_private *priv = obj->dev->dev_private;
68209390f116034 Rob Clark             2016-05-17  828  	struct msm_gem_object *msm_obj = to_msm_bo(obj);
68209390f116034 Rob Clark             2016-05-17  829  
d4d7d3630d703ff Rob Clark             2022-08-02  830  	msm_gem_assert_locked(obj);
90643a24a7bfbe9 Rob Clark             2021-04-05  831  	GEM_WARN_ON(!is_purgeable(msm_obj));
68209390f116034 Rob Clark             2016-05-17  832  
20d0ae2f8c72e36 Rob Clark             2021-04-05  833  	/* Get rid of any iommu mapping(s): */
0b4339c55ef59ff Rob Clark             2025-06-29  834  	put_iova_spaces(obj, NULL, false, "purge");
0e08270a1f01bce Sushmita Susheelendra 2017-06-13  835  
599089c6af68300 Rob Clark             2020-10-23  836  	msm_gem_vunmap(obj);
68209390f116034 Rob Clark             2016-05-17  837  
81d4d597d4faadb Rob Clark             2021-04-05  838  	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
81d4d597d4faadb Rob Clark             2021-04-05  839  
68209390f116034 Rob Clark             2016-05-17  840  	put_pages(obj);
68209390f116034 Rob Clark             2016-05-17  841  
c20ad1ee88c074c Boris Brezillon       2026-05-12  842  	mutex_lock(&dev->gem_lru_mutex);
6c7c8fb863f7c31 Rob Clark             2023-03-20  843  	/* A one-way transition: */
68209390f116034 Rob Clark             2016-05-17  844  	msm_obj->madv = __MSM_MADV_PURGED;
c20ad1ee88c074c Boris Brezillon       2026-05-12  845  	mutex_unlock(&dev->gem_lru_mutex);
68209390f116034 Rob Clark             2016-05-17  846  
68209390f116034 Rob Clark             2016-05-17  847  	drm_gem_free_mmap_offset(obj);
68209390f116034 Rob Clark             2016-05-17  848  
68209390f116034 Rob Clark             2016-05-17  849  	/* Our goal here is to return as much of the memory as
68209390f116034 Rob Clark             2016-05-17  850  	 * is possible back to the system as we are called from OOM.
68209390f116034 Rob Clark             2016-05-17  851  	 * To do this we must instruct the shmfs to drop all of its
68209390f116034 Rob Clark             2016-05-17  852  	 * backing pages, *now*.
68209390f116034 Rob Clark             2016-05-17  853  	 */
68209390f116034 Rob Clark             2016-05-17  854  	shmem_truncate_range(file_inode(obj->filp), 0, (loff_t)-1);
68209390f116034 Rob Clark             2016-05-17  855  
68209390f116034 Rob Clark             2016-05-17  856  	invalidate_mapping_pages(file_inode(obj->filp)->i_mapping,
68209390f116034 Rob Clark             2016-05-17  857  			0, (loff_t)-1);
68209390f116034 Rob Clark             2016-05-17  858  }
68209390f116034 Rob Clark             2016-05-17  859  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

