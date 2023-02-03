Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7DE68921E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 09:27:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232287AbjBCI1N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 03:27:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232355AbjBCI0k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 03:26:40 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5A84125A4
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Feb 2023 00:26:36 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id hx15so13176966ejc.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Feb 2023 00:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C+/90X5VKUOPdYQSfgyJKgH8aAEJvZdqb0gJuf8F3P4=;
        b=mumRdETGnQ3PVEkTLbeobaUDC/+veipzaawXb4KKFpaEEgErudMTINCn+fQMgN6w4m
         q/HWz9sA6Pnro2viSP9kpMKoLidWsHmeeycJpZIqvkte2wXjGJOqHpTmZCCei/51uyoH
         mZj7de6KzsFE78uWn0KAGdu4qzswRX9HZU5P4J2c4vWDKL8wJgf9pEJbdL03FFJLGgKa
         MubaIPUdfvC59+zpWslhqFwCSpf5axjjZQc/Hidcl2Hh2AVjDZYRCRSiOKamZmv+QAEZ
         H7pd3nhz/F7qzwfh3XK2dO7bIXeo9Y1kKlfRJ9/ibINkP5szAXzNlIkm7GsXj3bomXCH
         U3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C+/90X5VKUOPdYQSfgyJKgH8aAEJvZdqb0gJuf8F3P4=;
        b=d4qZrm3GspqouddmfYiVkGhVYz5RAsf+aqt4jmMIzlyDVCpyt0WYOKVbLnW8yz2lke
         iiW6EumSU7Sqg/3wwql9i0/uvpIHBvp1V6Cqc4itnKKjJKMlAKyj2a55Arhh5lNqYpgG
         yxne+HhaldtOBthYmEFgo3FXrneKcDj4xU85+Oo2RrJAbU95Rrs3tsckKxd/mCf2jRxb
         FKjAdOI6iNmgadeKVn9a7jFQLOpuXchmn8GA4cyozdA0OKXaGnv9c8OB7shFGBoHPOcg
         L25Qj6O6p69GZAjuzrsRsbgcKxFcF21xfPewDvsx9zZa6RG0TTnv3hKnLGrgx0Hdthlo
         5/gQ==
X-Gm-Message-State: AO0yUKUstLraOdS2JqJOHrFk1oHSddKl/uBC9iKSumVe3zlb8sUGNeU2
        JT0nhTvVW+ty8D2MqPNldivyPePORfWMnRA4KoBTlA==
X-Google-Smtp-Source: AK7set/nPc6abpHzzr2F+jWhqUYyknvQk4Ia//I/a82fvwvcUB869++d2wVBnTp56iiwNLBqhQANvQ==
X-Received: by 2002:a17:907:1393:b0:86d:4517:a4f1 with SMTP id vs19-20020a170907139300b0086d4517a4f1mr8825173ejb.5.1675412795443;
        Fri, 03 Feb 2023 00:26:35 -0800 (PST)
Received: from [192.168.1.102] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id lb2-20020a170907784200b0084d494b24dcsm1021553ejc.161.2023.02.03.00.26.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 00:26:34 -0800 (PST)
Message-ID: <43c7cf3f-f463-90da-23f9-f6b76d9f729f@linaro.org>
Date:   Fri, 3 Feb 2023 10:26:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH v8 5/9] dt-bindings: qcom-qce: document clocks and
 clock-names as optional
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20230202135036.2635376-1-vladimir.zapolskiy@linaro.org>
 <20230202135036.2635376-6-vladimir.zapolskiy@linaro.org>
 <32c23da1-45f0-82a4-362d-ae5c06660e20@linaro.org>
 <22f191c4-5346-8fe7-690d-9422775bb2d5@linaro.org>
 <ad8812e6-7dc2-5575-c44d-3f4f62aeb9e9@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <ad8812e6-7dc2-5575-c44d-3f4f62aeb9e9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Krzysztof,

On 2/3/23 10:17, Krzysztof Kozlowski wrote:
> On 02/02/2023 23:27, Vladimir Zapolskiy wrote:
>> Hi Krzysztof,
>>
>> On 2/2/23 15:53, Krzysztof Kozlowski wrote:
>>> On 02/02/2023 14:50, Vladimir Zapolskiy wrote:
>>>> From: Neil Armstrong <neil.armstrong@linaro.org>
>>>>
>>>> On certain Snapdragon processors, the crypto engine clocks are enabled by
>>>> default by security firmware.
>>>
>>> Then probably we should not require them only on these variants.
>>
>> the rationale is clear, but here comes a minor problem, older platforms
>> require clocks, when newer ones do not. When a generic SoC-specific compatible
>> is introduced, let say "qcom,ipq4019-qce", it itself requires the clocks,
>> but then newer platforms can not be based on this particular compatible,
>> otherwise they will require clocks and this comes as invalid.
>>
>> How to resolve it properly, shall there be another generic SoC-specific
>> compatible without clocks and NOT based on that "qcom,ipq4019-qce" compatible?
>>
>> By the way, QCE on SM8150 also shall not need the clocks.
> 
> Assuming you have:
> 1. ipq4019 requiring clocks
> 2. msm8996 compatible with ipq4019, requiring clocks
> 3. ipq6018 compatible with ipq4019, not requiring clocks
> 
> allOf:
>    - if:
>        properties:
>          compatible:
>            enum:
>               - ipq4019-qce
>      then:
>        required:
>          - clocks
> 
>    - if:
>        properties:
>          compatible:
>            contains:
>              enum:
>                 - msm8996-qce
>      then:
>        required:
>          - clocks
> 
> That's not pretty.
> 
> Another solution is to make non-clock-requiring variants as their own
> family:
> 
> 1. msm8996-qce, ipq4019-qce
> 2. sm8550-qce, sm8150-qce
> 
> and then in the driver you need two entries - ipq4019 and sm8150.
> 
> I like the latter, because for clock-requiring variants your driver
> should actually get them and require. For non-clock-requiring variants,
> you just skip the clocks (do not fail). Therefore you need different
> driver data for these two families.

many thanks for the detailed explanation, the first of two solutions will
be even more clumsy and convoluted, since there should be lists split into
two baskets.

Thus I will go with the second variant and add two family compatibles.

--
Best wishes,
Vladimir
