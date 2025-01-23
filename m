Return-Path: <linux-arm-msm+bounces-45932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6FAA1A19F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 11:13:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC5483A5C8C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 10:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D3620D515;
	Thu, 23 Jan 2025 10:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XLhjLF+r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0328320CCCC;
	Thu, 23 Jan 2025 10:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737627172; cv=none; b=d/XeRmrknUuLj6bO49T+0PYyGlLvvNFmAKZw21zhUKZynS4YTLiXDmXyM4+Po49X4pDjeyWb/kCmq2QajRPWlMRbhIM9bqZrB1ebph5ZhKP6bJHYf2jzFQYZj17TP/YVArOlwIG8BchjugoqcJkewt2RTBmwk53c3As/ygNgYLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737627172; c=relaxed/simple;
	bh=eJuT2i1OQ/n/dl6VjfKxG9lcaZkbxzsrBgcEVMBaYbU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YVnDjaMn3EmWSO5VeuccwfftKAozRhRHnBBrspZ+X3Ooul9qJyC9n8N95tJ8dFE5mdHGQCzdlCO8ilw1NQkwiX0Zz4hpfR81leNh8TV/6SSOa/e84CjwFEDHo4NUz1h+U27KirXbn0B9ihH8MEV3tH4OElc4Upb6H/kDVE+ct6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XLhjLF+r; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737627171; x=1769163171;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=eJuT2i1OQ/n/dl6VjfKxG9lcaZkbxzsrBgcEVMBaYbU=;
  b=XLhjLF+rlWxKwwHFV6PKiU4UaotLl7xxf8K9OBTYldIJSpkr62Gh05Hg
   y5QBSBNCIfY7JnoOaQE9VWBBZY+I0d3sO04pY70kdEyeo/Yw4SzaOnr8o
   TOObqSTka3g3rqrz7jOy4FwY3h3iM8ut1KO586enrJWogkeK0LitfwPF7
   Ww1R4mnLXi7d8H/3R56Bc1OPjVWet19l5nWOiQginF9xO1VWYzjQNbZln
   W5tsIHxKHdKHA3tH22cBJ8y6AqNMah9G4d3o6AswdIL9utiJUe/GSXx/O
   CGy85WPSBfhnscukcVmjgV03C6EVQxEXEeEeGE6TflxWCoyzD3jbePKTG
   Q==;
X-CSE-ConnectionGUID: 4Tld4blzStGMbwD7FMsn9g==
X-CSE-MsgGUID: cibrXtLgSyGr10JHABXjOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="49512212"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="49512212"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 02:12:50 -0800
X-CSE-ConnectionGUID: twj7RcuZRLWVJdo7S3/DrA==
X-CSE-MsgGUID: t5iE9bT0RVWsz75r397Oyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111432042"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.98])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 02:12:46 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 0/7] drm/display: dp: add new DPCD access functions
In-Reply-To: <ctla3nt6o3osdxek63zyidyuofzgq3mgshh2azong3ntcqevhi@3rrzr3hrzbor>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
 <ctla3nt6o3osdxek63zyidyuofzgq3mgshh2azong3ntcqevhi@3rrzr3hrzbor>
Date: Thu, 23 Jan 2025 12:12:43 +0200
Message-ID: <87r04tn8is.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 23 Jan 2025, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> On Fri, Jan 17, 2025 at 10:56:35AM +0200, Dmitry Baryshkov wrote:
>> Existing DPCD access functions return an error code or the number of
>> bytes being read / write in case of partial access. However a lot of
>> drivers either (incorrectly) ignore partial access or mishandle error
>> codes. In other cases this results in a boilerplate code which compares
>> returned value with the size.
>> 
>> As suggested by Jani implement new set of DPCD access helpers, which
>> ignore partial access, always return 0 or an error code. Reimplement
>> existing helpers using the new functions to ensure backwards
>> compatibility.
>> 
>> This series targets only the DRM helpers code. If the approach is found
>> to be acceptable, each of the drivers should be converted on its own.
>
> Gracious ping for the series, it's been posted a week ago.

It's a bit of a bummer the names become longer. I don't have a better
suggestion, though.

I do like it that the error handling becomes easier and more uniform
overall, and this actually fixes many places that only checked for < 0
with the old functions.

I glanced through the series, I didn't spot anything obviously wrong,
but didn't do a thorough review either. I can do once we have wider
buy-in for the idea in general, so the effort won't be wasted.

For now,

Acked-by: Jani Nikula <jani.nikula@intel.com>

>
>> 
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>> Dmitry Baryshkov (7):
>>       drm/display: dp: change drm_dp_dpcd_read_link_status() return
>>       drm/display: dp: implement new access helpers
>>       drm/display: dp: use new DCPD access helpers
>>       drm/display: dp-aux-dev: use new DCPD access helpers
>>       drm/display: dp-cec: use new DCPD access helpers
>>       drm/display: dp-mst-topology: use new DCPD access helpers
>>       drm/display: dp-tunnel: use new DCPD access helpers
>> 
>>  drivers/gpu/drm/display/drm_dp_aux_dev.c      |  12 +-
>>  drivers/gpu/drm/display/drm_dp_cec.c          |  37 ++-
>>  drivers/gpu/drm/display/drm_dp_helper.c       | 345 +++++++++++---------------
>>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 132 +++++-----
>>  drivers/gpu/drm/display/drm_dp_tunnel.c       |  20 +-
>>  drivers/gpu/drm/msm/dp/dp_ctrl.c              |  45 ++--
>>  drivers/gpu/drm/msm/dp/dp_link.c              |  17 +-
>>  include/drm/display/drm_dp_helper.h           |  81 +++++-
>>  include/drm/display/drm_dp_mst_helper.h       |  10 +-
>>  9 files changed, 354 insertions(+), 345 deletions(-)
>> ---
>> base-commit: 440aaf479c9aaf5ecea9a463eb826ec243d5f1cf
>> change-id: 20241231-drm-rework-dpcd-access-b0fc2e47d613
>> 
>> Best regards,
>> -- 
>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> 

-- 
Jani Nikula, Intel

