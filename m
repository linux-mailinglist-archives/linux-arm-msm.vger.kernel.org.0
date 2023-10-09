Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5647BEC4D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 23:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378600AbjJIVG0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 17:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378695AbjJIVGJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 17:06:09 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8136B123
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 14:05:57 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50433d8385cso6610255e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 14:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696885555; x=1697490355; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GXrOQXhi7nu5nW0Bm3Asi2YiiWFCB9aNui0KX6wRppQ=;
        b=bqyit5xUgJVYFN28HGu6pc38khDVwbLL5N6ITVuk0iLd9Cq1m4gSzXWyysJPGSm/g9
         QELMRHV+CgA7hbv8sG2gt7h3x1gAT5N7vFyIYNu9Obgc8fGWpoVJYySSOWCuZZzfd4Fm
         0Wlr0CPrpQNcStxjSRM42S4BRWhI1+3rY5w72junWYnVhEXQ4+hPaMIeuuXci3+0/vM1
         oxUR3i2tfKHJ7dBhLfzU2PwpvgnO4lJd9gn9y3e4KCG8vN5RDrXRLdJNOZeRBpsT1vu9
         5B+kd7TXNVQLh+RiB817VuwGxBsfDqRj/KBKPgwSzf3UG39yGM018XLBGYadGRC4Nd2m
         FV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696885555; x=1697490355;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GXrOQXhi7nu5nW0Bm3Asi2YiiWFCB9aNui0KX6wRppQ=;
        b=k67/FrkIEjU2mjve+0+Zmi16J38ic7xj5oNuKGLWAtGoxdayy6kIjmZXtycFm5PpJW
         XLZcJMN7244sMMCx/r87iKUfyNo2WZ3xIITyRDf+JlsxROQz46H2/Xlv1EA6C7jyl4jV
         gwA2qQvAo2N6uVZo0FF9iptswtrtmypDy+UF9N4euifcz1SAoBo1EFed9w6/uk9f/zqk
         oXxetdBYWkt/ufLxmUYs1xOBE2W0iW14nHpXQIbihd3JA+ct44yJdbBK5wmgP1pji+Ze
         t5mLcPGvk4rc+4MazaZ/STq1PiEfiSlahsVlCwH0lf3bvzCBFjBDYjsZnkxl1XaO+u97
         uGww==
X-Gm-Message-State: AOJu0YyTRV5yAHaPAKtw58k6O51cOuhTLKkWxIr6FUX5i/CZC4HWqegI
        ZyQ73qVqfd+KEzBgVFevlFUYsA==
X-Google-Smtp-Source: AGHT+IHRQzjfZA3qbEFz0v3hw5zQjkZWnVU1DMVOIPl5A81sLfNXyOFrRmWkYQWeOBuytORrD0CRWQ==
X-Received: by 2002:ac2:5b9e:0:b0:500:c765:bbe with SMTP id o30-20020ac25b9e000000b00500c7650bbemr11903587lfn.0.1696885555647;
        Mon, 09 Oct 2023 14:05:55 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id u15-20020a2e9b0f000000b002b9f1214394sm2195696lji.13.2023.10.09.14.05.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 14:05:55 -0700 (PDT)
Message-ID: <a549364b-d122-464e-b1bd-817c1ac6fb24@linaro.org>
Date:   Tue, 10 Oct 2023 00:05:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Freedreno] [PATCH v2 02/13] drm/msm/hdmi: switch to
 devm_drm_bridge_add()
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
 <20231009181040.2743847-3-dmitry.baryshkov@linaro.org>
 <d56daed9-35ac-0ee3-a0b4-f8596b0490fc@quicinc.com>
 <aafb04ea-fde3-4c1b-aae4-5e7e50a945d6@linaro.org>
 <8ef34ba0-f30a-45b0-991e-0a7eb573956d@linaro.org>
 <836a86ea-4a91-c649-fd3d-a9848eb8ecae@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <836a86ea-4a91-c649-fd3d-a9848eb8ecae@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/10/2023 00:04, Abhinav Kumar wrote:
> 
> 
> On 10/9/2023 1:53 PM, Dmitry Baryshkov wrote:
>> On 09/10/2023 22:21, Dmitry Baryshkov wrote:
>>> On 09/10/2023 22:19, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 10/9/2023 11:10 AM, Dmitry Baryshkov wrote:
>>>>> Make MSM HDMI driver use devm_drm_bridge_add() instead of plain
>>>>> drm_bridge_add(). As the driver doesn't require any additional 
>>>>> cleanup,
>>>>> stop adding created bridge to the priv->bridges array.
>>>>>
>>>>> Reviewed-by: Rob Clark <robdclark@gmail.com>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>   drivers/gpu/drm/msm/hdmi/hdmi.c        | 22 +++++--------------
>>>>>   drivers/gpu/drm/msm/hdmi/hdmi.h        |  5 ++---
>>>>>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 30 
>>>>> ++++++++------------------
>>>>>   drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    |  3 +--
>>>>>   4 files changed, 17 insertions(+), 43 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c 
>>>>> b/drivers/gpu/drm/msm/hdmi/hdmi.c
>>>>> index b6bcb9f675fe..c8ebd75176bb 100644
>>>>> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
>>>>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
>>>>> @@ -160,24 +160,16 @@ static int msm_hdmi_init(struct hdmi *hdmi)
>>>>>   int msm_hdmi_modeset_init(struct hdmi *hdmi,
>>>>>           struct drm_device *dev, struct drm_encoder *encoder)
>>>>>   {
>>>>> -    struct msm_drm_private *priv = dev->dev_private;
>>>>>       int ret;
>>>>> -    if (priv->num_bridges == ARRAY_SIZE(priv->bridges)) {
>>>>> -        DRM_DEV_ERROR(dev->dev, "too many bridges\n");
>>>>> -        return -ENOSPC;
>>>>> -    }
>>>>> -
>>>>>       hdmi->dev = dev;
>>>>>       hdmi->encoder = encoder;
>>>>>       hdmi_audio_infoframe_init(&hdmi->audio.infoframe);
>>>>> -    hdmi->bridge = msm_hdmi_bridge_init(hdmi);
>>>>> -    if (IS_ERR(hdmi->bridge)) {
>>>>> -        ret = PTR_ERR(hdmi->bridge);
>>>>> +    ret = msm_hdmi_bridge_init(hdmi);
>>>>> +    if (ret) {
>>>>>           DRM_DEV_ERROR(dev->dev, "failed to create HDMI bridge: 
>>>>> %d\n", ret);
>>>>> -        hdmi->bridge = NULL;
>>>>>           goto fail;
>>>>>       }
>>>>> @@ -215,16 +207,9 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>>>>>           goto fail;
>>>>>       }
>>>>> -    priv->bridges[priv->num_bridges++]       = hdmi->bridge;
>>>>> -
>>>>>       return 0;
>>>>>   fail:
>>>>> -    /* bridge is normally destroyed by drm: */
>>>>> -    if (hdmi->bridge) {
>>>>> -        msm_hdmi_bridge_destroy(hdmi->bridge);
>>>>> -        hdmi->bridge = NULL;
>>>>> -    }
>>>>>       if (hdmi->connector) {
>>>>>           hdmi->connector->funcs->destroy(hdmi->connector);
>>>>>           hdmi->connector = NULL;
>>>>> @@ -395,6 +380,9 @@ static void msm_hdmi_unbind(struct device *dev, 
>>>>> struct device *master,
>>>>>           if (priv->hdmi->audio_pdev)
>>>>>               platform_device_unregister(priv->hdmi->audio_pdev);
>>>>> +        if (priv->hdmi->bridge)
>>>>> +            msm_hdmi_hpd_disable(priv->hdmi);
>>>>> +
>>>>
>>>> Now is this the only place where hdmi->bridge is used?
>>>>
>>>> Why cant we just keep msm_hdmi_hpd_disable(priv->hdmi) here since 
>>>> its anyway protected by if (priv->hdmi) and drop hdmi->bridge 
>>>> completely?
>>>
>>> Sure, sounds like a good idea, same followup as for the DSI.
>>
>> I was wrong here. hdmi::bridge is used by the driver (e.g. for HPD 
>> reporting).
>>
> 
> hmmm, I thought HPD module uses hdmi_bridge->hdmi. here we are talking 
> about hdmi->bridge?

See msm_hdmi_irq().

-- 
With best wishes
Dmitry

