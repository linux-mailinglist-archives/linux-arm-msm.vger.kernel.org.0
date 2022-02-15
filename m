Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87A404B72C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 17:42:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241101AbiBOPqC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 10:46:02 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241191AbiBOPp4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 10:45:56 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 145B9D007C
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 07:42:55 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id x24so1355422oie.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 07:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+hqacOI1rCKSdvQziuBji6IRw7XKiSJ0IkXi19yeG78=;
        b=PZ3a871p7M+BTKWNxEkkgIaluf7JL9l58xwSGxmPbGtVHn1LGVJZHAue6vGf6o0ENT
         MfeLY1xddvHUGlq2afRBTtol95yE3fkA+LkmKiyxZoXkgq0lDqDvtzaSBgnizE5dZChr
         6I7297BGTzDVTBbzZj19x4pJUylD59ndU+3czLQImB+SRvmRxtIqu2uNV2+OoMZNBIMq
         uTu8usEk38Fywb+BCklPnhS246flJmCNg+j6ZWqrGf7UBhXh2nainTLil6+kDNGZl1Pv
         27ehStLQQ8P/kHcphSfuM9b9ITH7z06/cpOHuyF5Dtt9n8y0xFWIdoHq5LHnxdWg9uiO
         zSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+hqacOI1rCKSdvQziuBji6IRw7XKiSJ0IkXi19yeG78=;
        b=n37Q0PgF3IyTeZPveYZ64q18MW86Ym2RXSk3qYJdx3j6dPXiBIPqndnhf40nDPo4id
         Mz+aY+yVXpfCcPT68t8pbfTT/DCA00fywu1KjE5PDaZp/xn8V8ptKqAEphDzbRFqC1R0
         FutsuGBpWLDgW/yeIER8OOd1nT6ou2omDzHZ1Nbkp8KjDT/nwkd8jItR+78mwBBEo9um
         Gd0dtvM9ku40nh5OjgEi5TuKCGjDnN9W6KQ2r3dnVrcZ77x9iLJQ+bMKLLb5zFDxOUPp
         PyrWYBJOREzQaNdOPpWKg1LqqPigFM8dLx5L+7cNcTE/SZ6CLOHF5CQssF39mvrNlS7q
         TJZg==
X-Gm-Message-State: AOAM530STKqZHgvkg4LKM2o4DjMksn9t2JX6arV9rR1xHelyp4edLc5m
        HUlTifh25EXRVcZihBapdyKJKw==
X-Google-Smtp-Source: ABdhPJyLN7nPRbXJaAfZ+K8Ij78IVk3f+pfCizOQ5rW0NFZB5HxKOPdBacntu8YrdTh3a6TSmKInKg==
X-Received: by 2002:aca:5e83:0:b0:2ce:6ee7:2c8e with SMTP id s125-20020aca5e83000000b002ce6ee72c8emr1779754oib.188.1644939774327;
        Tue, 15 Feb 2022 07:42:54 -0800 (PST)
Received: from yoga ([2600:1700:a0:3dc8:5c39:baff:fe03:898d])
        by smtp.gmail.com with ESMTPSA id y22sm13877833oto.2.2022.02.15.07.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 07:42:53 -0800 (PST)
Date:   Tue, 15 Feb 2022 09:42:51 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 8/8] drm/msm/dpu: simplify intf allocation code
Message-ID: <YgvJ+wrckzJbjhDY@yoga>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-9-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215141643.3444941-9-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 15 Feb 08:16 CST 2022, Dmitry Baryshkov wrote:

> Rather than passing DRM_MODE_ENCODER_* and letting dpu_encoder to guess,
> which intf type we mean, pass INTF_DSI/INTF_DP directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 26 +++++++--------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  5 ++--
>  3 files changed, 13 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index fa1dc088a672..597d40f78d38 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -490,7 +490,7 @@ void dpu_encoder_helper_split_config(
>  	hw_mdptop = phys_enc->hw_mdptop;
>  	disp_info = &dpu_enc->disp_info;
>  
> -	if (disp_info->intf_type != DRM_MODE_ENCODER_DSI)
> +	if (disp_info->intf_type != INTF_DSI)
>  		return;
>  
>  	/**
> @@ -552,7 +552,7 @@ static struct msm_display_topology dpu_encoder_get_topology(
>  	else
>  		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
>  
> -	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
> +	if (dpu_enc->disp_info.intf_type == INTF_DSI) {
>  		if (dpu_kms->catalog->dspp &&
>  			(dpu_kms->catalog->dspp_count >= topology.num_lm))
>  			topology.num_dspp = topology.num_lm;
> @@ -1074,7 +1074,7 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
>  	}
>  
>  
> -	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_TMDS &&
> +	if (dpu_enc->disp_info.intf_type == INTF_DP &&
>  		dpu_enc->cur_master->hw_mdptop &&
>  		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select)
>  		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select(
> @@ -1082,7 +1082,7 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
>  
>  	_dpu_encoder_update_vsync_source(dpu_enc, &dpu_enc->disp_info);
>  
> -	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI &&
> +	if (dpu_enc->disp_info.intf_type == INTF_DSI &&
>  			!WARN_ON(dpu_enc->num_phys_encs == 0)) {
>  		unsigned bpc = dpu_enc->connector->display_info.bpc;
>  		for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
> @@ -1949,7 +1949,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>  {
>  	int ret = 0;
>  	int i = 0;
> -	enum dpu_intf_type intf_type = INTF_NONE;
>  	struct dpu_enc_phys_init_params phys_params;
>  
>  	if (!dpu_enc) {
> @@ -1965,15 +1964,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>  	phys_params.parent_ops = &dpu_encoder_parent_ops;
>  	phys_params.enc_spinlock = &dpu_enc->enc_spinlock;
>  
> -	switch (disp_info->intf_type) {
> -	case DRM_MODE_ENCODER_DSI:
> -		intf_type = INTF_DSI;
> -		break;
> -	case DRM_MODE_ENCODER_TMDS:
> -		intf_type = INTF_DP;
> -		break;
> -	}
> -
>  	WARN_ON(disp_info->num_of_h_tiles < 1);
>  
>  	DPU_DEBUG("dsi_info->num_of_h_tiles %d\n", disp_info->num_of_h_tiles);
> @@ -2005,11 +1995,11 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>  				i, controller_id, phys_params.split_role);
>  
>  		phys_params.intf_idx = dpu_encoder_get_intf(dpu_kms->catalog,
> -													intf_type,
> -													controller_id);
> +				disp_info->intf_type,
> +				controller_id);
>  		if (phys_params.intf_idx == INTF_MAX) {
>  			DPU_ERROR_ENC(dpu_enc, "could not get intf: type %d, id %d\n",
> -						  intf_type, controller_id);
> +						  disp_info->intf_type, controller_id);
>  			ret = -EINVAL;
>  		}
>  
> @@ -2092,7 +2082,7 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
>  	timer_setup(&dpu_enc->frame_done_timer,
>  			dpu_encoder_frame_done_timeout, 0);
>  
> -	if (disp_info->intf_type == DRM_MODE_ENCODER_DSI)
> +	if (disp_info->intf_type == INTF_DSI)
>  		timer_setup(&dpu_enc->vsync_event_timer,
>  				dpu_encoder_vsync_event_handler,
>  				0);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index ebe3944355bb..3891bcbbe5a4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -36,7 +36,7 @@ void dpu_encoder_get_hw_resources(struct drm_encoder *encoder,
>  
>  /**
>   * struct msm_display_info - defines display properties
> - * @intf_type:          DRM_MODE_ENCODER_ type
> + * @intf_type:          INTF_ type
>   * @capabilities:       Bitmask of display flags
>   * @num_of_h_tiles:     Number of horizontal tiles in case of split interface
>   * @h_tile_instance:    Controller instance used per tile. Number of elements is
> @@ -45,7 +45,7 @@ void dpu_encoder_get_hw_resources(struct drm_encoder *encoder,
>   *				 used instead of panel TE in cmd mode panels
>   */
>  struct msm_display_info {
> -	int intf_type;
> +	enum dpu_intf_type intf_type;
>  	uint32_t capabilities;
>  	uint32_t num_of_h_tiles;
>  	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 5f0dc44119c9..bca4f05a5782 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -564,7 +564,7 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>  		priv->encoders[priv->num_encoders++] = encoder;
>  
>  		memset(&info, 0, sizeof(info));
> -		info.intf_type = encoder->encoder_type;
> +		info.intf_type = INTF_DSI;
>  
>  		rc = msm_dsi_modeset_init(priv->dsi[i], dev, encoder);
>  		if (rc) {
> @@ -630,7 +630,8 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  		info.num_of_h_tiles = 1;
>  		info.h_tile_instance[0] = i;
>  		info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
> -		info.intf_type = encoder->encoder_type;
> +		/* FIXME: HW catalog treats both DP and eDP interfaces as INTF_DP */

Is this really a problem? Don't we need to handle the differences
between eDP and DP on a case-by-case basis anyways. E.g. not all DP
interfaces seems to have audio support etc.


Either way, thanks for clearing this up!

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> +		info.intf_type = INTF_DP;
>  		rc = dpu_encoder_setup(dev, encoder, &info);
>  		if (rc) {
>  			DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
> -- 
> 2.34.1
> 
