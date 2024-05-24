Return-Path: <linux-arm-msm+bounces-20425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6605B8CEA8E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 22:00:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C99E2816D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 20:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7748439ADB;
	Fri, 24 May 2024 19:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OFzP8Mof"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832286EB67
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 19:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716580797; cv=none; b=svIXAzZSZ6Uv/t8fUHw13fL3Kt7wkwyA+W7GwqA338/cw42rGrUecXauRt7mPyJHS4DkjwfositfQpe4MRbJTXB6xCdxMjBZl99LpD+jQ6QFugxx/Gufw8gO0y/mAqXSxJoNQV0AD5Gfhm7etr1CE8G+SMhYrUKcsw5Fv1CemGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716580797; c=relaxed/simple;
	bh=UY0TxJ1g/Z6YR7WNMLxnDrd0DnZ8mlXqxki02Jh9exA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sdDwCoJRLzaHHepYApU5ASWo3OC3TPuIO10EI38eat8mUKpE4SfCBWAdxKLMQflRsJbSsG13Ol//cs7UieJ+Bli864fE3uJYR2l6XZ4/BMBFkjw2UAIQ/eLd7PRsbQQt71lYb+4j+d72b5QnPLFGthB1M1tAoFML9nV7nWM5S20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OFzP8Mof; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-529682e013dso1282034e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 12:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716580794; x=1717185594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pGqE5XyK9AlS/gmdKLqCAwRJHada2L/EJpjnWwZ6tR8=;
        b=OFzP8MofD/8ln1qZIqxwi1Euco4h/0avmmPo28Wccpfc+kTnOt6Af+gxRDJzTv5nHz
         I9qmLaJoUASXn8A4Tlw1OqlEwq0ZmotZMeMiyXse63TEhk2N5x7/pJYojWYb05/MAKLy
         mhgFpgvSDWBnETE/gWm5TdJfaShZjtdETFKmLpKya7npAZNzU4Zmdc89jqRstJonKoRN
         DMIDti9Q7lZdyfOvZZwQN+lrFEirc5IqNJ2JbFTEFx6594Z0UxNBVXctfk4i4YjB9xIH
         fDFk+PVboVGMAJKVjVJXJB6EPvVY2Wu8rk4bOcz5j4mLF72fEbqGw0Gw5Ht23cA3h6p9
         XT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716580794; x=1717185594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGqE5XyK9AlS/gmdKLqCAwRJHada2L/EJpjnWwZ6tR8=;
        b=Zb8yOCpQ7pJ62pvlkCbDBwGeqVpb0pUBdTvd958tD2XFC5dUgzyFhPSf7L6mPM/kWs
         x9qUP77uRzTFANjj/x+YD+iIZQ5NGB1/+ep0HDytrWjjQejwst5jCWeI2k6UpczXk4E+
         jPBmhGF2vNcr/qm0xOSelogclv31FlBjVZrakX4EI+czjFbqxbkv0bfWti6j1/juoG0f
         ql/hp721zXmhH6qE+ar9MRZEHNqMrD4N98Jj3cly84Y/vl6j/8ll1dUDWEjCFjpgb5nH
         FUkE1QEvXB5z9zzAyB/5ybS7TA8EXxdVoY0b0N//14fe6U5H+hJJpMKeTClfmxr9lTNm
         rBAA==
X-Forwarded-Encrypted: i=1; AJvYcCV7c42yRdMcB/tFyx7qRivDvhXKDplxSpegLHH0lxg+m+GQ3eznkXrHEVtC90AanZgiZxp5/12L8MHGWWh3JrAh/TZhINz9G9vEPNbl3g==
X-Gm-Message-State: AOJu0Yw9a3/4TWwCcDWIGA0pzWPJSxZekTU5lgkCBqgbrFxnrSvrCvIh
	ZSSN8kV6UkwKAxMPbGrTvu6kUdW/r7jETfj2NwfHS7sNIpfjnShsxH6eXOBJUZDNXyNvW2a6wHZ
	T
X-Google-Smtp-Source: AGHT+IEL67ua6xkBji7gqkELqzQgg8XINXWQr3e4sQgdtKPhKVbinyunp4c5rTphED3dpz4Em2Om/Q==
X-Received: by 2002:a05:6512:e96:b0:523:8c7a:5f6 with SMTP id 2adb3069b0e04-529663e627dmr2661791e87.51.1716580793651;
        Fri, 24 May 2024 12:59:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529711fa7fesm229631e87.264.2024.05.24.12.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 12:59:53 -0700 (PDT)
Date: Fri, 24 May 2024 22:59:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v4 1/5] drm/msm/dpu: fix video mode DSC for DSI
Message-ID: <7faghtnpcgrcgxvjo56undtf4un7kcxioxwlif2u63nppl435l@xwwkfxsqimvj>
References: <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-0-e61c05b403df@linaro.org>
 <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-1-e61c05b403df@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-1-e61c05b403df@linaro.org>

On Fri, May 24, 2024 at 09:18:21PM +0800, Jun Nie wrote:
> From: Jonathan Marek <jonathan@marek.ca>
> 
> Add necessary DPU timing and control changes for DSC to work with DSI
> video mode.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     |  8 ++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 13 +++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          |  4 ++++
>  4 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 119f3ea50a7c..48cef6e79c70 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -564,7 +564,7 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>  	return (num_dsc > 0) && (num_dsc > intf_count);
>  }
>  
> -static struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
> +struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
>  {
>  	struct msm_drm_private *priv = drm_enc->dev->dev_private;
>  	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 002e89cc1705..2167c46c1a45 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -334,6 +334,14 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
>   */
>  unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc);
>  
> +/**
> + * dpu_encoder_get_dsc_config - get DSC config for the DPU encoder
> + *   This helper function is used by physical encoder to get DSC config
> + *   used for this encoder.
> + * @drm_enc: Pointer to encoder structure
> + */
> +struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc);
> +
>  /**
>   * dpu_encoder_get_drm_fmt - return DRM fourcc format
>   * @phys_enc: Pointer to physical encoder structure
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index ef69c2f408c3..7047b607ca91 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -115,6 +115,19 @@ static void drm_mode_to_intf_timing_params(
>  		timing->h_front_porch = timing->h_front_porch >> 1;
>  		timing->hsync_pulse_width = timing->hsync_pulse_width >> 1;
>  	}
> +
> +	/*
> +	 * for DSI, if compression is enabled, then divide the horizonal active
> +	 * timing parameters by compression ratio. bits of 3 components(R/G/B)
> +	 * is compressed into bits of 1 pixel.
> +	 */
> +	if (phys_enc->hw_intf->cap->type != INTF_DP && timing->compression_en) {
> +		struct drm_dsc_config *dsc =
> +		       dpu_encoder_get_dsc_config(phys_enc->parent);
> +		timing->width = timing->width * (dsc->bits_per_pixel >> 4) /

Here you are truncating fractional part of BPP. Please use
drm_dsc_get_bpp_int(), at least it will warn if there is a fractional
part. Or, even better, add a helper to calculate width * bpp / 64 / (bpc
* 3) and use it here and in dsi_adjust_pclk_for_compression()

> +				(dsc->bits_per_component * 3);
> +		timing->xres = timing->width;
> +	}
>  }
>  
>  static u32 get_horizontal_total(const struct dpu_hw_intf_timing_params *timing)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 225c1c7768ff..2cf1f8c116b5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -168,6 +168,10 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
>  
>  	data_width = p->width;
>  
> +	/* TODO: handle DSC+DP case, we only handle DSC+DSI case so far */
> +	if (p->compression_en && !dp_intf)
> +		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
> +

Separate commit, please

>  	hsync_data_start_x = hsync_start_x;
>  	hsync_data_end_x =  hsync_start_x + data_width - 1;
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

