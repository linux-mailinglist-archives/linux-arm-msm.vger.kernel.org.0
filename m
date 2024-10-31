Return-Path: <linux-arm-msm+bounces-36623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FB69B84E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 22:05:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA5A71C208DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 21:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ABE31C9EA3;
	Thu, 31 Oct 2024 21:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BOVW/0+1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C00A199FAF;
	Thu, 31 Oct 2024 21:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730408732; cv=none; b=U8OTrcE+SftaaaIWgD43Q6a2EZYFyReCC/9pGt9kLsAJkz7+WzYRwXApSMB46AlDQl4WxXFtHAX/SIXlvdOsKZ74SkGssnXsMG0+QD1M+swiQExZZz+fllfwBbvcRdWTmNPvRWSs9yydQ+4nkkHixHNlr7zp/Ix9JF1Tv4uWbSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730408732; c=relaxed/simple;
	bh=OO4A1ZXhvnE/2XJOeAiNO8KhYr/w+ARRaSfPUdDCdws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fta2A/goBNnlLdXvzyOxb4gbHLYFBQgKlEFBWOpNEVTq8xWqwc4v9Z/WAStfFWrVcdWT72PMpl+u68yFYPMFZxIz5PbInluvng/kFtS+Qh3q6QAqgUVjZYC4tgpwk3/x1XtO656zJUhiVBdmqBJVLYSuYpD17Bcmr8wds0jbNfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BOVW/0+1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730408726; x=1761944726;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   mime-version:in-reply-to;
  bh=OO4A1ZXhvnE/2XJOeAiNO8KhYr/w+ARRaSfPUdDCdws=;
  b=BOVW/0+1OLiZFeLNjjbiBF7bsjjsZS3nj5dT1aYMvlsn+DhU9LD29B1f
   MycoYUUu1Zs/OWPhTY1y1yWhJo1Ic4rrpjagbI+OCw55EN10AqJdqwz4r
   J5xN9n16D2Edez0SISjXq68Ij6Z1Ex53uwIrAIeAy1IN7gNwLV0wrJ+l0
   35/xqFmi8xH+RAaDDsfb1ND1Oj2+C35Q3vG3X3d9ZfRM454aEn23n+rtS
   XxcC/whol8bgKETmTiv5KKN5ToQGhibcYQhQkLp9Wo3pdu0pSSRdV3mjt
   9NKBulniv0i6ZB1ALGz27e/ZnKws1GnzJ3r6RSvUTldYFEf4qeHvwif9C
   Q==;
X-CSE-ConnectionGUID: w1P2X7QDTUqALWkDM+VFxQ==
X-CSE-MsgGUID: eD54R3SET1K2TwqA0vLKcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="55575487"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="55575487"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 14:05:24 -0700
X-CSE-ConnectionGUID: 5foGy5bPQLqQElX3moR8kA==
X-CSE-MsgGUID: EkRWfefLSq27SEFwoMicWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="83566317"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 14:05:18 -0700
Date: Thu, 31 Oct 2024 23:05:50 +0200
From: Imre Deak <imre.deak@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <ZyPxLpykHkO9Xx_R@ideak-desk.fi.intel.com>
Reply-To: imre.deak@intel.com
References: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
 <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-1-cafbb9855f40@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-1-cafbb9855f40@linaro.org>

On Thu, Oct 31, 2024 at 05:12:45PM +0200, Abel Vesa wrote:
> According to the DisplayPort standard, LTTPRs have two operating
> modes:
>  - non-transparent - it replies to DPCD LTTPR field specific AUX
>    requests, while passes through all other AUX requests
>  - transparent - it passes through all AUX requests.
> 
> Switching between this two modes is done by the DPTX by issuing
> an AUX write to the DPCD PHY_REPEATER_MODE register.
> 
> Add a generic helper that allows switching between these modes.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 17 +++++++++++++++++
>  include/drm/display/drm_dp_helper.h     |  1 +
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 6ee51003de3ce616c3a52653c2f1979ad7658e21..38d612345986ad54b42228902ea718a089d169c4 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2694,6 +2694,23 @@ int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE])
>  }
>  EXPORT_SYMBOL(drm_dp_lttpr_max_link_rate);
>  
> +/**
> + * drm_dp_lttpr_set_transparent_mode - set the LTTPR in transparent mode
> + * @aux: DisplayPort AUX channel
> + * @enable: Enable or disable transparent mode
> + *
> + * Returns 0 on success or a negative error code on failure.

Should be "Returns 1 on success".

> + */
> +
> +int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable)
> +{
> +	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
> +			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
> +
> +	return drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE, val);
> +}
> +EXPORT_SYMBOL(drm_dp_lttpr_set_transparent_mode);
> +
>  /**
>   * drm_dp_lttpr_max_lane_count - get the maximum lane count supported by all LTTPRs
>   * @caps: LTTPR common capabilities
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 279624833ea9259809428162f4e845654359f8c9..8821ab2d36b0e04d38ccbdddcb703b34de7ed680 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -625,6 +625,7 @@ int drm_dp_read_lttpr_phy_caps(struct drm_dp_aux *aux,
>  			       u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
>  int drm_dp_lttpr_count(const u8 cap[DP_LTTPR_COMMON_CAP_SIZE]);
>  int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
> +int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable);
>  int drm_dp_lttpr_max_lane_count(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
>  bool drm_dp_lttpr_voltage_swing_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
>  bool drm_dp_lttpr_pre_emphasis_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
> 
> -- 
> 2.34.1
> 

