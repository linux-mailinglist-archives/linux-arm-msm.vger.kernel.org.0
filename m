Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6627C4CAB57
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Mar 2022 18:16:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243710AbiCBRQl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Mar 2022 12:16:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237817AbiCBRQk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Mar 2022 12:16:40 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87B3B5BE60
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Mar 2022 09:15:56 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D57E53F4C2
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Mar 2022 17:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646241354;
        bh=EKSGShIhKvoK9zwcFMq838fSSTiayEwZ3ipXrxgEB/Q=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=a5vHBirBx9hVnDJ4xjV4eT4tQoiLx6Q08etxUyUx3fWjZKmjVnrgC/vDnZM4XB7Gl
         YaluIGC7+kAdsHdE2c+yRxusteW8yBYIKXMFZ6Akeik8J47b0wqJD8gt90cpf/PoEU
         /r4Dn405HjWZmcu4P5JiO+6fn7QGOhVvh7328J72DLM8x6OP5fQ+xB+Yp1FNujtYBk
         mtYP5Bji+GZXP7jWfJR4+UJIuGcp3iF3N9BLOOeZxUI4EZNqfLo6SwkYPEH61aIl9p
         +jdOcX14vM2gJxLBmGxrgc8tXjba2g30CZD7E8Mnbno5zOLwDuiOSSyvvGZ6lLaR3j
         PB4y8gx+BdiVA==
Received: by mail-ed1-f71.google.com with SMTP id o20-20020aa7dd54000000b00413bc19ad08so1376855edw.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Mar 2022 09:15:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EKSGShIhKvoK9zwcFMq838fSSTiayEwZ3ipXrxgEB/Q=;
        b=dUvfL7+9riBiUZjAIhEgguC9UbFECI7Oy8uRJfs9PQhPXJ1El+LL3dKyXORtmMrV7L
         /wXdeTw73QuYQFzuGVFqSvCp7d09kjYfeZcLTQJiUviX+9Z2+27AC9cpgalTyctdDScr
         m20FQqVCcwykpEzIumYsUzCD/KPeK/3BuAYmbcwrDon0Kc/YQ54lV7z5p1l1qyAO4b49
         jizpnLkK5px+ud75MNcz75NgDIBeVWtG3NC9hBplZ/gnBy2PdHdY23/KA4RxngaFPH1U
         f3/TPuRwkLYMf+wgqHJ90RtlskAmSyRmBt09WoIZVWTD+AOjL2Mo8Auege+/3RqKngUv
         Y20A==
X-Gm-Message-State: AOAM530NZMOVeMP906BNylKx3fLJR/be9qWC0gypa+z7U+VoDyoPz9sW
        t5rv+RnJPh0BRN1ke63pGQtDsnj0sFlF8vLEoAYg3gnwqjnR857W7qu0au3fgsFxHFpwAoebsy7
        Km4xXzDbOJXQC/dlVKXKLbFxQDrK3Jwsf6CijOxHJNqI=
X-Received: by 2002:a05:6402:4409:b0:412:aac5:4e48 with SMTP id y9-20020a056402440900b00412aac54e48mr30144296eda.75.1646241354539;
        Wed, 02 Mar 2022 09:15:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyshWOBq1tAX3kqXMid9eJHgfLGLM4EqtCg2H9ww9e3j6/bhPCgqw6Uo5bi9vMfnFz7flevSQ==
X-Received: by 2002:a05:6402:4409:b0:412:aac5:4e48 with SMTP id y9-20020a056402440900b00412aac54e48mr30144280eda.75.1646241354329;
        Wed, 02 Mar 2022 09:15:54 -0800 (PST)
Received: from [192.168.0.137] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id d23-20020a1709067a1700b006d0ebe4af89sm6523442ejo.20.2022.03.02.09.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Mar 2022 09:15:53 -0800 (PST)
Message-ID: <762e2778-99e9-f458-167d-909550db2f3c@canonical.com>
Date:   Wed, 2 Mar 2022 18:15:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: add QCOM SM6125 display clock
 bindings
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220226200911.230030-1-marijn.suijten@somainline.org>
 <20220226200911.230030-3-marijn.suijten@somainline.org>
 <ea5d34c6-fe75-c096-d5b2-6a327c9d0ae5@canonical.com>
 <62ebb074-b8de-0dc3-2bbc-e43dca9d2ced@linaro.org>
 <05310308-b0ff-56a0-83ac-855b1b795936@canonical.com>
 <20220302125417.iu52rvdxrmo25wwt@SoMainline.org>
 <2b1f7c07-3cc9-9637-4621-3c5e0e09a65e@canonical.com>
 <Yh+D1cHuRNQqnHf+@ripper>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <Yh+D1cHuRNQqnHf+@ripper>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/03/2022 15:48, Bjorn Andersson wrote:
> On Wed 02 Mar 05:51 PST 2022, Krzysztof Kozlowski wrote:
> 
>> On 02/03/2022 13:54, Marijn Suijten wrote:
>>> On 2022-02-28 10:23:19, Krzysztof Kozlowski wrote:
>>>> On 27/02/2022 22:43, Dmitry Baryshkov wrote:
>>>>> On 27/02/2022 13:03, Krzysztof Kozlowski wrote:
>>>>>> On 26/02/2022 21:09, Marijn Suijten wrote:
>>>>>>> From: Martin Botka <martin.botka@somainline.org>
>>>>>>>
>>>>>>> Add device tree bindings for display clock controller for
>>>>>>> Qualcomm Technology Inc's SM6125 SoC.
>>>>>>>
>>>>>>> Signed-off-by: Martin Botka <martin.botka@somainline.org>
>>>>>>> ---
>>>>>>>   .../bindings/clock/qcom,dispcc-sm6125.yaml    | 87 +++++++++++++++++++
>>>>>>>   .../dt-bindings/clock/qcom,dispcc-sm6125.h    | 41 +++++++++
>>>>>>>   2 files changed, 128 insertions(+)
>>>>>>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
>>>>>>>   create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm6125.h
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..3465042d0d9f
>>>>>>> --- /dev/null
>>>>>>> +++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
>>>>>>> @@ -0,0 +1,87 @@
>>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>>>> +%YAML 1.2
>>>>>>> +---
>>>>>>> +$id: http://devicetree.org/schemas/clock/qcom,dispcc-sm6125.yaml#
>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>> +
>>>>>>> +title: Qualcomm Display Clock Controller Binding for SM6125
>>>>>>> +
>>>>>>> +maintainers:
>>>>>>> +  - Martin Botka <martin.botka@somainline.org>
>>>>>>> +
>>>>>>> +description: |
>>>>>>> +  Qualcomm display clock control module which supports the clocks and
>>>>>>> +  power domains on SM6125.
>>>>>>> +
>>>>>>> +  See also:
>>>>>>> +    dt-bindings/clock/qcom,dispcc-sm6125.h
>>>>>>> +
>>>>>>> +properties:
>>>>>>> +  compatible:
>>>>>>> +    enum:
>>>>>>> +      - qcom,sm6125-dispcc
>>>>>>> +
>>>>>>> +  clocks:
>>>>>>> +    items:
>>>>>>> +      - description: Board XO source
>>>>>>> +      - description: Byte clock from DSI PHY0
>>>>>>> +      - description: Pixel clock from DSI PHY0
>>>>>>> +      - description: Pixel clock from DSI PHY1
>>>>>>> +      - description: Link clock from DP PHY
>>>>>>> +      - description: VCO DIV clock from DP PHY
>>>>>>> +      - description: AHB config clock from GCC
>>>>>>> +
>>>>>>> +  clock-names:
>>>>>>> +    items:
>>>>>>> +      - const: bi_tcxo
>>>>>>> +      - const: dsi0_phy_pll_out_byteclk
>>>>>>> +      - const: dsi0_phy_pll_out_dsiclk
>>>>>>> +      - const: dsi1_phy_pll_out_dsiclk
>>>>>>> +      - const: dp_phy_pll_link_clk
>>>>>>> +      - const: dp_phy_pll_vco_div_clk
>>>>>>> +      - const: cfg_ahb_clk
>>>>>>> +
>>>>>>> +  '#clock-cells':
>>>>>>> +    const: 1
>>>>>>> +
>>>>>>> +  '#power-domain-cells':
>>>>>>> +    const: 1
>>>>>>> +
>>>>>>> +  reg:
>>>>>>> +    maxItems: 1
>>>>>>> +
>>>>>>> +required:
>>>>>>> +  - compatible
>>>>>>> +  - reg
>>>>>>> +  - clocks
>>>>>>> +  - clock-names
>>>>>>> +  - '#clock-cells'
>>>>>>> +  - '#power-domain-cells'
>>>>>>> +
>>>>>>> +additionalProperties: false
>>>>>>> +
>>>>>>> +examples:
>>>>>>> +  - |
>>>>>>> +    #include <dt-bindings/clock/qcom,rpmcc.h>
>>>>>>> +    #include <dt-bindings/clock/qcom,gcc-sm6125.h>
>>>>>>> +    clock-controller@5f00000 {
>>>>>>> +      compatible = "qcom,sm6125-dispcc";
>>>>>>> +      reg = <0x5f00000 0x20000>;
>>>>>>> +      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
>>>>>>> +               <&dsi0_phy 0>,
>>>>>>> +               <&dsi0_phy 1>,
>>>>>>> +               <0>,
>>>>>>
>>>>>> This does not look like a valid phandle. This clock is required, isn't it?
>>>
>>> I remember it being used like this before, though upon closer inspection
>>> only qcom,gcc-msm8998.yaml uses it as example.
>>>
>>> The clock should be optional, in that case it is perhaps desired to omit
>>> it from clock-names instead, or pretend there's a `dsi1_phy 1`?
>>
>> I propose to omit it.
>>
> 
> The wire is there, it's only optional because we don't have the other
> side represented in DT yet.
> 
> I believe we started filling out 0s like this because omitting elements
> that are not yet possible to fill out means that the order will change
> as we add more functions, something Rob has objected to. Further more as
> we add more functions the existing dts will fail validation, even though
> the hardware hasn't changed.
> 
> 
> That said, even though we don't have the other piece on this particular
> platform we do know where this signal comes from. So we should be able
> to have a valid (or at least strongly plausible) example in the binding
> - and then fill out the dts with 0s to keep validation happy until the
> other pieces are filled out.

So based on this, this clock is not actually optional and the bindings
should stay like this. The example should be more-or-less complete, so
there is not much sense to have there clock "0". DTS is of course different.

BR,
Krzysztof
