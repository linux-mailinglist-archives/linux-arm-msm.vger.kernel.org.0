Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4980C4C8E91
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Mar 2022 16:07:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235482AbiCAPHw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 10:07:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235578AbiCAPHu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 10:07:50 -0500
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 758A0A650E;
        Tue,  1 Mar 2022 07:07:09 -0800 (PST)
Received: by mail-oo1-f41.google.com with SMTP id y15-20020a4a650f000000b0031c19e9fe9dso22639471ooc.12;
        Tue, 01 Mar 2022 07:07:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hDEFHMjiNbMwfNx0jgRe+PVxlh5mka+OlSMk4HZIIWQ=;
        b=xQiSTvm9flRQa6mPoZKjGO1CldgNb7mYL8ZjzyMiOwqz1AhA5Jtetp0+vTQ8De2PnD
         Km4Th2U+B3kowUmjmTTqTN1kQJGGvrxXiYIhzRUtXuO5DBXur0+BQIYu4g26FT0mPi6Y
         en/4AFsJpiGcl+OhsjW+TsNy6rc10g1kYXZt5aXZ5RXJrgcPiPv5OQG0Cwv6FW6WNXxV
         kzkuxaWAe/482wIZBeZWc9o11LhDn+JbH68Lw6UvLK6GElA5f2UI3/yEUqQ5EJoWncJp
         ZlePyy/VcNs4UVkOyJzrb2kElzcNbOUYGo802ymw44zqNAZNwpTUkkHoHb5jM3JLxRQN
         LPDg==
X-Gm-Message-State: AOAM5318IJUDYmf9Fo0QpvIsygiNIRsvSlB+MTvu1HFXc3OVK0abowEH
        HV1rid1BvdpQYI0sv0edXw==
X-Google-Smtp-Source: ABdhPJyKAaGoqiUnCAWLWBAZAADCzcbZzR9c9WPPix81jPcvOPiVOWd8EPhzQc7nZyHJcyfRcFHTGw==
X-Received: by 2002:a4a:3447:0:b0:31b:f530:bc52 with SMTP id n7-20020a4a3447000000b0031bf530bc52mr12079526oof.74.1646147227896;
        Tue, 01 Mar 2022 07:07:07 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id v7-20020a4aa507000000b0031c01a4ef37sm6067021ook.32.2022.03.01.07.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 07:07:07 -0800 (PST)
Received: (nullmailer pid 1238363 invoked by uid 1000);
        Tue, 01 Mar 2022 15:07:06 -0000
Date:   Tue, 1 Mar 2022 09:07:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: clock: add QCOM SM8450 camera clock
 bindings
Message-ID: <Yh42msUo6GN0P5MX@robh.at.kernel.org>
References: <20220228120258.997027-1-vladimir.zapolskiy@linaro.org>
 <20220228120258.997027-2-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220228120258.997027-2-vladimir.zapolskiy@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 28, 2022 at 02:02:57PM +0200, Vladimir Zapolskiy wrote:
> The change adds device tree bindings for camera clock controller
> found on SM8450 SoC.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../bindings/clock/qcom,camcc-sm8450.yaml     |  87 ++++++++++
>  include/dt-bindings/clock/qcom,camcc-sm8450.h | 159 ++++++++++++++++++
>  2 files changed, 246 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,camcc-sm8450.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,camcc-sm8450.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,camcc-sm8450.yaml b/Documentation/devicetree/bindings/clock/qcom,camcc-sm8450.yaml
> new file mode 100644
> index 000000000000..835cf7d7a229
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,camcc-sm8450.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,camcc-sm8450.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Camera Clock & Reset Controller Binding for SM8450
> +
> +maintainers:
> +  - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> +
> +description: |
> +  Qualcomm camera clock control module which supports the clocks, resets and
> +  power domains on SM8450.
> +
> +  See also dt-bindings/clock/qcom,camcc-sm8450.h
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8450-camcc
> +
> +  clocks:
> +    items:
> +      - description: Camera AHB clock from GCC
> +      - description: Board XO source
> +      - description: Board active XO source
> +      - description: Sleep clock source
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: bi_tcxo
> +      - const: bi_tcxo_ao
> +      - const: sleep_clk
> +
> +  power-domains:
> +    description:
> +      A phandle and PM domain specifier for the MMCX power domain.

Need to define how many (maxItems: 1).

> +
> +  required-opps:
> +    description:
> +      A phandle to an OPP node describing required MMCX performance point.
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
> +  - power-domains
> +  - required-opps
> +  - '#clock-cells'
> +  - '#reset-cells'
> +  - '#power-domain-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-sm8450.h>
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    clock-controller@ade0000 {
> +      compatible = "qcom,sm8450-camcc";
> +      reg = <0 0xade0000 0 0x20000>;
> +      clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +               <&rpmhcc RPMH_CXO_CLK>,
> +               <&rpmhcc RPMH_CXO_CLK_A>,
> +               <&sleep_clk>;
> +      clock-names = "iface", bi_tcxo", "bi_tcxo_ao", "sleep_clk";
> +      power-domains = <&rpmhpd SM8450_MMCX>;
> +      required-opps = <&rpmhpd_opp_low_svs>;
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +      #power-domain-cells = <1>;
> +    };
> +...
> diff --git a/include/dt-bindings/clock/qcom,camcc-sm8450.h b/include/dt-bindings/clock/qcom,camcc-sm8450.h
> new file mode 100644
> index 000000000000..ad9c0af79f15
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,camcc-sm8450.h
> @@ -0,0 +1,159 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

Dual license please.

> +/*
> + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_WAIPIO_H
> +#define _DT_BINDINGS_CLK_QCOM_CAM_CC_WAIPIO_H
> +
> +/* CAM_CC clocks */
> +#define CAM_CC_BPS_AHB_CLK					0
> +#define CAM_CC_BPS_CLK						1
> +#define CAM_CC_BPS_CLK_SRC					2
> +#define CAM_CC_BPS_FAST_AHB_CLK					3
> +#define CAM_CC_CAMNOC_AXI_CLK					4
> +#define CAM_CC_CAMNOC_AXI_CLK_SRC				5
> +#define CAM_CC_CAMNOC_DCD_XO_CLK				6
> +#define CAM_CC_CCI_0_CLK					7
> +#define CAM_CC_CCI_0_CLK_SRC					8
> +#define CAM_CC_CCI_1_CLK					9
> +#define CAM_CC_CCI_1_CLK_SRC					10
> +#define CAM_CC_CORE_AHB_CLK					11
> +#define CAM_CC_CPAS_AHB_CLK					12
> +#define CAM_CC_CPAS_BPS_CLK					13
> +#define CAM_CC_CPAS_FAST_AHB_CLK				14
> +#define CAM_CC_CPAS_IFE_0_CLK					15
> +#define CAM_CC_CPAS_IFE_1_CLK					16
> +#define CAM_CC_CPAS_IFE_2_CLK					17
> +#define CAM_CC_CPAS_IFE_LITE_CLK				18
> +#define CAM_CC_CPAS_IPE_NPS_CLK					19
> +#define CAM_CC_CPAS_SBI_CLK					20
> +#define CAM_CC_CPAS_SFE_0_CLK					21
> +#define CAM_CC_CPAS_SFE_1_CLK					22
> +#define CAM_CC_CPHY_RX_CLK_SRC					23
> +#define CAM_CC_CSI0PHYTIMER_CLK					24
> +#define CAM_CC_CSI0PHYTIMER_CLK_SRC				25
> +#define CAM_CC_CSI1PHYTIMER_CLK					26
> +#define CAM_CC_CSI1PHYTIMER_CLK_SRC				27
> +#define CAM_CC_CSI2PHYTIMER_CLK					28
> +#define CAM_CC_CSI2PHYTIMER_CLK_SRC				29
> +#define CAM_CC_CSI3PHYTIMER_CLK					30
> +#define CAM_CC_CSI3PHYTIMER_CLK_SRC				31
> +#define CAM_CC_CSI4PHYTIMER_CLK					32
> +#define CAM_CC_CSI4PHYTIMER_CLK_SRC				33
> +#define CAM_CC_CSI5PHYTIMER_CLK					34
> +#define CAM_CC_CSI5PHYTIMER_CLK_SRC				35
> +#define CAM_CC_CSID_CLK						36
> +#define CAM_CC_CSID_CLK_SRC					37
> +#define CAM_CC_CSID_CSIPHY_RX_CLK				38
> +#define CAM_CC_CSIPHY0_CLK					39
> +#define CAM_CC_CSIPHY1_CLK					40
> +#define CAM_CC_CSIPHY2_CLK					41
> +#define CAM_CC_CSIPHY3_CLK					42
> +#define CAM_CC_CSIPHY4_CLK					43
> +#define CAM_CC_CSIPHY5_CLK					44
> +#define CAM_CC_FAST_AHB_CLK_SRC					45
> +#define CAM_CC_GDSC_CLK						46
> +#define CAM_CC_ICP_AHB_CLK					47
> +#define CAM_CC_ICP_CLK						48
> +#define CAM_CC_ICP_CLK_SRC					49
> +#define CAM_CC_IFE_0_CLK					50
> +#define CAM_CC_IFE_0_CLK_SRC					51
> +#define CAM_CC_IFE_0_DSP_CLK					52
> +#define CAM_CC_IFE_0_FAST_AHB_CLK				53
> +#define CAM_CC_IFE_1_CLK					54
> +#define CAM_CC_IFE_1_CLK_SRC					55
> +#define CAM_CC_IFE_1_DSP_CLK					56
> +#define CAM_CC_IFE_1_FAST_AHB_CLK				57
> +#define CAM_CC_IFE_2_CLK					58
> +#define CAM_CC_IFE_2_CLK_SRC					59
> +#define CAM_CC_IFE_2_DSP_CLK					60
> +#define CAM_CC_IFE_2_FAST_AHB_CLK				61
> +#define CAM_CC_IFE_LITE_AHB_CLK					62
> +#define CAM_CC_IFE_LITE_CLK					63
> +#define CAM_CC_IFE_LITE_CLK_SRC					64
> +#define CAM_CC_IFE_LITE_CPHY_RX_CLK				65
> +#define CAM_CC_IFE_LITE_CSID_CLK				66
> +#define CAM_CC_IFE_LITE_CSID_CLK_SRC				67
> +#define CAM_CC_IPE_NPS_AHB_CLK					68
> +#define CAM_CC_IPE_NPS_CLK					69
> +#define CAM_CC_IPE_NPS_CLK_SRC					70
> +#define CAM_CC_IPE_NPS_FAST_AHB_CLK				71
> +#define CAM_CC_IPE_PPS_CLK					72
> +#define CAM_CC_IPE_PPS_FAST_AHB_CLK				73
> +#define CAM_CC_JPEG_CLK						74
> +#define CAM_CC_JPEG_CLK_SRC					75
> +#define CAM_CC_MCLK0_CLK					76
> +#define CAM_CC_MCLK0_CLK_SRC					77
> +#define CAM_CC_MCLK1_CLK					78
> +#define CAM_CC_MCLK1_CLK_SRC					79
> +#define CAM_CC_MCLK2_CLK					80
> +#define CAM_CC_MCLK2_CLK_SRC					81
> +#define CAM_CC_MCLK3_CLK					82
> +#define CAM_CC_MCLK3_CLK_SRC					83
> +#define CAM_CC_MCLK4_CLK					84
> +#define CAM_CC_MCLK4_CLK_SRC					85
> +#define CAM_CC_MCLK5_CLK					86
> +#define CAM_CC_MCLK5_CLK_SRC					87
> +#define CAM_CC_MCLK6_CLK					88
> +#define CAM_CC_MCLK6_CLK_SRC					89
> +#define CAM_CC_MCLK7_CLK					90
> +#define CAM_CC_MCLK7_CLK_SRC					91
> +#define CAM_CC_PLL0						92
> +#define CAM_CC_PLL0_OUT_EVEN					93
> +#define CAM_CC_PLL0_OUT_ODD					94
> +#define CAM_CC_PLL1						95
> +#define CAM_CC_PLL1_OUT_EVEN					96
> +#define CAM_CC_PLL2						97
> +#define CAM_CC_PLL3						98
> +#define CAM_CC_PLL3_OUT_EVEN					99
> +#define CAM_CC_PLL4						100
> +#define CAM_CC_PLL4_OUT_EVEN					101
> +#define CAM_CC_PLL5						102
> +#define CAM_CC_PLL5_OUT_EVEN					103
> +#define CAM_CC_PLL6						104
> +#define CAM_CC_PLL6_OUT_EVEN					105
> +#define CAM_CC_PLL7						106
> +#define CAM_CC_PLL7_OUT_EVEN					107
> +#define CAM_CC_PLL8						108
> +#define CAM_CC_PLL8_OUT_EVEN					109
> +#define CAM_CC_QDSS_DEBUG_CLK					110
> +#define CAM_CC_QDSS_DEBUG_CLK_SRC				111
> +#define CAM_CC_QDSS_DEBUG_XO_CLK				112
> +#define CAM_CC_SBI_AHB_CLK					113
> +#define CAM_CC_SBI_CLK						114
> +#define CAM_CC_SFE_0_CLK					115
> +#define CAM_CC_SFE_0_CLK_SRC					116
> +#define CAM_CC_SFE_0_FAST_AHB_CLK				117
> +#define CAM_CC_SFE_1_CLK					118
> +#define CAM_CC_SFE_1_CLK_SRC					119
> +#define CAM_CC_SFE_1_FAST_AHB_CLK				120
> +#define CAM_CC_SLEEP_CLK					121
> +#define CAM_CC_SLEEP_CLK_SRC					122
> +#define CAM_CC_SLOW_AHB_CLK_SRC					123
> +#define CAM_CC_XO_CLK_SRC					124
> +
> +/* CAM_CC resets */
> +#define CAM_CC_BPS_BCR						0
> +#define CAM_CC_ICP_BCR						1
> +#define CAM_CC_IFE_0_BCR					2
> +#define CAM_CC_IFE_1_BCR					3
> +#define CAM_CC_IFE_2_BCR					4
> +#define CAM_CC_IPE_0_BCR					5
> +#define CAM_CC_QDSS_DEBUG_BCR					6
> +#define CAM_CC_SBI_BCR						7
> +#define CAM_CC_SFE_0_BCR					8
> +#define CAM_CC_SFE_1_BCR					9
> +
> +/* CAM_CC GDSCRs */
> +#define BPS_GDSC		0
> +#define IPE_0_GDSC		1
> +#define SBI_GDSC		2
> +#define IFE_0_GDSC		3
> +#define IFE_1_GDSC		4
> +#define IFE_2_GDSC		5
> +#define SFE_0_GDSC		6
> +#define SFE_1_GDSC		7
> +#define TITAN_TOP_GDSC		8
> +
> +#endif
> -- 
> 2.33.0
> 
> 
