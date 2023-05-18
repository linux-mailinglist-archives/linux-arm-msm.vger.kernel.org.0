Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18341708A62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 23:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbjERV0j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 17:26:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbjERV0i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 17:26:38 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C212DE45
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 14:26:36 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f387d97dddso2987451e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 14:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684445195; x=1687037195;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t5y+SJ44ed16wCOTDLmLDzgIx2JaLtLRHFSw4/rCRS4=;
        b=Rdrjl1adp6g2FuL8l3mXU/M/JnPyPv9h9UaqAjcAT1BpEzKeS0JctH+d6BAHqfZpb3
         lWJwAi1iEO16Dc5hIQyQ1dbfTkXyuiiuhpm8wn9le/4dqMpDvTfIpxJmevoMFfnfDrko
         OHVjR2lwXz8eWHefFKwcSyJ8hOz8LOnbXxGtKeUll7PNYNQpV6zfpUelppZpZyNp8+kS
         2d1PePsx8usr+8+inEeziFPWpHOrqNKc7l8pNiRDdkLXxyv1DyqJvl14Zju3a2QeP9iZ
         5iBZFURpGWEHMEu9VseRhgFs5hmgpm3I2EC2MEcwRgeWXaRrULBYzhw6WQkP2pa2tYB7
         SdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684445195; x=1687037195;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t5y+SJ44ed16wCOTDLmLDzgIx2JaLtLRHFSw4/rCRS4=;
        b=CBa9IWbF4Py+P7u4/he/oHtb4aUVW1Ff5aOPg5j0Fn+kj0gd5y3bQLmTVehyWvsMwc
         JmFG9Q1pBtYJ6iv5ObC0+0OIP2C+/rByY7U8mk20skWwO/pdJ0Bj8ts8RXuVvuNlh2ci
         4cFxJ4hlFmCkKcmWzel5RkmAsx3XpXus7bZQi4o3kPcvRma+f7LUiOsrjSVgTLkidKqU
         skDw40nyafKwkc4CNnzHLcPf9LVd3Ayu/IDY1/lgbIq5mXB1VMyU8C3BZ1V2ne2UH5ej
         GNVmUT35uI00kxTWHbjoXSsHjLKjg3huBfavsIOGFdAGnAnBlxfYmeekXkuv836R5VzG
         mGSw==
X-Gm-Message-State: AC+VfDwVvTByo4UJyiAoZhVmyotSoFV3R3CJjqlM4pvx/P9ZGsKrVqPv
        gKjwmem0GSIEbCGljVEvdlNmYg==
X-Google-Smtp-Source: ACHHUZ7B1k1e6l4HEpUzye5ClfUpHuPl41iqsuHkLeVuwMzkdRBYUqoCzs/IgEyza1JzSDw/IQR0HQ==
X-Received: by 2002:ac2:4c39:0:b0:4db:964:51b5 with SMTP id u25-20020ac24c39000000b004db096451b5mr74987lfq.41.1684445195029;
        Thu, 18 May 2023 14:26:35 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id b20-20020ac247f4000000b004eaeb0a984csm369403lfp.88.2023.05.18.14.26.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 14:26:34 -0700 (PDT)
Message-ID: <2c688487-a5b1-155c-f73a-69358d03e478@linaro.org>
Date:   Fri, 19 May 2023 00:26:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 4/4] drm/msm/dpu: drop DSPP_MSM8998_MASK from hw
 catalog
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230428223646.23595-1-quic_abhinavk@quicinc.com>
 <20230428223646.23595-4-quic_abhinavk@quicinc.com>
 <kap4lpzbv5qihf2k7fdznmx72hrhpx4acjgcng45kxnshxo6ge@gzke6ruy3x6u>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <kap4lpzbv5qihf2k7fdznmx72hrhpx4acjgcng45kxnshxo6ge@gzke6ruy3x6u>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/05/2023 22:41, Marijn Suijten wrote:
> On 2023-04-28 15:36:46, Abhinav Kumar wrote:
>> Since GC and IGC masks have now been dropped DSPP_MSM8998_MASK
>> is same as DSPP_SC7180_MASK. Since DSPP_SC7180_MASK is used more
> 
> is *the* same

And, I think, a comma is missing before DSPP_MSM8998_MASK.

Note: since the English language is not native for most of the 
developers, I usually don't nitpick on these issues provided we can 
understand the message without too much trouble (and the mistake doesn't 
stand out aloud, begging for it to be fixed).

I will fix missing articles when applying, if I don't forget.

> 
>> than DSPP_MSM8998_MASK, lets drop the latter.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 4 ++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 2 --
>>   2 files changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> index bdcd554fc8a8..a4679f72a262 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> @@ -127,9 +127,9 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
>>   };
>>   
>>   static const struct dpu_dspp_cfg msm8998_dspp[] = {
>> -	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
>> +	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
>>   		 &msm8998_dspp_sblk),
>> -	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_MSM8998_MASK,
>> +	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
>>   		 &msm8998_dspp_sblk),
>>   };
>>   
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 791a6fc8bdbf..efd466f6122b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -91,8 +91,6 @@
>>   
>>   #define MERGE_3D_SM8150_MASK (0)
>>   
>> -#define DSPP_MSM8998_MASK BIT(DPU_DSPP_PCC)
>> -
>>   #define DSPP_SC7180_MASK BIT(DPU_DSPP_PCC)
> 
> Should we add preliminary parenthesis around this?
> 
> - Marijn
> 
>>   
>>   #define INTF_SDM845_MASK (0)
>> -- 
>> 2.40.1
>>

-- 
With best wishes
Dmitry

