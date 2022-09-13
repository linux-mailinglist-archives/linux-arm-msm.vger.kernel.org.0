Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C63E35B7816
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Sep 2022 19:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233137AbiIMRgO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Sep 2022 13:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233141AbiIMRf4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Sep 2022 13:35:56 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E08398A4B
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 09:25:52 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id d12-20020a05600c34cc00b003a83d20812fso9879508wmq.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 09:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=OKN8VlLuCDfiERxzI2+XM2BCjDBYdD0WSU7txH+oqhI=;
        b=uRznjyTYGrqXpXwIJzlmIXQ25Hr8qtCVtmJMwp9zvx6YIJSIMRaU/ApNl1dXzKSlzW
         0w7L46c0OJH/XxX4AhBDD787JHuoELtjuw9GFV9TNVSpTtMqjE2hv11kLsWh4x9lJi46
         GCI5qDKHEkgq4wIkv4LFBTQI8XgOvZYLVUFBLgWQzJCfybmM2/c1yr8tmNZNt2mLTmp/
         iKydIWrpBpYUJ+jbpPurldzcH6O58vXw8ZTyBiewsQf14tYfyG6fMDeVgjC+RPcNh+rp
         jEJ3MltDE1TvhrOtSyl7FwOIzXHqyx/zOI8df8TiE70WlsO1W5jz5FY2Gp1JnQFMpyFt
         bVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=OKN8VlLuCDfiERxzI2+XM2BCjDBYdD0WSU7txH+oqhI=;
        b=gDKIMvI9hTbJo9MM8zzP8DcnmvnrEcqoRZdL7+GlW6unL4WWjaw0ITu0Wmp5KNEXLe
         B9Q3pTiE89SYCaAY//jRm5MAlH5HeYRj1P8rky1fzfJ7HrJ6x3N3Rmw+QXvWghRGHPjq
         wdLWUK1ZHgEicVjGfA7cbE6/eYF4q9zAeUQNrSNcjQZtYzcV8I8fgZ/gfJdc0gFr2h0g
         v4ZZmaywR1cnEaLnFdbVsTE7e+VOpe6FEbLMHD+ShLdzPzHo5dFMwhxz5aJiinuVzBXT
         2lnqAiDyM/ybgWzs8YVevb30HOs0Hnu0FHWU5z5YmsTsa4f1QwvtBxd/9xgzAtW7KOJD
         kRWQ==
X-Gm-Message-State: ACgBeo1jT/g1XyLv1z3XrehF038D+RXCuxQWPAHh5OyVDwj2jqwsRxEg
        GBM7ppej2sUbSD4uapdA89uDPw==
X-Google-Smtp-Source: AA6agR6m+cKtfWYfmOldGwLugLA9gLJ2qT8xWuOhJD/1NmvBke6ThGWFcraQyfDokvJeknozSLV1tg==
X-Received: by 2002:a7b:c84f:0:b0:3b4:84c1:1e7 with SMTP id c15-20020a7bc84f000000b003b484c101e7mr125429wml.12.1663086351164;
        Tue, 13 Sep 2022 09:25:51 -0700 (PDT)
Received: from [10.119.22.201] ([89.101.193.68])
        by smtp.gmail.com with ESMTPSA id i12-20020a1c540c000000b003b47ff3807fsm9364257wmb.5.2022.09.13.09.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 09:25:50 -0700 (PDT)
Message-ID: <d22ed818-1a8d-4af8-d41d-2268806f3dea@linaro.org>
Date:   Tue, 13 Sep 2022 18:25:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: pci: qcom,pcie-ep: correct qcom,perst-regs
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20220911135547.23106-1-krzysztof.kozlowski@linaro.org>
 <11e61fa5-f770-9c9f-23b9-3d1dcb205bc5@linaro.org>
 <20220913152054.GA3736444-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220913152054.GA3736444-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/09/2022 17:20, Rob Herring wrote:
> On Sun, Sep 11, 2022 at 04:14:54PM +0200, Krzysztof Kozlowski wrote:
>> On 11/09/2022 15:55, Krzysztof Kozlowski wrote:
>>> qcom,perst-regs is an phandle array of one item with a phandle and its
>>> arguments.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>>  Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml | 6 ++++--
>>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
>>> index 3d23599e5e91..077e002b07d3 100644
>>> --- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
>>> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
>>> @@ -60,8 +60,10 @@ properties:
>>>                   enable registers
>>>      $ref: "/schemas/types.yaml#/definitions/phandle-array"
>>>      items:
>>> -      minItems: 3
>>> -      maxItems: 3
>>> +      - items:
>>> +          - description: Syscon to TCSR system registers
>>> +          - description: Perst enable offset
>>> +          - description: Perst separateion enable offset
>>
>> Unfortunately this still complains:
>>
>> qcom-sdx55-t55.dtb: pcie-ep@40000000: qcom,perst-regs:0: [28] is too short
>>
>>
>> where 28 is the phandle...
> 
> Meaning the dt is wrong or there's a tooling issue?

I think tooling issue. I looked at this many times and code (schema and
DTS) seems to be correct, but tool doesn't like it.


Best regards,
Krzysztof
