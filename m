Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF1A2D5276
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 05:05:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730787AbgLJED3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Dec 2020 23:03:29 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:43280 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730980AbgLJECC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Dec 2020 23:02:02 -0500
Received: by mail-oi1-f195.google.com with SMTP id q25so4281726oij.10;
        Wed, 09 Dec 2020 20:01:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ugWOoECsMX/WPq88fZ0K/UNG4uWLWICAzmglsQ+lbT0=;
        b=rDBmFMmMYw2mf6T39eu6jP2gDO3KHvxkmcMYFpZGMukSYKix9AOsVp2z1m3hLxXAOl
         sA6TMHwYfDOw8n8jifVN1ewCxZZDR+33nokhpYWjNtH6wmcDEZ2GjkpakAhxNoAHS2bQ
         wXtTjQ4eohsdgfM821YB5cr8+MlI9gu/nO/0TvVEyQdNGnNtES0keZqhWKm7+FEIlj24
         eQh2UJqY5noaIE84UQqouyRBDp7kD5onZOqcOZRdpqobE8boU28A/8uP5nz/BYoBizrC
         FzWAfxdYQp4KdU2KER+iK+DQR3WShcXojL5oxOJnXcYuCtHxHgtrcw4dLF1GuEUHNwpa
         hyEQ==
X-Gm-Message-State: AOAM531zHoRaPloJmcHkVgUoq4NgaBDcHmIrGbvqjhlxZ5ymxN7lxpwy
        5fFZgsa/EXfYwmpphdEZCw==
X-Google-Smtp-Source: ABdhPJx/8sUEow+aeT1rGiwJ6oqdZGPpDeOoqMxorm7Iv07LNzGmvoQfE0GhnqI7364vdOfpZsm/Mw==
X-Received: by 2002:aca:1804:: with SMTP id h4mr4214973oih.141.1607572878445;
        Wed, 09 Dec 2020 20:01:18 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s26sm845391otd.8.2020.12.09.20.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 20:01:17 -0800 (PST)
Received: (nullmailer pid 1640765 invoked by uid 1000);
        Thu, 10 Dec 2020 04:01:16 -0000
Date:   Wed, 9 Dec 2020 22:01:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] dt-bindings: clock: Add SM8350 GCC clock bindings
Message-ID: <20201210040116.GA1639067@robh.at.kernel.org>
References: <20201208064702.3654324-1-vkoul@kernel.org>
 <20201208064702.3654324-4-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208064702.3654324-4-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 08, 2020 at 12:17:00PM +0530, Vinod Koul wrote:
> Add device tree bindings for global clock controller on SM8350 SoCs.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../bindings/clock/qcom,gcc-sm8350.yaml       |  68 +++++
>  include/dt-bindings/clock/qcom,gcc-sm8350.h   | 261 ++++++++++++++++++
>  2 files changed, 329 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8350.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
> new file mode 100644
> index 000000000000..2b0939f81162
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,gcc-sm8350.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller Binding for SM8350
> +
> +maintainers:
> +  - Vinod Koul <vkoul@kernel.org>
> +
> +description: |
> +  Qualcomm global clock control module which supports the clocks, resets and
> +  power domains on SM8350.
> +
> +  See also:
> +  - dt-bindings/clock/qcom,gcc-sm8350.h
> +
> +properties:
> +  compatible:
> +    const: qcom,gcc-sm8350
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: Sleep clock source
> +
> +  clock-names:
> +    items:
> +      - const: bi_tcxo
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
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - reg
> +  - '#clock-cells'
> +  - '#reset-cells'

You may or may not have power domains?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    clock-controller@100000 {
> +      compatible = "qcom,gcc-sm8350";
> +      reg = <0x00100000 0x1f0000>;
> +      clocks = <&rpmhcc RPMH_CXO_CLK>,
> +               <&sleep_clk>;
> +      clock-names = "bi_tcxo", "sleep_clk";
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +    };
> +
> +...
> diff --git a/include/dt-bindings/clock/qcom,gcc-sm8350.h b/include/dt-bindings/clock/qcom,gcc-sm8350.h
> new file mode 100644
> index 000000000000..2462f64f6e75
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,gcc-sm8350.h
> @@ -0,0 +1,261 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2020, Linaro Limited
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_GCC_SM8350_H
> +#define _DT_BINDINGS_CLK_QCOM_GCC_SM8350_H
> +
> +/* GCC HW clocks */
> +#define CORE_BI_PLL_TEST_SE					0
> +#define PCIE_0_PIPE_CLK						1
> +#define PCIE_1_PIPE_CLK						2
> +#define UFS_CARD_RX_SYMBOL_0_CLK				3
> +#define UFS_CARD_RX_SYMBOL_1_CLK				4
> +#define UFS_CARD_TX_SYMBOL_0_CLK				5
> +#define UFS_PHY_RX_SYMBOL_0_CLK					6
> +#define UFS_PHY_RX_SYMBOL_1_CLK					7
> +#define UFS_PHY_TX_SYMBOL_0_CLK					8
> +#define USB3_PHY_WRAPPER_GCC_USB30_PIPE_CLK			9
> +#define USB3_UNI_PHY_SEC_GCC_USB30_PIPE_CLK			10
> +
> +/* GCC clocks */
> +#define GCC_AGGRE_NOC_PCIE_0_AXI_CLK				11
> +#define GCC_AGGRE_NOC_PCIE_1_AXI_CLK				12
> +#define GCC_AGGRE_NOC_PCIE_TBU_CLK				13
> +#define GCC_AGGRE_UFS_CARD_AXI_CLK				14
> +#define GCC_AGGRE_UFS_CARD_AXI_HW_CTL_CLK			15
> +#define GCC_AGGRE_UFS_PHY_AXI_CLK				16
> +#define GCC_AGGRE_UFS_PHY_AXI_HW_CTL_CLK			17
> +#define GCC_AGGRE_USB3_PRIM_AXI_CLK				18
> +#define GCC_AGGRE_USB3_SEC_AXI_CLK				19
> +#define GCC_BOOT_ROM_AHB_CLK					20
> +#define GCC_CAMERA_AHB_CLK					21
> +#define GCC_CAMERA_HF_AXI_CLK					22
> +#define GCC_CAMERA_SF_AXI_CLK					23
> +#define GCC_CAMERA_XO_CLK					24
> +#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK				25
> +#define GCC_CFG_NOC_USB3_SEC_AXI_CLK				26
> +#define GCC_DDRSS_GPU_AXI_CLK					27
> +#define GCC_DDRSS_PCIE_SF_TBU_CLK				28
> +#define GCC_DISP_AHB_CLK					29
> +#define GCC_DISP_HF_AXI_CLK					30
> +#define GCC_DISP_SF_AXI_CLK					31
> +#define GCC_DISP_XO_CLK						32
> +#define GCC_GP1_CLK						33
> +#define GCC_GP1_CLK_SRC						34
> +#define GCC_GP2_CLK						35
> +#define GCC_GP2_CLK_SRC						36
> +#define GCC_GP3_CLK						37
> +#define GCC_GP3_CLK_SRC						38
> +#define GCC_GPLL0						39
> +#define GCC_GPLL0_OUT_EVEN					40
> +#define GCC_GPLL4						41
> +#define GCC_GPLL9						42
> +#define GCC_GPU_CFG_AHB_CLK					43
> +#define GCC_GPU_GPLL0_CLK_SRC					44
> +#define GCC_GPU_GPLL0_DIV_CLK_SRC				45
> +#define GCC_GPU_IREF_EN						46
> +#define GCC_GPU_MEMNOC_GFX_CLK					47
> +#define GCC_GPU_SNOC_DVM_GFX_CLK				48
> +#define GCC_PCIE0_PHY_RCHNG_CLK					49
> +#define GCC_PCIE1_PHY_RCHNG_CLK					50
> +#define GCC_PCIE_0_AUX_CLK					51
> +#define GCC_PCIE_0_AUX_CLK_SRC					52
> +#define GCC_PCIE_0_CFG_AHB_CLK					53
> +#define GCC_PCIE_0_CLKREF_EN					54
> +#define GCC_PCIE_0_MSTR_AXI_CLK					55
> +#define GCC_PCIE_0_PHY_RCHNG_CLK_SRC				56
> +#define GCC_PCIE_0_PIPE_CLK					57
> +#define GCC_PCIE_0_PIPE_CLK_SRC					58
> +#define GCC_PCIE_0_SLV_AXI_CLK					59
> +#define GCC_PCIE_0_SLV_Q2A_AXI_CLK				60
> +#define GCC_PCIE_1_AUX_CLK					61
> +#define GCC_PCIE_1_AUX_CLK_SRC					62
> +#define GCC_PCIE_1_CFG_AHB_CLK					63
> +#define GCC_PCIE_1_CLKREF_EN					64
> +#define GCC_PCIE_1_MSTR_AXI_CLK					65
> +#define GCC_PCIE_1_PHY_RCHNG_CLK_SRC				66
> +#define GCC_PCIE_1_PIPE_CLK					67
> +#define GCC_PCIE_1_PIPE_CLK_SRC					68
> +#define GCC_PCIE_1_SLV_AXI_CLK					69
> +#define GCC_PCIE_1_SLV_Q2A_AXI_CLK				70
> +#define GCC_PDM2_CLK						71
> +#define GCC_PDM2_CLK_SRC					72
> +#define GCC_PDM_AHB_CLK						73
> +#define GCC_PDM_XO4_CLK						74
> +#define GCC_QMIP_CAMERA_NRT_AHB_CLK				75
> +#define GCC_QMIP_CAMERA_RT_AHB_CLK				76
> +#define GCC_QMIP_DISP_AHB_CLK					77
> +#define GCC_QMIP_VIDEO_CVP_AHB_CLK				78
> +#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK				79
> +#define GCC_QUPV3_WRAP0_CORE_2X_CLK				80
> +#define GCC_QUPV3_WRAP0_CORE_CLK				81
> +#define GCC_QUPV3_WRAP0_S0_CLK					82
> +#define GCC_QUPV3_WRAP0_S0_CLK_SRC				83
> +#define GCC_QUPV3_WRAP0_S1_CLK					84
> +#define GCC_QUPV3_WRAP0_S1_CLK_SRC				85
> +#define GCC_QUPV3_WRAP0_S2_CLK					86
> +#define GCC_QUPV3_WRAP0_S2_CLK_SRC				87
> +#define GCC_QUPV3_WRAP0_S3_CLK					88
> +#define GCC_QUPV3_WRAP0_S3_CLK_SRC				89
> +#define GCC_QUPV3_WRAP0_S4_CLK					90
> +#define GCC_QUPV3_WRAP0_S4_CLK_SRC				91
> +#define GCC_QUPV3_WRAP0_S5_CLK					92
> +#define GCC_QUPV3_WRAP0_S5_CLK_SRC				93
> +#define GCC_QUPV3_WRAP0_S6_CLK					94
> +#define GCC_QUPV3_WRAP0_S6_CLK_SRC				95
> +#define GCC_QUPV3_WRAP0_S7_CLK					96
> +#define GCC_QUPV3_WRAP0_S7_CLK_SRC				97
> +#define GCC_QUPV3_WRAP1_CORE_2X_CLK				98
> +#define GCC_QUPV3_WRAP1_CORE_CLK				99
> +#define GCC_QUPV3_WRAP1_S0_CLK					100
> +#define GCC_QUPV3_WRAP1_S0_CLK_SRC				101
> +#define GCC_QUPV3_WRAP1_S1_CLK					102
> +#define GCC_QUPV3_WRAP1_S1_CLK_SRC				103
> +#define GCC_QUPV3_WRAP1_S2_CLK					104
> +#define GCC_QUPV3_WRAP1_S2_CLK_SRC				105
> +#define GCC_QUPV3_WRAP1_S3_CLK					106
> +#define GCC_QUPV3_WRAP1_S3_CLK_SRC				107
> +#define GCC_QUPV3_WRAP1_S4_CLK					108
> +#define GCC_QUPV3_WRAP1_S4_CLK_SRC				109
> +#define GCC_QUPV3_WRAP1_S5_CLK					110
> +#define GCC_QUPV3_WRAP1_S5_CLK_SRC				111
> +#define GCC_QUPV3_WRAP2_CORE_2X_CLK				112
> +#define GCC_QUPV3_WRAP2_CORE_CLK				113
> +#define GCC_QUPV3_WRAP2_S0_CLK					114
> +#define GCC_QUPV3_WRAP2_S0_CLK_SRC				115
> +#define GCC_QUPV3_WRAP2_S1_CLK					116
> +#define GCC_QUPV3_WRAP2_S1_CLK_SRC				117
> +#define GCC_QUPV3_WRAP2_S2_CLK					118
> +#define GCC_QUPV3_WRAP2_S2_CLK_SRC				119
> +#define GCC_QUPV3_WRAP2_S3_CLK					120
> +#define GCC_QUPV3_WRAP2_S3_CLK_SRC				121
> +#define GCC_QUPV3_WRAP2_S4_CLK					122
> +#define GCC_QUPV3_WRAP2_S4_CLK_SRC				123
> +#define GCC_QUPV3_WRAP2_S5_CLK					124
> +#define GCC_QUPV3_WRAP2_S5_CLK_SRC				125
> +#define GCC_QUPV3_WRAP_0_M_AHB_CLK				126
> +#define GCC_QUPV3_WRAP_0_S_AHB_CLK				127
> +#define GCC_QUPV3_WRAP_1_M_AHB_CLK				128
> +#define GCC_QUPV3_WRAP_1_S_AHB_CLK				129
> +#define GCC_QUPV3_WRAP_2_M_AHB_CLK				130
> +#define GCC_QUPV3_WRAP_2_S_AHB_CLK				131
> +#define GCC_SDCC2_AHB_CLK					132
> +#define GCC_SDCC2_APPS_CLK					133
> +#define GCC_SDCC2_APPS_CLK_SRC					134
> +#define GCC_SDCC4_AHB_CLK					135
> +#define GCC_SDCC4_APPS_CLK					136
> +#define GCC_SDCC4_APPS_CLK_SRC					137
> +#define GCC_THROTTLE_PCIE_AHB_CLK				138
> +#define GCC_UFS_1_CLKREF_EN					139
> +#define GCC_UFS_CARD_AHB_CLK					140
> +#define GCC_UFS_CARD_AXI_CLK					141
> +#define GCC_UFS_CARD_AXI_CLK_SRC				142
> +#define GCC_UFS_CARD_AXI_HW_CTL_CLK				143
> +#define GCC_UFS_CARD_ICE_CORE_CLK				144
> +#define GCC_UFS_CARD_ICE_CORE_CLK_SRC				145
> +#define GCC_UFS_CARD_ICE_CORE_HW_CTL_CLK			146
> +#define GCC_UFS_CARD_PHY_AUX_CLK				147
> +#define GCC_UFS_CARD_PHY_AUX_CLK_SRC				148
> +#define GCC_UFS_CARD_PHY_AUX_HW_CTL_CLK				149
> +#define GCC_UFS_CARD_RX_SYMBOL_0_CLK				150
> +#define GCC_UFS_CARD_RX_SYMBOL_0_CLK_SRC			151
> +#define GCC_UFS_CARD_RX_SYMBOL_1_CLK				152
> +#define GCC_UFS_CARD_RX_SYMBOL_1_CLK_SRC			153
> +#define GCC_UFS_CARD_TX_SYMBOL_0_CLK				154
> +#define GCC_UFS_CARD_TX_SYMBOL_0_CLK_SRC			155
> +#define GCC_UFS_CARD_UNIPRO_CORE_CLK				156
> +#define GCC_UFS_CARD_UNIPRO_CORE_CLK_SRC			157
> +#define GCC_UFS_CARD_UNIPRO_CORE_HW_CTL_CLK			158
> +#define GCC_UFS_PHY_AHB_CLK					159
> +#define GCC_UFS_PHY_AXI_CLK					160
> +#define GCC_UFS_PHY_AXI_CLK_SRC					161
> +#define GCC_UFS_PHY_AXI_HW_CTL_CLK				162
> +#define GCC_UFS_PHY_ICE_CORE_CLK				163
> +#define GCC_UFS_PHY_ICE_CORE_CLK_SRC				164
> +#define GCC_UFS_PHY_ICE_CORE_HW_CTL_CLK				165
> +#define GCC_UFS_PHY_PHY_AUX_CLK					166
> +#define GCC_UFS_PHY_PHY_AUX_CLK_SRC				167
> +#define GCC_UFS_PHY_PHY_AUX_HW_CTL_CLK				168
> +#define GCC_UFS_PHY_RX_SYMBOL_0_CLK				169
> +#define GCC_UFS_PHY_RX_SYMBOL_0_CLK_SRC				170
> +#define GCC_UFS_PHY_RX_SYMBOL_1_CLK				171
> +#define GCC_UFS_PHY_RX_SYMBOL_1_CLK_SRC				172
> +#define GCC_UFS_PHY_TX_SYMBOL_0_CLK				173
> +#define GCC_UFS_PHY_TX_SYMBOL_0_CLK_SRC				174
> +#define GCC_UFS_PHY_UNIPRO_CORE_CLK				175
> +#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC				176
> +#define GCC_UFS_PHY_UNIPRO_CORE_HW_CTL_CLK			177
> +#define GCC_USB30_PRIM_MASTER_CLK				178
> +#define GCC_USB30_PRIM_MASTER_CLK__FORCE_MEM_CORE_ON		179
> +#define GCC_USB30_PRIM_MASTER_CLK_SRC				180
> +#define GCC_USB30_PRIM_MOCK_UTMI_CLK				181
> +#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			182
> +#define GCC_USB30_PRIM_MOCK_UTMI_POSTDIV_CLK_SRC		183
> +#define GCC_USB30_PRIM_SLEEP_CLK				184
> +#define GCC_USB30_SEC_MASTER_CLK				185
> +#define GCC_USB30_SEC_MASTER_CLK__FORCE_MEM_CORE_ON		186
> +#define GCC_USB30_SEC_MASTER_CLK_SRC				187
> +#define GCC_USB30_SEC_MOCK_UTMI_CLK				188
> +#define GCC_USB30_SEC_MOCK_UTMI_CLK_SRC				189
> +#define GCC_USB30_SEC_MOCK_UTMI_POSTDIV_CLK_SRC			190
> +#define GCC_USB30_SEC_SLEEP_CLK					191
> +#define GCC_USB3_PRIM_PHY_AUX_CLK				192
> +#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				193
> +#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				194
> +#define GCC_USB3_PRIM_PHY_PIPE_CLK				195
> +#define GCC_USB3_PRIM_PHY_PIPE_CLK_SRC				196
> +#define GCC_USB3_SEC_CLKREF_EN					197
> +#define GCC_USB3_SEC_PHY_AUX_CLK				198
> +#define GCC_USB3_SEC_PHY_AUX_CLK_SRC				199
> +#define GCC_USB3_SEC_PHY_COM_AUX_CLK				200
> +#define GCC_USB3_SEC_PHY_PIPE_CLK				201
> +#define GCC_USB3_SEC_PHY_PIPE_CLK_SRC				202
> +#define GCC_VIDEO_AHB_CLK					203
> +#define GCC_VIDEO_AXI0_CLK					204
> +#define GCC_VIDEO_AXI1_CLK					205
> +#define GCC_VIDEO_XO_CLK					206
> +
> +/* GCC resets */
> +#define GCC_CAMERA_BCR						0
> +#define GCC_DISPLAY_BCR						1
> +#define GCC_GPU_BCR						2
> +#define GCC_MMSS_BCR						3
> +#define GCC_PCIE_0_BCR						4
> +#define GCC_PCIE_0_LINK_DOWN_BCR				5
> +#define GCC_PCIE_0_NOCSR_COM_PHY_BCR				6
> +#define GCC_PCIE_0_PHY_BCR					7
> +#define GCC_PCIE_0_PHY_NOCSR_COM_PHY_BCR			8
> +#define GCC_PCIE_1_BCR						9
> +#define GCC_PCIE_1_LINK_DOWN_BCR				10
> +#define GCC_PCIE_1_NOCSR_COM_PHY_BCR				11
> +#define GCC_PCIE_1_PHY_BCR					12
> +#define GCC_PCIE_1_PHY_NOCSR_COM_PHY_BCR			13
> +#define GCC_PCIE_PHY_CFG_AHB_BCR				14
> +#define GCC_PCIE_PHY_COM_BCR					15
> +#define GCC_PDM_BCR						16
> +#define GCC_QUPV3_WRAPPER_0_BCR					17
> +#define GCC_QUPV3_WRAPPER_1_BCR					18
> +#define GCC_QUPV3_WRAPPER_2_BCR					19
> +#define GCC_QUSB2PHY_PRIM_BCR					20
> +#define GCC_QUSB2PHY_SEC_BCR					21
> +#define GCC_SDCC2_BCR						22
> +#define GCC_SDCC4_BCR						23
> +#define GCC_UFS_CARD_BCR					24
> +#define GCC_UFS_PHY_BCR						25
> +#define GCC_USB30_PRIM_BCR					26
> +#define GCC_USB30_SEC_BCR					27
> +#define GCC_USB3_DP_PHY_PRIM_BCR				28
> +#define GCC_USB3_DP_PHY_SEC_BCR					29
> +#define GCC_USB3_PHY_PRIM_BCR					30
> +#define GCC_USB3_PHY_SEC_BCR					31
> +#define GCC_USB3PHY_PHY_PRIM_BCR				32
> +#define GCC_USB3PHY_PHY_SEC_BCR					33
> +#define GCC_USB_PHY_CFG_AHB2PHY_BCR				34
> +#define GCC_VIDEO_AXI0_CLK_ARES					35
> +#define GCC_VIDEO_AXI1_CLK_ARES					36
> +#define GCC_VIDEO_BCR						37
> +
> +#endif
> -- 
> 2.26.2
> 
