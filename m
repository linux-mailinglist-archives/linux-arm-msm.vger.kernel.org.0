Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14336690370
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 10:22:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbjBIJVJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 04:21:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbjBIJUu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 04:20:50 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9776D6278E
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 01:19:43 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id bg26so1001653wmb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 01:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+lf8QLPCcyDvpw7oAginkoSV3mAKj3y/9VzlqPF8+0U=;
        b=V6UTmWV3UklUG+BCKfVbpD51PLxvQjUgRckjuijCqks573cOtprivY/CE341/dRA3v
         NxjFR8dLkFGCVDNDL00gCoMurLeBPxUHxBwVkcLbLVbR5dOcixpxl5nMtjq3383RW6bc
         xNzHeTYsh25RNmAoIIS6X1WYg3beRHXhBNGpfSCPh5QvHEW2ghaMecMtmkhYwjFWe+i7
         U2Lo6LzfXzkPYsqiSKK884KWfJOrWJq8sma892RLZ7PC0VZ3Rcwjp5eKX7E+AdWSzaZb
         TwxBfnVrwBjcBYZ9hiHVOLu0NV9zXV47CFjALkBPotjd9tYzuhIc9fgw/3iBFgx/xDT/
         nQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+lf8QLPCcyDvpw7oAginkoSV3mAKj3y/9VzlqPF8+0U=;
        b=rimXXyjHAAGHLN9BuJKEkYwiWm1mC5uwtvhP/rXsHDCJSXl2Mp5IGZe88k8v+BCC7y
         BHCtsFESLTIPfSOaDmJD4OINR1zzCgaWUZH+m5RjycuDwDeHd0XgTzSmuMWQbPDMuFWR
         1IUKQ+OmyyEY7/RzrMb4oa9awhc/rhUX2HwD0zZAL9iRdxjCk8lPPgKcqVLWvb7AFf7O
         Wnc/Om2gocUNvZFOA2lLp3eJNGrRBClDha3iFOl190O8ni3FU79Z6PZ5ylUiBHIUSQ/U
         avfDRyGLJznfJXPUB2YHKK8t6n7Fii4CEY35zuQh3nRUb99G4k2xM7RqrvJ79U6POIzO
         QPAg==
X-Gm-Message-State: AO0yUKXVOuxVSTpWbw+XONH8M/vK/TvjdxjkzRxupq1FBjBQ0kca+an+
        4V7liOTKxgZ4RKYvmEVjsjisxg==
X-Google-Smtp-Source: AK7set8uToABk3UaRvkBw8DeoFe9DRIQaKr2AnU5CSys7VDnbZYgBchuU1hSCnSy3xb7kGjg2GKSwg==
X-Received: by 2002:a05:600c:43d2:b0:3da:fc07:5e80 with SMTP id f18-20020a05600c43d200b003dafc075e80mr3817799wmn.12.1675934381973;
        Thu, 09 Feb 2023 01:19:41 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id az10-20020a05600c600a00b003dc3f07c876sm4527444wmb.46.2023.02.09.01.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 01:19:41 -0800 (PST)
Message-ID: <a5c8355c-4181-d106-2f6b-a48126cb2b70@linaro.org>
Date:   Thu, 9 Feb 2023 10:19:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v9 05/14] dt-bindings: qcom-qce: Add new SoC compatible
 strings for qcom-qce
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org
References: <20230208183755.2907771-1-vladimir.zapolskiy@linaro.org>
 <20230208183755.2907771-6-vladimir.zapolskiy@linaro.org>
 <bc088534-ac1d-0504-9961-d3cd3740e2f3@linaro.org>
In-Reply-To: <bc088534-ac1d-0504-9961-d3cd3740e2f3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/02/2023 10:18, Krzysztof Kozlowski wrote:
> On 08/02/2023 19:37, Vladimir Zapolskiy wrote:
>> Change QCE IP version specific compatible to two QCE IP family compatibles
>> based on SoC name and populate these two IP families with particular SoC
>> specific IP compatible names, which are known at the moment.
>>
>> Keep the old compatible 'qcom,crypto-v5.1' for backward compatibility
>> of DTB ABI, but mark it as deprecated.
>>
>> The change is based on the original one written by Bhupesh Sharma.
>>
>> Cc: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>  .../devicetree/bindings/crypto/qcom-qce.yaml  | 24 +++++++++++++++++--
>>  1 file changed, 22 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>> index 4e00e7925fed..f6f1759a2f6e 100644
>> --- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>> +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>> @@ -15,7 +15,27 @@ description:
>>  
>>  properties:
>>    compatible:
>> -    const: qcom,crypto-v5.1
>> +    oneOf:
>> +      - const: qcom,crypto-v5.1
>> +        deprecated: true
>> +        description: Kept only for ABI backward compatibility
>> +      - const: qcom,crypto-v5.4
> 
> You should mention in commit msg that you document existing compatible
> v5.4. Otherwise it looks unrelated/unexplained. Especially adding
> deprecated compatible is unexpected.
> 

With commit msg adjustement for v5.4 compatible:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

