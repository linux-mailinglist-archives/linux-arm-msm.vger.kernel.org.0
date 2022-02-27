Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE4294C5F23
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Feb 2022 22:43:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231728AbiB0VoG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Feb 2022 16:44:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231714AbiB0VoE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Feb 2022 16:44:04 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC313191F
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Feb 2022 13:43:26 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id j15so18197634lfe.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Feb 2022 13:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=T1vSvmNg6Xz8pPNgIHTjo8uuE4HsvwCe3dsH/3t/F18=;
        b=YrS8I+x3EB1al65yr/YylJ0lknWBnEEo1dNTBC4Zy3sii79LWKqHj43q6FASmOuCJV
         ZSJ+GHg3V9qKg1JEjfikbvrOmpEhZAdeJDNGEyyLelH4fmYe1Yyyr2959arXKCGxd68v
         +4xootihHRmE3aza0EHuT3d9mMfi9zhh6wSgraKCCza77aCeG6h1tJc2uy9akqOmkGtt
         UFc2N3qP3hhXZ8U1YejNDQX07vZ3Aso2Lx96VxwapuuRt/EYOwwukEQJM4aXyr8Nz2MW
         Un7SdwJBJJchnvz6cbL29jB+CRQpXXqpeT5Suuyocr1sBJTD3qkbcRT8LLWQCVgbWMIk
         pf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=T1vSvmNg6Xz8pPNgIHTjo8uuE4HsvwCe3dsH/3t/F18=;
        b=aOdSTcuAxXMc6j6vuUQ0ZAq9dJFERwwzcrpkIZNF0I1UxWsEIdedEAClDO6g/+CJaY
         RZeMlPnnkaZhpTW66rXKJRTirHBcDqdo0B9Zr5S8XNCzkh0CeWD6PU7hQ3oFSGpjU1SG
         a3SH1Z4pdU5duZPEZF3bDhGyeSAo5Nua7A1HcxkxSaUu5wAMbHqe04Rl0HgIkjSTm/AE
         fiKGxJRvjQxQYLYPe0uwhSuHcsXfZgJuZyLXleDezBgZ3rHCmfGFwtQwv4lPKy3kcR7p
         CV5+eUEKWDefkL2p+wFGbVIFuKtDKhqXclJRQu7mWgzd90ZsrZS/drjR0OK3l/AvU4O0
         4Emw==
X-Gm-Message-State: AOAM533UjgBIA+wN3vheBF3RFPz2ItxtKKnMfnkHQslk7YWgxwhuBDFO
        EjY6lrBlOiCMLK9ls8Xw5gSOuA==
X-Google-Smtp-Source: ABdhPJxmS5muCyiKPYrs1CKo4idnR6DRkHB8f2wt5pbSkKyhvqd/kQ3NiPj/ol1DnnNz00q0NwBIXA==
X-Received: by 2002:a05:6512:208d:b0:443:1833:7473 with SMTP id t13-20020a056512208d00b0044318337473mr10681503lfr.651.1645998204627;
        Sun, 27 Feb 2022 13:43:24 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e10-20020ac24e0a000000b00443145afc25sm740873lfr.126.2022.02.27.13.43.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Feb 2022 13:43:24 -0800 (PST)
Message-ID: <62ebb074-b8de-0dc3-2bbc-e43dca9d2ced@linaro.org>
Date:   Mon, 28 Feb 2022 00:43:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: add QCOM SM6125 display clock
 bindings
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220226200911.230030-1-marijn.suijten@somainline.org>
 <20220226200911.230030-3-marijn.suijten@somainline.org>
 <ea5d34c6-fe75-c096-d5b2-6a327c9d0ae5@canonical.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ea5d34c6-fe75-c096-d5b2-6a327c9d0ae5@canonical.com>
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

On 27/02/2022 13:03, Krzysztof Kozlowski wrote:
> On 26/02/2022 21:09, Marijn Suijten wrote:
>> From: Martin Botka <martin.botka@somainline.org>
>>
>> Add device tree bindings for display clock controller for
>> Qualcomm Technology Inc's SM6125 SoC.
>>
>> Signed-off-by: Martin Botka <martin.botka@somainline.org>
>> ---
>>   .../bindings/clock/qcom,dispcc-sm6125.yaml    | 87 +++++++++++++++++++
>>   .../dt-bindings/clock/qcom,dispcc-sm6125.h    | 41 +++++++++
>>   2 files changed, 128 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
>>   create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm6125.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
>> new file mode 100644
>> index 000000000000..3465042d0d9f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
>> @@ -0,0 +1,87 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,dispcc-sm6125.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Display Clock Controller Binding for SM6125
>> +
>> +maintainers:
>> +  - Martin Botka <martin.botka@somainline.org>
>> +
>> +description: |
>> +  Qualcomm display clock control module which supports the clocks and
>> +  power domains on SM6125.
>> +
>> +  See also:
>> +    dt-bindings/clock/qcom,dispcc-sm6125.h
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,sm6125-dispcc
>> +
>> +  clocks:
>> +    items:
>> +      - description: Board XO source
>> +      - description: Byte clock from DSI PHY0
>> +      - description: Pixel clock from DSI PHY0
>> +      - description: Pixel clock from DSI PHY1
>> +      - description: Link clock from DP PHY
>> +      - description: VCO DIV clock from DP PHY
>> +      - description: AHB config clock from GCC
>> +
>> +  clock-names:
>> +    items:
>> +      - const: bi_tcxo
>> +      - const: dsi0_phy_pll_out_byteclk
>> +      - const: dsi0_phy_pll_out_dsiclk
>> +      - const: dsi1_phy_pll_out_dsiclk
>> +      - const: dp_phy_pll_link_clk
>> +      - const: dp_phy_pll_vco_div_clk
>> +      - const: cfg_ahb_clk
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  '#power-domain-cells':
>> +    const: 1
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - '#clock-cells'
>> +  - '#power-domain-cells'
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,rpmcc.h>
>> +    #include <dt-bindings/clock/qcom,gcc-sm6125.h>
>> +    clock-controller@5f00000 {
>> +      compatible = "qcom,sm6125-dispcc";
>> +      reg = <0x5f00000 0x20000>;
>> +      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
>> +               <&dsi0_phy 0>,
>> +               <&dsi0_phy 1>,
>> +               <0>,
> 
> This does not look like a valid phandle. This clock is required, isn't it?

Not, it's not required for general dispcc support.
dispcc uses DSI and DP PHY clocks to provide respective pixel/byte/etc 
clocks. However if support for DP is not enabled, the dispcc can work 
w/o DP phy clock. Thus we typically add 0 phandles as placeholders for 
DSI/DP clock sources and populate them as support for respective 
interfaces gets implemented.

> 
> 
> Best regards,
> Krzysztof


-- 
With best wishes
Dmitry
