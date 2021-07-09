Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A46703C2B2B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 00:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbhGIWLt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 18:11:49 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:35635 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229542AbhGIWLt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 18:11:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625868545; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=o/jFjWugq+Y3q5jHP+QclhXd+7EAvqWj0DwxtPriIE0=;
 b=s4yx54e2SEZTru2Mm0AAeM2DrETR9+p4y0Z+VnJO0425kuUzRrwg8Js0zHycrHfLNnNPInnI
 YpxQv4eS+g8VN8MANnz5oq98Nv/vz3qhd2Upt/pAkSVAMjcRdb2mURUg3Bw+9JY9Br82Aj/j
 PFm+EmmT24Q+U28IKxtSJTQbAEc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60e8c90001dd9a9431e7ac6e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Jul 2021 22:09:04
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0F4BFC4323A; Fri,  9 Jul 2021 22:09:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1D77CC433F1;
        Fri,  9 Jul 2021 22:09:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 09 Jul 2021 15:09:02 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH v1 3/7] drm/msm/dpu: support setting up two
 independent DSI connectors
In-Reply-To: <20210708122833.363451-4-dmitry.baryshkov@linaro.org>
References: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
 <20210708122833.363451-4-dmitry.baryshkov@linaro.org>
Message-ID: <72d95728559ef617a3dc29621cc5a2b5@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-08 05:28, Dmitry Baryshkov wrote:
> Move setting up encoders from set_encoder_mode to
> _dpu_kms_initialize_dsi() / _dpu_kms_initialize_displayport(). This
> allows us to support not only "single DSI" and "bonded DSI" but also 
> "two
> independent DSI" configurations. In future this would also help adding
> support for multiple DP connectors.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 102 +++++++++++++-----------
>  1 file changed, 57 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 1d3a4f395e74..8459da36174e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -471,30 +471,68 @@ static int _dpu_kms_initialize_dsi(struct 
> drm_device *dev,
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
> +	 *   TODO: Support swapping DSI0 and DSI1 in the bonded setup.
> +	 */
>  	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
>  		if (!priv->dsi[i])
>  			continue;
> 
> +		if (!encoder) {
> +			encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI);
> +			if (IS_ERR(encoder)) {
> +				DPU_ERROR("encoder init failed for dsi display\n");
> +				return PTR_ERR(encoder);
> +			}
> +
> +			priv->encoders[priv->num_encoders++] = encoder;
> +
> +			memset(&info, 0, sizeof(info));
> +			info.intf_type = encoder->encoder_type;
> +			info.capabilities = msm_dsi_is_cmd_mode(priv->dsi[i]) ?
> +				MSM_DISPLAY_CAP_CMD_MODE :
> +				MSM_DISPLAY_CAP_VID_MODE;
> +		}
> +
>  		rc = msm_dsi_modeset_init(priv->dsi[i], dev, encoder);
>  		if (rc) {
>  			DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
>  				i, rc);
>  			break;
>  		}
> +
> +		info.h_tile_instance[info.num_of_h_tiles++] = i;
> +
> +		/* Register non-bonded encoder here. If the encoder is bonded,
> +		 * it will be registered later, when both DSI hosts are
> +		 * initialized.
> +		 */
> +		if (!msm_dsi_is_bonded_dsi(priv->dsi[i])) {
> +			rc = dpu_encoder_setup(dev, encoder, &info);
> +			if (rc)
> +				DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
> +					  encoder->base.id, rc);
> +			encoder = NULL;
Seems like you are using encoder = NULL as a check to distinguish 
whether this is bonded mode or not.
> +		}
> +	}
> +
> +	/* Register bonded encoder here, when both DSI hosts are initialized 
> */
> +	if (encoder) {
Why cant we replace this with if (msm_dsi_is_bonded_dsi(priv->dsi[i]) 
and get rid
of the encoder = NULL?
> +		rc = dpu_encoder_setup(dev, encoder, &info);
> +		if (rc)
> +			DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
> +				  encoder->base.id, rc);
>  	}
> 
>  	return rc;
> @@ -505,6 +543,7 @@ static int _dpu_kms_initialize_displayport(struct
> drm_device *dev,
>  					    struct dpu_kms *dpu_kms)
>  {
>  	struct drm_encoder *encoder = NULL;
> +	struct msm_display_info info;
>  	int rc = 0;
> 
>  	if (!priv->dp)
> @@ -516,6 +555,7 @@ static int _dpu_kms_initialize_displayport(struct
> drm_device *dev,
>  		return PTR_ERR(encoder);
>  	}
> 
> +	memset(&info, 0, sizeof(info));
>  	rc = msm_dp_modeset_init(priv->dp, dev, encoder);
>  	if (rc) {
>  		DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
> @@ -524,6 +564,14 @@ static int _dpu_kms_initialize_displayport(struct
> drm_device *dev,
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
