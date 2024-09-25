Return-Path: <linux-arm-msm+bounces-32449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A550298553C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 10:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AA8D1F21344
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 08:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257C5155741;
	Wed, 25 Sep 2024 08:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PWEdRAbi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE96148849;
	Wed, 25 Sep 2024 08:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727251951; cv=none; b=EVULewyPbb4JdMDIyKRQc9s0hUFvQZN6S+kq1fGD0tSlzphbl0YbvC8vsCBKIV955ijac+GQpMKJxsjHxT447o+15Cg8+Nt/28dDoS4k9tmXRtoEaHem6M0oWCIZTrGHv7vaaDcAlT0wdNNXonp5JIuikl27kMC0Qb/pYrxGI0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727251951; c=relaxed/simple;
	bh=BXk9gzQe03a8tFekETgVv0Cx0DJNmF+MmhHSv8qjqkc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SXzDGthbSDGKRDaixk7WXZ59v8IvWRS2RQk7ArDJ2tRjPIEnVHZGjqPS0WiWpN/pa6VMjRkj7SE/4iHujsLXId3VBwwC3BaRb75eoSEgxQO1x/d+4Oq2mPu+Sbnk8KauHPWsUshJdSmXxssV1sOxtU+iK8cnJXNsUvGNgplQKrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PWEdRAbi; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727251949; x=1758787949;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=BXk9gzQe03a8tFekETgVv0Cx0DJNmF+MmhHSv8qjqkc=;
  b=PWEdRAbiwP50ILSfk03mydQNs34GpumiNF/Tw+QtQN/8K4osSYl+6TE7
   De/Ftk8vveKXVgWmTDwzxt8hK1f5rNSgAYqkxuxQSlEesy2J/SPepbP5r
   LGXM0zt/k0MEDYtlrCU7Ijq+QOHwMoCTv8FG3Vlyoz30mHUjX1FYbm0fN
   AW1JivEVSKC0B46YXNu0HnndenTi/ylAzmOyw9Mp9jyfID7OZEbalzL4A
   MH1OYWdZBnxOJJBYikAIdOHoqTbBGW7OTxQjJCbXnwrFTgLaP+95Mow2w
   U5KgBkjC8cETmmLKw5Hz4UXjB3MKC8G92Fuy21gcnfD27zvGqcfsvfyDg
   A==;
X-CSE-ConnectionGUID: drDcdtWRRKKx7vc1JTmkKw==
X-CSE-MsgGUID: Fy5h68eaQoytNkMmtg54qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="43761882"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="43761882"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 01:12:28 -0700
X-CSE-ConnectionGUID: js11HO6hQ8ykKzvcFxayuQ==
X-CSE-MsgGUID: N+t14rGCQ0moy7uEw2n+4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="109153754"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 01:12:21 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 quic_abhinavk@quicinc.com, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>, Ville
 =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Jessica Zhang
 <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v2 01/22] drm: add clone mode check for CRTC
In-Reply-To: <20240924-concurrent-wb-v2-1-7849f900e863@quicinc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-1-7849f900e863@quicinc.com>
Date: Wed, 25 Sep 2024 11:12:18 +0300
Message-ID: <87bk0c40f1.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 24 Sep 2024, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> Add helper to check if the given CRTC state is in clone mode
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  include/drm/drm_crtc.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 8b48a1974da3..ecb93e2c4afc 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -1323,5 +1323,12 @@ static inline struct drm_crtc *drm_crtc_find(struct drm_device *dev,
>  
>  int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
>  					    unsigned int supported_filters);
> +static inline bool drm_crtc_in_clone_mode(struct drm_crtc_state *crtc_state)
> +{
> +	if (!crtc_state)
> +		return false;
> +
> +	return hweight32(crtc_state->encoder_mask) > 1;
> +}

What's the benefit of this being static inline?

You're implicitly depending on hweight32() being available, basically
<linux/bitops.h> being included. Maybe it already is, but it's the
accumulation of small and innocent looking things like this that then
explode the header dependencies, and make them harder to reduce.

BR,
Jani.

>  
>  #endif /* __DRM_CRTC_H__ */

-- 
Jani Nikula, Intel

