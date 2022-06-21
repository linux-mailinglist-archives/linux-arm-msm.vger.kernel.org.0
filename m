Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1D45539F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jun 2022 21:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231897AbiFUTAJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jun 2022 15:00:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245194AbiFUTAG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jun 2022 15:00:06 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EA832A268
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 12:00:04 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id t25so23906190lfg.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 12:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6fjMjr211YE9YcIQWwQaRZfIoF2o601X8To7eThZCiA=;
        b=JC/7niSPsJ0iKH+blG56YnE5G8oObtz7l5leDaLqSh1cPQixTKplCxrdd6G5g0aCag
         ixPCy7kMe/0pzU2aQ0dSVUnlBbp1lnHQrzXmbQfwZnxVwPyY4r3Elt3DOTISgMjM5l4D
         c773jMp0cVHVMoQWtthfGuCQX7clEaIhibW59mF2OazXxSZ7IhW8GNCEw3J4IRvE3jJy
         f3O8GvAkQBucJFFCDfXE4dsUauvHpp4s+Z1Ue5YbYAw7cf5p1pg0uEO1CoiQKxoqR9os
         ho0sxgdf13ftuAcYlpBffww6hUkLPUTj/zckqHgBQFhZClC94l07Q5bnPIJW62C9Fw90
         yHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6fjMjr211YE9YcIQWwQaRZfIoF2o601X8To7eThZCiA=;
        b=0n3M7eh5phwYxajEUO0yCYSewk5IgkXiRKgELMY2bFGLVQT7dplMXyGyBx2FYcYONv
         oBhkVKmELFXRQHmgzgH/7j3h8hY2Ogv93yP80codQbR6xgEE091AU8cYpD69lZwI+hSp
         q7wLwHZfV2teR86NNYl2dAkkLjmNdamu4agFGk1DvbFg2i1JvlNOTCm/8TJI1HxqC4wM
         uZEOFNngH0K2Y7Y7af94EFCKcuhZDdbqby0rakRGPGUEWf+keRKy6ja4q5hnBqSvJBYf
         9RP9Dd15opoDmkW2uTcG0gOqqThI8q8Ty8dPr3JdtxPtSWwk11hUKRgb6HJ6DN6HPG8V
         sDLg==
X-Gm-Message-State: AJIora9bz5356OyhSb8w9aUK8cJclDvuJKu8c0hwN0F5GuusVG9abzRA
        9zsrPs8vGSH+MNP3HS8RMFTL2Q==
X-Google-Smtp-Source: AGRyM1tTwTGocDhWlMkEi3nkgXGoxnkT2ptk3Q/PpeJxeI6Wy1TAEbaq/L9tcVznRBBHUDnp7PiDpQ==
X-Received: by 2002:a19:5214:0:b0:47f:8f4e:9829 with SMTP id m20-20020a195214000000b0047f8f4e9829mr1025330lfb.161.1655838002612;
        Tue, 21 Jun 2022 12:00:02 -0700 (PDT)
Received: from [192.168.43.7] ([188.162.64.230])
        by smtp.gmail.com with ESMTPSA id s25-20020a2e2c19000000b0024f3d1daed6sm2104748ljs.94.2022.06.21.12.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jun 2022 12:00:02 -0700 (PDT)
Message-ID: <043d02d3-e03e-f19d-4692-237c43236744@linaro.org>
Date:   Tue, 21 Jun 2022 22:00:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [v3 4/5] drm/msm/disp/dpu1: use atomic enable/disable callbacks
 for encoder functions
Content-Language: en-GB
To:     Vinod Polimera <quic_vpolimer@quicinc.com>, y@qualcomm.com,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, swboyd@chromium.org,
        quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com
References: <y> <1655808800-3996-1-git-send-email-quic_vpolimer@quicinc.com>
 <1655808800-3996-5-git-send-email-quic_vpolimer@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1655808800-3996-5-git-send-email-quic_vpolimer@quicinc.com>
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

On 21/06/2022 13:53, Vinod Polimera wrote:
> Use atomic variants for encoder callback functions such that
> certain states like self-refresh can be accessed as part of
> enable/disable sequence.
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 52516eb..cc2809b 100644
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
> @@ -2332,8 +2334,8 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
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
