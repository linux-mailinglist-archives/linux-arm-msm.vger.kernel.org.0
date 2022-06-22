Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F04595552C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 19:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359461AbiFVRsF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jun 2022 13:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359663AbiFVRsE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jun 2022 13:48:04 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDF2B1054E
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 10:48:02 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id i18so15393045lfu.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 10:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IloyfVhEETdOouew6mq021Z6y2IVsBVTHxLhro9wqAA=;
        b=kgBXAfu4kLFYzF3sY6Xb5pyz/Btxf2XeOIW8AaABFIIhFEGA3tfBvNcdJivQj5/KxS
         Sq+UUMM9tcwk1U1ThMWYqgnhT369yziEIsMXRVAeu6H2dhbVuQofJ9afx1wr464HkdJL
         5u+yNtasquoYLoOkCocpOxgQqr8X120bU4+lClsd6jrAOCews66ZRSDmowncxZ5EsFc/
         fRZo0Bu12uOhDllfKDBN+E/sPgDQ59lRu9wgZvggFbxWmgVwtm4xeWkVY/CWdzZlDNqQ
         t4zIv/zYfqltR0C+5T0vbLJ1AKwyjJm6f3CL5frrJknzpVTm2sGHRVrzWuYFhMolwuls
         MVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IloyfVhEETdOouew6mq021Z6y2IVsBVTHxLhro9wqAA=;
        b=ZdZsW5VTAGxBGPAmY5xMbqlre1F4x5Lkv9fxFTWc7L58xCMZlW/ZiMkoc6529BFaer
         rA+FQDEGdjJ4QtSHutJD+ehNdO5dUP24oyedLGsABE2uQ+HacnEvwcdETQI3M2O+SLYu
         F7f7SwAhhO3c+xUG1wUnqWVfn+mnoU6OfHXi/J0oFQfR8KmkkgjbYFkyHpqtg7yyo3DG
         FRs8YX4TpbYAs4weKhqlKAN+VSYwJ1GVotj2J/AjFlehRfwJbGpcbTmpkwrN/rylcVCX
         5wcbzliMmloKI+jyb+y8u3o1KXNngTxIcyYl4e+ZPpiJGvSLwcER2w8UqYeXUNQa8tQ5
         NDIQ==
X-Gm-Message-State: AJIora9aQSHQ/PBvIUcCnZDWV6qU3kc9/iwTjKaJjbEXrJAyHb5Rf4ZL
        oSG7A05EYELPVnh4VqQeywZTKyr98R4b6Dgf
X-Google-Smtp-Source: AGRyM1tvf13whvWa3X8sfZsBXboScSZIFn7GE9MWkUexabzxnaix0v7CPte5X4UuhcV6jAZLEefoYw==
X-Received: by 2002:a05:6512:39cb:b0:47d:a4c6:40eb with SMTP id k11-20020a05651239cb00b0047da4c640ebmr2878713lfu.597.1655920081195;
        Wed, 22 Jun 2022 10:48:01 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o4-20020ac24e84000000b0047f8cb94004sm571524lfr.35.2022.06.22.10.48.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 10:48:00 -0700 (PDT)
Message-ID: <ee9462d3-06c3-bb21-5294-1eaecb33333a@linaro.org>
Date:   Wed, 22 Jun 2022 20:48:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 1/4] drm/msm/dpu: Move LM CRC code into separate method
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        quic_aravindh@quicinc.com, quic_abhinavk@quicinc.com
References: <20220622171835.7558-1-quic_jesszhan@quicinc.com>
 <20220622171835.7558-2-quic_jesszhan@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220622171835.7558-2-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/06/2022 20:18, Jessica Zhang wrote:
> Move layer mixer-specific section of dpu_crtc_get_crc() into a separate
> helper method. This way, we can make it easier to get CRCs from other HW
> blocks by adding other get_crc helper methods.
> 
> Changes since V1:
> - Move common bitmasks to dpu_hw_util.h
> - Move common CRC methods to dpu_hw_util.c
> - Update copyrights
> - Change crcs array to a dynamically allocated array and added it as a
>    member of crtc_state
> 
> Changes since V2:
> - Put changes for hw_util into a separate commit
> - Revert crcs array to a static array
> - Add else case for set_crc_source to return EINVAL if no valid source
>    is selected
> - Add DPU_CRTC_MAX_CRC_ENTRIES macro
> 
> Changes since V3:
> - Move crcs array into dpu_crtc_get_lm_crc
> - Remove comment about crcs array in dpu_crtc_state struct
> - Revert `lm` rename
> - Remove DPU_CRTC_MAX_CRC_ENTRIES macro
> - Return EINVAL in dpu_crtc_get_crc if no valid CRC source is set
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 65 +++++++++++++++---------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h |  2 +
>   2 files changed, 43 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index b56f777dbd0e..b57140c3671a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1,5 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>    * Copyright (c) 2014-2021 The Linux Foundation. All rights reserved.
>    * Copyright (C) 2013 Red Hat
>    * Author: Rob Clark <robdclark@gmail.com>
> @@ -99,17 +100,32 @@ static int dpu_crtc_verify_crc_source(struct drm_crtc *crtc,
>   	return 0;
>   }
>   
> +static void dpu_crtc_setup_lm_misr(struct dpu_crtc_state *crtc_state)
> +{
> +	struct dpu_crtc_mixer *m;
> +	int i;
> +
> +	for (i = 0; i < crtc_state->num_mixers; ++i) {
> +		m = &crtc_state->mixers[i];
> +
> +		if (!m->hw_lm || !m->hw_lm->ops.setup_misr)
> +			continue;
> +
> +		/* Calculate MISR over 1 frame */
> +		m->hw_lm->ops.setup_misr(m->hw_lm, true, 1);
> +	}
> +}
> +
>   static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
>   {
>   	enum dpu_crtc_crc_source source = dpu_crtc_parse_crc_source(src_name);
>   	enum dpu_crtc_crc_source current_source;
>   	struct dpu_crtc_state *crtc_state;
>   	struct drm_device *drm_dev = crtc->dev;
> -	struct dpu_crtc_mixer *m;
>   
>   	bool was_enabled;
>   	bool enable = false;
> -	int i, ret = 0;
> +	int ret = 0;
>   
>   	if (source < 0) {
>   		DRM_DEBUG_DRIVER("Invalid CRC source %s for CRTC%d\n", src_name, crtc->index);
> @@ -146,16 +162,10 @@ static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
>   
>   	crtc_state->crc_frame_skip_count = 0;
>   
> -	for (i = 0; i < crtc_state->num_mixers; ++i) {
> -		m = &crtc_state->mixers[i];
> -
> -		if (!m->hw_lm || !m->hw_lm->ops.setup_misr)
> -			continue;
> -
> -		/* Calculate MISR over 1 frame */
> -		m->hw_lm->ops.setup_misr(m->hw_lm, true, 1);
> -	}
> -
> +	if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
> +		dpu_crtc_setup_lm_misr(crtc_state);
> +	else
> +		ret = -EINVAL;
>   
>   cleanup:
>   	drm_modeset_unlock(&crtc->mutex);
> @@ -174,26 +184,17 @@ static u32 dpu_crtc_get_vblank_counter(struct drm_crtc *crtc)
>   	return dpu_encoder_get_vsync_count(encoder);
>   }
>   
> -
> -static int dpu_crtc_get_crc(struct drm_crtc *crtc)
> +static int dpu_crtc_get_lm_crc(struct drm_crtc *crtc,
> +		struct dpu_crtc_state *crtc_state)
>   {
> -	struct dpu_crtc_state *crtc_state;
>   	struct dpu_crtc_mixer *m;
>   	u32 crcs[CRTC_DUAL_MIXERS];
>   
> -	int i = 0;
>   	int rc = 0;
> -
> -	crtc_state = to_dpu_crtc_state(crtc->state);
> +	int i;
>   
>   	BUILD_BUG_ON(ARRAY_SIZE(crcs) != ARRAY_SIZE(crtc_state->mixers));
>   
> -	/* Skip first 2 frames in case of "uncooked" CRCs */
> -	if (crtc_state->crc_frame_skip_count < 2) {
> -		crtc_state->crc_frame_skip_count++;
> -		return 0;
> -	}
> -
>   	for (i = 0; i < crtc_state->num_mixers; ++i) {
>   
>   		m = &crtc_state->mixers[i];
> @@ -214,6 +215,22 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
>   			drm_crtc_accurate_vblank_count(crtc), crcs);
>   }
>   
> +static int dpu_crtc_get_crc(struct drm_crtc *crtc)
> +{
> +	struct dpu_crtc_state *crtc_state = to_dpu_crtc_state(crtc->state);
> +
> +	/* Skip first 2 frames in case of "uncooked" CRCs */
> +	if (crtc_state->crc_frame_skip_count < 2) {
> +		crtc_state->crc_frame_skip_count++;
> +		return 0;
> +	}
> +
> +	if (crtc_state->crc_source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
> +		return dpu_crtc_get_lm_crc(crtc, crtc_state);
> +
> +	return -EINVAL;
> +}
> +
>   static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
>   					   bool in_vblank_irq,
>   					   int *vpos, int *hpos,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index b8785c394fcc..20df23fe74ed 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -201,6 +201,8 @@ struct dpu_crtc {
>    * @mixers        : List of active mixers
>    * @num_ctls      : Number of ctl paths in use
>    * @hw_ctls       : List of active ctl paths
> + * @crc_source    : CRC source
> + * @crc_frame_skip_count: Number of frames skipped before getting CRC
>    */
>   struct dpu_crtc_state {
>   	struct drm_crtc_state base;


-- 
With best wishes
Dmitry
