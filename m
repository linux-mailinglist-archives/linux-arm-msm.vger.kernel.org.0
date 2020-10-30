Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6631E2A0A3F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 16:49:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbgJ3PtE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 11:49:04 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40576 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726259AbgJ3PtD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 11:49:03 -0400
Received: by mail-ot1-f66.google.com with SMTP id f97so5936435otb.7;
        Fri, 30 Oct 2020 08:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wvhmhQZ595EHWiOyMTrpXxnXiO+S8jr6sziyYhJ7P/c=;
        b=LOWKlbDSa8uW+G9xdGBehYu2pTnIIf2dpIIVl4rsYMharb0K6iXfddxLxZKjg6Sn7B
         acvkBPNJmZMTl4U9Gy4B4jiZcVkX+WyFIMrMqx6IDZP09SMDJFKYQLee0tmKxWJyJyJA
         K1Cew2z3Ze2zcoKPqqktGbw5/K4TFSBv4Pi7Vzcjt1idUEJy0So43NZ8OLGuWuzaFgew
         PrDGfsPSaNnUxjd7aT7hoRm9COUL62eQb4wNtSR6lnBXC2Pn+VPrbADa4iSYjC9YakH+
         T7r/84/DEMN96Xm7AHe/cf852UWfAWhuXVTRccWdqy6LwGdL4erihtKaXdrYH5STMKHr
         y0kg==
X-Gm-Message-State: AOAM5304T2LScT2qH19Wqx+VHgoSQziHH56+a2U4Fg5juVh07zQKrXcq
        InvFzqfi6iMtwSGp7nS7x8XQpZI9OQ==
X-Google-Smtp-Source: ABdhPJzvwtWYSfsAkZsXKE4AQZP7q8bZS1ji8R3rczatLWY+P3gyv4r3JunHxDA269Um0LmsnJSVvw==
X-Received: by 2002:a9d:8e3:: with SMTP id 90mr2193424otf.309.1604072942991;
        Fri, 30 Oct 2020 08:49:02 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y5sm1423510ool.30.2020.10.30.08.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 08:49:02 -0700 (PDT)
Received: (nullmailer pid 3904388 invoked by uid 1000);
        Fri, 30 Oct 2020 15:49:00 -0000
Date:   Fri, 30 Oct 2020 10:49:00 -0500
From:   Rob Herring <robh@kernel.org>
To:     Guru Das Srinagesh <gurus@codeaurora.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Markus Elfring <Markus.Elfring@web.de>,
        Lee Jones <lee.jones@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Joe Perches <joe@perches.com>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: mfd: Add QCOM PM8008 MFD bindings
Message-ID: <20201030154900.GA3896697@bogus>
References: <cover.1603402280.git.gurus@codeaurora.org>
 <b224632c03055a92022edb5929f22f26db66bc6d.1603402280.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b224632c03055a92022edb5929f22f26db66bc6d.1603402280.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 22, 2020 at 02:35:41PM -0700, Guru Das Srinagesh wrote:
> Add device tree bindings for the driver for Qualcomm Technology Inc.'s
> PM8008 MFD PMIC.
> 
> Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> ---
>  .../bindings/mfd/qcom,pm8008-irqchip.yaml          | 102 +++++++++++++++++++++
>  1 file changed, 102 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/qcom,pm8008-irqchip.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008-irqchip.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008-irqchip.yaml
> new file mode 100644
> index 0000000..31d7b68
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008-irqchip.yaml
> @@ -0,0 +1,102 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/qcom,pm8008-irqchip.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. PM8008 Multi-Function Device PMIC
> +
> +maintainers:
> +  - Guru Das Srinagesh <gurus@codeaurora.org>
> +
> +description: |
> +  PM8008 is a PMIC that contains 7 LDOs, 2 GPIOs, temperature monitoring, and
> +  can be interfaced over I2C.

No bindings for all those functions? Bindings should be complete.

> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,pm8008-irqchip

Why irqchip?

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    items:
> +      - const: pm8008
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#address-cells":
> +    const: 1
> +    description: Must be specified if child nodes are specified.
> +
> +  "#size-cells":
> +    const: 0
> +    description: Must be specified if child nodes are specified.
> +
> +  "#interrupt-cells":
> +    const: 2
> +    description: |
> +      The first cell is the IRQ number, the second cell is the IRQ trigger flag.
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":

'^.*' can be dropped. That's redundant.

> +    type: object
> +    # Each peripheral in PM8008 must be represented as a child node with an
> +    # optional label for referencing as phandle elsewhere. This is optional.
> +    properties:
> +      compatible:
> +        description: The compatible string for the peripheral's driver.
> +
> +      reg:
> +        maxItems: 1

What does the address represent? It's non-standard, so it needs to be 
defined.

> +
> +      interrupts:
> +        maxItems: 1
> +
> +    required:
> +      - compatible
> +      - reg
> +      - interrupts
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#interrupt-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    qupv3_se13_i2c {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            pm8008i@8 {
> +                    compatible = "qcom,pm8008-irqchip";
> +                    reg = <0x8>;
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    interrupt-controller;
> +                    #interrupt-cells = <2>;
> +
> +                    interrupt-names = "pm8008";
> +                    interrupt-parent = <&tlmm>;
> +                    interrupts = <32 IRQ_TYPE_EDGE_RISING>;
> +
> +                    pm8008_tz: qcom,temp-alarm@2400 {

Must be documented.

And don't use vendor prefixes in node names. 

> +                            compatible = "qcom,spmi-temp-alarm";
> +                            reg = <0x2400>;
> +                            interrupts = <0x5 IRQ_TYPE_EDGE_BOTH>;
> +                            #thermal-sensor-cells = <0>;
> +                    };
> +            };
> +    };
> +
> +...
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
