Return-Path: <linux-arm-msm+bounces-105816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iN5uKkAL+Wnt4gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 23:10:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 097854C3E6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 23:10:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5EDF30363AE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 21:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7023B3290C8;
	Mon,  4 May 2026 21:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="efs7M1Qd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0289E33E368
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 21:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777928932; cv=none; b=tAoUxmMMMbJ8w9IaRCoOxcUXrb4cM34XngsdGcQYigsNGnYNVkFm7cfnYi5j24tc+puJoLW1RCC8hXei6NWk0nwVPp3fnRKezuI5bl8pUJAHbaZ7h2Q1KRiXUjk1fNZJfEkuxoC6YDImBN9JL1BcqwDaeE8zvBeHGsp7o775ya4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777928932; c=relaxed/simple;
	bh=/ipDyCkoQCQ98nDjtbpsZx5sq7C7nmufuz2KncDTW6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aCyzfE1y+EWd7LrBYNn+OsQQtIia1eORWR2jW6/GRvbDrqUOV1aShAarWqZy3XABxNTgM9nONBLvQsyJJtp0uz7j0inFa3/ei4SLdIUFYeGallrR0+09ZSr59kcYDmQSgyUz/C4MnO//OkBxmD3brh4BFbxM2RpUfdX2x7ew42A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=efs7M1Qd; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777928932; x=1809464932;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/ipDyCkoQCQ98nDjtbpsZx5sq7C7nmufuz2KncDTW6s=;
  b=efs7M1Qd/2+NxiPKjxqskqwvPyYdeclujOGPTWRyNOFQi4KEj6JUEpmH
   H+UCIjq8LXw+WVrHKm/m0QHvxUK+WoIBp6KuBSiUQAlnl/n9K3OYsWu+c
   fnEC3y2ZQ1/WTDjUmWU2qAqI3CsD69+wptKBmnD6mShkqBdVyxPwDNKyi
   udARYPsm4gZAlgHv2OVxAt3AZFJavUgDEWxKDSBv1ezR+DoLzpCF1ddMy
   NWdy2HDvJzN0H4GvD6B5UPQINyRz5Q6tyT4f0EJmtk5Pn9im7D/0apoBQ
   QrJ7YNGT3FFFThETXGRBVCeUMwSa3Hv4o2Ar6pzaJV/ju1RGMTz5VX6pU
   Q==;
X-CSE-ConnectionGUID: XDoq3WZ4QE697x3tD8VoDg==
X-CSE-MsgGUID: F7dTKvyEQS6aKsB8kLXVDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="82404908"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="82404908"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 14:08:51 -0700
X-CSE-ConnectionGUID: HIViqR3kTDKctvIEI4m8hg==
X-CSE-MsgGUID: knAIF5i/T+GvtIfiNNcSnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="232484885"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 04 May 2026 14:08:44 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wK0Ww-000000005y9-0MTw;
	Mon, 04 May 2026 21:08:42 +0000
Date: Mon, 4 May 2026 23:08:28 +0200
From: kernel test robot <lkp@intel.com>
To: Melissa Wen <mwen@igalia.com>, airlied@gmail.com,
	alexander.deucher@amd.com, christian.koenig@amd.com,
	harry.wentland@amd.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, simona@ffwll.ch, siqueira@igalia.com,
	sunpeng.li@amd.com, tzimmermann@suse.de
Cc: oe-kbuild-all@lists.linux.dev, Alex Hung <alex.hung@amd.com>,
	Simon Ser <contact@emersion.fr>,
	Uma Shankar <uma.shankar@intel.com>,
	Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
	Xaver Hugl <xaver.hugl@kde.org>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Matthew Schwartz <matthew.schwartz@linux.dev>,
	amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 6/6] drm/amd/display: use plane color_mgmt_changed to
 track colorop changes
Message-ID: <202605042355.hTox5m9T-lkp@intel.com>
References: <20260501132527.522320-7-mwen@igalia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501132527.522320-7-mwen@igalia.com>
X-Rspamd-Queue-Id: 097854C3E6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105816-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,amd.com,emersion.fr,intel.com,kde.org,collabora.com,bootlin.com,linux.dev,lists.freedesktop.org,igalia.com,oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[igalia.com,gmail.com,amd.com,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,gitlab.freedesktop.org:url,intel.com:email,intel.com:dkim,intel.com:mid,git-scm.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi Melissa,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on next-20260430]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Melissa-Wen/drm-atomic-only-add-colorop-state-from-active-color-pipeline/20260504-102820
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260501132527.522320-7-mwen%40igalia.com
patch subject: [PATCH v4 6/6] drm/amd/display: use plane color_mgmt_changed to track colorop changes
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260504/202605042355.hTox5m9T-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605042355.hTox5m9T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605042355.hTox5m9T-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_atomic.c:1625 function parameter 'plane_state' not described in 'drm_atomic_add_affected_colorops'
>> Warning: drivers/gpu/drm/drm_atomic.c:1625 function parameter 'plane_state' not described in 'drm_atomic_add_affected_colorops'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

