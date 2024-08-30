Return-Path: <linux-arm-msm+bounces-30292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C41966813
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 19:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 874681C22A17
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 17:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D3215C153;
	Fri, 30 Aug 2024 17:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NLtIVieU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBEE1BA895
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 17:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725039344; cv=none; b=CP9wH813qaQYdUDi9P58wgdKGTnQNyc7x0FkuiH91+efZSsCO68SLGvkVBUplY58oATE3Vko8UhpXmrwPG0WfzAwfVapNhnXvk84ef+g+oGN2s/nm9ZYr/zJcGRpe/FarW4eNvLlSnJ6h9oKiUktMyBtfrP4WWd+PcSalucC0v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725039344; c=relaxed/simple;
	bh=oaK/NBY6aUgvThzfxWcCJ04rsShm208MrTLEkFUyXfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CrLyl+v1oU9YK4ZCRGS/VzQW0Ee2nk2jBvvRjgjxmW5LeHfQ5vjPzIso6+svyEBjxBMASqFZpI8EpemD1XIWYwmB850fITh80yl2+1L7AUfQffZ/KtzXb51lL0ls5Ca0z5UZZM8n7uDeY1bkCiZvWAIVI5pga9TFIS1B824y/yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NLtIVieU; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53343bf5eddso2654151e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 10:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725039341; x=1725644141; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kszvRJtY9UGsU6dSkuAKZT1ejxQUCF702RsOxPJFqC0=;
        b=NLtIVieU1W6X+s23vvDcoMp1+GYnHnxIp7M34F9ePGQcu/P6CB7Iii9oN4sJ4hibDs
         JfY2JytZmzw7XqgMFGzIbQefhA9Sk8GCmCXeXF3m+GM2lH1Jyf/pN2ESlqFbkEmQkTBV
         WgRbnBVW+afHd1rUYBPT2BSf+7BvLDpltEs+rjejj1oXn1UsrgJ8fBOZlmsebcPId+W2
         4NFapyzOfsUGp7ErSHIhInXtrLgGFGY1XnfvFpnhCEsg6jEpF9Y728iGltN4a6yxGSUx
         SfsbRPobVkNO2K/FHNkMPo/+EiKZbkfA+aIJFvOLEQFYpuM4XysSzKEh9SF16g+8/+rF
         n43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725039341; x=1725644141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kszvRJtY9UGsU6dSkuAKZT1ejxQUCF702RsOxPJFqC0=;
        b=XtKM/FoCeq02iz/EjLZwApZPsNkUtII3m0KDDnIFw8mkHe505XwrMVu7ZhgkCsG3Cw
         GKuejPMqoxoKQufRvbnnSkWv6SgG/56J+zoSqKhLVbd7rDRxPimFA0e9HY+mj7XGWWBb
         Kb3pUxl5g1eZAYB7cM26wJqOOOGFIT/zu9/a3FGG+Nd4pCMsI1moBc3t8/bxBM9E9zbB
         yvNkfQc10AW85e2dzqg4vM02aISDS751X7+yRlyWSOUhw9lD8vxAV/aGi7VwG4fhDvOf
         KIbV2jZ2lHCd3R7dtgVVQN7dr6q2eLDfexWuf2O76QzpCKZDjYRPpyWFyDY4dRKIZQe2
         cCGw==
X-Forwarded-Encrypted: i=1; AJvYcCVyWbSBO2FdmVKJuvC7WFnrEkq3GYDzU17vA3KxWeG7HFGUO2wjTHFkCtL+tO9zPc4tqIZSf5YM+slHK+Au@vger.kernel.org
X-Gm-Message-State: AOJu0YxgRUhlw+Nmkxr8xSTLwyKSHfSoxnYMK2F9zo6p65XMx5uRFKs3
	u89SrGxeT3WBwYQdxYGMZiCB6IoSz/L5flwnOYb3W2CkBU5mlW9dTk5ve3yif0M=
X-Google-Smtp-Source: AGHT+IHCy243phrYX32uZ8Q5Wu2rEjZgqHS0zJ/yPF/KqeBOfUc3WEuE4JWw/Au+SqfMB4Bhg8zLwg==
X-Received: by 2002:a05:6512:b06:b0:52f:c24b:175f with SMTP id 2adb3069b0e04-53546b371eemr1986217e87.20.1725039340587;
        Fri, 30 Aug 2024 10:35:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535408412b3sm709664e87.216.2024.08.30.10.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 10:35:40 -0700 (PDT)
Date: Fri, 30 Aug 2024 20:35:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 20/21] drm/msm/dpu: Reorder encoder kickoff for CWB
Message-ID: <ghzsvz37j7tgj2c6kkixpnyo2ezc33vd53zrgynet5krk75ut4@lcxhpuruv6ut>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-20-502b16ae2ebb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-20-502b16ae2ebb@quicinc.com>

On Thu, Aug 29, 2024 at 01:48:41PM GMT, Jessica Zhang wrote:
> Add a helper that will handle the correct order of the encoder kickoffs
> for concurrent writeback.
> 
> For concurrent writeback, the realtime encoder must always kickoff last
> as it will call the trigger flush and start.
> 
> This avoids the following scenario where the writeback encoder
> increments the pending kickoff count after the WB_DONE interrupt is
> fired:
> 
> If the realtime encoder is kicked off first, the encoder kickoff will
> flush/start the encoder and increment the pending kickoff count. The
> WB_DONE interrupt then fires (before the writeback encoder is kicked
> off). When the writeback encoder enters its kickoff, it will skip the
> flush/start (due to CWB being enabled) and hit a frame done timeout
> as the frame was kicked off (and the WB_DONE interrupt fired) without
> the pending kickoff count being incremented.
> 
> In addition, the writeback timer should only start after the realtime
> encoder is kicked off to ensure that we don't get timeouts when the
> system has a heavy load (ex. when debug logs are enabled)
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 67 ++++++++++++++++++++++++++------
>  1 file changed, 55 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index daf5f751f584..d2f91e89eba7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -928,6 +928,42 @@ static int _dpu_crtc_wait_for_frame_done(struct drm_crtc *crtc)
>  	return rc;
>  }
>  
> +static int dpu_crtc_kickoff_clone_mode(struct drm_crtc *crtc)
> +{
> +	struct drm_encoder *encoder;
> +	struct drm_encoder *rt_encoder = NULL, *wb_encoder;
> +
> +	/* Find encoder for real time display */
> +	drm_for_each_encoder_mask(encoder, crtc->dev,
> +				  crtc->state->encoder_mask) {
> +		if (encoder->encoder_type == DRM_MODE_ENCODER_VIRTUAL)
> +			wb_encoder = encoder;
> +		else
> +			rt_encoder = encoder;
> +	}
> +
> +	if (!rt_encoder || !wb_encoder) {
> +		DRM_DEBUG_ATOMIC("real time or wb encoder not found\n");
> +		return -EINVAL;
> +	}
> +
> +	dpu_encoder_prepare_for_kickoff(wb_encoder);
> +	dpu_encoder_prepare_for_kickoff(rt_encoder);
> +
> +	/*
> +	 * Kickoff real time encoder last as it's the encoder that
> +	 * will do the flush
> +	 */
> +	dpu_encoder_kickoff(wb_encoder);
> +	dpu_encoder_kickoff(rt_encoder);
> +
> +	/* Don't start frame done timers until the kickoffs have finished */
> +	dpu_encoder_start_frame_done_timer(wb_encoder);
> +	dpu_encoder_start_frame_done_timer(rt_encoder);
> +
> +	return 0;
> +}
> +
>  void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
>  {
>  	struct drm_encoder *encoder;
> @@ -952,13 +988,25 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
>  			goto end;
>  		}
>  	}
> -	/*
> -	 * Encoder will flush/start now, unless it has a tx pending. If so, it
> -	 * may delay and flush at an irq event (e.g. ppdone)
> -	 */
> -	drm_for_each_encoder_mask(encoder, crtc->dev,
> -				  crtc->state->encoder_mask)
> -		dpu_encoder_prepare_for_kickoff(encoder);
> +
> +	if (drm_crtc_in_clone_mode(crtc->state)) {
> +		if (dpu_crtc_kickoff_clone_mode(crtc))
> +			goto end;
> +	} else {
> +		/*
> +		 * Encoder will flush/start now, unless it has a tx pending.
> +		 * If so, it may delay and flush at an irq event (e.g. ppdone)
> +		 */
> +		drm_for_each_encoder_mask(encoder, crtc->dev,
> +				crtc->state->encoder_mask)
> +			dpu_encoder_prepare_for_kickoff(encoder);
> +
> +		drm_for_each_encoder_mask(encoder, crtc->dev,
> +				crtc->state->encoder_mask) {
> +			dpu_encoder_kickoff(encoder);
> +			dpu_encoder_start_frame_done_timer(encoder);
> +		}
> +	}
>  
>  	if (atomic_inc_return(&dpu_crtc->frame_pending) == 1) {
>  		/* acquire bandwidth and other resources */
> @@ -970,11 +1018,6 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
>  
>  	dpu_vbif_clear_errors(dpu_kms);
>  
> -	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask) {
> -		dpu_encoder_kickoff(encoder);
> -		dpu_encoder_start_frame_done_timer(encoder);
> -	}
> -

I think I understand why you wanted to move the kickoff before the
frame_pending, etc. However at the same time dpu_vbif_clear_errors()
should be called before kickoff.

>  	reinit_completion(&dpu_crtc->frame_done_comp);
>  
>  end:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

