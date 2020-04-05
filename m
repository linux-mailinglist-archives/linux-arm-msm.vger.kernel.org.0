Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38C9819E87D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2020 04:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgDECJv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Apr 2020 22:09:51 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:35559 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbgDECJv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Apr 2020 22:09:51 -0400
Received: by mail-io1-f67.google.com with SMTP id o3so12036033ioh.2;
        Sat, 04 Apr 2020 19:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HGvGldYqzcPwlD+W1QgZLducQvHDHG5zRE8/3hy9qmE=;
        b=ZGiWJcKk5rA0RoQ9U4nQaFTbO/P84py6g8caDWaiK3W6urNUEKd44N0aZbaVt80AsY
         aAqSZVzAZT7vROPohdF3K5YkZmfYjT0PuawPgXGa9M+MdHveUW5X2Z/6LR0Ad/cm3Wjj
         nnJDl6npYLFfQJIKQM76y0BmSayv/LEBuP1XtHLU8Af2G8FA1zd0wOWjjTpbQUlbbygd
         0+efNSCOseJznNB/OViPMONEPGT0e3XdrZSi+iuAbrMCXXoXST/X6d6sBmOw7shohKOj
         1HVCQMf2eEjufXsbKJQhAVy3sGyRauZRQWhwTbSpuMZ9XOjOE1gj9fyJB6oDa+xUDLn3
         Ukmw==
X-Gm-Message-State: AGi0PuYcTzOB+aByDcGLXblKjkJDcBhOnQh7PwF7/g/B2btUmpdSA1/p
        9mLYXBLWi0GVF2odDoYdVg==
X-Google-Smtp-Source: APiQypLR+L4TyzsQ18uH/T8q5XIdKfhiVKmP6auhisbFB8B7HRQkYCMpG4OowZonWrf8jyvc8VdSIQ==
X-Received: by 2002:a02:2a47:: with SMTP id w68mr3890967jaw.76.1586052589693;
        Sat, 04 Apr 2020 19:09:49 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id b6sm3770146iok.19.2020.04.04.19.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 19:09:48 -0700 (PDT)
Received: (nullmailer pid 11718 invoked by uid 1000);
        Sun, 05 Apr 2020 02:09:46 -0000
Date:   Sat, 4 Apr 2020 20:09:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?iso-8859-1?Q?=A0?= 
        <mturquette@baylibre.com>, David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 2/4] dt-bindings: clock: Add YAML schemas for LPASS
 clocks on SC7180
Message-ID: <20200405020946.GA6110@bogus>
References: <1585338485-31820-1-git-send-email-tdas@codeaurora.org>
 <1585338485-31820-3-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585338485-31820-3-git-send-email-tdas@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Mar 28, 2020 at 01:18:03AM +0530, Taniya Das wrote:
> The LPASS(Low Power Audio Subsystem) clock provider have a bunch of generic
> properties that are needed in a device tree. Also add clock ids for GCC
> LPASS and LPASS Core clock IDs for LPASS client to request for the clocks.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../bindings/clock/qcom,sc7180-lpasscorecc.yaml    | 81 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-sc7180.h        |  1 +
>  .../dt-bindings/clock/qcom,lpasscorecc-sc7180.h    | 28 ++++++++
>  3 files changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,lpasscorecc-sc7180.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml
> new file mode 100644
> index 0000000..d040bd1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml
> @@ -0,0 +1,81 @@
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

Need to define what each one is when there are 2.

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
> index 0000000..9466d5e
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,lpasscorecc-sc7180.h
> @@ -0,0 +1,28 @@
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
> +/* LPASS power domains */
> +#define LPASS_CORE_HM_GDSCR				0
> +
> +#define LPASS_AUDIO_HM_GDSCR				0

Kind of odd that 2 are the same value.

> +#define LPASS_PDC_HM_GDSCR				1
> +
> +#endif
> --
> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
> of the Code Aurora Forum, hosted by the  Linux Foundation.
> 
