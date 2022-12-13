Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F06AC64BC1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 19:34:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236567AbiLMSe1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 13:34:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235382AbiLMSe0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 13:34:26 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B22724F18
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 10:34:24 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id z26so6361777lfu.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 10:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LwmxyaNur8jKjOfvpVRgHgye5ddXEkHrwqTF14n3GIU=;
        b=bmX/7cVRLT6mUcKaU8Rm9as/CVZ45LEyMoZOz/+X2mGKx1FDf0aSAmDpqdMW0qlYo7
         vfL8uiMCI2v5eFDSYznjo2aPYAFahJF0LrOXnhtjXW3m5IX++9KSkpm2LBXNV8J0bw+v
         H21wVnf1D6SYvx/Tankio4cWWlgEw4zLs3tiC5OR/Ar3qbczBJ918uMXpr7yM/NMbJbM
         m/R8/fJq3d7tH99RpyOoD9Yw8lI30zjZYon4fKKXTJaOZ16QRDr6SxGP86YLxbiyOjZV
         6nBJLTL4AOL/lJj3poacMTbcaWVxq5a7IzKj77gJSuG/u1tWVhx67y3OkpK8MHhpCMjp
         jVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LwmxyaNur8jKjOfvpVRgHgye5ddXEkHrwqTF14n3GIU=;
        b=epKwPgR/Hnbp8SNu5dntLq1fxSqWWWBQLUvt4p/ErZF7nDJU+5LdhmJ1e8cJdYfZXc
         KDFN7HOTjaENZ31A9ey7HOB+izLa8kr3Q6F78gMXuKm1usLBLHUZeIxjRxqMlGvd2+9W
         ZqavLEyIJ+oZk6nf6OhmjnhW57cXl68vHHWsqcdkkKjccCiZSVrUM9ivdPysg4ixpgQX
         CFQSE3boatwEOMCZrUekBrzCod/rbvbc1eYUh57gjR6HuARoK/noLOrgLoqgVjv2fqy6
         g6lEPCuE7cK7Qs7d4Pq7JCMLE/2L/ff4h5O6O0dT/qtrrZsJrUHz+sAHfOC1FE/pDCTs
         m+Vg==
X-Gm-Message-State: ANoB5pmiiL8JCJo9A0vl9HI6k+lyt713mRSSUG4ZIEuACOpbv0TaoZOf
        A49Wz4/zyP+xxbLde82ganBhZw==
X-Google-Smtp-Source: AA0mqf5am1mE53czDccYmZ1WU9RYdh/9zwwSr4DXmrm9ha4e0t6VnJUQD2XqrEjZ/fkkP3OlsxFdfQ==
X-Received: by 2002:a19:434a:0:b0:4b5:b7a7:ebf1 with SMTP id m10-20020a19434a000000b004b5b7a7ebf1mr4730650lfj.12.1670956462543;
        Tue, 13 Dec 2022 10:34:22 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m5-20020a056512114500b004b57db96aabsm471637lfg.52.2022.12.13.10.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 10:34:22 -0800 (PST)
Message-ID: <1007b829-6573-5de5-3c8e-88621ef6d73e@linaro.org>
Date:   Tue, 13 Dec 2022 19:34:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 02/13] dt-bindings: arm: msm: Fix register regions used
 for LLCC banks
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com, quic_saipraka@quicinc.com,
        konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, james.morse@arm.com,
        mchehab@kernel.org, rric@kernel.org, linux-edac@vger.kernel.org,
        quic_ppareek@quicinc.com, luca.weiss@fairphone.com,
        stable@vger.kernel.org
References: <20221212123311.146261-1-manivannan.sadhasivam@linaro.org>
 <20221212123311.146261-3-manivannan.sadhasivam@linaro.org>
 <aa692a69-fc8d-472e-e5ae-276c3d6d7d78@linaro.org>
 <20221213173023.GG4862@thinkpad>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221213173023.GG4862@thinkpad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/12/2022 18:30, Manivannan Sadhasivam wrote:
> On Tue, Dec 13, 2022 at 05:24:45PM +0100, Krzysztof Kozlowski wrote:
>> On 12/12/2022 13:33, Manivannan Sadhasivam wrote:
>>> Register regions of the LLCC banks are located at separate addresses.
>>> Currently, the binding just lists the LLCC0 base address and specifies
>>> the size to cover all banks. This is not the correct approach since,
>>> there are holes and other registers located in between.
>>>
>>> So let's specify the base address of each LLCC bank and get rid of
>>> reg-names property as it is not needed anymore. It should be noted that
>>> the bank count differs for each SoC, so that also needs to be taken into
>>> account in the binding.
>>>
>>> Cc: <stable@vger.kernel.org> # 4.19
>>> Fixes: 7e5700ae64f6 ("dt-bindings: Documentation for qcom, llcc")
>>> Reported-by: Parikshit Pareek <quic_ppareek@quicinc.com>
>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>> ---
>>>  .../bindings/arm/msm/qcom,llcc.yaml           | 97 ++++++++++++++++---
>>>  1 file changed, 83 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
>>> index d1df49ffcc1b..260bc87629a7 100644
>>> --- a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
>>> @@ -33,14 +33,8 @@ properties:
>>>        - qcom,sm8550-llcc
>>>  
>>>    reg:
>>> -    items:
>>> -      - description: LLCC base register region
>>> -      - description: LLCC broadcast base register region
>>> -
>>> -  reg-names:
>>> -    items:
>>> -      - const: llcc_base
>>> -      - const: llcc_broadcast_base
>>> +    minItems: 2
>>> +    maxItems: 9
>>>  
>>>    interrupts:
>>>      maxItems: 1
>>> @@ -48,7 +42,76 @@ properties:
>>>  required:
>>>    - compatible
>>>    - reg
>>> -  - reg-names
>>> +
>>> +allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - qcom,sc7180-llcc
>>> +              - qcom,sm6350-llcc
>>> +    then:
>>> +      properties:
>>> +        reg:
>>> +          items:
>>> +            - description: LLCC0 base register region
>>> +            - description: LLCC broadcast base register region
>>> +
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - qcom,sc7280-llcc
>>> +    then:
>>> +      properties:
>>> +        reg:
>>> +          items:
>>> +            - description: LLCC0 base register region
>>> +            - description: LLCC1 base register region
>>> +            - description: LLCC broadcast base register region
>>
>> This will break all existing users (all systems, bootloaders/firmwares),
>> so you need to explain that in commit msg - why breaking is allowed, who
>> is or is not going to be affected etc. Otherwise judging purely by
>> bindings this is an ABI break.
>>
>> Reason "This is not the correct approach since, there are holes and
>> other registers located in between." is not enough, because this
>> suggests previous approach was just not the best and you have something
>> better. Better is not a reason for ABI break.
>>
> 
> Maybe I need to reword the commit message a bit. But clearly the binding was
> wrong for rest of the SoCs other than SDM845 as the total size of the LLCC
> region includes registers of other peripherals like memory controller.
> 
> In that case, will you let the binding to be wrong or fix it?

Sure it needs fixing, but as I said you need to explain why breaking ABI
is okay and who/where is going to be affected.

Best regards,
Krzysztof

