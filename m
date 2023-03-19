Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CEC16C02E2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Mar 2023 16:44:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbjCSPoh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Mar 2023 11:44:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjCSPog (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Mar 2023 11:44:36 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABA1BC15B
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 08:44:32 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id w11so4963064wmo.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 08:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679240671;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XygmRTuMXAk0qjBToyhmQtGTukltwH2s4JizX76hPh0=;
        b=OMs+HhiYXnH1JiqGbO0GnzL7QMYD+JVtkELhytevzbzJD9f7pUQCcQOnTjoYHnb4VN
         qw4s7Ttf/4VzqmTMZ+WlfIezrmTPVB78ShW8DIF5uXYwlAtBONyzBCYGSySRx8h9U/Qv
         nOAyqrpK/0OC+daAN7IdMv4M39F06A2MlMrCRcldSCK0jf+V4AnsGuP3TNpLQxT27f/h
         FnGyiGjEj3K0mXHLcro8Kw9APpy1XKXote91Du9zXb9XoV7kMpXunzQmTJWNyalZH9tp
         ANt0loNPnuDdyZV5nhrH7boUKtYxMXG2CPxGGcvVljOwEMVNrl47vVKtwf2hpbohbIN8
         Xd2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679240671;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XygmRTuMXAk0qjBToyhmQtGTukltwH2s4JizX76hPh0=;
        b=UDN5b6yI3E3j5gKu1Rlybx2kjxYJdgB90lfGhXC6rE8UhX4mPlD5KJ3HqTzs8LJJiK
         g4o0Xfs4q7Beikrhx3H9PD3QeC8oS6hrCLuz3DxD3k5yklkjc584GxSYq4OhXUdMHgzl
         Dg9kuKCB2xQZS6NV+TeKmmBG+3rrmKeOb1rbXd6h/+0StXDHkXEOQKzFOKoie+qjJdU7
         fQzA1C1ea7mCGCWq2W1EyT1tAiyRYmHQCLUS4Ub3yMmtftGAHhrQ/PIcVQRMbMCOEkDJ
         yJf4i14UYJsTP95j9ttZvhUJ/Y2oLzmnupA2FQOtUq2JcFE2JCcsFmMvXFLpomDqANn/
         Ewuw==
X-Gm-Message-State: AO0yUKVR2GaT0ogIjHFwGfssSzqYzpspycJqpOgbXanRp7FwwGW2T+/S
        a6LokXC9/isIwvAlukQlHEhjhw==
X-Google-Smtp-Source: AK7set8yLvx3NE9MY5IG7jARSbCtCf5vSUuc2qavo8QrQRnE72eQD+pwyAfnE4mq1Vpq12BovyxA+Q==
X-Received: by 2002:a05:600c:3588:b0:3ed:3993:6a93 with SMTP id p8-20020a05600c358800b003ed39936a93mr13612665wmq.19.1679240671203;
        Sun, 19 Mar 2023 08:44:31 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l15-20020a7bc44f000000b003edef091b17sm788771wmi.37.2023.03.19.08.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 08:44:30 -0700 (PDT)
Message-ID: <aa5d1492-906f-9e30-8f97-6321db692c73@linaro.org>
Date:   Sun, 19 Mar 2023 15:44:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 09/18] dt-bindings: usb: Add Qualcomm PMIC TCPM YAML
 schema
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-10-bryan.odonoghue@linaro.org>
 <7cd51a8d-7b23-7895-7c06-07dc98924931@linaro.org>
 <a4da1f8f-333e-9ded-d784-7f86c45c7156@linaro.org>
 <346ecd20-d64f-1d47-4860-861e142f9700@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <346ecd20-d64f-1d47-4860-861e142f9700@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 19/03/2023 15:10, Krzysztof Kozlowski wrote:
> On 19/03/2023 15:59, Bryan O'Donoghue wrote:
>> On 19/03/2023 11:58, Krzysztof Kozlowski wrote:
>>>> +
>>>> +maintainers:
>>>> +  - Bryan O'Donoghue<bryan.odonoghue@linaro.org>
>>>> +
>>>> +description: |
>>>> +  Qualcomm PMIC Virtual Type-C Port Manager Driver
>>>> +  A virtual device which manages Qualcomm PMIC provided Type-C port and
>>>> +  Power Delivery in one place.
>>> OK, so it looks like bindings for driver, so a no-go. Unless there is
>>> such device as "manager", this does not look like hardware description.
>>>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: qcom,pmic-virt-tcpm
>>>> +
>>>> +  connector:
>>>> +    type: object
>>>> +    $ref: /schemas/connector/usb-connector.yaml#
>>>> +    unevaluatedProperties: false
>>>> +
>>>> +  port:
>>>> +    $ref: /schemas/graph.yaml#/properties/port
>>>> +    description:
>>>> +      Contains a port which consumes data-role switching messages.
>>>> +
>>>> +  qcom,pmic-typec:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>> +    description:
>>>> +      A phandle to the typec port hardware driver.
>>>> +
>>>> +  qcom,pmic-pdphy:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> Having typec and phy as phandles - not children - also suggests this is
>>> some software construct, not hardware description.
>>
>> So probably I didn't interpret Rob's comment correctly here.
> 
> He proposed to merge it with other node:
> "probably merged with
> one of the nodes these phandles point to."
> 
> "Why can't most of this binding be part of"
> 
> I don't see how you implemented his comments. Actually, nothing improved
> here in this regard - you still have these phandles.

So this comment from Rob is what I was aiming for

"Your other option is instantiate your own device from the virtual
driver's initcall based on presence of the 2 nodes above. "

rather than two mush the pdphy and typec into one device, which they are 
not.

I guess what I'm trying to understand is how you guys would suggest that 
is actually done.

Could I trouble you for an example ?

---
bod
