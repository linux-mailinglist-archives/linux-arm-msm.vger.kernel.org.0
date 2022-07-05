Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C1FF567755
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 21:08:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbiGETHf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 15:07:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbiGETHe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 15:07:34 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D03B020BF7
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 12:07:32 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id bu42so2314993lfb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 12:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DnKgC9sCIW8SXV8tcHv5kUM+QyY61ZZmZlUgZGKqW+Q=;
        b=f/FCG8yL4VOOTwO2rnIiAtzXPtS2mVuAe+XTDCGyoCaarSkKazd9ayjVL9aKwDZEip
         Hge9vP9wx1uromYafvl/X1WbtDWoqQwJnSDDRxWvUYlJk7/IIEJgwqm6L3kqIUNJRVXX
         uH/+Gtcyq+X8WA/OER4Gr1j9Xrklt89C6BCC/GQWhxSjmXDltPe22Ol/338WWA7Fl5+g
         XFQXG7OOJrZXEVFAN9NOP0/LHeBthQ6EAglyrN8O6uI49AJsVBkOrwzfWnK7nEum83As
         Xz4GajFeK/h1ezkCi5IQaNzhJeYb6oFeg8EpZXxgwaPX2TaoAoop/DKEfKssARrc3hJ2
         r2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DnKgC9sCIW8SXV8tcHv5kUM+QyY61ZZmZlUgZGKqW+Q=;
        b=8LNVjjo5ZBvsHDbmOmoG4llDjy+X7GZk+/cIT3CIe8ZxawFKyil0w5ZlsGkdtZtJAu
         jupPSGsOZJVs8QdOV0hwvb/OjdDVlW9+s405QGBa4g3200OzpVWEDwWG2johsd9Lm4D2
         XjuEjojgIjTGbDqgrOkB41SzfNsTGvYXVi0kEZfMPxxqHNFhsKrGERdfu1OI7N2oLzXA
         8DdVB7ivE6QHJj8EZdMgRH2516aUxlBRFwS7XGgjG8vS8q7cdESIy7AsuzO8Ra8Ku1EI
         fPdD10N0Y4E0t8pth0FrwF+r+Zyie2Oy2GxcMU2y9ckNk8dG+gbyWUKnESuvvTata0QJ
         O0cw==
X-Gm-Message-State: AJIora+UQaSaSdq0RUTESLMzCKKzESlpYAi+0D14H6oL54R3RGB1LqWa
        PAqhMToo8/PgRsBkr9asXgAdMQ==
X-Google-Smtp-Source: AGRyM1t0tljF3Ij4/4tcLOFFrqAsln9WIHlzzxsMkGOGWMfiIex4lo9Ypf2AWIcnRF1E4mgEv9Udkw==
X-Received: by 2002:a05:6512:22c3:b0:47f:9396:861a with SMTP id g3-20020a05651222c300b0047f9396861amr24766566lfu.230.1657048051185;
        Tue, 05 Jul 2022 12:07:31 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id bj11-20020a2eaa8b000000b0025a72db0cf1sm5733629ljb.118.2022.07.05.12.07.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 12:07:30 -0700 (PDT)
Message-ID: <14283b06-d8d3-aa4c-6db8-eb34e597bef8@linaro.org>
Date:   Tue, 5 Jul 2022 22:07:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 6/7] drm/msm/disp/dpu1: use atomic enable/disable
 callbacks for encoder functions
Content-Language: en-GB
To:     Vinod Polimera <quic_vpolimer@quicinc.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, swboyd@chromium.org,
        quic_kalyant@quicinc.com, quic_khsieh@quicinc.com,
        quic_vproddut@quicinc.com, bjorn.andersson@linaro.org,
        quic_aravindh@quicinc.com, quic_abhinavk@quicinc.com,
        quic_sbillaka@quicinc.com
References: <1657040445-13067-1-git-send-email-quic_vpolimer@quicinc.com>
 <1657040445-13067-7-git-send-email-quic_vpolimer@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1657040445-13067-7-git-send-email-quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/07/2022 20:00, Vinod Polimera wrote:
> Use atomic variants for encoder callback functions such that
> certain states like self-refresh can be accessed as part of
> enable/disable sequence.
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

No. Your sign off should be the last tag here. Also there should be no 
blank lines between tags.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 5629c0b..f01a976 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1130,7 +1130,8 @@ void dpu_encoder_virt_runtime_resume(struct drm_encoder *drm_enc)
>   	mutex_unlock(&dpu_enc->enc_lock);
>   }
>   
> -static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
> +static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
> +					struct drm_atomic_state *state)
>   {
>   	struct dpu_encoder_virt *dpu_enc = NULL;
>   	int ret = 0;
> @@ -1166,7 +1167,8 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
>   	mutex_unlock(&dpu_enc->enc_lock);
>   }
>   
> -static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
> +static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
> +					struct drm_atomic_state *state)
>   {
>   	struct dpu_encoder_virt *dpu_enc = NULL;
>   	int i = 0;
> @@ -2320,8 +2322,8 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
>   
>   static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
>   	.atomic_mode_set = dpu_encoder_virt_atomic_mode_set,
> -	.disable = dpu_encoder_virt_disable,
> -	.enable = dpu_encoder_virt_enable,
> +	.atomic_disable = dpu_encoder_virt_atomic_disable,
> +	.atomic_enable = dpu_encoder_virt_atomic_enable,
>   	.atomic_check = dpu_encoder_virt_atomic_check,
>   };
>   


-- 
With best wishes
Dmitry
