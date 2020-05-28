Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93BD81E6C6F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 22:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407137AbgE1UZT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 16:25:19 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:36315 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407001AbgE1UZQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 16:25:16 -0400
Received: by mail-io1-f67.google.com with SMTP id y18so11179638iow.3;
        Thu, 28 May 2020 13:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Gf9w1HHhMX0hpWhDimv3fgQOrl9nmPDyVrb61+V6L70=;
        b=stkb67ZU+sMFmO0KZZ7BATtCsUfM+3gcp4Cw8UX8QxzU/lWk1mjjZfdTpjsP4cjB4Z
         prCFlP0s6muPk36f9G0wwwJTEVvzwWHNPdYw9OtSrVTxonk70iy9wIc9RwA2TSULLAmn
         S3GIhim9U6QhNjWoNMQ4KO6G2HyMftMDtsE6EaZ/cEBSTl+fvf88TYxnZYip6c/XsJH6
         QWkacX9flNoORPvGvVq48X9BT9timuQX7CWPK2rLAJL7BkYahFduDqUPIiBgZroM9rlc
         GXZTqnySOIT2lh0D9ncu6PpyC2rqJ01Z/iWdQXmzmNvMjb0Z+4bxB5UmU5TMtbQ2hnrY
         hYhQ==
X-Gm-Message-State: AOAM531OJwFBymJG+nQYPuC11DfhCXtGFxnMi9G00WfrsZYVhuLFU+AS
        /b4JFIpcD364a3bH7GSh9A==
X-Google-Smtp-Source: ABdhPJyRf8uznFeEBdT/EySaFdFO3/y3X2/IqSISPTvo2JOwLA2i94yMEQohK9K64VmjTvNZGERDDg==
X-Received: by 2002:a05:6602:2817:: with SMTP id d23mr3771962ioe.206.1590697515091;
        Thu, 28 May 2020 13:25:15 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id s66sm3147015ilb.25.2020.05.28.13.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 13:25:13 -0700 (PDT)
Received: (nullmailer pid 618934 invoked by uid 1000);
        Thu, 28 May 2020 20:25:12 -0000
Date:   Thu, 28 May 2020 14:25:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?iso-8859-1?Q?=A0?= 
        <mturquette@baylibre.com>, David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: clock: Add YAML schemas for LPASS
 clocks on SC7180
Message-ID: <20200528202512.GA608913@bogus>
References: <1589707344-8871-1-git-send-email-tdas@codeaurora.org>
 <1589707344-8871-3-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589707344-8871-3-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, May 17, 2020 at 02:52:22PM +0530, Taniya Das wrote:
> The LPASS(Low Power Audio Subsystem) clock provider have a bunch of generic
> properties that are needed in a device tree. Also add clock ids for GCC
> LPASS and LPASS Core clock IDs for LPASS client to request for the clocks.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../bindings/clock/qcom,sc7180-lpasscorecc.yaml    | 101 +++++++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-sc7180.h        |   1 +
>  .../dt-bindings/clock/qcom,lpasscorecc-sc7180.h    |  29 ++++++
>  3 files changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,lpasscorecc-sc7180.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml
> new file mode 100644
> index 0000000..c025a0ae
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sc7180-lpasscorecc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm LPASS Core Clock Controller Binding for SC7180
> +
> +maintainers:
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description: |
> +  Qualcomm LPASS core clock control module which supports the clocks and
> +  power domains on SC7180.
> +
> +  See also:
> +  - dt-bindings/clock/qcom,lpasscorecc-sc7180.h
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sc7180-lpasshm
> +      - qcom,sc7180-lpasscorecc
> +
> +  clocks:
> +    items:
> +      - description: gcc_lpass_sway clock from GCC
> +
> +  clock-names:
> +    items:
> +      - const: gcc_lpass_sway
> +
> +  power-domains:
> +    items:
> +      - description: LPASS CORE HM GSDCR

For single entry, 'maxItems: 1' is enough.
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - description: lpass audio cc register
> +      - description: lpass core cc register

audio then core

> +
> +  reg-names:
> +    items:
> +      - const: lpass_core_cc
> +      - const: lpass_audio_cc

core then audio?

2 reg-names required, but 1 reg allowed?

> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: qcom,sc7180-lpasshm
> +then:
> +  properties:
> +    reg:
> +      items:
> +        - description: lpass hm core register

reg-names allowed in this case?

Ideally, this would have just 'maxItems: 1' to just disallow the 2nd 
entry above.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +  - '#power-domain-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
> +    #include <dt-bindings/clock/qcom,lpasscorecc-sc7180.h>
> +    clock-controller@63000000 {
> +      compatible = "qcom,sc7180-lpasshm";
> +        reg = <0 0x63000000 0 0x28>;
> +        clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>;
> +        clock-names = "gcc_lpass_sway";
> +        #clock-cells = <1>;
> +        #power-domain-cells = <1>;
> +    };
> +
> +  - |
> +    clock-controller@62d00000 {
> +        compatible = "qcom,sc7180-lpasscorecc";
> +        reg = <0 0x62d00000 0 0x50000>,
> +            <0 0x62780000 0 0x30000>;
> +        reg-names = "lpass_core_cc", "lpass_audio_cc";
> +        clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>;
> +        clock-names = "gcc_lpass_sway";
> +        power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
> +        #clock-cells = <1>;
> +        #power-domain-cells = <1>;
> +    };
> +...
> diff --git a/include/dt-bindings/clock/qcom,gcc-sc7180.h b/include/dt-bindings/clock/qcom,gcc-sc7180.h
> index 1258fd0..439476c 100644
> --- a/include/dt-bindings/clock/qcom,gcc-sc7180.h
> +++ b/include/dt-bindings/clock/qcom,gcc-sc7180.h
> @@ -137,6 +137,7 @@
>  #define GCC_MSS_NAV_AXI_CLK					127
>  #define GCC_MSS_Q6_MEMNOC_AXI_CLK				128
>  #define GCC_MSS_SNOC_AXI_CLK					129
> +#define GCC_LPASS_CFG_NOC_SWAY_CLK				130
> 
>  /* GCC resets */
>  #define GCC_QUSB2PHY_PRIM_BCR					0
> diff --git a/include/dt-bindings/clock/qcom,lpasscorecc-sc7180.h b/include/dt-bindings/clock/qcom,lpasscorecc-sc7180.h
> new file mode 100644
> index 0000000..a55d01d
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,lpasscorecc-sc7180.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_LPASS_CORE_CC_SC7180_H
> +#define _DT_BINDINGS_CLK_QCOM_LPASS_CORE_CC_SC7180_H
> +
> +/* LPASS_CORE_CC clocks */
> +#define LPASS_LPAAUDIO_DIG_PLL				0
> +#define LPASS_LPAAUDIO_DIG_PLL_OUT_ODD			1
> +#define CORE_CLK_SRC					2
> +#define EXT_MCLK0_CLK_SRC				3
> +#define LPAIF_PRI_CLK_SRC				4
> +#define LPAIF_SEC_CLK_SRC				5
> +#define LPASS_AUDIO_CORE_CORE_CLK			6
> +#define LPASS_AUDIO_CORE_EXT_MCLK0_CLK			7
> +#define LPASS_AUDIO_CORE_LPAIF_PRI_IBIT_CLK		8
> +#define LPASS_AUDIO_CORE_LPAIF_SEC_IBIT_CLK		9
> +#define LPASS_AUDIO_CORE_SYSNOC_MPORT_CORE_CLK		10
> +
> +/* LPASS Core power domains */
> +#define LPASS_CORE_HM_GDSCR				0
> +
> +/* LPASS Audio power domains */
> +#define LPASS_AUDIO_HM_GDSCR				0
> +#define LPASS_PDC_HM_GDSCR				1
> +
> +#endif
> --
> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
> of the Code Aurora Forum, hosted by the  Linux Foundation.
> 
