Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0F722A3497
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Nov 2020 20:52:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbgKBTwl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 14:52:41 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:35465 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727085AbgKBTwk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 14:52:40 -0500
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 02 Nov 2020 11:52:39 -0800
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg01-sd.qualcomm.com with ESMTP; 02 Nov 2020 11:52:39 -0800
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 11736188E; Mon,  2 Nov 2020 11:52:39 -0800 (PST)
Date:   Mon, 2 Nov 2020 11:52:39 -0800
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Rob Herring <robh@kernel.org>
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
Message-ID: <20201102195238.GB29492@codeaurora.org>
References: <cover.1603402280.git.gurus@codeaurora.org>
 <b224632c03055a92022edb5929f22f26db66bc6d.1603402280.git.gurus@codeaurora.org>
 <20201030154900.GA3896697@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201030154900.GA3896697@bogus>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 30, 2020 at 10:49:00AM -0500, Rob Herring wrote:
> On Thu, Oct 22, 2020 at 02:35:41PM -0700, Guru Das Srinagesh wrote:
> > Add device tree bindings for the driver for Qualcomm Technology Inc.'s
> > PM8008 MFD PMIC.
> > 
> > Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> > ---
> >  .../bindings/mfd/qcom,pm8008-irqchip.yaml          | 102 +++++++++++++++++++++
> >  1 file changed, 102 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/qcom,pm8008-irqchip.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008-irqchip.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008-irqchip.yaml
> > new file mode 100644
> > index 0000000..31d7b68
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008-irqchip.yaml
> > @@ -0,0 +1,102 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/qcom,pm8008-irqchip.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Technologies, Inc. PM8008 Multi-Function Device PMIC
> > +
> > +maintainers:
> > +  - Guru Das Srinagesh <gurus@codeaurora.org>
> > +
> > +description: |
> > +  PM8008 is a PMIC that contains 7 LDOs, 2 GPIOs, temperature monitoring, and
> > +  can be interfaced over I2C.
> 
> No bindings for all those functions? Bindings should be complete.

While pushing out this patchset, I accidentally dropped the "RFC" tag in
the mail subjects. This driver and binding document are meant to be just
an exemplar for how the framework changes would be used, and hence I
felt adding only a single node would suffice for illustration purposes.

> 
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: qcom,pm8008-irqchip
> 
> Why irqchip?

Since the driver's main functions are to register with the regmap-irq
framework and to pass a regmap to the child nodes it populates. Would
"qcom,pm8008-mfd" be more appropriate?

> 
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: pm8008
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  interrupt-controller: true
> > +
> > +  "#address-cells":
> > +    const: 1
> > +    description: Must be specified if child nodes are specified.
> > +
> > +  "#size-cells":
> > +    const: 0
> > +    description: Must be specified if child nodes are specified.
> > +
> > +  "#interrupt-cells":
> > +    const: 2
> > +    description: |
> > +      The first cell is the IRQ number, the second cell is the IRQ trigger flag.
> > +
> > +patternProperties:
> > +  "^.*@[0-9a-f]+$":
> 
> '^.*' can be dropped. That's redundant.

Done.

> 
> > +    type: object
> > +    # Each peripheral in PM8008 must be represented as a child node with an
> > +    # optional label for referencing as phandle elsewhere. This is optional.
> > +    properties:
> > +      compatible:
> > +        description: The compatible string for the peripheral's driver.
> > +
> > +      reg:
> > +        maxItems: 1
> 
> What does the address represent? It's non-standard, so it needs to be 
> defined.

Will add description.

> 
> > +
> > +      interrupts:
> > +        maxItems: 1
> > +
> > +    required:
> > +      - compatible
> > +      - reg
> > +      - interrupts
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - "#interrupt-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    qupv3_se13_i2c {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            pm8008i@8 {
> > +                    compatible = "qcom,pm8008-irqchip";
> > +                    reg = <0x8>;
> > +                    #address-cells = <1>;
> > +                    #size-cells = <0>;
> > +                    interrupt-controller;
> > +                    #interrupt-cells = <2>;
> > +
> > +                    interrupt-names = "pm8008";
> > +                    interrupt-parent = <&tlmm>;
> > +                    interrupts = <32 IRQ_TYPE_EDGE_RISING>;
> > +
> > +                    pm8008_tz: qcom,temp-alarm@2400 {
> 
> Must be documented.
> 
> And don't use vendor prefixes in node names. 

Done.

> 
> > +                            compatible = "qcom,spmi-temp-alarm";
> > +                            reg = <0x2400>;
> > +                            interrupts = <0x5 IRQ_TYPE_EDGE_BOTH>;
> > +                            #thermal-sensor-cells = <0>;
> > +                    };
> > +            };
> > +    };
> > +
> > +...
> > -- 
> > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > a Linux Foundation Collaborative Project
> > 
