Return-Path: <linux-arm-msm+bounces-106826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MIfLOe7AGo3MAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 19:09:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1D7505524
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 19:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE4013002A03
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 17:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CEDB39FCCA;
	Sun, 10 May 2026 17:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dYAQfX9D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416AB36604F;
	Sun, 10 May 2026 17:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778432933; cv=none; b=emjSmScMFUrU4YTdve72Pt/bIkcqbIEe88DN922ZXlFOnApio9I7SItl4mas4mcWg525cCxM8ybCnt/LRDAIytLCtLJnJEYaO4kExh1cF5LBRZHjHvhq3wyCzghxfCa4sWVc+52OuBMkM+8DFNN7CkiZsKKixKpjTaF8ZX2DVzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778432933; c=relaxed/simple;
	bh=qRNzFoTiVCuTfnV1dvVwuxpnSZC4N4oqVoZPWCtyFWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mlNPeRi0gZ5rxqulD+1mXJbSnZo7AR0XvDbMIlgpPA+dN6syeYhbycpAsA3YPvGeCbK24YeSnOfgHSRvR+cGxAqWP3Yjq+ExiC01H6QThnhLo8eaIWJ1eFKsPs+g/7/AGDCRI7Q/OlQUhYlaOUK/J2Bji8sXGk7LTbMuymvc2KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dYAQfX9D; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778432930; x=1809968930;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qRNzFoTiVCuTfnV1dvVwuxpnSZC4N4oqVoZPWCtyFWo=;
  b=dYAQfX9DuKb+NYyzkizaO/3xxAtiEOHlGg2fEm+2RRaeelWsHhvVjT/X
   WR1xywTb6XMiELZd8VrDN/Ku6GHQMn3Q0T45ZPV4IJIfyeaR1SmXwF2Cr
   bF8DClMyjKAHRQDp8kLxFereU2IWeGcpJmbgypBOBHU8MpiSP/WUzHSZF
   rkUUKza+Eikg0NBF0sLgohQy+S9BQpC1Ir0BCv9gjjalNfqZPoaOSalb2
   8+8qWnh9/vianoH6U+yPhtCyj0jqeDnx3lTegPfNkakvHsYo8b83+VOMh
   NJtnTlwQC0Y5EGpmf7cFSRXNKPHIYsexRfE/0CQ3ERR8NwNdlbndikpjd
   g==;
X-CSE-ConnectionGUID: bWfe9pgXSvqN471gkjmD6g==
X-CSE-MsgGUID: pUMWWnhcRsKTnvAdbOrRoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="89919905"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="89919905"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 10:08:49 -0700
X-CSE-ConnectionGUID: 4da33C/STDqvjN1LR2bH1A==
X-CSE-MsgGUID: HgtiYq5bTaueCMH+NREZeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="234589511"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 May 2026 10:08:46 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wM7dz-000000002S1-0RmW;
	Sun, 10 May 2026 17:08:43 +0000
Date: Mon, 11 May 2026 01:08:02 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel J Blueman <daniel@quora.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Antonino Maniscalco <antomani103@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Daniel J Blueman <daniel@quora.org>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Fix shrinker deadlock
Message-ID: <202605110127.kDfyU1Oh-lkp@intel.com>
References: <20260508065722.18785-1-daniel@quora.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508065722.18785-1-daniel@quora.org>
X-Rspamd-Queue-Id: 0D1D7505524
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106826-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[quora.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Daniel,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v7.1-rc2 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-J-Blueman/drm-msm-Fix-shrinker-deadlock/20260510-132942
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260508065722.18785-1-daniel%40quora.org
patch subject: [PATCH] drm/msm: Fix shrinker deadlock
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260511/202605110127.kDfyU1Oh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605110127.kDfyU1Oh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605110127.kDfyU1Oh-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/msm/msm_gem_shrinker.c: In function 'evict':
>> drivers/gpu/drm/msm/msm_gem_shrinker.c:125:30: error: passing argument 1 of 'with_vm_locks' from incompatible pointer type [-Wincompatible-pointer-types]
     125 |         return with_vm_locks(ticket, msm_gem_evict, obj);
         |                              ^~~~~~
         |                              |
         |                              struct ww_acquire_ctx *
   drivers/gpu/drm/msm/msm_gem_shrinker.c:46:22: note: expected 'void (*)(struct drm_gem_object *)' but argument is of type 'struct ww_acquire_ctx *'
      46 | with_vm_locks(void (*fn)(struct drm_gem_object *obj),
         |               ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_gem_shrinker.c:125:38: error: passing argument 2 of 'with_vm_locks' from incompatible pointer type [-Wincompatible-pointer-types]
     125 |         return with_vm_locks(ticket, msm_gem_evict, obj);
         |                                      ^~~~~~~~~~~~~
         |                                      |
         |                                      void (*)(struct drm_gem_object *)
   drivers/gpu/drm/msm/msm_gem_shrinker.c:47:38: note: expected 'struct drm_gem_object *' but argument is of type 'void (*)(struct drm_gem_object *)'
      47 |               struct drm_gem_object *obj)
         |               ~~~~~~~~~~~~~~~~~~~~~~~^~~
>> drivers/gpu/drm/msm/msm_gem_shrinker.c:125:16: error: too many arguments to function 'with_vm_locks'
     125 |         return with_vm_locks(ticket, msm_gem_evict, obj);
         |                ^~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_gem_shrinker.c:46:1: note: declared here
      46 | with_vm_locks(void (*fn)(struct drm_gem_object *obj),
         | ^~~~~~~~~~~~~


vim +/with_vm_locks +125 drivers/gpu/drm/msm/msm_gem_shrinker.c

6afb0750dba05c Rob Clark 2021-04-05  115  
63f17ef834284d Rob Clark 2021-04-05  116  static bool
02070f04987524 Rob Clark 2025-06-29  117  evict(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
63f17ef834284d Rob Clark 2021-04-05  118  {
b352ba54a82072 Rob Clark 2022-08-02  119  	if (is_unevictable(to_msm_bo(obj)))
63f17ef834284d Rob Clark 2021-04-05  120  		return false;
63f17ef834284d Rob Clark 2021-04-05  121  
b352ba54a82072 Rob Clark 2022-08-02  122  	if (msm_gem_active(obj))
01780d02634a3a Rob Clark 2022-08-02  123  		return false;
01780d02634a3a Rob Clark 2022-08-02  124  
fe4952b5f27cca Rob Clark 2025-06-29 @125  	return with_vm_locks(ticket, msm_gem_evict, obj);
63f17ef834284d Rob Clark 2021-04-05  126  }
63f17ef834284d Rob Clark 2021-04-05  127  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

