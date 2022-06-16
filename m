Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D934D54DAF9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 08:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiFPGsp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 02:48:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359142AbiFPGs1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 02:48:27 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81B725B3D7
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 23:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1655362106; x=1686898106;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4KdMiYTh3codmPUPGxDDQDLzw1UThiPL3Xn8Wbsvvc0=;
  b=fOLOZ4LQV28WEuQdbwzLBiAW540zy7deFiZp0HFWkRtFQFiiOWUdm4ZK
   PbqoKDL7QbU+/XC2F2uTZSjoJorqXf8XKurtrGiD+Kb91BpVILxDKEUNc
   78Z/tZYwMxGPJiAwfgZEfB9va/7YLkVqQbqdCckJRl/m+8r27XYi/XUxK
   4=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Jun 2022 23:48:26 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 23:48:25 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 15 Jun 2022 23:48:25 -0700
Received: from [10.111.175.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 15 Jun
 2022 23:48:21 -0700
Message-ID: <f6f6f570-6c14-5c1d-cc8b-4c662b950364@quicinc.com>
Date:   Wed, 15 Jun 2022 23:48:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 2/2] drm/msm/dpu: drop enum msm_display_caps
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20220507115942.1705872-1-dmitry.baryshkov@linaro.org>
 <20220507115942.1705872-2-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220507115942.1705872-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/7/2022 4:59 AM, Dmitry Baryshkov wrote:
> After the commit c46f0d69039c ("drm/msm: remove unused hotplug and edid
> macros from msm_drv.h") the msm_display_caps enum contains two bits
> describing whether the encoder should work in video or command mode.
> Drop the enum and replace capabilities field in struct msm_display_info
> with boolean is_cmd_mode field.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 31 +++++++++------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 +--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  5 +---
>   drivers/gpu/drm/msm/msm_drv.h               | 10 -------
>   4 files changed, 16 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 07de0c0506d3..ce299b1e40a0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -636,7 +636,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
>   	}
>   
>   	if (hw_mdptop->ops.setup_vsync_source &&
> -			disp_info->capabilities & MSM_DISPLAY_CAP_CMD_MODE) {
> +			disp_info->is_cmd_mode) {
>   		for (i = 0; i < dpu_enc->num_phys_encs; i++)
>   			vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
>   
> @@ -720,8 +720,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
>   	}
>   	dpu_enc = to_dpu_encoder_virt(drm_enc);
>   	priv = drm_enc->dev->dev_private;
> -	is_vid_mode = dpu_enc->disp_info.capabilities &
> -						MSM_DISPLAY_CAP_VID_MODE;
> +	is_vid_mode = !dpu_enc->disp_info.is_cmd_mode;
>   
>   	/*
>   	 * when idle_pc is not supported, process only KICKOFF, STOP and MODESET
> @@ -1604,7 +1603,7 @@ void dpu_encoder_trigger_kickoff_pending(struct drm_encoder *drm_enc)
>   
>   		/* update only for command mode primary ctl */
>   		if ((phys == dpu_enc->cur_master) &&
> -		   (disp_info->capabilities & MSM_DISPLAY_CAP_CMD_MODE)
> +		    disp_info->is_cmd_mode
>   		    && ctl->ops.trigger_pending)
>   			ctl->ops.trigger_pending(ctl);
>   	}
> @@ -2141,20 +2140,19 @@ static int dpu_encoder_virt_add_phys_encs(
>   		return -EINVAL;
>   	}
>   
> -	if (disp_info->capabilities & MSM_DISPLAY_CAP_VID_MODE) {
> -		enc = dpu_encoder_phys_vid_init(params);
> +
> +	if (disp_info->intf_type == DRM_MODE_ENCODER_VIRTUAL) {
> +		enc = dpu_encoder_phys_wb_init(params);
>   
>   		if (IS_ERR(enc)) {
> -			DPU_ERROR_ENC(dpu_enc, "failed to init vid enc: %ld\n",
> +			DPU_ERROR_ENC(dpu_enc, "failed to init wb enc: %ld\n",
>   				PTR_ERR(enc));
>   			return PTR_ERR(enc);
>   		}
>   
>   		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
>   		++dpu_enc->num_phys_encs;
> -	}
> -
> -	if (disp_info->capabilities & MSM_DISPLAY_CAP_CMD_MODE) {
> +	} else if (disp_info->is_cmd_mode) {
>   		enc = dpu_encoder_phys_cmd_init(params);
>   
>   		if (IS_ERR(enc)) {
> @@ -2165,14 +2163,12 @@ static int dpu_encoder_virt_add_phys_encs(
>   
>   		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
>   		++dpu_enc->num_phys_encs;
> -	}
> -
> -	if (disp_info->intf_type == DRM_MODE_ENCODER_VIRTUAL) {
> -		enc = dpu_encoder_phys_wb_init(params);
> +	} else {
> +		enc = dpu_encoder_phys_vid_init(params);
>   
>   		if (IS_ERR(enc)) {
> -			DPU_ERROR_ENC(dpu_enc, "failed to init wb enc: %ld\n",
> -					PTR_ERR(enc));
> +			DPU_ERROR_ENC(dpu_enc, "failed to init vid enc: %ld\n",
> +				PTR_ERR(enc));
>   			return PTR_ERR(enc);
>   		}
>   
> @@ -2232,8 +2228,7 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>   
>   	DPU_DEBUG("dsi_info->num_of_h_tiles %d\n", disp_info->num_of_h_tiles);
>   
> -	if ((disp_info->capabilities & MSM_DISPLAY_CAP_CMD_MODE) ||
> -	    (disp_info->capabilities & MSM_DISPLAY_CAP_VID_MODE))
> +	if (disp_info->intf_type != DRM_MODE_ENCODER_VIRTUAL)
>   		dpu_enc->idle_pc_supported =
>   				dpu_kms->catalog->caps->has_idle_pc;
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 781d41c91994..861870ac8ae7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -21,19 +21,19 @@
>   /**
>    * struct msm_display_info - defines display properties
>    * @intf_type:          DRM_MODE_ENCODER_ type
> - * @capabilities:       Bitmask of display flags
>    * @num_of_h_tiles:     Number of horizontal tiles in case of split interface
>    * @h_tile_instance:    Controller instance used per tile. Number of elements is
>    *                      based on num_of_h_tiles
> + * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
>    * @is_te_using_watchdog_timer:  Boolean to indicate watchdog TE is
>    *				 used instead of panel TE in cmd mode panels
>    * @dsc:		DSC configuration data for DSC-enabled displays
>    */
>   struct msm_display_info {
>   	int intf_type;
> -	uint32_t capabilities;
>   	uint32_t num_of_h_tiles;
>   	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
> +	bool is_cmd_mode;
>   	bool is_te_using_watchdog_timer;
>   	struct msm_display_dsc_config *dsc;
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index f89dcb903869..7a40cfa9b09e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -584,9 +584,7 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>   		}
>   
>   		info.h_tile_instance[info.num_of_h_tiles++] = i;
> -		info.capabilities = msm_dsi_is_cmd_mode(priv->dsi[i]) ?
> -			MSM_DISPLAY_CAP_CMD_MODE :
> -			MSM_DISPLAY_CAP_VID_MODE;
> +		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->dsi[i]);
>   
>   		info.dsc = msm_dsi_get_dsc_config(priv->dsi[i]);
>   
> @@ -639,7 +637,6 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>   
>   		info.num_of_h_tiles = 1;
>   		info.h_tile_instance[0] = i;
> -		info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
>   		info.intf_type = encoder->encoder_type;
>   		rc = dpu_encoder_setup(dev, encoder, &info);
>   		if (rc) {
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 2ba57c575e13..eb23377b6e57 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -61,16 +61,6 @@ enum msm_dp_controller {
>   #define MSM_GPU_MAX_RINGS 4
>   #define MAX_H_TILES_PER_DISPLAY 2
>   
> -/**
> - * enum msm_display_caps - features/capabilities supported by displays
> - * @MSM_DISPLAY_CAP_VID_MODE:           Video or "active" mode supported
> - * @MSM_DISPLAY_CAP_CMD_MODE:           Command mode supported
> - */
> -enum msm_display_caps {
> -	MSM_DISPLAY_CAP_VID_MODE	= BIT(0),
> -	MSM_DISPLAY_CAP_CMD_MODE	= BIT(1),
> -};
> -
>   /**
>    * enum msm_event_wait - type of HW events to wait for
>    * @MSM_ENC_COMMIT_DONE - wait for the driver to flush the registers to HW
