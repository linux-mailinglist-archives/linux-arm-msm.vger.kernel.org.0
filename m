Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48CDE5367AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 May 2022 21:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353410AbiE0Trg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 May 2022 15:47:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbiE0Trf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 May 2022 15:47:35 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B79022509
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 May 2022 12:47:34 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id x2so17485ljd.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 May 2022 12:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wuAxaZDd4y0p9tJ4fguDi52Du2Ff8iZuCmBrpz3QpsA=;
        b=sHTGR+r6Ea4+m1K25WerAF1x59b3gM+v81nJdmdsWI8C+hZ7c4CXHGU7zxzzXvKkFH
         H7YPhOWRNae4IAN1NXD1GNmFfc8SHHho2FeFSVKQrsVBwexDCeEDpFTTwaIVRlu8gXv9
         8zo7OXeVcyO8a2sBDuWz1KGwzqtz35JDUprOi5x6sJqR3GFOWYu/O+92NwDh1PK77F6g
         uQMX0dRxrnAqAzBMde0tfBg2k7pFjWrpShLvXs9DGLxacJXMvUNhHaHMxooUoCQf57kF
         til9jtFk/j87OwaOKPGDP9fcSpyxeF1oAbTCfvBkIOJLFIM4WE4FKbYnrH/RHEw5oagZ
         E1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wuAxaZDd4y0p9tJ4fguDi52Du2Ff8iZuCmBrpz3QpsA=;
        b=Z5BL+ap0DQwWgnc5oV2ORJrmDCP5N2S00UaThWTdIDvwQfLGMV5HRfhec86tTqwohm
         eyEiF0FRG9VQs2D9AGy8y55Egj5uw/h5lPgEKnJrzrRV220b6deBKBgVdHM7YaidpcLs
         EC3u4qjXWIo2f9XMjGxCXEtLejPgU5m24sAwqRHH2JxSqGvhK2RCGfVC4QXKv/7TFrax
         n6jjjAxKPQl6TWUUcUd18OCd6v+z/raaBNfWdmo2/3vmW3p4bDl9NBw8UEsao1fMiVNB
         NQ5C8p470m+lAlqxizEkAi6w/8R6/dMgwr4UFxnSv8AjB60UU588jyTauWUCsRP1961h
         qCLw==
X-Gm-Message-State: AOAM532lpjHFyk+7bEbGPC4vgaacah+PWUcFLr7lozzT0GkmL8GLxIq0
        YbzWn5KV31DrsdggB6XMR5NOJA==
X-Google-Smtp-Source: ABdhPJxI3AglKL9KDFn9Ix3elldmPRd3UYkGfwoYxeGEtsGzr8W567eNqquynSQs4568brVfnLOmPA==
X-Received: by 2002:a2e:9b97:0:b0:253:eb92:3440 with SMTP id z23-20020a2e9b97000000b00253eb923440mr15777786lji.316.1653680852564;
        Fri, 27 May 2022 12:47:32 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s8-20020ac25fa8000000b0047255d21122sm998093lfe.81.2022.05.27.12.47.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 May 2022 12:47:32 -0700 (PDT)
Message-ID: <65dc917f-cf34-f090-0f74-f3497678510d@linaro.org>
Date:   Fri, 27 May 2022 22:47:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/3] drm/msm/dpu: Move LM CRC code into separate method
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        quic_aravindh@quicinc.com, quic_abhinavk@quicinc.com
References: <20220527185407.162-1-quic_jesszhan@quicinc.com>
 <20220527185407.162-2-quic_jesszhan@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220527185407.162-2-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/05/2022 21:54, Jessica Zhang wrote:
> Move layer mixer-specific section of dpu_crtc_get_crc() into a separate
> helper method. This way, we can make it easier to get CRCs from other HW
> blocks by adding other get_crc helper methods.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 72 +++++++++++++++---------
>   1 file changed, 44 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index b56f777dbd0e..ae09466663cf 100644
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
> @@ -146,16 +162,8 @@ static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
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
>   
>   cleanup:
>   	drm_modeset_unlock(&crtc->mutex);
> @@ -174,34 +182,24 @@ static u32 dpu_crtc_get_vblank_counter(struct drm_crtc *crtc)
>   	return dpu_encoder_get_vsync_count(encoder);
>   }
>   
> -
> -static int dpu_crtc_get_crc(struct drm_crtc *crtc)
> +static int dpu_crtc_get_lm_crc(struct drm_crtc *crtc, struct dpu_crtc_state *crtc_state)
>   {
> -	struct dpu_crtc_state *crtc_state;
> -	struct dpu_crtc_mixer *m;
> +	struct dpu_crtc_mixer *lm;
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
> -		m = &crtc_state->mixers[i];
> +		lm = &crtc_state->mixers[i];
>   
> -		if (!m->hw_lm || !m->hw_lm->ops.collect_misr)
> +		if (!lm->hw_lm || !lm->hw_lm->ops.collect_misr)
>   			continue;
>   
> -		rc = m->hw_lm->ops.collect_misr(m->hw_lm, &crcs[i]);
> +		rc = lm->hw_lm->ops.collect_misr(lm->hw_lm, &crcs[i]);
>   
>   		if (rc) {
>   			if (rc != -ENODATA)
> @@ -214,6 +212,24 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
>   			drm_crtc_accurate_vblank_count(crtc), crcs);
>   }
>   
> +static int dpu_crtc_get_crc(struct drm_crtc *crtc)
> +{
> +	struct dpu_crtc_state *crtc_state;
> +
> +	crtc_state = to_dpu_crtc_state(crtc->state);
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
> +	return 0;
> +}
> +
>   static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
>   					   bool in_vblank_irq,
>   					   int *vpos, int *hpos,


-- 
With best wishes
Dmitry
