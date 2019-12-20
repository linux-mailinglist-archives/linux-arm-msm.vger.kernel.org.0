Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33F95128577
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Dec 2019 00:20:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbfLTXUt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Dec 2019 18:20:49 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:35949 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbfLTXUs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Dec 2019 18:20:48 -0500
Received: by mail-io1-f66.google.com with SMTP id r13so967411ioa.3;
        Fri, 20 Dec 2019 15:20:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nToGohRzbcvtGJGvS9bZUDG4QHSeGKTIa0oX9N/eOCw=;
        b=qzZUkiAJ4eEvc97U77xOEP5Ws3xzxTdBnN8iLtpO8Gz97gvMq5TUp4+B7hgamg/LLv
         SD0d9K8utb7LfF472beTJf57nQbAnTLel7eviysC3jjBMygW/py0FPp1QaisI2SFBks0
         lNRrRLRAx2PSK0I6EidI2gIkUAryhwmUGbvkPz2fuuyE6v9yaGvsYQDMfDsWa/Vdto++
         W8dU/knPT9rP6ykshot3yNP2CL70VtUAmprUz8WOcrLDyE+YP9u113ZA6gilrIXqWM3L
         xOiKSsVOoo9gjxBXQc+qaFTmxQHAFw6+lW05L+EdrcCXKn2+xIsl0yrEAYXU6rXhZr9L
         MxAA==
X-Gm-Message-State: APjAAAW2cZllzKjI4ZAHc9Q/ipni8Et6Qb1zdpEgzZJAelNz4Bgzlucd
        v+7TuczobpGBSIgET2bxIA==
X-Google-Smtp-Source: APXvYqyAHATAQt3ZrPRsZ/7csGNdq8RLdQi+VY25XtzUjR1itdJ/03MzT3khYszSykAkaHrsWPwDnQ==
X-Received: by 2002:a6b:e711:: with SMTP id b17mr11434927ioh.307.1576884047752;
        Fri, 20 Dec 2019 15:20:47 -0800 (PST)
Received: from localhost ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id j5sm3923212ioq.30.2019.12.20.15.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2019 15:20:46 -0800 (PST)
Date:   Fri, 20 Dec 2019 16:20:46 -0700
From:   Rob Herring <robh@kernel.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mgautam@codeaurora.org, swboyd@chromium.org
Subject: Re: [PATCH V2] dt-bindings: geni-se: Convert QUP geni-se bindings to
 YAML
Message-ID: <20191220232046.GA408@bogus>
References: <1576576279-29927-1-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1576576279-29927-1-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 17, 2019 at 03:21:19PM +0530, Akash Asthana wrote:
> Convert QUP geni-se bindings to DT schema format using json-schema.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
> Changes in V2:
>  - As per Stephen's comment corrected defintion of interrupts for UART node.
>    Any valid UART node must contain atleast 1 interrupts.
> 
>  .../devicetree/bindings/soc/qcom/qcom,geni-se.txt  |  94 ----------
>  .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 197 +++++++++++++++++++++
>  2 files changed, 197 insertions(+), 94 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
> deleted file mode 100644
> index dab7ca9..0000000
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
> +++ /dev/null
> @@ -1,94 +0,0 @@
> -Qualcomm Technologies, Inc. GENI Serial Engine QUP Wrapper Controller
> -
> -Generic Interface (GENI) based Qualcomm Universal Peripheral (QUP) wrapper
> -is a programmable module for supporting a wide range of serial interfaces
> -like UART, SPI, I2C, I3C, etc. A single QUP module can provide upto 8 Serial
> -Interfaces, using its internal Serial Engines. The GENI Serial Engine QUP
> -Wrapper controller is modeled as a node with zero or more child nodes each
> -representing a serial engine.
> -
> -Required properties:
> -- compatible:		Must be "qcom,geni-se-qup".
> -- reg:			Must contain QUP register address and length.
> -- clock-names:		Must contain "m-ahb" and "s-ahb".
> -- clocks:		AHB clocks needed by the device.
> -
> -Required properties if child node exists:
> -- #address-cells: 	Must be <1> for Serial Engine Address
> -- #size-cells: 		Must be <1> for Serial Engine Address Size
> -- ranges: 		Must be present
> -
> -Properties for children:
> -
> -A GENI based QUP wrapper controller node can contain 0 or more child nodes
> -representing serial devices.  These serial devices can be a QCOM UART, I2C
> -controller, SPI controller, or some combination of aforementioned devices.
> -Please refer below the child node definitions for the supported serial
> -interface protocols.
> -
> -Qualcomm Technologies Inc. GENI Serial Engine based I2C Controller
> -
> -Required properties:
> -- compatible:		Must be "qcom,geni-i2c".
> -- reg: 			Must contain QUP register address and length.
> -- interrupts: 		Must contain I2C interrupt.
> -- clock-names: 		Must contain "se".
> -- clocks: 		Serial engine core clock needed by the device.
> -- #address-cells:	Must be <1> for I2C device address.
> -- #size-cells:		Must be <0> as I2C addresses have no size component.
> -
> -Optional property:
> -- clock-frequency:	Desired I2C bus clock frequency in Hz.
> -			When missing default to 100000Hz.
> -
> -Child nodes should conform to I2C bus binding as described in i2c.txt.
> -
> -Qualcomm Technologies Inc. GENI Serial Engine based UART Controller
> -
> -Required properties:
> -- compatible:		Must be "qcom,geni-debug-uart" or "qcom,geni-uart".
> -- reg: 			Must contain UART register location and length.
> -- interrupts: 		Must contain UART core interrupts.
> -- clock-names:		Must contain "se".
> -- clocks:		Serial engine core clock needed by the device.
> -
> -Qualcomm Technologies Inc. GENI Serial Engine based SPI Controller
> -node binding is described in
> -Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.txt.
> -
> -Example:
> -	geniqup@8c0000 {
> -		compatible = "qcom,geni-se-qup";
> -		reg = <0x8c0000 0x6000>;
> -		clock-names = "m-ahb", "s-ahb";
> -		clocks = <&clock_gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
> -			<&clock_gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		ranges;
> -
> -		i2c0: i2c@a94000 {
> -			compatible = "qcom,geni-i2c";
> -			reg = <0xa94000 0x4000>;
> -			interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
> -			clock-names = "se";
> -			clocks = <&clock_gcc GCC_QUPV3_WRAP0_S5_CLK>;
> -			pinctrl-names = "default", "sleep";
> -			pinctrl-0 = <&qup_1_i2c_5_active>;
> -			pinctrl-1 = <&qup_1_i2c_5_sleep>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -		};
> -
> -		uart0: serial@a88000 {
> -			compatible = "qcom,geni-debug-uart";
> -			reg = <0xa88000 0x7000>;
> -			interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
> -			clock-names = "se";
> -			clocks = <&clock_gcc GCC_QUPV3_WRAP0_S0_CLK>;
> -			pinctrl-names = "default", "sleep";
> -			pinctrl-0 = <&qup_1_uart_3_active>;
> -			pinctrl-1 = <&qup_1_uart_3_sleep>;
> -		};
> -
> -	}
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
> new file mode 100644
> index 0000000..5ba0e0e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
> @@ -0,0 +1,197 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: GENI Serial Engine QUP Wrapper Controller
> +
> +maintainers:
> + - Mukesh Savaliya <msavaliy@codeaurora.org>
> + - Akash Asthana <akashast@codeaurora.org>
> +
> +description: |
> + Generic Interface (GENI) based Qualcomm Universal Peripheral (QUP) wrapper
> + is a programmable module for supporting a wide range of serial interfaces
> + like UART, SPI, I2C, I3C, etc. A single QUP module can provide upto 8 Serial
> + Interfaces, using its internal Serial Engines. The GENI Serial Engine QUP
> + Wrapper controller is modeled as a node with zero or more child nodes each
> + representing a serial engine.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,geni-se-qup
> +
> +  reg:
> +    description: QUP wrapper common register address and length.
> +
> +  clock-names:
> +    items:
> +      - const: m-ahb
> +      - const: s-ahb
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 2
> +    items:
> +      - description: Master AHB Clock
> +      - description: Slave AHB Clock
> +
> +  "#address-cells":
> +     const: 2
> +
> +  "#size-cells":
> +     const: 2
> +
> +  ranges: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +patternProperties:
> +  "[i2c|spi]@[0-9]+$":

You'll need to split this so you can a add $ref to SPI and I2C 
controller schemas.

For example:

allOf:
  - $ref: /spi/spi-controller.yaml#


Though you could have 1 pattern that matches everything common and then 
ones for I2C, SPI, etc.


> +    type: object
> +    description: GENI Serial Engine based I2C and SPI Controller.
> +                 SPI in master mode supports up to 50MHz, up to four chip
> +                 selects, programmable data path from 4 bits to 32 bits and
> +                 numerous protocol variants.
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - qcom,geni-i2c
> +          - qcom,geni-spi
> +
> +      reg:
> +        description: GENI Serial Engine register address and length.

Number of reg entries? Needs a 'maxItems: 1' or a list of the entries.

> +
> +      interrupts:
> +        maxItems: 1
> +
> +      clock-names:
> +        const: se
> +
> +      clocks:
> +        description: Serial engine core clock needed by the device.
> +        maxItems: 1
> +
> +      "#address-cells":
> +         const: 1
> +
> +      "#size-cells":
> +         const: 0
> +
> +      clock-frequency:
> +        description: Desired I2C bus clock frequency in Hz.
> +        default: 100000
> +
> +    required:
> +      - compatible
> +      - reg
> +      - interrupts
> +      - clock-names
> +      - clocks
> +      - "#address-cells"
> +      - "#size-cells"
> +
> +  "serial@[0-9]+$":

unit-address is hex.

> +    type: object
> +    description: GENI Serial Engine based UART Controller.
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - qcom,geni-uart
> +          - qcom,geni-debug-uart
> +
> +      reg:
> +        description: GENI Serial Engine register address and length.

Number of reg entries?

> +
> +      interrupts:
> +        minItems: 1
> +        maxItems: 2
> +        items:
> +          - description: UART core irq
> +          - description: Wakeup irq (RX GPIO)
> +
> +      clock-names:
> +        const: se
> +
> +      clocks:
> +        description: Serial engine core clock needed by the device.
> +        maxItems: 1
> +
> +    required:
> +      - compatible
> +      - reg
> +      - interrupts
> +      - clock-names
> +      - clocks
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc: soc@0 {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        qupv3_id_0: geniqup@8c0000 {
> +            compatible = "qcom,geni-se-qup";
> +            reg = <0 0x008c0000 0 0x6000>;
> +            clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
> +                <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +            ranges;
> +            status = "disabled";

Don't show status in examples.

Why is the example changed? I don't really want to review it again.

> +
> +            i2c0: i2c@880000 {
> +                compatible = "qcom,geni-i2c";
> +                reg = <0 0x00880000 0 0x4000>;
> +                clock-names = "se";
> +                clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
> +                pinctrl-names = "default";
> +                pinctrl-0 = <&qup_i2c0_default>;
> +                interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                status = "disabled";
> +            };
> +
> +            spi0: spi@880000 {

Overlapping addresses are a problem unless these are all enable only 1 
at a time. The original example didn't have this issue.

> +                compatible = "qcom,geni-spi";
> +                reg = <0 0x00880000 0 0x4000>;
> +                clock-names = "se";
> +                clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
> +                pinctrl-names = "default";
> +                pinctrl-0 = <&qup_spi0_default>;
> +                interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                status = "disabled";
> +            };
> +
> +            uart0: serial@880000 {
> +                compatible = "qcom,geni-uart";
> +                reg = <0 0x00880000 0 0x4000>;
> +                clock-names = "se";
> +                clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
> +                pinctrl-names = "default";
> +                pinctrl-0 = <&qup_uart0_default>;
> +                interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
> +                status = "disabled";
> +            };
> +        };
> +    };
> +
> +...
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
> 
