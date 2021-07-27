Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 675763D7DDD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 20:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbhG0Smi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 14:42:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbhG0Smh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 14:42:37 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A075C061757
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 11:42:37 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id x7so17160764ljn.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 11:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+7UEfD2Imkl3ZnkOmnry5ON4ruHu09FP4tYeWeop6j8=;
        b=Dw1xy/B95cB2tQ8nfE4IH8NuStpyecxxK3HsLcmBe5tJe37IsnKZtXreBvEpEIhIFc
         NPwjIj2Q2rzg+iqbTrT1xv4aJZ/rJN1N6tMfA+MUjrFaBwIVYW2MtgDQ44cvIScabO9F
         R0y3s3cIcrxOOOsgQ/3jeRbo1cLqmh+cy736gV+SytYpwepWwqiJvPQVLh0d/QwOcDWr
         tuqLJsI22MlyNc7wnpfDMwJtqbhdXG+bSa88GwIJZQ9a495/ylpicRxlms7Gacg0hvnP
         nGXU3gBlapyO44/mQYuYk97qm+qoWDywGdzwwGthJTCZ7v3sUVXkTeeN0d9GsSN8woSq
         Bj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+7UEfD2Imkl3ZnkOmnry5ON4ruHu09FP4tYeWeop6j8=;
        b=l9aXE3GJPMJPYT6AV6D0zg1T8nlxqLe/6hF/JSUyy5PG3Kv84fpM9c0Yb2RtVSeeie
         VIsGpZy6DpL6cM/kRRJkfVSwoCdijkddRwTHJ9UXTl0OPVfP1ZPlNDZ+8R7B4gIldCX6
         Nz6BsPr/tIyPUVJVPSZxVwKD3sMR9YjLZNh7t03Sctb4Le42NrRUOqcT5KAnCYvUqmcZ
         9xEsoFtufQvhqikwe7Ca/wTiaP8XLfYo87tMtqPY+IIFoKqhR/8uK8vchzEVY2gh6iMT
         VicraJZiIDUA0EIyyHFiXkhSnY1Lfh9g7cKaiDy4ZS8AUx3syiamTHGfADaDigAYREBs
         Xlow==
X-Gm-Message-State: AOAM530c+XlLTyHITm+oKDo73DhLzC5tYjwgNykOjn2Njjb7Rzzo6uTa
        0WdL0m3/czX6eGyfDDD4C6Y2uA==
X-Google-Smtp-Source: ABdhPJw4h0sF7m8BSZ4MlkG9L54CcA+FgAX+Io3OlMQJ4N0NrYEy9Vu2yYSi0jwBIhxMPRXFaamJ0g==
X-Received: by 2002:a2e:85d8:: with SMTP id h24mr16831635ljj.365.1627411355491;
        Tue, 27 Jul 2021 11:42:35 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m23sm28970lfc.116.2021.07.27.11.42.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jul 2021 11:42:35 -0700 (PDT)
Subject: Re: [PATCH 2/5] drm/msm/dp: Modify prototype of encoder based API
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
 <20210725042436.3967173-3-bjorn.andersson@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <97ac00f8-eb25-9142-3bdc-904aad269b6e@linaro.org>
Date:   Tue, 27 Jul 2021 21:42:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210725042436.3967173-3-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/07/2021 07:24, Bjorn Andersson wrote:
> Functions in the DisplayPort code that relates to individual instances
> (encoders) are passed both the struct msm_dp and the struct drm_encoder. But
> in a situation where multiple DP instances would exist this means that
> the caller need to resolve which struct msm_dp relates to the struct
> drm_encoder at hand.
> 
> The information for doing this lookup is available inside the DP driver,
> so update the API to take the struct msm_drm_private and the struct
> drm_encoder and have the DP code figure out which struct msm_dp the
> operation relates to.

Initially I thought to propose moving encoder->dp lookup into dpu code 
by adding msm_dp_display_get_encoder() function. However as I was 
writing that, I remembered that at some point I had to refactor my own 
patchset in the way to get rid of calling msm_FOO_get_encoder().

I'd propose simpler solution. In dpu_encoder_setup() you have the DP 
index and the encoder. So you can store valid msm_dp pointer in the 
dpu_encoder_virt and remove all the lookups. Then you can replace all 
priv->dp with bare dpu_enc->dp accesses. Will this work for you?

> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 17 +++++----
>   drivers/gpu/drm/msm/dp/dp_display.c         | 38 +++++++++++++++++----
>   drivers/gpu/drm/msm/msm_drv.h               | 31 +++++++++--------
>   3 files changed, 56 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1c04b7cce43e..0d64ef0819af 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1002,8 +1002,8 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>   
>   	trace_dpu_enc_mode_set(DRMID(drm_enc));
>   
> -	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp)
> -		msm_dp_display_mode_set(priv->dp, drm_enc, mode, adj_mode);
> +	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS)
> +		msm_dp_display_mode_set(priv, drm_enc, mode, adj_mode);
>   
>   	list_for_each_entry(conn_iter, connector_list, head)
>   		if (conn_iter->encoder == drm_enc)
> @@ -1184,9 +1184,8 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
>   
>   	_dpu_encoder_virt_enable_helper(drm_enc);
>   
> -	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp) {
> -		ret = msm_dp_display_enable(priv->dp,
> -						drm_enc);
> +	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
> +		ret = msm_dp_display_enable(priv, drm_enc);
>   		if (ret) {
>   			DPU_ERROR_ENC(dpu_enc, "dp display enable failed: %d\n",
>   				ret);
> @@ -1226,8 +1225,8 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
>   	/* wait for idle */
>   	dpu_encoder_wait_for_event(drm_enc, MSM_ENC_TX_COMPLETE);
>   
> -	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp) {
> -		if (msm_dp_display_pre_disable(priv->dp, drm_enc))
> +	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
> +		if (msm_dp_display_pre_disable(priv, drm_enc))
>   			DPU_ERROR_ENC(dpu_enc, "dp display push idle failed\n");
>   	}
>   
> @@ -1255,8 +1254,8 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
>   
>   	DPU_DEBUG_ENC(dpu_enc, "encoder disabled\n");
>   
> -	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp) {
> -		if (msm_dp_display_disable(priv->dp, drm_enc))
> +	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
> +		if (msm_dp_display_disable(priv, drm_enc))
>   			DPU_ERROR_ENC(dpu_enc, "dp display disable failed\n");
>   	}
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 8696b36d30e4..59ffd6c8f41f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1432,12 +1432,25 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>   	return 0;
>   }
>   
> -int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
> +static struct msm_dp *msm_dp_from_drm_encoder(struct msm_drm_private *priv,
> +					      struct drm_encoder *encoder)
> +{
> +	if (priv->dp && priv->dp->encoder == encoder)
> +		return priv->dp;
> +
> +	return NULL;
> +}
> +
> +int msm_dp_display_enable(struct msm_drm_private *priv, struct drm_encoder *encoder)
>   {
>   	int rc = 0;
>   	struct dp_display_private *dp_display;
> +	struct msm_dp *dp = msm_dp_from_drm_encoder(priv, encoder);
>   	u32 state;
>   
> +	if (!dp)
> +		return -EINVAL;
> +
>   	dp_display = container_of(dp, struct dp_display_private, dp_display);
>   	if (!dp_display->dp_mode.drm_mode.clock) {
>   		DRM_ERROR("invalid params\n");
> @@ -1489,9 +1502,13 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
>   	return rc;
>   }
>   
> -int msm_dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder)
> +int msm_dp_display_pre_disable(struct msm_drm_private *priv, struct drm_encoder *encoder)
>   {
>   	struct dp_display_private *dp_display;
> +	struct msm_dp *dp = msm_dp_from_drm_encoder(priv, encoder);
> +
> +	if (!dp)
> +		return 0;
>   
>   	dp_display = container_of(dp, struct dp_display_private, dp_display);
>   
> @@ -1500,11 +1517,15 @@ int msm_dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder)
>   	return 0;
>   }
>   
> -int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
> +int msm_dp_display_disable(struct msm_drm_private *priv, struct drm_encoder *encoder)
>   {
>   	int rc = 0;
>   	u32 state;
>   	struct dp_display_private *dp_display;
> +	struct msm_dp *dp = msm_dp_from_drm_encoder(priv, encoder);
> +
> +	if (!dp)
> +		return 0;
>   
>   	dp_display = container_of(dp, struct dp_display_private, dp_display);
>   
> @@ -1531,11 +1552,16 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
>   	return rc;
>   }
>   
> -void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
> -				struct drm_display_mode *mode,
> -				struct drm_display_mode *adjusted_mode)
> +void msm_dp_display_mode_set(struct msm_drm_private *priv,
> +			     struct drm_encoder *encoder,
> +			     struct drm_display_mode *mode,
> +			     struct drm_display_mode *adjusted_mode)
>   {
>   	struct dp_display_private *dp_display;
> +	struct msm_dp *dp = msm_dp_from_drm_encoder(priv, encoder);
> +
> +	if (!dp)
> +		return;
>   
>   	dp_display = container_of(dp, struct dp_display_private, dp_display);
>   
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 9bfd37855969..e9232032b266 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -388,12 +388,13 @@ int __init msm_dp_register(void);
>   void __exit msm_dp_unregister(void);
>   int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>   			 struct drm_encoder *encoder);
> -int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder);
> -int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder);
> -int msm_dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder);
> -void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
> -				struct drm_display_mode *mode,
> -				struct drm_display_mode *adjusted_mode);
> +int msm_dp_display_enable(struct msm_drm_private *priv, struct drm_encoder *encoder);
> +int msm_dp_display_disable(struct msm_drm_private *priv, struct drm_encoder *encoder);
> +int msm_dp_display_pre_disable(struct msm_drm_private *priv, struct drm_encoder *encoder);
> +void msm_dp_display_mode_set(struct msm_drm_private *priv,
> +			     struct drm_encoder *encoder,
> +			     struct drm_display_mode *mode,
> +			     struct drm_display_mode *adjusted_mode);
>   void msm_dp_irq_postinstall(struct msm_dp *dp_display);
>   void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
>   
> @@ -413,25 +414,25 @@ static inline int msm_dp_modeset_init(struct msm_dp *dp_display,
>   {
>   	return -EINVAL;
>   }
> -static inline int msm_dp_display_enable(struct msm_dp *dp,
> +static inline int msm_dp_display_enable(struct msm_drm_private *priv,
>   					struct drm_encoder *encoder)
>   {
>   	return -EINVAL;
>   }
> -static inline int msm_dp_display_disable(struct msm_dp *dp,
> -					struct drm_encoder *encoder)
> +static inline int msm_dp_display_disable(struct msm_drm_private *priv,
> +					 struct drm_encoder *encoder)
>   {
>   	return -EINVAL;
>   }
> -static inline int msm_dp_display_pre_disable(struct msm_dp *dp,
> -					struct drm_encoder *encoder)
> +static inline int msm_dp_display_pre_disable(struct msm_drm_private *priv,
> +					     struct drm_encoder *encoder)
>   {
>   	return -EINVAL;
>   }
> -static inline void msm_dp_display_mode_set(struct msm_dp *dp,
> -				struct drm_encoder *encoder,
> -				struct drm_display_mode *mode,
> -				struct drm_display_mode *adjusted_mode)
> +static inline void msm_dp_display_mode_set(struct msm_drm_private *priv,
> +					   struct drm_encoder *encoder,
> +					   struct drm_display_mode *mode,
> +					   struct drm_display_mode *adjusted_mode)
>   {
>   }
>   
> 


-- 
With best wishes
Dmitry
