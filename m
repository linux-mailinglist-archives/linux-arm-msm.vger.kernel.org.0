Return-Path: <linux-arm-msm+bounces-43908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6813A00D68
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 19:09:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB8673A420D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 18:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836401B532F;
	Fri,  3 Jan 2025 18:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tfaQzPIs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891F01A83FF
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 18:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735927789; cv=none; b=dG9YkmtU6J9UgB508Pfto9TN7ATUD4T55pd9PMcNOaDQovqyMiRGhFG6Jz84LIQkvtR4o1e0ZjLuu0j2b8g/TpMm9ifSULsquaN2YdnfAHjP0jw1xAjqRC/NMrh2AvlBe3TwPlHkiTX6OkivH/jtSinhA8xGB+n+6wshl7MK3Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735927789; c=relaxed/simple;
	bh=wfCvja1O/mxyVCEB+7LkNF2jxD6OIQzntu6g6frOvDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/6hAkYpVhn8qNgyB0i2eLmhoraJojXSFRyJLVr7YpjLMPHvoYJGRoPO9IT5yLzS1zymx+fZMJRaAD5eTHfv4fJrHrbWtsGiNuf5qoixPJGt2BFa+TzRK+k4hBfpdjdyMOOHotRM/0BMa2b6ijeIjiZgHX5Y9SdKsOQdZ9kBnLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tfaQzPIs; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3002c324e7eso144392871fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 10:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735927786; x=1736532586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gZYLBdsRdDPVtkeCUAysBUJx2iI5sqwL/egQovGRiw8=;
        b=tfaQzPIsOaUIgNu77V2qLSMFKZm2rCOSewQAgXRlJdDRKIEMc1IvXiRLRAVls3zA7B
         C5uw7hQdzrPoc31GSZSx2Zbr4qe9Cdu2A79QoaW5UePYN5ntg2y1j6bfCT9HC5J21apL
         +Ek28OSjVLW2cZzmlguBbAYWIKKyyfHUMxbA+RyaE4uQU6NF1ue6k4Zth2uQwJPbhvIi
         qZP3y1tcls/aPn6pkF1oz81I2KOZfEqu2iVJmajTNbc5K50qRlE5FEl1UTVACHbz7Vs0
         ohpTxuC85bNRknQ/WMEfBaSOyXwlArxW1fePOSCH1pkHuyvYFZz1lN6yQZ3YzfLo/n4S
         5I2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735927786; x=1736532586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZYLBdsRdDPVtkeCUAysBUJx2iI5sqwL/egQovGRiw8=;
        b=bErHSFoHyVU8P62qQsMNMoEtNiwt8+WsLvzAAyifpba+ARyscyb66VAhBMaYZ3l07J
         caZ09B7/KEvWukYa+HRFRWLio/LSXfZi80S+VbWeLVF9QGZ83UFUDcrHjy6WrjKVV0rB
         ZX37g/A80YB1oxIoCVL7B49M2pyLtQCx/0B4/ZWgpnkKalItOhKvsvKqFyc2k5a2VXe6
         ESwlfEYbEkFZbb3goUkuz6n1oajVaBD6XT53RwTFoG+z8ZH4hvkOLdLe8tjkcDTMA4ZA
         tW6zhsTPbrlqa1ogU5EbNKTzoVvY7LiO5xKh+7C66KKJzb0nhMf7b51UwQtOpeu5AU8Q
         DtbA==
X-Forwarded-Encrypted: i=1; AJvYcCUXXZicET3l1abhDpKxPBzLlZWPh2Cp4zelJdm0N8Qg+os25HgjSMSGYt4LmjRPmQI3cgo3Dg/4NxLbOHL8@vger.kernel.org
X-Gm-Message-State: AOJu0YwCDnq08dsH9/G7ddl0x7z2mTmFhNReE3USyUjJQbdnDxacj5f7
	VEAQjdRafMqjUZgwfnCmuYTy9RC0SC4NqjkvOu9NO5Kg9RbyzXk6Msft3tQ+fu0=
X-Gm-Gg: ASbGncsJTUyjCDswoG9f/ZsrpwylnPyiPuenx39SDRzmmRZZr+vD/A43z859T2nHncO
	1ot1tURQc8uKjA7gyBFb4P4vscDiHPKtMFVcqYPIB2KoMiRM8WEdt1dwJ3E+h2fCw1mJqQ/iLjg
	/nci/Xfj1mLWtjzCi5usEQqaAGkoqSSBHNbErw8BdY1TH1gBNMnx5n7tFwAub8EQrD0MnSE9TbK
	6QFJa33/BJp10wd2BoZAE8bc60tbKriN37VbBfAZkMaJECZXPuisDLo86LWYKd0UeMFbk8uf540
	RImLzvGWw8MCT6NpRB9ruqxgXG7DPcrGsbjB
X-Google-Smtp-Source: AGHT+IEigSb029e59y379vL7vE1ceWNcVXZK8+VzyasTF/J25CUvyFgmDW7iv3a1fCJVEGa2Lq5l/w==
X-Received: by 2002:a05:651c:198f:b0:302:3261:8e33 with SMTP id 38308e7fff4ca-30468517777mr152461131fa.4.1735927785612;
        Fri, 03 Jan 2025 10:09:45 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b083af8sm46855921fa.101.2025.01.03.10.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 10:09:45 -0800 (PST)
Date: Fri, 3 Jan 2025 20:09:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH v3 3/4] drm/i915/dp: Use the generic helper to control
 LTTPR transparent mode
Message-ID: <3p3wgzhtptjexplxrluod6sk36xeltpoh4hxg2yagssw7nh7hj@ikc4rssp6zej>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
 <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-3-5c367f4b0763@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-3-5c367f4b0763@linaro.org>

On Fri, Jan 03, 2025 at 02:58:17PM +0200, Abel Vesa wrote:
> LTTPRs operating modes are defined by the DisplayPort standard and the
> generic framework now provides a helper to switch between them, which
> is handling the explicit disabling of non-transparent mode and its
> disable->enable sequence mentioned in the DP Standard v2.0 section
> 3.6.6.1.
> 
> So use the new drm generic helper instead as it makes the code a bit
> cleaner.
> 
> Acked-by: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../gpu/drm/i915/display/intel_dp_link_training.c  | 24 +++++-----------------
>  1 file changed, 5 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> index 8b1977cfec503c70f07af716ee2c00e7605c6adf..c5bad311edf7b9a5cebb633b9e9692bae397f9ed 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -119,9 +119,6 @@ intel_dp_set_lttpr_transparent_mode(struct intel_dp *intel_dp, bool enable)
>  	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
>  			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
>  
> -	if (drm_dp_dpcd_write(&intel_dp->aux, DP_PHY_REPEATER_MODE, &val, 1) != 1)
> -		return false;
> -
>  	intel_dp->lttpr_common_caps[DP_PHY_REPEATER_MODE -
>  				    DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV] = val;
>  
> @@ -146,6 +143,7 @@ static bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp *intel_dp)
>  static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
>  {
>  	int lttpr_count;
> +	int ret;
>  
>  	if (!intel_dp_read_lttpr_common_caps(intel_dp, dpcd))
>  		return 0;
> @@ -172,22 +170,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
>  		return lttpr_count;
>  	}
>  
> -	/*
> -	 * See DP Standard v2.0 3.6.6.1. about the explicit disabling of
> -	 * non-transparent mode and the disable->enable non-transparent mode
> -	 * sequence.
> -	 */
> -	intel_dp_set_lttpr_transparent_mode(intel_dp, true);
> -
> -	/*
> -	 * In case of unsupported number of LTTPRs or failing to switch to
> -	 * non-transparent mode fall-back to transparent link training mode,
> -	 * still taking into account any LTTPR common lane- rate/count limits.
> -	 */
> -	if (lttpr_count < 0)
> -		goto out_reset_lttpr_count;
> -
> -	if (!intel_dp_set_lttpr_transparent_mode(intel_dp, false)) {
> +	ret = drm_dp_lttpr_init(&intel_dp->aux, lttpr_count);
> +	if (ret) {
>  		lt_dbg(intel_dp, DP_PHY_DPRX,
>  		       "Switching to LTTPR non-transparent LT mode failed, fall-back to transparent mode\n");
>  
> @@ -196,6 +180,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
>  		goto out_reset_lttpr_count;
>  	}
>  
> +	intel_dp_set_lttpr_transparent_mode(intel_dp, false);
> +

I think the code now misses a way to update intel_dp->lttpr_common_caps
in a transparent-mode case:
intel_dp_set_lttpr_transparent_mode(intel_dp, true).

>  	return lttpr_count;
>  
>  out_reset_lttpr_count:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

