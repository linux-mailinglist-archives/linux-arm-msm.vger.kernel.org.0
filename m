Return-Path: <linux-arm-msm+bounces-106820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kG2dMsd7AGrJJQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 14:36:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCA1503F93
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 14:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3184B301649A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 12:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F8853845AE;
	Sun, 10 May 2026 12:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FeRwVoxS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993A238239A;
	Sun, 10 May 2026 12:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778416327; cv=none; b=EVzxp4LnL4vf4MX4R21bzXOntqEmS57Mix+CLk2k1B7P6BzblpZUQeK/RW/EUss/j/Ch0ic5/RqNfqZjJNF5rGU+O6a32uB9Za4gqJFNTTdqbrV9Elb6BscLV7YTGe0kv3EBwN93Lxx8c941bXorvXUs1aFd4hW+5ijfmi+OagQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778416327; c=relaxed/simple;
	bh=W2lnjd0EEjY95FWLS/VU+8zZVQxhrlAyAYdoXojkgTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMNlp7IsPe4mRtx5gCMwVSBsuWoxvUdIVknI4Qvq+LjsSn0hN4jAn6RbdWDAmOOUv2Z2Rgfk7c6Lzk/vJH9IzGMeoEnCHk5y3jCV6skw3K90B53mh1BI9ssjIO+E7+F8a673WW7mm9FAxmEPYpsG8R3YRriu1lh9BcQbbsiqxO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FeRwVoxS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778416325; x=1809952325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W2lnjd0EEjY95FWLS/VU+8zZVQxhrlAyAYdoXojkgTg=;
  b=FeRwVoxSxTKT9usFANd/TtH63BiUCreh81mWf3kUZwFfcepQtlamWIKS
   WIzouUypq8mYTwcaX893ZJAWBwHIFz08qBxhd4+qzPknksdxAUsp0ZIMR
   Ai9Ts7k/DxFnVdv/1ElDl4kkTDE/ZOdMbKiqs/1CssQq2b7GiblSRL+gT
   sXkZagnRfCJBKH+026P7SsdZ+NBX8TQgOzTtZSlSVVjED+5veWrPzeltG
   2PaKwn22GPWl0UKVk4GCU4ZQrOa8Q83+uQOjo1Sdtzw27R/J7M/Wz7ZRp
   bwvTGZBtpLUcg+Du5Gd+82fpVIBcsc1xi1UZeJBmbD+PIx6REV79JxDrB
   w==;
X-CSE-ConnectionGUID: u1PTTtfJQ02QTxTo6aEvjQ==
X-CSE-MsgGUID: ucNZCmL1S9WAEBu+unBKPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="83174431"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="83174431"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 05:32:04 -0700
X-CSE-ConnectionGUID: O+4Fc+NiTR6GKBhPTah8HQ==
X-CSE-MsgGUID: cEwYlgaAQFCggNTGzUHM2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="275345921"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 May 2026 05:32:00 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wM3K8-0000000028T-49cF;
	Sun, 10 May 2026 12:31:56 +0000
Date: Sun, 10 May 2026 20:30:58 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel J Blueman <daniel@quora.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Antonino Maniscalco <antomani103@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Daniel J Blueman <daniel@quora.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Fix shrinker deadlock
Message-ID: <202605102047.JRDq9587-lkp@intel.com>
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
X-Rspamd-Queue-Id: 3BCA1503F93
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106820-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[quora.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:mid,intel.com:dkim,git-scm.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gitlab.freedesktop.org:url,01.org:url]
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
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260510/202605102047.JRDq9587-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605102047.JRDq9587-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605102047.JRDq9587-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/msm/msm_gem_shrinker.c:10:
   In file included from drivers/gpu/drm/msm/msm_drv.h:22:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/gpu/drm/msm/msm_gem_shrinker.c:125:46: error: too many arguments to function call, expected 2, have 3
     125 |         return with_vm_locks(ticket, msm_gem_evict, obj);
         |                ~~~~~~~~~~~~~                        ^~~
   drivers/gpu/drm/msm/msm_gem_shrinker.c:46:1: note: 'with_vm_locks' declared here
      46 | with_vm_locks(void (*fn)(struct drm_gem_object *obj),
         | ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      47 |               struct drm_gem_object *obj)
         |               ~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +125 drivers/gpu/drm/msm/msm_gem_shrinker.c

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

