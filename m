Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF432477F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Aug 2020 22:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbgHQUMP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 16:12:15 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:42006 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbgHQUMO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 16:12:14 -0400
Received: by mail-io1-f68.google.com with SMTP id g13so4647057ioo.9;
        Mon, 17 Aug 2020 13:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0KN9pnWSWPN3TNn63mBYUI7eFmYWB5gm6o/HN1LD/Z4=;
        b=aptLIwgGh7Qi0aqAHD2FZhNtx1Wap6lq015zU8v+Z929Bin482mSNXu78A3zwBq/Da
         vjqcugv7dJJELhCaGgEY71kMbLYGSswflapFSnVtAko02VnFoAvGMMUMioaP4Q0LCak4
         sW5LCkp9k2wqPVXUCxs2KKxDpsy+hkbbY8P0nZM4izMPPy0IGKlV+zuogcmtKhvA7xCc
         YKNDLQIypFiX6KeaGuhYQX21jRTvrEvfF1YPd6+fNykuixXYd8qc0pxCgNze2X0xV7Ow
         o0w7wwSyWMxxbAzajg3NoVQrxm14+DdSkd8YWgJtCXMneXLn7Iv+p3p8kWq7z0UekscC
         /+pQ==
X-Gm-Message-State: AOAM5304Igjr4v7DnJzTUgrY9r2EcgsrXijpVHTSm3CHE4Rod5/DEzPY
        mPiBEWeVNsQH7he0EvpOsw==
X-Google-Smtp-Source: ABdhPJx6sxqFMzHTHNd2YmNJMJukFU9VZh8132ZWtZuuKqLG9Le5cnZdc/YVhE8Fqul4icjSphmHXw==
X-Received: by 2002:a6b:7e41:: with SMTP id k1mr13614393ioq.130.1597695132782;
        Mon, 17 Aug 2020 13:12:12 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id d3sm9924704ils.25.2020.08.17.13.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 13:12:12 -0700 (PDT)
Received: (nullmailer pid 1472732 invoked by uid 1000);
        Mon, 17 Aug 2020 20:12:11 -0000
Date:   Mon, 17 Aug 2020 14:12:11 -0600
From:   Rob Herring <robh@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 43/44] dt: document HiSilicon SPMI controller and
 mfd/regulator properties
Message-ID: <20200817201211.GA1437827@bogus>
References: <cover.1597647359.git.mchehab+huawei@kernel.org>
 <2f88fed96d67b05fc033356fdbb7e3227955ab34.1597647359.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f88fed96d67b05fc033356fdbb7e3227955ab34.1597647359.git.mchehab+huawei@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 17, 2020 at 09:11:02AM +0200, Mauro Carvalho Chehab wrote:
> Add documentation for the properties needed by the HiSilicon
> 6421v600 driver, and by the SPMI controller used to access
> the chipset.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../mfd/hisilicon,hi6421-spmi-pmic.yaml       | 182 ++++++++++++++++++
>  .../spmi/hisilicon,hisi-spmi-controller.yaml  |  54 ++++++
>  2 files changed, 236 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
>  create mode 100644 Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
> new file mode 100644
> index 000000000000..95494114554d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
> @@ -0,0 +1,182 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/hisilicon,hi6421-spmi-pmic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: HiSilicon 6421v600 SPMI PMIC
> +
> +maintainers:
> +  - Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> +
> +description: |
> +  HiSilicon 6421v600 uses a MIPI System Power Management (SPMI) bus in order
> +  to provide interrupts and power supply.
> +
> +  The GPIO and interrupt settings are represented as part of the top-level PMIC
> +  node.
> +
> +  The SPMI controller part is provided by
> +  Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml.
> +
> +properties:
> +  $nodename:
> +    pattern: "pmic@[0-9a-f]"
> +
> +  compatible:
> +    const: hisilicon,hi6421-spmi-pmic

-spmi-pmic is redundant. Can the hi6421 be anything else?

> +
> +  reg:
> +    maxItems: 1
> +
> +  spmi-channel:
> +    description: number of the SPMI channel where the PMIC is connected

This looks like a common (to SPMI), but it's not something defined in 
spmi.txt (which should ideally be converted to schema first). Minimally, 
it needs a better explanation and determination if it should be common 
or is HiSilicon specific.

> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  interrupt-controller:
> +    description:
> +      Identify that the PMIC is capable of behaving as an interrupt controller.

No need to redefine common properties if nothing specific to this device 
to say. Just:

interrupt-controller: true

> +
> +  gpios:
> +    maxItems: 1
> +
> +  irq-num:
> +    description: Interrupt request number
> +
> +  'irq-array':
> +    description: Interrupt request array
> +
> +  'irq-mask-addr':
> +    description: Address for the interrupt request mask
> +
> +  'irq-addr':
> +    description: Address for the interrupt request

What's all these non-standard interrupt properties?

> +
> +  regulators:
> +    type: object

additionalProperties: false

> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      '^ldo@[0-9]+$':

Unit-addresses are hex.

Also, doesn't match the example.

> +        type: object
> +
> +        $ref: "/schemas/regulator/regulator.yaml#"
> +
> +        properties:
> +          reg:
> +            description: Enable register.
> +

> +          '#address-cells':
> +            const: 1
> +
> +          '#size-cells':
> +            const: 0

No child nodes, you don't need these.

> +
> +          vsel-reg:
> +            description: Voltage selector register.

'reg' can have multiple entries if you want.

> +
> +          enable-mask:
> +            description: Bitmask used to enable the regulator.

But if there's a shared enable reg, then you shouldn't have duplicate 
addresses (same 'reg' value in multiple nodes).

These perhaps should be driver data rather than in DT as it's all fixed 
for this chip. We don't try to parameterize everything in DT.

> +
> +          voltage-table:
> +            description: Table with the selector items for the voltage regulator.
> +            minItems: 2
> +            maxItems: 16

Needs a type $ref.

> +
> +          off-on-delay-us:
> +            description: Time required for changing state to enabled in microseconds.
> +
> +          startup-delay-us:
> +            description: Startup time in microseconds.
> +
> +          idle-mode-mask:
> +            description: Bitmask used to put the regulator on idle mode.
> +
> +          eco-microamp:
> +            description: Maximum current while on idle mode.
> +
> +        required:
> +          - reg
> +          - vsel-reg
> +          - enable-mask
> +          - voltage-table
> +          - off-on-delay-us
> +          - startup-delay-us
> +
> +required:
> +  - compatible
> +  - reg
> +  - regulators

Add:

additionalProperties: false

> +
> +examples:
> +  - |
> +    /* pmic properties */
> +
> +    pmic: pmic@0 {
> +      compatible = "hisilicon,hi6421-spmi-pmic";
> +      slave_id = <0>;

Not documented. I believe this is part of 'reg'.

> +      reg = <0 0>;
> +
> +      #interrupt-cells = <2>;
> +      interrupt-controller;
> +      gpios = <&gpio28 0 0>;
> +      irq-num = <16>;
> +      irq-array = <2>;
> +      irq-mask-addr = <0x202 2>;
> +      irq-addr = <0x212 2>;
> +
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      regulators {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +        ldo3: ldo3@16 {
> +          reg = <0x16>;
> +          vsel-reg = <0x51>;
> +
> +          regulator-name = "ldo3";
> +          regulator-min-microvolt = <1500000>;
> +          regulator-max-microvolt = <2000000>;
> +          regulator-boot-on;
> +
> +          enable-mask = <0x01>;
> +
> +          voltage-table = <1500000>, <1550000>, <1600000>, <1650000>,
> +                          <1700000>, <1725000>, <1750000>, <1775000>,
> +                          <1800000>, <1825000>, <1850000>, <1875000>,
> +                          <1900000>, <1925000>, <1950000>, <2000000>;
> +          off-on-delay-us = <20000>;
> +          startup-delay-us = <120>;
> +        };
> +
> +        ldo4: ldo4@17 { /* 40 PIN */
> +          reg = <0x17>;
> +          vsel-reg = <0x52>;
> +
> +          regulator-name = "ldo4";
> +          regulator-min-microvolt = <1725000>;
> +          regulator-max-microvolt = <1900000>;
> +          regulator-boot-on;
> +
> +          enable-mask = <0x01>;
> +          idle-mode-mask = <0x10>;
> +          eco-microamp = <10000>;
> +
> +          hi6421-vsel = <0x52 0x07>;

Not documented.

> +          voltage-table = <1725000>, <1750000>, <1775000>, <1800000>,
> +                          <1825000>, <1850000>, <1875000>, <1900000>;
> +          off-on-delay-us = <20000>;
> +          startup-delay-us = <120>;
> +        };
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml b/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
> new file mode 100644
> index 000000000000..5aeb2ae12024
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spmi/hisilicon,hisi-spmi-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: HiSilicon SPMI controller
> +
> +maintainers:
> +  - Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> +
> +description: |
> +  The HiSilicon SPMI controller is found on some Kirin-based designs.
> +  It is a MIPI System Power Management (SPMI) controller.
> +
> +  The PMIC part is provided by
> +  Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml.
> +
> +properties:
> +  $nodename:
> +    pattern: "spmi@[0-9a-f]"
> +
> +  compatible:
> +    const: hisilicon,spmi-controller

Needs an SoC specific compatible.

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 0
> +
> +  spmi-channel:
> +    description: number of the SPMI channel where the PMIC is connected
> +
> +patternProperties:
> +  "^pmic@[0-9a-f]$":
> +    $ref: "/schemas/mfd/hisilicon,hi6421-spmi-pmic.yaml#"
> +
> +examples:
> +  - |
> +    spmi: spmi@fff24000 {
> +      compatible = "hisilicon,spmi-controller";
> +      #address-cells = <2>;
> +      #size-cells = <0>;
> +      status = "ok";
> +      reg = <0x0 0xfff24000 0x0 0x1000>;
> +      spmi-channel = <2>;

Does this go in the SPMI controller or child (pmic)?

> +
> +      /* pmic properties */
> +
> +    };
> -- 
> 2.26.2
> 
