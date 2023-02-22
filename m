Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 215F469FE62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Feb 2023 23:22:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231822AbjBVWW0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 17:22:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbjBVWWZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 17:22:25 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 366AE5260
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 14:22:24 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id i9so11809087lfc.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 14:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=66MRGmo07dAj6divz1C/wa7faZ32iZUg4njKrZLIf+U=;
        b=nst5zbssUo/k6UpD0f8ek3m428X+GYcsneujD9Qkmgj4uta+nCdwdn2P3GZbexeusF
         Pn5SuSqbswwSzS1UsPN5d1SOdJELMeF3t+ETG66M+2dGliodPOOAuBvf11jPSb3xTzeb
         E7PnUkolyzEdPPNnagaiy7aMj4SjSN4iewPfPxTCAzNC5+OSUaS2k5tkZCyHpu7EGTP5
         zlovrlaN2NDDoOpolcyxFZHBXMmj2snbt5uon+LLGFTuDJvdi4PjrwrTHuKW9u+fJVzG
         eoF5w2D3Dqq+qw9cCIFEfrWTce18jMvCVPtaxqJUd/WFowQD04MOtfCvcQNsm+szJzkH
         r6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=66MRGmo07dAj6divz1C/wa7faZ32iZUg4njKrZLIf+U=;
        b=u73jMtA6SEWtE9YeFKeHGgaU/xFqbx7oszIoWtDIkxSAM3konShKTArsrn6Q+QVomG
         PFnkjLidgnqtchPEhyWZJStatzduOwIGpcpwzzUmVA2DzbrhxNMR9p9SCCsB5GC9j0pM
         3jNdf06mTYBRw/DaSTZLUIRpWOFq5hGSH4QUaXymwTCPczsDcNSziOgBciQKvtD0itFZ
         rVIwxvIxLWgYTCQoasHZPn/0q78kgbYjINYG4u6st+7OAmzoe0W7Y72Tqr0s/k+U8iTT
         MUa20u75YG4PqyfF8wGdT62zAMRUm7mzz6O9NDcWG83WLTMrXKzfszSqhCXF2qoqiz49
         UqyQ==
X-Gm-Message-State: AO0yUKVurOHCrEoMThCoLN8SF8kRtbfj9I2DwJAH7NRoDzT+4z/DoBB7
        scan9l7A4lv6BX7eq9Lu7Bjqww==
X-Google-Smtp-Source: AK7set/Hoxv+DXhZGlHOqXKcOoVOEr2g826xMkiXRewh2j07fSAZPFs14KzXRT7M2u1OggXstJdYIw==
X-Received: by 2002:a19:f514:0:b0:4d5:ae35:b220 with SMTP id j20-20020a19f514000000b004d5ae35b220mr3370352lfb.8.1677104542461;
        Wed, 22 Feb 2023 14:22:22 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id q8-20020a2eb4a8000000b002934fe524d2sm958159ljm.83.2023.02.22.14.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 14:22:22 -0800 (PST)
Message-ID: <509a813c-1bc3-8ff9-de2c-26ffe0b92a8a@linaro.org>
Date:   Thu, 23 Feb 2023 00:22:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 5/5] drm/msm/a5xx: Enable optional icc voting from OPP
 tables
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230222-konrad-longbois-next-v1-0-01021425781b@linaro.org>
 <20230222-konrad-longbois-next-v1-5-01021425781b@linaro.org>
 <4b9145e0-0526-dd08-2d92-05a49e50e3bc@linaro.org>
 <34cd34f8-86b1-0b8f-6812-fe613e9ffa82@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <34cd34f8-86b1-0b8f-6812-fe613e9ffa82@linaro.org>
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

On 23/02/2023 00:14, Konrad Dybcio wrote:
> 
> 
> On 22.02.2023 23:12, Dmitry Baryshkov wrote:
>> On 22/02/2023 23:47, Konrad Dybcio wrote:
>>> Add the dev_pm_opp_of_find_icc_paths() call to let the OPP framework
>>> handle bus voting as part of power level setting.
>>
>> This can probably go to the generic code path rather than sticking it into a5xx only.
> The reasoning is explained in the cover letter, a3xx/a4xx already
> have "raw" icc set calls which would require more work (and above
> all, testing) to untangle while keeping backwards compat, this is
> a midterm solution that would allow getting scaling to work earlier.

Those two platforms call icc_set_bw() during setup, however their opp 
tables do not contain BW settings, making dev_pm_opp_of_find_icc_paths() 
nop. So, I think, we might as well call this function on a3xx/a4xx, 
making the code future proof.

> 
> Konrad
>>
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>>> index d09221f97f71..a33af0cc27b6 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>>> @@ -1775,5 +1775,9 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>>>        /* Set up the preemption specific bits and pieces for each ringbuffer */
>>>        a5xx_preempt_init(gpu);
>>>    +    ret = dev_pm_opp_of_find_icc_paths(&pdev->dev, NULL);
>>> +    if (ret)
>>> +        return ERR_PTR(ret);
>>> +
>>>        return gpu;
>>>    }
>>>
>>

-- 
With best wishes
Dmitry

