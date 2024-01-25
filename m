Return-Path: <linux-arm-msm+bounces-8338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC1583CEE0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 22:49:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC5281F2931D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 21:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C4613A256;
	Thu, 25 Jan 2024 21:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wdi8/FXk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CBD4A1D
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 21:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706219380; cv=none; b=WipMqAn1xQPkWGQYa8gqF7KK5GQxKqUx5IyMchgt8aAYvAVvvytl2H0eg2jv4sBz5cIkjd+HYFubON008g9yydWdiSuu99yM5k6P1ott/L91SkQwgtlConJXnoyfNQQqOFcSxlkooM+bfrqLnwUqNNyCRl1lGa2TgRd36ChBL+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706219380; c=relaxed/simple;
	bh=MiY7bKzRymiYrfq4erE/dHXtDlhoBDTRLNDyp8Fpqqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eZYSiZS7uPkQ8sG0l4GU1BiMdboWVJCjqEFPpijcK0cO5OPtmvrP1uER0pDKs0VE4KudGH8NCcoSvNq+i4r0+3mMZKEGfj26/hOVMLkVBrfk3XSuRydbnYxGqQUGxJpySYmoazfANNieN4pXNc/0+O7hA4bDeUmBOCy8UowJbTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wdi8/FXk; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5101ae8ac40so1706550e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 13:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706219376; x=1706824176; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lT446C1cDJ2MeTjJ8AuDT4OnFUwaKY6MBXv7uZTSL6A=;
        b=wdi8/FXkbKDwsDp9OcoOLqG6zKFl608ZmW1Jirknl8EQlIPMRmFcC987KnWYbzMcWR
         7vMIzhn6b55W1sg8UDQ5f105n55N4vAG/1JFBYUcnJFS9ulYM172PHBLgZGNFax0Z9LN
         j/wLOK4rNhunhisH73fRTjRjiyc45adk7LOfXM/SVSrEa9fTVBDWTMDxXm+77XSSJfQw
         c5L7DE9Cgmq2yFTvjqMV6lTRX8prmWE7+a4CNb+Pqi/2ozItENo/PuB0Yr7Yxs6HsuaG
         Mla76vYXgauV0iBtyDBhQ0t92nNAeY4vIDeLFDMqkqhD8cJmaatbktnr4LdJZZpsA8Q3
         lUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706219376; x=1706824176;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lT446C1cDJ2MeTjJ8AuDT4OnFUwaKY6MBXv7uZTSL6A=;
        b=WYlUwh9w3qmJu/EiLdyNWCMteti8os6J5QsAPWl9n/EtSPkEneLJ3atNnzgvQQc+PI
         r+MLaZ0Kd8qzzT63IHZVQQYkjT4XFR1Ug/yMIAbWoe86xW9v6LkZ29g8/O2dMbzqh/j/
         zfLKdyNEyC2fYBD2ewNl8LcPdVLucIcg2xgztYyKasVPqMdzoAUlRYPQCKKfdJbDWZ8y
         Ztd1LId1U82gnyQZBikYqDBzC6E3fkwOkPGZtY5UZhQrfjDmzSytMVcCo6hCyubeRCoC
         yfF5mnNTCPGgrHDLJX1NgJrVYUAoygb4sYS7vhaasBqWjGlkQfXjf508Woc852yS1ijE
         DnKw==
X-Gm-Message-State: AOJu0YxAHAWKXBG+7KgQ21DNXoxeSuGCEzuqphyL5v+31ACFfXcpEWsK
	24H579zxEFlbZ9p6Tx1Zy3uMkXRHvK3+BH2Z8b7RnYnEFQGHfPd7ILof4+Vv/b4=
X-Google-Smtp-Source: AGHT+IGp0Nb1IIX2TBKIKJrczEPn+M7kqIhQaZRIvBsCa1UBKExOdH9CwlGJ5kpcdDmnx1XyagO8Vg==
X-Received: by 2002:ac2:47e4:0:b0:510:d4a:d367 with SMTP id b4-20020ac247e4000000b005100d4ad367mr248636lfp.2.1706219376108;
        Thu, 25 Jan 2024 13:49:36 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f12-20020a05651232cc00b0050f0dce126bsm2942118lfg.214.2024.01.25.13.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 13:49:35 -0800 (PST)
Message-ID: <96cf7370-b825-4ee9-ae17-8a6d72cb02d4@linaro.org>
Date: Thu, 25 Jan 2024 23:49:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] drm/msm/dpu: add support of new peripheral flush
 mechanism
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org,
 swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
 marijn.suijten@somainline.org, neil.armstrong@linaro.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-13-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-13-quic_parellan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/01/2024 21:38, Paloma Arellano wrote:
> From: Kuogee Hsieh <quic_khsieh@quicinc.com>
> 
> Introduce a peripheral flushing mechanism to decouple peripheral
> metadata flushing from timing engine related flush.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c    |  3 +++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c      | 17 +++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h      | 10 ++++++++++
>   3 files changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index d0f56c5c4cce9..e284bf448bdda 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -437,6 +437,9 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
>   	if (ctl->ops.update_pending_flush_merge_3d && phys_enc->hw_pp->merge_3d)
>   		ctl->ops.update_pending_flush_merge_3d(ctl, phys_enc->hw_pp->merge_3d->idx);
>   
> +	if (ctl->ops.update_pending_flush_periph && phys_enc->hw_intf->cap->type == INTF_DP)
> +		ctl->ops.update_pending_flush_periph(ctl, phys_enc->hw_intf->idx);
> +
>   skip_flush:
>   	DPU_DEBUG_VIDENC(phys_enc,
>   		"update pending flush ctl %d intf %d\n",
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index e76565c3e6a43..bf45afeb616d3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -39,6 +39,7 @@
>   #define   CTL_WB_FLUSH                  0x108
>   #define   CTL_INTF_FLUSH                0x110
>   #define   CTL_CDM_FLUSH                0x114
> +#define   CTL_PERIPH_FLUSH              0x128
>   #define   CTL_INTF_MASTER               0x134
>   #define   CTL_DSPP_n_FLUSH(n)           ((0x13C) + ((n) * 4))
>   
> @@ -49,6 +50,7 @@
>   #define  MERGE_3D_IDX   23
>   #define  DSC_IDX        22
>   #define CDM_IDX         26
> +#define  PERIPH_IDX     30
>   #define  INTF_IDX       31
>   #define WB_IDX          16
>   #define  DSPP_IDX       29  /* From DPU hw rev 7.x.x */
> @@ -151,6 +153,10 @@ static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>   				ctx->pending_dspp_flush_mask[dspp - DSPP_0]);
>   		}
>   
> +	if (ctx->pending_flush_mask & BIT(PERIPH_IDX))
> +		DPU_REG_WRITE(&ctx->hw, CTL_PERIPH_FLUSH,
> +			      ctx->pending_periph_flush_mask);
> +
>   	if (ctx->pending_flush_mask & BIT(DSC_IDX))
>   		DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH,
>   			      ctx->pending_dsc_flush_mask);
> @@ -311,6 +317,13 @@ static void dpu_hw_ctl_update_pending_flush_intf_v1(struct dpu_hw_ctl *ctx,
>   	ctx->pending_flush_mask |= BIT(INTF_IDX);
>   }
>   
> +static void dpu_hw_ctl_update_pending_flush_periph(struct dpu_hw_ctl *ctx,
> +		enum dpu_intf intf)

I assume this is _v1.
Also the argument is misaligned.

> +{
> +	ctx->pending_periph_flush_mask |= BIT(intf - INTF_0);
> +	ctx->pending_flush_mask |= BIT(PERIPH_IDX);
> +}
> +
>   static void dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,
>   		enum dpu_merge_3d merge_3d)
>   {
> @@ -680,6 +693,10 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
>   		ops->reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
>   		ops->update_pending_flush_intf =
>   			dpu_hw_ctl_update_pending_flush_intf_v1;
> +
> +		ops->update_pending_flush_periph =
> +			dpu_hw_ctl_update_pending_flush_periph;
> +
>   		ops->update_pending_flush_merge_3d =
>   			dpu_hw_ctl_update_pending_flush_merge_3d_v1;
>   		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;

What about the pre-active platforms?

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index ff85b5ee0acf8..5d86c560b6d3f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -122,6 +122,15 @@ struct dpu_hw_ctl_ops {
>   	void (*update_pending_flush_intf)(struct dpu_hw_ctl *ctx,
>   		enum dpu_intf blk);
>   
> +	/**
> +	 * OR in the given flushbits to the cached pending_(periph_)flush_mask
> +	 * No effect on hardware
> +	 * @ctx       : ctl path ctx pointer
> +	 * @blk       : interface block index
> +	 */
> +	void (*update_pending_flush_periph)(struct dpu_hw_ctl *ctx,
> +		enum dpu_intf blk);
> +
>   	/**
>   	 * OR in the given flushbits to the cached pending_(merge_3d_)flush_mask
>   	 * No effect on hardware
> @@ -264,6 +273,7 @@ struct dpu_hw_ctl {
>   	u32 pending_flush_mask;
>   	u32 pending_intf_flush_mask;
>   	u32 pending_wb_flush_mask;
> +	u32 pending_periph_flush_mask;
>   	u32 pending_merge_3d_flush_mask;
>   	u32 pending_dspp_flush_mask[DSPP_MAX - DSPP_0];
>   	u32 pending_dsc_flush_mask;

-- 
With best wishes
Dmitry


