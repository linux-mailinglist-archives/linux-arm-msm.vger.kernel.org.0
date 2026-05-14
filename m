Return-Path: <linux-arm-msm+bounces-107508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCBoBN8dBWoASwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 02:57:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6C653C7A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 02:57:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 264693014109
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 00:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322612F5A12;
	Thu, 14 May 2026 00:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LDEltaer"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACC92F3600;
	Thu, 14 May 2026 00:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778720219; cv=none; b=d9x7KCH5rspuELVD59efCTuMvXKUDzezborHub/hpfwvxrD5yVWBashBfzTieHab4vt4YwYhsrbF2H2mVECXulARlqvWvUUlIyXHRm2UzKJQsW7gmGtLIL3qiuVy7HfPBlJ5X04/HPSx+RANWddNJ5cgK08oXyB3QGR32fT2N+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778720219; c=relaxed/simple;
	bh=vyu57ovXPjleRJ4YGZDfKQBeE3LjznYEnTFJmwS3NkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=io0N2MOPgr8llo3LpGcCNMaXs329H/aNzu8FFlZiJ9N/3YT7do+QFzqbhvtAjMBg6ghiFQrbBcRN2rjsvsRec6MwRSciXHj4rAJje5usUfalDkBIDg56CoHxSsOBNVaeMWYNZ9Icw/xVyf59sOkFx5JstA0hzkbcFszMKfZaNPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LDEltaer; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778720217; x=1810256217;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vyu57ovXPjleRJ4YGZDfKQBeE3LjznYEnTFJmwS3NkA=;
  b=LDEltaer7gtxMnMWal+L5LbgJz2lYSeW0kCkVm3AuAysbqDMg6koG1cM
   1hORC2ut/WnR59YZqVJEgDgodDa3hSxCsD7cCEp7tLyNMn3lJmXvDGghS
   t3bH2OmkXjIwv4La3qoNALHC+P6r3zB36nFoU3ao7qx8vt4BIaLDU0dB8
   pV+4s2NiG5LORzBEoqjZbOPkHXswbwJXxR9teARH/PcpjdBpnsEhaJjTc
   /psTyP5VTlBHxv+NYJ/H104YaQT3ngW+DOcmetHQH5H4M9Dk+Xqxh1fyC
   2GW5gsWdpK2gN3rlAH9/Ilr3E3DNyKZLohhsZ2lQ2K2PFKUes2SBxS1LI
   g==;
X-CSE-ConnectionGUID: sBMIr/rdSX+HGnR3OiWkwQ==
X-CSE-MsgGUID: N6gFCRF/QC6O4dVjTGntTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="83507945"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="83507945"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 17:56:56 -0700
X-CSE-ConnectionGUID: IB6DiO87RHO8nISzs2kFBg==
X-CSE-MsgGUID: Y7bWg4vrTXaryqD/8ip2/Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 May 2026 17:56:52 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNKNd-000000005S3-0imQ;
	Thu, 14 May 2026 00:56:49 +0000
Date: Thu, 14 May 2026 08:55:57 +0800
From: kernel test robot <lkp@intel.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
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
Message-ID: <202605140848.SHAmSWp0-lkp@intel.com>
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
X-Rspamd-Queue-Id: 2A6C653C7A1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107508-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,arm.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,01.org:url,intel.com:email,intel.com:mid,intel.com:dkim]
X-Rspamd-Action: no action

Hi Boris,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b2ed01e7ad3de80333e9b962a44024b094bc0b2b]

url:    https://github.com/intel-lab-lkp/linux/commits/Boris-Brezillon/drm-gem-Make-the-GEM-LRU-lock-part-of-drm_device/20260514-051749
base:   b2ed01e7ad3de80333e9b962a44024b094bc0b2b
patch link:    https://lore.kernel.org/r/20260512-panthor-shrinker-fixes-v3-1-3bf066259471%40collabora.com
patch subject: [PATCH v3] drm/gem: Make the GEM LRU lock part of drm_device
config: csky-randconfig-r071-20260514 (https://download.01.org/0day-ci/archive/20260514/202605140848.SHAmSWp0-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140848.SHAmSWp0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140848.SHAmSWp0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_gem.c:1643 function parameter 'dev' not described in 'drm_gem_lru_scan'
>> Warning: drivers/gpu/drm/drm_gem.c:1643 function parameter 'dev' not described in 'drm_gem_lru_scan'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

