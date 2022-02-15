Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9E164B776C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 21:50:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241517AbiBOQwO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 11:52:14 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241911AbiBOQwL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 11:52:11 -0500
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D48A49262
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 08:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1644943920; x=1676479920;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PPjjo/q9IwYwsoSEHYecd35SUubaNNSnfDWTscRVK/M=;
  b=xWMtVqxHm4ePu/mEZpuUI9XUNMxB7/vDzYaOUgIFGorXHYc+SDZI+fIn
   VE2iGBUZM2DcK0s2qiKnVZLm6LC7zEmvNvvGR+ccUVDPV2mhP48DLh2cK
   L0y82bcdfWw597kjQiK0LANwojzkDn5NTXU9dg3a2RW9+KjCx4KgrygiW
   k=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Feb 2022 08:51:59 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 08:51:59 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Feb 2022 08:51:58 -0800
Received: from [10.111.168.21] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 15 Feb
 2022 08:51:56 -0800
Message-ID: <fc8c0e0f-7a30-8782-aead-8ee77c3ba562@quicinc.com>
Date:   Tue, 15 Feb 2022 08:51:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 5/8] drm/msm/dpu: encoder: drop unused mode_fixup
 callback
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-6-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220215141643.3444941-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/15/2022 6:16 AM, Dmitry Baryshkov wrote:
> Both cmd and vid backends provide useless mode_fixup() callback. Drop
> it.
> 

Thanks for not removing the atomic_check().

BTW, can you please include that in the change log so that others 
reviewing it know.

That being said,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  4 ----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  4 ----
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   | 10 ----------
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 14 --------------
>   4 files changed, 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 480d02ccff8c..394916e8fe08 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -602,10 +602,6 @@ static int dpu_encoder_virt_atomic_check(
>   		if (phys->ops.atomic_check)
>   			ret = phys->ops.atomic_check(phys, crtc_state,
>   					conn_state);
> -		else if (phys->ops.mode_fixup)
> -			if (!phys->ops.mode_fixup(phys, mode, adj_mode))
> -				ret = -EINVAL;
> -
>   		if (ret) {
>   			DPU_ERROR_ENC(dpu_enc,
>   					"mode unsupported, phys idx %d\n", i);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index e7270eb6b84b..7b14948c4c87 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -84,7 +84,6 @@ struct dpu_encoder_virt_ops {
>    * @is_master:			Whether this phys_enc is the current master
>    *				encoder. Can be switched at enable time. Based
>    *				on split_role and current mode (CMD/VID).
> - * @mode_fixup:			DRM Call. Fixup a DRM mode.
>    * @mode_set:			DRM Call. Set a DRM mode.
>    *				This likely caches the mode, for use at enable.
>    * @enable:			DRM Call. Enable a DRM mode.
> @@ -117,9 +116,6 @@ struct dpu_encoder_phys_ops {
>   			struct dentry *debugfs_root);
>   	void (*prepare_commit)(struct dpu_encoder_phys *encoder);
>   	bool (*is_master)(struct dpu_encoder_phys *encoder);
> -	bool (*mode_fixup)(struct dpu_encoder_phys *encoder,
> -			const struct drm_display_mode *mode,
> -			struct drm_display_mode *adjusted_mode);
>   	void (*mode_set)(struct dpu_encoder_phys *encoder,
>   			struct drm_display_mode *mode,
>   			struct drm_display_mode *adjusted_mode);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index 35071964d0f6..1796f83b47ae 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -45,15 +45,6 @@ static bool dpu_encoder_phys_cmd_is_master(struct dpu_encoder_phys *phys_enc)
>   	return (phys_enc->split_role != ENC_ROLE_SLAVE);
>   }
>   
> -static bool dpu_encoder_phys_cmd_mode_fixup(
> -		struct dpu_encoder_phys *phys_enc,
> -		const struct drm_display_mode *mode,
> -		struct drm_display_mode *adj_mode)
> -{
> -	DPU_DEBUG_CMDENC(to_dpu_encoder_phys_cmd(phys_enc), "\n");
> -	return true;
> -}
> -
>   static void _dpu_encoder_phys_cmd_update_intf_cfg(
>   		struct dpu_encoder_phys *phys_enc)
>   {
> @@ -756,7 +747,6 @@ static void dpu_encoder_phys_cmd_init_ops(
>   	ops->prepare_commit = dpu_encoder_phys_cmd_prepare_commit;
>   	ops->is_master = dpu_encoder_phys_cmd_is_master;
>   	ops->mode_set = dpu_encoder_phys_cmd_mode_set;
> -	ops->mode_fixup = dpu_encoder_phys_cmd_mode_fixup;
>   	ops->enable = dpu_encoder_phys_cmd_enable;
>   	ops->disable = dpu_encoder_phys_cmd_disable;
>   	ops->destroy = dpu_encoder_phys_cmd_destroy;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index ddd9d89cd456..1831fe37c88c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -225,19 +225,6 @@ static void programmable_fetch_config(struct dpu_encoder_phys *phys_enc,
>   	spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
>   }
>   
> -static bool dpu_encoder_phys_vid_mode_fixup(
> -		struct dpu_encoder_phys *phys_enc,
> -		const struct drm_display_mode *mode,
> -		struct drm_display_mode *adj_mode)
> -{
> -	DPU_DEBUG_VIDENC(phys_enc, "\n");
> -
> -	/*
> -	 * Modifying mode has consequences when the mode comes back to us
> -	 */
> -	return true;
> -}
> -
>   static void dpu_encoder_phys_vid_setup_timing_engine(
>   		struct dpu_encoder_phys *phys_enc)
>   {
> @@ -676,7 +663,6 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
>   {
>   	ops->is_master = dpu_encoder_phys_vid_is_master;
>   	ops->mode_set = dpu_encoder_phys_vid_mode_set;
> -	ops->mode_fixup = dpu_encoder_phys_vid_mode_fixup;
>   	ops->enable = dpu_encoder_phys_vid_enable;
>   	ops->disable = dpu_encoder_phys_vid_disable;
>   	ops->destroy = dpu_encoder_phys_vid_destroy;
