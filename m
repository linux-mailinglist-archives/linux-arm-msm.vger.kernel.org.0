Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58A4A303799
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 09:05:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389655AbhAZICk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 03:02:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:43996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389643AbhAZIBp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jan 2021 03:01:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1DF5B206FB;
        Tue, 26 Jan 2021 08:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611648063;
        bh=aa2bH7Ml2N6u9IL2Q2DMHdUm/C/GjwCOvIhYPhIyEmw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IokureFN2AQ9Q6/LL/jf9dZV3w3bY7I9BlmyWOu/ETswXoW708lBNYhV5pPgOlQ72
         vjP5hgdn2TCFiKmMPAbJJ/zF+ZqvyDW58B56xPywLB3wq8Wp2MD/1G69Z1UpRHHIl8
         hJXNC3aYd9TO4uwIjI5g63OnC8csnGD9moh6fbWhQ7+gu4SpsU6LYBlhhjZ64yQUOZ
         S5VzOEfpyCnuox0Ii3UgDKbgdv4aTduNuDV5rjpn9wJtiQS+w/qThg/CkGcvbnscga
         0FIJs14wl0sSbKU8J84uxKQzV4eE/THzAnKNgr1PorAM+TuNNk4bHr1j4LmzvfH+kW
         urSjolNvFNk3A==
Date:   Tue, 26 Jan 2021 13:30:58 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 4/5] dt-bindings: clock: Add SM8350 GCC clock bindings
Message-ID: <20210126080058.GN2771@vkoul-mobl>
References: <20210118044321.2571775-1-vkoul@kernel.org>
 <20210118044321.2571775-5-vkoul@kernel.org>
 <YA7+9xaAY0JT5csh@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YA7+9xaAY0JT5csh@builder.lan>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25-01-21, 11:25, Bjorn Andersson wrote:
> On Sun 17 Jan 22:43 CST 2021, Vinod Koul wrote:
> 
> > Add device tree bindings for global clock controller on SM8350 SoCs.
> > 
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  .../bindings/clock/qcom,gcc-sm8350.yaml       |  96 +++++++
> >  include/dt-bindings/clock/qcom,gcc-sm8350.h   | 261 ++++++++++++++++++
> >  2 files changed, 357 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
> >  create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8350.h
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
> > new file mode 100644
> > index 000000000000..78f35832aa41
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
> > @@ -0,0 +1,96 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/qcom,gcc-sm8350.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Global Clock & Reset Controller Binding for SM8350
> > +
> > +maintainers:
> > +  - Vinod Koul <vkoul@kernel.org>
> > +
> > +description: |
> > +  Qualcomm global clock control module which supports the clocks, resets and
> > +  power domains on SM8350.
> > +
> > +  See also:
> > +  - dt-bindings/clock/qcom,gcc-sm8350.h
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,gcc-sm8350
> > +
> > +  clocks:
> > +    items:
> > +      - description: Board XO source
> > +      - description: Sleep clock source
> > +      - description: PLL test clock source (Optional clock)
> > +      - description: PCIE 0 Pipe clock source (Optional clock)
> > +      - description: PCIE 1 Pipe clock source (Optional clock)
> > +      - description: UFS card Rx symbol 0 clock source (Optional clock)
> > +      - description: UFS card Rx symbol 1 clock source (Optional clock)
> > +      - description: UFS card Tx symbol 0 clock source (Optional clock)
> > +      - description: UFS phy Rx symbol 0 clock source (Optional clock)
> > +      - description: UFS phy Rx symbol 1 clock source (Optional clock)
> > +      - description: UFS phy Tx symbol 0 clock source (Optional clock)
> > +      - description: USB3 phy wrapper pipe clock source (Optional clock)
> > +      - description: USB3 phy sec pipe clock source (Optional clock)
> > +    minItems: 2
> > +    maxItems: 13
> > +
> > +  clock-names:
> > +    items:
> > +      - const: bi_tcxo
> > +      - const: sleep_clk
> > +      - const: core_bi_pll_test_se # Optional clock
> > +      - const: pcie_0_pipe_clk # Optional clock
> > +      - const: pcie_1_pipe_clk # Optional clock
> > +      - const: ufs_card_rx_symbol_0_clk # Optional clock
> > +      - const: ufs_card_rx_symbol_1_clk # Optional clock
> > +      - const: ufs_card_tx_symbol_0_clk # Optional clock
> > +      - const: ufs_phy_rx_symbol_0_clk # Optional clock
> > +      - const: ufs_phy_rx_symbol_1_clk # Optional clock
> > +      - const: ufs_phy_tx_symbol_0_clk # Optional clock
> > +      - const: usb3_phy_wrapper_gcc_usb30_pipe_clk # Optional clock
> > +      - const: usb3_uni_phy_sec_gcc_usb30_pipe_clk # Optional clock
> > +    minItems: 2
> > +    maxItems: 13
> > +
> > +  '#clock-cells':
> > +    const: 1
> > +
> > +  '#reset-cells':
> > +    const: 1
> > +
> > +  '#power-domain-cells':
> > +    const: 1
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - clocks
> > +  - clock-names
> > +  - reg
> > +  - '#clock-cells'
> > +  - '#reset-cells'
> > +  - '#power-domain-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/qcom,rpmh.h>
> > +    clock-controller@100000 {
> > +      compatible = "qcom,gcc-sm8350";
> > +      reg = <0x00100000 0x1f0000>;
> > +      clocks = <&rpmhcc RPMH_CXO_CLK>,
> > +               <&sleep_clk>;
> > +      clock-names = "bi_tcxo", "sleep_clk";
> > +      #clock-cells = <1>;
> > +      #reset-cells = <1>;
> > +      #power-domain-cells = <1>;
> > +    };
> > +
> > +...
> > diff --git a/include/dt-bindings/clock/qcom,gcc-sm8350.h b/include/dt-bindings/clock/qcom,gcc-sm8350.h
> > new file mode 100644
> > index 000000000000..2b289c5c109f
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/qcom,gcc-sm8350.h
> > @@ -0,0 +1,261 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
> > + * Copyright (c) 2020-2021, Linaro Limited
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CLK_QCOM_GCC_SM8350_H
> > +#define _DT_BINDINGS_CLK_QCOM_GCC_SM8350_H
> > +
> > +/* GCC HW clocks */
> > +#define CORE_BI_PLL_TEST_SE					0
> > +#define PCIE_0_PIPE_CLK						1
> > +#define PCIE_1_PIPE_CLK						2
> > +#define UFS_CARD_RX_SYMBOL_0_CLK				3
> > +#define UFS_CARD_RX_SYMBOL_1_CLK				4
> > +#define UFS_CARD_TX_SYMBOL_0_CLK				5
> > +#define UFS_PHY_RX_SYMBOL_0_CLK					6
> > +#define UFS_PHY_RX_SYMBOL_1_CLK					7
> > +#define UFS_PHY_TX_SYMBOL_0_CLK					8
> > +#define USB3_PHY_WRAPPER_GCC_USB30_PIPE_CLK			9
> > +#define USB3_UNI_PHY_SEC_GCC_USB30_PIPE_CLK			10
> > +
> > +/* GCC clocks */
> > +#define GCC_AGGRE_NOC_PCIE_0_AXI_CLK				11
> > +#define GCC_AGGRE_NOC_PCIE_1_AXI_CLK				12
> > +#define GCC_AGGRE_NOC_PCIE_TBU_CLK				13
> > +#define GCC_AGGRE_UFS_CARD_AXI_CLK				14
> > +#define GCC_AGGRE_UFS_CARD_AXI_HW_CTL_CLK			15
> > +#define GCC_AGGRE_UFS_PHY_AXI_CLK				16
> > +#define GCC_AGGRE_UFS_PHY_AXI_HW_CTL_CLK			17
> > +#define GCC_AGGRE_USB3_PRIM_AXI_CLK				18
> > +#define GCC_AGGRE_USB3_SEC_AXI_CLK				19
> > +#define GCC_BOOT_ROM_AHB_CLK					20
> > +#define GCC_CAMERA_AHB_CLK					21
> 
> You removed these from the driver, so no need to expose them in the
> dt-binding either.

I did think about that and thought maybe it is better to leave the
defines. We can always update the driver to use if we ever felt the
need.

But then I dont think we will ever do that so makes sense, will update
this and send with acks collected

-- 
~Vinod
