Return-Path: <linux-arm-msm+bounces-8324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D98E283CE50
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 22:17:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 403F52890F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 21:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBB5A13A25E;
	Thu, 25 Jan 2024 21:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jSVMYkfh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8BB13A255
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 21:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706217412; cv=none; b=GOJIZUdgamhFuJQiR6jqKUp1amh3UbCiNBEzYGbtm7GVlGQhp4UkwEhj1pa9kX9ZPg+tF504Nc9tDRsjXkqBWhBG1HlCG2xB+9TpSE3NFu23lJo24egom4hDDfeDj0qcmhpevp5+2tCVEKM4XKvAYcOp3WQd+xTZ2HKUVDDaWk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706217412; c=relaxed/simple;
	bh=xUXibLYvR3SWVWwJ6kE7C8GOyDzTRdG4a89x8mfbIAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wni3lxI7K/buHI0XCxTivw4zurDzE02LA1q6uFAEzZbFCE6j38a8Of8rh+d0vniVV8PtiduBl8c6Zw9KKlIYlGFEEU3h3GSuqnnfAe52ghhe0rbGw8vMhz/MzAJ3X3qQ+oafmcfyFnedx5tDTD9ryFbMFloMIomhQfVgyKt+1/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jSVMYkfh; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50eabfac2b7so9184025e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 13:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706217408; x=1706822208; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z9viDYpLwnvLaN/jy8xMl/NBPq6tMcsa5M1h15mEwBs=;
        b=jSVMYkfhv1g06dN0zpuddn+fNAyfHaKDXpabr5UimAyBaMI8Xzg4FwLO8sUcBrkwe1
         4NZgicPYn32urAEbGtHZ+7LZ0SoDj+KdxdzLz+WjW9XDF4bEGPLgefDg6+q06cVQ47m/
         IMvwo8SCChelv5EN7OPi47CGHrpec9P9I8jQSK6G63wBZ4p+5XFdGWaIzbXGILl5fRaS
         7YpTTD35IJ7Bi/xNPxIrVwqFX0LcQT73Yct1qlRv4aeKnzqx5m/wVXSxJMNUTfdhJwz4
         GMa/2aWf60g4q3tU/yg56tczEMUnE7p9Te52m3//Ve2x6wUsd6wmgcJIZKJ5mR8aXTvP
         TjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706217408; x=1706822208;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z9viDYpLwnvLaN/jy8xMl/NBPq6tMcsa5M1h15mEwBs=;
        b=jC7ZihkEu/MBShXTqubZN5O+7DX2FXby6nHRcKA0QtbJb0LRFlGIGRBgytkq/AZxXK
         rRH/fWzDbbTiwbr4L7/AW2qZug390qfO+5sETivbNhYdMAioKbdK6TTeMug4VPolvNAb
         /MfKxkdBBnV40u2M1mySDj/Z4MGOytJHCNFGpAgNZJx/F6Fbs4anZD5S7nJ1M9qV+R5s
         ZVRyt4OmXO4OAmOY3kjRay1YIAxnoBG9Lrq9CYo2nGyLnUvUGco/ca9b/O7hAcTLbSDS
         oJLASU+M8eF3h+jN3NQQ9uct54NmJKpro89tGTAvqeFPI6QIkt4vv3YW2GXdl4a5OJq0
         wpSw==
X-Gm-Message-State: AOJu0YxX5azIOZEVrqhJ9UWwh68ZU7CcK2cLvxEGpBlgdXMNA9wrclIF
	IbSVnQY7KXGROU6itM3kMzMeo5aevzDncBiVFTpl8xAqKWh/rpR+NuvTNhPP7nU=
X-Google-Smtp-Source: AGHT+IE8iJTzvzHHwVKKh6b1k6IKHEa/eYfZWnA9MFd02jjypWVH5F4G2bNabmj0lwsfdqvUDFLnsw==
X-Received: by 2002:a05:6512:ba5:b0:510:135c:c060 with SMTP id b37-20020a0565120ba500b00510135cc060mr248723lfv.76.1706217408532;
        Thu, 25 Jan 2024 13:16:48 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r9-20020a19ac49000000b0051021c54018sm113397lfc.251.2024.01.25.13.16.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 13:16:48 -0800 (PST)
Message-ID: <53356805-21f4-4329-bff0-82d266ab9399@linaro.org>
Date: Thu, 25 Jan 2024 23:16:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] drm/msm/dpu: move dpu_encoder_helper_phys_setup_cdm
 to dpu_encoder
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
 quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org,
 neil.armstrong@linaro.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-3-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-3-quic_parellan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/01/2024 21:38, Paloma Arellano wrote:
> Move dpu_encoder_helper_phys_setup_cdm to dpu_encoder in preparation for
> implementing CDM compatibility for DP.

Nit: s/CDM compatibility/YUV support/. It might make sense to spell it 
out that YUV over DP requires CDM.

> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 78 +++++++++++++++++
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  9 ++
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 84 -------------------
>   3 files changed, 87 insertions(+), 84 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 83380bc92a00a..6cef98f046ea6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2114,6 +2114,84 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>   	ctl->ops.clear_pending_flush(ctl);
>   }
>   
> +void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
> +				       const struct dpu_format *dpu_fmt,
> +				       u32 output_type)

My email client suggests that the parameters are not idented properly 
anymore.

> +{
> +	struct dpu_hw_cdm *hw_cdm;
> +	struct dpu_hw_cdm_cfg *cdm_cfg;
> +	struct dpu_hw_pingpong *hw_pp;
> +	int ret;
> +
> +	if (!phys_enc)
> +		return;
> +
> +	cdm_cfg = &phys_enc->cdm_cfg;
> +	hw_pp = phys_enc->hw_pp;
> +	hw_cdm = phys_enc->hw_cdm;
> +
> +	if (!hw_cdm)
> +		return;
> +
> +	if (!DPU_FORMAT_IS_YUV(dpu_fmt)) {
> +		DPU_DEBUG("[enc:%d] cdm_disable fmt:%x\n", DRMID(phys_enc->parent),
> +			  dpu_fmt->base.pixel_format);
> +		if (hw_cdm->ops.bind_pingpong_blk)
> +			hw_cdm->ops.bind_pingpong_blk(hw_cdm, PINGPONG_NONE);
> +
> +		return;
> +	}
> +
> +	memset(cdm_cfg, 0, sizeof(struct dpu_hw_cdm_cfg));
> +
> +	cdm_cfg->output_width = phys_enc->cached_mode.hdisplay;
> +	cdm_cfg->output_height = phys_enc->cached_mode.vdisplay;
> +	cdm_cfg->output_fmt = dpu_fmt;
> +	cdm_cfg->output_type = output_type;
> +	cdm_cfg->output_bit_depth = DPU_FORMAT_IS_DX(dpu_fmt) ?
> +			CDM_CDWN_OUTPUT_10BIT : CDM_CDWN_OUTPUT_8BIT;
> +	cdm_cfg->csc_cfg = &dpu_csc10_rgb2yuv_601l;
> +
> +	/* enable 10 bit logic */
> +	switch (cdm_cfg->output_fmt->chroma_sample) {
> +	case DPU_CHROMA_RGB:
> +		cdm_cfg->h_cdwn_type = CDM_CDWN_DISABLE;
> +		cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
> +		break;
> +	case DPU_CHROMA_H2V1:
> +		cdm_cfg->h_cdwn_type = CDM_CDWN_COSITE;
> +		cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
> +		break;
> +	case DPU_CHROMA_420:
> +		cdm_cfg->h_cdwn_type = CDM_CDWN_COSITE;
> +		cdm_cfg->v_cdwn_type = CDM_CDWN_OFFSITE;
> +		break;
> +	case DPU_CHROMA_H1V2:
> +	default:
> +		DPU_ERROR("[enc:%d] unsupported chroma sampling type\n",
> +			  DRMID(phys_enc->parent));
> +		cdm_cfg->h_cdwn_type = CDM_CDWN_DISABLE;
> +		cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
> +		break;
> +	}
> +
> +	DPU_DEBUG("[enc:%d] cdm_enable:%d,%d,%X,%d,%d,%d,%d]\n",
> +		  DRMID(phys_enc->parent), cdm_cfg->output_width,
> +		  cdm_cfg->output_height, cdm_cfg->output_fmt->base.pixel_format,
> +		  cdm_cfg->output_type, cdm_cfg->output_bit_depth,
> +		  cdm_cfg->h_cdwn_type, cdm_cfg->v_cdwn_type);
> +
> +	if (hw_cdm->ops.enable) {
> +		cdm_cfg->pp_id = hw_pp->idx;
> +		ret = hw_cdm->ops.enable(hw_cdm, cdm_cfg);
> +		if (ret < 0) {
> +			DPU_ERROR("[enc:%d] failed to enable CDM; ret:%d\n",
> +				  DRMID(phys_enc->parent), ret);
> +			return;
> +		}
> +	}
> +}
> +
>   #ifdef CONFIG_DEBUG_FS
>   static int _dpu_encoder_status_show(struct seq_file *s, void *data)
>   {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 37ac385727c3b..310944303a056 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -381,6 +381,15 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
>    */
>   void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc);
>   
> +/**
> + * dpu_encoder_helper_phys_setup_cdm - setup chroma down sampling block
> + * @phys_enc: Pointer to physical encoder
> + * @output_type: HDMI/WB
> + */
> +void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
> +				       const struct dpu_format *dpu_fmt,
> +				       u32 output_type);

Again, indentation.

> +
>   /**
>    * dpu_encoder_vblank_callback - Notify virtual encoder of vblank IRQ reception
>    * @drm_enc:    Pointer to drm encoder structure
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index 072fc6950e496..400580847bde7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -264,89 +264,6 @@ static void dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
>   	}
>   }
>   
> -/**
> - * dpu_encoder_helper_phys_setup_cdm - setup chroma down sampling block
> - *                                     This API does not handle DPU_CHROMA_H1V2.
> - * @phys_enc:Pointer to physical encoder
> - */
> -static void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
> -					      const struct dpu_format *dpu_fmt,
> -					      u32 output_type)
> -{
> -	struct dpu_hw_cdm *hw_cdm;
> -	struct dpu_hw_cdm_cfg *cdm_cfg;
> -	struct dpu_hw_pingpong *hw_pp;
> -	int ret;
> -
> -	if (!phys_enc)
> -		return;
> -
> -	cdm_cfg = &phys_enc->cdm_cfg;
> -	hw_pp = phys_enc->hw_pp;
> -	hw_cdm = phys_enc->hw_cdm;
> -
> -	if (!hw_cdm)
> -		return;
> -
> -	if (!DPU_FORMAT_IS_YUV(dpu_fmt)) {
> -		DPU_DEBUG("[enc:%d] cdm_disable fmt:%x\n", DRMID(phys_enc->parent),
> -			  dpu_fmt->base.pixel_format);
> -		if (hw_cdm->ops.bind_pingpong_blk)
> -			hw_cdm->ops.bind_pingpong_blk(hw_cdm, PINGPONG_NONE);
> -
> -		return;
> -	}
> -
> -	memset(cdm_cfg, 0, sizeof(struct dpu_hw_cdm_cfg));
> -
> -	cdm_cfg->output_width = phys_enc->cached_mode.hdisplay;
> -	cdm_cfg->output_height = phys_enc->cached_mode.vdisplay;
> -	cdm_cfg->output_fmt = dpu_fmt;
> -	cdm_cfg->output_type = output_type;
> -	cdm_cfg->output_bit_depth = DPU_FORMAT_IS_DX(dpu_fmt) ?
> -			CDM_CDWN_OUTPUT_10BIT : CDM_CDWN_OUTPUT_8BIT;
> -	cdm_cfg->csc_cfg = &dpu_csc10_rgb2yuv_601l;
> -
> -	/* enable 10 bit logic */
> -	switch (cdm_cfg->output_fmt->chroma_sample) {
> -	case DPU_CHROMA_RGB:
> -		cdm_cfg->h_cdwn_type = CDM_CDWN_DISABLE;
> -		cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
> -		break;
> -	case DPU_CHROMA_H2V1:
> -		cdm_cfg->h_cdwn_type = CDM_CDWN_COSITE;
> -		cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
> -		break;
> -	case DPU_CHROMA_420:
> -		cdm_cfg->h_cdwn_type = CDM_CDWN_COSITE;
> -		cdm_cfg->v_cdwn_type = CDM_CDWN_OFFSITE;
> -		break;
> -	case DPU_CHROMA_H1V2:
> -	default:
> -		DPU_ERROR("[enc:%d] unsupported chroma sampling type\n",
> -			  DRMID(phys_enc->parent));
> -		cdm_cfg->h_cdwn_type = CDM_CDWN_DISABLE;
> -		cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
> -		break;
> -	}
> -
> -	DPU_DEBUG("[enc:%d] cdm_enable:%d,%d,%X,%d,%d,%d,%d]\n",
> -		  DRMID(phys_enc->parent), cdm_cfg->output_width,
> -		  cdm_cfg->output_height, cdm_cfg->output_fmt->base.pixel_format,
> -		  cdm_cfg->output_type, cdm_cfg->output_bit_depth,
> -		  cdm_cfg->h_cdwn_type, cdm_cfg->v_cdwn_type);
> -
> -	if (hw_cdm->ops.enable) {
> -		cdm_cfg->pp_id = hw_pp->idx;
> -		ret = hw_cdm->ops.enable(hw_cdm, cdm_cfg);
> -		if (ret < 0) {
> -			DPU_ERROR("[enc:%d] failed to enable CDM; ret:%d\n",
> -				  DRMID(phys_enc->parent), ret);
> -			return;
> -		}
> -	}
> -}
> -
>   /**
>    * dpu_encoder_phys_wb_atomic_check - verify and fixup given atomic states
>    * @phys_enc:	Pointer to physical encoder
> @@ -399,7 +316,6 @@ static int dpu_encoder_phys_wb_atomic_check(
>   	return drm_atomic_helper_check_wb_connector_state(conn_state->connector, conn_state->state);
>   }
>   
> -

irrelevant, please drop.

>   /**
>    * _dpu_encoder_phys_wb_update_flush - flush hardware update
>    * @phys_enc:	Pointer to physical encoder

-- 
With best wishes
Dmitry


