Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71EC372CE74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 20:32:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237380AbjFLSc2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 14:32:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237925AbjFLScN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 14:32:13 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EDE9E73
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 11:31:46 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f658a17aa4so4658212e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 11:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686594690; x=1689186690;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XScVbvMK8naiq0WTQIyZPP97RsyuNHqZwVMoGP97o5I=;
        b=UL8wGAiHFpspgFWVPIC0nU0QpvUaEHcg+2Ygbs7vNWxZ9Zf3d5+FQoO+Z5cHekGUHy
         98FUx/OgyUk2/m9VYQDEEfBuEhraR9o4VBzptOi+BHY7itqX2NIMwCbj34K7QCPMLVol
         wkAqVWLdT0fZlYAZXyUwoTiN2jFeS5WRJY4XhJVws26Nc3pwNH7Dt7PXM0+UwyuW82Nt
         3VS2gZyriZ5HWgqBohkvultVQAGsC/WFNLFbAzOmWsDnPFdMMdNRSYv2sn1qLbBKXfHI
         733k8S0uuHDVmu6+mxburjR13jbtyshpV5+Uqh84OJoqJkIHolm6adstRDJOg5AUTHg6
         Xfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686594690; x=1689186690;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XScVbvMK8naiq0WTQIyZPP97RsyuNHqZwVMoGP97o5I=;
        b=fBtVZA6Sc5owRVUMHZoCbFX53EiZtBXsJXdYprNUKMC0IKCHMpN7bxoTV+u7O5V4D6
         3wPhUyg8aRESHBVUdmc66VBIP/xOdTqfB9Ksbg5jFF8mYiRHbUewSA+Nr1+ILufZwd++
         M14+qalWvbnUxjbUJWOuWgVi0VJ7zOwUbZgk1WKQLtwMAoTV3PmfAUjFyiMmvS12vawa
         vdpEW/W+b49ybpEmKjCdjAOrTdQ1zyJXIXJcwhf/DVmQuYJpYxVz228NMG0LjT9+EBy/
         ZwguwahlKM6wruD9Ny4AkY19AysoJIyI/lZdpbJoawFSqPSX9HQwpJATrrb/iooUeMWn
         mrgg==
X-Gm-Message-State: AC+VfDzdXiwC9k1LcTq76Es7op/99HtPEQXQ5VaTnYnbXXRz2tqGB7X5
        uWgNqoBI3mNX2YoSX0uICNiUjA==
X-Google-Smtp-Source: ACHHUZ4b1RUTPh0Ggn4dXQBeKT4VaRmUAQXrBywLquAONrI0hsDwjVR9+5xRYBXEbaibQOUmrg4u/A==
X-Received: by 2002:a05:6512:61c:b0:4f3:b242:aa90 with SMTP id b28-20020a056512061c00b004f3b242aa90mr4987547lfe.35.1686594690582;
        Mon, 12 Jun 2023 11:31:30 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id w26-20020a19c51a000000b004edb8fac1cesm1496335lfe.215.2023.06.12.11.31.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 11:31:30 -0700 (PDT)
Message-ID: <14662d77-8a3b-b3c6-2250-5909608b8a37@linaro.org>
Date:   Mon, 12 Jun 2023 21:31:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] drm/msm: provide fb_dirty implemenation
Content-Language: en-GB
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     freedreno@lists.freedesktop.org,
        Degdag Mohamed <degdagmohamed@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Bjorn Andersson <andersson@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org
References: <20230612031616.3620134-1-dmitry.baryshkov@linaro.org>
 <aenzh4vscayeqvyjpbxifog7l3yuxv5lh5cizcie7dk7awx5z7@nuajlsildlw6>
 <1aaf5a23-541b-527d-25c3-55c94452390e@suse.de>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1aaf5a23-541b-527d-25c3-55c94452390e@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/06/2023 13:48, Thomas Zimmermann wrote:
> Hi
> 
> Am 12.06.23 um 11:14 schrieb Marijn Suijten:
>> On 2023-06-12 06:16:15, Dmitry Baryshkov wrote:
>>> Since commit 93e81e38e197 ("drm/fb_helper: Minimize damage-helper
>>> overhead") the drm_fb_helper_funcs::fb_dirty helper is required for
>>> proper dirty/damage processing. The drm/msm driver requires that to
>>> function to let CMD panels to work. Use simplified version of
>>> drm_fbdev_generic_helper_fb_dirty() to fix support for CMD mode panels.
>>>
>>> Reported-by: Degdag Mohamed <degdagmohamed@gmail.com>
>>> Fixes: 93e81e38e197 ("drm/fb_helper: Minimize damage-helper overhead")
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> Thanks, this solves the following warning:
>>
>>      msm_dpu ae01000.display-controller: 
>> drm_WARN_ON_ONCE(!helper->funcs->fb_dirty)
>>      WARNING: CPU: 0 PID: 9 at drivers/gpu/drm/drm_fb_helper.c:381 
>> drm_fb_helper_damage_work+0x1c0/0x20c
>>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>>
>> Note that drm_fb_helper_funcs documents this as "This callback is
>> optional": is it no longer optional, or are we enabling a damage feature
>> that makes it not-optional?
> 
> It is optional in the sense that most hardware and drivers don't require 
> damage handling. Those that do, also require this callback.

Can we please get this documented? I think it was really optional 
beforehand.

> 
> Best regards
> Thomas
> 
>>
>> - Marijn
>>
>>> ---
>>>   drivers/gpu/drm/msm/msm_fbdev.c | 20 ++++++++++++++++++++
>>>   1 file changed, 20 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c 
>>> b/drivers/gpu/drm/msm/msm_fbdev.c
>>> index fa9c1cbffae3..b933a85420f6 100644
>>> --- a/drivers/gpu/drm/msm/msm_fbdev.c
>>> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
>>> @@ -139,8 +139,28 @@ static int msm_fbdev_create(struct drm_fb_helper 
>>> *helper,
>>>       return ret;
>>>   }
>>> +static int msm_fbdev_fb_dirty(struct drm_fb_helper *helper,
>>> +                  struct drm_clip_rect *clip)
>>> +{
>>> +    struct drm_device *dev = helper->dev;
>>> +    int ret;
>>> +
>>> +    /* Call damage handlers only if necessary */
>>> +    if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
>>> +        return 0;
>>> +
>>> +    if (helper->fb->funcs->dirty) {
>>> +        ret = helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 
>>> 1);
>>> +        if (drm_WARN_ONCE(dev, ret, "Dirty helper failed: ret=%d\n", 
>>> ret))
>>> +            return ret;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   static const struct drm_fb_helper_funcs msm_fb_helper_funcs = {
>>>       .fb_probe = msm_fbdev_create,
>>> +    .fb_dirty = msm_fbdev_fb_dirty,
>>>   };
>>>   /*
>>> -- 
>>> 2.39.2
>>>
> 

-- 
With best wishes
Dmitry

