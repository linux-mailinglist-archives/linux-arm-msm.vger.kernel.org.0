Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 888C5562412
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 22:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231316AbiF3UWA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 16:22:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231827AbiF3UV7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 16:21:59 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24EDF22BEA
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 13:21:58 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id i132-20020a1c3b8a000000b003a1888b9d36so264182wma.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 13:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=KueTXZzUzoQLXbBt1guA65pESnrv+y9MxIGXMhXasXg=;
        b=REk7ner2vjYPUNY03rI+BNBNzlQkYjsVlT9hXK/TMX6f8g5zD0I8rtaYRgDhfI9Yde
         ACnQZE8WehA7gc/D0r22jYvuhhnT6nlgd5kTMNgMLWbXhLDpOb+wsM4mgD39A0tdq07P
         fdz0Fn/JfsUTKp3t7/kKoIGghPxIQncCxM4wxoo9n/ykASZqPGnOzzVwDwf2NmnJNHiA
         7GmKXRdeDYFx79gzw9IZCXoFGFvexlebO6G/iidmXgjUoRvj4RGl4nt7lXXrGkRooMkb
         vZXGhhZbitwPNhIvu71wIczBuysFa/auAnTFqqJrbx7qb4VZ8c86cxG68O9/8hsiY+KM
         fx5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=KueTXZzUzoQLXbBt1guA65pESnrv+y9MxIGXMhXasXg=;
        b=sy5zPAPS4PV0YLFML0IcxWR5mlVLZizHTdD/HkW0p5kGJk6HcQq4UHsIjnGiY8tf7J
         dz+gVG9zwRKvx7xbKP/J7RqhwhfwL+s+t2Bp3jsGVRhQ9+9GQMKcQquH6M14/i/RD8+L
         RBvl1oy2XGKEVwXk5WZUzZrO3vBoWd3PyhhWamIicrDYJRE714PekfIsK+TEilWOQvUD
         5YybxEzpnqCX/BnVp78MlAyD4c2m/Ib7vFPiZGT9ZnVuqpoFij/sIEYSTph9V+L2NkOJ
         3IHViZ/iaKkiOXSdOvqo5zqZ+PNK/D65MAG6GF53JdVlINFKMX/olNk1zT0U0zSqIE01
         XTOQ==
X-Gm-Message-State: AJIora+Bpcl+ji+GVW3sgk0bcgTLBN570Hhx8j4VRnllpKmb81ewTjA4
        CUjQQ3SDkfZ9pY0p6dRxuLFhPg==
X-Google-Smtp-Source: AGRyM1tVR3oCXNuOOo21Yf/cJboWchDcCqnHZ2SMh2W4O5ivmuNUIMEZhRKo2tRp4nOU1x5VRcOTPw==
X-Received: by 2002:a7b:c4ce:0:b0:3a0:2ac4:3233 with SMTP id g14-20020a7bc4ce000000b003a02ac43233mr13694095wmk.92.1656620516601;
        Thu, 30 Jun 2022 13:21:56 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b8-20020a05600c4e0800b003974cb37a94sm4014175wmq.22.2022.06.30.13.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 13:21:56 -0700 (PDT)
Message-ID: <a8543f3b-1a02-df00-beb8-0cf2a8b705e8@linaro.org>
Date:   Thu, 30 Jun 2022 21:21:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] dt-bindings: pm8941-misc: Fix usb_id and usb_vbus
 definitions
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org,
        myungjoo.ham@samsung.com, cw00.choi@samsung.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        gurus@codeaurora.org, aghayal@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220630042357.3308128-1-bryan.odonoghue@linaro.org>
 <7a3efafc-71b2-c474-bb73-6959c701f459@linaro.org>
 <ef06f83c-e521-29da-b59b-a0cd4c2aef10@linaro.org>
In-Reply-To: <ef06f83c-e521-29da-b59b-a0cd4c2aef10@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/06/2022 21:09, Bryan O'Donoghue wrote:
> On 30/06/2022 19:47, Krzysztof Kozlowski wrote:
>> On 30/06/2022 06:23, Bryan O'Donoghue wrote:
>>> dts validation is throwing an error for me on 8916 and 8939 with
>>> extcon@1300. In this case we have usb_vbus but not usb_id.
>>>
>>> Looking at the pm8941-misc driver we can have usb_id, usb_vbus or 
>>> both at
>>> the same time.
>>
>> Implementation is not the best reason to change bindings. Implementation
>> can change, bindings should not.
>>
>>>
>>> Expand the definition with anyOf to capture the three different valid
>>> modes.
>>>
>>> Fixes: 4fcdd677c4ea ("bindings: pm8941-misc: Add support for VBUS 
>>> detection")
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>   .../devicetree/bindings/extcon/qcom,pm8941-misc.yaml | 12 ++++++++----
>>>   1 file changed, 8 insertions(+), 4 deletions(-)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml 
>>> b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
>>> index 6a9c96f0352ac..1bc412a4ac5e6 100644
>>> --- a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
>>> +++ b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
>>> @@ -27,10 +27,14 @@ properties:
>>>     interrupt-names:
>>>       minItems: 1
>>> -    items:
>>> -      - const: usb_id
>>> -      - const: usb_vbus
>>> -
>>> +    anyOf:
>>> +      - items:
>>> +          - const: usb_id
>>> +          - const: usb_vbus
>>> +      - items:
>>> +          - const: usb_id
>>
>> I don't think you can have ID connected and VBUS disconnected, therefore
>> is it even possible to have missing VBUS interrupt?
> 
> So the driver code does support that configuration
> 
> info->id_irq = platform_get_irq_byname(pdev, "usb_id");
> if (info->id_irq > 0) {
>          ret = devm_request_threaded_irq(dev, info->id_irq, NULL,
>                                  qcom_usb_irq_handler,
>                                  IRQF_TRIGGER_RISING |
>                                  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
>                                  pdev->name, info);
>          if (ret < 0) {
>                  dev_err(dev, "failed to request handler for ID IRQ\n");
>                  return ret;
>          }
> }
> 
> info->vbus_irq = platform_get_irq_byname(pdev, "usb_vbus");
> if (info->vbus_irq > 0) {
>          ret = devm_request_threaded_irq(dev, info->vbus_irq, NULL,
>                                  qcom_usb_irq_handler,
>                                  IRQF_TRIGGER_RISING |
>                                  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
>                                  pdev->name, info);
>          if (ret < 0) {
>                  dev_err(dev, "failed to request handler for VBUS IRQ\n");
>                  return ret;
>          }
> }
> 
> Looking at what we have in upstream we declare the usb_vbus interrupt 
> but no platform that I can see declares a usb_id interrupt.
> 
> In practice the USB host driver drivers/usb/chipidea/core.c gets an 
> extcon from a GPIO instead of from the pm8941 block.
> 
> arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
> arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
> 
> On the T2a platform we use an external USB type-c controller which owns 
> both vbus and usb_id/role but, in that case we don't want to switch on 
> this driver at all...
> 
> Yep, I agree with you. I don't see a valid use-case for this driver 
> without usb_vbus.
> 
> I'll tweak the bindings to reflect.
> 
> ---
> bod

Ah but wait.

Equally it would be possible to have an external port manager like the 
i2c type-c port manager we have which would control vbus but, the 
hardware could route usb_id straight to the pm8941 block.

Hmm, no I do think it is possible to have a valid use of this driver - 
with vbus owned by an external IC but usb_id routed here instead of to a 
GPIO..

---
bod
