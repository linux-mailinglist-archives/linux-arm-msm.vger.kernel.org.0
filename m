Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F14759C7D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Aug 2022 21:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235582AbiHVTEW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Aug 2022 15:04:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233350AbiHVTEV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Aug 2022 15:04:21 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 698DC13F79
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 12:04:20 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id w23so6373885ljj.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 12:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=3IWXz8eCdqpXEQvD6O5SYTQDmDx5euY2FlxhrreZWG4=;
        b=LuvvTwCNhCDCu2NS4MmKwvnQenPyoAw/9xUEHWdz7Tq5EervJX1bOfuah2Z3IieK4E
         Dbu6NyQCWCGpV1RT1ctHxOhR+5SSKFaAslQKO4fdKWzhnTJk9uog76OShLGq1bMvXuFn
         aOxGIS8p6wZ053W+wpGK47ODLh/TUgH7HDN8NkgUX5BB+e8MItGr1D/QDHlVbllVhSpM
         6WmeAtxtXEUdGkf8VbFb8DYCUfIGrjTyLB4PYH/KbCOZLWSqmiebx4w5yHrgQQeDS6km
         0tSPifp6zhnyNM/RcnaTVkhz2nAm8PHajVLPKTNCC5975uXx+Jy+e51Cb/K8TcAnEUQs
         qd0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=3IWXz8eCdqpXEQvD6O5SYTQDmDx5euY2FlxhrreZWG4=;
        b=zv4LGSFgPObYLBp9zR/yxrstC6EyeRZjpD/7AdhNdXoSybeFITfRo9HIn27YI+dyo0
         2Qa4uNHjLZrZDRNSV10fqLP0AXcmaDb+pOIw2qZdAbqHHc01eyrIN9ktwmURE6upseER
         hQ7GDK7o6dBTJQVS2HRFMbzV9BWMmnXMlPPhLj9+UzbjxKr9Asi9rVHyPjW7SzAIPGUB
         D8Z5Qu/9lvkVGp86zFoIVtps+RtX6GDwSZGG+Lw4+NByapk1n11j7NCTbTubNb9IKQh2
         muzZ9pTYrIhIGjMEF8I24cXuGyHro/cfHluQSEa00Lfkwm8mGPF75dst6ULQiwYMFkpN
         l2LQ==
X-Gm-Message-State: ACgBeo0O4J/U09vatrOxRMviVHQFOdjx1vahigNEHMODgLdkEhi5W0m8
        jnv7c4b0S4h03s1iwIdF2Tdu6w==
X-Google-Smtp-Source: AA6agR5ieNB4uOnYYDjnId+dqFhUZbozl3LcSybJCzFRj4ssHYbplnXNawbEaRZdLCNmR7fu6JnsRw==
X-Received: by 2002:a2e:ba0a:0:b0:261:cc4f:1ab1 with SMTP id p10-20020a2eba0a000000b00261cc4f1ab1mr2126422lja.215.1661195058732;
        Mon, 22 Aug 2022 12:04:18 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q15-20020a056512210f00b00492d1eb41dfsm1381207lfr.240.2022.08.22.12.04.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 12:04:18 -0700 (PDT)
Message-ID: <76c05290-d957-b1ec-fa4d-1074c42979a8@linaro.org>
Date:   Mon, 22 Aug 2022 22:04:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v2 06/11] dt-bindings: display/msm: move qcom,sc7180-mdss
 schema to mdss.yaml
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
 <20220710090040.35193-7-dmitry.baryshkov@linaro.org>
 <37bf0f7f-e555-7ae9-7d2b-e05a9e8db6a4@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <37bf0f7f-e555-7ae9-7d2b-e05a9e8db6a4@linaro.org>
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

On 11/08/2022 11:25, Krzysztof Kozlowski wrote:
> On 10/07/2022 12:00, Dmitry Baryshkov wrote:
>> Move schema for qcom,sc7180-mdss from dpu-sc7180.yaml to mdss.yaml so
>> that the dpu file describes only the DPU schema.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../bindings/display/msm/dpu-sc7180.yaml      | 149 +++++-------------
>>   .../devicetree/bindings/display/msm/mdss.yaml |  45 +++++-
>>   2 files changed, 80 insertions(+), 114 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>> index d3c3e4b07897..9d4ec0b60c25 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>> @@ -10,151 +10,78 @@ maintainers:
>>     - Krishna Manikandan <quic_mkrishn@quicinc.com>
>>   
>>   description: |
>> -  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
>> -  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
>> -  bindings of MDSS and DPU are mentioned for SC7180 target.
>> +  Device tree bindings for the DPU display controller for SC7180 target.
>>   
>>   properties:
>>     compatible:
>>       items:
>> -      - const: qcom,sc7180-mdss
>> +      - const: qcom,sc7180-dpu
>>   
>>     reg:
>> -    maxItems: 1
>> +    items:
>> +      - description: Address offset and size for mdp register set
>> +      - description: Address offset and size for vbif register set
>>   
>>     reg-names:
>> -    const: mdss
>> -
>> -  power-domains:
>> -    maxItems: 1
>> +    items:
>> +      - const: mdp
>> +      - const: vbif
>>   
>>     clocks:
>>       items:
>> -      - description: Display AHB clock from gcc
>> -      - description: Display AHB clock from dispcc
>> +      - description: Display hf axi clock
>> +      - description: Display ahb clock
>> +      - description: Display rotator clock
>> +      - description: Display lut clock
>>         - description: Display core clock
>> +      - description: Display vsync clock
>>   
>>     clock-names:
>>       items:
>> +      - const: bus
>>         - const: iface
>> -      - const: ahb
>> +      - const: rot
>> +      - const: lut
>>         - const: core
>> +      - const: vsync
>>   
>>     interrupts:
>>       maxItems: 1
>>   
>> -  interrupt-controller: true
>> -
>> -  "#address-cells": true
>> -
>> -  "#size-cells": true
>> -
>> -  "#interrupt-cells":
>> -    const: 1
>> -
>> -  iommus:
>> -    items:
>> -      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
>> -
>> -  ranges: true
>> -
>> -  interconnects:
>> -    items:
>> -      - description: Interconnect path specifying the port ids for data bus
>> -
>> -  interconnect-names:
>> -    const: mdp0-mem
>> +  power-domains:
>> +    maxItems: 1
>>   
>> -  resets:
>> -    items:
>> -      - description: MDSS_CORE reset
>> +  operating-points-v2: true
>>   
>> -patternProperties:
>> -  "^display-controller@[0-9a-f]+$":
>> -    type: object
>> -    description: Node containing the properties of DPU.
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +    description: |
>> +      Contains the list of output ports from DPU device. These ports
>> +      connect to interfaces that are external to the DPU hardware,
>> +      such as DSI, DP etc. Each output port contains an endpoint that
>> +      describes how it is connected to an external interface.
>>   
>>       properties:
>> -      compatible:
>> -        items:
>> -          - const: qcom,sc7180-dpu
>> -
>> -      reg:
>> -        items:
>> -          - description: Address offset and size for mdp register set
>> -          - description: Address offset and size for vbif register set
>> -
>> -      reg-names:
>> -        items:
>> -          - const: mdp
>> -          - const: vbif
>> -
>> -      clocks:
>> -        items:
>> -          - description: Display hf axi clock
>> -          - description: Display ahb clock
>> -          - description: Display rotator clock
>> -          - description: Display lut clock
>> -          - description: Display core clock
>> -          - description: Display vsync clock
>> -
>> -      clock-names:
>> -        items:
>> -          - const: bus
>> -          - const: iface
>> -          - const: rot
>> -          - const: lut
>> -          - const: core
>> -          - const: vsync
>> -
>> -      interrupts:
>> -        maxItems: 1
>> -
>> -      power-domains:
>> -        maxItems: 1
>> -
>> -      operating-points-v2: true
>> -
>> -      ports:
>> -        $ref: /schemas/graph.yaml#/properties/ports
>> -        description: |
>> -          Contains the list of output ports from DPU device. These ports
>> -          connect to interfaces that are external to the DPU hardware,
>> -          such as DSI, DP etc. Each output port contains an endpoint that
>> -          describes how it is connected to an external interface.
>> -
>> -        properties:
>> -          port@0:
>> -            $ref: /schemas/graph.yaml#/properties/port
>> -            description: DPU_INTF1 (DSI1)
>> -
>> -          port@2:
>> -            $ref: /schemas/graph.yaml#/properties/port
>> -            description: DPU_INTF0 (DP)
>> -
>> -        required:
>> -          - port@0
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: DPU_INTF1 (DSI1)
>> +
>> +      port@2:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: DPU_INTF0 (DP)
>>   
>>       required:
>> -      - compatible
>> -      - reg
>> -      - reg-names
>> -      - clocks
>> -      - interrupts
>> -      - power-domains
>> -      - operating-points-v2
>> -      - ports
>> +      - port@0
>>   
>>   required:
>>     - compatible
>>     - reg
>>     - reg-names
>> -  - power-domains
>>     - clocks
>>     - interrupts
>> -  - interrupt-controller
>> -  - iommus
>> -  - ranges
>> +  - power-domains
>> +  - operating-points-v2
>> +  - ports
>>   
>>   additionalProperties: false
>>   
>> diff --git a/Documentation/devicetree/bindings/display/msm/mdss.yaml b/Documentation/devicetree/bindings/display/msm/mdss.yaml
>> index 7d4ab3d71d2d..98f1f2501291 100644
>> --- a/Documentation/devicetree/bindings/display/msm/mdss.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
>> @@ -17,6 +17,7 @@ description:
>>   properties:
>>     compatible:
>>       enum:
>> +      - qcom,sc7180-mdss
>>         - qcom,sdm845-mdss
>>         - qcom,mdss
>>   
>> @@ -64,20 +65,21 @@ properties:
>>         - description: MDSS_CORE reset
>>   
>>     interconnects:
>> -    minItems: 2
>> +    minItems: 1
>>       items:
>>         - description: MDP port 0
>>         - description: MDP port 1
>>         - description: Rotator
>>   
>>     interconnect-names:
>> -    minItems: 2
>> +    minItems: 1
>>       items:
>>         - const: mdp0-mem
>>         - const: mdp1-mem
>>         - const: rotator-mem
>>   
>>     iommus:
>> +    minItems: 1
>>       items:
>>         - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
>>         - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
>> @@ -129,9 +131,11 @@ allOf:
>>               - const: mdss
>>   
>>           interconnects:
>> +          minItems: 1
>>             maxItems: 2
>>   
>>           interconnect-names:
>> +          minItems: 1
>>             maxItems: 2
>>   
>>         required:
>> @@ -157,6 +161,29 @@ allOf:
>>           iommus:
>>             minItems: 2
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,sc7180-mdss
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: Display AHB clock from gcc
>> +            - description: Display AHB clock from dispcc
>> +            - description: Display core clock
>> +
>> +        clock-names:
>> +          items:
>> +            - const: iface
>> +            - const: ahb
>> +            - const: core
>> +
>> +        iommus:
>> +          maxItems: 1
>> +
>>   required:
>>     - compatible
>>     - reg
>> @@ -177,7 +204,19 @@ patternProperties:
>>       # TODO: add reference once the mdp5 is converted
>>   
>>     "^display-controller@(0|[1-9a-f][0-9a-f]*)$":
>> -    $ref: dpu-sdm845.yaml
>> +    oneOf:
>> +      - $ref: dpu-sc7180.yaml
>> +      - $ref: dpu-sdm845.yaml
> 
> I don't think this is good approach. These are strictly tied, so you
> should have rather per SoC MDSS schema pulling in:
> 1. common MDSS
> 2. specific children schemas
> 
> This makes it quite obvious and specific. Your setup now allows putting
> sc7180-dpu under sdm845-dpu.

Then we should probably also use very specific $ref and compat check for 
all other entries in this file too. I understand your concern, however 
I'd prefer to have the working schema which is not tight enough compared 
to set of schema files that completely do not work. And current 
dpu-*yaml do not work as they allow just the display-controller beneath 
the mdss node.

If you absolutely insist on me making the binding tight enough, I'll 
rework the bindings to clearly specify which SoC has which nodes.

> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

