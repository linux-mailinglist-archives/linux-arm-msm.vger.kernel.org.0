Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 805F77BEA7D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 21:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378331AbjJITVV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 15:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378347AbjJITVU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 15:21:20 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C17DFA6
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 12:21:17 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5041d6d8b10so6245813e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 12:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696879276; x=1697484076; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hmapbq3aRz3C3e6INivK9qWJxUoyF3yq+7LB/qdyUOU=;
        b=hORqluG4RJDmYZGwHJ3haWjGIKoOHyUZsWVAfXcwM1QzcrNEi+kTnMHMvBJyP2KPRF
         ZRBcUB3i2Wcq37IvdG3rOa+oBsTTZzQJYRTWPIM9OL04sZImT60EbRxU5WzRu0SEUFdW
         eE9zBshovYlVyEDC0IAhpzypDclHNe/wefzM/wv1nPFQcB1JTHhF4zIUSCWjBa8UYGj3
         wIjYV6umHLaa9hSCFdrZZ6pxTrjiWEwb+Gny3Zz1qn31vYgTbxfKhNyOR4fv6G11ko8H
         vzS88OWzUaDTA+jR4BN5XKUSNJcdmCnQBwtLm/HFNH8uwuMGx0ETmWO1t/z9TNoec/pq
         lB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696879276; x=1697484076;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hmapbq3aRz3C3e6INivK9qWJxUoyF3yq+7LB/qdyUOU=;
        b=YfTNnt+z2AG8+zv5W1GuetwSys+Jp2B2CO06OE96JHJ+/V30sZbR7/BcUmO14ZzDNH
         UrrFjkdx4PZcmB/zMB/qoCNRDibFI/tBRZzKtE1qvOdWYC2qY5vjkFElzdAunLYSDc/f
         ezAko1FM+4TIV34roOIJ2gjwAV6YKQAxi2Ms3PJm5ouu464js8qNj68giX83cJLsopXO
         XZfD+pqZ+ULetKWJ+QjOXv3USrPMBk5AbuM5ZEn2qfXXUToIQ5VItNLvOQUcFaSbXsqE
         0KrYqlkpciAEKbKbFnG8/Q/kZX2Tk9MfcNeIGZUw2jplodMdspA4eVnmCKiieePulj4z
         RkiQ==
X-Gm-Message-State: AOJu0YxoXXPf8VeZBVVODMWgMZo6XSKShDgwaHK3Qda9NWppMr/kmNR7
        j4WOz1XJSBwyEvhDoQ9yPOoJGg==
X-Google-Smtp-Source: AGHT+IEZtT2NT+x4yc52TWRifoclV1gRxEhUKl0HV/4xW2jzkkE4IfQBh3Dia3xqFEEKlA/aNiNPeQ==
X-Received: by 2002:a05:6512:2822:b0:504:3424:215c with SMTP id cf34-20020a056512282200b005043424215cmr16036956lfb.51.1696879275985;
        Mon, 09 Oct 2023 12:21:15 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id x24-20020ac24898000000b0050318bdad45sm1531908lfc.64.2023.10.09.12.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 12:21:15 -0700 (PDT)
Message-ID: <aafb04ea-fde3-4c1b-aae4-5e7e50a945d6@linaro.org>
Date:   Mon, 9 Oct 2023 22:21:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/13] drm/msm/hdmi: switch to devm_drm_bridge_add()
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
 <20231009181040.2743847-3-dmitry.baryshkov@linaro.org>
 <d56daed9-35ac-0ee3-a0b4-f8596b0490fc@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <d56daed9-35ac-0ee3-a0b4-f8596b0490fc@quicinc.com>
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

On 09/10/2023 22:19, Abhinav Kumar wrote:
> 
> 
> On 10/9/2023 11:10 AM, Dmitry Baryshkov wrote:
>> Make MSM HDMI driver use devm_drm_bridge_add() instead of plain
>> drm_bridge_add(). As the driver doesn't require any additional cleanup,
>> stop adding created bridge to the priv->bridges array.
>>
>> Reviewed-by: Rob Clark <robdclark@gmail.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/hdmi/hdmi.c        | 22 +++++--------------
>>   drivers/gpu/drm/msm/hdmi/hdmi.h        |  5 ++---
>>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 30 ++++++++------------------
>>   drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    |  3 +--
>>   4 files changed, 17 insertions(+), 43 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c 
>> b/drivers/gpu/drm/msm/hdmi/hdmi.c
>> index b6bcb9f675fe..c8ebd75176bb 100644
>> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
>> @@ -160,24 +160,16 @@ static int msm_hdmi_init(struct hdmi *hdmi)
>>   int msm_hdmi_modeset_init(struct hdmi *hdmi,
>>           struct drm_device *dev, struct drm_encoder *encoder)
>>   {
>> -    struct msm_drm_private *priv = dev->dev_private;
>>       int ret;
>> -    if (priv->num_bridges == ARRAY_SIZE(priv->bridges)) {
>> -        DRM_DEV_ERROR(dev->dev, "too many bridges\n");
>> -        return -ENOSPC;
>> -    }
>> -
>>       hdmi->dev = dev;
>>       hdmi->encoder = encoder;
>>       hdmi_audio_infoframe_init(&hdmi->audio.infoframe);
>> -    hdmi->bridge = msm_hdmi_bridge_init(hdmi);
>> -    if (IS_ERR(hdmi->bridge)) {
>> -        ret = PTR_ERR(hdmi->bridge);
>> +    ret = msm_hdmi_bridge_init(hdmi);
>> +    if (ret) {
>>           DRM_DEV_ERROR(dev->dev, "failed to create HDMI bridge: 
>> %d\n", ret);
>> -        hdmi->bridge = NULL;
>>           goto fail;
>>       }
>> @@ -215,16 +207,9 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>>           goto fail;
>>       }
>> -    priv->bridges[priv->num_bridges++]       = hdmi->bridge;
>> -
>>       return 0;
>>   fail:
>> -    /* bridge is normally destroyed by drm: */
>> -    if (hdmi->bridge) {
>> -        msm_hdmi_bridge_destroy(hdmi->bridge);
>> -        hdmi->bridge = NULL;
>> -    }
>>       if (hdmi->connector) {
>>           hdmi->connector->funcs->destroy(hdmi->connector);
>>           hdmi->connector = NULL;
>> @@ -395,6 +380,9 @@ static void msm_hdmi_unbind(struct device *dev, 
>> struct device *master,
>>           if (priv->hdmi->audio_pdev)
>>               platform_device_unregister(priv->hdmi->audio_pdev);
>> +        if (priv->hdmi->bridge)
>> +            msm_hdmi_hpd_disable(priv->hdmi);
>> +
> 
> Now is this the only place where hdmi->bridge is used?
> 
> Why cant we just keep msm_hdmi_hpd_disable(priv->hdmi) here since its 
> anyway protected by if (priv->hdmi) and drop hdmi->bridge completely?

Sure, sounds like a good idea, same followup as for the DSI.

> 
>>           msm_hdmi_destroy(priv->hdmi);
>>           priv->hdmi = NULL;
>>       }
>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h 
>> b/drivers/gpu/drm/msm/hdmi/hdmi.h
>> index e8dbee50637f..ec5786440391 100644
>> --- a/drivers/gpu/drm/msm/hdmi/hdmi.h
>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
>> @@ -224,14 +224,13 @@ void msm_hdmi_audio_set_sample_rate(struct hdmi 
>> *hdmi, int rate);
>>    * hdmi bridge:
>>    */
>> -struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hdmi);
>> -void msm_hdmi_bridge_destroy(struct drm_bridge *bridge);
>> +int msm_hdmi_bridge_init(struct hdmi *hdmi);
>>   void msm_hdmi_hpd_irq(struct drm_bridge *bridge);
>>   enum drm_connector_status msm_hdmi_bridge_detect(
>>           struct drm_bridge *bridge);
>>   int msm_hdmi_hpd_enable(struct drm_bridge *bridge);
>> -void msm_hdmi_hpd_disable(struct hdmi_bridge *hdmi_bridge);
>> +void msm_hdmi_hpd_disable(struct hdmi *hdmi);
>>   /*
>>    * i2c adapter for ddc:
>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c 
>> b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
>> index 9b1391d27ed3..0b7a6a56677e 100644
>> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
>> @@ -11,14 +11,6 @@
>>   #include "msm_kms.h"
>>   #include "hdmi.h"
>> -void msm_hdmi_bridge_destroy(struct drm_bridge *bridge)
>> -{
>> -    struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
>> -
>> -    msm_hdmi_hpd_disable(hdmi_bridge);
>> -    drm_bridge_remove(bridge);
>> -}
>> -
>>   static void msm_hdmi_power_on(struct drm_bridge *bridge)
>>   {
>>       struct drm_device *dev = bridge->dev;
>> @@ -317,7 +309,7 @@ msm_hdmi_hotplug_work(struct work_struct *work)
>>   }
>>   /* initialize bridge */
>> -struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hdmi)
>> +int msm_hdmi_bridge_init(struct hdmi *hdmi)
>>   {
>>       struct drm_bridge *bridge = NULL;
>>       struct hdmi_bridge *hdmi_bridge;
>> @@ -325,10 +317,8 @@ struct drm_bridge *msm_hdmi_bridge_init(struct 
>> hdmi *hdmi)
>>       hdmi_bridge = devm_kzalloc(hdmi->dev->dev,
>>               sizeof(*hdmi_bridge), GFP_KERNEL);
>> -    if (!hdmi_bridge) {
>> -        ret = -ENOMEM;
>> -        goto fail;
>> -    }
>> +    if (!hdmi_bridge)
>> +        return -ENOMEM;
>>       hdmi_bridge->hdmi = hdmi;
>>       INIT_WORK(&hdmi_bridge->hpd_work, msm_hdmi_hotplug_work);
>> @@ -341,17 +331,15 @@ struct drm_bridge *msm_hdmi_bridge_init(struct 
>> hdmi *hdmi)
>>           DRM_BRIDGE_OP_DETECT |
>>           DRM_BRIDGE_OP_EDID;
>> -    drm_bridge_add(bridge);
>> +    ret = devm_drm_bridge_add(&hdmi->pdev->dev, bridge);
>> +    if (ret)
>> +        return ret;
>>       ret = drm_bridge_attach(hdmi->encoder, bridge, NULL, 
>> DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>       if (ret)
>> -        goto fail;
>> +        return ret;
>> -    return bridge;
>> +    hdmi->bridge = bridge;
>> -fail:
>> -    if (bridge)
>> -        msm_hdmi_bridge_destroy(bridge);
>> -
>> -    return ERR_PTR(ret);
>> +    return 0;
>>   }
>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c 
>> b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
>> index bfa827b47989..9ce0ffa35417 100644
>> --- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
>> @@ -147,9 +147,8 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
>>       return ret;
>>   }
>> -void msm_hdmi_hpd_disable(struct hdmi_bridge *hdmi_bridge)
>> +void msm_hdmi_hpd_disable(struct hdmi *hdmi)
>>   {
>> -    struct hdmi *hdmi = hdmi_bridge->hdmi;
>>       const struct hdmi_platform_config *config = hdmi->config;
>>       struct device *dev = &hdmi->pdev->dev;
>>       int ret;

-- 
With best wishes
Dmitry

