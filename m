Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F226111BFA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 23:10:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbfLKWKT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 17:10:19 -0500
Received: from mail-io1-f49.google.com ([209.85.166.49]:41571 "EHLO
        mail-io1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbfLKWKS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 17:10:18 -0500
Received: by mail-io1-f49.google.com with SMTP id c16so479934ioo.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 14:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c/DgPdEIcvo7aTnadeKABBNpooev54ppXStm5BO3aXU=;
        b=C4caIpwXZtBlXDFiKAdSnRs6P5/Sk1QTPSUjoFO9pJAmiyEOMWQUzfGDIbefLk1ppj
         9oO/Y+rJVCKJoLpJjjTLVqhQxbqCVrR+eQ+0m9JX94XkrVtb2qR5ZC8lvwT7qroIpSvX
         +PfU9ePCU5kfZViY/BXDXikFX6FpqIndz1IcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c/DgPdEIcvo7aTnadeKABBNpooev54ppXStm5BO3aXU=;
        b=hGXoBCPUICQbOzKTc91jKlCDmjfuycXsmphCk/JCStuF5s9UaWS2m72RvS0uEj7WWv
         /SzuwpuG9m7UamaT8g60++Bz41it0iLgguwNj3HNxL1SAX5cOFH9nR1abfeRYrxdeHW7
         g8h9grTjuJ05M9gGo8zgA2bs/Hjjb+ln4+9poTlhIqFJB0KEhL8828GyvHzC7/JFHvUE
         F3xEPfWlhdH+O+2MefMuRXjAHkjFAFpZ5FG41+o2WCC4uY9RhSfqEF3/deSHYRt+fpkx
         zbogugFQQHY8ZIPuiEHpEmHW61gMgeEBUYKCDq2E8EIBsCTHEY4nTZ1Ar4baHaDXOOnl
         5+PQ==
X-Gm-Message-State: APjAAAUEdt85THULIqHfcRU0mIeSYrGCIrXlEMZpZBlceGU1o2Bg2d1d
        E/9WtZuD7xo15R0VWDfMQvnB9bElZdg=
X-Google-Smtp-Source: APXvYqyIVSASNFezpG9uDQ8e7PsKU26cc4/BF1PHQoEisZ7CAT75m9l0jxsVV3Vqch+kd+vvQ4SL2A==
X-Received: by 2002:a02:a889:: with SMTP id l9mr5164052jam.1.1576102216506;
        Wed, 11 Dec 2019 14:10:16 -0800 (PST)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com. [209.85.166.174])
        by smtp.gmail.com with ESMTPSA id g26sm624533ioe.9.2019.12.11.14.10.15
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 14:10:15 -0800 (PST)
Received: by mail-il1-f174.google.com with SMTP id r81so260954ilk.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 14:10:15 -0800 (PST)
X-Received: by 2002:a92:d581:: with SMTP id a1mr4935854iln.218.1576102215159;
 Wed, 11 Dec 2019 14:10:15 -0800 (PST)
MIME-Version: 1.0
References: <1574940787-1004-1-git-send-email-sanm@codeaurora.org> <1574940787-1004-3-git-send-email-sanm@codeaurora.org>
In-Reply-To: <1574940787-1004-3-git-send-email-sanm@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 11 Dec 2019 14:10:02 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XApHazpp_Ez8UicvsugRYzfB0Pw+ujNtEsAhCChXv+fw@mail.gmail.com>
Message-ID: <CAD=FV=XApHazpp_Ez8UicvsugRYzfB0Pw+ujNtEsAhCChXv+fw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-usb@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

This is my first time reviewing a yaml conversion, so if I say
something that seems wrong it might very well be.  That being said...

On Thu, Nov 28, 2019 at 3:33 AM Sandeep Maheswaram <sanm@codeaurora.org> wrote:
>
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> new file mode 100644
> index 0000000..48ff9c5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -0,0 +1,155 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SuperSpeed DWC3 USB SoC controller
> +
> +maintainers:
> +  - Manu Gautam <mgautam@codeaurora.org>

Really weird that you list him as the maintainer but don't CC him on
this email.  Is he still the maintainer?


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
> +  power-domains:
> +    description: specifies a phandle to PM domain provider node
> +    maxItems: 1
> +
> +  clocks:
> +    description:
> +      A list of phandle and clock-specifier pairs for the clocks
> +      listed in clock-names.
> +    maxItems: 5

Add: "minItems: 3"


> +  clock-names:
> +    maxItems: 5

Remove "maxItems: 5".  Having maxItems exactly equal to the number of
items listed is the default.

Add "minItems: 3"


> +    items:
> +    #Master/Core clock, have to be >= 125 MHz for SS operation
> +    # and >= 60MHz for HS operation

Rather than add these as comments, I think you can add them as
descriptions up under the "clocks" section.  Look at
"Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml" as an
example.  Then you can also get rid of "maxItems: 5" in the "clocks"
section".


> +      - const: core
> +    #Mock utmi clock needed for ITP/SOF generation in host mode.
> +    #Its frequency should be 19.2MHz.
> +      - const: mock_utmi
> +    #Sleep clock, used for wakeup when USB3 core goes into low power mode (U3).
> +      - const: sleep
> +    #Optional:System bus AXI clock.Not present on "qcom,msm8996-dwc3" compatible.

spaces after a period.  Also: once you move this up to be in the
"description" of the clock node you can get rid of "Optional:" since
it will be implied by "minItems: 3".


> +      - const: iface
> +    #Optional:System Config NOC clock.Not present on "qcom,msm8996-dwc3" compatible.
> +      - const: cfg_noc
> +
> +  assigned-clocks:
> +    description:
> +      Should be MOCK_UTMI_CLK and MASTER_CLK
> +    maxItems: 2

Instead, maybe:

assigned-clocks:
  items:
    - description: Phandle to MOCK_UTMI_CLK.
    - description: Phandle to MASTER_CLK


> +  assigned-clock-rates:
> +    description:
> +      Should be 19.2Mhz (192000000) for MOCK_UTMI_CLK
> +      >=125Mhz (125000000) for MASTER_CLK in SS mode
> +      >=60Mhz (60000000) for MASTER_CLK in HS mode
> +    maxItems: 2

not new for your patch, but nit that "Mhz" should be "MHz".  Also,
maybe the above can be expressed by:

assigned-clock-rates:
  items:
    - const: 192000000
      $ref: "/schemas/types.yaml#/definitions/uint32"
    - oneOf:
        # If SS mode
        - minimum: 125000000
          $ref: "/schemas/types.yaml#/definitions/uint32"
        # If HS mode
       - minimum: 60000000
         $ref: "/schemas/types.yaml#/definitions/uint32"

...it's a little silly to specify that a number has to be either >= 60
MHz or >= 125 MHz but I'm not sure how to express it otherwise...


> +  resets:
> +    maxItems: 1
> +    description: Phandle to reset control that resets core and wrapper.
> +
> +  interrupts:
> +    description:
> +      specifies interrupts from controller wrapper used
> +      to wakeup from low power/suspend state.Must contain
> +      one or more entry for interrupt-names property

Make the description proper sentences: start with a capital letter,
include a space after your period, and end with a period.


> +  interrupt-names:
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    items:
> +      #The interrupt that is asserted when a wakeup event
> +      #is received on USB2 bus

Like "clocks", I think these comments can be moved as "description" in
the "interrupts" section.


> +      - const: hs_phy_irq
> +      #The interrupt that is asserted when a wakeup event
> +      #is received on USB3 bus
> +      - const: ss_phy_irq
> +      #Separate interrupts for any wakeup event on DM and DP lines
> +      - const: dm_hs_phy_irq
> +      - const: dp_hs_phy_irq
> +
> +  qcom,select-utmi-as-pipe-clk:
> +    description:
> +      if present, disable USB3 pipe_clk requirement.
> +      Used when dwc3 operates without SSPHY and only
> +      HS/FS/LS modes are supported.

Start description with a capital letter?


> +    type: boolean
> +
> +#Required child node:
> +#A child node must exist to represent the core DWC3 IP block. The name of
> +#the node is not important. The content of the node is defined in dwc3.txt.

Probably we should pick a name and list it as a real thing, not just a
comment.  I think you have "type: object".  So maybe:

patternProperties:
  "^dwc3@[0-9a-f]+$":
    type: object
    description:
      A child node must exist to represent the core DWC3 IP block
      The content of the node is defined in dwc3.txt.

Eventually maybe we can include the "dwc3.yaml" file once it's created?


> +#Phy documentation is provided in the following places:
> +#Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt   - USB3 QMP PHY
> +#Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt - USB2 QUSB2 PHY

Comments usually have a space after the "#".  See example-schema.yaml.
I wonder if this even needs to be here, though.


> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +  - clocks
> +  - clock-names
> +  - assigned-clocks
> +  - assigned-clock-rates

If I'm reading the old bindings properly "assigned-clocks" and
"assigned-clock-rates" were previously not "required".



> +
> +examples:
> +  - |
> +    hs_phy: phy@100f8800 {
> +            compatible = "qcom,qusb2-v2-phy";
> +            ...
> +        };

Your indentation for this whole example is off.  The braces don't line
up properly.

> +
> +        ss_phy: phy@100f8830 {
> +            compatible = "qcom,qmp-v3-usb3-phy";
> +            ...
> +        };
> +
> +        usb3_0: usb30@a6f8800 {
> +            compatible = "qcom,dwc3";
> +            reg = <0xa6f8800 0x400>;
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +            ranges;

#address-cells, #size-cells, and ranges are not documented in the
schema.  Do they need to be?

> +
> +            interrupts = <0 131 0>, <0 486 0>, <0 488 0>, <0 489 0>;
> +            interrupt-names = "hs_phy_irq", "ss_phy_irq",
> +                    "dm_hs_phy_irq", "dp_hs_phy_irq";
> +
> +            clocks = <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> +                     <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +                     <&gcc GCC_USB30_PRIM_SLEEP_CLK>;
> +            clock-names = "core", "mock_utmi", "sleep";
> +
> +            assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +                              <&gcc GCC_USB30_PRIM_MASTER_CLK>;
> +            assigned-clock-rates = <19200000>, <133000000>;
> +
> +            resets = <&gcc GCC_USB30_PRIM_BCR>;
> +            reset-names = "core_reset";

The 'reset-names' property is not in the schema and it doesn't appear
to be removed.  Remove from the example.


> +            power-domains = <&gcc USB30_PRIM_GDSC>;
> +            qcom,select-utmi-as-pipe-clk;
> +
> +            dwc3@10000000 {
> +                compatible = "snps,dwc3";
> +                reg = <0x10000000 0xcd00>;
> +                interrupts = <0 205 0x4>;
> +                phys = <&hs_phy>, <&ss_phy>;
> +                phy-names = "usb2-phy", "usb3-phy";
> +                dr_mode = "host";
> +            };
> +        };

-Doug

On Thu, Nov 28, 2019 at 3:33 AM Sandeep Maheswaram <sanm@codeaurora.org> wrote:
>
> Convert USB DWC3 bindings to DT schema format using json-schema.
>
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  .../devicetree/bindings/usb/qcom,dwc3.txt          | 104 --------------
>  .../devicetree/bindings/usb/qcom,dwc3.yaml         | 155 +++++++++++++++++++++
>  2 files changed, 155 insertions(+), 104 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/qcom,dwc3.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
>
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
> deleted file mode 100644
> index cb695aa..0000000
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
> +++ /dev/null
> @@ -1,104 +0,0 @@
> -Qualcomm SuperSpeed DWC3 USB SoC controller
> -
> -Required properties:
> -- compatible:          Compatible list, contains
> -                       "qcom,dwc3"
> -                       "qcom,msm8996-dwc3" for msm8996 SOC.
> -                       "qcom,msm8998-dwc3" for msm8998 SOC.
> -                       "qcom,sdm845-dwc3" for sdm845 SOC.
> -- reg:                 Offset and length of register set for QSCRATCH wrapper
> -- power-domains:       specifies a phandle to PM domain provider node
> -- clocks:              A list of phandle + clock-specifier pairs for the
> -                               clocks listed in clock-names
> -- clock-names:         Should contain the following:
> -  "core"               Master/Core clock, have to be >= 125 MHz for SS
> -                               operation and >= 60MHz for HS operation
> -  "mock_utmi"          Mock utmi clock needed for ITP/SOF generation in
> -                               host mode. Its frequency should be 19.2MHz.
> -  "sleep"              Sleep clock, used for wakeup when USB3 core goes
> -                               into low power mode (U3).
> -
> -Optional clocks:
> -  "iface"              System bus AXI clock.
> -                       Not present on "qcom,msm8996-dwc3" compatible.
> -  "cfg_noc"            System Config NOC clock.
> -                       Not present on "qcom,msm8996-dwc3" compatible.
> -- assigned-clocks:     Should be:
> -                               MOCK_UTMI_CLK
> -                               MASTER_CLK
> -- assigned-clock-rates: Should be:
> -                                19.2Mhz (192000000) for MOCK_UTMI_CLK
> -                                >=125Mhz (125000000) for MASTER_CLK in SS mode
> -                                >=60Mhz (60000000) for MASTER_CLK in HS mode
> -
> -Optional properties:
> -- resets:              Phandle to reset control that resets core and wrapper.
> -- interrupts:          specifies interrupts from controller wrapper used
> -                       to wakeup from low power/susepnd state. Must contain
> -                       one or more entry for interrupt-names property
> -- interrupt-names:     Must include the following entries:
> -                       - "hs_phy_irq": The interrupt that is asserted when a
> -                          wakeup event is received on USB2 bus
> -                       - "ss_phy_irq": The interrupt that is asserted when a
> -                          wakeup event is received on USB3 bus
> -                       - "dm_hs_phy_irq" and "dp_hs_phy_irq": Separate
> -                          interrupts for any wakeup event on DM and DP lines
> -- qcom,select-utmi-as-pipe-clk: if present, disable USB3 pipe_clk requirement.
> -                               Used when dwc3 operates without SSPHY and only
> -                               HS/FS/LS modes are supported.
> -
> -Required child node:
> -A child node must exist to represent the core DWC3 IP block. The name of
> -the node is not important. The content of the node is defined in dwc3.txt.
> -
> -Phy documentation is provided in the following places:
> -Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt   - USB3 QMP PHY
> -Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt - USB2 QUSB2 PHY
> -
> -Example device nodes:
> -
> -               hs_phy: phy@100f8800 {
> -                       compatible = "qcom,qusb2-v2-phy";
> -                       ...
> -               };
> -
> -               ss_phy: phy@100f8830 {
> -                       compatible = "qcom,qmp-v3-usb3-phy";
> -                       ...
> -               };
> -
> -               usb3_0: usb30@a6f8800 {
> -                       compatible = "qcom,dwc3";
> -                       reg = <0xa6f8800 0x400>;
> -                       #address-cells = <1>;
> -                       #size-cells = <1>;
> -                       ranges;
> -
> -                       interrupts = <0 131 0>, <0 486 0>, <0 488 0>, <0 489 0>;
> -                       interrupt-names = "hs_phy_irq", "ss_phy_irq",
> -                                 "dm_hs_phy_irq", "dp_hs_phy_irq";
> -
> -                       clocks = <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> -                               <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> -                               <&gcc GCC_USB30_PRIM_SLEEP_CLK>;
> -                       clock-names = "core", "mock_utmi", "sleep";
> -
> -                       assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> -                                         <&gcc GCC_USB30_PRIM_MASTER_CLK>;
> -                       assigned-clock-rates = <19200000>, <133000000>;
> -
> -                       resets = <&gcc GCC_USB30_PRIM_BCR>;
> -                       reset-names = "core_reset";
> -                       power-domains = <&gcc USB30_PRIM_GDSC>;
> -                       qcom,select-utmi-as-pipe-clk;
> -
> -                       dwc3@10000000 {
> -                               compatible = "snps,dwc3";
> -                               reg = <0x10000000 0xcd00>;
> -                               interrupts = <0 205 0x4>;
> -                               phys = <&hs_phy>, <&ss_phy>;
> -                               phy-names = "usb2-phy", "usb3-phy";
> -                               dr_mode = "host";
> -                       };
> -               };
> -
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> new file mode 100644
> index 0000000..48ff9c5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -0,0 +1,155 @@
> +# SPDX-License-Identifier: GPL-2.0-only
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
> +  power-domains:
> +    description: specifies a phandle to PM domain provider node
> +    maxItems: 1
> +
> +  clocks:
> +    description:
> +      A list of phandle and clock-specifier pairs for the clocks
> +      listed in clock-names.
> +    maxItems: 5
> +
> +  clock-names:
> +    maxItems: 5
> +    items:
> +    #Master/Core clock, have to be >= 125 MHz for SS operation
> +    # and >= 60MHz for HS operation
> +      - const: core
> +    #Mock utmi clock needed for ITP/SOF generation in host mode.
> +    #Its frequency should be 19.2MHz.
> +      - const: mock_utmi
> +    #Sleep clock, used for wakeup when USB3 core goes into low power mode (U3).
> +      - const: sleep
> +    #Optional:System bus AXI clock.Not present on "qcom,msm8996-dwc3" compatible.
> +      - const: iface
> +    #Optional:System Config NOC clock.Not present on "qcom,msm8996-dwc3" compatible.
> +      - const: cfg_noc
> +
> +  assigned-clocks:
> +    description:
> +      Should be MOCK_UTMI_CLK and MASTER_CLK
> +    maxItems: 2
> +
> +  assigned-clock-rates:
> +    description:
> +      Should be 19.2Mhz (192000000) for MOCK_UTMI_CLK
> +      >=125Mhz (125000000) for MASTER_CLK in SS mode
> +      >=60Mhz (60000000) for MASTER_CLK in HS mode
> +    maxItems: 2
> +
> +  resets:
> +    maxItems: 1
> +    description: Phandle to reset control that resets core and wrapper.
> +
> +  interrupts:
> +    description:
> +      specifies interrupts from controller wrapper used
> +      to wakeup from low power/suspend state.Must contain
> +      one or more entry for interrupt-names property
> +
> +  interrupt-names:
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    items:
> +      #The interrupt that is asserted when a wakeup event
> +      #is received on USB2 bus
> +      - const: hs_phy_irq
> +      #The interrupt that is asserted when a wakeup event
> +      #is received on USB3 bus
> +      - const: ss_phy_irq
> +      #Separate interrupts for any wakeup event on DM and DP lines
> +      - const: dm_hs_phy_irq
> +      - const: dp_hs_phy_irq
> +
> +  qcom,select-utmi-as-pipe-clk:
> +    description:
> +      if present, disable USB3 pipe_clk requirement.
> +      Used when dwc3 operates without SSPHY and only
> +      HS/FS/LS modes are supported.
> +    type: boolean
> +
> +#Required child node:
> +#A child node must exist to represent the core DWC3 IP block. The name of
> +#the node is not important. The content of the node is defined in dwc3.txt.
> +
> +#Phy documentation is provided in the following places:
> +#Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt   - USB3 QMP PHY
> +#Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt - USB2 QUSB2 PHY
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +  - clocks
> +  - clock-names
> +  - assigned-clocks
> +  - assigned-clock-rates
> +
> +examples:
> +  - |
> +    hs_phy: phy@100f8800 {
> +            compatible = "qcom,qusb2-v2-phy";
> +            ...
> +        };
> +
> +        ss_phy: phy@100f8830 {
> +            compatible = "qcom,qmp-v3-usb3-phy";
> +            ...
> +        };
> +
> +        usb3_0: usb30@a6f8800 {
> +            compatible = "qcom,dwc3";
> +            reg = <0xa6f8800 0x400>;
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +            ranges;
> +
> +            interrupts = <0 131 0>, <0 486 0>, <0 488 0>, <0 489 0>;
> +            interrupt-names = "hs_phy_irq", "ss_phy_irq",
> +                    "dm_hs_phy_irq", "dp_hs_phy_irq";
> +
> +            clocks = <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> +                     <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +                     <&gcc GCC_USB30_PRIM_SLEEP_CLK>;
> +            clock-names = "core", "mock_utmi", "sleep";
> +
> +            assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +                              <&gcc GCC_USB30_PRIM_MASTER_CLK>;
> +            assigned-clock-rates = <19200000>, <133000000>;
> +
> +            resets = <&gcc GCC_USB30_PRIM_BCR>;
> +            reset-names = "core_reset";
> +            power-domains = <&gcc USB30_PRIM_GDSC>;
> +            qcom,select-utmi-as-pipe-clk;
> +
> +            dwc3@10000000 {
> +                compatible = "snps,dwc3";
> +                reg = <0x10000000 0xcd00>;
> +                interrupts = <0 205 0x4>;
> +                phys = <&hs_phy>, <&ss_phy>;
> +                phy-names = "usb2-phy", "usb3-phy";
> +                dr_mode = "host";
> +            };
> +        };
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
