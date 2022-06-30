Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F48C5623ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 22:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237088AbiF3UJJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 16:09:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236986AbiF3UJI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 16:09:08 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD2A25591
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 13:09:07 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id v14so168316wra.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 13:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vENloKw4Zyjc0gCri5jvH4/9LY/XC5cl5dQKTcjvaCs=;
        b=FGWWuFmCEgl3+th2ubwE35nFIPRxd7fdfBftL6oT63kl3iQMJDA+uPfe2GRBaNcMCu
         L3u4E1akwlsi2DFUjhIFjDiLrXWoL/3W2z6ut0w6Ej9gvGnPZHUpm2zWYLwsBSOjl9bJ
         Emjw8EU5pMJhtrPv1ZcDD5Qq9tc/jXtNb5F24mjgKgRW547pR5hzdElR825oZbs0pIJG
         BaIsHl25EyWv4l35cMA30TzaFR5mQB8/VYFae3Jsn9yQX3kqvzc3zLoqTWQJp89vYyOH
         0Or95dJxBkW/zKzWyZUVf51AgW9AgSJ6HbgazG/2qbiLxcLS++zK/hNedE78SM3Qn5jA
         a51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vENloKw4Zyjc0gCri5jvH4/9LY/XC5cl5dQKTcjvaCs=;
        b=VlWlsXDLRF40DYj+SnkZWJS8tvQZGoXzqpjNf5uYjhoJCaUW2WaY3BzKdg7AnrzwiY
         Vd9VqVEJCJLmB+9nxayR0b9hdFmtZc32/9frPOApBeUxmqph8/rKJ1aGG6xnkAH8PvNX
         CbH8a1i3piXrgecRomKEPMPuteEeWmPr7dvDFYb9EXsypmyCO5LfDCJHWrQje77NkUZi
         CIZFfr+EUrsAg3G0gZAgpISeAvbP+uL+NmqyiCkmN8O5aqOVqMezN8GaOZy00jrZdrHa
         E8RlgpoOlWpNycpXmTD1K1IqzeYbB85xb1qRys0OYd2SRhZ3mob1e13qvze+PQE6KAXQ
         Y5+A==
X-Gm-Message-State: AJIora++OaZwtvLo9xvkfz9P6SpM0WXAYpbxL6eBuAuK675rEdjnWQzT
        rQUidSAZK62i0v40XpY8Qj9eUA==
X-Google-Smtp-Source: AGRyM1t6Q/lH53ojAoEjykLx6b3VMs8L7aT1RpJP89ZOCk1tkN9pqeUVE/KoGXvtAYp7d7zHU4CmBg==
X-Received: by 2002:a5d:59c5:0:b0:21d:1864:3154 with SMTP id v5-20020a5d59c5000000b0021d18643154mr10222553wry.719.1656619746417;
        Thu, 30 Jun 2022 13:09:06 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l3-20020a1c7903000000b003a04962ad3esm3962303wme.31.2022.06.30.13.09.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 13:09:05 -0700 (PDT)
Message-ID: <ef06f83c-e521-29da-b59b-a0cd4c2aef10@linaro.org>
Date:   Thu, 30 Jun 2022 21:09:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] dt-bindings: pm8941-misc: Fix usb_id and usb_vbus
 definitions
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org,
        myungjoo.ham@samsung.com, cw00.choi@samsung.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        gurus@codeaurora.org, aghayal@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220630042357.3308128-1-bryan.odonoghue@linaro.org>
 <7a3efafc-71b2-c474-bb73-6959c701f459@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <7a3efafc-71b2-c474-bb73-6959c701f459@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/06/2022 19:47, Krzysztof Kozlowski wrote:
> On 30/06/2022 06:23, Bryan O'Donoghue wrote:
>> dts validation is throwing an error for me on 8916 and 8939 with
>> extcon@1300. In this case we have usb_vbus but not usb_id.
>>
>> Looking at the pm8941-misc driver we can have usb_id, usb_vbus or both at
>> the same time.
> 
> Implementation is not the best reason to change bindings. Implementation
> can change, bindings should not.
> 
>>
>> Expand the definition with anyOf to capture the three different valid
>> modes.
>>
>> Fixes: 4fcdd677c4ea ("bindings: pm8941-misc: Add support for VBUS detection")
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   .../devicetree/bindings/extcon/qcom,pm8941-misc.yaml | 12 ++++++++----
>>   1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
>> index 6a9c96f0352ac..1bc412a4ac5e6 100644
>> --- a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
>> +++ b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
>> @@ -27,10 +27,14 @@ properties:
>>   
>>     interrupt-names:
>>       minItems: 1
>> -    items:
>> -      - const: usb_id
>> -      - const: usb_vbus
>> -
>> +    anyOf:
>> +      - items:
>> +          - const: usb_id
>> +          - const: usb_vbus
>> +      - items:
>> +          - const: usb_id
> 
> I don't think you can have ID connected and VBUS disconnected, therefore
> is it even possible to have missing VBUS interrupt?

So the driver code does support that configuration

info->id_irq = platform_get_irq_byname(pdev, "usb_id");
if (info->id_irq > 0) {
         ret = devm_request_threaded_irq(dev, info->id_irq, NULL,
                                 qcom_usb_irq_handler,
                                 IRQF_TRIGGER_RISING |
                                 IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
                                 pdev->name, info);
         if (ret < 0) {
                 dev_err(dev, "failed to request handler for ID IRQ\n");
                 return ret;
         }
}

info->vbus_irq = platform_get_irq_byname(pdev, "usb_vbus");
if (info->vbus_irq > 0) {
         ret = devm_request_threaded_irq(dev, info->vbus_irq, NULL,
                                 qcom_usb_irq_handler,
                                 IRQF_TRIGGER_RISING |
                                 IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
                                 pdev->name, info);
         if (ret < 0) {
                 dev_err(dev, "failed to request handler for VBUS IRQ\n");
                 return ret;
         }
}

Looking at what we have in upstream we declare the usb_vbus interrupt 
but no platform that I can see declares a usb_id interrupt.

In practice the USB host driver drivers/usb/chipidea/core.c gets an 
extcon from a GPIO instead of from the pm8941 block.

arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts

On the T2a platform we use an external USB type-c controller which owns 
both vbus and usb_id/role but, in that case we don't want to switch on 
this driver at all...

Yep, I agree with you. I don't see a valid use-case for this driver 
without usb_vbus.

I'll tweak the bindings to reflect.

---
bod
