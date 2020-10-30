Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE9D2A0E8B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 20:23:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727458AbgJ3TWl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 15:22:41 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34369 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727433AbgJ3TW2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 15:22:28 -0400
Received: by mail-ot1-f68.google.com with SMTP id k3so6570537otp.1;
        Fri, 30 Oct 2020 12:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9cay0TEgD0FPWbcpLZc+9yaog3ppNPwzOcm9Av+PCL8=;
        b=HL9ut3PUK9Bfrny8Jos6B+4pS3yFCID7rkvMcBaYtwgVezY5yHooQ1pJmBKNvMUoAn
         ojJ6H7CQ3DdLRWQb28SGoEGpARWZBnDeS0wTtOyLNNo22icI2DLHmvcfn9we2Edy7Px6
         qg/aLh5+9AKbI54zuzYMKs/+tU6cb2auKSP4E70ypnOHmHK1MzjL34LsaUHdcw+40WwP
         5qaoVm6xzOLNRlvaTQsgfCBlg+tFXTpcUB9UuTHF07yXcDlo6MT0PPcAotF5xJlVx4QS
         Lz7nedNHIKZokbKR9GUXp/qoWkb410bDisk9GNpN4GGRJ2gA1WmPptg3GTRpcpN9ptuL
         bYhA==
X-Gm-Message-State: AOAM532S8TX4CzYf1QU3ICBbAVxp6I6Zg5CKITPuQq5XphM8WRL9/hOU
        Tp62TJ1hWDuICHx+bEdxPQ==
X-Google-Smtp-Source: ABdhPJzTbp18htu++RYUvv2w5ACzH/xPWOrzIBLN3DH9HWMxuIwIhFnrxipV6Ihr+WmXWpIypoE2cQ==
X-Received: by 2002:a05:6830:1d4f:: with SMTP id p15mr2389169oth.16.1604085746757;
        Fri, 30 Oct 2020 12:22:26 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b92sm1515177otc.70.2020.10.30.12.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 12:22:26 -0700 (PDT)
Received: (nullmailer pid 4178869 invoked by uid 1000);
        Fri, 30 Oct 2020 19:22:25 -0000
Date:   Fri, 30 Oct 2020 14:22:25 -0500
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     sboyd@kernel.org, mturquette@baylibre.com,
        bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: clock: Add SDX55 GCC clock bindings
Message-ID: <20201030192225.GA4174677@bogus>
References: <20201028074232.22922-1-manivannan.sadhasivam@linaro.org>
 <20201028074232.22922-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201028074232.22922-2-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 28, 2020 at 01:12:29PM +0530, Manivannan Sadhasivam wrote:
> From: Vinod Koul <vkoul@kernel.org>
> 
> Add device tree bindings for global clock controller on SDX55 SoCs.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

This should carry your S-o-b too.

> ---
>  .../bindings/clock/qcom,gcc-sdx55.yaml        |  71 +++++++++++
>  include/dt-bindings/clock/qcom,gcc-sdx55.h    | 112 ++++++++++++++++++
>  2 files changed, 183 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sdx55.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
> new file mode 100644
> index 000000000000..c24c9d9fb7dc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,gcc-sdx55.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller Binding for SDX55
> +
> +maintainers:
> +  - Vinod Koul <vkoul@kernel.org>
> +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +
> +description: |
> +  Qualcomm global clock control module which supports the clocks, resets and
> +  power domains on SDX55
> +
> +  See also:
> +  - dt-bindings/clock/qcom,gcc-sdx55.h
> +
> +properties:
> +  compatible:
> +    const: qcom,gcc-sdx55
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
> +  - '#power-domain-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    clock-controller@100000 {
> +      compatible = "qcom,gcc-sdx55";
> +      reg = <0x00100000 0x1f0000>;
> +      clocks = <&rpmhcc RPMH_CXO_CLK>,
> +               <&sleep_clk>;
> +      clock-names = "bi_tcxo", "sleep_clk";
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +      #power-domain-cells = <1>;
> +    };
> +
> +...
> diff --git a/include/dt-bindings/clock/qcom,gcc-sdx55.h b/include/dt-bindings/clock/qcom,gcc-sdx55.h
> new file mode 100644
> index 000000000000..09ca45c6de73
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,gcc-sdx55.h
> @@ -0,0 +1,112 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

Dual license? 

> +/*
> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2020, Linaro Ltd.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_GCC_SDX55_H
> +#define _DT_BINDINGS_CLK_QCOM_GCC_SDX55_H
> +
> +#define GPLL0							3
> +#define GPLL0_OUT_EVEN						4
> +#define GPLL4							5
> +#define GPLL4_OUT_EVEN						6
> +#define GPLL5							7
> +#define GCC_AHB_PCIE_LINK_CLK					8
> +#define GCC_BLSP1_AHB_CLK					9
> +#define GCC_BLSP1_QUP1_I2C_APPS_CLK				10
> +#define GCC_BLSP1_QUP1_I2C_APPS_CLK_SRC				11
> +#define GCC_BLSP1_QUP1_SPI_APPS_CLK				12
> +#define GCC_BLSP1_QUP1_SPI_APPS_CLK_SRC				13
> +#define GCC_BLSP1_QUP2_I2C_APPS_CLK				14
> +#define GCC_BLSP1_QUP2_I2C_APPS_CLK_SRC				15
> +#define GCC_BLSP1_QUP2_SPI_APPS_CLK				16
> +#define GCC_BLSP1_QUP2_SPI_APPS_CLK_SRC				17
> +#define GCC_BLSP1_QUP3_I2C_APPS_CLK				18
> +#define GCC_BLSP1_QUP3_I2C_APPS_CLK_SRC				19
> +#define GCC_BLSP1_QUP3_SPI_APPS_CLK				20
> +#define GCC_BLSP1_QUP3_SPI_APPS_CLK_SRC				21
> +#define GCC_BLSP1_QUP4_I2C_APPS_CLK				22
> +#define GCC_BLSP1_QUP4_I2C_APPS_CLK_SRC				23
> +#define GCC_BLSP1_QUP4_SPI_APPS_CLK				24
> +#define GCC_BLSP1_QUP4_SPI_APPS_CLK_SRC				25
> +#define GCC_BLSP1_UART1_APPS_CLK				26
> +#define GCC_BLSP1_UART1_APPS_CLK_SRC				27
> +#define GCC_BLSP1_UART2_APPS_CLK				28
> +#define GCC_BLSP1_UART2_APPS_CLK_SRC				29
> +#define GCC_BLSP1_UART3_APPS_CLK				30
> +#define GCC_BLSP1_UART3_APPS_CLK_SRC				31
> +#define GCC_BLSP1_UART4_APPS_CLK				32
> +#define GCC_BLSP1_UART4_APPS_CLK_SRC				33
> +#define GCC_BOOT_ROM_AHB_CLK					34
> +#define GCC_CE1_AHB_CLK						35
> +#define GCC_CE1_AXI_CLK						36
> +#define GCC_CE1_CLK						37
> +#define GCC_CPUSS_AHB_CLK					38
> +#define GCC_CPUSS_AHB_CLK_SRC					39
> +#define GCC_CPUSS_GNOC_CLK					40
> +#define GCC_CPUSS_RBCPR_CLK					41
> +#define GCC_CPUSS_RBCPR_CLK_SRC					42
> +#define GCC_EMAC_CLK_SRC					43
> +#define GCC_EMAC_PTP_CLK_SRC					44
> +#define GCC_ETH_AXI_CLK						45
> +#define GCC_ETH_PTP_CLK						46
> +#define GCC_ETH_RGMII_CLK					47
> +#define GCC_ETH_SLAVE_AHB_CLK					48
> +#define GCC_GP1_CLK						49
> +#define GCC_GP1_CLK_SRC						50
> +#define GCC_GP2_CLK						51
> +#define GCC_GP2_CLK_SRC						52
> +#define GCC_GP3_CLK						53
> +#define GCC_GP3_CLK_SRC						54
> +#define GCC_PCIE_0_CLKREF_CLK					55
> +#define GCC_PCIE_AUX_CLK					56
> +#define GCC_PCIE_AUX_PHY_CLK_SRC				57
> +#define GCC_PCIE_CFG_AHB_CLK					58
> +#define GCC_PCIE_MSTR_AXI_CLK					59
> +#define GCC_PCIE_PIPE_CLK					60
> +#define GCC_PCIE_RCHNG_PHY_CLK					61
> +#define GCC_PCIE_RCHNG_PHY_CLK_SRC				62
> +#define GCC_PCIE_SLEEP_CLK					63
> +#define GCC_PCIE_SLV_AXI_CLK					64
> +#define GCC_PCIE_SLV_Q2A_AXI_CLK				65
> +#define GCC_PDM2_CLK						66
> +#define GCC_PDM2_CLK_SRC					67
> +#define GCC_PDM_AHB_CLK						68
> +#define GCC_PDM_XO4_CLK						69
> +#define GCC_SDCC1_AHB_CLK					70
> +#define GCC_SDCC1_APPS_CLK					71
> +#define GCC_SDCC1_APPS_CLK_SRC					72
> +#define GCC_SYS_NOC_CPUSS_AHB_CLK				73
> +#define GCC_USB30_MASTER_CLK					74
> +#define GCC_USB30_MASTER_CLK_SRC				75
> +#define GCC_USB30_MOCK_UTMI_CLK					76
> +#define GCC_USB30_MOCK_UTMI_CLK_SRC				77
> +#define GCC_USB30_MSTR_AXI_CLK					78
> +#define GCC_USB30_SLEEP_CLK					79
> +#define GCC_USB30_SLV_AHB_CLK					80
> +#define GCC_USB3_PHY_AUX_CLK					81
> +#define GCC_USB3_PHY_AUX_CLK_SRC				82
> +#define GCC_USB3_PHY_PIPE_CLK					83
> +#define GCC_USB3_PRIM_CLKREF_CLK				84
> +#define GCC_USB_PHY_CFG_AHB2PHY_CLK				85
> +#define GCC_XO_DIV4_CLK						86
> +#define GCC_XO_PCIE_LINK_CLK					87
> +
> +#define GCC_EMAC_BCR						0
> +#define GCC_PCIE_BCR						1
> +#define GCC_PCIE_LINK_DOWN_BCR					2
> +#define GCC_PCIE_NOCSR_COM_PHY_BCR				3
> +#define GCC_PCIE_PHY_BCR					4
> +#define GCC_PCIE_PHY_CFG_AHB_BCR				5
> +#define GCC_PCIE_PHY_COM_BCR					6
> +#define GCC_PCIE_PHY_NOCSR_COM_PHY_BCR				7
> +#define GCC_PDM_BCR						8
> +#define GCC_QUSB2PHY_BCR					9
> +#define GCC_TCSR_PCIE_BCR					10
> +#define GCC_USB30_BCR						11
> +#define GCC_USB3_PHY_BCR					12
> +#define GCC_USB3PHY_PHY_BCR					13
> +#define GCC_USB_PHY_CFG_AHB2PHY_BCR				14
> +
> +#endif
> -- 
> 2.17.1
> 
