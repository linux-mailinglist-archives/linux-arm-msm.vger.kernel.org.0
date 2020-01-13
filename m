Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75A3A139B4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 22:21:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbgAMVUy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 16:20:54 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39700 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbgAMVUy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 16:20:54 -0500
Received: by mail-ot1-f65.google.com with SMTP id 77so10403456oty.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2020 13:20:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UkcwH+aLJlMDz8EGk6FkQZlCk8V9rUaFgodvX0X0qKI=;
        b=c7TNI43ceoq3BM81gkuQy2coPbIJNw55T4kXQUnDOOLWiDBC0mAUVb9/ZB4Igm0lSZ
         9sEKB1HzfReFQsGOcWkZ5nIlUfOsNvQP3D/T+heM420Whi0g9y0h5mhbzOria6YMrjMG
         jsBhrkOXrdCOlZGVATVpG3Oy6fjK0Bfro9E/9FqTrUDtcos2WDWGQM22XO+58Pr82twl
         PDVX9EBdZvnymDlkg+Q6u1m7OQfNsiIOxnAweCKlov6dpMCN2gMS9kKCzXyj6KNmt+QI
         RGKIBwXwLrlz6saw7zU/zdc+2CLt8ATa2IDZIZtSg7uvU2HZZ5IregK+6y1T9G0B1T+C
         6wQw==
X-Gm-Message-State: APjAAAUICDecBzH/X7pzXuFS5+BY3X8Fg6JgCPlhoNoElZhswtBTMnnz
        TVtE+MEdriKcmytYV5xh9QsL2Po=
X-Google-Smtp-Source: APXvYqw1lqjoqH1m/UfobMuHcdt7TONctM88ictYsDyWZqTVkWM0//gXre0E2eGLfECxc7WkvWU8GA==
X-Received: by 2002:a9d:6758:: with SMTP id w24mr15551293otm.155.1578950452346;
        Mon, 13 Jan 2020 13:20:52 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 6sm3891355oil.43.2020.01.13.13.20.50
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 13:20:51 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 221998
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 15:20:50 -0600
Date:   Mon, 13 Jan 2020 15:20:50 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: phy: qcom,qusb2: Convert QUSB2 phy
 bindings to yaml
Message-ID: <20200113212050.GA21793@bogus>
References: <1578658699-30458-1-git-send-email-sanm@codeaurora.org>
 <1578658699-30458-3-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578658699-30458-3-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 10, 2020 at 05:48:16PM +0530, Sandeep Maheswaram wrote:
> Convert QUSB2 phy  bindings to DT schema format using json-schema.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 152 +++++++++++++++++++++
>  .../devicetree/bindings/phy/qcom-qusb2-phy.txt     |  68 ---------
>  2 files changed, 152 insertions(+), 68 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt

Fails 'make dt_binding_check':

builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.example.dt.yaml: 
phy@88e2000: 'vdda-pll-supply' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.example.dt.yaml: 
phy@88e2000: 'vdda-phy-dpdm-supply' is a required property

> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> new file mode 100644
> index 0000000..83cd01d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> @@ -0,0 +1,152 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm QUSB2 phy controller
> +
> +maintainers:
> +  - Manu Gautam <mgautam@codeaurora.org>
> +
> +description:
> +  QUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
> +
> +properties:
> +  compatible:
> +    anyOf:

anyOf is usually wrong. Use 'oneOf'.

> +      - items:
> +        - const: qcom,msm8996-qusb2-phy
> +      - items:
> +        - const: qcom,msm8998-qusb2-phy
> +      - items:
> +        - const: qcom,sc7180-qusb2-phy
> +      - items:
> +        - const: qcom,sdm845-qusb2-phy

These 4 can be a single enum. However, you should drop sc7180 and 
sdm845. Those should match below. (Or drop the below. Just pick which 
way and fixup any dts files that don't conform.)

> +      - items:
> +        - enum:
> +          - qcom,sc7180-qusb2-phy
> +          - qcom,sdm845-qusb2-phy
> +        - const: qcom,qusb2-v2-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  clocks:
> +    minItems: 2
> +    items:
> +      - description: phy config clock
> +      - description: 19.2 MHz ref clk
> +      - description: phy interface clock (Optional)
> +
> +  clock-names:
> +    minItems: 2
> +    items:
> +      - const: cfg_ahb
> +      - const: ref
> +      - const: iface
> +
> +  vdda-pll-supply:
> +     description:
> +       Phandle to 1.8V regulator supply to PHY refclk pll block.
> +
> +  vdda-phy-dpdm-supply:
> +     description:
> +       Phandle to 3.1V regulator supply to Dp/Dm port signals.
> +
> +  resets:
> +    maxItems: 1
> +
> +  nvmem-cells:
> +    maxItems: 1
> +    description:
> +        Phandle to nvmem cell that contains 'HS Tx trim'
> +        tuning parameter value for qusb2 phy.
> +
> +  qcom,tcsr-syscon:
> +    description:
> +        Phandle to TCSR syscon register region.
> +    $ref: /schemas/types.yaml#/definitions/cell

s/cell/phandle/

> +
> +  qcom,imp-res-offset-value:
> +    description:
> +        It is a 6 bit value that specifies offset to be
> +        added to PHY refgen RESCODE via IMP_CTRL1 register. It is a PHY
> +        tuning parameter that may vary for different boards of same SOC.
> +        This property is applicable to only QUSB2 v2 PHY.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - minimum: 0
> +        maximum: 63
> +        default: 0
> +
> +  qcom,hstx-trim-value:
> +    description:
> +        It is a 4 bit value that specifies tuning for HSTX
> +        output current.
> +        Possible range is - 15mA to 24mA (stepsize of 600 uA).
> +        See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
> +        This property is applicable to only QUSB2 v2 PHY.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - minimum: 0
> +        maximum: 15
> +        default: 3
> +
> +  qcom,preemphasis-level:
> +    description:
> +        It is a 2 bit value that specifies pre-emphasis level.
> +        Possible range is 0 to 15% (stepsize of 5%).
> +        See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
> +        This property is applicable to only QUSB2 v2 PHY.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - minimum: 0
> +        maximum: 3
> +        default: 2
> +
> +  qcom,preemphasis-width:
> +    description:
> +        It is a 1 bit value that specifies how long the HSTX
> +        pre-emphasis (specified using qcom,preemphasis-level) must be in
> +        effect. Duration could be half-bit of full-bit.
> +        See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
> +        This property is applicable to only QUSB2 v2 PHY.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - minimum: 0
> +        maximum: 1
> +        default: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +  - clocks
> +  - clock-names
> +  - vdda-pll-supply
> +  - vdda-phy-dpdm-supply
> +  - resets
> +
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    usb_1_hsphy: phy@88e2000 {
> +        compatible = "qcom,sdm845-qusb2-phy";
> +        reg = <0 0x088e2000 0 0x400>;
> +        #phy-cells = <0>;
> +
> +        clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> +                 <&rpmhcc RPMH_CXO_CLK>;
> +        clock-names = "cfg_ahb", "ref";
> +
> +        resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> +
> +        nvmem-cells = <&qusb2p_hstx_trim>;
> +    };
> diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> deleted file mode 100644
> index fe29f9e..0000000
> --- a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -Qualcomm QUSB2 phy controller
> -=============================
> -
> -QUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
> -
> -Required properties:
> - - compatible: compatible list, contains
> -	       "qcom,msm8996-qusb2-phy" for 14nm PHY on msm8996,
> -	       "qcom,msm8998-qusb2-phy" for 10nm PHY on msm8998,
> -	       "qcom,sdm845-qusb2-phy" for 10nm PHY on sdm845.
> -
> - - reg: offset and length of the PHY register set.
> - - #phy-cells: must be 0.
> -
> - - clocks: a list of phandles and clock-specifier pairs,
> -	   one for each entry in clock-names.
> - - clock-names: must be "cfg_ahb" for phy config clock,
> -			"ref" for 19.2 MHz ref clk,
> -			"iface" for phy interface clock (Optional).
> -
> - - vdda-pll-supply: Phandle to 1.8V regulator supply to PHY refclk pll block.
> - - vdda-phy-dpdm-supply: Phandle to 3.1V regulator supply to Dp/Dm port signals.
> -
> - - resets: Phandle to reset to phy block.
> -
> -Optional properties:
> - - nvmem-cells: Phandle to nvmem cell that contains 'HS Tx trim'
> -		tuning parameter value for qusb2 phy.
> -
> - - qcom,tcsr-syscon: Phandle to TCSR syscon register region.
> - - qcom,imp-res-offset-value: It is a 6 bit value that specifies offset to be
> -		added to PHY refgen RESCODE via IMP_CTRL1 register. It is a PHY
> -		tuning parameter that may vary for different boards of same SOC.
> -		This property is applicable to only QUSB2 v2 PHY (sdm845).
> - - qcom,hstx-trim-value: It is a 4 bit value that specifies tuning for HSTX
> -		output current.
> -		Possible range is - 15mA to 24mA (stepsize of 600 uA).
> -		See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
> -		This property is applicable to only QUSB2 v2 PHY (sdm845).
> -		Default value is 22.2mA for sdm845.
> - - qcom,preemphasis-level: It is a 2 bit value that specifies pre-emphasis level.
> -		Possible range is 0 to 15% (stepsize of 5%).
> -		See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
> -		This property is applicable to only QUSB2 v2 PHY (sdm845).
> -		Default value is 10% for sdm845.
> -- qcom,preemphasis-width: It is a 1 bit value that specifies how long the HSTX
> -		pre-emphasis (specified using qcom,preemphasis-level) must be in
> -		effect. Duration could be half-bit of full-bit.
> -		See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
> -		This property is applicable to only QUSB2 v2 PHY (sdm845).
> -		Default value is full-bit width for sdm845.
> -
> -Example:
> -	hsusb_phy: phy@7411000 {
> -		compatible = "qcom,msm8996-qusb2-phy";
> -		reg = <0x7411000 0x180>;
> -		#phy-cells = <0>;
> -
> -		clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> -			<&gcc GCC_RX1_USB2_CLKREF_CLK>,
> -		clock-names = "cfg_ahb", "ref";
> -
> -		vdda-pll-supply = <&pm8994_l12>;
> -		vdda-phy-dpdm-supply = <&pm8994_l24>;
> -
> -		resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> -		nvmem-cells = <&qusb2p_hstx_trim>;
> -        };
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
