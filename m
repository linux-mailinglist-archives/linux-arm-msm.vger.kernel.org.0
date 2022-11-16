Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9247C62C245
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 16:19:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233421AbiKPPT2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 10:19:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234452AbiKPPTB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 10:19:01 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 403B348763
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 07:18:40 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id l8so22184166ljh.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 07:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=he8mFZOBs1BvDVjn5opl2MtZ0ur6XPJl6SpGq2658M8=;
        b=vwMTJ5pIkGEoaz0oXODpU2Ez3BIxpc2QEfeB7VT+/2pa2GZsfVgBeg4hm0F5E8wjqR
         PFCsrOrIlX/Ni6yTgehE031bVkTkdQdJ8vdHZpLDaOFxxvOUtT/qOWMsvDe3MhEnqq9F
         HmehlVfaKvICqRnu0pe2ftMIdJ6bXdmkTQy4BGMhhHZS50rRbid8B+kvpSAGoDAFt4ad
         OjaktdrUe6SP1lYfz/siC2YQAqabqgOyt+OxrdsucT4/IG/JEBZsOvMVwVW+6xjgQR+e
         iTBeu//obUbrkYyxRFxrvNNAsK9y24c7cD2wyXrUAOQvejlemS1JUmoOjPIeF5nimHnO
         b8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=he8mFZOBs1BvDVjn5opl2MtZ0ur6XPJl6SpGq2658M8=;
        b=IwwDa4NE3qSbUNFMMsr984AcE3jFV6jpWHFUGvBoVuTw5DYuI22m1gMM2IRCMNRNhp
         xwdV/nqDN4oLlj1cNjK+HpkY9O5fHm4bv9MkSIof/FxQrFuU98HR4f1b7+8uD8sHkqHo
         DrtbTKnC/mZsyjo8xZvxU+4Z97zf38SYX60+nM7OsGQPc1PaBme05c2pOjUIP6R0Tgy+
         KBaePdeZzUN3pZSwGCzUmlUYgjTpXBp/8BeR8B/cTuI3dj0yugs+pZ5tqFK6QnnQUHfV
         tWF+4reeFO8tNeTfsKT4aP257QgRiintD9+4N+0KSpz7OcXTIALUji3NfThRJseFcOu6
         1uHg==
X-Gm-Message-State: ANoB5pnmqTW2lNA0bCzJp1w6suZYJ4PmtGgS7eD4np/EkCeNIkPDbdm5
        CjauLpRI1HTdf2FEuDJsTdijDg==
X-Google-Smtp-Source: AA0mqf5AEp0f4Lf+TWHAP2v3bsxDMFqXBah6Ayj6Jb6UF8vkvfk6rYmAvCDMdHmyExU4UWZbiwhFNw==
X-Received: by 2002:a05:651c:2314:b0:26e:2772:ffab with SMTP id bi20-20020a05651c231400b0026e2772ffabmr7494107ljb.97.1668611918933;
        Wed, 16 Nov 2022 07:18:38 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f12-20020a2eb5ac000000b0026e15713edesm3038815ljn.9.2022.11.16.07.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 07:18:38 -0800 (PST)
Message-ID: <bf14540a-745c-c378-520a-f8edfd3e3adf@linaro.org>
Date:   Wed, 16 Nov 2022 18:18:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 2/3] drm/msm/disp/dpu1: add helper to know if display
 is pluggable
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, robdclark@chromium.org,
        dianders@chromium.org, swboyd@chromium.org,
        quic_vpolimer@quicinc.com
References: <1668609040-2549-1-git-send-email-quic_kalyant@quicinc.com>
 <1668609040-2549-3-git-send-email-quic_kalyant@quicinc.com>
 <e049f5b1-da41-6854-4731-b6697770ffde@linaro.org>
 <6b1907db-3fdb-8fe0-e5e3-21ea17021925@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <6b1907db-3fdb-8fe0-e5e3-21ea17021925@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/11/2022 18:11, Abhinav Kumar wrote:
> 
> 
> On 11/16/2022 7:08 AM, Dmitry Baryshkov wrote:
>> On 16/11/2022 17:30, Kalyan Thota wrote:
>>> Since DRM encoder type for few encoders can be similar
>>> (like eDP and DP) find out if the interface supports HPD
>>> from encoder bridge to differentiate between builtin
>>> and pluggable displays.
>>>
>>> Changes in v1:
>>> - add connector type in the disp_info (Dmitry)
>>> - add helper functions to know encoder type
>>> - update commit text reflecting the change
>>>
>>> Changes in v2:
>>> - avoid hardcode of connector type for DSI as it may not be true 
>>> (Dmitry)
>>> - get the HPD information from encoder bridge
>>>
>>> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 16 ++++++++++++++++
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  6 ++++++
>>>   2 files changed, 22 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> index 9c6817b..be93269 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> @@ -15,6 +15,7 @@
>>>   #include <drm/drm_crtc.h>
>>>   #include <drm/drm_file.h>
>>>   #include <drm/drm_probe_helper.h>
>>> +#include <drm/drm_bridge.h>
>>>   #include "msm_drv.h"
>>>   #include "dpu_kms.h"
>>> @@ -217,6 +218,21 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
>>>       15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
>>>   };
>>> +bool dpu_encoder_is_pluggable(struct drm_encoder *encoder)
>>> +{
>>> +    struct drm_bridge *bridge;
>>> +    int ops = 0;
>>> +
>>> +    if (!encoder)
>>> +        return false;
>>> +
>>> +    /* Get last bridge in the chain to determine pluggable state */
>>> +    drm_for_each_bridge_in_chain(encoder, bridge)
>>> +        if (!drm_bridge_get_next_bridge(bridge))
>>> +            ops = bridge->ops;
>>> +
>>> +    return ops & DRM_BRIDGE_OP_HPD;
>>
>> No. This is not what you should be checking (hint: polled connectors 
>> also can be pluggable).
>>
>> Please check the type of the actual connector connected to this encoder.
>>
> 
> Even if we check the connector type as DSI or eDP that does not 
> necessarily mean its built-in.
> 
> We can even use DSI or eDP as a pluggable display.

Well, I don't think so. eDP and DSI connectors are not pluggable per 
design. One can use them so, but they are not thought to be used this 
way. Unlike e.g. HDMI, DP, VGA, etc.

I would say LVDS, eDP, DSI, DPI and SPI can be assumed to be constantly 
plugged.

Compare this with Composite, SVIDEO, 9PinDIN, TV. They can be assumed to 
be external even if they do not have the HPD (or even polling). And 
these connectors usually don't have it.

> 
> Thats why we thought of this check.
> 
-- 
With best wishes
Dmitry

