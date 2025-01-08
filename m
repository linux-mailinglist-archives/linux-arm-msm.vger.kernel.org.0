Return-Path: <linux-arm-msm+bounces-44376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 654A8A05C6E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 14:15:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED6471884407
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 13:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B751B1F75A7;
	Wed,  8 Jan 2025 13:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BdAel2OR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDB020B20
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 13:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736342138; cv=none; b=pepWlStS5gVuSptqcikEQXgObrpMn793AkeQlJrKzvoi+Qg8K+puyvLSJVPqX+FN9QDvRInX1189k/8B8SDckqji//zgYwPSXtg19EZou+AnEQ/7w99wmToUbqbclrJhTBb7e8YZHriIXLJ9QATvTKk+4Wzpos/BtkApppm2148=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736342138; c=relaxed/simple;
	bh=ow/aSlCEf2Hi14L6VuMKcpD9Uxo7OK+XkrVWkv7Gr1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aljrnKguD8/r/asXIG3rytPE0/cb3ltkK/vMNmNbXj+P89+0YHBCdHTt5vdzY9hk60TalADrMZYput6+82j4GU4dCCNOrr9eSgYHueweKp81lsH2R4U9OMhRJdhQBL06DnbIF95UFF+Re314z5EOysgrMupQIk4HJTsPnLuOdDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BdAel2OR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436a39e4891so64109915e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 05:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736342135; x=1736946935; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RJuigyfwmP8g+AjzZPBKqd3NanhyQaBWQuNEBkBgD08=;
        b=BdAel2ORKhaY7x+YrdKI63NhsjzBCuguCOWsj2BdwZB8xY59rRVw2/anKjGOo1EdT4
         OaU53CSr56aa0fuR97Y2znGyR/5Z3aZQIzxRm7njH/wPAUff9ObzRq4Sd7jl/yMR/a8p
         5QZfsyvGcVUJzanXBSTyQfMuEzrNMqoV1nLUR4yEPCiuS+bd2YdUTja2g6o9FYixOKLo
         pE/cZls0KCOSzbacwPJRHemFLpFlmpAiwn1eMU0fGGVvBxQs44XwilWOOeOqynyPDRgN
         P5UzB6dGZds2WvSK3TNbbdA5kzSKvG8H7rvHpC0IaBkHqiswGE2QNLKq8RGYdXKWO7Ob
         n0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736342135; x=1736946935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJuigyfwmP8g+AjzZPBKqd3NanhyQaBWQuNEBkBgD08=;
        b=Norap/UcTnZAdfwFnrZPzqSxK4MpDSZXPt+kJtQTOUKKdeBENY38/piPTOzCXDmivz
         EOxiB/nD3iVA0vYQY9LJqDJ9w5yb9heGOkz44l0AkEgnOI3IDgaa0O2ZhqEvqRq6NHBY
         PBuYf/gMtglXUvmJGpE9nqmZo6mdwkadUJXZdDrIcc9HtvJ0UrFfKrCuS+2V/dUZqR8Y
         XZGaAQtQvHACaXcvBMGILEuYnQx3lLYxUM2NdkAPJhyw7IJHvx3M/B53jF6EbEgmW/Ld
         GcpBObDVxYwLVe2NOQPIGG+1wQ3hfH6dWi7Sdl99ioKAjE9cmjL/SaZmdwkAUwFhX5Wz
         QzQA==
X-Forwarded-Encrypted: i=1; AJvYcCVxOZMbmKm2rV346m/Bf37PLzBzUWVWVUlfheDO3vFoiB6YA7cLtn3gd3EM13xA9F2nZnhWQozrQEHbfS/d@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1AHnuNxVmb5QtKlmj638etI/eybmLCoyqiMm0ouL+1GVt8+UA
	zyZ0jO0waDghVd1CcgKO8/NZ4XYxpH054U8LDOHVM+FIr+ewp+anGIdVyJoZ2iM=
X-Gm-Gg: ASbGncsm8nqfsiGixAhZJEJr6+O2S/Km6ETUMgsf/XQU63fU+4WVzHOkbVFkut6RoFR
	GcgmvHdCZvv+SKu2Dg8la8HKpa/2xSjvZn4t2hvJ8yk0yRL4eEwnbsFI9WQ25Xu49ZJA6BlUbCf
	hD+s2jnZj5jQ4WYfppjLCIbGJXUH6lHAlQUzJtyX8YgzTHOoA3fzK1aTg3Ur30trE1rUEHIYyG+
	q2dnoL0d0zRaeLjZR4+/GxM8dkvWQkMlWq/80FLoibLjLmenT5mNeg=
X-Google-Smtp-Source: AGHT+IEBlTrxBtjf7901ssDCnGeSN4NcUwtvM8JV72Q4zJ9UCPrPz4BdIknjwwKXyCc18LVEe1ItmQ==
X-Received: by 2002:a05:600c:3b91:b0:436:46f9:4fc6 with SMTP id 5b1f17b1804b1-436e26928e6mr24415245e9.8.1736342135088;
        Wed, 08 Jan 2025 05:15:35 -0800 (PST)
Received: from linaro.org ([86.121.162.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e21e1esm20577465e9.38.2025.01.08.05.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 05:15:34 -0800 (PST)
Date: Wed, 8 Jan 2025 15:15:29 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH v3 3/4] drm/i915/dp: Use the generic helper to control
 LTTPR transparent mode
Message-ID: <Z356cSOjqJYrSMvt@linaro.org>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
 <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-3-5c367f4b0763@linaro.org>
 <3p3wgzhtptjexplxrluod6sk36xeltpoh4hxg2yagssw7nh7hj@ikc4rssp6zej>
 <Z3vQfIIDDgnFJsDn@linaro.org>
 <enzj72vy523bvlphbygxn42zocvhx24eghreffzrthomhy5jxo@2l4h345h7ojl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <enzj72vy523bvlphbygxn42zocvhx24eghreffzrthomhy5jxo@2l4h345h7ojl>

On 25-01-08 15:11:50, Dmitry Baryshkov wrote:
> On Mon, Jan 06, 2025 at 02:45:48PM +0200, Abel Vesa wrote:
> > On 25-01-03 20:09:42, Dmitry Baryshkov wrote:
> > > On Fri, Jan 03, 2025 at 02:58:17PM +0200, Abel Vesa wrote:
> > > > LTTPRs operating modes are defined by the DisplayPort standard and the
> > > > generic framework now provides a helper to switch between them, which
> > > > is handling the explicit disabling of non-transparent mode and its
> > > > disable->enable sequence mentioned in the DP Standard v2.0 section
> > > > 3.6.6.1.
> > > > 
> > > > So use the new drm generic helper instead as it makes the code a bit
> > > > cleaner.
> > > > 
> > > > Acked-by: Imre Deak <imre.deak@intel.com>
> > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > > ---
> > > >  .../gpu/drm/i915/display/intel_dp_link_training.c  | 24 +++++-----------------
> > > >  1 file changed, 5 insertions(+), 19 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > > > index 8b1977cfec503c70f07af716ee2c00e7605c6adf..c5bad311edf7b9a5cebb633b9e9692bae397f9ed 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > > > +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > > > @@ -119,9 +119,6 @@ intel_dp_set_lttpr_transparent_mode(struct intel_dp *intel_dp, bool enable)
> > > >  	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
> > > >  			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
> > > >  
> > > > -	if (drm_dp_dpcd_write(&intel_dp->aux, DP_PHY_REPEATER_MODE, &val, 1) != 1)
> > > > -		return false;
> > > > -
> > > >  	intel_dp->lttpr_common_caps[DP_PHY_REPEATER_MODE -
> > > >  				    DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV] = val;
> > > >  
> > > > @@ -146,6 +143,7 @@ static bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp *intel_dp)
> > > >  static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> > > >  {
> > > >  	int lttpr_count;
> > > > +	int ret;
> > > >  
> > > >  	if (!intel_dp_read_lttpr_common_caps(intel_dp, dpcd))
> > > >  		return 0;
> > > > @@ -172,22 +170,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
> > > >  		return lttpr_count;
> > > >  	}
> > > >  
> > > > -	/*
> > > > -	 * See DP Standard v2.0 3.6.6.1. about the explicit disabling of
> > > > -	 * non-transparent mode and the disable->enable non-transparent mode
> > > > -	 * sequence.
> > > > -	 */
> > > > -	intel_dp_set_lttpr_transparent_mode(intel_dp, true);
> > > > -
> > > > -	/*
> > > > -	 * In case of unsupported number of LTTPRs or failing to switch to
> > > > -	 * non-transparent mode fall-back to transparent link training mode,
> > > > -	 * still taking into account any LTTPR common lane- rate/count limits.
> > > > -	 */
> > > > -	if (lttpr_count < 0)
> > > > -		goto out_reset_lttpr_count;
> > > > -
> > > > -	if (!intel_dp_set_lttpr_transparent_mode(intel_dp, false)) {
> > > > +	ret = drm_dp_lttpr_init(&intel_dp->aux, lttpr_count);
> > > > +	if (ret) {
> > > >  		lt_dbg(intel_dp, DP_PHY_DPRX,
> > > >  		       "Switching to LTTPR non-transparent LT mode failed, fall-back to transparent mode\n");
> > > >  
> > > > @@ -196,6 +180,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
> > > >  		goto out_reset_lttpr_count;
> > > >  	}
> > > >  
> > > > +	intel_dp_set_lttpr_transparent_mode(intel_dp, false);
> > > > +
> > > 
> > > I think the code now misses a way to update intel_dp->lttpr_common_caps
> > > in a transparent-mode case:
> > > intel_dp_set_lttpr_transparent_mode(intel_dp, true).
> > 
> > It is being called if the drm_dp_lttpr_init() returns a non-zero value,
> > but that is not part of the diff here.
> 
> Ack, thanks for the explanation. I'd suggest mentioning that in the
> commit message.

Sure. Will do.

> 
> > 
> > > 
> > > >  	return lttpr_count;
> > > >  
> > > >  out_reset_lttpr_count:
> > > > 
> > > > -- 
> > > > 2.34.1
> > > > 
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> 
> -- 
> With best wishes
> Dmitry

Thanks for reviewing!

Abel

