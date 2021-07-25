Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF5583D4B57
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jul 2021 06:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbhGYDZk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Jul 2021 23:25:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbhGYDZk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Jul 2021 23:25:40 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17F65C061757
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jul 2021 21:06:10 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id a5-20020a05683012c5b029036edcf8f9a6so6462859otq.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jul 2021 21:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BQy51dmcCPfskpFReMMd+iY0APHtV+mJ8PmnMSgL0Sc=;
        b=VjkzUfEZF33VWY3hAWXdwvjVkalQ4+qGnr5LB41s+9NpLxRjpgZEpGhjxmDN+gVcBc
         KaVhdLR4t+jmd2hyXALG9UpGzkTWuPByPoLCV2WU/JJH93OMX9vzKu9oXshXSgLXxtuU
         nfahrK1XqDJecyJU56OBzeOWfpIbjPgHVTVWORYkftcIYnwTXW4++Xxgi1UtETrHH93F
         h5VWcg5xBCaCfmc+Y6VGcBBM4QIDssA7saZluEzK3xVFrAn8Kab6XuX0X02kO0Mg0bFo
         p9n6qtAZgDf7JFqfqQTu+ASoVxM3mLC/AS1KkvqdqkEVPkES1Np5Jw6xA5fy7C2tBJPp
         dDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BQy51dmcCPfskpFReMMd+iY0APHtV+mJ8PmnMSgL0Sc=;
        b=Q6PR3ADZMM6RJYNkr3N/YvMQZCW/0HR7SBnAa1ZFwNkuFxQLDy2OE5ObLS9AIqLken
         HUvpX0IxgXNS+WJXZgtnvfseC66JVp2X7kDznzz7aAM/WuXhm3Xx9vmKPgD0fpCKXzRx
         sop+Zm39CkadcM1WLY3Unu41NuSB0VdBQXfbp0SlnLYlb6Ruq8uvoqiMK7RAA7RqKgbg
         tyo26VhkemBcUnEmOoiILVA60dJ2QQXP6JjnASJ65Va4VBMkGgR2LO3xtWpTLPqGaN4A
         xzjon7//8q9gqq7YzC//MFRzhpEn3Yhl0EAuGXVmrK3HCb93aenva/oM4mMw4eCZT/8L
         fS7g==
X-Gm-Message-State: AOAM530dIiyFQH+8lq2B0H5yGDA2Cy6Oz5YsEYf2kp1hQMLvXWh5G31r
        a/dgQ3P/umchZB0Psg/0eJEgJA==
X-Google-Smtp-Source: ABdhPJyMs5iTUOBhdlyTJ60z6OLpQf+glf2PtWFLOCqVIzCMRaFxAhsYaxyQEtCEbZoWH7N+lUH1fQ==
X-Received: by 2002:a05:6830:19c2:: with SMTP id p2mr8072669otp.49.1627185969411;
        Sat, 24 Jul 2021 21:06:09 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g66sm6360391oob.27.2021.07.24.21.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 21:06:09 -0700 (PDT)
Date:   Sat, 24 Jul 2021 23:06:06 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 3/7] drm/msm/dpu: support setting up two independent
 DSI connectors
Message-ID: <YPzjLg66TOoBNv3I@yoga>
References: <20210717124016.316020-1-dmitry.baryshkov@linaro.org>
 <20210717124016.316020-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210717124016.316020-4-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 17 Jul 07:40 CDT 2021, Dmitry Baryshkov wrote:

> Move setting up encoders from set_encoder_mode to
> _dpu_kms_initialize_dsi() / _dpu_kms_initialize_displayport(). This
> allows us to support not only "single DSI" and "bonded DSI" but also "two
> independent DSI" configurations. In future this would also help adding
> support for multiple DP connectors.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 102 +++++++++++++-----------
>  1 file changed, 57 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 1d3a4f395e74..3cd2011e18d4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -471,30 +471,68 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>  				    struct dpu_kms *dpu_kms)
>  {
>  	struct drm_encoder *encoder = NULL;
> +	struct msm_display_info info;
>  	int i, rc = 0;
>  
>  	if (!(priv->dsi[0] || priv->dsi[1]))
>  		return rc;
>  
> -	/*TODO: Support two independent DSI connectors */
> -	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI);
> -	if (IS_ERR(encoder)) {
> -		DPU_ERROR("encoder init failed for dsi display\n");
> -		return PTR_ERR(encoder);
> -	}
> -
> -	priv->encoders[priv->num_encoders++] = encoder;
> -
> +	/*
> +	 * We support following confiurations:
> +	 * - Single DSI host (dsi0 or dsi1)
> +	 * - Two independent DSI hosts
> +	 * - Bonded DSI0 and DSI1 hosts
> +	 *
> +	 * TODO: Support swapping DSI0 and DSI1 in the bonded setup.
> +	 */
>  	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
> +		int other = (i + 1) % 2;
> +
>  		if (!priv->dsi[i])
>  			continue;
>  
> +		if (msm_dsi_is_bonded_dsi(priv->dsi[i]) &&
> +		    !msm_dsi_is_master_dsi(priv->dsi[i]))
> +			continue;
> +
> +		encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI);
> +		if (IS_ERR(encoder)) {
> +			DPU_ERROR("encoder init failed for dsi display\n");
> +			return PTR_ERR(encoder);
> +		}
> +
> +		priv->encoders[priv->num_encoders++] = encoder;
> +
> +		memset(&info, 0, sizeof(info));
> +		info.intf_type = encoder->encoder_type;
> +
>  		rc = msm_dsi_modeset_init(priv->dsi[i], dev, encoder);
>  		if (rc) {
>  			DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
>  				i, rc);
>  			break;
>  		}
> +
> +		info.h_tile_instance[info.num_of_h_tiles++] = i;
> +		info.capabilities = msm_dsi_is_cmd_mode(priv->dsi[i]) ?
> +			MSM_DISPLAY_CAP_CMD_MODE :
> +			MSM_DISPLAY_CAP_VID_MODE;
> +
> +		if (msm_dsi_is_bonded_dsi(priv->dsi[i]) && priv->dsi[other]) {
> +			rc = msm_dsi_modeset_init(priv->dsi[other], dev, encoder);
> +			if (rc) {
> +				DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
> +					other, rc);
> +				break;
> +			}
> +
> +			info.h_tile_instance[info.num_of_h_tiles++] = other;
> +		}
> +
> +		rc = dpu_encoder_setup(dev, encoder, &info);
> +		if (rc)
> +			DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
> +				  encoder->base.id, rc);
>  	}
>  
>  	return rc;
> @@ -505,6 +543,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  					    struct dpu_kms *dpu_kms)
>  {
>  	struct drm_encoder *encoder = NULL;
> +	struct msm_display_info info;
>  	int rc = 0;
>  
>  	if (!priv->dp)
> @@ -516,6 +555,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  		return PTR_ERR(encoder);
>  	}
>  
> +	memset(&info, 0, sizeof(info));
>  	rc = msm_dp_modeset_init(priv->dp, dev, encoder);
>  	if (rc) {
>  		DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
> @@ -524,6 +564,14 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  	}
>  
>  	priv->encoders[priv->num_encoders++] = encoder;
> +
> +	info.num_of_h_tiles = 1;
> +	info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
> +	info.intf_type = encoder->encoder_type;
> +	rc = dpu_encoder_setup(dev, encoder, &info);
> +	if (rc)
> +		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
> +			  encoder->base.id, rc);
>  	return rc;
>  }
>  
> @@ -726,41 +774,6 @@ static void dpu_kms_destroy(struct msm_kms *kms)
>  	msm_kms_destroy(&dpu_kms->base);
>  }
>  
> -static void _dpu_kms_set_encoder_mode(struct msm_kms *kms,
> -				 struct drm_encoder *encoder,
> -				 bool cmd_mode)
> -{
> -	struct msm_display_info info;
> -	struct msm_drm_private *priv = encoder->dev->dev_private;
> -	int i, rc = 0;
> -
> -	memset(&info, 0, sizeof(info));
> -
> -	info.intf_type = encoder->encoder_type;
> -	info.capabilities = cmd_mode ? MSM_DISPLAY_CAP_CMD_MODE :
> -			MSM_DISPLAY_CAP_VID_MODE;
> -
> -	switch (info.intf_type) {
> -	case DRM_MODE_ENCODER_DSI:
> -		/* TODO: No support for DSI swap */
> -		for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
> -			if (priv->dsi[i]) {
> -				info.h_tile_instance[info.num_of_h_tiles] = i;
> -				info.num_of_h_tiles++;
> -			}
> -		}
> -		break;
> -	case DRM_MODE_ENCODER_TMDS:
> -		info.num_of_h_tiles = 1;
> -		break;
> -	}
> -
> -	rc = dpu_encoder_setup(encoder->dev, encoder, &info);
> -	if (rc)
> -		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
> -			encoder->base.id, rc);
> -}
> -
>  static irqreturn_t dpu_irq(struct msm_kms *kms)
>  {
>  	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> @@ -863,7 +876,6 @@ static const struct msm_kms_funcs kms_funcs = {
>  	.get_format      = dpu_get_msm_format,
>  	.round_pixclk    = dpu_kms_round_pixclk,
>  	.destroy         = dpu_kms_destroy,
> -	.set_encoder_mode = _dpu_kms_set_encoder_mode,
>  	.snapshot        = dpu_kms_mdp_snapshot,
>  #ifdef CONFIG_DEBUG_FS
>  	.debugfs_init    = dpu_kms_debugfs_init,
> -- 
> 2.30.2
> 
