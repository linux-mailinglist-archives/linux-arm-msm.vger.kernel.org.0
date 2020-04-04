Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4014919E69F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2020 19:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbgDDRRE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Apr 2020 13:17:04 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:33432 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbgDDRRE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Apr 2020 13:17:04 -0400
Received: by mail-io1-f67.google.com with SMTP id o127so11130301iof.0;
        Sat, 04 Apr 2020 10:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LbvmpO8/bPCuPHRYyiVH18tDMFLwI93Ii9fpZRHXa24=;
        b=ReT+lp7J0yRDoeB5Fc6+sosj5kigItmmvilMvz/otfDzISJVpLNTytcv2xQVns1um8
         3OWe5v+1HXVA7suEN8Pt/UCNgoxfLQ8eqveDQxV+Pc8K1LWPdHIntL4LIcAYRwSxp8fN
         X1ZcyD98IkD4PSqMI3b60AK/aaG7zkBcTxoRRiAJgU+YZKqFR24AVFkOm77J2/T3fbek
         v3N9aW6ldrKBgzFXHWDDG1VGphjTZ2fgIK0RYWyHIwrfAmZa5fMeuuU8dLuTPGKPjaHo
         m/104JG5JURV25h0EP6m9LwjaW1HRouXVfXh0wn+9E84cqgeFMBU++tWoJdmIg6iVhzf
         hOtQ==
X-Gm-Message-State: AGi0PuY7JtHmIFh25HRkVi0mogmgFvt46kw0ICaYwA7iGb6KhRY63uDf
        gK9NehIyEK8FH5AwmROqxQ==
X-Google-Smtp-Source: APiQypLFu5Hc0JAC3bpktegAn7G91KQCfoP4OvP8MY4BArxOHkzgelADg0pN6T66oqTT+a47UjxOEg==
X-Received: by 2002:a5d:894a:: with SMTP id b10mr12955179iot.38.1586020622686;
        Sat, 04 Apr 2020 10:17:02 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id v11sm4005446ilk.68.2020.04.04.10.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:17:01 -0700 (PDT)
Received: (nullmailer pid 22176 invoked by uid 1000);
        Sat, 04 Apr 2020 17:17:00 -0000
Date:   Sat, 4 Apr 2020 11:17:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: qcom,dwc3: Convert USB DWC3
 bindings
Message-ID: <20200404171700.GA10096@bogus>
References: <1585206368-685-1-git-send-email-sanm@codeaurora.org>
 <1585206368-685-2-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585206368-685-2-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 26, 2020 at 12:36:07PM +0530, Sandeep Maheswaram wrote:
> Convert USB DWC3 bindings to DT schema format using json-schema.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  .../devicetree/bindings/usb/qcom,dwc3.txt          | 104 --------------
>  .../devicetree/bindings/usb/qcom,dwc3.yaml         | 158 +++++++++++++++++++++
>  2 files changed, 158 insertions(+), 104 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/qcom,dwc3.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml


> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> new file mode 100644
> index 0000000..0f69475
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -0,0 +1,158 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SuperSpeed DWC3 USB SoC controller
> +
> +maintainers:
> +  - Manu Gautam <mgautam@codeaurora.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qcom,msm8996-dwc3
> +          - qcom,msm8998-dwc3
> +          - qcom,sdm845-dwc3
> +      - const: qcom,dwc3
> +
> +  reg:
> +    description: Offset and length of register set for QSCRATCH wrapper
> +    maxItems: 1
> +
> +  "#address-cells":
> +    enum: [ 1, 2 ]
> +
> +  "#size-cells":
> +    enum: [ 1, 2 ]
> +
> +  power-domains:
> +    description: specifies a phandle to PM domain provider node
> +    maxItems: 1
> +
> +  clocks:
> +    description:
> +      A list of phandle and clock-specifier pairs for the clocks
> +      listed in clock-names.
> +    items:
> +      - description: System Config NOC clock.
> +      - description: Master/Core clock, has to be >= 125 MHz
> +          for SS operation and >= 60MHz for HS operation.
> +      - description: System bus AXI clock.
> +      - description: Mock utmi clock needed for ITP/SOF generation
> +          in host mode. Its frequency should be 19.2MHz.
> +      - description: Sleep clock, used for wakeup when
> +          USB3 core goes into low power mode (U3).
> +
> +  clock-names:
> +    items:
> +      - const: cfg_noc
> +      - const: core
> +      - const: iface
> +      - const: mock_utmi
> +      - const: sleep
> +
> +  assigned-clocks:
> +    items:
> +      - description: Phandle and clock specifier of MOCK_UTMI_CLK.
> +      - description: Phandle and clock specifoer of MASTER_CLK.
> +
> +  assigned-clock-rates:
> +    maxItems: 2

Need to drop this as it is redundant. Soon this will generate an error.

> +    items:
> +      - description: Must be 19.2MHz (19200000).

Sounds like a constraint:

- const: 19200000

> +      - description: Must be >= 60 MHz in HS mode, >= 125 MHz in SS mode.

- minimum: 60000000
  maximum: ?

> +
> +  resets:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: The interrupt that is asserted
> +          when a wakeup event is received on USB2 bus.
> +      - description: The interrupt that is asserted
> +          when a wakeup event is received on USB3 bus.
> +      - description: Wakeup event on DM line.
> +      - description: Wakeup event on DP line.
> +
> +  interrupt-names:
> +    items:
> +      - const: hs_phy_irq
> +      - const: ss_phy_irq
> +      - const: dm_hs_phy_irq
> +      - const: dp_hs_phy_irq
> +
> +  qcom,select-utmi-as-pipe-clk:
> +    description:
> +      If present, disable USB3 pipe_clk requirement.
> +      Used when dwc3 operates without SSPHY and only
> +      HS/FS/LS modes are supported.
> +    type: boolean
> +
> +# Required child node:
> +
> +patternProperties:
> +  "^dwc3@[0-9a-f]+$":
> +    type: object
> +    description:
> +      A child node must exist to represent the core DWC3 IP block
> +      The content of the node is defined in dwc3.txt.
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - power-domains
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    usb@a6f8800 {
> +        compatible = "qcom,sdm845-dwc3", "qcom,dwc3";
> +        reg = <0 0x0a6f8800 0 0x400>;
> +
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
> +                 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> +                 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
> +                 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +                 <&gcc GCC_USB30_PRIM_SLEEP_CLK>;
> +        clock-names = "cfg_noc", "core", "iface", "mock_utmi",
> +                      "sleep";
> +
> +        assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +                          <&gcc GCC_USB30_PRIM_MASTER_CLK>;
> +        assigned-clock-rates = <19200000>, <150000000>;
> +
> +        interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "hs_phy_irq", "ss_phy_irq",
> +                          "dm_hs_phy_irq", "dp_hs_phy_irq";
> +
> +        power-domains = <&gcc USB30_PRIM_GDSC>;
> +
> +        resets = <&gcc GCC_USB30_PRIM_BCR>;
> +
> +        dwc3@a600000 {
> +            compatible = "snps,dwc3";
> +            reg = <0 0x0a600000 0 0xcd00>;

You need 'ranges' in the parent for this address to be translatable.

> +            interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> +            iommus = <&apps_smmu 0x740 0>;
> +            snps,dis_u2_susphy_quirk;
> +            snps,dis_enblslpm_quirk;
> +            phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
> +            phy-names = "usb2-phy", "usb3-phy";
> +        };
> +    };
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
