Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 292441FD8C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 00:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbgFQW3b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 18:29:31 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:40836 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbgFQW3a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 18:29:30 -0400
Received: by mail-io1-f65.google.com with SMTP id q8so4846191iow.7;
        Wed, 17 Jun 2020 15:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AGChXhts2aW/iyXH75FdVftrZcq1DsLbUtJIkfwgWko=;
        b=WmLCHN78H2xlmK64sF0Ccd1STsZkDoPRbOd1Bm522QoOlvXfErb10eQBE25VEY6lxd
         rcEO05KIrctf8AL+GZABRUlOo/sMR1z9Okyoe0H6WTiAAhLrn0SAlERxe+1wZdGR+Bup
         Y9AbmV4yIj6q31fYCtClipvimPqTTLcMz0zz1Va282wl8AG9vYaQyqwwN6sOHgNZFq7v
         buIIqE500mWCV+6MUe7u9GdPGJf6uYAbwL0PXmNzNfK4xS3JZxOoIPCvXRoZ7dPIIuxe
         ochvMot9LkVsLz3vXumQ24SLSo6mrS7iEZZz+H0C7nvXPij7CB3fzH3jUaGc7BtrJch8
         L+wQ==
X-Gm-Message-State: AOAM530MGMp40+dGnWbBuWzg2YxGskq3oSj2cgPom573S1cwui7U0MKZ
        H2knQ502to660/JQfQ+CKQ==
X-Google-Smtp-Source: ABdhPJwKxN03OW/ewOZh4vvzk2mvidmmNcr3HwzdbZmDtURo3CcImAGCUrgGgM5Qpk85aBdqc/iGww==
X-Received: by 2002:a5e:a70b:: with SMTP id b11mr1776499iod.63.1592432968850;
        Wed, 17 Jun 2020 15:29:28 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id j80sm536647ili.65.2020.06.17.15.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 15:29:28 -0700 (PDT)
Received: (nullmailer pid 2952205 invoked by uid 1000);
        Wed, 17 Jun 2020 22:29:25 -0000
Date:   Wed, 17 Jun 2020 16:29:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?iso-8859-1?Q?=A0?= 
        <mturquette@baylibre.com>, David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: clock: Add YAML schemas for LPASS
 clocks on SC7180
Message-ID: <20200617222925.GA2947130@bogus>
References: <1591809487-5588-1-git-send-email-tdas@codeaurora.org>
 <1591809487-5588-3-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591809487-5588-3-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 10, 2020 at 10:48:05PM +0530, Taniya Das wrote:
> The LPASS(Low Power Audio Subsystem) clock provider have a bunch of generic
> properties that are needed in a device tree. Also add clock ids for GCC
> LPASS and LPASS Core clock IDs for LPASS client to request for the clocks.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../bindings/clock/qcom,sc7180-lpasscorecc.yaml    | 98 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-sc7180.h        |  1 +
>  .../dt-bindings/clock/qcom,lpasscorecc-sc7180.h    | 29 +++++++
>  3 files changed, 128 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,lpasscorecc-sc7180.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml
> new file mode 100644
> index 0000000..5af4048
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml
> @@ -0,0 +1,98 @@
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
> +      - const: iface
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 2

You need a 'minItems: 1' here instead.

> +    items:
> +      - description: lpass core cc register
> +      - description: lpass audio cc register
> +
> +  reg-names:
> +    items:
> +      - const: lpass_core_cc
> +      - const: lpass_audio_cc
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: qcom,sc7180-lpasshm
> +then:
> +  properties:
> +    reg:
> +      maxItems: 1

And need an:

else:
  properties:
    reg:
      minItems: 2

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

Default sizes are 1 cell.

> +        clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>;
> +        clock-names = "iface";
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
> +        clock-names = "iface";
> +        power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
> +        #clock-cells = <1>;
> +        #power-domain-cells = <1>;
> +    };
> +...
> diff --git a/include/dt-bindings/clock/qcom,gcc-sc7180.h b/include/dt-bindings/clock/qcom,gcc-sc7180.h
> index 992b67b..bdf43adc 100644
> --- a/include/dt-bindings/clock/qcom,gcc-sc7180.h
> +++ b/include/dt-bindings/clock/qcom,gcc-sc7180.h
> @@ -138,6 +138,7 @@
>  #define GCC_MSS_Q6_MEMNOC_AXI_CLK				128
>  #define GCC_MSS_SNOC_AXI_CLK					129
>  #define GCC_SEC_CTRL_CLK_SRC					130
> +#define GCC_LPASS_CFG_NOC_SWAY_CLK				131
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
