Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB43A30400A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 15:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405624AbhAZOTm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 09:19:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405793AbhAZOSW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jan 2021 09:18:22 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11D49C061D7F
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jan 2021 06:17:42 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id h192so18651864oib.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jan 2021 06:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=snAymklEUhwSnE6aOil+eGqTT5ec5tFwcRj260sAvks=;
        b=AMFZuV9yP/xMgYabEyMv/EUu/qJ/qpAPDwpK8EMDiOG6J7DiOGO2GDX2qxUne9vKEP
         u1OnjabAO8O9DMwyNPu2gvLtW0363Hqu9SRiuOU7Kt+z2L9hYJgtau8tbQ/3WqjaW7fU
         y1KToE8sVncgKcwdejK80E+YSzDtUGNMGSCjgrr1EY0UQm/J/Rt4v8/w0PurijO+E+YY
         KjA2quD1t4ux6L0T1q4lt652Y1D+Nbu/1LSpwWOCqiriN+L3uLKeLIseKFsGGF/2iCh2
         HTSwbt9lDbkJ65B4yUQan7lg6YhdawnuMk1cIRG2p0AGvuYr21M0X7dUmb0+LPpM13jo
         ZvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=snAymklEUhwSnE6aOil+eGqTT5ec5tFwcRj260sAvks=;
        b=aThWXL3lCgp3JyTQPJ2jh5Es7QB58by+YD04fyBrpKH0Y30+bzBMaQGWLhm9opPey4
         d5SwZtE6LENk8HH8uAEDsgxaQtPSvGnULPdHiHDsLi9KigKOvaFVgCKq/DnVKQFBGPc4
         YUR7iWD7DkfqQWBKHjprbqKYmUqhsmtkh4g9XFnOf3m4TWjvW1PzjfPJxLUBEjX0CPRH
         TNc4uk6rwUpP7KpiBbLBwv0PCztbl9hxWKueLoGxCzKnmIVF1b16kmTFA5M2J2TLrKP4
         VYDFfR572JyoSi4M1KAIwNtvCyyAiErwTfWWuIDPzruOQ0J+qXw8FYlkTlvre6Dkn+wM
         3/Hg==
X-Gm-Message-State: AOAM533FFKL617rLyAONJb8NiZlOAomePpPWUuAb66JZG++PZ4L6kF0B
        iypvuUE0ugFThy4Rmd5K94e4sg==
X-Google-Smtp-Source: ABdhPJxNTGPmEEttjHeUpsyXi818x5CmAZskBGX+az9F3WmnzzxmjbDFdzfNlsG1QuNSweOXoCQn/g==
X-Received: by 2002:a05:6808:115:: with SMTP id b21mr9995oie.16.1611670661326;
        Tue, 26 Jan 2021 06:17:41 -0800 (PST)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e14sm1851753oou.19.2021.01.26.06.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:17:40 -0800 (PST)
Date:   Tue, 26 Jan 2021 08:17:38 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
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
Message-ID: <20210126141738.GH1241218@yoga>
References: <20210118044321.2571775-1-vkoul@kernel.org>
 <20210118044321.2571775-5-vkoul@kernel.org>
 <YA7+9xaAY0JT5csh@builder.lan>
 <20210126080058.GN2771@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126080058.GN2771@vkoul-mobl>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 26 Jan 02:00 CST 2021, Vinod Koul wrote:

> On 25-01-21, 11:25, Bjorn Andersson wrote:
> > On Sun 17 Jan 22:43 CST 2021, Vinod Koul wrote:
> > 
> > > Add device tree bindings for global clock controller on SM8350 SoCs.
> > > 
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > ---
> > >  .../bindings/clock/qcom,gcc-sm8350.yaml       |  96 +++++++
> > >  include/dt-bindings/clock/qcom,gcc-sm8350.h   | 261 ++++++++++++++++++
> > >  2 files changed, 357 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
> > >  create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8350.h
> > > 
> > > diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
> > > new file mode 100644
> > > index 000000000000..78f35832aa41
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
> > > @@ -0,0 +1,96 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/clock/qcom,gcc-sm8350.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Qualcomm Global Clock & Reset Controller Binding for SM8350
> > > +
> > > +maintainers:
> > > +  - Vinod Koul <vkoul@kernel.org>
> > > +
> > > +description: |
> > > +  Qualcomm global clock control module which supports the clocks, resets and
> > > +  power domains on SM8350.
> > > +
> > > +  See also:
> > > +  - dt-bindings/clock/qcom,gcc-sm8350.h
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: qcom,gcc-sm8350
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: Board XO source
> > > +      - description: Sleep clock source
> > > +      - description: PLL test clock source (Optional clock)
> > > +      - description: PCIE 0 Pipe clock source (Optional clock)
> > > +      - description: PCIE 1 Pipe clock source (Optional clock)
> > > +      - description: UFS card Rx symbol 0 clock source (Optional clock)
> > > +      - description: UFS card Rx symbol 1 clock source (Optional clock)
> > > +      - description: UFS card Tx symbol 0 clock source (Optional clock)
> > > +      - description: UFS phy Rx symbol 0 clock source (Optional clock)
> > > +      - description: UFS phy Rx symbol 1 clock source (Optional clock)
> > > +      - description: UFS phy Tx symbol 0 clock source (Optional clock)
> > > +      - description: USB3 phy wrapper pipe clock source (Optional clock)
> > > +      - description: USB3 phy sec pipe clock source (Optional clock)
> > > +    minItems: 2
> > > +    maxItems: 13
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: bi_tcxo
> > > +      - const: sleep_clk
> > > +      - const: core_bi_pll_test_se # Optional clock
> > > +      - const: pcie_0_pipe_clk # Optional clock
> > > +      - const: pcie_1_pipe_clk # Optional clock
> > > +      - const: ufs_card_rx_symbol_0_clk # Optional clock
> > > +      - const: ufs_card_rx_symbol_1_clk # Optional clock
> > > +      - const: ufs_card_tx_symbol_0_clk # Optional clock
> > > +      - const: ufs_phy_rx_symbol_0_clk # Optional clock
> > > +      - const: ufs_phy_rx_symbol_1_clk # Optional clock
> > > +      - const: ufs_phy_tx_symbol_0_clk # Optional clock
> > > +      - const: usb3_phy_wrapper_gcc_usb30_pipe_clk # Optional clock
> > > +      - const: usb3_uni_phy_sec_gcc_usb30_pipe_clk # Optional clock
> > > +    minItems: 2
> > > +    maxItems: 13
> > > +
> > > +  '#clock-cells':
> > > +    const: 1
> > > +
> > > +  '#reset-cells':
> > > +    const: 1
> > > +
> > > +  '#power-domain-cells':
> > > +    const: 1
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - clocks
> > > +  - clock-names
> > > +  - reg
> > > +  - '#clock-cells'
> > > +  - '#reset-cells'
> > > +  - '#power-domain-cells'
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/qcom,rpmh.h>
> > > +    clock-controller@100000 {
> > > +      compatible = "qcom,gcc-sm8350";
> > > +      reg = <0x00100000 0x1f0000>;
> > > +      clocks = <&rpmhcc RPMH_CXO_CLK>,
> > > +               <&sleep_clk>;
> > > +      clock-names = "bi_tcxo", "sleep_clk";
> > > +      #clock-cells = <1>;
> > > +      #reset-cells = <1>;
> > > +      #power-domain-cells = <1>;
> > > +    };
> > > +
> > > +...
> > > diff --git a/include/dt-bindings/clock/qcom,gcc-sm8350.h b/include/dt-bindings/clock/qcom,gcc-sm8350.h
> > > new file mode 100644
> > > index 000000000000..2b289c5c109f
> > > --- /dev/null
> > > +++ b/include/dt-bindings/clock/qcom,gcc-sm8350.h
> > > @@ -0,0 +1,261 @@
> > > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > > +/*
> > > + * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
> > > + * Copyright (c) 2020-2021, Linaro Limited
> > > + */
> > > +
> > > +#ifndef _DT_BINDINGS_CLK_QCOM_GCC_SM8350_H
> > > +#define _DT_BINDINGS_CLK_QCOM_GCC_SM8350_H
> > > +
> > > +/* GCC HW clocks */
> > > +#define CORE_BI_PLL_TEST_SE					0
> > > +#define PCIE_0_PIPE_CLK						1
> > > +#define PCIE_1_PIPE_CLK						2
> > > +#define UFS_CARD_RX_SYMBOL_0_CLK				3
> > > +#define UFS_CARD_RX_SYMBOL_1_CLK				4
> > > +#define UFS_CARD_TX_SYMBOL_0_CLK				5
> > > +#define UFS_PHY_RX_SYMBOL_0_CLK					6
> > > +#define UFS_PHY_RX_SYMBOL_1_CLK					7
> > > +#define UFS_PHY_TX_SYMBOL_0_CLK					8
> > > +#define USB3_PHY_WRAPPER_GCC_USB30_PIPE_CLK			9
> > > +#define USB3_UNI_PHY_SEC_GCC_USB30_PIPE_CLK			10
> > > +
> > > +/* GCC clocks */
> > > +#define GCC_AGGRE_NOC_PCIE_0_AXI_CLK				11
> > > +#define GCC_AGGRE_NOC_PCIE_1_AXI_CLK				12
> > > +#define GCC_AGGRE_NOC_PCIE_TBU_CLK				13
> > > +#define GCC_AGGRE_UFS_CARD_AXI_CLK				14
> > > +#define GCC_AGGRE_UFS_CARD_AXI_HW_CTL_CLK			15
> > > +#define GCC_AGGRE_UFS_PHY_AXI_CLK				16
> > > +#define GCC_AGGRE_UFS_PHY_AXI_HW_CTL_CLK			17
> > > +#define GCC_AGGRE_USB3_PRIM_AXI_CLK				18
> > > +#define GCC_AGGRE_USB3_SEC_AXI_CLK				19
> > > +#define GCC_BOOT_ROM_AHB_CLK					20
> > > +#define GCC_CAMERA_AHB_CLK					21
> > 
> > You removed these from the driver, so no need to expose them in the
> > dt-binding either.
> 
> I did think about that and thought maybe it is better to leave the
> defines. We can always update the driver to use if we ever felt the
> need.
> 
> But then I dont think we will ever do that so makes sense, will update
> this and send with acks collected
> 

Given that the actual value isn't significant (just need to be stable),
we can easily add those as new defines at the end of the list when that
day comes.

Regards,
Bjorn
