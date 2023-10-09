Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A99F7BEA01
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 20:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378178AbjJISqK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 14:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378109AbjJISqJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 14:46:09 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 015F4A3
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 11:46:04 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c038a1e2e6so57005991fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 11:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696877163; x=1697481963; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=15Qjgj7djDeAAXf961fVsM8P1Vswz7XY0us83EKsOMc=;
        b=gNNiU1oDA4Tw9hHNggcieN8nMX5RU5RyRl12chEZEsdCrGou05AAxuTu7b48AEnb6p
         KRZtbvYs1ZxKWcwr5CQYAr0mBadw49JUinmPB9ndZqYDhweFx03Hv+kVhsdETabGdDKd
         0phvwXTxDC7unf3LA3cG65w4mkZz2RYq7SzZ+zurXnFjtVuodwcUMjZjcn3J8d465tia
         Hl584DfQDTNkVGxBSkyNQAaeNxzAAGhyP7UnyGL0bO1155YQKmbKuosOZYY0xdhHm4US
         GkSs8FUf+eNYhmvjpZxrDopmAVRox4QKM+SqwTSl6079T1+SzMFTItjZ4LyHxBJatljR
         HGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696877163; x=1697481963;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=15Qjgj7djDeAAXf961fVsM8P1Vswz7XY0us83EKsOMc=;
        b=l5sjP/w4rIN1sRGGdJA96sipDRNQAZN9L3HtmQ6Gv04KV9gCV98GIOdaPiZILatpH/
         dvwLb3u2fhQ6URadnCmgSacYE1GQNPJsssTKDtD4kC2TTFO/oso9JjBRXnTsXWeDMa9c
         5Gzx+uq6a6AX1Fnm5zn9OjV/XK8Ns7muOhe4k3CEyo4GNqFp3qCmGA5mnIeJ+kApyxJH
         DGHorlGfnPvzRQEH7zVoOdhDVteKTXFU00JKUxcAJ1eEmzvh+giPkc6Q3b46mfipzDsQ
         S+SrYwnJ6sfBNxHXHPRsctrMhirj6wzg9qdevvez9gWK8N2gj+q0qSIxy5mrnO04iOBq
         Y7Ew==
X-Gm-Message-State: AOJu0Ywkbd2Gs9k05rq5uGuEqPrukg3jyiKQ83EILRn47ftI11EysjPp
        PwLbYEp527uf+Wl1zHMAI/eCXQ==
X-Google-Smtp-Source: AGHT+IHCffpTRQFeYAsx+4qld9spxX5wjlkwirzhfyC7Tn3unR0EQXhXD9EpACD85Zr6FsfLhtzbtA==
X-Received: by 2002:a2e:bea3:0:b0:2c3:c75e:18cf with SMTP id a35-20020a2ebea3000000b002c3c75e18cfmr8915377ljr.0.1696877162733;
        Mon, 09 Oct 2023 11:46:02 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id p18-20020a2e9ad2000000b002c17dcd8d91sm2160058ljj.120.2023.10.09.11.46.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 11:46:02 -0700 (PDT)
Message-ID: <0b201558-d794-4675-a20f-58d00a8b1a53@linaro.org>
Date:   Mon, 9 Oct 2023 21:46:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/13] drm/msm/dsi: switch to devm_drm_bridge_add()
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
 <20231009181040.2743847-2-dmitry.baryshkov@linaro.org>
 <9cd7fcd1-19c3-ed9b-568d-4b67b3649e86@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <9cd7fcd1-19c3-ed9b-568d-4b67b3649e86@quicinc.com>
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

On 09/10/2023 21:39, Abhinav Kumar wrote:
> 
> 
> On 10/9/2023 11:10 AM, Dmitry Baryshkov wrote:
>> Make MSM DSI driver use devm_drm_bridge_add() instead of plain
>> drm_bridge_add(). As the driver doesn't require any additional cleanup,
>> stop adding created bridge to the priv->bridges array.
>>
>> Reviewed-by: Rob Clark <robdclark@gmail.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi.c         | 28 +++++--------------------
>>   drivers/gpu/drm/msm/dsi/dsi.h         |  3 +--
>>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 30 +++++++++------------------
>>   3 files changed, 16 insertions(+), 45 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c 
>> b/drivers/gpu/drm/msm/dsi/dsi.c
>> index d45e43024802..47f327e68471 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
>> @@ -215,20 +215,14 @@ void __exit msm_dsi_unregister(void)
>>   int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device 
>> *dev,
>>                struct drm_encoder *encoder)
>>   {
>> -    struct msm_drm_private *priv = dev->dev_private;
>>       int ret;
>> -    if (priv->num_bridges == ARRAY_SIZE(priv->bridges)) {
>> -        DRM_DEV_ERROR(dev->dev, "too many bridges\n");
>> -        return -ENOSPC;
>> -    }
>> -
>>       msm_dsi->dev = dev;
>>       ret = msm_dsi_host_modeset_init(msm_dsi->host, dev);
>>       if (ret) {
>>           DRM_DEV_ERROR(dev->dev, "failed to modeset init host: %d\n", 
>> ret);
>> -        goto fail;
>> +        return ret;
>>       }
>>       if (msm_dsi_is_bonded_dsi(msm_dsi) &&
>> @@ -242,32 +236,20 @@ int msm_dsi_modeset_init(struct msm_dsi 
>> *msm_dsi, struct drm_device *dev,
>>       msm_dsi->encoder = encoder;
>> -    msm_dsi->bridge = msm_dsi_manager_bridge_init(msm_dsi->id);
>> -    if (IS_ERR(msm_dsi->bridge)) {
>> -        ret = PTR_ERR(msm_dsi->bridge);
>> +    ret = msm_dsi_manager_bridge_init(msm_dsi);
>> +    if (ret) {
>>           DRM_DEV_ERROR(dev->dev, "failed to create dsi bridge: %d\n", 
>> ret);
>> -        msm_dsi->bridge = NULL;
>> -        goto fail;
>> +        return ret;
>>       }
>>       ret = msm_dsi_manager_ext_bridge_init(msm_dsi->id);
>>       if (ret) {
>>           DRM_DEV_ERROR(dev->dev,
>>               "failed to create dsi connector: %d\n", ret);
>> -        goto fail;
>> +        return ret;
>>       }
>> -    priv->bridges[priv->num_bridges++]       = msm_dsi->bridge;
>> -
>>       return 0;
>> -fail:
>> -    /* bridge/connector are normally destroyed by drm: */
>> -    if (msm_dsi->bridge) {
>> -        msm_dsi_manager_bridge_destroy(msm_dsi->bridge);
>> -        msm_dsi->bridge = NULL;
>> -    }
> 
> We can drop msm_dsi_manager_bridge_destroy() now but dont we need to 
> keep the part to reset msm_dsi->bridge to NULL in the fail tag if 
> msm_dsi_manager_ext_bridge_init() fails?

What for? This field is not read in the error /unbinding path.
I'll send a followup that drops msm_dsi->bridge completely.

> 
>> -
>> -    return ret;
>>   }
>>   void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct 
>> msm_dsi *msm_dsi)
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
>> b/drivers/gpu/drm/msm/dsi/dsi.h
>> index d21867da78b8..a01c326774a6 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi.h
>> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
>> @@ -56,8 +56,7 @@ struct msm_dsi {
>>   };
>>   /* dsi manager */
>> -struct drm_bridge *msm_dsi_manager_bridge_init(u8 id);
>> -void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge);
>> +int msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi);
>>   int msm_dsi_manager_ext_bridge_init(u8 id);
>>   int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg);
>>   bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len);
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c 
>> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>> index 28b8012a21f2..17aa19bb6510 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>> @@ -466,9 +466,8 @@ static const struct drm_bridge_funcs 
>> dsi_mgr_bridge_funcs = {
>>   };
>>   /* initialize bridge */
>> -struct drm_bridge *msm_dsi_manager_bridge_init(u8 id)
>> +int msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi)
>>   {
>> -    struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>       struct drm_bridge *bridge = NULL;
>>       struct dsi_bridge *dsi_bridge;
>>       struct drm_encoder *encoder;
>> @@ -476,31 +475,27 @@ struct drm_bridge 
>> *msm_dsi_manager_bridge_init(u8 id)
>>       dsi_bridge = devm_kzalloc(msm_dsi->dev->dev,
>>                   sizeof(*dsi_bridge), GFP_KERNEL);
>> -    if (!dsi_bridge) {
>> -        ret = -ENOMEM;
>> -        goto fail;
>> -    }
>> +    if (!dsi_bridge)
>> +        return -ENOMEM;
>> -    dsi_bridge->id = id;
>> +    dsi_bridge->id = msm_dsi->id;
>>       encoder = msm_dsi->encoder;
>>       bridge = &dsi_bridge->base;
>>       bridge->funcs = &dsi_mgr_bridge_funcs;
>> -    drm_bridge_add(bridge);
>> +    ret = devm_drm_bridge_add(&msm_dsi->pdev->dev, bridge);
>> +    if (ret)
>> +        return ret;
>>       ret = drm_bridge_attach(encoder, bridge, NULL, 0);
>>       if (ret)
>> -        goto fail;
>> +        return ret;
>> -    return bridge;
>> +    msm_dsi->bridge = bridge;
>> -fail:
>> -    if (bridge)
>> -        msm_dsi_manager_bridge_destroy(bridge);
>> -
>> -    return ERR_PTR(ret);
>> +    return 0;
>>   }
>>   int msm_dsi_manager_ext_bridge_init(u8 id)
>> @@ -557,11 +552,6 @@ int msm_dsi_manager_ext_bridge_init(u8 id)
>>       return 0;
>>   }
>> -void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge)
>> -{
>> -    drm_bridge_remove(bridge);
>> -}
>> -
>>   int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg)
>>   {
>>       struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);

-- 
With best wishes
Dmitry

