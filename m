Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95CD5707326
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 May 2023 22:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbjEQUhr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 16:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbjEQUhq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 16:37:46 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 276357DBC
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 13:37:45 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-3f5279cc284so7478041cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 13:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20221208.gappssmtp.com; s=20221208; t=1684355864; x=1686947864;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nd95zhhtmNXtBX59kF7y65BjH3ar6yRI0Y4zyHIW4wk=;
        b=eJbPgNf3m9vujApqYlb1sFPr9A4f7LX3324A9oEvp9HWaqfYN6Hutb1noE7GpLQ9SC
         mRAg7yfwpzkNUVSwuZHRNRH8ThTNAMRRBICX8lBs7NWbzjvg7PuP5LHqA2XOfGkZsxSC
         X4cygj5u6KOOpQhzPCGNGD4uxYwoFWPcx/O5EzJmWLRlboriI0ojzv3x03oRQ+WEcAAf
         pNvxFsEQWkgSY6Kx6dcreRdsR5KFvpO07uj+zKWkai9P9c3sqzAGy/pnz+HS1m2cd9RU
         HVLORdUC7PKK9uQHCrfXYv6rE81VDTnKG+Xbz6HbOVD55do/pmHmis+fdZNyQW1T/UVn
         rhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684355864; x=1686947864;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nd95zhhtmNXtBX59kF7y65BjH3ar6yRI0Y4zyHIW4wk=;
        b=KHRPs5h3WjMc36EJrbouxP0UScOO5MDvu71LLl75ecPecHtcyMNuuPBddt9H395v5F
         k1yxvgBByZztdZOS68ulMpovL9oZSr79/4MDOliuOvKmuNc3WOldmiLBiK4j8wklfADV
         XU6mNI0Mp8gqnK842NFp8uHVwuIxtGZHoWEGYR6raA+tdYNhqcp0ms98IMNGL7Vzge+F
         OuF/dvrmIiz7/CQSRUzzccl5AUxf5LpKj5uT1LgOHf6+f57+nlCNqxpnZQGCqktdiOQ5
         HsGh2SJWREvyvcWDfMSy/hSj036CHF14r5cbHOqw0+/hzWUaZWOFUvPsu5lis3bCPxX/
         s4Fg==
X-Gm-Message-State: AC+VfDxt9rMaPGXH0a5zwTVK5Hi6vDSZRxgRY2OYCeZSXopI9hYCYfbt
        PBe52RPxhU65IDtn/CSG4QmTlg==
X-Google-Smtp-Source: ACHHUZ7J9aBtNZy6jSbssY1QX/EXXLo2c/s/iGydJ6gAcx1ar0JTlQCZ+4v63mW8DUHJP8V6cXZiJQ==
X-Received: by 2002:a05:622a:34a:b0:3f5:a0a:b30c with SMTP id r10-20020a05622a034a00b003f50a0ab30cmr1692172qtw.42.1684355864262;
        Wed, 17 May 2023 13:37:44 -0700 (PDT)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id bv24-20020a05622a0a1800b003f3c9754e1dsm6799969qtb.17.2023.05.17.13.37.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 13:37:44 -0700 (PDT)
Subject: Re: [Freedreno] [PATCH 5/6] drm/msm/a6xx: Use GMU_ALWAYS_ON_COUNTER
 for GMU-equipped GPUs in timestamp
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        freedreno@lists.freedesktop.org
References: <20230517-topic-a7xx_prep-v1-0-7a964f2e99c2@linaro.org>
 <20230517-topic-a7xx_prep-v1-5-7a964f2e99c2@linaro.org>
 <aaab25be-3403-518d-e639-c80b0930906a@marek.ca>
 <88f04ec5-f41b-d918-56e7-642bf13fa795@linaro.org>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <116c5501-8f30-ada9-4d09-0e104d361b27@marek.ca>
Date:   Wed, 17 May 2023 16:33:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <88f04ec5-f41b-d918-56e7-642bf13fa795@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/17/23 3:08 PM, Konrad Dybcio wrote:
> 
> 
> On 17.05.2023 20:09, Jonathan Marek wrote:
>> AFAIK GMU_ALWAYS_ON_COUNTER does not have the same value as CP_ALWAYS_ON_COUNTER (only the same frequency), so changing this would break userspace expecting to be able to compare the value returned by MSM_PARAM_TIMESTAMP with CP timestamp values.
> FWIW A630 and A730 seem to work fine with this patch. Anything
> in particular I should look out for?

mesa uses it for perfetto tracing to synchronize the GPU/CPU timelines.

> 
> Konrad
>>
>> On 5/17/23 12:50 PM, Konrad Dybcio wrote:
>>> Use the always-on counter provided by the GMU to skip having to
>>> keep the GPU online.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 9 +++------
>>>    1 file changed, 3 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> index 8707e8b6ac7e..d2a999b90589 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> @@ -1664,12 +1664,9 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>>>          mutex_lock(&a6xx_gpu->gmu.lock);
>>>    -    /* Force the GPU power on so we can read this register */
>>> -    a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
>>> -
>>> -    *value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER);
>>> -
>>> -    a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
>>> +    *value = gmu_read64(&a6xx_gpu->gmu,
>>> +                REG_A6XX_GMU_ALWAYS_ON_COUNTER_L,
>>> +                REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
>>>          mutex_unlock(&a6xx_gpu->gmu.lock);
>>>   
