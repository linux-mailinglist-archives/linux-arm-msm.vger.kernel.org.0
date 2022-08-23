Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE8C59E899
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 19:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343774AbiHWRHM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Aug 2022 13:07:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344367AbiHWRF2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Aug 2022 13:05:28 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31B7215140C
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 06:34:22 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id z14-20020a7bc7ce000000b003a5db0388a8so701298wmk.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 06:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=hANLL+7DhnD0W2kb20ZNsZlp5AERIcfuD5mxO0wOYB4=;
        b=yzxEu+Jv+OYdYdQfrSFNwEH0jqct2PWjFD92Bkn/bdmkaz9SHPg43Y2doExDDOACPr
         b4blOpDhvo4K/f50VBpKSzIwFVszKdGaTsrgkj4fuLQ7gn5UHKSBGyIYkQRaDzxq0xju
         LBumSEI9K65LYixBjKqyECw50JMgEzSQX9/Ck5qTZZI3NbbO7mV/SEGpNFGSUXPdm7Ac
         s8f4FsLal+JNqzY9U1V3DxI758HvSUye6CORlw1BfTiYHWWKTmgQXjPN04LNbipf7HIz
         9qaXvXmUWgAqEloEqpQv5IQ9HBJf0CYiV4YZBhhxJvaYFM8M8L0jWUvSx0auzUTOkN2j
         KJ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=hANLL+7DhnD0W2kb20ZNsZlp5AERIcfuD5mxO0wOYB4=;
        b=enzTaUFibQ0oz4MebC90OItwTKkJAEeFpPF8M6qx3hmGUk2HpL9tBS+C+LAHimjMrW
         PW0hYvmameUn5sJnDqz7K4+LStAcHKWKSaHQ+gJVU9ChVd2E9qB/Xjx+0BtpV49xQVEm
         K6mauBH0EwINAH2N3HPVnGS2C4kw9cO4GL1EgWXSaZkHi4EbqPuNJpwnHN5qmjY5yMdS
         8qcSLUgz7sS8s4FTIRuYqrftLd+JKka7JGeS3tu8XCe66fRro6W6PccOaP/NxvHNXqgd
         AnB5U0ZJ8EQz+Qqtp0rp0HSmq19qVeSbZp3pzR6hsG4qYg5qLrea9Y4v+2b2swYrXiOI
         l8UQ==
X-Gm-Message-State: ACgBeo00slVDzZUzAbUwuVM8izAg/0+gchYwXXyqQ+oSxvXbnSLn3VBb
        27//sRO6Mkzg0dkQCScM20XWjQ==
X-Google-Smtp-Source: AA6agR4fNPahujEXCLVbndBEEdaFeTvotTYaW9PcHl55BWOG4EBrlnaOzS5Uoc7EVqqQ6npmzvFUDQ==
X-Received: by 2002:a05:600c:25ce:b0:3a5:a3b7:bbfe with SMTP id 14-20020a05600c25ce00b003a5a3b7bbfemr2336065wml.115.1661261660575;
        Tue, 23 Aug 2022 06:34:20 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id ay15-20020a05600c1e0f00b003a604a29a34sm18510656wmb.35.2022.08.23.06.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 06:34:19 -0700 (PDT)
Message-ID: <4e567599-90ba-c8bd-9774-1e34ae8f8ea3@linaro.org>
Date:   Tue, 23 Aug 2022 14:34:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] arm64: dts: qcom: pm8916: Fix pwm declaration
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220822120300.2633790-1-bryan.odonoghue@linaro.org>
 <9022126c-2cd7-44c9-28dc-338e36a3346d@linaro.org>
 <11e20195-1383-d1e3-4715-8a1f110ed344@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <11e20195-1383-d1e3-4715-8a1f110ed344@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/08/2022 13:23, Krzysztof Kozlowski wrote:
> On 23/08/2022 15:12, Krzysztof Kozlowski wrote:
>> On 22/08/2022 15:03, Bryan O'Donoghue wrote:
>>> We need to define pwm@bc000 to stop dtbs_check from making the following
>>> complaint, text pruned.
>>>
>>> pmic@1: 'pwm' does not match any of the regexes:  'pwm@[0-9a-f]+$'
>>>
>>> Fixes: e79a1385ab74 ("arm64: dts: qcom: Add LPG to pm8916, pm8994, pmi8994 and pmi8998")
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/pm8916.dtsi | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
>>> index 606c2a6d1f0fc..d6922379729cb 100644
>>> --- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
>>> @@ -124,7 +124,7 @@ pm8916_1: pmic@1 {
>>>   		#address-cells = <1>;
>>>   		#size-cells = <0>;
>>>   
>>> -		pm8916_pwm: pwm {
>>> +		pm8916_pwm: pwm@bc00 {
>>>   			compatible = "qcom,pm8916-pwm";
>>
>> This does not look like proper fix.
>> 1. It requires a reg.
>> 2. reg is not allowed by pwm bindings.
>>
>> See also other wrong commit:
>> https://lore.kernel.org/all/20220719205058.1004942-1-bhupesh.sharma@linaro.org/
>>
> 
> and this:
> https://lore.kernel.org/all/20220721195502.1525214-1-bhupesh.sharma@linaro.org/
> 
> 
> Best regards,
> Krzysztof

Hmm OK.

So if I've understood this conversation properly instead of converting 
"label: nodename" to "label: nodename@xxx" and adding reg, we would just 
revert to "nodename {};"

---
bod
