Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01F495F1C37
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Oct 2022 14:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbiJAMv2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Oct 2022 08:51:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbiJAMv1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Oct 2022 08:51:27 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBE0CE2BAA
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Oct 2022 05:51:25 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id q9so6248293pgq.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Oct 2022 05:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=6CiQZZpfJa5bf7nfDlOQwTClOn8mQ3Dzv15tBFfsV6Y=;
        b=FZZi4JJvugZnmbVREL09i5x0+O/2pTiE6mCTST5LjwmKKog6jjoDGGz1qZZpWwrHn7
         L5bVEvL3izEZKduKrLR8loEsZZL9AEP6sOWkEJbec1pOrYcgv93kuzzd/hm4xc7Mi4t/
         muJN7hpZXVCvjCYDLL01EeIUBIFC0k33dOp6sfupNPlGs6di2UEjKUuBXRI/jhBT4Xid
         KwjkdrAkdXPrXkKyvEKengdqzWVrMjaGra2cbo6zKrEYsW3Tm+/Mpoy5txzp8pegOpoU
         +cT7fcU1tbwzuxrHommdBtw2YXEjN7b5RiQeo09pMp9VXfsirvpEtv7jC4TJPw3mSCX3
         lnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=6CiQZZpfJa5bf7nfDlOQwTClOn8mQ3Dzv15tBFfsV6Y=;
        b=lypL/50p7fzNimb07vH9QhrleSbO7A07kddiL+09/X6tPUGUmUp1vez9VlOA4ncVHS
         foC9fYMPDTJiPnCRyR1Mx/c1lLC46p9j4pGxd0PfhRWcBAkFDcCnXpGB9OoD+85x9bQ6
         Zoatx3i/oXaKdEh4Dg9da5ylaiABmY95gyt8OKYK66vNIpFvHAb4LdYHiwt+kVtJa6U0
         EoneYTKf0zl2Q9Z8F5Dv7U9SgziG7qxFJEPGXuCpllE4NExWmhyDd2dzHpxvh4G/+h6M
         ygk3xJSxwhvLOw7WJdTPEHMZ0WoFYc08qwddQfAEbQBCAZ2Ew0lOBe9rXhZIR7ecmO1t
         r5oA==
X-Gm-Message-State: ACrzQf2aaWOQF0T5wu5UH+A9rUbWutDsywBzOQGTr+WHw81TrrxFuhc/
        rxwZqfywbZlrzT25F61G1cDb1g==
X-Google-Smtp-Source: AMsMyM4jrSzLFdGh1E4kc2Vu0hBud0A6y+gW1mm08FiuSBpA3/yRUEBGukegVaqZHKN0BJ3H19hglQ==
X-Received: by 2002:a63:cf56:0:b0:43c:a0a1:f749 with SMTP id b22-20020a63cf56000000b0043ca0a1f749mr11412954pgj.24.1664628685191;
        Sat, 01 Oct 2022 05:51:25 -0700 (PDT)
Received: from ?IPV6:2401:4900:1f3b:3adb:24f8:ac24:2282:1dc7? ([2401:4900:1f3b:3adb:24f8:ac24:2282:1dc7])
        by smtp.gmail.com with ESMTPSA id l6-20020a170903244600b0017832c8cc85sm3813403pls.292.2022.10.01.05.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Oct 2022 05:51:24 -0700 (PDT)
Message-ID: <0aeb2c5e-9a5e-90c6-a974-f2a0b866d64f@linaro.org>
Date:   Sat, 1 Oct 2022 18:21:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 3/4] dt-bindings: net: qcom,ethqos: Convert bindings to
 yaml
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        David Miller <davem@davemloft.net>
References: <20220929060405.2445745-1-bhupesh.sharma@linaro.org>
 <20220929060405.2445745-4-bhupesh.sharma@linaro.org>
 <4e896382-c666-55c6-f50b-5c442e428a2b@linaro.org>
 <1163e862-d36a-9b5e-2019-c69be41cc220@linaro.org>
 <9999a1a3-cda0-2759-f6f4-9bc7414f9ee4@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
In-Reply-To: <9999a1a3-cda0-2759-f6f4-9bc7414f9ee4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/30/22 3:56 PM, Krzysztof Kozlowski wrote:
> On 30/09/2022 10:12, Bhupesh Sharma wrote:
>>>> +  snps,reset-gpio:
>>>> +    maxItems: 1
>>>
>>> Why is this one here? It's already in snps,dwmac.
>>>
>>> Actually this applies to several other properties. You have
>>> unevaluatedProperties:false, so you do not have to duplicate snps,dwmac.
>>> You only need to constrain it, like we said about interrupts in your
>>> previous patch.
>>
>> I was actually getting errors like the following without the same:
>>
>> arm64/boot/dts/qcom/qcs404-evb-1000.dtb: ethernet@7a80000: Unevaluated
>> properties are not allowed ('snps,tso' was unexpected)
>> 	From schema: Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>>
>> So, its not clear to me that even though 'snps,dwmac.yaml' is referenced
>> here, the property appears as unevaluated.
> 
> Because snps,tso is not allowed, but the rest is.
> 
>>
>>>> +
>>>> +  power-domains:
>>>> +    maxItems: 1
>>>> +
>>>> +  resets:
>>>> +    maxItems: 1
>>>> +
>>>> +  rx-fifo-depth:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +
>>>> +  tx-fifo-depth:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +
>>>> +  snps,tso:
>>>> +    type: boolean
>>>> +    description: Enables the TSO feature (otherwise managed by MAC HW capability register).
>>>
>>> You add here several new properties. Mention in commit msg changes from
>>> pure conversion with answer to "why".
>>
>> Right, most of them are to avoid the make dtbs_check errors / warnings
>> like the one mentioned above.
> 
> All of them should not be here.

I guess only 'snps,reset-gpio' need not be replicated here, as for 
others I still see 'dtbs_check' error, if they are not replicated here:


arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: ethernet@20000: Unevaluated 
properties are not allowed ('power-domains', 'resets', 'rx-fifo-depth', 
'tx-fifo-depth' were unexpected)
	From schema: /Documentation/devicetree/bindings/net/qcom,ethqos.yaml

Am I missing something here?

Thanks.

