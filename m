Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 203BD569389
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 22:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234319AbiGFUp3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 16:45:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234325AbiGFUp1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 16:45:27 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E7C628E1D
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 13:45:25 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-f2a4c51c45so22835093fac.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 13:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YBriQrz91n0MgoyO0KTx3Kgs6h8dLEjEgXb98Yv9zJA=;
        b=yioiZGV+ZVSvNLZdS1kwOHSEiyd4A4bK8QAwtQ5ouYhdsJ0lv9f9kc6Y+ZBI5Azaem
         y7i56NAGmagDSFWbEGhE9YKwMfLLoo7diuG0tIfu4Mn/3CjHsS7LYNuU8pwkKpHYXnc+
         Xiju0RL7OxOMgxopmZppJIdqRw8IKsc7Gg6qrS0rUZi6Ln75/aiJXCIeaU6D+Jt3tzTh
         Cc/93gY0PgqOu8dUYJQT81YiNq/4QTA6oXd37vxaDlrcqOYJPRFrzjX1SnBWIQhYo4Yd
         tuSr9eS/nhyUyTgV2REY++QF3puIhF73T+mbiNCMpJZ/mffv1hvPnjjLrbB1QeaU20nS
         1J3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YBriQrz91n0MgoyO0KTx3Kgs6h8dLEjEgXb98Yv9zJA=;
        b=6QzQOqKFy0lJ4ncKeyldtsdJ0aEB1e6BMy16ExUnN5PNbrlX4whv2tNlrlssdpFetd
         2vWpJc4hfh14+Xl+tL+05I9bUyKNxaSSbHsnebl/QffRBroWnd5GappsfcMIH+PUtieQ
         FjYgwU0wxwnLXj5vN+n6ADPIXieDug1z6PEpfQTN6qHjp0MkiMbJi/l4Ej18gMI7OC04
         85edRDVQEhU/bEEEoeCEqKgnhVzUFr4VZpUAA3VhOeFP9YTyRWXk5kLdHNzB1RjTRuQ8
         vjkG9xUoSvAQ5bDUnOV8BmwTLSfqyiw9PWFznX4XHYldm2HtDmeVFQmsCy8zAsrCWqVR
         zK8g==
X-Gm-Message-State: AJIora+vsT4z51YD33Dt7DnCLzDybBMmwgKQqxq3uCkOEgaX2GG7Ezwk
        6WP0sreaVa9JNAnyJkVAYnj+PA==
X-Google-Smtp-Source: AGRyM1vaciXsz9nBjLjWuFNLPsfamx0NtDp9xdeLPh/Pz9Rv4uQ7ZzXtd2FrFkZ7utztWilG2R9i5g==
X-Received: by 2002:a05:6870:829e:b0:10c:240b:cbb9 with SMTP id q30-20020a056870829e00b0010c240bcbb9mr335659oae.115.1657140323479;
        Wed, 06 Jul 2022 13:45:23 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r187-20020a4a4ec4000000b0041ba304546csm16855885ooa.1.2022.07.06.13.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 13:45:22 -0700 (PDT)
Date:   Wed, 6 Jul 2022 15:45:21 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/4] dt-bindings: clock: qcom: add bindings for dispcc
 on SM8450
Message-ID: <YsX0YdV40Zp55wz8@builder.lan>
References: <20220623114737.247703-1-dmitry.baryshkov@linaro.org>
 <20220623114737.247703-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623114737.247703-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 23 Jun 06:47 CDT 2022, Dmitry Baryshkov wrote:

> Add device tree bindings for the display clock controller on Qualcomm
> SM8450 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,dispcc-sm8450.yaml    | 132 ++++++++++++++++++
>  1 file changed, 132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc-sm8450.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8450.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8450.yaml
> new file mode 100644
> index 000000000000..953d20a25cfb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8450.yaml
> @@ -0,0 +1,132 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8450.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display Clock & Reset Controller Binding for SM8450
> +
> +maintainers:
> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +
> +description: |
> +  Qualcomm display clock control module which supports the clocks, resets and
> +  power domains on SM8450.
> +
> +  See also:
> +    dt-bindings/clock/qcom,dispcc-sm8450.h

Please prefix this with include/

> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sm8450-dispcc
> +
> +  clocks:
> +    items:

I really think we should include a reference to GCC_DISP_AHB_CLK here.

There are two cases here, either the implementation does what we do in
Linux and just always-on the clock from gcc, in which case there's
nothing in here to ensure probe order and that the clock is actually on
before dispcc probes.

The other case would be that the implementation doesn't always-on the
gcc clock, in which case we need the reference.

> +      - description: Board XO source
> +      - description: Board Always On XO source
> +      - description: Byte clock from DSI PHY0
> +      - description: Pixel clock from DSI PHY0
> +      - description: Byte clock from DSI PHY1
> +      - description: Pixel clock from DSI PHY1
> +      - description: Link clock from DP PHY0
> +      - description: VCO DIV clock from DP PHY0
> +      - description: Link clock from DP PHY1
> +      - description: VCO DIV clock from DP PHY1
> +      - description: Link clock from DP PHY2
> +      - description: VCO DIV clock from DP PHY2
> +      - description: Link clock from DP PHY3
> +      - description: VCO DIV clock from DP PHY3
> +      - description: sleep clock
> +
> +  clock-names:

Please switch the implementation to index-based lookup and drop the
clock-names.

> +    items:
> +      - const: bi_tcxo
> +      - const: bi_tcxo_ao
> +      - const: dsi0_phy_pll_out_byteclk
> +      - const: dsi0_phy_pll_out_dsiclk
> +      - const: dsi1_phy_pll_out_byteclk
> +      - const: dsi1_phy_pll_out_dsiclk
> +      - const: dp0_phy_pll_link_clk
> +      - const: dp0_phy_pll_vco_div_clk
> +      - const: dp1_phy_pll_link_clk
> +      - const: dp1_phy_pll_vco_div_clk
> +      - const: dp2_phy_pll_link_clk
> +      - const: dp2_phy_pll_vco_div_clk
> +      - const: dp3_phy_pll_link_clk
> +      - const: dp3_phy_pll_vco_div_clk
> +      - const: sleep_clk
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    description:
> +      A phandle and PM domain specifier for the MMCX power domain.
> +    maxItems: 1
> +
> +  required-opps:
> +    description:
> +      A phandle to an OPP node describing required MMCX performance point.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +  - '#reset-cells'
> +  - '#power-domain-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +    clock-controller@af00000 {
> +      compatible = "qcom,sm8450-dispcc";
> +      reg = <0x0af00000 0x10000>;
> +      clocks = <&rpmhcc RPMH_CXO_CLK>,
> +               <&rpmhcc RPMH_CXO_CLK_A>,
> +               <&dsi0_phy 0>,
> +               <&dsi0_phy 1>,
> +               <&dsi1_phy 0>,
> +               <&dsi1_phy 1>,
> +               <0>, <0>,
> +               <0>, <0>,
> +               <0>, <0>,
> +               <0>, <0>,

One per line please.

Thanks,
Bjorn

> +               <&sleep_clk>;
> +      clock-names = "bi_tcxo",
> +                    "bi_tcxo_ao",
> +                    "dsi0_phy_pll_out_byteclk",
> +                    "dsi0_phy_pll_out_dsiclk",
> +                    "dsi1_phy_pll_out_byteclk",
> +                    "dsi1_phy_pll_out_dsiclk",
> +                    "dp0_phy_pll_link_clk",
> +                    "dp0_phy_pll_vco_div_clk",
> +                    "dp1_phy_pll_link_clk",
> +                    "dp1_phy_pll_vco_div_clk",
> +                    "dp2_phy_pll_link_clk",
> +                    "dp2_phy_pll_vco_div_clk",
> +                    "dp3_phy_pll_link_clk",
> +                    "dp3_phy_pll_vco_div_clk",
> +                    "sleep_clk";
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +      #power-domain-cells = <1>;
> +      power-domains = <&rpmhpd SM8450_MMCX>;
> +      required-opps = <&rpmhpd_opp_low_svs>;
> +    };
> +...
> -- 
> 2.35.1
> 
