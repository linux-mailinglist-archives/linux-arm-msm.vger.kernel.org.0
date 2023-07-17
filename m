Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C68C2756A13
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jul 2023 19:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbjGQRWp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jul 2023 13:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbjGQRWo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jul 2023 13:22:44 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07B321B3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 10:22:42 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b74fa5e7d7so72954081fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 10:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689614560; x=1690219360;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bxqU8MeBBR9Osa5GDCEqe7jglVtCIxQ76sQ+O1kbmxI=;
        b=XlJqCpldQAZfj3iOSEpQs105sezH+tDG95ND3aFanXvnb23UPXXn2IKnW+DTed9e2J
         wpedp5nKafUj43AO5KIac0M7K9q5Thq1kBpOxRo0+OS6OtFvlq+WyHg5VpmHpm/+wECJ
         kqAnZ+w3mOZoBwiWN7I0U82tp4zUdgROU4pOEP1bJRDAwrun9M58aygVoEKxoAB1ofoF
         mNBonT9fHl3GGqqAqdGkuTOk0nj2T/2Q31wHCy3oH9zt4Zr6bhlm7md8xFdHYo0xJgyC
         RDinlk23DcLdlYGO40GSG9ZJ0fMIobK/2QDjyozTiACRK2Pd9RGPQsmd/Lh1WlFJmH/p
         pQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689614560; x=1690219360;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bxqU8MeBBR9Osa5GDCEqe7jglVtCIxQ76sQ+O1kbmxI=;
        b=CoP4rZM2brnm5H7x8+4L7FeRGDEtSyuoQAWzCKMw5+ZX+slSMbJIQenrAAThyGQL39
         29iBchINrR4H6LwXSJGJgcQDKYuBjAy42W7lOGqeGdKhTqBTvZnG+Q2KGfFzJ14CU1ss
         15eude9nRildWMCOipQVJ2valgdCmIFaug4HE7Ln94zC9U6W7T0GmEIo5nA8d1C8RTw/
         mGaN0VhZiTjqkm8BJRTyhtQp6+1cEHBunieB4mIQkbH+sznGToNBDaz+aWbdKdklWkkr
         zsvP0UkByXXW7O8n7O+TFr+5yC7hZTPS8YKl6GqYa2JCm8kZlLofCan5H2mfJZ2EYBqR
         GU1Q==
X-Gm-Message-State: ABy/qLZjI/dJtl9J5b0Z230nIhjwLAA6CdecKRvDhWxFgagstntH/kVJ
        3Ud4YUQ1isFzGLeUl2WHpM0UVw==
X-Google-Smtp-Source: APBJJlGJni+uOB6VKWOS4EOEtPpcDWYvpmXzDVskx+DKTBRfpY3AkiWk4hkbUbzXzext6yOouU+dAA==
X-Received: by 2002:a2e:2c05:0:b0:2b6:d89e:74e2 with SMTP id s5-20020a2e2c05000000b002b6d89e74e2mr8727077ljs.7.1689614560137;
        Mon, 17 Jul 2023 10:22:40 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id r20-20020a2eb614000000b002b93d66b82asm8950ljn.112.2023.07.17.10.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 10:22:39 -0700 (PDT)
Message-ID: <9a9ec559-769c-d593-6eaa-45daa5966cb8@linaro.org>
Date:   Mon, 17 Jul 2023 20:22:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 4/5] drm/msm/dp: move relevant dp initialization code
 from bind() to probe()
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, andersson@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
        quic_sbillaka@quicinc.com, marijn.suijten@somainline.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1688773943-3887-1-git-send-email-quic_khsieh@quicinc.com>
 <1688773943-3887-5-git-send-email-quic_khsieh@quicinc.com>
 <121f82ad-9d5d-6d7f-b4ae-9a371ab49ef7@linaro.org>
 <9df52052-93fd-75a4-b54c-02ed9554e15f@quicinc.com>
 <3fa812d6-9222-065a-8b40-95c2f2c808a6@linaro.org>
 <8bc82b4b-b169-a11b-9f5d-eb821b680af7@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <8bc82b4b-b169-a11b-9f5d-eb821b680af7@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/07/2023 20:16, Kuogee Hsieh wrote:
> 
> On 7/10/2023 11:13 AM, Dmitry Baryshkov wrote:
>> On 10/07/2023 19:57, Kuogee Hsieh wrote:
>>>
>>> On 7/7/2023 5:11 PM, Dmitry Baryshkov wrote:
>>>> On 08/07/2023 02:52, Kuogee Hsieh wrote:
>>>>> In preparation of moving edp of_dp_aux_populate_bus() to
>>>>> dp_display_probe(), move dp_display_request_irq(),
>>>>> dp->parser->parse() and dp_power_client_init() to dp_display_probe()
>>>>> too.
>>>>>
>>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>>> ---
>>>>>   drivers/gpu/drm/msm/dp/dp_display.c | 48 
>>>>> +++++++++++++++++--------------------
>>>>>   drivers/gpu/drm/msm/dp/dp_display.h |  1 -
>>>>>   2 files changed, 22 insertions(+), 27 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>>>>> b/drivers/gpu/drm/msm/dp/dp_display.c
>>>>> index 44580c2..185f1eb 100644
>>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>>> @@ -290,12 +290,6 @@ static int dp_display_bind(struct device *dev, 
>>>>> struct device *master,
>>>>>           goto end;
>>>>>       }
>>>>>   -    rc = dp_power_client_init(dp->power);
>>>>> -    if (rc) {
>>>>> -        DRM_ERROR("Power client create failed\n");
>>>>> -        goto end;
>>>>> -    }
>>>>> -
>>>>>       rc = dp_register_audio_driver(dev, dp->audio);
>>>>>       if (rc) {
>>>>>           DRM_ERROR("Audio registration Dp failed\n");
>>>>> @@ -752,6 +746,12 @@ static int dp_init_sub_modules(struct 
>>>>> dp_display_private *dp)
>>>>>           goto error;
>>>>>       }
>>>>>   +    rc = dp->parser->parse(dp->parser);
>>>>> +    if (rc) {
>>>>> +        DRM_ERROR("device tree parsing failed\n");
>>>>> +        goto error;
>>>>> +    }
>>>>> +
>>>>>       dp->catalog = dp_catalog_get(dev, &dp->parser->io);
>>>>>       if (IS_ERR(dp->catalog)) {
>>>>>           rc = PTR_ERR(dp->catalog);
>>>>> @@ -768,6 +768,12 @@ static int dp_init_sub_modules(struct 
>>>>> dp_display_private *dp)
>>>>>           goto error;
>>>>>       }
>>>>>   +    rc = dp_power_client_init(dp->power);
>>>>> +    if (rc) {
>>>>> +        DRM_ERROR("Power client create failed\n");
>>>>> +        goto error;
>>>>> +    }
>>>>> +
>>>>>       dp->aux = dp_aux_get(dev, dp->catalog, dp->dp_display.is_edp);
>>>>>       if (IS_ERR(dp->aux)) {
>>>>>           rc = PTR_ERR(dp->aux);
>>>>> @@ -1196,26 +1202,20 @@ static irqreturn_t 
>>>>> dp_display_irq_handler(int irq, void *dev_id)
>>>>>       return ret;
>>>>>   }
>>>>>   -int dp_display_request_irq(struct msm_dp *dp_display)
>>>>> +static int dp_display_request_irq(struct dp_display_private *dp)
>>>>>   {
>>>>>       int rc = 0;
>>>>> -    struct dp_display_private *dp;
>>>>> -
>>>>> -    if (!dp_display) {
>>>>> -        DRM_ERROR("invalid input\n");
>>>>> -        return -EINVAL;
>>>>> -    }
>>>>> -
>>>>> -    dp = container_of(dp_display, struct dp_display_private, 
>>>>> dp_display);
>>>>> +    struct device *dev = &dp->pdev->dev;
>>>>>   -    dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
>>>>>       if (!dp->irq) {
>>>>> -        DRM_ERROR("failed to get irq\n");
>>>>> -        return -EINVAL;
>>>>> +        dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
>>>>> +        if (!dp->irq) {
>>>>> +            DRM_ERROR("failed to get irq\n");
>>>>> +            return -EINVAL;
>>>>> +        }
>>>>>       }
>>>>
>>>> Use platform_get_irq() from probe() function.
>>>>
>>>>>   -    rc = devm_request_irq(dp_display->drm_dev->dev, dp->irq,
>>>>> -            dp_display_irq_handler,
>>>>> +    rc = devm_request_irq(dev, dp->irq, dp_display_irq_handler,
>>>>>               IRQF_TRIGGER_HIGH, "dp_display_isr", dp);
>>>>
>>>>
>>>>>       if (rc < 0) {
>>>>>           DRM_ERROR("failed to request IRQ%u: %d\n",
>>>>> @@ -1290,6 +1290,8 @@ static int dp_display_probe(struct 
>>>>> platform_device *pdev)
>>>>>         platform_set_drvdata(pdev, &dp->dp_display);
>>>>>   +    dp_display_request_irq(dp);
>>>>> +
>>>>
>>>> Error checking?
>>>> Are we completely ready to handle interrupts at this point?
>>> not until dp_display_host_init() is called which will be called from 
>>> pm_runtime_resume() later.
>>
>> But once you request_irq(), you should be ready for the IRQs to be 
>> delivered right away.
> 
> At this point, the DP controller interrupts mask bit is not enabled yet.
> 
> Therefore interrupts will not happen until dp_bridge_hpd_enable() is 
> called to initialize dp host  controller and then enabled mask bits.

Are AUX and CTRL interrupts also disabled? What about any stray/pending 
interrupts? Just take it as a rule of thumb. Once request_irq() has been 
called without the IRQ_NOAUTOEN flag, the driver should be prepared to 
handle the incoming interrupt requests.

>>>>>       rc = component_add(&pdev->dev, &dp_display_comp_ops);
>>>>>       if (rc) {
>>>>>           DRM_ERROR("component add failed, rc=%d\n", rc);
>>>>> @@ -1574,12 +1576,6 @@ int msm_dp_modeset_init(struct msm_dp 
>>>>> *dp_display, struct drm_device *dev,
>>>>>         dp_priv = container_of(dp_display, struct 
>>>>> dp_display_private, dp_display);
>>>>>   -    ret = dp_display_request_irq(dp_display);
>>>>> -    if (ret) {
>>>>> -        DRM_ERROR("request_irq failed, ret=%d\n", ret);
>>>>> -        return ret;
>>>>> -    }
>>>>> -
>>>>>       ret = dp_display_get_next_bridge(dp_display);
>>>>>       if (ret)
>>>>>           return ret;
>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h 
>>>>> b/drivers/gpu/drm/msm/dp/dp_display.h
>>>>> index 1e9415a..b3c08de 100644
>>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.h
>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
>>>>> @@ -35,7 +35,6 @@ struct msm_dp {
>>>>>   int dp_display_set_plugged_cb(struct msm_dp *dp_display,
>>>>>           hdmi_codec_plugged_cb fn, struct device *codec_dev);
>>>>>   int dp_display_get_modes(struct msm_dp *dp_display);
>>>>> -int dp_display_request_irq(struct msm_dp *dp_display);
>>>>>   bool dp_display_check_video_test(struct msm_dp *dp_display);
>>>>>   int dp_display_get_test_bpp(struct msm_dp *dp_display);
>>>>>   void dp_display_signal_audio_start(struct msm_dp *dp_display);
>>>>
>>

-- 
With best wishes
Dmitry

