Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE9D372047
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 May 2021 21:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbhECTTf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 May 2021 15:19:35 -0400
Received: from mail-oi1-f169.google.com ([209.85.167.169]:39467 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbhECTTe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 May 2021 15:19:34 -0400
Received: by mail-oi1-f169.google.com with SMTP id i81so6435765oif.6;
        Mon, 03 May 2021 12:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b8N/TlRdWAZ9L/+h5q9FoCTxTuyKpkIVXey/8miQuVQ=;
        b=BdnVu/2e5F6Mhoa/EnOiFGRKsE4ONp3opNKPdpb5jYhdXwMm7uKTmwnNTxXq1wi+x3
         Oz8dVBqC/QXA43dbCr5uSrNNlqa3QJqf+PkhGDxQALg8befpBeplNwKKzFkoVCUgW+Db
         /xndq45AsMPVf+pHt9B41rKd8O6rIFebOc03CQvkzokuuiOZRu1i/o8RtV+quOtSfPSs
         g6+EV+OQt/pPCWCERSqnMkjYRTyvBMUZCpUj30/woqVkhlDkyFXYCxLwuAz6E7+M0V1u
         Jnq8yqMxfqwdMKZcuZzS1So7G+73CYpQYadgpRlOLEm6rBi0RFbPG2Zq47cY3Rntbw1g
         pebw==
X-Gm-Message-State: AOAM531h++F/VJye7irypOtiuYckIqbEaO7tVY3aRi5toGeX0AM2z1Z/
        MTbFiHN9v6EkM8q8yqt9sZhQ7kumoQ==
X-Google-Smtp-Source: ABdhPJz4HIRxdrj6jbmbSz3F1g0tQTObZ+/Q2IG3irc0yGp2meJilfPa7b8h8KuJe6ZAiPrOaMR3zw==
X-Received: by 2002:aca:da89:: with SMTP id r131mr8153435oig.3.1620069519822;
        Mon, 03 May 2021 12:18:39 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n37sm181424otn.9.2021.05.03.12.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 12:18:38 -0700 (PDT)
Received: (nullmailer pid 2226015 invoked by uid 1000);
        Mon, 03 May 2021 19:18:37 -0000
Date:   Mon, 3 May 2021 14:18:37 -0500
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?iso-8859-1?Q?=A0?= 
        <mturquette@baylibre.com>, Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: Add SC7280 DISPCC clock
 binding
Message-ID: <20210503191837.GA2220566@robh.at.kernel.org>
References: <1619519590-3019-1-git-send-email-tdas@codeaurora.org>
 <1619519590-3019-2-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1619519590-3019-2-git-send-email-tdas@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 27, 2021 at 04:03:05PM +0530, Taniya Das wrote:
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

Dual license please. I'm tired of telling the company that complained to 
me about having dual licensing for DT stuff not dual license their
stuff. Please pass that on to your coworkers.

Rob
