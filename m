Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E60C4C5A65
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Feb 2022 11:04:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbiB0KEf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Feb 2022 05:04:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbiB0KEd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Feb 2022 05:04:33 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 668FD5C644
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Feb 2022 02:03:57 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 52A4B3FCAC
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Feb 2022 10:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645956235;
        bh=IfVXPHlKvsF/IugNOxJ2nfDin24YI7mhh0WDRsHK5Xo=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=P/mAev3ks6m/REqgAqjHXLVl9KPAHGZ/Ncc2NMJUUfNrHvhPodopMyItXyCVR180W
         RaROqczYBdlKDPapvQL+s5nO/FXH/omMkqLBvDXnFURGRraBCv65VYYIySPd5EUJXr
         9E2xNPoWZCEnZkFkWlCgPqDk81sEcTU74++b+0kAIw3WQ36k910aLmrQ/bc4BnwoGK
         mNjn79OR/LX4TRMXYtbnZiYUvp1Q3xtJVru0dBrWGm3YPOurcud1eFdn2BRDa2xAOE
         IJmgEHPPSJUbD5c46bFl90Y1FZS0e8vQgoYmLV8/CkOe/F+M7M/afvvfhEo7XmRXXL
         Fzzf408yO0ebg==
Received: by mail-ed1-f71.google.com with SMTP id e10-20020a056402190a00b00410f20467abso4037648edz.14
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Feb 2022 02:03:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IfVXPHlKvsF/IugNOxJ2nfDin24YI7mhh0WDRsHK5Xo=;
        b=n2nTQrz2kGmoNa5hsrT4DXBaqgJIXLVqrHo5gqI1qhVM1xvDwCqQnWt90cY+sOOo7N
         4aG9uk0L0KeZFDhO6c7Am8norXjf7nTnfx1VaRxEpc8RsWZRsjIDtc+tKxJWICOZe2ia
         BZKZFRUEoucpoA5Vaz60TNsxT5tfTOqnkrAIY/5CeNzBRX+6dmfcvmZ7BZpdiuenNSVJ
         JhPwlqL7rYK0hKrbCCYrfONr26JFTDZlWOZgruwoz9Zi1eURSQLlbWdFuCuacGw6GXnf
         04aKBoI8mRj6UXrH4LLQokRf0hD1+0lTiCmcNY3YsT9TtzAlmI19lh2hWJW/tGWWQn0/
         ZtVg==
X-Gm-Message-State: AOAM533q97jzy9oxnrJIF2Cq2TXXZCm1jPzHq+cGR02Y/UoL7lWBv9pu
        f/FGm7oaVEokNQ0k/kyCYan3U2ypOqWEOL1szOHi8/8x9kJeuV8Ar2qSDMQ+8lZTNZHxwI8TPdh
        U/361BPwrevvPUIYu58pnc+2B3jkHS+FlIZuHblwVFCI=
X-Received: by 2002:a17:906:6d09:b0:6b9:2e0e:5bdd with SMTP id m9-20020a1709066d0900b006b92e0e5bddmr11270623ejr.246.1645956234705;
        Sun, 27 Feb 2022 02:03:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPviELBAb3YlJF3dqApYWhzkERExWKru4Uij+RIvAJZ8xES86UbS47+QTJNfsojvKwn0q7ag==
X-Received: by 2002:a17:906:6d09:b0:6b9:2e0e:5bdd with SMTP id m9-20020a1709066d0900b006b92e0e5bddmr11270607ejr.246.1645956234415;
        Sun, 27 Feb 2022 02:03:54 -0800 (PST)
Received: from [192.168.0.133] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id ee21-20020a056402291500b00410d4261313sm4211234edb.24.2022.02.27.02.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Feb 2022 02:03:53 -0800 (PST)
Message-ID: <ea5d34c6-fe75-c096-d5b2-6a327c9d0ae5@canonical.com>
Date:   Sun, 27 Feb 2022 11:03:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: add QCOM SM6125 display clock
 bindings
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220226200911.230030-3-marijn.suijten@somainline.org>
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

On 26/02/2022 21:09, Marijn Suijten wrote:
> From: Martin Botka <martin.botka@somainline.org>
> 
> Add device tree bindings for display clock controller for
> Qualcomm Technology Inc's SM6125 SoC.
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---
>  .../bindings/clock/qcom,dispcc-sm6125.yaml    | 87 +++++++++++++++++++
>  .../dt-bindings/clock/qcom,dispcc-sm6125.h    | 41 +++++++++
>  2 files changed, 128 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm6125.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
> new file mode 100644
> index 000000000000..3465042d0d9f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,dispcc-sm6125.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display Clock Controller Binding for SM6125
> +
> +maintainers:
> +  - Martin Botka <martin.botka@somainline.org>
> +
> +description: |
> +  Qualcomm display clock control module which supports the clocks and
> +  power domains on SM6125.
> +
> +  See also:
> +    dt-bindings/clock/qcom,dispcc-sm6125.h
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sm6125-dispcc
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: Byte clock from DSI PHY0
> +      - description: Pixel clock from DSI PHY0
> +      - description: Pixel clock from DSI PHY1
> +      - description: Link clock from DP PHY
> +      - description: VCO DIV clock from DP PHY
> +      - description: AHB config clock from GCC
> +
> +  clock-names:
> +    items:
> +      - const: bi_tcxo
> +      - const: dsi0_phy_pll_out_byteclk
> +      - const: dsi0_phy_pll_out_dsiclk
> +      - const: dsi1_phy_pll_out_dsiclk
> +      - const: dp_phy_pll_link_clk
> +      - const: dp_phy_pll_vco_div_clk
> +      - const: cfg_ahb_clk
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +  - '#power-domain-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmcc.h>
> +    #include <dt-bindings/clock/qcom,gcc-sm6125.h>
> +    clock-controller@5f00000 {
> +      compatible = "qcom,sm6125-dispcc";
> +      reg = <0x5f00000 0x20000>;
> +      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +               <&dsi0_phy 0>,
> +               <&dsi0_phy 1>,
> +               <0>,

This does not look like a valid phandle. This clock is required, isn't it?


Best regards,
Krzysztof
