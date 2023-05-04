Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96DE36F6D4D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 15:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231274AbjEDNu7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 09:50:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231215AbjEDNu6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 09:50:58 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3165E1737
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 06:50:56 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f1e2555b5aso4234535e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 May 2023 06:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683208254; x=1685800254;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CBa5yf09RWH4yiJkKKfGA5cpxuaznqIjeI5vqh5jKnc=;
        b=xXTCdKLJQRFOFCzlTq25XVRG7iQ2YTig8JrOBlX202YIt83MpXRScjaLxgVkY0zWnX
         DAVukRu+mKp/O1lsgwViKkyFW5TflkdO+9RSnOsPHJf1UAuvmWhLpdvus2AS6Xx56NDm
         CfWYEWqfh/q/sQRS9cAWeu5+0DKAw8bGkidhmv8yzMLKCAVlMYDjKTkaErzmqMlx9vh1
         DbS/JUBo+CCNe2h2qgjAEEJuEUOYtQ2xsNqwMrt8nEvQB4N73in46NuRPL+RS0Rw5t61
         ZjElPUzI86zAglFLOI5kjjaAYdQ2zK8mOxkBdMX3cvwx4ZC5ZEWZEDh6z887sMcghrwC
         EYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683208254; x=1685800254;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBa5yf09RWH4yiJkKKfGA5cpxuaznqIjeI5vqh5jKnc=;
        b=IaXslqqoAuWbvFPt8ya+FAajFosQbxg5q7UYAwHYeHi4oJw7eY0lnkjtAxRh4wbyke
         QifxrJ3spvo50diOZ81m6ChU9faeT4Fpo5yKM7j60UuA50RG7OhWj7w/pisyiorIKeCF
         IbueO+4oGd5OcSz5thcV/m33RZU8Pb6nkUFqfKvhquGh5BvQ/HEARFDI8Bef4VfSTSHt
         /eRvRt2Ch1qCw18oSbWKnFyAlad/TwHMQQ+t2WrIjvVHXuIGEqv6h+ZLMir8vEnpTluv
         zKXg3WChUB/NLbvJz8wX94d2nSPzpObgjoaF+P3Q+0cAAK7tPOqSCsN0VgxdbGSh97fr
         xYmw==
X-Gm-Message-State: AC+VfDwjYPGUmOkET58uI/9FkBSxo3ASGV4yadKXjUSTevY8EFI7kYb2
        DuREZrtZi3pyTX0N8hQKkx3Gpw==
X-Google-Smtp-Source: ACHHUZ5cfrBrKo0XKh8lYl7HP9vVSfMA8XPRqej+s9gQ4qUP1IFXfzgg0heMVynEUJsKqQXaLU6aZw==
X-Received: by 2002:a05:6000:1b82:b0:306:2a21:b5ff with SMTP id r2-20020a0560001b8200b003062a21b5ffmr2371851wru.17.1683208254591;
        Thu, 04 May 2023 06:50:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:52fb:80bd:bee3:f741? ([2a01:e0a:982:cbb0:52fb:80bd:bee3:f741])
        by smtp.gmail.com with ESMTPSA id y6-20020a1c4b06000000b003f17131952fsm4982246wma.29.2023.05.04.06.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 06:50:54 -0700 (PDT)
Message-ID: <ea0ec8b4-ec87-65f0-4f0e-504d8059b1e6@linaro.org>
Date:   Thu, 4 May 2023 15:50:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/7] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Add
 ports and orientation-switch
Content-Language: en-US
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230425034010.3789376-1-quic_bjorande@quicinc.com>
 <20230425034010.3789376-2-quic_bjorande@quicinc.com>
 <CAJB8c06H+3pxoUGXWOXyCgtbOj6y0OhSxb9dvoTo1b6iChy7ng@mail.gmail.com>
 <20230427195232.GB870858@hu-bjorande-lv.qualcomm.com>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230427195232.GB870858@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/04/2023 21:52, Bjorn Andersson wrote:
> On Wed, Apr 26, 2023 at 11:21:29AM +0100, Bryan O'Donoghue wrote:
>> On Tue, Apr 25, 2023 at 4:40 AM Bjorn Andersson
>> <quic_bjorande@quicinc.com> wrote:
>>>
>>> The QMP combo phy can be connected to a TCPM, a USB controller and a
>>> DisplayPort controller for handling USB Type-C orientation switching
>>> and propagating HPD signals.
>>>
>>> Extend the binding to allow these connections to be described.
>>>
>>> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
>>> ---
>>>   .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    | 51 +++++++++++++++++++
>>>   1 file changed, 51 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>>> index 3cd5fc3e8fab..c037ac90ce7f 100644
>>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>>> @@ -60,6 +60,26 @@ properties:
>>>       description:
>>>         See include/dt-bindings/dt-bindings/phy/phy-qcom-qmp.h
>>>
>>> +  orientation-switch:
>>> +    description:
>>> +      Flag the PHY as possible handler of USB Type-C orientation switching
>>> +    type: boolean
>>> +
>>> +  ports:
>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>> +    properties:
>>> +      port@0:
>>> +        $ref: /schemas/graph.yaml#/properties/port
>>> +        description: Output endpoint of the PHY
>>> +
>>> +      port@1:
>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>> +        description: Incoming endpoint from the USB controller
>>
>> Do you really need this one ?
>>
>> The controller doesn't process orientation switching.
>>
> 
> I don't have a need for it, as we can deal with role switching by
> connecting connector/port@0 to the dwc3.
> 
> But if we ever have a need to describe the dwc3 -> QMP -> connector path
> in the of_graph I think it would look prettier to have USB input as
> port@1 and DP input as port@2...

I think it would be great to have port@1 for USB SS and port@2 for DP,
otherwise we need to add 2 endpoints as I sent in
https://lore.kernel.org/all/20230503-topic-sm8450-graphics-dp-next-v1-1-d1ee9397f2a6@linaro.org/
since we split USB HS and SS streams on SM8[345]50 platforms.

> 
> Do you have a concern with keeping it around in the DT (the
> implementation doesn't need to care)?
> 
> Regards,
> Bjorn

