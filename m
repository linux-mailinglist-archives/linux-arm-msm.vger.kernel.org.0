Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFAB1789678
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Aug 2023 14:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232740AbjHZMGB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Aug 2023 08:06:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232738AbjHZMFc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Aug 2023 08:05:32 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11938DC
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 05:05:29 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fee8b78097so15368545e9.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 05:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693051527; x=1693656327;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pxZ6783DRoORgpEw4bmAN1NBzsg/pJKjg2XMcvaxxgY=;
        b=rlar3IyM1EE9xaOIjXG+VMGMEGxel8ZTCZ+xn1/qIG7u6U8TQy27yryC/4WtDuCoxH
         BzU5nKGMDuBUWnDrdc8Y9mks8XRSrZQSobk64EvBRAmhhrAcwXzXYie+FaZuEfKLsQFN
         Y5kZiDYzCr8dixTJZp/LMzo7LQI6sN1q0vYKt1g9jJ1VK2/qy4m9hbSVSvelCWnT2mIJ
         B+y90D3YRDmdXFaYKqtM0MDb3JilJrvc/BhfWzFN9KSrtKISLSsHR1UrQ96shxq24C6h
         8N5V8wOMwZCu4z72yTF6RYPeRGj3/w5H1juGhChn6TtiDDZtUYvQvY5fyA8zw/FyQrU7
         HS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693051527; x=1693656327;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pxZ6783DRoORgpEw4bmAN1NBzsg/pJKjg2XMcvaxxgY=;
        b=d26UJvrTsJ6whr26dWhvmd2s5fO0UstRERUyIv6kxtu5BcfFHXJVcCSn4s6BO32+YV
         VjqyCYJeZA7HPqQHc3e0O9WQCH3A/qQszRi1PXIWII+oK6+Q4doJZ8V3/fxcCRSVqR6a
         +L6LbzBcv17A6HOIRJYJ86e9wDu6WG4tIpOFveCHlE9Jl6vBe0FWkEKMLJhmP6QthDEj
         0izH2QUT9Io5IIfN3lCbcHZR4G9SfIeScvcW3Rzjw7ULuYzMXzQ2d0IRN4KPFA8HIKQg
         36eVoXMG4uhfe8TYsHEiockJZ4ph3jEL95ELw42W3rn8lTfe2x0pKBJn1huTKAB0zrLJ
         cH/A==
X-Gm-Message-State: AOJu0YxeS8YWOCHZoOuNS4LAhvAmpXGpmznKf0gep9q+SR6GBEv91MZ1
        tUdwBj+YDRV9AnasFkDPD8McDQ==
X-Google-Smtp-Source: AGHT+IGZ4o3nzmZZPaMyc1s50h4lEwvlLi/vXTJfE65dIaQLs18ImNEoE6a7c5pwRQNT5F16vOq7Tg==
X-Received: by 2002:a1c:7303:0:b0:3fa:8db4:91ec with SMTP id d3-20020a1c7303000000b003fa8db491ecmr15561718wmb.10.1693051527274;
        Sat, 26 Aug 2023 05:05:27 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 7-20020a05600c248700b003fbc30825fbsm4802926wms.39.2023.08.26.05.05.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Aug 2023 05:05:26 -0700 (PDT)
Message-ID: <1b5b5bf0-43a5-2ec4-5570-891a710b85dd@linaro.org>
Date:   Sat, 26 Aug 2023 13:05:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 10/15] media: qcom: camss: Allow clocks vfeN vfe_liteN
 or vfe_lite
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, rfoss@kernel.org,
        todor.too@gmail.com, agross@kernel.org, andersson@kernel.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230823104444.1954663-1-bryan.odonoghue@linaro.org>
 <20230823104444.1954663-11-bryan.odonoghue@linaro.org>
 <076d958f-2cf3-4a52-99a2-52a6cdd5443c@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <076d958f-2cf3-4a52-99a2-52a6cdd5443c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/08/2023 11:08, Konrad Dybcio wrote:
> On 23.08.2023 12:44, Bryan O'Donoghue wrote:
>> The number of Video Front End - VFE or Image Front End - IFE supported
>> with new SoCs can vary both for the full and lite cases.
>>
>> For example sdm845 has one vfe_lite and two vfe interfaces with the vfe
>> clock called simply "vfe_lite" with no integer postfix. sc8280xp has four
>> vfe and four vfe lite blocks.
>>
>> We need to support the following clock name formats
>>
>> - vfeN
>> - vfe_liteN
>> - vfe_lite
>>
>> with N being any reasonably sized integer.
>>
>> There are two sites in this code which need to do the same thing,
>> constructing and matching strings with the pattern above, so encapsulate
>> the logic in one function.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   drivers/media/platform/qcom/camss/camss-vfe.c | 22 ++++++++++++++-----
>>   1 file changed, 16 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
>> index 8f48401e31cd3..73380e75dbb22 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -437,6 +437,20 @@ void vfe_isr_reset_ack(struct vfe_device *vfe)
>>   	complete(&vfe->reset_complete);
>>   }
>>   
>> +static int vfe_match_clock_names(struct vfe_device *vfe,
>> +				 struct camss_clock *clock)
>> +{
>> +	char vfe_name[CAMSS_RES_MAX];
>> +	char vfe_lite_name[CAMSS_RES_MAX];
> I don't think using the "number of resources" define to define
> the maximum length of a resource name is a good idea.
> 
> Perhaps we can do:
> 
> char vfe_name[5]; /* "vfeX\0" */
> char vfe_lite_name[10]; /* "vfe_liteX\0" */
> 
> if index > 9
>     return INCREASE_THE_BUFFER
> 
> Konrad

I'm reluctant to fix only the VFE clock name string length in isolation, 
plus I'm aware of another patchset coming down the line from other 
people which will likely address the string length stuff.

But in the interests of consensus I will restrict the length in the helper.

---
bod
