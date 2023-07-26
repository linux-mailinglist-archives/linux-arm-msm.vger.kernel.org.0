Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BAA6762E82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jul 2023 09:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232709AbjGZHrq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jul 2023 03:47:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231624AbjGZHrR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jul 2023 03:47:17 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9B1C3C3C
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 00:42:27 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fcd615d7d6so9846356e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 00:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690357346; x=1690962146;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/08uQeCkaNUO7puYAdqDJO/ANNhApw8h3gYIxItdyCk=;
        b=t+tJXGja9F2voo1BEr3CvgzjGXwhLFlYB1xa9hwWKiR8CDGSbxYcI7gB/9Dd8I+vAP
         Z+3RCa3vvo8TmqCA1hjJ8DF4tPOA/tXEV6trFjtwOuEpD/ca36l7NViAD+6aflpxAad3
         CDzqBNvbRxfm6+oUDsO1xfjUzIzVtUlBzNbJylfoJff1WEVLUtmdzeHIBTGBGeHLVHh/
         ZnjopUNw+1eF1rmmOapoJotkuyhYH80A5OSN6ddb4qiY1tckCYIMNTgOmMiE07ESYros
         CUTPoLAuVy5joHZSWFcFVvEB+ceQ0ibb9gjY+7B1TveIzVxQQVTpBGgc3WclHRcZcM0+
         u9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690357346; x=1690962146;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/08uQeCkaNUO7puYAdqDJO/ANNhApw8h3gYIxItdyCk=;
        b=CWvSb/3LlUf3/Bn5ykJQoK0QJrSYdzctHAaiL6ikNvkedCQC7i+gAsBBavhgmmBJW8
         KAE5ynpt8eysQ1pwwpDdCvJODceVhFkKcD/4xTGQZfjQ2WSILiKDpaFFkbJH7LAMPZh3
         IBDBMWCssG8s3BfT+N/ORe9/zSsEfyxskDhJDeaIqrLPxp26oqvnfkkeQ0kkz851wEoB
         tZxjR0zk5nPJzz/kwKgA7Dy5fFLrEsSGzg+76R+sCGNH87XTC/d/fBL9kadxyaBt79No
         KsslmPDRmpL2FxFSlk317s98K28mAw1WzOhNFkBOiQK9rmqqnSaMM/rKtOX2bUAl67VI
         1T9g==
X-Gm-Message-State: ABy/qLYNPZVP5cxrr5haUs7ULH17Tl4nauyahTPBmm5aatL3gj1KMIuE
        lfib0aK83VwOpjgQXZHbKNVbMw==
X-Google-Smtp-Source: APBJJlFFwgEVKf8tYFkiMyKAky8tcAr0JMNqJHOLJCBO8NLM/tKq8+3nppgeHiMZkoA2dNj0lM8rnQ==
X-Received: by 2002:ac2:4f0e:0:b0:4f8:5e8b:5ec8 with SMTP id k14-20020ac24f0e000000b004f85e8b5ec8mr1034890lfr.9.1690357346098;
        Wed, 26 Jul 2023 00:42:26 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id f12-20020a19ae0c000000b004fb737737f9sm3164673lfc.106.2023.07.26.00.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 00:42:25 -0700 (PDT)
Message-ID: <6cdef93d-85af-f12c-0782-da31728809df@linaro.org>
Date:   Wed, 26 Jul 2023 10:42:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dt-bindings: display: msm: sm6125-mdss: drop unneeded
 status from examples
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230725101610.75122-1-krzysztof.kozlowski@linaro.org>
 <5w2hvzmwzqm4ffopzewveaviebq2ig7awimeo6ipcehx5a43ae@mlwffkf2ctn5>
 <11eca956-9e91-f645-9cc7-4c9f534d9821@linaro.org>
 <5576059f-ba53-1096-396e-ccfb5f9d86f1@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <5576059f-ba53-1096-396e-ccfb5f9d86f1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/07/2023 10:31, Krzysztof Kozlowski wrote:
> On 26/07/2023 09:27, Krzysztof Kozlowski wrote:
>> On 25/07/2023 13:46, Marijn Suijten wrote:
>>> On 2023-07-25 12:16:10, Krzysztof Kozlowski wrote:
>>>> Example DTS should not have 'status' property.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> ---
>>>>   .../devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml   | 6 ------
>>>
>>> This is not needed: it has already been corrected in v3 and v4 of the
>>> respective series (among other changes) and the patches were only picked
>>> to a preliminary (draft) pull to get an overview of the outstanding work
>>> for this subsystem.  That branch happens to be included in regular -next
>>> releases though.
>>>
>>> 6.6 drm/msm display pull: https://gitlab.freedesktop.org/drm/msm/-/merge_requests/69
>>> v3: https://lore.kernel.org/linux-arm-msm/20230718-sm6125-dpu-v3-0-6c5a56e99820@somainline.org/
>>> v4: https://lore.kernel.org/linux-arm-msm/20230723-sm6125-dpu-v4-0-a3f287dd6c07@somainline.org/
>>
>> What do you mean? The old code (one I am fixing) is in current next...
>>
>> If this was fixed, why next gets some outdated branches of drm next?
>> Each maintainers next tree is supposed to be fed into the next, without
>> delays.
>>
> 
> Ah, I think I understood - some work in progress was applied to
> work-in-progress branch of drm/msm and this somehow got pushed to
> linux-next? How anyone is supposed to work on next branches if they are
> outdated or have stuff known to be incomplete?

The drm/msm & bindings parts were considered final, but then I failed to 
send 'applied' series for some reason. And then it was natural for 
Marijn to send an updated revision.

-- 
With best wishes
Dmitry

