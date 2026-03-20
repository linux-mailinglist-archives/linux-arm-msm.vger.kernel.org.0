Return-Path: <linux-arm-msm+bounces-98903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKA7Gc4SvWnG6QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 10:26:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8A52D7FC1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 10:26:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 801303010B82
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 09:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 123DE361674;
	Fri, 20 Mar 2026 09:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lE7vjFKL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75AF33F5BA;
	Fri, 20 Mar 2026 09:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773998796; cv=none; b=n04PrF/FAVbT0omCTd7+ssf6itOsI2vlaBfDDjZJMdI0YsZ4dM0uxKCBfj95TOkXkicxYoA40pCSZMwvmKhRAQnnN47v2xfaTk6Zn3t/DdDx5Z6QRcI8N7Y8Pd7zKM6LyUCeiaBvZYGGtNHfuywklNINCBfLw6yGE8XazU6jh0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773998796; c=relaxed/simple;
	bh=DOGaCuBCTRkz1PBAmYE+qDUnukQ0pca3NhU408CcktE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E2/5kLy53T9LsyA+TYj8iCUasAd1+08f47U+kCkp52Tvjj+eaLZ/Go++6Yl8W3l1brj/F73/z0Y46z3PFoIQlXFb6FNTRpceqkJ+k2QAnipQcrN0yJrfiHINbFnyLrOvdA5jOjD412JbW5bJdYJUxMQOFSGJKK+SDahL8YMbDTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lE7vjFKL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773998795; x=1805534795;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DOGaCuBCTRkz1PBAmYE+qDUnukQ0pca3NhU408CcktE=;
  b=lE7vjFKLo3fnUv+L7/SPtCF62vh6NZf2Rx65mOfV4W5+FCspx6U8Jhgq
   DLYjrIMKIAjd9KWWQckSW7WVQOYWGAL/Z+rThZimXVTj4sPbjewVRfmtj
   kEwFejGbjxVCSXOb82gr6YupadYvwhbhJVSkS2UAv7q3g9RqQqOjdVQrX
   j2IQ3QN3kj/2Ak74agmv82PuEYgiGE3Otz5xXDUUnVbU2aJ3z8TnoiL8b
   hSRoMW6y8fOf0Ub5MHHBEXsJlafVUZYkEZazOSNa2IIwLKWhGbr8HyiW6
   ZRNftFSFMDHTgf7aHqKa+8DQrRb2piolsrO0YmhpRyRAjjWtihWuynXfg
   A==;
X-CSE-ConnectionGUID: KmOQgPpkQJebWTE0hA0WUQ==
X-CSE-MsgGUID: wL8mxRLtRXq495phBne95w==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="85782605"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="85782605"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 02:26:34 -0700
X-CSE-ConnectionGUID: 6CMDdqN/R2qCbE52BuaMXA==
X-CSE-MsgGUID: AWRO+khYT12j2nQa9yZPfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="228171443"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 20 Mar 2026 02:26:29 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3W63-000000002Cd-33yE;
	Fri, 20 Mar 2026 09:25:07 +0000
Date: Fri, 20 Mar 2026 17:22:56 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Koskovich <akoskovich@pm.me>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	Alexander Koskovich <akoskovich@pm.me>
Subject: Re: [PATCH v3 3/4] drm/msm/dsi: Add support for RGB101010 pixel
 format
Message-ID: <202603201719.MxZJCZoY-lkp@intel.com>
References: <20260319-dsi-rgb101010-support-v3-3-85b99df2d090@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-dsi-rgb101010-support-v3-3-85b99df2d090@pm.me>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98903-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[pm.me,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.974];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,intel.com:dkim,intel.com:email,intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BE8A52D7FC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Alexander,

kernel test robot noticed the following build errors:

[auto build test ERROR on f338e77383789c0cae23ca3d48adcc5e9e137e3c]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Koskovich/drm-msm-dsi-rename-MSM8998-DSI-version-from-V2_2_0-to-V2_0_0/20260320-011528
base:   f338e77383789c0cae23ca3d48adcc5e9e137e3c
patch link:    https://lore.kernel.org/r/20260319-dsi-rgb101010-support-v3-3-85b99df2d090%40pm.me
patch subject: [PATCH v3 3/4] drm/msm/dsi: Add support for RGB101010 pixel format
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260320/202603201719.MxZJCZoY-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603201719.MxZJCZoY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603201719.MxZJCZoY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/msm/dsi/dsi_host.c:760:7: error: use of undeclared identifier 'MIPI_DSI_FMT_RGB101010'
     760 |         case MIPI_DSI_FMT_RGB101010:    return VID_DST_FORMAT_RGB101010;
         |              ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/dsi/dsi_host.c:773:7: error: use of undeclared identifier 'MIPI_DSI_FMT_RGB101010'
     773 |         case MIPI_DSI_FMT_RGB101010:    return CMD_DST_FORMAT_RGB101010;
         |              ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/dsi/dsi_host.c:1710:21: error: use of undeclared identifier 'MIPI_DSI_FMT_RGB101010'
    1710 |         if (dsi->format == MIPI_DSI_FMT_RGB101010 &&
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +/MIPI_DSI_FMT_RGB101010 +760 drivers/gpu/drm/msm/dsi/dsi_host.c

   755	
   756	static inline enum dsi_vid_dst_format
   757	dsi_get_vid_fmt(const enum mipi_dsi_pixel_format mipi_fmt)
   758	{
   759		switch (mipi_fmt) {
 > 760		case MIPI_DSI_FMT_RGB101010:	return VID_DST_FORMAT_RGB101010;
   761		case MIPI_DSI_FMT_RGB888:	return VID_DST_FORMAT_RGB888;
   762		case MIPI_DSI_FMT_RGB666:	return VID_DST_FORMAT_RGB666_LOOSE;
   763		case MIPI_DSI_FMT_RGB666_PACKED:	return VID_DST_FORMAT_RGB666;
   764		case MIPI_DSI_FMT_RGB565:	return VID_DST_FORMAT_RGB565;
   765		default:			return VID_DST_FORMAT_RGB888;
   766		}
   767	}
   768	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

