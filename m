Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C71EC6264A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Nov 2022 23:34:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234455AbiKKWem (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Nov 2022 17:34:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234439AbiKKWek (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Nov 2022 17:34:40 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92E5518B21
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 14:34:38 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id d3so5996608ljl.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 14:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qby6hZgYyrvExemm1RlZ9AJWUWC3KnZsFc/xC3qyX6M=;
        b=O6r6qIS+LPhi9LYxdSPmRsvc64PJlF5O1D04D6rVa5vVGcNZYbLOaMP9OU6EdKXUj4
         tT+AK/XFitdd2HnqWxiAhUmoboftwI0OZIjpI5LVnQtMSsjunZn+kGpbufsp9tq6ZmQz
         HfJoHCyoKR+y9ZcwsvPynBlndcgQJ6LzSrSFMMhd4EEKcHwRsW42YUYbPw8P/JWWD3A8
         KQenknpD2N5MAAVYP5QVD2UQPv+hmj3t/ATeJXJrgy1XNlauXHCjx99Ft19rIYVr1szm
         JZuYCcU6QCNxD1531ycd55/DHx26U+Hj1Uve4mkTbNrJMtSxUzPEpeUKZvFjwtbVF8JD
         WC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qby6hZgYyrvExemm1RlZ9AJWUWC3KnZsFc/xC3qyX6M=;
        b=6JZALE7Ac1UaTyUHB/8Lox3OZUmb7cnTFlvsP7GOiJn05OANGR/LMT0Ol5NiaOdxz8
         8nL1D7zNMNzRHND2koIeBDTcOg7H/RPR/IrfAEVkprFBKbuOamNzmDLoFrcNjU1mghZv
         L1vRNgzdhPc9gK4M23Ig4I6ettrIy3y6ArgpAXpu0gRxklrw6oHxEQl/00Y6bsm8oTYl
         BcyWKMgVMUL5dJwkYiTt1OlexOR1cA0DDh61y3V6LqS4tzwneDAtdlHtkZAKSG7iwRJo
         E3zcqzgEL0ddCsyWDODUZ+rKblkfiXIhFlBkOPQ7tmCMt1QDrVm3cRQc5QU8zLnUqchR
         oJfQ==
X-Gm-Message-State: ANoB5plRCpWSce6j2wkFtrrsRQrTS2Zwa4iqWtMvcMls0j+WU543A3d5
        OaoRpNcQXhGP12PZEu8YDWCWCw==
X-Google-Smtp-Source: AA0mqf6Ex6rWZ47dONV8+OaLJ4+yaeQ+JBS8tveQT43Etb0Vrsqlt0WZBYZQUJaHaFx+1XY4pMlEuw==
X-Received: by 2002:a2e:3817:0:b0:26d:ec04:7487 with SMTP id f23-20020a2e3817000000b0026dec047487mr1391610lja.82.1668206076926;
        Fri, 11 Nov 2022 14:34:36 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v28-20020ac258fc000000b004b11af921fasm532603lfo.222.2022.11.11.14.34.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 14:34:36 -0800 (PST)
Message-ID: <db85a38e-bd52-aa33-9c1e-769ac1451a92@linaro.org>
Date:   Sat, 12 Nov 2022 01:34:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [v1] drm/msm/disp/dpu1: populate disp_info with connector type
Content-Language: en-GB
To:     Kalyan Thota <quic_kalyant@quicinc.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, robdclark@chromium.org,
        dianders@chromium.org, swboyd@chromium.org,
        quic_vpolimer@quicinc.com, quic_abhinavk@quicinc.com
References: <1668175019-10960-1-git-send-email-quic_kalyant@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1668175019-10960-1-git-send-email-quic_kalyant@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/11/2022 16:56, Kalyan Thota wrote:
> Populate disp_info with connector type. Since DRM encoder type
> for few encoders can be similar (like eDP and DP) this information
> will be useful to differentiate interfaces.
> 
> Changes in v1:
> - add connector type in the disp_info (Dmitry)

You can get connector type from

> - add helper functions to know encoder type
> - update commit text reflecting the change
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 44 +++++++++++++++++++++++++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 26 +++++++++++++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  2 ++
>   drivers/gpu/drm/msm/dp/dp_display.c         |  5 ++++
>   drivers/gpu/drm/msm/msm_drv.h               |  7 ++++-
>   5 files changed, 77 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 9c6817b..c9058aa 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -217,6 +217,40 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
>   	15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
>   };
>   
> +bool dpu_encoder_is_external(struct drm_encoder *drm_enc)
> +{
> +	struct dpu_encoder_virt *dpu_enc;
> +
> +	if (!drm_enc)
> +		return false;
> +
> +	dpu_enc = to_dpu_encoder_virt(drm_enc);
> +	return (dpu_enc->disp_info.connector_type ==
> +			DRM_MODE_CONNECTOR_DisplayPort);

And also HDMI, DVI, VGA and several other connector types.

It is much easier to enumerate non-interesting (in other words, 
non-external ones):
- Unknown
- LVDS
- eDP
- DSI
- DPI
- VIRTUAL
- WRITEBACK

> +}
> +
> +bool dpu_encoder_is_virtual(struct drm_encoder *drm_enc)
> +{
> +	struct dpu_encoder_virt *dpu_enc;
> +
> +	if (!drm_enc)
> +		return false;
> +
> +	dpu_enc = to_dpu_encoder_virt(drm_enc);
> +	return (dpu_enc->disp_info.connector_type == DRM_MODE_CONNECTOR_WRITEBACK);
> +}
> +
> +bool dpu_encoder_is_primary(struct drm_encoder *drm_enc)
> +{
> +	struct dpu_encoder_virt *dpu_enc;
> +
> +	if (!drm_enc)
> +		return false;
> +
> +	dpu_enc = to_dpu_encoder_virt(drm_enc);
> +	return((dpu_enc->disp_info.connector_type == DRM_MODE_CONNECTOR_DSI) ||
> +		(dpu_enc->disp_info.connector_type == DRM_MODE_CONNECTOR_eDP));

Why do you need a separate is_primary?

> +}
>   
>   bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
>   {
> @@ -2412,7 +2446,7 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
>   	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>   	struct drm_encoder *drm_enc = NULL;
>   	struct dpu_encoder_virt *dpu_enc = NULL;
> -	int ret = 0;
> +	int ret = 0, intf_i;
>   
>   	dpu_enc = to_dpu_encoder_virt(enc);
>   
> @@ -2424,13 +2458,17 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
>   	timer_setup(&dpu_enc->frame_done_timer,
>   			dpu_encoder_frame_done_timeout, 0);
>   
> +	intf_i = disp_info->h_tile_instance[0];
>   	if (disp_info->intf_type == DRM_MODE_ENCODER_DSI)
>   		timer_setup(&dpu_enc->vsync_event_timer,
>   				dpu_encoder_vsync_event_handler,
>   				0);
> -	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS)
> +	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS) {
>   		dpu_enc->wide_bus_en = msm_dp_wide_bus_available(
> -				priv->dp[disp_info->h_tile_instance[0]]);
> +				priv->dp[intf_i]);
> +		disp_info->connector_type =
> +			msm_dp_get_connector_type(priv->dp[intf_i]);
> +	}
>   
>   	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
>   			dpu_encoder_off_work);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 9e7236e..d361c5d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -25,16 +25,18 @@
>    * @num_of_h_tiles:     Number of horizontal tiles in case of split interface
>    * @h_tile_instance:    Controller instance used per tile. Number of elements is
>    *                      based on num_of_h_tiles
> - * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
> + * @is_cmd_mode:        Boolean to indicate if the CMD mode is requested

Unrelated change. If you want to fix a whitespace, please do so. In a 
separate patch.

> + * @connector_type:     DRM_MODE_CONNECTOR_ type

You can get this kind of information from the atomic state.
See the for_each_connector_on_encoder

>    * @is_te_using_watchdog_timer:  Boolean to indicate watchdog TE is
> - *				 used instead of panel TE in cmd mode panels
> - * @dsc:		DSC configuration data for DSC-enabled displays
> + *                      used instead of panel TE in cmd mode panels
> + * @dsc:                DSC configuration data for DSC-enabled displays
>    */
>   struct msm_display_info {
>   	int intf_type;
>   	uint32_t num_of_h_tiles;
>   	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
>   	bool is_cmd_mode;
> +	int connector_type;
>   	bool is_te_using_watchdog_timer;
>   	struct drm_dsc_config *dsc;
>   };
> @@ -224,4 +226,22 @@ void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
>    */
>   bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc);
>   
> +/**
> +* dpu_encoder_is_external - find if the encoder is of type DP
> +* @drm_enc:    Pointer to previously created drm encoder structure
> +*/
> +bool dpu_encoder_is_external(struct drm_encoder *drm_enc);
> +
> +/**
> +* dpu_encoder_is_virtual - find if the encoder is of type Writeback
> +* @drm_enc:    Pointer to previously created drm encoder structure
> +*/
> +bool dpu_encoder_is_virtual(struct drm_encoder *drm_enc);
> +
> +/**
> +* dpu_encoder_is_primary - find if the encoder is of type DSI or eDP
> +* @drm_enc:    Pointer to previously created drm encoder structure
> +*/
> +bool dpu_encoder_is_primary(struct drm_encoder *drm_enc);
> +
>   #endif /* __DPU_ENCODER_H__ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 0d94eec0d..0709da2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -574,6 +574,7 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>   
>   		memset(&info, 0, sizeof(info));
>   		info.intf_type = encoder->encoder_type;
> +		info.connector_type = DRM_MODE_CONNECTOR_DSI;

No, this is pure lie.

>   
>   		rc = msm_dsi_modeset_init(priv->dsi[i], dev, encoder);
>   		if (rc) {
> @@ -676,6 +677,7 @@ static int _dpu_kms_initialize_writeback(struct drm_device *dev,
>   	/* use only WB idx 2 instance for DPU */
>   	info.h_tile_instance[0] = WB_2;
>   	info.intf_type = encoder->encoder_type;
> +	info.connector_type = DRM_MODE_CONNECTOR_WRITEBACK;
>   
>   	rc = dpu_encoder_setup(dev, encoder, &info);
>   	if (rc) {
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index bfd0aef..53f65dd 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1509,6 +1509,11 @@ bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
>   	return dp->wide_bus_en;
>   }
>   
> +int msm_dp_get_connector_type(const struct msm_dp *dp_display)
> +{
> +	return dp_display->connector_type;
> +}
> +
>   void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
>   {
>   	struct dp_display_private *dp;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index ea80846..2ecba6f 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -331,7 +331,7 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_displa
>   
>   void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor);
>   bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
> -
> +int msm_dp_get_connector_type(const struct msm_dp *dp_display);
>   #else
>   static inline int __init msm_dp_register(void)
>   {
> @@ -365,6 +365,11 @@ static inline bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
>   	return false;
>   }
>   
> +static inline int msm_dp_get_connector_type(const struct msm_dp *dp_display)
> +{
> +	return 0;
> +}
> +
>   #endif
>   
>   #ifdef CONFIG_DRM_MSM_MDP4

-- 
With best wishes
Dmitry

