Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ABE7349D84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 01:12:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbhCZAL1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 20:11:27 -0400
Received: from mail-il1-f172.google.com ([209.85.166.172]:45615 "EHLO
        mail-il1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbhCZALY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 20:11:24 -0400
Received: by mail-il1-f172.google.com with SMTP id w2so3194296ilj.12;
        Thu, 25 Mar 2021 17:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P/I+wMdHICPtFWlW8kLfAQ7JiR1EZW/dP2yVRmWYJGU=;
        b=bh/eufw9UDiJDF6CtK/sZ8HlZK7k2aEO1Ked96aDz/J/Atx6wIVSJ9t3w7IzsYVaS/
         2pmdl9KGBzMwHqNBKSe5oxSleuQ6PJQLay1K6kNE67knT7c8XCz0Y3tkpTyqRTdlG2sM
         mLNIRzLENVCWJvkw6jDfiRfr0lacw+L3NpMbs6kZ17BmvsgXXV8utjCs9/LyGiaYpiNG
         ziOYs5uaez+Qk99hfut8RDBiKu0pOxgN+sQ2/Sm0Zv8JEddarElgzOTKvIsQ42dX3KMP
         WuWAnnN4ujLfHuhuWBEUA2DO2Kmrp7zCb18VmltRGrvDACGxvzP8yX+acGs5zCmOmNtZ
         oD+Q==
X-Gm-Message-State: AOAM530VW9FxsEOReicoC1vfQH7NpYh/7WlZn+NHo91QrB9ERwpK6/27
        GL3PwHI4PVRDifwFL1aBgg==
X-Google-Smtp-Source: ABdhPJzWTUM7ViOUd0d1O5WVuFw0EBmZZAJwzZ9S1RfUkdCRF37cp6Wp77JMxNHIeBXaOjKMrxKidg==
X-Received: by 2002:a05:6e02:1a89:: with SMTP id k9mr8673060ilv.29.1616717483503;
        Thu, 25 Mar 2021 17:11:23 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id 14sm3554588ilt.54.2021.03.25.17.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 17:11:22 -0700 (PDT)
Received: (nullmailer pid 2004913 invoked by uid 1000);
        Fri, 26 Mar 2021 00:11:20 -0000
Date:   Thu, 25 Mar 2021 18:11:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?iso-8859-1?Q?=A0?= 
        <mturquette@baylibre.com>, Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/6] dt-bindings: clock: Add SC7280 DISPCC clock
 binding
Message-ID: <20210326001120.GA2001669@robh.at.kernel.org>
References: <1615944142-12171-1-git-send-email-tdas@codeaurora.org>
 <1615944142-12171-2-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615944142-12171-2-git-send-email-tdas@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 17, 2021 at 06:52:17AM +0530, Taniya Das wrote:
> Add device tree bindings for display clock controller subsystem for
> Qualcomm Technology Inc's SC7280 SoCs.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../bindings/clock/qcom,sc7280-dispcc.yaml         | 94 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,dispcc-sc7280.h     | 55 +++++++++++++
>  2 files changed, 149 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7280-dispcc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,dispcc-sc7280.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-dispcc.yaml
> new file mode 100644
> index 0000000..2178666
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-dispcc.yaml
> @@ -0,0 +1,94 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sc7280-dispcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display Clock & Reset Controller Binding for SC7280
> +
> +maintainers:
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description: |
> +  Qualcomm display clock control module which supports the clocks, resets and
> +  power domains on SC7280.
> +
> +  See also dt-bindings/clock/qcom,dispcc-sc7280.h.
> +
> +properties:
> +  compatible:
> +    const: qcom,sc7280-dispcc
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: GPLL0 source from GCC
> +      - description: Byte clock from DSI PHY
> +      - description: Pixel clock from DSI PHY
> +      - description: Link clock from DP PHY
> +      - description: VCO DIV clock from DP PHY
> +      - description: Link clock from EDP PHY
> +      - description: VCO DIV clock from EDP PHY
> +
> +  clock-names:
> +    items:
> +      - const: bi_tcxo
> +      - const: gcc_disp_gpll0_clk
> +      - const: dsi0_phy_pll_out_byteclk
> +      - const: dsi0_phy_pll_out_dsiclk
> +      - const: dp_phy_pll_link_clk
> +      - const: dp_phy_pll_vco_div_clk
> +      - const: edp_phy_pll_link_clk
> +      - const: edp_phy_pll_vco_div_clk
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
> +    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    clock-controller@af00000 {
> +      compatible = "qcom,sc7280-dispcc";
> +      reg = <0x0af00000 0x200000>;
> +      clocks = <&rpmhcc RPMH_CXO_CLK>,
> +               <&gcc GCC_DISP_GPLL0_CLK_SRC>,
> +               <&dsi_phy 0>,
> +               <&dsi_phy 1>,
> +               <&dp_phy 0>,
> +               <&dp_phy 1>,
> +               <&edp_phy 0>,
> +               <&edp_phy 1>;
> +      clock-names = "bi_tcxo",
> +                    "gcc_disp_gpll0_clk",
> +                    "dsi0_phy_pll_out_byteclk",
> +                    "dsi0_phy_pll_out_dsiclk",
> +                    "dp_phy_pll_link_clk",
> +                    "dp_phy_pll_vco_div_clk",
> +                    "edp_phy_pll_link_clk",
> +                    "edp_phy_pll_vco_div_clk";
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +      #power-domain-cells = <1>;
> +    };
> +...
> diff --git a/include/dt-bindings/clock/qcom,dispcc-sc7280.h b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
> new file mode 100644
> index 0000000..2074b30
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

Dual license?

Rob
