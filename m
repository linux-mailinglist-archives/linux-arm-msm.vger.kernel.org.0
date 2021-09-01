Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CAB03FD0DB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 03:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241662AbhIABqK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Aug 2021 21:46:10 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:39659 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241525AbhIABqJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Aug 2021 21:46:09 -0400
Received: by mail-ot1-f47.google.com with SMTP id m7-20020a9d4c87000000b0051875f56b95so1620851otf.6;
        Tue, 31 Aug 2021 18:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=R+w5H4hqR7bCzxkDrQvvanVcO/c0P/Ht6rgu3iuxeTc=;
        b=d2469sHLLKaBsf2O1ORcwqgAtO15TMJRYtSRGqMMKJIEljt3cndIbAYnIWw4cb144F
         LdRPbAM+6kwl8bqHBUSI4fZWPa6uzs189EW/8vNPopa0ErUVj2vRrYE/jPOc0eVrf82M
         7L6CuYjbFgLlIM51XsFLDy+0y5JqFcZi+f2sMWMZZoQ1LM0yOoip77KpjXWVtzLUbSDW
         bse0ryh0hnXtkZQwVLJrfwXBDXHY3aZWSwS3xZ15aNFFtkqqj/QAvV7X5aseGdh2oEs3
         9o/kSG2utDmz0uJrmmw/P53Gw813Efp81209oC2eEw9fyQuCla88Tt8kWMW41qRa0iif
         j0NA==
X-Gm-Message-State: AOAM5319LQm673CNlKCGdiOAIB763M3hG8kwtp/Q1NXvJvRTepKj5Kzr
        OgqkHkG/9DFqqV466ir3bQ==
X-Google-Smtp-Source: ABdhPJwxH2BoXYA7RXSHBo3DaIPGy4hLKTZerlfI6niiZBghKr6R12bjiRkBN6kc49I2AcqQILIUZQ==
X-Received: by 2002:a9d:721b:: with SMTP id u27mr20736478otj.214.1630460713197;
        Tue, 31 Aug 2021 18:45:13 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id p64sm3994580oih.29.2021.08.31.18.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 18:45:12 -0700 (PDT)
Received: (nullmailer pid 1018238 invoked by uid 1000);
        Wed, 01 Sep 2021 01:45:11 -0000
Date:   Tue, 31 Aug 2021 20:45:11 -0500
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?iso-8859-1?Q?=A0?= 
        <mturquette@baylibre.com>, Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: clock: Add YAML schemas for LPASS
 clocks on SC7280
Message-ID: <YS7bJ7bu6Ud2f+vB@robh.at.kernel.org>
References: <1630406202-3919-1-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1630406202-3919-1-git-send-email-tdas@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 31, 2021 at 04:06:41PM +0530, Taniya Das wrote:
> The LPASS(Low Power Audio Subsystem) clock provider have a bunch of generic
> properties that are needed in a device tree. Add the LPASS clock IDs for
> LPASS PIL client to request for the clocks.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../bindings/clock/qcom,sc7280-lpasscc.yaml        | 69 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,lpass-sc7280.h      | 16 +++++
>  2 files changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,lpass-sc7280.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscc.yaml
> new file mode 100644
> index 0000000..7b62763
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscc.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sc7280-lpasscc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm LPASS Core Clock Controller Binding for SC7280
> +
> +maintainers:
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description: |
> +  Qualcomm LPASS core clock control module which supports the clocks and
> +  power domains on SC7280.
> +
> +  See also:
> +  - dt-bindings/clock/qcom,lpass-sc7280.h
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sc7280-lpasscc
> +
> +  clocks:
> +    items:
> +      - description: gcc_cfg_noc_lpass_clk from GCC
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  reg:
> +    minItems: 3

Don't need minItems equal to 'items' length.

> +    items:
> +      - description: LPASS qdsp6ss register
> +      - description: LPASS top-cc register
> +      - description: LPASS cc register
> +
> +  reg-names:
> +    items:
> +      - const: qdsp6ss
> +      - const: top_cc
> +      - const: cc
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
> +    #include <dt-bindings/clock/qcom,lpass-sc7280.h>
> +    clock-controller@3000000 {
> +      compatible = "qcom,sc7280-lpasscc";
> +      reg = <0x03000000 0x40>, <0x03c04000 0x4>, <0x03389000 0x24>;
> +      reg-names = "qdsp6ss", "top_cc", "cc";
> +      clocks = <&gcc GCC_CFG_NOC_LPASS_CLK>;
> +      clock-names = "iface";
> +      #clock-cells = <1>;
> +    };
> +...
> diff --git a/include/dt-bindings/clock/qcom,lpass-sc7280.h b/include/dt-bindings/clock/qcom,lpass-sc7280.h
> new file mode 100644
> index 0000000..a259463
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,lpass-sc7280.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Dual license.

> +/*
> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_LPASS_SC7280_H
> +#define _DT_BINDINGS_CLK_QCOM_LPASS_SC7280_H
> +
> +#define LPASS_Q6SS_AHBM_CLK				0
> +#define LPASS_Q6SS_AHBS_CLK				1
> +#define LPASS_TOP_CC_LPI_Q6_AXIM_HS_CLK			2
> +#define LPASS_QDSP6SS_XO_CLK				3
> +#define LPASS_QDSP6SS_SLEEP_CLK				4
> +#define LPASS_QDSP6SS_CORE_CLK				5
> +
> +#endif
> -- 
> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
> of the Code Aurora Forum, hosted by the  Linux Foundation.
> 
> 
