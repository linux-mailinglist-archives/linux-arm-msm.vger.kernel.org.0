Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB6556749B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 18:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232704AbiGEQl1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 12:41:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232828AbiGEQl0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 12:41:26 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09DA41E3E4
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 09:41:23 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id t25so21518647lfg.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 09:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=cb1zVW7MJ8nPyb+XZ8oTES6JA9pHaMCQn96HEX72sCk=;
        b=cANpEWMPYCbmzaBF1trYPgU20t847toX0YHBggVzwKlNKlid7rLluFtZIEsEogSkYD
         RUDKfxfRZ/LrOA4fsVXCTHjqhLedAblVcSKAEPYsAYbfxAiCVbfOReuN9D/gedD3iHY3
         vC38IAJy+NJfdHwxnzCHROhfbOSnYlAiQujHhjObJXPMy2xwBoGL67W8J1yjWajk1WOM
         GRzYbt6ZcROSL4loYsIaJTa+HpN37dnmtOGIHe2YWcmlm/TeGjlWPX2Hj5rBg5MZUdm7
         Y2JlFZUW/c/DL5UPdehvYJd5lONCkmbZBaF+WLkxmvPwGtblZnT1QbkAzBYGioRFp9mc
         JYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cb1zVW7MJ8nPyb+XZ8oTES6JA9pHaMCQn96HEX72sCk=;
        b=O4axKILyCIPGNXYajbMaXnuHLEXZQ9KxKIjGSeipULVToJh3fDPutpcnl8zY7STo11
         Zg+zIkmPYCNAkuYlYHrWpz5wUFp3MXa3Gg03ViqQhFy804jr1h7ZjqiPGrda/QUwUqtb
         0HsrC4CaMPQ/3X7MeSS9ronOmlDeythypH0NOEw4OUxMFe1DpAUgXjNSqPg67P9a0AwI
         wbcASUaC8ak8LkXtUaUa0yaYJN7bHfOa5dpk1D8CFVDtour0Fc/oMmB/Uctg/uFsSIZ6
         1rDMleA+jPHtltY+7Jw9Klk6D2Zo5b4X1RmzJ7vMAi55XBqiLYgHyISGnPScR51No0FG
         GPjQ==
X-Gm-Message-State: AJIora8z5/NyZeIo5myD7s9fHahlp+ZzhhzivZndPQZo/yeMM+T5A4bu
        f1PYFgw6q4UbzKi7yR5Mz2c64w==
X-Google-Smtp-Source: AGRyM1tLBDmi6PcNTlPz7RuFucr6/VXWEHmEBqVmGLT/pCerFYJQeAONdgPgPzP4YRKQBMf/pbzrvA==
X-Received: by 2002:a05:6512:2810:b0:47f:a76c:8770 with SMTP id cf16-20020a056512281000b0047fa76c8770mr25329346lfb.116.1657039282086;
        Tue, 05 Jul 2022 09:41:22 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m4-20020a056512114400b0047f72bf3c32sm5779895lfg.77.2022.07.05.09.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 09:41:21 -0700 (PDT)
Message-ID: <ed60ecae-ac01-0355-8faa-b21cd321df6c@linaro.org>
Date:   Tue, 5 Jul 2022 19:41:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 01/11] dt-bindings: display/msm: split qcom, mdss bindings
Content-Language: en-GB
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
References: <20220625232513.522599-1-dmitry.baryshkov@linaro.org>
 <20220625232513.522599-2-dmitry.baryshkov@linaro.org>
 <20220630225259.GA3449913-robh@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220630225259.GA3449913-robh@kernel.org>
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

On 01/07/2022 01:52, Rob Herring wrote:
> On Sun, Jun 26, 2022 at 02:25:03AM +0300, Dmitry Baryshkov wrote:
>> Split Mobile Display SubSystem (MDSS) root node bindings to the separate
>> yaml file. Changes to the existing (txt) schema:
>>   - Add optional "vbif_nrt_phys" region used by msm8996
>>   - Make "bus" and "vsync" clocks optional (they are not used by some
>>     platforms)
>>   - Add (optional) "core" clock added recently to the mdss driver
>>   - Add optional resets property referencing MDSS reset
>>   - Define child nodes together with compatibles
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../devicetree/bindings/display/msm/mdp5.txt  |  30 +--
>>   .../devicetree/bindings/display/msm/mdss.yaml | 173 ++++++++++++++++++
>>   2 files changed, 174 insertions(+), 29 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/display/msm/mdss.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/mdp5.txt b/Documentation/devicetree/bindings/display/msm/mdp5.txt
>> index 43d11279c925..65d03c58dee6 100644
>> --- a/Documentation/devicetree/bindings/display/msm/mdp5.txt
>> +++ b/Documentation/devicetree/bindings/display/msm/mdp5.txt
>> @@ -2,37 +2,9 @@ Qualcomm adreno/snapdragon MDP5 display controller
>>   
>>   Description:
>>   
>> -This is the bindings documentation for the Mobile Display Subsytem(MDSS) that
>> -encapsulates sub-blocks like MDP5, DSI, HDMI, eDP etc, and the MDP5 display
>> +This is the bindings documentation for the MDP5 display
>>   controller found in SoCs like MSM8974, APQ8084, MSM8916, MSM8994 and MSM8996.
>>   
>> -MDSS:
>> -Required properties:
>> -- compatible:
>> -  * "qcom,mdss" - MDSS
>> -- reg: Physical base address and length of the controller's registers.
>> -- reg-names: The names of register regions. The following regions are required:
>> -  * "mdss_phys"
>> -  * "vbif_phys"
>> -- interrupts: The interrupt signal from MDSS.
>> -- interrupt-controller: identifies the node as an interrupt controller.
>> -- #interrupt-cells: specifies the number of cells needed to encode an interrupt
>> -  source, should be 1.
>> -- power-domains: a power domain consumer specifier according to
>> -  Documentation/devicetree/bindings/power/power_domain.txt
>> -- clocks: device clocks. See ../clocks/clock-bindings.txt for details.
>> -- clock-names: the following clocks are required.
>> -  * "iface"
>> -  * "bus"
>> -  * "vsync"
>> -- #address-cells: number of address cells for the MDSS children. Should be 1.
>> -- #size-cells: Should be 1.
>> -- ranges: parent bus address space is the same as the child bus address space.
>> -
>> -Optional properties:
>> -- clock-names: the following clocks are optional:
>> -  * "lut"
> 
> What happened to lut?

It was put there by mistake. The "lut" belongs to mdp4 device node. I 
will update the commit message.

> 
>> -
>>   MDP5:
>>   Required properties:
>>   - compatible:
>> diff --git a/Documentation/devicetree/bindings/display/msm/mdss.yaml b/Documentation/devicetree/bindings/display/msm/mdss.yaml
>> new file mode 100644
>> index 000000000000..55c70922361d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
>> @@ -0,0 +1,173 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/mdss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Mobile Display SubSystem (MDSS) dt properties
> 
> s/dt properties//
> 
>> +
>> +maintainers:
>> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> +  - Rob Clark <robdclark@gmail.com>
>> +
>> +description: |
> 
> Don't need '|'.
> 
>> +  This is the bindings documentation for the Mobile Display Subsytem(MDSS) that
>> +  encapsulates sub-blocks like MDP5, DSI, HDMI, eDP, etc.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,mdss
>> +
>> +  reg:
>> +    minItems: 2
>> +    maxItems: 3
>> +
>> +  reg-names:
>> +    minItems: 2
>> +    items:
>> +      - const: mdss_phys
>> +      - const: vbif_phys
>> +      - const: vbif_nrt_phys
> 
> Let's not continue with the _phys silliness.

But they are used by existing schema files. Should I define these ones 
as deprecated and provide compatibility for both of them?

> 
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  interrupt-controller:
>> +    true
>> +
>> +  "#interrupt-cells":
>> +    const: 1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +    description: |
>> +      The MDSS power domain provided by GCC
>> +
>> +  clocks:
>> +    minItems: 1
>> +    maxItems: 4
>> +
>> +  clock-names:
>> +    minItems: 1
>> +    items:
>> +      - const: iface
>> +      - const: bus
>> +      - const: vsync
>> +      - const: core
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 1
>> +
>> +  ranges:
>> +    true
>> +
>> +  resets:
>> +    items:
>> +      - description: MDSS_CORE reset
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - interrupts
>> +  - interrupt-controller
>> +  - "#interrupt-cells"
>> +  - power-domains
>> +  - clocks
>> +  - clock-names
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - ranges
>> +
>> +patternProperties:
>> +  "^mdp@(0|[1-9a-f][0-9a-f]*)$":
>> +    type: object
>> +    properties:
>> +      compatible:
>> +        enum:
>> +          - qcom,mdp5
> 
> These child nodes need to reference child schemas or be complete. If
> they aren't converted, then just 'type: object' and be done with it.

Ack.

> 
>> +
>> +  "^dsi@(0|[1-9a-f][0-9a-f]*)$":
>> +    type: object
>> +    properties:
>> +      compatible:
>> +        enum:
>> +          - qcom,mdss-dsi-ctrl
>> +
[....]

-- 
With best wishes
Dmitry
