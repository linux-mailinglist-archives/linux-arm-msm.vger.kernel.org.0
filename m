Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE0765B2797
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 22:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbiIHUUc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 16:20:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbiIHUU3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 16:20:29 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00E84E9020
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 13:20:27 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id v6so7921321ljj.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 13:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=VOKz9BVOP52xmOqTjYmKPQXcHKZS+E6Y9TgNulPT/gM=;
        b=dF32T47D/EQb9uPV9n6kVZZbiCtMoL5GjDC4B07uzLnyHxk00pBzHsIhaOQUJoHVms
         IDx/trVvGUbvMk85ipFRSXLlm3ow62yozPE6oDBKw/8BK6Bch4HJn8s1P4WA9GOoCOa3
         /dZ7sFLZ584tEJqMf00Tsv1ALYuaAyg8YPMaAWz3HL5+fv+SXAljFe6kISBpSe6+w77X
         /n0jac6i91oNDPWQb8clOCfqnHPgIWa7IYi7pJKFIDHAE9uJ81PzPo7iVbpcU+ABSSwV
         y5LqfleZ0GVq7rsAyxLudSOvLQBLxyauBZnfWi28ieKNsjWNxj8eGj34u8fGrU1cBvh3
         ZAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=VOKz9BVOP52xmOqTjYmKPQXcHKZS+E6Y9TgNulPT/gM=;
        b=zljSD4rHNq53pHcXHyPTYIIxcjuUN1rHffQ6iuTf7bcFG+VL0HiZ225fADccigR2U1
         xFnS2tF51/MI1on/WOwVmjbPeFUeorfTusuCtcYGsnhoh0daa/Y190tqVlpDPfur5dRW
         eaNSyQBJ9SesnU/KFyPBfFS1OxRSjMoimLkapyX+vW3wKY+UsgL40NW3b55YLVP0l/y1
         DvWrNE3tnlxVnMwiwv8fb38NxVvAz7p/1/Wyt8OHcGMRfXd0cQ/wS6h5m1BlViv3Q4CB
         XyZgwF01sF5KYNeQpOr9BV1wKEer6au7r6VZLJUAPlhpsbHeVnHDvgnKEQD6VyDsyyNa
         B1IA==
X-Gm-Message-State: ACgBeo3vIo6+yCuG2xX/PPItaAaWUr1Mz6RipmNbH2O2PDnKxCn07ru3
        7YjYHaiHGuFKKIDy9VT6sKETlw==
X-Google-Smtp-Source: AA6agR5eJ8MNh09DV1LDxQKHWQdQTxffs/1OGe7Cb2m+Ag7Yva5nNhTEaLjOwqy3kHNs7jVFhpaR0A==
X-Received: by 2002:a2e:aa13:0:b0:264:eb98:b7fd with SMTP id bf19-20020a2eaa13000000b00264eb98b7fdmr2866734ljb.26.1662668426296;
        Thu, 08 Sep 2022 13:20:26 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l10-20020a056512110a00b00497ad8e6d07sm701961lfg.222.2022.09.08.13.20.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 13:20:25 -0700 (PDT)
Message-ID: <1ebe64a3-fab9-1dd7-517a-01001a176d9f@linaro.org>
Date:   Thu, 8 Sep 2022 23:20:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v6 01/12] dt-bindings: display/msm: split qcom,mdss
 bindings
Content-Language: en-GB
To:     Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno@lists.freedesktop.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-2-dmitry.baryshkov@linaro.org>
 <3e525135-d205-eddc-ff2d-98c8321386e3@linaro.org>
 <20220908193705.GA3002673-robh@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220908193705.GA3002673-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/09/2022 22:37, Rob Herring wrote:
> On Thu, Sep 08, 2022 at 03:37:38PM +0200, Krzysztof Kozlowski wrote:
>> On 01/09/2022 12:23, Dmitry Baryshkov wrote:
>>> Split Mobile Display SubSystem (MDSS) root node bindings to the separate
>>> yaml file. Changes to the existing (txt) schema:
>>>   - Added optional "vbif_nrt_phys" region used by msm8996
>>>   - Made "bus" and "vsync" clocks optional (they are not used by some
>>>     platforms)
>>>   - Added (optional) "core" clock added recently to the mdss driver
>>>   - Added optional resets property referencing MDSS reset
>>>   - Defined child nodes pointing to corresponding reference schema.
>>>   - Dropped the "lut" clock. It was added to the schema by mistake (it is
>>>     a part of mdp4 schema, not the mdss).
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   .../devicetree/bindings/display/msm/mdp5.txt  |  30 +---
>>>   .../devicetree/bindings/display/msm/mdss.yaml | 166 ++++++++++++++++++
>>>   2 files changed, 167 insertions(+), 29 deletions(-)
>>>   create mode 100644 Documentation/devicetree/bindings/display/msm/mdss.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/mdp5.txt b/Documentation/devicetree/bindings/display/msm/mdp5.txt
>>> index 43d11279c925..65d03c58dee6 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/mdp5.txt
>>> +++ b/Documentation/devicetree/bindings/display/msm/mdp5.txt
>>> @@ -2,37 +2,9 @@ Qualcomm adreno/snapdragon MDP5 display controller
>>>   
>>>   Description:
>>>   
>>> -This is the bindings documentation for the Mobile Display Subsytem(MDSS) that
>>> -encapsulates sub-blocks like MDP5, DSI, HDMI, eDP etc, and the MDP5 display
>>> +This is the bindings documentation for the MDP5 display
>>>   controller found in SoCs like MSM8974, APQ8084, MSM8916, MSM8994 and MSM8996.
>>>   
>>> -MDSS:
>>> -Required properties:
>>> -- compatible:
>>> -  * "qcom,mdss" - MDSS
>>> -- reg: Physical base address and length of the controller's registers.
>>> -- reg-names: The names of register regions. The following regions are required:
>>> -  * "mdss_phys"
>>> -  * "vbif_phys"
>>> -- interrupts: The interrupt signal from MDSS.
>>> -- interrupt-controller: identifies the node as an interrupt controller.
>>> -- #interrupt-cells: specifies the number of cells needed to encode an interrupt
>>> -  source, should be 1.
>>> -- power-domains: a power domain consumer specifier according to
>>> -  Documentation/devicetree/bindings/power/power_domain.txt
>>> -- clocks: device clocks. See ../clocks/clock-bindings.txt for details.
>>> -- clock-names: the following clocks are required.
>>> -  * "iface"
>>> -  * "bus"
>>> -  * "vsync"
>>> -- #address-cells: number of address cells for the MDSS children. Should be 1.
>>> -- #size-cells: Should be 1.
>>> -- ranges: parent bus address space is the same as the child bus address space.
>>> -
>>> -Optional properties:
>>> -- clock-names: the following clocks are optional:
>>> -  * "lut"
>>> -
>>>   MDP5:
>>>   Required properties:
>>>   - compatible:
>>> diff --git a/Documentation/devicetree/bindings/display/msm/mdss.yaml b/Documentation/devicetree/bindings/display/msm/mdss.yaml
>>> new file mode 100644
>>> index 000000000000..8860fc55cca5
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
>>> @@ -0,0 +1,166 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/display/msm/mdss.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm Mobile Display SubSystem (MDSS)
>>> +
>>> +maintainers:
>>> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> +  - Rob Clark <robdclark@gmail.com>
>>> +
>>> +description:
>>> +  This is the bindings documentation for the Mobile Display Subsytem(MDSS) that
>>> +  encapsulates sub-blocks like MDP5, DSI, HDMI, eDP, etc.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - qcom,mdss
>>> +
>>> +  reg:
>>> +    minItems: 2
>>> +    maxItems: 3
>>> +
>>> +  reg-names:
>>> +    minItems: 2
>>> +    items:
>>> +      - const: mdss_phys
>>> +      - const: vbif_phys
>>> +      - const: vbif_nrt_phys
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  interrupt-controller:
>>> +    true
>>
>> If there is going to be v7 - please make it one line.
>>
>>> +
>>> +  "#interrupt-cells":
>>> +    const: 1
>>> +
>>> +  power-domains:
>>> +    maxItems: 1
>>> +    description: |
>>> +      The MDSS power domain provided by GCC
>>> +
>>> +  clocks:
>>> +    minItems: 1
>>> +    items:
>>> +      - description: Display abh clock
>>> +      - description: Display axi clock
>>> +      - description: Display vsync clock
>>> +
>>> +  clock-names:
>>> +    minItems: 1
>>> +    items:
>>> +      - const: iface
>>> +      - const: bus
>>> +      - const: vsync
>>> +
>>> +  "#address-cells":
>>> +    const: 1
>>> +
>>> +  "#size-cells":
>>> +    const: 1
>>> +
>>> +  ranges:
>>> +    true
>>
>> Ditto.
>>
>>> +
>>> +  resets:
>>> +    items:
>>> +      - description: MDSS_CORE reset
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - reg-names
>>> +  - interrupts
>>> +  - interrupt-controller
>>> +  - "#interrupt-cells"
>>> +  - power-domains
>>> +  - clocks
>>> +  - clock-names
>>> +  - "#address-cells"
>>> +  - "#size-cells"
>>> +  - ranges
>>> +
>>> +patternProperties:
>>> +  "^mdp@[1-9a-f][0-9a-f]*$":
>>> +    type: object
>>> +    properties:
>>> +      compatible:
>>> +        const: qcom,mdp5
>>> +
>>> +  "^dsi@[1-9a-f][0-9a-f]*$":
>>> +    type: object
>>> +    properties:
>>> +      compatible:
>>> +        const: qcom,mdss-dsi-ctrl
>>
>> This should be ref to dsi-controller-main.yaml... or based on previous
>> Rob's feedback you dropped it everywhere in children?
> 
> I don't think I said. I thought about it some, as yes, we normally have
> done as you suggested. The downside is with a ref we'll do the whole
> validation of the child node twice (unless the referenced schema has a
> 'select: false') whereas here only 'compatible' is validated twice. This
> way also complicates checking for unevaluatedProperties/additionalProperties.
> 
> So maybe better to keep with the 'normal' way and make this a ref.

Well.. I tried using $ref in the previous iteration, but then I faced 
the fact that I can not use it. Using the $ref the node gets validated 
even if it is disabled, and we do not want to do this. The nodes are 
usually split in way that regulators are specified in the board DT file. 
Thus disabled dsi/dsi-phy nodes do not get all the required regulators. 
And dt-validate happily dumps tons of warnings for disabled nodes. Thus 
I ended up with the compatible rather than $ref.


-- 
With best wishes
Dmitry

