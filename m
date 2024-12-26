Return-Path: <linux-arm-msm+bounces-43372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 258A79FCAFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 13:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B7A21882F43
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 12:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31C51D416A;
	Thu, 26 Dec 2024 12:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aamVeHkM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44641CCB4A
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2024 12:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735217179; cv=none; b=B8UlW3a6bEDpb+R49CHyVek6oFrkHIkiscMjXtPo9cmbVunQ+OonvOGeg9wpxnI1LUbREdnjyGp8iNCjcRXflG//pPov7dUx6WooAqhQ/NUXJGWpXyWi2yeYOGPPhCmautdHz5pJyQ6SrtOEX7W9G9NSDEbH4ewC11Tq0Ac2af4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735217179; c=relaxed/simple;
	bh=G3hUxADeUhWD6vBq6ggpg1KhvijnCggWuXdOn1Uf7ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RajbYq7wVMsZBwWi+pbMcA6jAbYqSLZUvSO4eA1W6NpsHMVnrL5VzGhiIpeozlVTKqopSVIbt4EGGI2Ni2H/IsBbnXgJ4wFthKfTbs5TNE5nt+TN8IS4duCPNqD5nWzYUnXiANjL8couKr53MXyYJCEV8ZiL7IJ/36ny6emXlBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aamVeHkM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43675b1155bso45754405e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2024 04:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735217176; x=1735821976; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UCdNvS5Djx3r+ijh8xS7MexSd/I3n9CUOOYzp0CujaU=;
        b=aamVeHkMGWcaLuFVGiZGAy2elUcUCgaORvnGLH2SeN+7a+wVSltAXiBFE3IFh/8oek
         uXG7kP31nzUnlfF6opcgieZfpZ4dF96ApwgR0lA+fhNhiyZOvftJn4HOPmh01FVka9nr
         C2XjxMzTGwTfxaKQRCtKuBUvoA2bz4Ed0jFEEtqDOn24GyZpoA6kyQYe26Zb1N8SZZ42
         E+884Aie0zo9OvkQM2Y+gk9JRvSZudR3tt/wmXwDxw2UQOzR/B9p6QIs8qS8eVfekwZM
         xF2/juPF/yY+gBARehbmUwFNrkiRaA/YsqTnfqLrNvQZ3yVKwo76dXnNXX7CN4TjE7Q4
         Xfdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735217176; x=1735821976;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCdNvS5Djx3r+ijh8xS7MexSd/I3n9CUOOYzp0CujaU=;
        b=PVA0iyRDDmHLdDeHlMWV3EL75IUH+afkHYwf2sRvkS1A6rGk5lvnyJYZ3b2Owe0ePA
         C7i+DCkxrSWIgaZE6d39AFbm2ttgbB+4xWjtZQcMJTKm+MX8W9bCaoDf7EZdGOSdTeZX
         ivrfpZcGX+hxrcc/Lh9WWwgL+tg07m/sv93GcVBnZC9RBwAr6/w4pKMEQ7X3kLNqJCfz
         cjkN0XsH8Kck3JPEHgWtI7oBQYm7oqyjynN7mbwBH1EJHLmahhITQQBd+YYVynrVbmLd
         okh9t+cTfYQdDVLkosuUhc19D+cMPdBoZ5FwnP2vSEzDcCzPuZ5eTKztyeMC16QmrpFk
         G0Bg==
X-Forwarded-Encrypted: i=1; AJvYcCXeZPxPUkXLRFv2zvoTtKx330lk3hmAfxKt9R3mfXvWh5Iz9cjhf1JCn7jRhP9KHvcj2ayZrjtvs7Y7vuv+@vger.kernel.org
X-Gm-Message-State: AOJu0YyMCBBEmc1x1T6mBxejafBg/CfL55W84rieZ+Z23aq7sd06CS0v
	KwKqz1z6ZdtZAsjgnO7gyCAZSgT4dhn/HzgZVTq/ciEgdl7K2KteLULSCnsQ9HY=
X-Gm-Gg: ASbGncudtmBkKfJv2byeGpB0gkgXehxCOvOFmzElbJOdjthO7lauvnbtzdc1Q+C4iW8
	0HFnsdPqa3YB3BBddyfqxgMfSN0UhttgfmlAgvQUdPsr/DGc5ohxXa1Uqw+Ajj17MfY+prPtMJ0
	5YtTkEOJIGiAXNznhiDDqS/4O7hrflw6Pa1gmAldyktIPTMfxr2k8rrcv9/PVwwMZUA6iHYUFI5
	z9aOQyVzTRjCRU4t7z0WdbovhA3TowVF6DwnUPWQsMqMT9qmSOK3Pw=
X-Google-Smtp-Source: AGHT+IFdoO/zxiQ3FIpGhucTVIgGS2pedJeFOAxfk444aPe9ZZVT8fXnThIsGtTdQljhl+HRLuLbag==
X-Received: by 2002:a05:600c:1c1a:b0:436:1b81:b65c with SMTP id 5b1f17b1804b1-43668646aebmr214219565e9.15.1735217176112;
        Thu, 26 Dec 2024 04:46:16 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea40csm231612665e9.1.2024.12.26.04.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 04:46:14 -0800 (PST)
Date: Thu, 26 Dec 2024 14:46:12 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
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
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 4/4] drm/msm/dp: Add support for LTTPR handling
Message-ID: <Z21QFPYDfFOR905L@linaro.org>
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
 <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-4-d5906ed38b28@linaro.org>
 <Z1moNToiIIB9auSl@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1moNToiIIB9auSl@hovoldconsulting.com>

On 24-12-11 15:56:53, Johan Hovold wrote:
> On Wed, Dec 11, 2024 at 03:04:15PM +0200, Abel Vesa wrote:
>  
> > +static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp)
> > +{
> > +	int lttpr_count;
> > +
> > +	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd,
> > +					  dp->lttpr_caps))
> > +		return;
> > +
> > +	lttpr_count = drm_dp_lttpr_count(dp->lttpr_caps);
> 
> I was gonna say shouldn't you handle errors here, but that explains the
> non-negative check I commented on the first patch in the series.

So lttpr_count is a bit weird. It's either between 0 and 8, or -ERANGE
if more than 8 LTTPRs are found, or -EINVAL if for some reason the
DP_PHY_REPEATER_CNT register contains an invalid value.
(see drm_dp_lttpr_count())

Now, I think I should just drop the lttr_count local variable here entirely.

> 
> This looks error prone, but I think you should at least update the
> kernel doc comment to drm_dp_lttpr_init() in the first patch so that
> it's clear that you pass in the number of LTTPRs *or* an errno.

Yes, I'll do that. Will mention all possible values and what they mean.
And will probably point to the drm_dp_lttpr_count() as well, just to be
safe.

> 
> > +
> > +	drm_dp_lttpr_init(dp->aux, lttpr_count);
> > +}
> > +
> >  static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
> >  {
> >  	struct drm_connector *connector = dp->msm_dp_display.connector;
> >  	const struct drm_display_info *info = &connector->display_info;
> >  	int rc = 0;
> >  
> > +	msm_dp_display_lttpr_init(dp);
> 
> It looks like you ignore errors on purpose so I guess that's fine.

Maybe I should at least throw an error, just like the i915 does.
Will do that.

> 
> > +
> >  	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
> >  	if (rc)
> >  		goto end;
> 
> Either way, this is needed for external display on my x1e80100 machines,
> while not breaking the X13s:
> 
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> 
> Johan

Thanks for reviewing and testing,
Abel

