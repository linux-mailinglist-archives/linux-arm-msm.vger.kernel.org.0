Return-Path: <linux-arm-msm+bounces-36741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A31E39B923F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 14:43:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A10F282E59
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 13:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8821919AD5C;
	Fri,  1 Nov 2024 13:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LvnYbdAy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A30168DA;
	Fri,  1 Nov 2024 13:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730468598; cv=none; b=c2lQccJNPGdAwzInlZvlz3zcwpcdj1DI3+gxQQPctNhgNunLJIWXGuxNI+UD1pvrphtr2TTg03tlH1qsnl+YEJzpXRjHw+nnJeqys4p0/rAyQZ1/V1W/ujJcFnA7hjSOupbzAlhdSZJnH2iMdYaFdltCr3FkPDvqbOe/bhAUZkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730468598; c=relaxed/simple;
	bh=yRwKjhcSgfpvoI02LRXx6jkqVbevSG9nk+9Aecvc8cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eg87bJUqp1wxMT+lqszJMJj1kpKkq4GndmyMpLp/5egf2t+YeJmDXM9R6+WMa5BeWcWU5ujTacaQj3xfX1ifE6dM52i5TgkzQA/ba3+uQUQycW/15InsYbYHRpYK1BEXFy45/fyfGVEccmIqG9ep819riwtmCZP68kvu8OiyD4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LvnYbdAy; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730468596; x=1762004596;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   mime-version:in-reply-to;
  bh=yRwKjhcSgfpvoI02LRXx6jkqVbevSG9nk+9Aecvc8cs=;
  b=LvnYbdAy169U8zP+PJf2ptRfxZRVTBB+2BTRYHIIKG6yUGAoDMhSuecG
   YncmgvPBNPmTpZWy0Yo/SSHp/RojMIEiotoIav7IA8g+CeBM3m0q5XQRm
   OBj6/9IyRd8idm9XvXi36ZB0tgFulfIojyMjvBij8PhgBBfFqLV44ezgR
   dabH1u0UMXd+yY47uDdHirAI6fFYtSpbRrCtuIs/SQfl+aZHfooFEpcf3
   2wNGw0crSC/APj4+NS61XePpRMqwxuFqtRfaunWp80I6TwvFJIr264iyf
   cRnc3ReQqfXKwvxCYr8zeb0KEo0W3nGAn0tNSKvZzZsRez/Y94HTqOTHt
   w==;
X-CSE-ConnectionGUID: maAZwLQbSy+WBm92vZezEg==
X-CSE-MsgGUID: 6LV34eUFTKCHUEVpKQGTzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="30119599"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="30119599"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 06:43:14 -0700
X-CSE-ConnectionGUID: CtpAB3qsR6W4H/fE6wenmA==
X-CSE-MsgGUID: WFZ06Jv9TcCfH+msyxeG9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="87506784"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 06:43:07 -0700
Date: Fri, 1 Nov 2024 15:43:40 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Abel Vesa <abel.vesa@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>,
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
Message-ID: <ZyTbDELVW5vqFoMS@ideak-desk.fi.intel.com>
Reply-To: imre.deak@intel.com
References: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
 <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-1-cafbb9855f40@linaro.org>
 <ZyPxLpykHkO9Xx_R@ideak-desk.fi.intel.com>
 <87msijjol6.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87msijjol6.fsf@intel.com>

On Fri, Nov 01, 2024 at 11:22:13AM +0200, Jani Nikula wrote:
> On Thu, 31 Oct 2024, Imre Deak <imre.deak@intel.com> wrote:
> > On Thu, Oct 31, 2024 at 05:12:45PM +0200, Abel Vesa wrote:
> >> According to the DisplayPort standard, LTTPRs have two operating
> >> modes:
> >>  - non-transparent - it replies to DPCD LTTPR field specific AUX
> >>    requests, while passes through all other AUX requests
> >>  - transparent - it passes through all AUX requests.
> >> 
> >> Switching between this two modes is done by the DPTX by issuing
> >> an AUX write to the DPCD PHY_REPEATER_MODE register.
> >> 
> >> Add a generic helper that allows switching between these modes.
> >> 
> >> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> >> ---
> >>  drivers/gpu/drm/display/drm_dp_helper.c | 17 +++++++++++++++++
> >>  include/drm/display/drm_dp_helper.h     |  1 +
> >>  2 files changed, 18 insertions(+)
> >> 
> >> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> >> index 6ee51003de3ce616c3a52653c2f1979ad7658e21..38d612345986ad54b42228902ea718a089d169c4 100644
> >> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> >> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> >> @@ -2694,6 +2694,23 @@ int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE])
> >>  }
> >>  EXPORT_SYMBOL(drm_dp_lttpr_max_link_rate);
> >>  
> >> +/**
> >> + * drm_dp_lttpr_set_transparent_mode - set the LTTPR in transparent mode
> >> + * @aux: DisplayPort AUX channel
> >> + * @enable: Enable or disable transparent mode
> >> + *
> >> + * Returns 0 on success or a negative error code on failure.
> >
> > Should be "Returns 1 on success".
> 
> But is that a sensible return value?

It matches what the function returns, but yes, would make more sense to
fix the return value instead to be 0 in case of success.

> >
> >> + */
> >> +
> 
> Superfluous newline.
> 
> >> +int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable)
> >> +{
> >> +	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
> >> +			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
> >> +
> >> +	return drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE, val);
> >> +}
> >> +EXPORT_SYMBOL(drm_dp_lttpr_set_transparent_mode);
> >> +
> >>  /**
> >>   * drm_dp_lttpr_max_lane_count - get the maximum lane count supported by all LTTPRs
> >>   * @caps: LTTPR common capabilities
> >> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> >> index 279624833ea9259809428162f4e845654359f8c9..8821ab2d36b0e04d38ccbdddcb703b34de7ed680 100644
> >> --- a/include/drm/display/drm_dp_helper.h
> >> +++ b/include/drm/display/drm_dp_helper.h
> >> @@ -625,6 +625,7 @@ int drm_dp_read_lttpr_phy_caps(struct drm_dp_aux *aux,
> >>  			       u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
> >>  int drm_dp_lttpr_count(const u8 cap[DP_LTTPR_COMMON_CAP_SIZE]);
> >>  int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
> >> +int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable);
> >>  int drm_dp_lttpr_max_lane_count(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
> >>  bool drm_dp_lttpr_voltage_swing_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
> >>  bool drm_dp_lttpr_pre_emphasis_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
> >> 
> >> -- 
> >> 2.34.1
> >> 
> 
> -- 
> Jani Nikula, Intel

