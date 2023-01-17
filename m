Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D01066DBB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jan 2023 12:03:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236456AbjAQLDA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 06:03:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236428AbjAQLC7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 06:02:59 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F8B0298CD
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 03:02:58 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id q8so10111095wmo.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 03:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=abFmZAKwNQ0lsGZ+PxxNEj0hBQ4umW7GBDcoKp+rrrw=;
        b=om96Sz5yNFfHU4TsKyGtSTlZ5sKEDWICtG6E59wRXOVZQn7K6W9qHRz/8HIunnzkLv
         wc+2mkiiZKEGbTJjG+tAKg8xwvOn3yBHnJTayG9xdaXjPPY+VbNTRgiy/zo76sZWMO2W
         E8LxB2d/DhESSHMI7Pvrw7b0RFbGSQEfXBh9U4G8y6e1Gkz3amZIAWLxMBlwhw1UTdyU
         dOzLhU/PZSPd6j6lzIQUfJw8J1Ycss1m+LbpCbOO0LTXpyHmf8kFw+UAZ4/aQGbHOYHi
         SJ3f9Xk2a1r4EUYkMR1b4iumej8+D2tzc1kcHUtLM8ofRmw9a+niEZ4oYm+/2tw+ERsk
         Ol+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=abFmZAKwNQ0lsGZ+PxxNEj0hBQ4umW7GBDcoKp+rrrw=;
        b=i+/poFdcg8/7gpxZrzrftezZTwYTjydSAV/GusV/PpiqbeM+4xJwHqELZ/gG2Yyz0A
         6u+wei0t1gmYWEoqICu4VNB5KEKcqxE4CT8DsGozPxq4wrhXaOzqSV3z9gvpfbaUhf+3
         syeJ3vESzx00YgsDtwso+3cJRZ5DR2MYueMvvUipfUwhAfQ3utSIGmnKRHUcQvAeYwlI
         V+p+iUQPt5bMEZ4s0/H732BFVolwNIxp8t6byvZiAKaxqcrbUy1sC+uSLvStzQGI7SJ5
         cL99HjHAIKdT1ZrMLtuWI5/5aJ9katA+X4fLNjnWDM7nKFwIaBpFoxlGYW94p4+u5aHS
         O9KQ==
X-Gm-Message-State: AFqh2kp7369ePeIq++m9WrlDqeyXWgwk57SwUQSjayKO0Q0d7G4mXDKF
        JVAU4M4Y8+6OWygLhHzrqJh8LA==
X-Google-Smtp-Source: AMrXdXvldDiXjM/r/D7lN/ao41/YqalSL0ysvd2nD8pw30qMQAxQxyb5NuWMVbXG75VI5m5qCIwtwA==
X-Received: by 2002:a05:600c:c17:b0:3d0:7415:c5a9 with SMTP id fm23-20020a05600c0c1700b003d07415c5a9mr11380374wmb.21.1673953376843;
        Tue, 17 Jan 2023 03:02:56 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id s23-20020a1cf217000000b003d1e3b1624dsm40839658wmc.2.2023.01.17.03.02.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 03:02:56 -0800 (PST)
Message-ID: <ca729f62-672e-d3de-4069-e2205c97e7d8@linaro.org>
Date:   Tue, 17 Jan 2023 12:02:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC v4 1/5] dt-bindings: usb: Add bindings to support multiport
 properties
Content-Language: en-US
To:     Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
        Rob Herring <robh@kernel.org>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com, quic_wcheng@quicinc.com,
        quic_jackp@quicinc.com, quic_harshq@quicinc.com
References: <20230115114146.12628-1-quic_kriskura@quicinc.com>
 <20230115114146.12628-2-quic_kriskura@quicinc.com>
 <20230116163401.GA2371990-robh@kernel.org>
 <4eb26a54-148b-942f-01c6-64e66541de8b@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4eb26a54-148b-942f-01c6-64e66541de8b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/01/2023 10:01, Krishna Kurapati PSSNV wrote:
> 
> 
> On 1/16/2023 10:04 PM, Rob Herring wrote:
>> On Sun, Jan 15, 2023 at 05:11:42PM +0530, Krishna Kurapati wrote:
>>> Add bindings to indicate properties required to support multiport
>>> on Snps Dwc3 controller.
>>>
>>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
>>> ---
>>>   .../devicetree/bindings/usb/snps,dwc3.yaml    | 53 ++++++++++++++++---
>>>   1 file changed, 47 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
>>> index 6d78048c4613..3ea051beb2f8 100644
>>> --- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
>>> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
>>> @@ -81,15 +81,26 @@ properties:
>>>   
>>>     phys:
>>>       minItems: 1
>>> -    maxItems: 2
>>> +    maxItems: 8
>>>   
>>>     phy-names:
>>>       minItems: 1
>>> -    maxItems: 2
>>> -    items:
>>> -      enum:
>>> -        - usb2-phy
>>> -        - usb3-phy
>>> +    maxItems: 8
>>> +    oneOf:
>>> +    - items:
>>> +        enum:
>>> +          - usb2-phy
>>> +          - usb3-phy
>>> +    - items:
>>> +        enum:
>>> +          - usb2-phy_port0
>>> +          - usb2-phy_port1
>>> +          - usb2-phy_port2
>>> +          - usb2-phy_port3
>>> +          - usb3-phy_port0
>>> +          - usb3-phy_port1
>>> +          - usb3-phy_port2
>>> +          - usb3-phy_port3
>>
>> usbN-portM
>>
>>>   
>>>     resets:
>>>       minItems: 1
>>> @@ -360,6 +371,22 @@ properties:
>>>       description:
>>>         Enable USB remote wakeup.
>>>   
>>> +  num-ports:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description:
>>> +      This property indicates the number of ports present on the target that
>>> +      are to be serviced by the DWC3 controller.
>>> +    minimum: 1
>>> +    maximum: 4
>>> +
>>> +  num-ss-ports:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description:
>>> +      This property indicates the number of SS capable ports present on the
>>> +      target that are to be serviced by the DWC3 controller.
>>> +    minimum: 1
>>> +    maximum: 4
>>
>> This information is redundant. 'phy-names' tells you how many ports of
>> each.
>>
> Hi Rob,
> 
>   Thanks for the review. The reason I wanted to introduce two more 
> variables is to get info on number of ports  and ss-capable ports 
> present on hardware whether or not the user provides them in DTSI file.
> 
> In the code there are two types of per port / per phy operations:
> a) Modifying GUSB2PFYCFG and GUSB3PIPECTL registers per phy.
> b) Generic Phy operations - per phy.
> 
> In today's code, if someone doesn't mention the SSPHY in DTSI, 
> dwc->usb3_generic_phy will be NULL and any call to phy operations will 
> just bail out. And irrespective of whether we provide SS Phy in DTSI or 
> not, we still configure GUSB3PIPECTL register.
> 
> Consider the following cases:
> 
> 1. There are 3 ports and 2 of them are SS capable and all phy's are 
> mentioned in DTSI.
> 
> phy-names= "usb2-port0", "usb3-port0", "usb2-port1", "usb3-port1", 
> "usb2-port2"
> 
> When we count them in the driver, we get num ports as 3 (presuming 
> num-ports = num of hs ports) and num-ss-ports = 2.
> 
> Since there is no ambiguity in which all ports to configure, we can 
> modify GUSB2PHYCFG registers for all 3 HS Phy's and GUSB3PIPECTL for 
> both SS Phy's.
> This is a proper scenario.
> 
> 2. If the user skips providing SS Phy on Port-0, then:
> 
> phy-names= "usb2-port0", "usb2-port1", "usb3-port1", "usb2-port2"
> 
> If we count the phys, we end up getting num-ports=3 and num-ss-ports=1.
> 
> Since in the driver code, we are not keeping track of which ports are SS 
> capable and which ones are not, we end up configuring
> GUSB2PIPECTL(port-0) instead of port-1  as the num-ss-ports is "1" which 
> is incorrect.
> 
> 3. If the user skips providing one complete port, in this case port-1 is 
> skipped, then:
> 
> phy-names= "usb2-port0", "usb3-port0", "usb2-port2"
> 
> If we count the phys, we end up getting num-ports=2 and num-ss-ports=1.
> 
> Since in the driver code, we are not keeping track of which ports are SS 
> capable and which ones are not, we end up configuring 
> GUSB2PHYCFG(port-0) and GUSB2PHYCFG(port-1) instead of port-2 which is 
> incorrect.

Why? You know you have port-2 from the phy name, so why would you ignore
this information?

> 
> To avoid these scenarios, if we can get the exact number of SS Ports and 
> Ports in total present on the HW, we can configure all the registers 
> whether the phy's are provided in DTSI or not. (This is of no harm I 
> believe as it still works in today's code)

Doesn't the driver know how many phys it has in such case through
respective compatible?

> 
> Incase the 2nd and 3rd scenarios are not allowed and user *MUST* declare 
> all the phy's in the DTSI, then I can go ahead and remove these 
> properties and count them in the driver code.


Why you cannot then configure all phys in the driver all ports as some
safe default and then customize it depending on the actual port used?


Best regards,
Krzysztof

