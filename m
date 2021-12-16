Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE52F477D92
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Dec 2021 21:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241382AbhLPU2Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Dec 2021 15:28:16 -0500
Received: from mail-ot1-f54.google.com ([209.85.210.54]:42525 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236123AbhLPU2Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Dec 2021 15:28:16 -0500
Received: by mail-ot1-f54.google.com with SMTP id 47-20020a9d0332000000b005798ac20d72so296113otv.9;
        Thu, 16 Dec 2021 12:28:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AO8yVk6YsnLAOq3nx3IX0S/yRBN2b0mdknY2Goacoi8=;
        b=USth6OSSI8mWO87sh3Wy/bbmZsqXoTBwDasqn8UlAyOFsSQA9FjnGQPWkb7++Rzra1
         Rts5xe77MryR88QDOx2YUhNQhO+K04Nzq6DEY95WtpB2uzffH985ux6hxGsUfUmPoMAM
         axxsIy+gUGSiLD+X+De2TVTY2Udg4VJn71UOcRo+0Ni6m7mS+2fxnFeNWRZqJ+4cwmL3
         3udF5jRVGuqOtbbFUy7NfPeEg9LaKObtph/z2VYS+sj1wM3rYWxCvrOPgWToWeWYm3pa
         LnYJ88hIwKHrfB4g8EOIx2EPQn8uFCbYJ5zsLe372frWWEEjYqG3Mbi5DYtr9u5LS2te
         zSBQ==
X-Gm-Message-State: AOAM530X6BohXvl13ayetfAoAyA0aiAUNWUWG0KaolZMAGojbV9T2uXE
        3xOs/1Xudbn36S0+AJ3beG5Iudfavw==
X-Google-Smtp-Source: ABdhPJwzQ8PU9ZECNXXI8fwurbIf7QMqxdT9M40sNriX45MKv9U1l1MnN9Ln9EHTowGniivNpLm8pA==
X-Received: by 2002:a05:6830:1681:: with SMTP id k1mr14667637otr.242.1639686495697;
        Thu, 16 Dec 2021 12:28:15 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id m2sm1271538oop.12.2021.12.16.12.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 12:28:15 -0800 (PST)
Received: (nullmailer pid 700433 invoked by uid 1000);
        Thu, 16 Dec 2021 20:28:14 -0000
Date:   Thu, 16 Dec 2021 14:28:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, shawn.guo@linaro.org
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: Add qualcomm QCM2290 DISPCC
 bindings
Message-ID: <YbuhXocF5DtBWlUT@robh.at.kernel.org>
References: <1639588180-32454-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1639588180-32454-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 15, 2021 at 06:09:39PM +0100, Loic Poulain wrote:
> Add device tree bindings for display clock controller on QCM2290 SoCs.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  v2: no change
>  v3: Include dt-bindings header (qcom,dispcc-qcm2290.h) in that commit
>  
>  .../bindings/clock/qcom,qcm2290-dispcc.yaml        | 87 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,dispcc-qcm2290.h    | 34 +++++++++
>  2 files changed, 121 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,dispcc-qcm2290.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
> new file mode 100644
> index 00000000..44d5ce7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: GPL-2.0-only

dual license

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,qcm2290-dispcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display Clock & Reset Controller Binding for qcm2290
> +
> +maintainers:
> +  - Loic Poulain <loic.poulain@linaro.org>
> +
> +description: |
> +  Qualcomm display clock control module which supports the clocks, resets and
> +  power domains on qcm2290.
> +
> +  See also dt-bindings/clock/qcom,dispcc-qcm2290.h.
> +
> +properties:
> +  compatible:
> +    const: qcom,qcm2290-dispcc
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: Board active-only XO source
> +      - description: GPLL0 source from GCC
> +      - description: GPLL0 div source from GCC
> +      - description: Byte clock from DSI PHY
> +      - description: Pixel clock from DSI PHY
> +
> +  clock-names:
> +    items:
> +      - const: bi_tcxo
> +      - const: bi_tcxo_ao
> +      - const: gcc_disp_gpll0_clk_src
> +      - const: gcc_disp_gpll0_div_clk_src
> +      - const: dsi0_phy_pll_out_byteclk
> +      - const: dsi0_phy_pll_out_dsiclk
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
> +    #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
> +    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
> +    #include <dt-bindings/clock/qcom,rpmcc.h>
> +    clock-controller@5f00000 {
> +            compatible = "qcom,qcm2290-dispcc";
> +            reg = <0x5f00000 0x20000>;
> +            clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +                     <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
> +                     <&gcc GCC_DISP_GPLL0_CLK_SRC>,
> +                     <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
> +                     <&dsi0_phy 0>,
> +                     <&dsi0_phy 1>;
> +            clock-names = "bi_tcxo",
> +                          "bi_tcxo_ao",
> +                          "gcc_disp_gpll0_clk_src",
> +                          "gcc_disp_gpll0_div_clk_src",
> +                          "dsi0_phy_pll_out_byteclk",
> +                          "dsi0_phy_pll_out_dsiclk";
> +            #clock-cells = <1>;
> +            #reset-cells = <1>;
> +            #power-domain-cells = <1>;
> +    };
> +...
> diff --git a/include/dt-bindings/clock/qcom,dispcc-qcm2290.h b/include/dt-bindings/clock/qcom,dispcc-qcm2290.h
> new file mode 100644
> index 00000000..5b20fb0
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,dispcc-qcm2290.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

dual license

> +/*
> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_QCM2290_H
> +#define _DT_BINDINGS_CLK_QCOM_DISP_CC_QCM2290_H
> +
> +/* DISP_CC clocks */
> +#define DISP_CC_PLL0				0
> +#define DISP_CC_MDSS_AHB_CLK			1
> +#define DISP_CC_MDSS_AHB_CLK_SRC		2
> +#define DISP_CC_MDSS_BYTE0_CLK			3
> +#define DISP_CC_MDSS_BYTE0_CLK_SRC		4
> +#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC		5
> +#define DISP_CC_MDSS_BYTE0_INTF_CLK		6
> +#define DISP_CC_MDSS_ESC0_CLK			7
> +#define DISP_CC_MDSS_ESC0_CLK_SRC		8
> +#define DISP_CC_MDSS_MDP_CLK			9
> +#define DISP_CC_MDSS_MDP_CLK_SRC		10
> +#define DISP_CC_MDSS_MDP_LUT_CLK		11
> +#define DISP_CC_MDSS_NON_GDSC_AHB_CLK		12
> +#define DISP_CC_MDSS_PCLK0_CLK			13
> +#define DISP_CC_MDSS_PCLK0_CLK_SRC		14
> +#define DISP_CC_MDSS_VSYNC_CLK			15
> +#define DISP_CC_MDSS_VSYNC_CLK_SRC		16
> +#define DISP_CC_SLEEP_CLK			17
> +#define DISP_CC_SLEEP_CLK_SRC			18
> +#define DISP_CC_XO_CLK				19
> +#define DISP_CC_XO_CLK_SRC			20
> +
> +#define MDSS_GDSC				0
> +
> +#endif
> -- 
> 2.7.4
> 
> 
