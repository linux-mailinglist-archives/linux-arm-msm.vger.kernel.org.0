Return-Path: <linux-arm-msm+bounces-30294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3CA96682F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 19:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5365D1C235FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 17:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0580816C68F;
	Fri, 30 Aug 2024 17:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pwf3xXJ1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAA81BB68F
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 17:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725039588; cv=none; b=e4ye5mAq3GCHWPDdO0k5jj+Lu58nuYJcTkvE/RjFVgCT8c7s6TvULsbudWyGkspD+dhWUBOkjhsDMIaJHte5LJcjA2yT/VgHtA23ahVf/+oIs9hoXf+obI+q4Ns1N11PobeWSXVfT6BlT9vLt8mbdrf91XHzk+SyiU+v62z5jPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725039588; c=relaxed/simple;
	bh=ra2Qb8WuWJCBh0iw6WIXHbxAIIitOVx6Hlm9YwxlSVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJsYADzLYvzv461QtryYBI0QafMfJWBXIDT+MvYt5kt8k6lRNkJpuvijAXYIrmCKhKEnliiZlVLg+tqG8d4qi1g9wqeYc70TW1Pox6YMzjOPfJt5gnoQ5qsL2e4/af8AlkD7KePQT4bEyZVjSoQMKlmqCcbgD85+sgQGgx8JQcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pwf3xXJ1; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f3fea6a0a9so19385551fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 10:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725039585; x=1725644385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o9RLqmZuPgkSZGcw3aqWvhJSnLmhE6YOvXyNpIJT4cs=;
        b=Pwf3xXJ1PXiwux/RwSsJO/vbDFBSGzmr8FXOquWGhHMUDVa4YuV6ToaXK7KGKbEYak
         VLbpJ0NLYUXobZaMjqubjsvpxRyGVl1QDXWig5SOxsJI9JtVVJrKClTsgP3yfH3It6W4
         D3kJcNOuVwei+YrfPBAKZ5RFwsTe9J88z8lzWAmTZamvxv6PGPTh1wQDY1ykAZUF2Kar
         kk6tHutZXlp1w8bDNbWOVvsermQ7P/U1UI/b9z3gbwhhY2TMQ0VAT95Vpxc+ZHZt7kcS
         h2QXMllCnj0WKoR54Sc9P/icrtzaBvbiWgaGUcM4DWaWImeQtlq7Wm7kS2H/6waTmhCE
         Zb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725039585; x=1725644385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9RLqmZuPgkSZGcw3aqWvhJSnLmhE6YOvXyNpIJT4cs=;
        b=RzbPEtinW/jgYmQ3uhtJeJnpOZixKi4EfTbWNlKnVP5GhRmUxvgQ94cjvgj/3MQ4ve
         t4TRh9cMXFrfZczE/c87ORReJQ6DOgaw36QOFaWe9Zb7u2WDtZmzVenwUPgGVFcY8gSX
         i4E0uCNMPP17Irp+L0eF/UdFnM1nKDaWs3inVeQrMW7ZMIS6CgukxGMBmRUVuQNSO7+Q
         Zw0WDY2+f3r4u2f9tmp56CHW9SG0XHePN2B6xWKfo3eRp91Uii0pbt132TZsiV99WarY
         IkrmBZzCbCYmf7Ylq8kiLNEyEfU3261bjNi9SaRPHtEoYTIsDXJ0Z+id0u+IFkE7ZSCf
         lCkg==
X-Forwarded-Encrypted: i=1; AJvYcCXhEkteN11Tuk1N2Un+eBDcDekFP5dkUa1I2TvGpV4cgj94JRd1+NLYe3Bvg9O2RZzMef9RwZFmC3f/gFmq@vger.kernel.org
X-Gm-Message-State: AOJu0YwZRiKc73BGb0Z+wwFUyv2ufOwQl+6E2zCwD1W+6T5AzYwAhiLo
	sad8MawlT8utKrcqRZoEhzzuD8AhbL4LdaucjTae9qL1u1usyKXUMD30u0gLMPU=
X-Google-Smtp-Source: AGHT+IF6eoaBd3HfbZeeshXOGgUNf1X6KWPZzAHPqGgbnCdZT/fK0C7fYa4u01FRCsQjwzF8NT9EEw==
X-Received: by 2002:a2e:a587:0:b0:2ef:290e:4a30 with SMTP id 38308e7fff4ca-2f61e0adff2mr11666591fa.16.1725039584657;
        Fri, 30 Aug 2024 10:39:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f61517190dsm7568951fa.78.2024.08.30.10.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 10:39:44 -0700 (PDT)
Date: Fri, 30 Aug 2024 20:39:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 21/21] drm/msm/dpu: Set possible clones for all encoders
Message-ID: <mg6wfuvfsdbewoacnd3vuidlgslbfmx5nhvy7ulwxolevt56at@ae2x3jd34d24>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-21-502b16ae2ebb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-21-502b16ae2ebb@quicinc.com>

On Thu, Aug 29, 2024 at 01:48:42PM GMT, Jessica Zhang wrote:
> Set writeback encoders as possible clones for non-writeback encoders and
> vice versa.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 27 +++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  7 +++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  7 +++++--
>  3 files changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 47b5a5994234..aad659e6d35b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2352,6 +2352,33 @@ static int dpu_encoder_virt_add_phys_encs(
>  	return 0;
>  }
>  

Docs should go here.

> +uint32_t dpu_encoder_get_clones(struct drm_encoder *drm_enc)
> +{
> +	struct drm_encoder *curr;
> +	int type = drm_enc->encoder_type;
> +	uint32_t clone_mask = drm_encoder_mask(drm_enc);
> +
> +	/*
> +	 * Set writeback as possible clones of real-time encoders and real-time
> +	 * encoders as clones of writeback.
> +	 *
> +	 * Writeback encoders can't be clones of each other and real-time
> +	 * encoders can't be clones of each other.
> +	 */
> +	drm_for_each_encoder(curr, drm_enc->dev) {
> +		if (type == DRM_MODE_ENCODER_VIRTUAL &&
> +				curr->encoder_type == DRM_MODE_ENCODER_VIRTUAL)
> +			continue;
> +		if (type != DRM_MODE_ENCODER_VIRTUAL &&
> +				curr->encoder_type != DRM_MODE_ENCODER_VIRTUAL)

Align to opening brackets.

> +			continue;
> +
> +		clone_mask |= drm_encoder_mask(curr);
> +	}
> +
> +	return clone_mask;
> +}
> +
>  static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>  				 struct dpu_kms *dpu_kms,
>  				 struct msm_display_info *disp_info)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 7ab5f9380bf5..70eda127488a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -98,6 +98,13 @@ enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder);
>   */
>  void dpu_encoder_virt_runtime_resume(struct drm_encoder *encoder);
>  
> +/**
> + * dpu_encoder_get_clones - set possible_clones for DPU encoder
> + * @drm_enc:        DRM encoder pointer
> + * Returns:         possible_clones mask
> + */
> +uint32_t dpu_encoder_get_clones(struct drm_encoder *drm_enc);
> +
>  /**
>   * dpu_encoder_init - initialize virtual encoder object
>   * @dev:        Pointer to drm device structure
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 87526d3c224a..1a82aa61d217 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -2,7 +2,7 @@
>  /*
>   * Copyright (C) 2013 Red Hat
>   * Copyright (c) 2014-2018, The Linux Foundation. All rights reserved.
> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   *
>   * Author: Rob Clark <robdclark@gmail.com>
>   */
> @@ -793,8 +793,11 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>  		return ret;
>  
>  	num_encoders = 0;
> -	drm_for_each_encoder(encoder, dev)
> +	drm_for_each_encoder(encoder, dev) {
>  		num_encoders++;
> +		if (catalog->cwb_count > 0)
> +			encoder->possible_clones = dpu_encoder_get_clones(encoder);
> +	}
>  
>  	max_crtc_count = min(catalog->mixer_count, num_encoders);
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

