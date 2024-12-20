Return-Path: <linux-arm-msm+bounces-42899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1869F8BED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 06:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98E0E166DD3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 05:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C74886324;
	Fri, 20 Dec 2024 05:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r/dqBoPK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2621D7083C
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 05:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734673304; cv=none; b=qlpI0oQ/Y3d5J/8COJdOZlCgtxnjBv5qFVmsMg2ks4nc1xNHK+SGT2aQwr5l0RrcZ5WxMye/J0/SWhXgF6qg155gxtP8GuC+rBZ2ytAogTaTThXh0wIJ0cVdoXz47tiOHNqDUMBmJfwHnh5NeMz/8Hcu3/I3gLIzZ7Too0Bf+0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734673304; c=relaxed/simple;
	bh=yrucRAYym6rqFHwboyc6V0o3ORjRtfpaQFkZRqphLdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pwSijVfuEpG4IyWAEu+NoO1o0JEnz7dqGTxCVlY4TVAp8/7Josw2mbjCfjkbPW1yjr4RuLozaSPrfNWrwFv+VwZ9jZ1Nyb99P/VwStASw/G9mjTCog4fsSok+DSJxpxiPvJUhnQlTnZ0+RFeGAGQAR2ZS+UhfcZuSH6ED0h8rzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r/dqBoPK; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ffd6af012eso18484321fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 21:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734673301; x=1735278101; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zSd9RPD5SkoaoogLe4rfM84xfHjo1V6oblWgx/m35FM=;
        b=r/dqBoPK6kbcGVuQMmaX6n7bjjuzs+0Rt6rsXPFZX+Q6XeDaKj/vlnbZ6sS5xvf1bh
         TngRRdj8T24aBgJ42Cn0rSxKh74r5Jtfp9ldxdbJQuV9aQwQm/CIRVTV6DwWBnz8rfYa
         XyEF3NAyItWVDRjXph6qIUGtMGuSHxIsFtWbXeuu7+v5r7etNPAr7p9ks7ZGgDF/Vj00
         bflcgi5/PuBwyBARk2hCqBWNRqVJhvqvzl5hP79YyD0dldudOpDRQQKb5MEsjbajDvhB
         AJFM/alYUmwdrcXzByqsO3+iXRpvMXJfG+X62P8LJBsvd7ZgX4la0f4tIq+EE+6WDlET
         cv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734673301; x=1735278101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSd9RPD5SkoaoogLe4rfM84xfHjo1V6oblWgx/m35FM=;
        b=WhqG8r635iYMP6367ndqG3OeighFa7S2KYCf0KPblOm/zi5+0f5qwvwq70q9Gm1rmm
         f086w3p1oXvrfQoEGcBdQxMdc4CE5eX0P5kMlkIW4q7hoL86AZ7rvbiCwiSMkfMLtLtt
         Tu/OdXiuCHTBFbevpD/uB/Rnf3tLYRlkQrU0n40O/kylqxuRc5xMOSYGJdBJY87YDY5M
         68h5lHipTkndA/GAYC4ChSlEd4qMw263dTknjcqLqWtXKxitzw+9OKNYn/AiKMXW7wnH
         2xjF7eO+VIMKAZyjDqGGfcnSJ2axSNTgN+sLKUB6d4gyn5NFXpDfmUSizCSpH8duCsi0
         73TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZP4AOM3Dh3xcCKHP8akSkHUnP7ksFgdZTgdDktsrZnnidOTcdt+CezJ3zGNLi8pK7MWatiZVVMQNZ9J7c@vger.kernel.org
X-Gm-Message-State: AOJu0YzkQbtoQp9YtfJCm6QLHSJfs0vSUqnjnhydxTNOghjw+MYm5Y71
	e73LlFg6bBKfYI9lzlH4UfBV5eeauHpSOG4S+APdOiICGFCYYd4be1WE90PhU3RlKvfW+ojdfFW
	M
X-Gm-Gg: ASbGncs65ZVzfDQQbQ6vWL+WhRatrmrJ5sDf8F7PC1y02DraQbq4S/ZPzWHnCLbjIuq
	rq61IGPe2ISDPxfE4aYe1ptIBgz4fX+7Rx6FcsEKidDfcIyjvvimiQ2VDPr5AkCdI5KdPG0H0cz
	+2IWBdcvrZLVy5xNo27dHa2PnD2/zb0JA7aLHLA5nJK44JF00oJDBawC3U+H6zXjR7coPzncSy5
	pwX8DRd+BmCrhLfTKfRpNEOlbEU4TcHWrP0t/XBhGt2oMDhhoTQEsEZXkp6LEubuC9O/NrkX1k2
	RUC3DlU3t8Uv/5OhaVwD/CZblS4/JZBsPbuB
X-Google-Smtp-Source: AGHT+IE0SzyvkJ12RI8b+pvSj1Fq06vfOqKQF7hZ9uZpOQiOErELhSiSLImozHQHQDEUoLxuo7BCWA==
X-Received: by 2002:a2e:a588:0:b0:304:4e03:f9d9 with SMTP id 38308e7fff4ca-30468608fb9mr5166751fa.28.1734673301233;
        Thu, 19 Dec 2024 21:41:41 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad99d51sm4547741fa.32.2024.12.19.21.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 21:41:40 -0800 (PST)
Date: Fri, 20 Dec 2024 07:41:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
	quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 16/25] drm/msm/dpu: Require modeset if clone mode
 status changes
Message-ID: <x6q3jvoi452wql5wg3bizmrn657iyhyhrc3ffk5g3g26i6e4vo@n6hnqyjtuwg3>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-16-fe220297a7f0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-concurrent-wb-v4-16-fe220297a7f0@quicinc.com>

On Mon, Dec 16, 2024 at 04:43:27PM -0800, Jessica Zhang wrote:
> If the clone mode enabled status is changing, a modeset needs to happen
> so that the resources can be reassigned
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
> 
> NOTE: As noted by Sima in the v1 [1], the DPU driver doesn't handle
> crtc_state->mode_changed correctly. However, fixing this is out of the
> scope of this series.
> 
> We will post a separate series addressing these issues across the driver

I'd rather fix the isssue first, as suggested by Sima, then we can see
how this function will evolve.

> 
> [1] https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index b063c8fe4c0594772d84401fa56c9c21afc0ad18..9bb920d28bae2706b3892c167fe2bec3fd8857f4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1297,6 +1297,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  {
>  	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
>  									  crtc);
> +	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state,
> +									      crtc);
>  	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
>  	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
>  
> @@ -1308,6 +1310,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  	int rc = 0;
>  
>  	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
> +	bool clone_mode_enabled = drm_crtc_in_clone_mode(old_crtc_state);
> +	bool clone_mode_requested = drm_crtc_in_clone_mode(crtc_state);
>  
>  	/* there might be cases where encoder needs a modeset too */
>  	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask) {
> @@ -1315,6 +1319,10 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  			crtc_state->mode_changed = true;
>  	}
>  
> +	if ((clone_mode_requested && !clone_mode_enabled) ||
> +	    (!clone_mode_requested && clone_mode_enabled))
> +		crtc_state->mode_changed = true;
> +
>  	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>  		rc = dpu_crtc_assign_resources(crtc, crtc_state);
>  		if (rc < 0)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

