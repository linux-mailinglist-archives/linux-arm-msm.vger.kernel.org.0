Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9A35B3DDE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 19:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbiIIRWl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 13:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbiIIRWk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 13:22:40 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68F03B4EAC
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 10:22:39 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id d2so3960582wrn.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 10:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=lzt24UxQb1Bbr5dR1P76QxyXayl6F2odB0xnXgtqQU4=;
        b=a3YFdDgRnb8wT3DLp+r2MHmxJjh43HrFTbENXjBIref//D4ozP1Rl0bIrMkXWYNf6Q
         VaN9OlXLHx4TApWlYwZjBoBxLC7sA9lzwNVUz1L1oaaM192ZEWSf5oS+qs3TnykxPBgK
         oXYCjTZGz5Scp97RvguCmN/9nlJkox/Zuv2BBLqSNy4LEHTafgL+3F4hzBH/kXipHnw6
         KKwRz4DVZFjqQtS60g1ogc92pwbH/agL/RuvVlHoWn5vCiCf2ttjBXKUpZYfKRQJ17tA
         8hTjFMNDfAsPkiNP3y+5ttR+cJu3SENQ/GV0csju3ODPVS9pmp0ZzpNamsV4SRJRUrU9
         d++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=lzt24UxQb1Bbr5dR1P76QxyXayl6F2odB0xnXgtqQU4=;
        b=j+e1VolehEMyRExZtIX9Iq9s1O8j0E/MGa1HM203eC8YdnA2trxgRejluCi8yQuzTk
         XB5COLAzyk6TNRp3cSQBhOkMRJuwjyBhw3kL/UQmg+0os1QXuzFtnjjXx8PRzBi8gDPR
         qyP6yNakAiO1hm6Y/k0wBd3O1fw/mknX7CEkgtfkcowD31krQzP8hIxFcQcrcAbQhpUd
         CzLuXNUBuji5iggQyFQgYkCDz7x9HINCoXIj6BQZ6C5tsR6RGMkDdNTiyLrFhxatsZpr
         ouH0Fi8H3FmyJIP+TgojfeNYMTIW8JbDFrfXaqkNMWLs9i935Mz76MKExb620ru8PBf2
         nuYg==
X-Gm-Message-State: ACgBeo37PMR5zeoGtOlUA2CmRui1Nzmy5F8gYwkMybUNT5GFeJAzvAbk
        UqVvJPxZcCxaDo41bosEbXx8BA==
X-Google-Smtp-Source: AA6agR45ZrMWfOgeaqCAPNSh6Qo9OI2+s1tWNEsa+qLYe/6mE4S7XzePyc8Pj25pgbDd0ppt1SFssw==
X-Received: by 2002:a5d:69ca:0:b0:228:dd17:9534 with SMTP id s10-20020a5d69ca000000b00228dd179534mr9168577wrw.652.1662744157878;
        Fri, 09 Sep 2022 10:22:37 -0700 (PDT)
Received: from [192.168.0.159] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p6-20020a05600c1d8600b003a5c064717csm1237141wms.22.2022.09.09.10.22.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 10:22:37 -0700 (PDT)
Message-ID: <539b395b-0c20-27ec-6390-0d1bd4bfbad3@linaro.org>
Date:   Fri, 9 Sep 2022 18:22:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/1] ASoC: dt-bindings: Mark old binding
 qcom,cpu-lpass-apq8016 as deprecated
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220909163416.1021551-1-bryan.odonoghue@linaro.org>
 <20220909163416.1021551-2-bryan.odonoghue@linaro.org>
 <e67e888c-ba40-7e72-39d1-98d02416d8b8@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <e67e888c-ba40-7e72-39d1-98d02416d8b8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/09/2022 17:36, Krzysztof Kozlowski wrote:
> On 09/09/2022 18:34, Bryan O'Donoghue wrote:
>> We've had some discongruity in the compatible string of the lpass for 8916
>> for a while.
>>
>> Mark the old compat as deprecated. New SoC additions such as msm8936 and
>> msm8939 should use the compat string "qcom,apq8016-lpass-cpu".
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   .../devicetree/bindings/sound/qcom,lpass-cpu.yaml    | 12 +++++++-----
>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>> index ef18a572a1ff3..bb6f0c5dd4e8b 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>> @@ -18,11 +18,13 @@ description: |
>>   
>>   properties:
>>     compatible:
>> -    enum:
>> -      - qcom,lpass-cpu
>> -      - qcom,apq8016-lpass-cpu
>> -      - qcom,sc7180-lpass-cpu
>> -      - qcom,sc7280-lpass-cpu
>> +    oneOf:
>> +      - const: qcom,lpass-cpu
>> +      - const: qcom,apq8016-lpass-cpu
>> +      - const: qcom,sc7180-lpass-cpu
>> +      - const: qcom,sc7280-lpass-cpu
> 
> We talked and I gave you the expected code with enum. I also explained
> why other schema (Odroid sound) is done differently. The code here is
> correct, but I find more readable and common to use enum. Please make
> these entries as enum.

Ah you did say enum, I copy/pasted the wrong fragment.

