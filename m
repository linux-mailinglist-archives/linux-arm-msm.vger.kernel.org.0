Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0927874E732
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 08:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbjGKGXo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 02:23:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231488AbjGKGXb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 02:23:31 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4255A10DF
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 23:23:28 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so12012517a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 23:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689056606; x=1691648606;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ds4YDY9bzqXKtiOPGD6t4IhnN/cwNEFXlrWZqOw7IxM=;
        b=s1Ojeefmz52ZjzvGreQtXZYdx7gKI6uGilFTSLd8NYjaD/SyBbXNLZMVHPL7y78M1+
         EsPHZZQPqVODs0FZfixsU7RojGuAj0s04zRZxjPJJkdRBy+Z3Q6W9UtRv7krsFkZjVBy
         D7T5lrQSQkH9W4MWyzu7HoOYLZS7OiBaPQz1HXbyaQmKQMVzni+7MC60hGMtt4IKDENQ
         m8SKJnleiEl5HVH+bl4uiXfNyCGWM3k0oz3mW21IJNCZSbOuCy8523h8aMpkom7UCma2
         zfaF6qG2nJe3+xIAXCR9nirUSu2VfDx+H5ME775E3grheGFjgcZMYUi0kN2qjbvJZsoW
         kvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689056607; x=1691648607;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ds4YDY9bzqXKtiOPGD6t4IhnN/cwNEFXlrWZqOw7IxM=;
        b=adcyWLNrIVS6SRuN4SalRD56ntTIwTJJeEwbWhYc2SJfL5vjOh6rmlMqF9ZUf9TKu9
         qAsmTY06ytwAJfru0R9DnY692+Zn30CSWH5IToMQabA8iVnwVRN1PmevEGLHmEORbF8w
         pw1hdVbQwlhAlrFB/nsByFYlwkm9XatdpgjECyZ1Z714XLGb5mhO+BV/YkqaUh6vmo+N
         aHUphEpQnR0vyiefxIPLomTbFglEgtIh16CzVf8DyCMkTvfrN8mhPer+vqfZCQNJ0TH6
         FvDOcc7k/ROY8riii0Y5AAHCGVAequOGlPUQ8pj03Ipk/en+lqN/rsPm54dqph6n5zbD
         sd5Q==
X-Gm-Message-State: ABy/qLYxJ3QeTDqLg67JWUgWCBgVDI5/YRkLe6ByY7I79Z0ttaiEM9Te
        sSIKb7+padFO7AHWPUyiY8eQCA==
X-Google-Smtp-Source: APBJJlGKSwD7Yf1spLBNs3o3iJw2BaYaSdqFnawQzbvU0JTFJRHjhfoPqFLGoDqboNr2MwAToLlnyg==
X-Received: by 2002:a17:906:1041:b0:992:8d96:4de3 with SMTP id j1-20020a170906104100b009928d964de3mr21166193ejj.24.1689056606678;
        Mon, 10 Jul 2023 23:23:26 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id hb7-20020a170906b88700b009925cbafeaasm687544ejb.100.2023.07.10.23.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 23:23:26 -0700 (PDT)
Message-ID: <f27a692e-460c-9a9b-0afc-ad9a71ab4262@linaro.org>
Date:   Tue, 11 Jul 2023 08:23:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] dt-bindings: regulator: Add PMX75 compatible
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1689054415-11281-1-git-send-email-quic_rohiagar@quicinc.com>
 <1689054415-11281-2-git-send-email-quic_rohiagar@quicinc.com>
 <8eb986f2-3268-65cd-9210-ef1fca4f8259@linaro.org>
 <fc054877-52c6-9e61-8572-3068c53a86de@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <fc054877-52c6-9e61-8572-3068c53a86de@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/07/2023 08:22, Rohit Agarwal wrote:
> 
> On 7/11/2023 11:35 AM, Krzysztof Kozlowski wrote:
>> On 11/07/2023 07:46, Rohit Agarwal wrote:
>>> Add PMX75 compatibles for PMIC found in SDX75 platform.
>>> While at it, update the entry for SDX65 as well.
>> Everything is an update...
>>
>>> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
>>> ---
>>>   .../bindings/regulator/qcom,rpmh-regulator.yaml    | 22 +++++++++++++++++++++-
>>>   1 file changed, 21 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
>>> index b949850..72b533c 100644
>>> --- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
>>> +++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
>>> @@ -53,6 +53,7 @@ description: |
>>>         For PMR735A, smps1 - smps3, ldo1 - ldo7
>>>         For PMX55, smps1 - smps7, ldo1 - ldo16
>>>         For PMX65, smps1 - smps8, ldo1 - ldo21
>>> +      For PMX75, smps1 - smps10, ldo1 - ldo21
>>>   
>>>   properties:
>>>     compatible:
>>> @@ -84,6 +85,7 @@ properties:
>>>         - qcom,pmr735a-rpmh-regulators
>>>         - qcom,pmx55-rpmh-regulators
>>>         - qcom,pmx65-rpmh-regulators
>>> +      - qcom,pmx75-rpmh-regulators
>>>   
>>>     qcom,pmic-id:
>>>       description: |
>>> @@ -424,10 +426,28 @@ allOf:
>>>           vdd-l11-l13-supply: true
>>>         patternProperties:
>>>           "^vdd-l[1347]-supply$": true
>>> -        "^vdd-l1[0245789]-supply$": true
>>> +        "^vdd-l1[024579]-supply$": true
>> Why? Does not look related at all.
> This update is because sdx65 does not have vdd-l18-supply separately and 
> its
> already part of vdd-l2-l18-supply property mentioned in the properties 
> field.

Which was not explained in commit msg and is anyway not related. It's a
separate commit.

Best regards,
Krzysztof

