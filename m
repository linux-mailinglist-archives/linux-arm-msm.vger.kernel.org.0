Return-Path: <linux-arm-msm+bounces-8344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6403183CF07
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 22:58:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B446B285CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 21:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 003D52E3F0;
	Thu, 25 Jan 2024 21:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GchHCO/t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D0E13B795
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 21:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706219870; cv=none; b=NxYx+lZkGnmRJO2yb8tawlcat1YX4w3blbtAdOZg9MrZaquKjpKK42n7LYDXPhTMV9qysfdEhdqrhlu9ui9Xo9MupgFu4/EoI1FXcHfG9LHUFNkA94i56ZZBMC6fgTzARxIXWkpUsW8r/tgr68ilL+sxfizMjS7WnCGMIhf//oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706219870; c=relaxed/simple;
	bh=5/XdL00U7n82QoP0/csI7uiGtmOthcHwmecNi6IQHws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fS4ewoeWlp7Yzpd/AbHBe03y+RnHYqkFQtqESpxFsCavNmLlbnPRzEIv68aaRg826MYftfFmIGyrZc9khDPv5uNIyHkLnS6QsbQYFSAhurEAnPFRHE8voxOjFPaafiS7d0dWxN44eWHmiVGJsFXabdT5vGFXk6RZtyQtF885Bf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GchHCO/t; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5101ae8ac40so1715365e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 13:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706219867; x=1706824667; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rq2pAI+tbauC2tq1qR9eAE8MctU9eRWoNEVGBqRP+A8=;
        b=GchHCO/t7/PB19Wamvp54SsPPR8sFQEPBXMXJUv/VaA19YaguVr4tqogFXF2aqGrHV
         9L1NoCVW4yRpFPicKifrct1chhenexiTvDd6aWbvClrgTSnOVX56wS/iGV8/w0+hTwnu
         2nLM0RgfCiEM0PbzhAb4jsVT6gBoPjrtbyJvOmEqnHvLMYbgAnU2NnXfAnMC5hgNHcef
         IAGOS18lCJULkPTPZkAfAmuE8l+yvEZ3o/LsCgvBOuWtQFsl+7DxuawCB0FS7CYVko7t
         /yuUEAW1gRGS3yoKVwLZcYA9erRwNLvWlhTPECz/W5amTk6GniRxdqiK7j68JV9k7TRD
         k7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706219867; x=1706824667;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rq2pAI+tbauC2tq1qR9eAE8MctU9eRWoNEVGBqRP+A8=;
        b=QXPDi+Fp/xe6EJaaj9YJGkRSuuaQ2Qas5iC0LfJSAH50Ljh7e625dmr9htcW4Ex504
         6xNun6w9VyRRsBMN87CzVwbNvFt3fIdk3NBpYsTsNDcUhKNeHYtgOOIJlZThikLBe9S5
         Fx4JtLagLnZzKC4oe4qX1431pRoEYoNclhYBxb9+aveY8OTcFQ2iVk2R8RegMQZ8DqVR
         naglxP3f1G+IUmbSJbZujy5zy7pVkny7qMqSVjK1144z6fIcrmy14rGD1qEGLLMi2PIt
         rovV4iw9wCyHvLzeBdEUGvCjOZN7nJaW7qt3Vm5X07uQPTtd7dsIvQ8FEO8SUGOYLBt8
         +6OQ==
X-Gm-Message-State: AOJu0YyH/BpddwsrCMgvES+FYfLR5zJxBvc1mZdkkzfv5gmgomYg7eeK
	p55yg8D5joVUfDDwp6wzDzLsQSejNKfXn2i922EhfyOU35ZrV4pK8kfTts6/fds=
X-Google-Smtp-Source: AGHT+IF3RxJcRdiVP1eeF9msbD1w8SH9L84rgiMIph+8rFgANY7DG8EaSOc2ak1oqr79zOXTdXLMpQ==
X-Received: by 2002:ac2:5df5:0:b0:510:8cd:231b with SMTP id z21-20020ac25df5000000b0051008cd231bmr230098lfq.21.1706219866668;
        Thu, 25 Jan 2024 13:57:46 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x18-20020a056512047200b005101b72b1ffsm302483lfd.117.2024.01.25.13.57.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 13:57:46 -0800 (PST)
Message-ID: <52674357-2135-4784-a371-e7809b632c19@linaro.org>
Date: Thu, 25 Jan 2024 23:57:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/17] drm/msm/dpu: modify encoder programming for CDM
 over DP
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
 quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org,
 neil.armstrong@linaro.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-15-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-15-quic_parellan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/01/2024 21:38, Paloma Arellano wrote:
> Adjust the encoder format programming in the case of video mode for DP
> to accommodate CDM related changes.
> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 16 +++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  8 +++++
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 35 ++++++++++++++++---
>   drivers/gpu/drm/msm/dp/dp_display.c           | 12 +++++++
>   drivers/gpu/drm/msm/msm_drv.h                 |  9 ++++-
>   5 files changed, 75 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index b0896814c1562..99ec53446ad21 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -222,6 +222,22 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
>   	15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
>   };
>   
> +u32 dpu_encoder_get_drm_fmt(const struct drm_encoder *drm_enc, const struct drm_display_mode *mode)
> +{
> +	const struct dpu_encoder_virt *dpu_enc;
> +	const struct msm_display_info *disp_info;
> +	struct msm_drm_private *priv;
> +
> +	dpu_enc = to_dpu_encoder_virt(drm_enc);
> +	disp_info = &dpu_enc->disp_info;
> +	priv = drm_enc->dev->dev_private;
> +
> +	if (disp_info->intf_type == INTF_DP &&
> +	    msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], mode))

This should not require interacting with DP. If we got here, we must be 
sure that 4:2:0 is supported and can be configured.

> +		return DRM_FORMAT_YUV420;
> +
> +	return DRM_FORMAT_RGB888;
> +}
>   
>   bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
>   {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 7b4afa71f1f96..62255d0aa4487 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -162,6 +162,14 @@ int dpu_encoder_get_vsync_count(struct drm_encoder *drm_enc);
>    */
>   bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc);
>   
> +/**
> + * dpu_encoder_get_drm_fmt - return DRM fourcc format
> + * @drm_enc:    Pointer to previously created drm encoder structure
> + * @mode:	Corresponding drm_display_mode for dpu encoder
> + */
> +u32 dpu_encoder_get_drm_fmt(const struct drm_encoder *drm_enc,
> +			    const struct drm_display_mode *mode);
> +
>   /**
>    * dpu_encoder_get_crc_values_cnt - get number of physical encoders contained
>    *	in virtual encoder that can collect CRC values
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index e284bf448bdda..a1dde0ff35dc8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -234,6 +234,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>   {
>   	struct drm_display_mode mode;
>   	struct dpu_hw_intf_timing_params timing_params = { 0 };
> +	struct dpu_hw_cdm *hw_cdm;
>   	const struct dpu_format *fmt = NULL;
>   	u32 fmt_fourcc = DRM_FORMAT_RGB888;
>   	unsigned long lock_flags;
> @@ -254,17 +255,26 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>   	DPU_DEBUG_VIDENC(phys_enc, "enabling mode:\n");
>   	drm_mode_debug_printmodeline(&mode);
>   
> -	if (phys_enc->split_role != ENC_ROLE_SOLO) {
> +	hw_cdm = phys_enc->hw_cdm;
> +	if (hw_cdm) {
> +		intf_cfg.cdm = hw_cdm->idx;
> +		fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc->parent, &mode);
> +	}
> +
> +	if (phys_enc->split_role != ENC_ROLE_SOLO ||
> +	    dpu_encoder_get_drm_fmt(phys_enc->parent, &mode) == DRM_FORMAT_YUV420) {
>   		mode.hdisplay >>= 1;
>   		mode.htotal >>= 1;
>   		mode.hsync_start >>= 1;
>   		mode.hsync_end >>= 1;
> +		mode.hskew >>= 1;

Separate patch.

>   
>   		DPU_DEBUG_VIDENC(phys_enc,
> -			"split_role %d, halve horizontal %d %d %d %d\n",
> +			"split_role %d, halve horizontal %d %d %d %d %d\n",
>   			phys_enc->split_role,
>   			mode.hdisplay, mode.htotal,
> -			mode.hsync_start, mode.hsync_end);
> +			mode.hsync_start, mode.hsync_end,
> +			mode.hskew);
>   	}
>   
>   	drm_mode_to_intf_timing_params(phys_enc, &mode, &timing_params);
> @@ -412,8 +422,15 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
>   static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
>   {
>   	struct dpu_hw_ctl *ctl;
> +	struct dpu_hw_cdm *hw_cdm;
> +	const struct dpu_format *fmt = NULL;
> +	u32 fmt_fourcc = DRM_FORMAT_RGB888;
>   
>   	ctl = phys_enc->hw_ctl;
> +	hw_cdm = phys_enc->hw_cdm;
> +	if (hw_cdm)
> +		fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc->parent, &phys_enc->cached_mode);
> +	fmt = dpu_get_dpu_format(fmt_fourcc);
>   
>   	DPU_DEBUG_VIDENC(phys_enc, "\n");
>   
> @@ -422,6 +439,8 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
>   
>   	dpu_encoder_helper_split_config(phys_enc, phys_enc->hw_intf->idx);
>   
> +	dpu_encoder_helper_phys_setup_cdm(phys_enc, fmt, CDM_CDWN_OUTPUT_HDMI);

If there is no CDM, why do we need to call this?

> +
>   	dpu_encoder_phys_vid_setup_timing_engine(phys_enc);
>   
>   	/*
> @@ -437,7 +456,15 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
>   	if (ctl->ops.update_pending_flush_merge_3d && phys_enc->hw_pp->merge_3d)
>   		ctl->ops.update_pending_flush_merge_3d(ctl, phys_enc->hw_pp->merge_3d->idx);
>   
> -	if (ctl->ops.update_pending_flush_periph && phys_enc->hw_intf->cap->type == INTF_DP)
> +	if (ctl->ops.update_pending_flush_cdm && phys_enc->hw_cdm)
> +		ctl->ops.update_pending_flush_cdm(ctl, hw_cdm->idx);
> +
> +	/*
> +	 * Peripheral flush must be updated whenever flushing SDP packets is needed.
> +	 * SDP packets are required for any YUV format (YUV420, YUV422, YUV444).
> +	 */
> +	if (ctl->ops.update_pending_flush_periph && phys_enc->hw_intf->cap->type == INTF_DP &&
> +	    phys_enc->hw_cdm)
>   		ctl->ops.update_pending_flush_periph(ctl, phys_enc->hw_intf->idx);

Should there be a flush if we are switching from YUV 420 to RGB mode?

Also, I'd say, we should move update_pending_flush_periph invocation to 
this patch.

>   
>   skip_flush:
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 6d764f5b08727..4329435518351 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1399,6 +1399,18 @@ void __exit msm_dp_unregister(void)
>   	platform_driver_unregister(&dp_display_driver);
>   }
>   
> +bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
> +			       const struct drm_display_mode *mode)
> +{
> +	struct dp_display_private *dp;
> +	const struct drm_display_info *info;
> +
> +	dp = container_of(dp_display, struct dp_display_private, dp_display);
> +	info = &dp_display->connector->display_info;
> +
> +	return dp_panel_vsc_sdp_supported(dp->panel) && drm_mode_is_420_only(info, mode);

YUV 420 modes should be filtered out in mode_valid if VSC SDP is not 
supported.

> +}
> +
>   bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
>   {
>   	struct dp_display_private *dp;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 16a7cbc0b7dd8..b9581bd934e9e 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -387,7 +387,8 @@ void __exit msm_dp_unregister(void);
>   int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>   			 struct drm_encoder *encoder);
>   void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
> -
> +bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
> +			       const struct drm_display_mode *mode);
>   bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
>   
>   #else
> @@ -409,6 +410,12 @@ static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm
>   {
>   }
>   
> +static inline bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
> +					     const struct drm_display_mode *mode)
> +{
> +	return false;
> +}
> +
>   static inline bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
>   {
>   	return false;

-- 
With best wishes
Dmitry


