Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C57FE6535D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Dec 2022 19:05:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234218AbiLUSFb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Dec 2022 13:05:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230462AbiLUSF2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Dec 2022 13:05:28 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7A5D29F
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Dec 2022 10:05:23 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id o6so19784038lfi.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Dec 2022 10:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BdUKqQdUJ9BjsYRaWfnbLXsCaSmLmYgfTiT0Q4Ua3+E=;
        b=CUWV9mGuK791sSjb2COGW35hA9di7EVG+FUHGHXP4Esmfg2gW4e/gmlt6CskwMZ+VR
         KQEA9YsWxRZZ2JszDe7H3kLNkz16FvtfOJ2h9BdhVVYIHiIAn4gUnJgKEYW79umUyp15
         HRnfirX/ZAfJuiXKw1Gq1T+/UPbljCrByj0vTwDbvNTP9EOpSOUV+ARNalBcZJG79a4A
         /odwo6HPpk8FjxXKL/s3+AEvbQ8SmOnjczQRLdesXpp++NGIu8ggDN54GnxbDWNDcYf7
         pG5gcygw/fqmOTVyeg6dTZlwoSQ01mCEAQ+vMNXtG7eDA2MH8I1C3iniX0CJxZ0BtY2m
         Ryeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BdUKqQdUJ9BjsYRaWfnbLXsCaSmLmYgfTiT0Q4Ua3+E=;
        b=Wx1QiBALG6WjBlMiulMVb/OKRaFxJVe0wXYtJ2AMan026wUyWIgj+S/J6Gnjjp0kts
         FlBhyu2fZIQSVAzOWZ4k4JMKea4g8VbIQ24KQLUX/niDmyZ1KuK17h/ndMnmZthrV4VI
         Ak1iLBOYNK0fw2DdJUquxKikCm/7EML0oYMlvvj1VAsg/HkO4pIr6FlRCcWRduT1rgxI
         K/MGynOO34hwGSR49KpKs6berCcwj+1X5rNGz8MxB3tEXJALlI8NAkYURHXM+QAapbHr
         WrtzH2R3RWkeGvk2z7rTEnwvM4jIXWFqiyhktW4LJuU5KjZayxV6qN4Z/fd3Vlwo7Ufb
         sOxw==
X-Gm-Message-State: AFqh2krVoNN74jl3NKwvdMwBfsN1N9fNKPlsmDCxSJ4YTZPuNL/V2sCt
        ymwOuRpiRx8RMLZ5ncWnyvWBVw==
X-Google-Smtp-Source: AMrXdXuKqHHQ6aeZ4qA8dLUxIScs9CMToBtEgctg0p94BmcwngeQYaUmp1MWoetE4bVhbI1psXJDrw==
X-Received: by 2002:a05:6512:ba5:b0:4c0:91d0:e7b7 with SMTP id b37-20020a0565120ba500b004c091d0e7b7mr1286237lfv.27.1671645922080;
        Wed, 21 Dec 2022 10:05:22 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id b19-20020ac25633000000b004b551505c29sm1907221lff.218.2022.12.21.10.05.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 10:05:21 -0800 (PST)
Message-ID: <fa89bec4-0f44-74a5-4905-c1e03ad52749@linaro.org>
Date:   Wed, 21 Dec 2022 20:05:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 07/20] thermal/drivers/tsens: limit num_sensors to 9
Content-Language: en-GB
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221221020520.1326964-1-dmitry.baryshkov@linaro.org>
 <20221221020520.1326964-8-dmitry.baryshkov@linaro.org>
 <ed4aafb9-c33e-6f24-1e9c-7c7efa0e58ae@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ed4aafb9-c33e-6f24-1e9c-7c7efa0e58ae@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/12/2022 17:45, Daniel Lezcano wrote:
> On 21/12/2022 03:05, Dmitry Baryshkov wrote:
>> According to the vendor kernels (msm-3.10, 3.14 and 3.18), msm8939
>> supports only 9 sensors. Remove the rogue sensor's hw_id.
>>
>> Fixes: 332bc8ebab2c ("thermal: qcom: tsens-v0_1: Add support for 
>> MSM8939")
>> Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/thermal/qcom/tsens-v0_1.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/thermal/qcom/tsens-v0_1.c 
>> b/drivers/thermal/qcom/tsens-v0_1.c
>> index 0bc4e5cec184..57ac23f9d9b7 100644
>> --- a/drivers/thermal/qcom/tsens-v0_1.c
>> +++ b/drivers/thermal/qcom/tsens-v0_1.c
>> @@ -605,9 +605,9 @@ static const struct tsens_ops ops_8939 = {
>>   };
>>   struct tsens_plat_data data_8939 = {
>> -    .num_sensors    = 10,
>> +    .num_sensors    = 9,
>>       .ops        = &ops_8939,
>> -    .hw_ids        = (unsigned int []){ 0, 1, 2, 3, 5, 6, 7, 8, 9, 10 },
>> +    .hw_ids        = (unsigned int []){ 0, 1, 2, 3, 5, 6, 7, 8, 9 },
> 
> Does not patch 4 says we can drop those hw_ids ?

No. In patch 4 we drop contiguous IDs. For the msm8939 sensor 4 is 
omitted from hw_ids, so we can not drop the array.

> 
>>       .feat        = &tsens_v0_1_feat,
>>       .fields    = tsens_v0_1_regfields,
> 

-- 
With best wishes
Dmitry

