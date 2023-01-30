Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BA13681964
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jan 2023 19:37:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238330AbjA3Shr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Jan 2023 13:37:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238182AbjA3ShP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Jan 2023 13:37:15 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2DD32D74
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 10:36:37 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id v13so11873966eda.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 10:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cZhLOD9IjFhT2rw5mFVQaRWDwbDZlqozjoeDC3b7Esw=;
        b=N1dmJr/r8/XSvyoUxRNc2HjR0kOQkzvm2Ls4s4KX7nE03ug0BnSqPpeXukRW1nGVGO
         mUNRdd4Pgm344uL3hROdKa9/JQoe/K9mDXJEiqYLeKq64hBwquTI6wAy7No2AYzt8VYp
         f/43I6o4AvhVx/LkESOysg0UhYz9vKsX4N5uF2J46mZTTLdCfLSDC9xTGSu7WRvCebeG
         7rdw9mYyXqXClvmJkPy845MjgFT8wMU6Hn3UJKSpJ7bMMJIBGwEwRSmgIjY+AyKb5H8A
         mX3OQI4Nl6yFKOvE9PV46OQ4XGBvUib7ghHLBkTf81y6X3LJ+/c0Gno1SfrdAIyOyca6
         N6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cZhLOD9IjFhT2rw5mFVQaRWDwbDZlqozjoeDC3b7Esw=;
        b=xRRx/d0cKP1I86Y7cYWssI/DT0gln4/Dj4YEaTZ/y3xwP0BJf9wqamfmjJ2mPGaLL7
         pcRZj7K7TbbGWkK7AHsQPLl2dj7GBccCu7UzOPtf/cLBPVxFJ+X3I/acL/iEllXbQNsv
         nBPfHzqkV5w2Q/+5SJ5pU5OMp8sOWhx9c8FNlYrG3Ma37fVZDp7+Uk9r8b1HvMzQdzep
         TuqZw3mtOjdfYwTLmnqyCweusW0y/txG86PDEUz6U0/gnJW8JBkaZt57/90TqZQacdax
         FIMNMD4tgBdlTjBWIn61gj01N6/YadQluGIb+mCvuIB0+GOuzFGF7gV6EP3A/CJdWrhK
         SXMQ==
X-Gm-Message-State: AFqh2koh7DkxdAbdUEn1KUqz9A8jn3hDdnBfhxIvcYnLXr0gVRYlV7Wz
        TlY1Jj2iSQMGQA+UrzeU4ZzCJQ==
X-Google-Smtp-Source: AMrXdXvR5Q6KvIhrUEwYGvqNhBkWgrUuFEJSdmc3ZGDzFQa57T8TClhZRDJYjAW55lqTmNIGI4NywQ==
X-Received: by 2002:a05:6402:298e:b0:496:6a20:6b61 with SMTP id eq14-20020a056402298e00b004966a206b61mr57790399edb.22.1675103796373;
        Mon, 30 Jan 2023 10:36:36 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id fd22-20020a056402389600b004a1d4142543sm5937753edb.27.2023.01.30.10.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 10:36:35 -0800 (PST)
Message-ID: <e9b238af-28dd-f38e-24e3-4065c39d4e25@linaro.org>
Date:   Mon, 30 Jan 2023 20:36:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [v1 2/3] drm/msm/disp/dpu1: add dspps into reservation if there
 is a ctm request
Content-Language: en-GB
To:     Kalyan Thota <quic_kalyant@quicinc.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, robdclark@chromium.org,
        dianders@chromium.org, swboyd@chromium.org,
        quic_vpolimer@quicinc.com, quic_abhinavk@quicinc.com,
        marijn.suijten@somainline.org
References: <1675092092-26412-1-git-send-email-quic_kalyant@quicinc.com>
 <1675092092-26412-3-git-send-email-quic_kalyant@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1675092092-26412-3-git-send-email-quic_kalyant@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/01/2023 17:21, Kalyan Thota wrote:
> Add dspp blocks into the topology for reservation, if there is a ctm
> request for that composition.
> 
> Changes in v1:
> - Minor nits (Dmitry)
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 9c6817b..3bd46b4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -545,7 +545,8 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>   static struct msm_display_topology dpu_encoder_get_topology(
>   			struct dpu_encoder_virt *dpu_enc,
>   			struct dpu_kms *dpu_kms,
> -			struct drm_display_mode *mode)
> +			struct drm_display_mode *mode,
> +			struct drm_crtc_state *crtc_state)
>   {
>   	struct msm_display_topology topology = {0};
>   	int i, intf_count = 0;
> @@ -573,11 +574,9 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   	else
>   		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
>   
> -	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
> -		if (dpu_kms->catalog->dspp &&
> -			(dpu_kms->catalog->dspp_count >= topology.num_lm))
> -			topology.num_dspp = topology.num_lm;
> -	}
> +	if (dpu_kms->catalog->dspp &&
> +	    crtc_state->ctm && (dpu_kms->catalog->dspp_count >= topology.num_lm))

This condition doesn't look correct anymore for the following reasons:
- if there are no DSPPs we will completely ignore the ctm property
- if there are not enough DSPPs, the CTM property will be ignore

I think, this should be just:

if (crtc_state->ctm)
     topology.num_dspp = topology.num_lm;




> +		topology.num_dspp = topology.num_lm;
>   
>   	topology.num_enc = 0;
>   	topology.num_intf = intf_count;
> @@ -643,7 +642,7 @@ static int dpu_encoder_virt_atomic_check(
>   		}
>   	}
>   
> -	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
> +	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
>   
>   	/* Reserve dynamic resources now. */
>   	if (!ret) {

-- 
With best wishes
Dmitry

