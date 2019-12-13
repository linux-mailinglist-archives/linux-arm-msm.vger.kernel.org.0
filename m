Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 853C011ECCB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2019 22:23:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfLMVXQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Dec 2019 16:23:16 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46338 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726613AbfLMVXQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Dec 2019 16:23:16 -0500
Received: by mail-ot1-f66.google.com with SMTP id g18so653745otj.13;
        Fri, 13 Dec 2019 13:23:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jAjnbP9E+RD5UoRsXtiSIaSOR0Q0EAvFIihXZiBJFVY=;
        b=Ulp4TM1o7WXAH5UXSML/Jl0DGJinUPcVFwgnDv9Tib5b5f/b/0tc61M2Tosl76ZOY+
         o/oXp+6zgmVrUSaF5c291tU5ENl3VHqUG3ro3pKuN3YLjmSKU+tESro0T/Fl5h5B5oM8
         nRTAafAYVW9A4ClSSCKxoT5kWGu72xrfTc4ha+pygzwKn84UUsw1OWiYDJcev6mOzKjp
         5TIYzb02cWtlKLkoGRxH7VFjPXAq7BBDec3OPwXY/EWJHOWVce3zdOYH3ISbNTrNfjRW
         RJpohyr9eNZZMzryIZEDENZpBVstLXKsVqjWoFF40WSbnSLgOVUws4iHZwF3ge01zWOt
         fKmw==
X-Gm-Message-State: APjAAAV+f1hd/pd/VXwzFyPiYKpTGjBt6j6XU72KlY6th1MMdrX/hoZF
        ZzklTgtXaQP3pFRv0j92mA==
X-Google-Smtp-Source: APXvYqwbfru9sDzHAGpFLAbdGSGBfO0l8oFip9/AuxJafzXVNk0m2hNSIhZpcC9JSghZZQZ3Tk3S9w==
X-Received: by 2002:a9d:68ca:: with SMTP id i10mr16466550oto.178.1576272194912;
        Fri, 13 Dec 2019 13:23:14 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r84sm3197871oia.43.2019.12.13.13.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 13:23:14 -0800 (PST)
Date:   Fri, 13 Dec 2019 15:23:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-usb@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: usb: qcom,dwc3: Convert USB DWC3
 bindings
Message-ID: <20191213212313.GA21092@bogus>
References: <1574940787-1004-1-git-send-email-sanm@codeaurora.org>
 <1574940787-1004-3-git-send-email-sanm@codeaurora.org>
 <CAD=FV=XApHazpp_Ez8UicvsugRYzfB0Pw+ujNtEsAhCChXv+fw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=XApHazpp_Ez8UicvsugRYzfB0Pw+ujNtEsAhCChXv+fw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 11, 2019 at 02:10:02PM -0800, Doug Anderson wrote:
> Hi,
> 
> This is my first time reviewing a yaml conversion, so if I say
> something that seems wrong it might very well be.  That being said...
> 
> On Thu, Nov 28, 2019 at 3:33 AM Sandeep Maheswaram <sanm@codeaurora.org> wrote:
> >
> > diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > new file mode 100644
> > index 0000000..48ff9c5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > @@ -0,0 +1,155 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm SuperSpeed DWC3 USB SoC controller
> > +
> > +maintainers:
> > +  - Manu Gautam <mgautam@codeaurora.org>
> 
> Really weird that you list him as the maintainer but don't CC him on
> this email.  Is he still the maintainer?
> 
> 
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - qcom,msm8996-dwc3
> > +          - qcom,msm8998-dwc3
> > +          - qcom,sdm845-dwc3
> > +      - const: qcom,dwc3
> > +
> > +  reg:
> > +    description: Offset and length of register set for QSCRATCH wrapper
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    description: specifies a phandle to PM domain provider node
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    description:
> > +      A list of phandle and clock-specifier pairs for the clocks
> > +      listed in clock-names.
> > +    maxItems: 5
> 
> Add: "minItems: 3"
> 
> 
> > +  clock-names:
> > +    maxItems: 5
> 
> Remove "maxItems: 5".  Having maxItems exactly equal to the number of
> items listed is the default.
> 
> Add "minItems: 3"
> 
> 
> > +    items:
> > +    #Master/Core clock, have to be >= 125 MHz for SS operation
> > +    # and >= 60MHz for HS operation
> 
> Rather than add these as comments, I think you can add them as
> descriptions up under the "clocks" section.  Look at
> "Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml" as an
> example.  Then you can also get rid of "maxItems: 5" in the "clocks"
> section".
> 
> 
> > +      - const: core
> > +    #Mock utmi clock needed for ITP/SOF generation in host mode.
> > +    #Its frequency should be 19.2MHz.
> > +      - const: mock_utmi
> > +    #Sleep clock, used for wakeup when USB3 core goes into low power mode (U3).
> > +      - const: sleep
> > +    #Optional:System bus AXI clock.Not present on "qcom,msm8996-dwc3" compatible.
> 
> spaces after a period.  Also: once you move this up to be in the
> "description" of the clock node you can get rid of "Optional:" since
> it will be implied by "minItems: 3".
> 
> 
> > +      - const: iface
> > +    #Optional:System Config NOC clock.Not present on "qcom,msm8996-dwc3" compatible.
> > +      - const: cfg_noc
> > +
> > +  assigned-clocks:
> > +    description:
> > +      Should be MOCK_UTMI_CLK and MASTER_CLK
> > +    maxItems: 2
> 
> Instead, maybe:
> 
> assigned-clocks:
>   items:
>     - description: Phandle to MOCK_UTMI_CLK.
>     - description: Phandle to MASTER_CLK
> 
> 
> > +  assigned-clock-rates:
> > +    description:
> > +      Should be 19.2Mhz (192000000) for MOCK_UTMI_CLK
> > +      >=125Mhz (125000000) for MASTER_CLK in SS mode
> > +      >=60Mhz (60000000) for MASTER_CLK in HS mode
> > +    maxItems: 2
> 
> not new for your patch, but nit that "Mhz" should be "MHz".  Also,
> maybe the above can be expressed by:
> 
> assigned-clock-rates:
>   items:
>     - const: 192000000
>       $ref: "/schemas/types.yaml#/definitions/uint32"

Don't need a type here. You can assume common properties have a type 
defined already. Note that the $ref would have to be under an 'allOf' or 
else const is ignored. But this sillyness in json-schema changes in 
draft8, so soon you can forget what I just said.

>     - oneOf:
>         # If SS mode
>         - minimum: 125000000
>           $ref: "/schemas/types.yaml#/definitions/uint32"
>         # If HS mode
>        - minimum: 60000000
>          $ref: "/schemas/types.yaml#/definitions/uint32"
> 
> ...it's a little silly to specify that a number has to be either >= 60
> MHz or >= 125 MHz but I'm not sure how to express it otherwise...

Indeed. Not really any way to handle this, so it's just for 
documentation. I would put a description for each entry.

> 
> > +  resets:
> > +    maxItems: 1
> > +    description: Phandle to reset control that resets core and wrapper.

Pretty generic. Just drop the description.

> > +
> > +  interrupts:
> > +    description:
> > +      specifies interrupts from controller wrapper used
> > +      to wakeup from low power/suspend state.Must contain
> > +      one or more entry for interrupt-names property
> 
> Make the description proper sentences: start with a capital letter,
> include a space after your period, and end with a period.

Needs to define how many and what each one is:

items:
  - description: ...
  - description: ...
> 
> 
> > +  interrupt-names:
> > +    $ref: /schemas/types.yaml#/definitions/string-array

Already has a type, don't need.

> > +    items:
> > +      #The interrupt that is asserted when a wakeup event
> > +      #is received on USB2 bus
> 
> Like "clocks", I think these comments can be moved as "description" in
> the "interrupts" section.

Yes, a per item description.

> > +      - const: hs_phy_irq
> > +      #The interrupt that is asserted when a wakeup event
> > +      #is received on USB3 bus
> > +      - const: ss_phy_irq
> > +      #Separate interrupts for any wakeup event on DM and DP lines
> > +      - const: dm_hs_phy_irq
> > +      - const: dp_hs_phy_irq
> > +
> > +  qcom,select-utmi-as-pipe-clk:
> > +    description:
> > +      if present, disable USB3 pipe_clk requirement.
> > +      Used when dwc3 operates without SSPHY and only
> > +      HS/FS/LS modes are supported.
> 
> Start description with a capital letter?
> 
> 
> > +    type: boolean
> > +
> > +#Required child node:
> > +#A child node must exist to represent the core DWC3 IP block. The name of
> > +#the node is not important. The content of the node is defined in dwc3.txt.
> 
> Probably we should pick a name and list it as a real thing, not just a
> comment.  I think you have "type: object".  So maybe:

Yes.
> 
> patternProperties:
>   "^dwc3@[0-9a-f]+$":
>     type: object
>     description:
>       A child node must exist to represent the core DWC3 IP block
>       The content of the node is defined in dwc3.txt.
> 
> Eventually maybe we can include the "dwc3.yaml" file once it's created?

Yes.

> 
> 
> > +#Phy documentation is provided in the following places:
> > +#Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt   - USB3 QMP PHY
> > +#Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt - USB2 QUSB2 PHY
> 
> Comments usually have a space after the "#".  See example-schema.yaml.
> I wonder if this even needs to be here, though.
> 
> 
> > +required:
> > +  - compatible
> > +  - reg
> > +  - power-domains
> > +  - clocks
> > +  - clock-names
> > +  - assigned-clocks
> > +  - assigned-clock-rates
> 
> If I'm reading the old bindings properly "assigned-clocks" and
> "assigned-clock-rates" were previously not "required".
> 
> 
> 
> > +
> > +examples:
> > +  - |
> > +    hs_phy: phy@100f8800 {
> > +            compatible = "qcom,qusb2-v2-phy";
> > +            ...

This won't compile. Use 'make dt_binding_check'.

> > +        };
> 
> Your indentation for this whole example is off.  The braces don't line
> up properly.
> 
> > +
> > +        ss_phy: phy@100f8830 {
> > +            compatible = "qcom,qmp-v3-usb3-phy";
> > +            ...
> > +        };
> > +
> > +        usb3_0: usb30@a6f8800 {
> > +            compatible = "qcom,dwc3";
> > +            reg = <0xa6f8800 0x400>;
> > +            #address-cells = <1>;
> > +            #size-cells = <1>;
> > +            ranges;
> 
> #address-cells, #size-cells, and ranges are not documented in the
> schema.  Do they need to be?

Yes.

> 
> > +
> > +            interrupts = <0 131 0>, <0 486 0>, <0 488 0>, <0 489 0>;
> > +            interrupt-names = "hs_phy_irq", "ss_phy_irq",
> > +                    "dm_hs_phy_irq", "dp_hs_phy_irq";
> > +
> > +            clocks = <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> > +                     <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> > +                     <&gcc GCC_USB30_PRIM_SLEEP_CLK>;
> > +            clock-names = "core", "mock_utmi", "sleep";
> > +
> > +            assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> > +                              <&gcc GCC_USB30_PRIM_MASTER_CLK>;
> > +            assigned-clock-rates = <19200000>, <133000000>;
> > +
> > +            resets = <&gcc GCC_USB30_PRIM_BCR>;
> > +            reset-names = "core_reset";
> 
> The 'reset-names' property is not in the schema and it doesn't appear
> to be removed.  Remove from the example.
> 
> 
> > +            power-domains = <&gcc USB30_PRIM_GDSC>;
> > +            qcom,select-utmi-as-pipe-clk;
> > +
> > +            dwc3@10000000 {
> > +                compatible = "snps,dwc3";
> > +                reg = <0x10000000 0xcd00>;
> > +                interrupts = <0 205 0x4>;
> > +                phys = <&hs_phy>, <&ss_phy>;
> > +                phy-names = "usb2-phy", "usb3-phy";
> > +                dr_mode = "host";
> > +            };
> > +        };
