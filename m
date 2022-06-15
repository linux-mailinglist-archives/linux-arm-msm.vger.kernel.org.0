Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7F6B54C7DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jun 2022 13:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347417AbiFOLvL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jun 2022 07:51:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346821AbiFOLvI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jun 2022 07:51:08 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8258B4F1DF
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 04:51:00 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id y32so18504762lfa.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 04:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WO0nwIuovSMeFOh147VxfsRiP5jPmKwXeiabGncRUA4=;
        b=uCL41/ysCSOyXoQAz1ufqI209ZJM4qxeQjipG4DG7UySSHPWw0AsYR4vrWSlngpCB2
         dz5L61Ar4irJAUus4KHWAT7uZWuRv1WpsVHybi2/yefeHrORC6pi0+QMdGjyo7je/+ax
         LnpzkTi399ciawKc2eMYFSZt45O9u5vKQVjBqJcXCp4y0Z3ljAQPK8qGXBc301lMNVB1
         mX6UzLrW6X7dTWPx16KvcchRUnr+38U/jcnaIjgh6DNGkM5yEq8d8wPFMz6aQtxGjAAm
         ShTLjb3hUSkNaU7l+CuYvIJfKAlPYlwy+ezUiPC3cWYZ2neZfzx6uyglFfSWgQM78xvd
         p3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WO0nwIuovSMeFOh147VxfsRiP5jPmKwXeiabGncRUA4=;
        b=tQdoFLqildecqnFrODAwkWbVBBXtN7xmI4M3ghGBbMO51yfbz2jdFf0B3fdpgHYLv6
         3hRu9kTNQ9hRxbVAOLEcYB2Hh099dFRtoL6KBVbt4+nYHOSzzaRJbdoMGJl+ZMHVJUGE
         ha4ysE8/6+47pCRy9R3jzHMj5q1yaEBfFzGzFn9gDf55VUezL7aPi69MuCYe02JfDpdy
         zqaVz5nyCBQ6SXB5QjQqSuv+kc+xvSRxkKnY7N6Udo0YLs8vbSbkDJ+yCz4HqX2YIcDJ
         AsL6jniguRyUtEMPbI7QymvfVh+YcwHGnmrrTlQktesXxQtzzOyTA2O7jNl5mX/tJvBJ
         tV+g==
X-Gm-Message-State: AJIora+9MFcx7IUpXq4aMNruR3RBtNRFO23AcaqOFnKv3r+2DPfJJ0ia
        juGR89JLSmYpIle//VpfWpk9bQ==
X-Google-Smtp-Source: AGRyM1swwvjJTFIH/fHV1BdTuQ04yWwfcyDf1MvWtGNhk/I3H1OLQsh1eJj6aqcsEoVFyStGWhM5Vg==
X-Received: by 2002:ac2:48ab:0:b0:47d:af82:65e9 with SMTP id u11-20020ac248ab000000b0047daf8265e9mr5660443lfg.673.1655293858825;
        Wed, 15 Jun 2022 04:50:58 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 27-20020ac24d5b000000b00478ee191091sm1767031lfp.153.2022.06.15.04.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 04:50:58 -0700 (PDT)
Message-ID: <576379dd-e5b0-3363-07a1-c623aeea6fee@linaro.org>
Date:   Wed, 15 Jun 2022 14:50:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 3/4] drm/msm/disp/dpu1: use atomic enable/disable
 callbacks for encoder functions
Content-Language: en-GB
To:     Vinod Polimera <quic_vpolimer@quicinc.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        dianders@chromium.org, krzysztof.kozlowski@canonical.com,
        thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com,
        quic_vproddut@quicinc.com
References: <1645455086-9359-1-git-send-email-quic_vpolimer@quicinc.com>
 <1645455086-9359-4-git-send-email-quic_vpolimer@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1645455086-9359-4-git-send-email-quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/02/2022 17:51, Vinod Polimera wrote:
> Use atomic variants for encoder callback functions such that
> certain states like self-refresh can be accessed as part of
> enable/disable sequence.
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> 
> Changes in v2:
> - As per review suggestion by Dmitry.
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1e648db..6eac417 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1138,7 +1138,8 @@ void dpu_encoder_virt_runtime_resume(struct drm_encoder *drm_enc)
>   	mutex_unlock(&dpu_enc->enc_lock);
>   }
>   
> -static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
> +static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc,
> +				struct drm_atomic_state *state)
>   {
>   	struct dpu_encoder_virt *dpu_enc = NULL;
>   	int ret = 0;
> @@ -1176,7 +1177,8 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
>   	mutex_unlock(&dpu_enc->enc_lock);
>   }
>   
> -static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
> +static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc,
> +				struct drm_atomic_state *state)
>   {
>   	struct dpu_encoder_virt *dpu_enc = NULL;
>   	struct msm_drm_private *priv;
> @@ -2094,8 +2096,8 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
>   
>   static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
>   	.mode_set = dpu_encoder_virt_mode_set,
> -	.disable = dpu_encoder_virt_disable,
> -	.enable = dpu_encoder_virt_enable,
> +	.atomic_disable = dpu_encoder_virt_disable,
> +	.atomic_enable = dpu_encoder_virt_enable,

A small nit before you post the next iteration of PSR:

Please rename these functions to follow atomic_enable/atomic_disable names.

>   	.atomic_check = dpu_encoder_virt_atomic_check,
>   };
>   


-- 
With best wishes
Dmitry
