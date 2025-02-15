Return-Path: <linux-arm-msm+bounces-48114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B408A36F19
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2025 16:26:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92F9F7A1545
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2025 15:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51ED1DF27F;
	Sat, 15 Feb 2025 15:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ymZ3LyhS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67541DDC37
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Feb 2025 15:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739633183; cv=none; b=GDj3NCY0Kg9PtvidQDwkg7zNrx1S/QryNbtdVSdNEvZh8IIkttC0GERJu+Bli032zxKLYCSjiwoeGchlD0wDFZAWIkwNb/jjIKw5JEzN81L7jYdqM4zWncGzhpDWwlboLivN9430RnX8E+MbrgEHtIAnmk94VU437HT7cyGfwcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739633183; c=relaxed/simple;
	bh=INbptCq1Brk+CI9xQklLHdq4ec8phgdtGeoodRr/dJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kbasirZgD2n1pq6WuyO5F1KxaU95U705alEnblj+Hx4j7lT4YuMw9WFRC9tr534CQFxJx1ikCcRJPHGYsl/tSqSTupwbDAoTN/l69I87vngw/kyI0gHvjX5yWageoPqxfNaQ3Vmbi01P8/NxceuaFUOldh2s9GefBLAD8clL4as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ymZ3LyhS; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30a2594435dso267981fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Feb 2025 07:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739633180; x=1740237980; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lyhHNrVNorAeI2lBG6ZlhdNRJfwPg8zvhZHfhDTm/Fo=;
        b=ymZ3LyhSQ5hcW6neEPuSbCzOkeTv4QVUSxcYRNEylVsoEUF0l64wn1zc/Zf4wV89ph
         jia0KGszGLUc/82zXDqWV0MbmwtZLPgOfUAIFeAyNdkYW+rll2Z/4smu3v57OAPHDTHD
         bd8lIEToPwJofDVCfx+4YXp3N0BhT3Q9eYrgI/Bex5y6kabdIvZUoUyk3ZjtFMY3iJr5
         0HXAaMWIBqoVbEcgeTUWzJC/Cbpu2r9Y+2b+VE5qmetNVh3+u4Y7rIdwI9Z745YGxtgf
         yINetmwDvzcjQ1/g9SLVuTQ0vKa3OwQL2INIPWz9RFMe/Lgs+3+RIi67G4ri/8Kkc7M0
         R7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739633180; x=1740237980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lyhHNrVNorAeI2lBG6ZlhdNRJfwPg8zvhZHfhDTm/Fo=;
        b=mCsmTbM8LRjgv8G8eZJq8UZng8ZaOgo/uEn9vtqWbNM2z18KCkNXMgzsytPZZYCKd2
         HnW56VuR8tvDDQBTF7e8jXEuF14brl1ZGsnQMifLfMblDV4vJ9cyq0jQg31lAN2d1fUU
         DOPWjE9Rf88liwShHHwvRqHMYn6VXPYFqXZ5fGTeAfFucUVH0lYFwE9no1N5rtHbfuMQ
         D/bc3cIrll8ONfagzrVQEyeQ/y3EeuZ+OGG/Ny58XSoiMindpmbM0n/ui9LQNerZm4Pt
         fipuNoxjkgpY+f5E56f1yWC+Cd69f7WH1sGZwpQAz8iO8g0+DPijEtJHJBWoFqjPMegs
         dYaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtOu+CVG+BZ1sDJG8Eon2SeNXfxsOPR51ccLZbkIAg9VEFWpk/5erroOhptDTPKAkNBibzpv0jeAjMdGIC@vger.kernel.org
X-Gm-Message-State: AOJu0YwKl8SDz8p5msdLzgnWTYirmjYlYXPdfqD3Har1wsEWnTDW4Nwc
	g9zjyJgrO3xC4prQKZTWvUm+MVbuYa/GPgdtl39KxH4+iRQbXKCmGuHPcFfTkB4=
X-Gm-Gg: ASbGnctaJrP8uQDl1Q7XPrZ32Av7Av/ftLi84/ADJ5l4DVcV0J+A3wU7CoLsoMZO7yB
	1DL4T9LIIIsThbTWpRN05RQudLwKtuTIpupRNJCtlJzGNrS623JclJCZTf0wJ9014fuDaR5QvZ9
	CI4Bm2uDReewYufHzU4qZEghN66lUu287GhBhMwWh1U4zGLpXZrLGpmZ7EKZbCI5POjw0JJcWST
	FO5eTB7JUixGmCkf+3qg0m4UcZ8nRk7iCeaxuI72M6rJa83I008Df9MwpEupxhi5pSWTZTcWB7y
	YnpheqcmJMvOwlJlOny6nvEJJx3jtX3MA7B1VHRHwh5Oin0zJbjOCaelPmezCpO51XKCy60=
X-Google-Smtp-Source: AGHT+IHt5pLz1i1krdr/WS2YKInJnYFY0Hb8ZilJLpstOl1Z5M61lz+xkuBcGZbV8SgcJDj6fbYbgw==
X-Received: by 2002:a2e:910e:0:b0:309:2187:2cd9 with SMTP id 38308e7fff4ca-309288c9a73mr10705571fa.7.1739633179478;
        Sat, 15 Feb 2025 07:26:19 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-309cec7e45asm914511fa.105.2025.02.15.07.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 07:26:18 -0800 (PST)
Date: Sat, 15 Feb 2025 17:26:15 +0200
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
Subject: Re: [PATCH v6 06/14] drm/msm/dpu: Fail atomic_check if multiple
 outputs request CDM block
Message-ID: <wfhusui6qv6c4knns7ux6z7qnehzokoa6bj2ufanlnlkqpnvkj@qykctcbwizdn>
References: <20250214-concurrent-wb-v6-0-a44c293cf422@quicinc.com>
 <20250214-concurrent-wb-v6-6-a44c293cf422@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214-concurrent-wb-v6-6-a44c293cf422@quicinc.com>

On Fri, Feb 14, 2025 at 04:14:29PM -0800, Jessica Zhang wrote:
> Currently, our hardware only supports a single output using CDM block at
> most. Because of this, we cannot support cases where both writeback and DP
> output request CDM simultaneously
> 
> To avoid this happening when CWB is enabled, change
> msm_display_topoloy.needs_cdm into a num_cdm counter to track how many
> outputs are requesting CDM block. Return EINVAL if multiple outputs are
> trying to reserve CDM.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
> Changes in v6:
> - cdm_requested -> num_cdm
> 
> Changes in v5:
> - Changed check to fail only if multiple outputs are requesting CDM
>   simultaneously
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 12 +++++++++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  5 +++--
>  3 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index ad969a5b9434..0e4f27da9534 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -692,10 +692,10 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
>  		fb = conn_state->writeback_job->fb;
>  
>  		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
> -			topology->needs_cdm = true;
> +			topology->num_cdm++;
>  	} else if (disp_info->intf_type == INTF_DP) {
>  		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
> -			topology->needs_cdm = true;
> +			topology->num_cdm++;
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 0fbb92021b18..4da2e47265d4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -585,7 +585,8 @@ static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
>  
>  static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
>  			       struct dpu_global_state *global_state,
> -			       uint32_t crtc_id)
> +			       uint32_t crtc_id,
> +			       int num_cdm)
>  {
>  	/* try allocating only one CDM block */
>  	if (!rm->cdm_blk) {
> @@ -593,6 +594,11 @@ static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
>  		return -EIO;
>  	}
>  
> +	if (num_cdm > 1) {
> +		DPU_ERROR("More than 1 INTF requesting CDM\n");

I think we should downgrade those to DPU_DEBUG or something like that,
but that can go separately, or when picking the patch up.

Nevertheless:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> +		return -EINVAL;
> +	}
> +
>  	if (global_state->cdm_to_crtc_id) {
>  		DPU_ERROR("CDM_0 is already allocated\n");
>  		return -EIO;
-- 
With best wishes
Dmitry

