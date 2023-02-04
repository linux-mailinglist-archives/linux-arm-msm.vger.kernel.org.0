Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22F5868A7D0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Feb 2023 03:30:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbjBDCaB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 21:30:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbjBDCaA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 21:30:00 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3055C78AD2
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Feb 2023 18:29:59 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id dr8so20165676ejc.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Feb 2023 18:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iUH4Dpa4E/+p8DNNAiGBKYh1jmAMNSUIhKEu7c2nbrM=;
        b=fq7UUstALHqsXy9CinxI8gtwsRQwIwwzF+KlJEcH9dAvJTm1peLM9zoGHK6Z4vMIbt
         ej/z+y1tUutrX+p1NPAU3O8JGdEP5AhrnZSQ7SUZLv6G5uMBQs+JaooR00cCGRzpOzFH
         p/qk0CkWpSNMAHeMgWOd6eG6QOfDdHMPQMjgLmGoeqv9ZqDqKJKF/uv4jtdv8m/Uq4et
         lL2pHcX1oqTJ5AKuzM9IlPMKIe3kKCGbQPAlDOcJqU8X/QHSjpHMjUx4PzhOfNZiG1Pk
         QmaRS12Iq7nb1xX+t/k22mLFOCka7PS5z4KeNBnBb3gRsSXAfwNFeHmQA4P6Yh7yj/b0
         NlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iUH4Dpa4E/+p8DNNAiGBKYh1jmAMNSUIhKEu7c2nbrM=;
        b=dsnAv0X8y+L9Svf06WEQ81YDPnIdTmudVJyG3ZaccS9xPnqSnejcr45OY6lEvrdsqP
         ao5JdD29cZAWMGFQlJnbXliW9/jMEqV/B8e2Gpij5UJhueNPpvikwnbjVYqfOxHjMqgo
         iJ9+h5dpy+00e1Nm6SWE3wZZjWq21AT67PMQxUYYD347x8BpSrqFnSg5KoQ9yjyJlZMZ
         p+T/u+cr+8lyA4rDU0PzmghOvDH9JxT2obqnH85V26p3sZir83U2gfwwI2Z2IOZ2DhoE
         14SQZY+cKgLiNBR3jPn9/oASGOHEXpz8r63/ARbttuwr+d3bGZk4iQzl72mCRZ3+dHar
         90VQ==
X-Gm-Message-State: AO0yUKXNOGkmeY+zVvscAuK1XG5UlipNconiCMsy0jycUfzab4Y/s/zz
        R/zfjAe91qEWu+pfsaJMpZTvUg==
X-Google-Smtp-Source: AK7set8ODmOQ3oIjx+VLPwwyC6C4k23xPs4bcTwN/C3t7GloZ1dUNZsAiIqF3OFcleQSoWWEfY+qPQ==
X-Received: by 2002:a17:907:7ea9:b0:88d:ba89:184b with SMTP id qb41-20020a1709077ea900b0088dba89184bmr8043772ejc.28.1675477797729;
        Fri, 03 Feb 2023 18:29:57 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id rn26-20020a170906d93a00b008845c668408sm2172049ejb.169.2023.02.03.18.29.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 18:29:57 -0800 (PST)
Message-ID: <3754a9a9-8b64-62ae-0b0d-f379debefa16@linaro.org>
Date:   Sat, 4 Feb 2023 04:29:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 18/27] drm/msm/dpu: populate SmartDMA features in hw
 catalog
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-19-dmitry.baryshkov@linaro.org>
 <c04a01d1-0375-16be-b8d0-022704ae89a5@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c04a01d1-0375-16be-b8d0-022704ae89a5@quicinc.com>
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

On 04/02/2023 01:35, Abhinav Kumar wrote:
> 
> 
> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>> Downstream driver uses dpu->caps->smart_dma_rev to update
>> sspp->cap->features with the bit corresponding to the supported SmartDMA
>> version. Upstream driver does not do this, resulting in SSPP subdriver
>> not enbaling setup_multirect callback. Add corresponding SmartDMA SSPP
>> feature bits to dpu hw catalog.
>>
> 
> While reviewing this patch, I had a first hand experience of how we are 
> reusing SSPP bitmasks for so many chipsets but I think overall you got 
> them right here :)
> 
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 +++++++---
>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index cf053e8f081e..fc818b0273e7 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -21,13 +21,16 @@
>>       (VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
>>   #define VIG_SDM845_MASK \
>> -    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
>> +    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3) |\
>> +    BIT(DPU_SSPP_SMART_DMA_V2))
>>   #define VIG_SC7180_MASK \
>> -    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
>> +    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4) |\
>> +    BIT(DPU_SSPP_SMART_DMA_V2))
>>   #define VIG_SM8250_MASK \
>> -    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | 
>> BIT(DPU_SSPP_SCALER_QSEED3LITE))
>> +    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | 
>> BIT(DPU_SSPP_SCALER_QSEED3LITE) |\
>> +    BIT(DPU_SSPP_SMART_DMA_V2))
>>   #define VIG_QCM2290_MASK (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL))
>> @@ -42,6 +45,7 @@
>>   #define DMA_SDM845_MASK \
>>       (BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
>>       BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
>> +    BIT(DPU_SSPP_SMART_DMA_V2) |\
>>       BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
>>   #define DMA_CURSOR_SDM845_MASK \
> 
> VIG_SDM845_MASK and DMA_SDM845_MASK are used for many other chipsets 
> like 8250, 8450, 8550.
> 
> At the moment, for visual validation of this series, I only have 
> sc7180/sc7280. We are leaving the rest for CI.
> 
> Was that an intentional approach?
> 
> If so, we will need tested-by tags from folks having 
> 8350/8450/8550/sc8280x,qcm2290?
> 
> I am only owning the visual validation on sc7280 atm.

I'm not quite sure what is your intent here. Are there any SoCs after 
845 that do not have SmartDMA 2.5? Or do you propose to enable SmartDMA 
only for the chipsets that we can visually test? That sounds strange.

-- 
With best wishes
Dmitry

