Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4AF74FED38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 04:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbiDMC4O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 22:56:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231821AbiDMC4N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 22:56:13 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2F6650B0E
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 19:53:52 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id k13so764550oiw.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 19:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZoH8e8r4UIOSvPUE6COhhCPVOxGvag/JlmUFDcc7v9c=;
        b=QdRxIJieaKx4DXmHDy84cGdCn24f19EMkeavNCtFBqNUAdnGVAUekrpFfrz/No5U/r
         eDj85Ma17HgGu4D1Y8CvyqKvOFa+K2dD+FzrUHl103iuVEy8Cox+W8ZdEy3emrWOjrJs
         7rCo/uP5Skz7su7QAbMSBDYNWFnV1N2HlbCa6p4t0E0DURPDDap2b7DEOE5LG7UzvhJ/
         XkMB1gPkMfpUpvmAO83ynGfFvWlz30yK6F93DX0GvXSRsglxV3eaEj0JCHOMBkh/pLTF
         UclsLdrxrkCJyhhbOSgKGc8alF4XW7ENEJWRzBAUS2skbauB1BpRlwmWL/r75iBuapcQ
         e1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZoH8e8r4UIOSvPUE6COhhCPVOxGvag/JlmUFDcc7v9c=;
        b=bAxZrP/YwCdcV6OKhWyvf1DvQEEfe7zY9M+gxbwkwLZ5hGIyHko/HcyNkl1AaKGpmy
         oOSOhUa+rz1eXaxNn4irHI5iYzvK7SJYWqKBrh4bB9FxYilcA+Y3lIePIGKf10ieZ5ab
         x+JpEpA/w+Nk12EL9CYQVFpyJPKSfYot9O2CGXaf/cogSVTMcq/pcSYcNjJ8My+8PbaM
         xh7aVLlglLCMfsmgL+EZFMy2Oh/lCnRlZgiydy1S31FHNZ8hR2orjJ0zOge4Tb0F7lP9
         VLtVHkGvhFVcMfSXkJ15YMOMR6JUNIaPxRnY8/ltsm08xRiP7GTUnG0wFGcNFRgn7GXe
         xO2A==
X-Gm-Message-State: AOAM531mJaX4aUyIQrdu7iArbvga1WUEXuBPANuVu7vXCB2bAHGSnA7Y
        fco21JeDhGoJ5DuTSN3hz0ko2Q==
X-Google-Smtp-Source: ABdhPJzqVaavPu18pxeAvlFROAK09XbgwwbuCORaHWi4EHwzighR1lI37Zi49s2G9WeToQOOTWV3dw==
X-Received: by 2002:a05:6808:1b21:b0:2d9:fd1b:c85d with SMTP id bx33-20020a0568081b2100b002d9fd1bc85dmr3162274oib.174.1649818427322;
        Tue, 12 Apr 2022 19:53:47 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id eq37-20020a056870a92500b000c6699dad62sm14850209oab.41.2022.04.12.19.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 19:53:46 -0700 (PDT)
Date:   Tue, 12 Apr 2022 21:53:45 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: clock: add QCOM SM8450 camera clock
 bindings
Message-ID: <YlY7OYSc4vlUQe+O@builder.lan>
References: <20220314114211.1636574-1-vladimir.zapolskiy@linaro.org>
 <20220314114211.1636574-2-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220314114211.1636574-2-vladimir.zapolskiy@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 14 Mar 06:42 CDT 2022, Vladimir Zapolskiy wrote:

> The change adds device tree bindings for camera clock controller
> found on SM8450 SoC.
> 

This series looks good to me. I had some very minor suggestions on
the driver implementation side, please fix those up and address the DT
warning reported by Rob, so we can get an ack from the DT maintainers.

Thanks,
Bjorn

> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> Changes from v1 to v2:
> * updated qcom,camcc-sm8450.yaml according to review comments from Rob,
> * changed qcom,camcc-sm8450.h license to dual one.
> 
>  .../bindings/clock/qcom,camcc-sm8450.yaml     |  89 ++++++++++
>  include/dt-bindings/clock/qcom,camcc-sm8450.h | 159 ++++++++++++++++++
>  2 files changed, 248 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,camcc-sm8450.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,camcc-sm8450.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,camcc-sm8450.yaml b/Documentation/devicetree/bindings/clock/qcom,camcc-sm8450.yaml
> new file mode 100644
> index 000000000000..2ea0fc12dd69
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,camcc-sm8450.yaml
> @@ -0,0 +1,89 @@
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
> +    maxItems: 1
> +    description:
> +      A phandle and PM domain specifier for the MMCX power domain.
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
> +    #include <dt-bindings/power/qcom-rpmpd.h>
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
> index 000000000000..7ff67acf301a
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,camcc-sm8450.h
> @@ -0,0 +1,159 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_SM8450_H
> +#define _DT_BINDINGS_CLK_QCOM_CAM_CC_SM8450_H
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
