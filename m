Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60DAA212E08
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2020 22:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgGBUo4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jul 2020 16:44:56 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:43836 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbgGBUo4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jul 2020 16:44:56 -0400
Received: by mail-il1-f194.google.com with SMTP id i18so25444266ilk.10;
        Thu, 02 Jul 2020 13:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zWBJg8XOv41Q7ME56r0sbXDv0Um2Bk/oYLgZWx1VVNI=;
        b=p/v8j2M75Ir2XdDRe93MmmNrtX6twkSz4bq7x0JoFyg3JKsRl4semJoIGkhRpNLbv5
         L9hQ3o1m2laq6jIcBMPXRyR9RhsFP+1buWnHx7Xgk95bdMB/GZ/kiD7enfm/K9gArw0K
         nq6Dfm+dyitOR567cHMgOUSfgD5ZuQULe8sky79L+/Jdqmwc71LkKPwlj9+Eeuz8o4wu
         kuMHxvZZD5MXdgzRuTg3VnVBSvXVuoxYMancfysAySF253lY2xH4dVx4pARnA47buT5a
         XyA/vVP24PlN0eFRjIc2o8RHXRkzLXPpTuWGtXmJxrGEBBSZfAfZ4jwDieymeEi9pjyK
         49JA==
X-Gm-Message-State: AOAM532Jrof9F3bUTRcl99oEJryL9hypA0FxFRBe5xGf4eiXFt3nMUSg
        bEgC5/vFgu8Q3JNvNvrlSjqnwgUgww==
X-Google-Smtp-Source: ABdhPJwXcrJlKFdmpntAFLnUw2djC3TYgk2dzDgZml2iTX/sJMfdzppykNU2EUkcjDDeKIEKHKQhVQ==
X-Received: by 2002:a92:bb84:: with SMTP id x4mr14949982ilk.177.1593722695101;
        Thu, 02 Jul 2020 13:44:55 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id v5sm4932559ios.54.2020.07.02.13.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 13:44:54 -0700 (PDT)
Received: (nullmailer pid 1660522 invoked by uid 1000);
        Thu, 02 Jul 2020 20:44:51 -0000
Date:   Thu, 2 Jul 2020 14:44:51 -0600
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
Subject: Re: [RESEND PATCH v2 06/13] dt-bindings: clock: Introduce SM8150
 QCOM Graphics clock bindings
Message-ID: <20200702204451.GB1657238@bogus>
References: <20200629211725.2592-1-jonathan@marek.ca>
 <20200629211725.2592-7-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629211725.2592-7-jonathan@marek.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 29, 2020 at 05:17:12PM -0400, Jonathan Marek wrote:
> Add device tree bindings for graphics clock controller for
> Qualcomm Technology Inc's SM8150 SoCs.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../bindings/clock/qcom,sm8150-gpucc.yaml     | 74 +++++++++++++++++++
>  include/dt-bindings/clock/qcom,gpucc-sm8150.h | 40 ++++++++++
>  2 files changed, 114 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8150-gpucc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,gpucc-sm8150.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8150-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8150-gpucc.yaml
> new file mode 100644
> index 000000000000..683b50dd3492
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8150-gpucc.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: GPL-2.0-only

Dual license new bindings.

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sm8150-gpucc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Graphics Clock & Reset Controller Binding for SM8150
> +
> +maintainers:
> +  -

Got to pick someone.

> +
> +description: |
> +  Qualcomm graphics clock control module which supports the clocks, resets and
> +  power domains on SM8150.
> +
> +  See also dt-bindings/clock/qcom,gpucc-sm8150.h.
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8150-gpucc
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
> +    #include <dt-bindings/clock/qcom,gcc-sm8150.h>
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    clock-controller@2c90000 {
> +      compatible = "qcom,sm8150-gpucc";
> +      reg = <0x2c90000 0x9000>;
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
> diff --git a/include/dt-bindings/clock/qcom,gpucc-sm8150.h b/include/dt-bindings/clock/qcom,gpucc-sm8150.h
> new file mode 100644
> index 000000000000..e7cac7fe9739
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,gpucc-sm8150.h
> @@ -0,0 +1,40 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_SM8150_H
> +#define _DT_BINDINGS_CLK_QCOM_GPU_CC_SM8150_H
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
> +#define GPU_CC_PLL_TEST_CLK			15
> +#define GPU_CC_SLEEP_CLK			16
> +
> +/* GPU_CC Resets */
> +#define GPUCC_GPU_CC_CX_BCR			0
> +#define GPUCC_GPU_CC_GFX3D_AON_BCR		1
> +#define GPUCC_GPU_CC_GMU_BCR			2
> +#define GPUCC_GPU_CC_GX_BCR			3
> +#define GPUCC_GPU_CC_SPDM_BCR			4
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
