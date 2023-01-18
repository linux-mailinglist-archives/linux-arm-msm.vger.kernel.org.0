Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB3346710DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 03:09:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbjARCJl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 21:09:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjARCJb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 21:09:31 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB63246D71
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:09:29 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id w14so30389979edi.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h45c9opw5hKGTCcB/tsugF5F/flaauP/hx3l+Kv0DkI=;
        b=qkUVWE0bjBEHwI+TsqkgN6PQjtBXdQX9NeH3pCU/bBD7EHfUOyrc+IdUK8xo2bWcat
         vPznoNnvIg131hDNEXpeeYhdLkOypEZYx0VfhysCdQ8O9MlK97mg8GLJJCgw6Nf46gPD
         WgCer7blIAQsvg25hdKRenSPbecbty3jDnczXRh8db5U/Wequ3Zj5oHp1qKSQzAcyxnh
         D1lk2bqe+7wOUV0+R4DufB9gD73vKGVeZa+ff5VK8q1lJCLMbSkA4GYCSIdwKoEsYGV3
         RdznFyYeYt34ESAUiyEpM0Z+KPt2dkUNbnRvHEXgOuNTUXuCi6XHhAenPO3uvF9o3esL
         Dp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h45c9opw5hKGTCcB/tsugF5F/flaauP/hx3l+Kv0DkI=;
        b=bYRzyBa5nz/AlERu0CpdJl8/FWj02bOgjnY48D3YipfPCT1+PpUUwxoLISoVI+sb2N
         3OwVh71bOLXEysERRgITrn8nkRdUrR0CLvQcAi9pQAy4u+qszYxT+IVx3sJb6yJG5J64
         kV9Ox+kFzsv1twM7zXk61NKUf/Zh+ma671ugQ5i3MM9JRtEJ0K8LAx3VKrcLkhi74vNJ
         ZTg/l4uuU6AAMBZZmcPHU9KlCGGSkJXCvdaXfYbEBYd0uoRoCHtfZoyi6sXWcLNiVWxF
         6UnfbOpeLLT0c8dGvEChIfUQ5aAQ2Miiczxnp6ooRKCj3Zd+iMZQ7xl71qFULsuXnvus
         nZig==
X-Gm-Message-State: AFqh2krKsWTKVcvLbaT0zsdNiMQjmNqKiiaN9VsgDEXhiyXs1EGczfHQ
        qv1i3PaRN0ZDNET8nHGG4Cog6A==
X-Google-Smtp-Source: AMrXdXtYjWmMMXEO/y8EdQeWfRAezze5JZBQBsGcTw8ytazGrXWb3uQ2XuTWBKoHk50l+XCgwEI+bg==
X-Received: by 2002:a05:6402:5305:b0:499:8849:5fb6 with SMTP id eo5-20020a056402530500b0049988495fb6mr5465692edb.30.1674007768210;
        Tue, 17 Jan 2023 18:09:28 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id r8-20020aa7c148000000b0046951b43e84sm13495464edp.55.2023.01.17.18.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 18:09:27 -0800 (PST)
Message-ID: <80a826c0-1d4d-fd0f-5ae6-06ceaaf4abd7@linaro.org>
Date:   Wed, 18 Jan 2023 04:09:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] drm/msm/dpu: point sc8280xp_dpu_cfg to
 sc8280xp_regdma
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230118020455.1689929-1-dmitry.baryshkov@linaro.org>
 <785376c2-26de-10c4-c7a0-22ebb2c086fd@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <785376c2-26de-10c4-c7a0-22ebb2c086fd@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/01/2023 04:08, Abhinav Kumar wrote:
> 
> 
> On 1/17/2023 6:04 PM, Dmitry Baryshkov wrote:
>> SC8280XP configuration missed the reg_dma configuration. We do not use
>> regdma for now, but let's put the correct pointer anyway.
>>
>> Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 4375e72a9aab..3d0fbc1746e2 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -2680,6 +2680,8 @@ static const struct dpu_mdss_cfg 
>> sc8280xp_dpu_cfg = {
>>       .intf = sc8280xp_intf,
>>       .vbif_count = ARRAY_SIZE(sdm845_vbif),
>>       .vbif = sdm845_vbif,
>> +    .reg_dma_count = 1,
> 
> Lets stick to the convention of the rest of the entries and use ARRAY_SIZE.

regdma is not an array, so all platforms use 1 here. We should probably 
change this, as some of newer platforms seem to have two regdma blocks, 
but I haven't taken a look into that.

> 
>> +    .dma_cfg = &sc8280xp_regdma,
>>       .perf = &sc8280xp_perf_data,
>>       .mdss_irqs = IRQ_SC8280XP_MASK,
>>   };

-- 
With best wishes
Dmitry

