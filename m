Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A2087BEC16
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 22:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378131AbjJIUzw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 16:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378238AbjJIUxy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 16:53:54 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31AE0F0
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 13:53:47 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c17de836fbso62703631fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 13:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696884825; x=1697489625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+NsT8wiOulucIWx22N4JZ3mBmzzP+oqgix2ms+capXo=;
        b=sVSr1XkQNLCt/IuViN61/RLjw+I41zFh3NuzGQJeXyK1IysSbCUsuj+c5x85UU5hIf
         58iQkFy9S6vAhge7x8WGTZ9UOl7uD36KtMdwfV1WrcVqkYRRR8cyEyaueTYqFFOHdAuf
         YwRF9klTnvoxBVmFTuAOu34fVKxfOYUBjG8SPL/UuememwPs5Lkd626PQ7nwv3Z+Xa1e
         BuOjte/Ns2mKyUBotf7EpQgXBY/kbSVAHBJTt1TdfjHb9awtNMmTNtR/2Z9fnhozhWMF
         5sUiB3L+WjERl+1Jcu5e+00fbEqlMKmuxAs0pX4rwmwDCcWKjUzwa1lbna8FlAFf/eMj
         H+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696884825; x=1697489625;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+NsT8wiOulucIWx22N4JZ3mBmzzP+oqgix2ms+capXo=;
        b=An0ZFeRELQcaxqL+nxUv/JzF7ACv+B0khyQ2A1ny7rItairXXV+5tjiE17aFw8pL6l
         TyBuWQ9U287Di93CuLI0wYdeeRGnQjRU5AVag5zrJDt6KHCz/Xfh7FqU8Aq79zfTmxiv
         tCQViLNnLughAf17SWupZ0AVhD3Gcst1/r6xxgHcctwvW4WT0fS04FG8+D+ut0rTPT4C
         vDi5pnECInGnCM+1LhxZKupoZfHXqw/p1u1W9ss9QmfLqJQPFaQuistefIB5KTLoPanS
         egZrGXYKswFboMZBw6lV2MOf1DckMdEXvr+Lfx47hXUFnwWozSs2yLTXYTS10FtepDY7
         AoiQ==
X-Gm-Message-State: AOJu0YyIC084EFkCLR0yGEN9VZhS4IY/benPtCddxjQn86IqT2BkKtDs
        p9rPHURBTt2d6jU3T3NRr8rA4w==
X-Google-Smtp-Source: AGHT+IExWiGWcZpJT182d6s2keHa1ddzZaoRcYRDgsEC2X/7DnYTgcW15uIwZa3T7mY58M0PcbCPNQ==
X-Received: by 2002:a05:651c:87:b0:2bb:b626:5044 with SMTP id 7-20020a05651c008700b002bbb6265044mr13302731ljq.6.1696884825287;
        Mon, 09 Oct 2023 13:53:45 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id k19-20020a2e2413000000b002bcdeeecd11sm2091722ljk.66.2023.10.09.13.53.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 13:53:44 -0700 (PDT)
Message-ID: <8ef34ba0-f30a-45b0-991e-0a7eb573956d@linaro.org>
Date:   Mon, 9 Oct 2023 23:53:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/13] drm/msm/hdmi: switch to devm_drm_bridge_add()
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 <aafb04ea-fde3-4c1b-aae4-5e7e50a945d6@linaro.org>
In-Reply-To: <aafb04ea-fde3-4c1b-aae4-5e7e50a945d6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/10/2023 22:21, Dmitry Baryshkov wrote:
> On 09/10/2023 22:19, Abhinav Kumar wrote:
>>
>>
>> On 10/9/2023 11:10 AM, Dmitry Baryshkov wrote:
>>> Make MSM HDMI driver use devm_drm_bridge_add() instead of plain
>>> drm_bridge_add(). As the driver doesn't require any additional cleanup,
>>> stop adding created bridge to the priv->bridges array.
>>>
>>> Reviewed-by: Rob Clark <robdclark@gmail.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/hdmi/hdmi.c        | 22 +++++--------------
>>>   drivers/gpu/drm/msm/hdmi/hdmi.h        |  5 ++---
>>>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 30 ++++++++------------------
>>>   drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    |  3 +--
>>>   4 files changed, 17 insertions(+), 43 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c 
>>> b/drivers/gpu/drm/msm/hdmi/hdmi.c
>>> index b6bcb9f675fe..c8ebd75176bb 100644
>>> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
>>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
>>> @@ -160,24 +160,16 @@ static int msm_hdmi_init(struct hdmi *hdmi)
>>>   int msm_hdmi_modeset_init(struct hdmi *hdmi,
>>>           struct drm_device *dev, struct drm_encoder *encoder)
>>>   {
>>> -    struct msm_drm_private *priv = dev->dev_private;
>>>       int ret;
>>> -    if (priv->num_bridges == ARRAY_SIZE(priv->bridges)) {
>>> -        DRM_DEV_ERROR(dev->dev, "too many bridges\n");
>>> -        return -ENOSPC;
>>> -    }
>>> -
>>>       hdmi->dev = dev;
>>>       hdmi->encoder = encoder;
>>>       hdmi_audio_infoframe_init(&hdmi->audio.infoframe);
>>> -    hdmi->bridge = msm_hdmi_bridge_init(hdmi);
>>> -    if (IS_ERR(hdmi->bridge)) {
>>> -        ret = PTR_ERR(hdmi->bridge);
>>> +    ret = msm_hdmi_bridge_init(hdmi);
>>> +    if (ret) {
>>>           DRM_DEV_ERROR(dev->dev, "failed to create HDMI bridge: 
>>> %d\n", ret);
>>> -        hdmi->bridge = NULL;
>>>           goto fail;
>>>       }
>>> @@ -215,16 +207,9 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>>>           goto fail;
>>>       }
>>> -    priv->bridges[priv->num_bridges++]       = hdmi->bridge;
>>> -
>>>       return 0;
>>>   fail:
>>> -    /* bridge is normally destroyed by drm: */
>>> -    if (hdmi->bridge) {
>>> -        msm_hdmi_bridge_destroy(hdmi->bridge);
>>> -        hdmi->bridge = NULL;
>>> -    }
>>>       if (hdmi->connector) {
>>>           hdmi->connector->funcs->destroy(hdmi->connector);
>>>           hdmi->connector = NULL;
>>> @@ -395,6 +380,9 @@ static void msm_hdmi_unbind(struct device *dev, 
>>> struct device *master,
>>>           if (priv->hdmi->audio_pdev)
>>>               platform_device_unregister(priv->hdmi->audio_pdev);
>>> +        if (priv->hdmi->bridge)
>>> +            msm_hdmi_hpd_disable(priv->hdmi);
>>> +
>>
>> Now is this the only place where hdmi->bridge is used?
>>
>> Why cant we just keep msm_hdmi_hpd_disable(priv->hdmi) here since its 
>> anyway protected by if (priv->hdmi) and drop hdmi->bridge completely?
> 
> Sure, sounds like a good idea, same followup as for the DSI.

I was wrong here. hdmi::bridge is used by the driver (e.g. for HPD 
reporting).

-- 
With best wishes
Dmitry

