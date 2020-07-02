Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15810212E0E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2020 22:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726015AbgGBUq2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jul 2020 16:46:28 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:37991 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbgGBUq1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jul 2020 16:46:27 -0400
Received: by mail-il1-f195.google.com with SMTP id s21so10292592ilk.5;
        Thu, 02 Jul 2020 13:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pyoqpqz95piYkXTJ5LTtdbh+XbeijxweKcvbyO2beDY=;
        b=sjnI7+demZp2yJeUS2iyaVn8XSjnQWyG2GisKbiJynUqtTFTFkW1Cvi973cLv6+3fz
         HPa/qv7wyFBeIO9+hiPC76f6+wXuf2HUgqLwF+7ykVwVv9M9Z+l4lnzixr0ww7aZxjRt
         Vl68pPWBsRwf37d81hhJtgFgSvZtvwcw9NGfEmn/E9MojKNqO2vptO/69GUfp8TZ6XwO
         GI161aOV6VyAkhKYnBJ/AUd/Httfh+zy72o0dxZzQpNGkKORQBN2JjocPXmfRWwB83Uw
         7vLE2ODGQAhddpjFGHYBv7qgrrV1t39OHLVs1ZakKz7oImeyj+gHSoXPQab78Xve82dB
         cbzQ==
X-Gm-Message-State: AOAM530Aw6Rg1tXrIxSlRh99m1IYCOHAZhArtDm8FI1cF7NSBY8k5Z8p
        PlLXOxVWrbqG6LTmPHJm7A==
X-Google-Smtp-Source: ABdhPJyTyb+2FTxXkaHH0m3Z1MooH1bdWkbN2hlOzn388FwVpIB3QF+d+7VYQ2MfR75l/kdFqrJXAA==
X-Received: by 2002:a92:d843:: with SMTP id h3mr15213887ilq.255.1593722786606;
        Thu, 02 Jul 2020 13:46:26 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id l13sm5139723iob.28.2020.07.02.13.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 13:46:26 -0700 (PDT)
Received: (nullmailer pid 1663009 invoked by uid 1000);
        Thu, 02 Jul 2020 20:46:24 -0000
Date:   Thu, 2 Jul 2020 14:46:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH v2 07/13] dt-bindings: clock: Introduce SM8250
 QCOM Graphics clock bindings
Message-ID: <20200702204624.GA1661017@bogus>
References: <20200629211725.2592-1-jonathan@marek.ca>
 <20200629211725.2592-8-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629211725.2592-8-jonathan@marek.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 29, 2020 at 05:17:13PM -0400, Jonathan Marek wrote:
> Add device tree bindings for graphics clock controller for
> Qualcomm Technology Inc's SM8250 SoCs.
> 

Looks like these 2 schemas could be a single one.

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../bindings/clock/qcom,sm8250-gpucc.yaml     | 74 +++++++++++++++++++
>  include/dt-bindings/clock/qcom,gpucc-sm8250.h | 40 ++++++++++
>  2 files changed, 114 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8250-gpucc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,gpucc-sm8250.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8250-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8250-gpucc.yaml
> new file mode 100644
> index 000000000000..2b9c8f97b76d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8250-gpucc.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sm8250-gpucc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Graphics Clock & Reset Controller Binding for SM8250
> +
> +maintainers:
> +  -
> +
> +description: |
> +  Qualcomm graphics clock control module which supports the clocks, resets and
> +  power domains on SM8250.
> +
> +  See also dt-bindings/clock/qcom,gpucc-sm8250.h.
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8250-gpucc
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: GPLL0 main branch source
> +      - description: GPLL0 div branch source
> +
> +  clock-names:
> +    items:
> +      - const: bi_tcxo
> +      - const: gcc_gpu_gpll0_clk_src
> +      - const: gcc_gpu_gpll0_div_clk_src
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
> +    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    clock-controller@3d90000 {
> +      compatible = "qcom,sm8250-gpucc";
> +      reg = <0x3d90000 0x9000>;
> +      clocks = <&rpmhcc RPMH_CXO_CLK>,
> +               <&gcc GCC_GPU_GPLL0_CLK_SRC>,
> +               <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
> +      clock-names = "bi_tcxo",
> +                    "gcc_gpu_gpll0_clk_src",
> +                    "gcc_gpu_gpll0_div_clk_src";
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +      #power-domain-cells = <1>;
> +    };
> +...
> diff --git a/include/dt-bindings/clock/qcom,gpucc-sm8250.h b/include/dt-bindings/clock/qcom,gpucc-sm8250.h
> new file mode 100644
> index 000000000000..c8fe64e399fd
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,gpucc-sm8250.h
> @@ -0,0 +1,40 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_SM8250_H
> +#define _DT_BINDINGS_CLK_QCOM_GPU_CC_SM8250_H
> +
> +/* GPU_CC clock registers */
> +#define GPU_CC_AHB_CLK				0
> +#define GPU_CC_CRC_AHB_CLK			1
> +#define GPU_CC_CX_APB_CLK			2
> +#define GPU_CC_CX_GMU_CLK			3
> +#define GPU_CC_CX_QDSS_AT_CLK			4
> +#define GPU_CC_CX_QDSS_TRIG_CLK			5
> +#define GPU_CC_CX_QDSS_TSCTR_CLK		6
> +#define GPU_CC_CX_SNOC_DVM_CLK			7
> +#define GPU_CC_CXO_AON_CLK			8
> +#define GPU_CC_CXO_CLK				9
> +#define GPU_CC_GMU_CLK_SRC			10
> +#define GPU_CC_GX_GMU_CLK			11
> +#define GPU_CC_GX_QDSS_TSCTR_CLK		12
> +#define GPU_CC_GX_VSENSE_CLK			13
> +#define GPU_CC_PLL1				14
> +#define GPU_CC_SLEEP_CLK			15
> +#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK		16
> +
> +/* GPU_CC Resets */
> +#define GPUCC_GPU_CC_ACD_BCR			0
> +#define GPUCC_GPU_CC_CX_BCR			1
> +#define GPUCC_GPU_CC_GFX3D_AON_BCR		2
> +#define GPUCC_GPU_CC_GMU_BCR			3
> +#define GPUCC_GPU_CC_GX_BCR			4
> +#define GPUCC_GPU_CC_XO_BCR			5
> +
> +/* GPU_CC GDSCRs */
> +#define GPU_CX_GDSC				0
> +#define GPU_GX_GDSC				1
> +
> +#endif
> -- 
> 2.26.1
> 
