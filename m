Return-Path: <linux-arm-msm+bounces-106214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJ4QMgO++2nqEAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 00:17:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C57E74E129C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 00:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8F2CE3007231
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 22:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B187C271456;
	Wed,  6 May 2026 22:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P4urrMT9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD02194C96
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 22:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778105853; cv=none; b=Wna3WRq+K2UkIP7fW5FGC/ZRa4Vxj+GYJNpLEvzLciPeDwaGF6hXxDq8TmPFXIlKvkXWIUo6sHpNxho46o+139IeBcy38/8ba6HURqna9bcP7Eksrj/XZcQOjatFkZGmsB6COkM1PsJV/N6ywoRDf+6HDQ6T7fl+hE0IOU8f20Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778105853; c=relaxed/simple;
	bh=sSBdSxsfHapwhnk8JWsFU92IVShCY53vUe1hkAP78Xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FOZaVwjixJoS/jBd9uZlo0JG8cQDTov8Dm4BDI/eufdaNQVOcq7IHwirLY9OFW0cO1AYCBOjrxXeYAISUE7BRz7rz2IrmvEI1BEQ8ZgMr24murx35epkLVI5LCbiJmP0lPGYvOQDbNDac+lcalE13QAm0m9dVZvjyVifGBjj9mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P4urrMT9; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778105852; x=1809641852;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sSBdSxsfHapwhnk8JWsFU92IVShCY53vUe1hkAP78Xk=;
  b=P4urrMT9bsrMV99XWmaSAY9yxZnV52dUotTzXYzTzFcufjalnyc0Eqsj
   2tn1bFKJS6h04mKEaPcpRRWS+DXcydU8he3EyV/JospbAhAtAcEy5PyUJ
   5HeMhe0OxmaAVq4BEoVObEU6LhYYsEM5iT7TZH2xLGJfL+WBTY7rgsT5/
   f3mNOFuF8iednH9A8CXlHl2qEx6fOikzjWbUiMm661w5qNF8bN4KV8cMw
   WzyGlDzgDUv5fMpl1Tx3y64aoJa7yqAl/Lu/bXSm30G+SrrA17kY8Q5kd
   98G67ilwHjZG5sty3ODC08ptr3gpsYyLIWI1HObdgtQMyyBeiWWK1Fy45
   Q==;
X-CSE-ConnectionGUID: /x9Pq9rcQU2uBznxu274Ng==
X-CSE-MsgGUID: /EOvhz3LQ8m23CblPXay7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="89638195"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="89638195"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 15:16:42 -0700
X-CSE-ConnectionGUID: JIThJWJVRKuSM5IItQBo2Q==
X-CSE-MsgGUID: 8T928h7nSWWvXYEh0v5dug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="238072298"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 May 2026 15:16:36 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKkXg-000000001Gz-27pO;
	Wed, 06 May 2026 22:16:32 +0000
Date: Thu, 7 May 2026 06:15:55 +0800
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
Message-ID: <202605070624.Fss9vEZt-lkp@intel.com>
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
X-Rspamd-Queue-Id: C57E74E129C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106214-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,amd.com,emersion.fr,intel.com,kde.org,collabora.com,bootlin.com,linux.dev,lists.freedesktop.org,igalia.com,oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[igalia.com,gmail.com,amd.com,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[31];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Melissa,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v7.1-rc2]
[cannot apply to next-20260506]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Melissa-Wen/drm-atomic-only-add-colorop-state-from-active-color-pipeline/20260504-102820
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260501132527.522320-7-mwen%40igalia.com
patch subject: [PATCH v4 6/6] drm/amd/display: use plane color_mgmt_changed to track colorop changes
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260507/202605070624.Fss9vEZt-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605070624.Fss9vEZt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605070624.Fss9vEZt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_atomic.c:1625 function parameter 'plane_state' not described in 'drm_atomic_add_affected_colorops'
>> Warning: drivers/gpu/drm/drm_atomic.c:1625 function parameter 'plane_state' not described in 'drm_atomic_add_affected_colorops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

