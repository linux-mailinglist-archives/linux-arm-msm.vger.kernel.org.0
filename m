Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D64142B24C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Nov 2020 20:42:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726392AbgKMTmq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 14:42:46 -0500
Received: from z5.mailgun.us ([104.130.96.5]:13457 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726387AbgKMTmq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 14:42:46 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605296565; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=RJ0/kRNTWztNFnaIAcmxits+XC4Dt6oNrWiveqD4bck=;
 b=tKOW2MYsN9XhuMaGp6O13vKD/wecJZvQlgu0nqpy76I5MmAs2S+uVWFv5COGRVMsY7S/uLT+
 GOA115TSs6GXWxB2VOqVYfmGY+KpM87PEa/X6qBo/QNbXF8kbIE+8Zo2pzM2dC3XW5e9Vl+N
 GvgB/z2Sma3NmjMK3Zeq/dMA1xw=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5faee1b524ba9b3b020aa6b3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 13 Nov 2020 19:42:45
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 99B8DC43385; Fri, 13 Nov 2020 19:42:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7C8F0C433F0;
        Fri, 13 Nov 2020 19:42:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Fri, 13 Nov 2020 11:42:44 -0800
From:   abhinavk@codeaurora.org
To:     Lee Jones <lee.jones@linaro.org>
Cc:     freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH 39/40] drm/msm/disp/dpu1/dpu_encoder: Remove a
 bunch of unused variables
In-Reply-To: <20201113134938.4004947-40-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-40-lee.jones@linaro.org>
Message-ID: <166f1a3cfe306e47ceb7ad52bd60f2ae@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-13 05:49, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c: In function
> ‘dpu_encoder_virt_mode_set’:
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:981:31: warning: variable
> ‘num_dspp’ set but not used [-Wunused-but-set-variable]
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:976:30: warning: variable
> ‘topology’ set but not used [-Wunused-but-set-variable]
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c: In function
> ‘_dpu_encoder_virt_enable_helper’:
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1099:26: warning:
> variable ‘priv’ set but not used [-Wunused-but-set-variable]
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c: In function
> ‘dpu_encoder_virt_disable’:
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1210:18: warning:
> variable ‘dpu_kms’ set but not used [-Wunused-but-set-variable]
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index f7f5c258b5537..289bfb6f1861c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -973,12 +973,11 @@ static void dpu_encoder_virt_mode_set(struct
> drm_encoder *drm_enc,
>  	struct drm_crtc *drm_crtc;
>  	struct dpu_crtc_state *cstate;
>  	struct dpu_global_state *global_state;
> -	struct msm_display_topology topology;
>  	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
> -	int num_lm, num_ctl, num_pp, num_dspp;
> +	int num_lm, num_ctl, num_pp;
>  	int i, j;
> 
>  	if (!drm_enc) {
> @@ -1020,8 +1019,6 @@ static void dpu_encoder_virt_mode_set(struct
> drm_encoder *drm_enc,
>  		if (drm_crtc->state->encoder_mask & drm_encoder_mask(drm_enc))
>  			break;
> 
> -	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
> -
>  	/* Query resource that have been reserved in atomic check step. */
>  	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>  		drm_enc->base.id, DPU_HW_BLK_PINGPONG, hw_pp,
> @@ -1030,7 +1027,7 @@ static void dpu_encoder_virt_mode_set(struct
> drm_encoder *drm_enc,
>  		drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
>  	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>  		drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> -	num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +	dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>  		drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
>  		ARRAY_SIZE(hw_dspp));
> 
> @@ -1096,7 +1093,6 @@ static void dpu_encoder_virt_mode_set(struct
> drm_encoder *drm_enc,
>  static void _dpu_encoder_virt_enable_helper(struct drm_encoder 
> *drm_enc)
>  {
>  	struct dpu_encoder_virt *dpu_enc = NULL;
> -	struct msm_drm_private *priv;
>  	int i;
> 
>  	if (!drm_enc || !drm_enc->dev) {
> @@ -1104,8 +1100,6 @@ static void
> _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
>  		return;
>  	}
> 
> -	priv = drm_enc->dev->dev_private;
> -
>  	dpu_enc = to_dpu_encoder_virt(drm_enc);
>  	if (!dpu_enc || !dpu_enc->cur_master) {
>  		DPU_ERROR("invalid dpu encoder/master\n");
> @@ -1207,7 +1201,6 @@ static void dpu_encoder_virt_disable(struct
> drm_encoder *drm_enc)
>  {
>  	struct dpu_encoder_virt *dpu_enc = NULL;
>  	struct msm_drm_private *priv;
> -	struct dpu_kms *dpu_kms;
>  	int i = 0;
> 
>  	if (!drm_enc) {
> @@ -1225,7 +1218,6 @@ static void dpu_encoder_virt_disable(struct
> drm_encoder *drm_enc)
>  	dpu_enc->enabled = false;
> 
>  	priv = drm_enc->dev->dev_private;
> -	dpu_kms = to_dpu_kms(priv->kms);
> 
>  	trace_dpu_enc_disable(DRMID(drm_enc));
