Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 148A7394106
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 May 2021 12:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236380AbhE1KiE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 May 2021 06:38:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235361AbhE1KiE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 May 2021 06:38:04 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9406C06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 May 2021 03:36:27 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id w7so4627132lji.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 May 2021 03:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RR9aCa9Fk1AeEQeB1a7U6H9kC0xMAO6dnDCAHEDi0SI=;
        b=yiMz6B5SYuvBzuFIME7sP9Bn3VZo6YFTVXBW3XSARrbiEm4DrxokDFdhzmi5vN1qOy
         KyyNTVuiLDyvbxeNu2fm7Q6usGpuDBxa1L+mlevW0FH6wkl5dZhoGRDZyKqZG/6hYJnu
         VQxfieqB8G8hXaLWKW1lWrVZ9EFkulgjvjECS1o7jSi2RCiDPizIws+xTP4Epx9hu1DH
         03c+l3fnGQqs8ONy5FwymjXM72hACeZvzPvJw+Cuoo5uEbiPpVDE6J4i4KeCAfK6BRDy
         sbJsMkyWOwL19AAt6+NDCDiAwSAJ4pp3DIXnge7rtjO8nlGsZ5hiWI4Hg5Q+IZ+oTQGZ
         OQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RR9aCa9Fk1AeEQeB1a7U6H9kC0xMAO6dnDCAHEDi0SI=;
        b=P6W1DM6kLG4KdMCTVztrb86KS2ZJmIhu//YXIuNJukhxyL/Z0gzKKsdZFuSrSZ37hm
         ZVO2WKJwGaElX0cTgN3H1iwspX9R6TUYgp8YsWRJnNtLbJhvsmpnyfuSjHvyx02PoVbZ
         mgcwZkMYUwo4/CDYS/UMR9IKUebiAr1wm7uHI6soRH76MRKG5O/YwTJ/qv7jr/q8Os+C
         0yEiwkBkv9/meuJgnatIutJ3R+WOECdH/N1TaDNwRdGOZHWz0jQmAedcjAV6RYljOqY2
         18g9tMCaxlfBa6mP4vic1yixJKnzzGHaTCIB6usJ9ppL+d8rko9PlwTp70CaIxzruxSz
         NX8g==
X-Gm-Message-State: AOAM530lQngfSN7XlYtFpBE8WLpWcwaZ1D6MmDKSXwR0FJurTTzLa8cS
        F01xWQZkOpaNox9QlEio48VRhw==
X-Google-Smtp-Source: ABdhPJzBHl9y7Py40EKPhM3j6vdNArq5eiVI3abzPIby43QpcRZeOCJsS5VukeIzJneEkb5ITPC8Ig==
X-Received: by 2002:a05:651c:1a7:: with SMTP id c7mr5917480ljn.77.1622198186160;
        Fri, 28 May 2021 03:36:26 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v138sm440261lfa.224.2021.05.28.03.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 May 2021 03:36:25 -0700 (PDT)
Subject: Re: [RFC PATCH 09/13] drm/msm/disp/dpu1: Don't use DSC with mode_3d
To:     Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <20210521124946.3617862-13-vkoul@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <32463a8c-3baa-cc88-6e55-f65bc2d92608@linaro.org>
Date:   Fri, 28 May 2021 13:36:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521124946.3617862-13-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/05/2021 15:49, Vinod Koul wrote:
> We cannot enable mode_3d when we are using the DSC. So pass
> configuration to detect DSC is enabled and not enable mode_3d
> when we are using DSC
> 
> We add a helper dpu_encoder_helper_get_dsc_mode() to detect dsc
> enabled and pass this to .setup_intf_cfg()
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     | 11 +++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c           |  5 +++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h           |  2 ++
>   4 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index ecbc4be98980..d43b804528eb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -336,6 +336,17 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
>   	return BLEND_3D_NONE;
>   }
>   
> +static inline bool dpu_encoder_helper_get_dsc_mode(struct dpu_encoder_phys *phys_enc)
> +{
> +	struct drm_encoder *drm_enc = phys_enc->parent;
> +	struct msm_drm_private *priv = drm_enc->dev->dev_private;
> +
> +	if (priv->dsc)
> +		return true;
> +
> +	return false;
> +}
> +
>   /**
>    * dpu_encoder_helper_split_config - split display configuration helper function
>    *	This helper function may be used by physical encoders to configure
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index b2be39b9144e..5fe87881c30c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -69,6 +69,8 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>   	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_CMD;
>   	intf_cfg.stream_sel = cmd_enc->stream_sel;
>   	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
> +	intf_cfg.dsc = dpu_encoder_helper_get_dsc_mode(phys_enc);
> +
>   	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
>   }
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index aeea6add61ee..f059416311ee 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -121,7 +121,7 @@ static u32 dpu_hw_ctl_get_pending_flush(struct dpu_hw_ctl *ctx)
>   	return ctx->pending_flush_mask;
>   }
>   
> -static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
> +static void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>   {
>   	DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH, BIT(0) | BIT(1) | BIT(2) | BIT(3));
>   
> @@ -522,7 +522,8 @@ static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
>   
>   	intf_cfg |= (cfg->intf & 0xF) << 4;
>   
> -	if (cfg->mode_3d) {
> +	/* In DSC we can't set merge, so check for dsc too */
> +	if (cfg->mode_3d && !cfg->dsc) {

I think we should catch this earlier (in atomic_check?), so that we 
won't enable modes that would require merge_3d with DSC enabled (until 
we support DSC merge?)

>   		intf_cfg |= BIT(19);
>   		intf_cfg |= (cfg->mode_3d - 0x1) << 20;
>   	}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index 806c171e5df2..347a653c1e01 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -39,6 +39,7 @@ struct dpu_hw_stage_cfg {
>    * @mode_3d:               3d mux configuration
>    * @merge_3d:              3d merge block used
>    * @intf_mode_sel:         Interface mode, cmd / vid
> + * @dsc:                   DSC is enabled
>    * @stream_sel:            Stream selection for multi-stream interfaces
>    */
>   struct dpu_hw_intf_cfg {
> @@ -46,6 +47,7 @@ struct dpu_hw_intf_cfg {
>   	enum dpu_3d_blend_mode mode_3d;
>   	enum dpu_merge_3d merge_3d;
>   	enum dpu_ctl_mode_sel intf_mode_sel;
> +	bool dsc;
>   	int stream_sel;
>   };
>   
> 


-- 
With best wishes
Dmitry
