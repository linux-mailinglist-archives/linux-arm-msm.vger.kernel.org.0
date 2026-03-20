Return-Path: <linux-arm-msm+bounces-98967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AxIOPKMvWnY+wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 19:07:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B56B2DF2BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 19:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BBAA32017D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 18:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E80313E10;
	Fri, 20 Mar 2026 18:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iPIVF3eB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9A331195B;
	Fri, 20 Mar 2026 18:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774029646; cv=none; b=RhXdXhSk6AAvwfGHCPi8UTMK6Mf6Ulf2+vyrklXG+LWPr16KgdR7/mu0e8Sv21Yud5xTrZqkx/FkqPQ2+USJA2OgutSyFLwyuXOQuN5gdesyWr5w12iehL2AZfGU4OUuoQpKomWJadr1IfCuMQXzKddit4i5zXMi+zWWRpfDs5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774029646; c=relaxed/simple;
	bh=JAKhDVpWULNM63a81nEywXv/dwdhQnpFeD/g/i5odis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYKm7+JlEbUUcly/C2aMI1ye5ngUHuASXmqtFDT1boQXcPNzvGeOpbpltZPOcdUrbvVjBSgkdzJukv4Lln6GAiYYTeb+us1OX8bwxrkhtDbm0AJYTiEURN6BcWuDudgYB4sbgteC7xxtJpRrWZXGf3hNsqKef1xfBOGViLMhib0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iPIVF3eB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774029645; x=1805565645;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JAKhDVpWULNM63a81nEywXv/dwdhQnpFeD/g/i5odis=;
  b=iPIVF3eBMzNnpGbugYRYVNVo4HVJXmV8z6QKzdNmEG7ZDEpb6few3WvK
   pgy7XX66f9LOWo5ybziJVJMpTBj9JSwbbI1FcgzWT2x9i0iKu69mR9Pqt
   DOJgmvYfe0idpfXvnSppFVunsuN8iikcqffqZV982YTRYTIbOQEGnJQlt
   SDN3t75fo8oWBscNOAkN182OWFIYIxmPMJ9vlcVBywxMyUbZcBt8hmgsD
   S8KLYgKaXS6eWtZdN5RH9Nl0GuwGu53oa4QZivCBN34eE2P+yIJQJpwCJ
   uG0GQbyDEYn/eurAqTtVcTv1shPu71vwMzc/AA5OyOkrqpmi6+6I/4p6c
   A==;
X-CSE-ConnectionGUID: UZkBpEtFTM2ha1sEGNQsUw==
X-CSE-MsgGUID: 2p7HBgWMS3WzQJsuABnbRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="100576041"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="100576041"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 11:00:44 -0700
X-CSE-ConnectionGUID: gtnG+l8iT0SHlGf0CDnykA==
X-CSE-MsgGUID: 5fEKEnjNSUKImcK/2/uthA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="246392798"
Received: from lkp-server02.sh.intel.com (HELO ef9b23065726) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 Mar 2026 11:00:40 -0700
Received: from kbuild by ef9b23065726 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3e8U-00000000049-3YRM;
	Fri, 20 Mar 2026 18:00:15 +0000
Date: Sat, 21 Mar 2026 01:58:45 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Alexander Koskovich <akoskovich@pm.me>
Subject: Re: [PATCH v3 3/4] drm/msm/dsi: Add support for RGB101010 pixel
 format
Message-ID: <202603210139.i7hnShAJ-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-98967-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[pm.me,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.973];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,01.org:url,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Queue-Id: 5B56B2DF2BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Alexander,

kernel test robot noticed the following build errors:

[auto build test ERROR on f338e77383789c0cae23ca3d48adcc5e9e137e3c]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Koskovich/drm-msm-dsi-rename-MSM8998-DSI-version-from-V2_2_0-to-V2_0_0/20260320-011528
base:   f338e77383789c0cae23ca3d48adcc5e9e137e3c
patch link:    https://lore.kernel.org/r/20260319-dsi-rgb101010-support-v3-3-85b99df2d090%40pm.me
patch subject: [PATCH v3 3/4] drm/msm/dsi: Add support for RGB101010 pixel format
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260321/202603210139.i7hnShAJ-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603210139.i7hnShAJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603210139.i7hnShAJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/msm/dsi/dsi_host.c: In function 'dsi_get_vid_fmt':
>> drivers/gpu/drm/msm/dsi/dsi_host.c:760:14: error: 'MIPI_DSI_FMT_RGB101010' undeclared (first use in this function); did you mean 'MIPI_DSI_FMT_RGB565'?
     760 |         case MIPI_DSI_FMT_RGB101010:    return VID_DST_FORMAT_RGB101010;
         |              ^~~~~~~~~~~~~~~~~~~~~~
         |              MIPI_DSI_FMT_RGB565
   drivers/gpu/drm/msm/dsi/dsi_host.c:760:14: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/msm/dsi/dsi_host.c: In function 'dsi_get_cmd_fmt':
   drivers/gpu/drm/msm/dsi/dsi_host.c:773:14: error: 'MIPI_DSI_FMT_RGB101010' undeclared (first use in this function); did you mean 'MIPI_DSI_FMT_RGB565'?
     773 |         case MIPI_DSI_FMT_RGB101010:    return CMD_DST_FORMAT_RGB101010;
         |              ^~~~~~~~~~~~~~~~~~~~~~
         |              MIPI_DSI_FMT_RGB565
   drivers/gpu/drm/msm/dsi/dsi_host.c: In function 'dsi_host_attach':
   drivers/gpu/drm/msm/dsi/dsi_host.c:1710:28: error: 'MIPI_DSI_FMT_RGB101010' undeclared (first use in this function); did you mean 'MIPI_DSI_FMT_RGB565'?
    1710 |         if (dsi->format == MIPI_DSI_FMT_RGB101010 &&
         |                            ^~~~~~~~~~~~~~~~~~~~~~
         |                            MIPI_DSI_FMT_RGB565


vim +760 drivers/gpu/drm/msm/dsi/dsi_host.c

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

