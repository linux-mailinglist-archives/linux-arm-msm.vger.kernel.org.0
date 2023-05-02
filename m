Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D7966F4BDE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 23:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjEBVFO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 17:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbjEBVFE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 17:05:04 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 055AC271C
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 14:04:36 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2a8b082d6feso42674721fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 14:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683061464; x=1685653464;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oBLFdaKmCg1pFOohSkXs6ozX+GQqHHNXM3HNYRTNy9E=;
        b=je7EZqDDDlFkI8s3uJHYp/bvQvOhY6F/EGOon90W6griJdYUIAbJgT+Eqx+KF9P0iG
         bMSbW8rrY+UYjX3FQvsOh8R0u6BdvBpGb+dGgm6scHjN3DHJ6i1TSBTVBgpLmMsJCdD2
         JclcXVMqnoOVn8D9Pmw37bB0OUK2RdO2EH6QJwFmOXxn7iBaSnQW9X2tUzYQJxqcsrIV
         2rzMGyX73m4Vpn4ZCzwaCNqAvhZvwOCc7rz1wRN05SzdmBPzL0QOrr6sRQpgTFMBcmv8
         X04JRNE8Z8LiZ6NUDOozFH8sd/iML/URqb+SzpcWYPJlp05q03dru7ZjE4s9mBcY8cLd
         apNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683061464; x=1685653464;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oBLFdaKmCg1pFOohSkXs6ozX+GQqHHNXM3HNYRTNy9E=;
        b=VlPkA3mGTClqIIBg0CYuDSt+X/IwjS5lD8guXr9LjeleYJzS9/sBCBvXMlwO1I4Mt8
         UMQXerf0gmTnE+EDchC/+cKZ41swny50mk1i4AXkoyJH3rE8Wl2m8SiH58H99pZAb8ig
         z3i4T5KAp12URaDtaAUwTFZZU9kqf4mR5kO4VW5V0tn8XoDMO5mf68zD7wXvqQXCVr9D
         45yxNviJBY/jkD6xnli1dVmX4N8rPaocQloiO7SJgpi+L+XvYEfUa+daAyAHBjQcMiB9
         z7UVyanjt1Drff5f/fQU3b7vKrNoaxqN5MVBhr0vUKxOqIcZSZkPsMVtESxoVkQ1OOpW
         28Kw==
X-Gm-Message-State: AC+VfDyMnMfOhnxVx247wPiu879h8WPvB2z9leLr1G0id9YSYHh/mklz
        UtWuj/TWenwXmzNXG0PkcKXTwg==
X-Google-Smtp-Source: ACHHUZ64913t++7n8QCPzET9+k3buFpx5YLFz8jgRUwxrnycsuZbTjFm2im7jOnudne+k8pVoE55fw==
X-Received: by 2002:a2e:8501:0:b0:2a9:f8fd:49ff with SMTP id j1-20020a2e8501000000b002a9f8fd49ffmr5241630lji.17.1683061464171;
        Tue, 02 May 2023 14:04:24 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id x9-20020a2e9c89000000b002a774fb7923sm5556950lji.45.2023.05.02.14.04.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 14:04:23 -0700 (PDT)
Message-ID: <6dd9e733-d5ce-279a-b060-b60740466037@linaro.org>
Date:   Wed, 3 May 2023 00:04:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/7] drm/msm/dpu: drop dpu_encoder_early_unregister
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
 <20230430235732.3341119-3-dmitry.baryshkov@linaro.org>
 <81d97939-1369-9a2d-01bb-ad8c8a4b7e5c@quicinc.com>
 <CAA8EJprD6biRhcx5pAJvb4Jfz_L-88_=zeySReN2Y5Nrtq+_Lw@mail.gmail.com>
 <1953c899-b034-52d7-9ff0-914ca0bb5196@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1953c899-b034-52d7-9ff0-914ca0bb5196@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/05/2023 23:59, Abhinav Kumar wrote:
> 
> 
> On 5/2/2023 1:54 PM, Dmitry Baryshkov wrote:
>> On Tue, 2 May 2023 at 23:45, Abhinav Kumar <quic_abhinavk@quicinc.com> 
>> wrote:
>>>
>>>
>>>
>>> On 4/30/2023 4:57 PM, Dmitry Baryshkov wrote:
>>>> There is no need to clean up debugfs manually, it will be done by the
>>>> DRM core on device deregistration.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>
>>> There are two reasons to have the debugfs removed in the 
>>> early_unregister:
>>>
>>> 1) Today, registration happens in late_register(), hence to balance the
>>> the call in _dpu_encoder_init_debugfs(), this one is present.
>>>
>>> 2) In drm_modeset_register_all(), if drm_connector_register_all() fails,
>>> it calls drm_encoder_unregister_all() first which calls 
>>> early_unregister().
>>>
>>> So to balance these out, dont we need to keep it?
>>
>> Please correct me if I'm wrong, drm_debugfs_cleanup() should take care 
>> of that.
>>
> 
> Not from what I am seeing, drm_debugfs_cleanup() is getting called from 
> the error handling path of drm_dev_register() and separately from 
> drm_dev_unregister() but not from the error handling path of 
> drm_modeset_register_all().
> 
> So that case will be unbalanced with this change.

But for the practical reasons the drm_modeset_register_all() can not 
fail. But I see your point. I'll check why drm_dev_register() doesn't 
respect an error return from drm_modeset_register_all(). Until that 
point we can drop this patch.

> 
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 8 --------
>>>>    1 file changed, 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> index 32785cb1b079..8c45c949ec39 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> @@ -2154,13 +2154,6 @@ static int dpu_encoder_late_register(struct 
>>>> drm_encoder *encoder)
>>>>        return _dpu_encoder_init_debugfs(encoder);
>>>>    }
>>>>
>>>> -static void dpu_encoder_early_unregister(struct drm_encoder *encoder)
>>>> -{
>>>> -     struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
>>>> -
>>>> -     debugfs_remove_recursive(dpu_enc->debugfs_root);
>>>> -}
>>>> -
>>>>    static int dpu_encoder_virt_add_phys_encs(
>>>>                struct msm_display_info *disp_info,
>>>>                struct dpu_encoder_virt *dpu_enc,
>>>> @@ -2374,7 +2367,6 @@ static const struct drm_encoder_helper_funcs 
>>>> dpu_encoder_helper_funcs = {
>>>>    static const struct drm_encoder_funcs dpu_encoder_funcs = {
>>>>                .destroy = dpu_encoder_destroy,
>>>>                .late_register = dpu_encoder_late_register,
>>>> -             .early_unregister = dpu_encoder_early_unregister,
>>>>    };
>>>>
>>>>    struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>>

-- 
With best wishes
Dmitry

