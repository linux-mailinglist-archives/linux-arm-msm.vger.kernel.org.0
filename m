Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C9921ED8C0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 00:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726644AbgFCWpQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jun 2020 18:45:16 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:38087 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726441AbgFCWpQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jun 2020 18:45:16 -0400
Received: by mail-io1-f66.google.com with SMTP id d7so4213706ioq.5;
        Wed, 03 Jun 2020 15:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zsf6i3zC9PKQFZobjrF010AF5GrTki1IJEtvwAw0zpg=;
        b=bZFtmivOtX+bf1YU/pxDd/AL1KvBAPFGFCq7cVmA8W5VSEAxKVffXuOfxKOJUOP7I/
         kT+cTR7gUoy+1tFrCGCirA0TfjtzI/z5zQ30rgSBIC/Hvi+OKYnq7st/EP+h8cdKStP+
         s8tEOX8Dn5ZlXDN7Zy/C6S5PZ0wJ9Bt68by5ZrpBYhGjbdiGj7EKqER3Rd31+PQbT7ZP
         txVQI6NjAHT8EYWWKzItDTqoChoHrqMP1ju9Z3D9exG63E3zOcQLcBzdQHQH8Y2fanMA
         K9q4iTsEKrZIsqBcEKR+1s4+zKaE6PkVdCYfkpSYfg2/mAokD743wlPU66g1CR91QnWM
         b1iA==
X-Gm-Message-State: AOAM530uE/uj2TqAm3BAD97sF7H6zaR0dWpI4+08GBqZ2Gjrf9kh3jxy
        nXLD9A7bF2L4YbugEnJK6g==
X-Google-Smtp-Source: ABdhPJxJE/NTUOmlpUVAjGr2nOTs8nT74gYqp/pIh4Ednl6HtoXJUvhGI+4ojZ5kfJLsk0fWxpfpOg==
X-Received: by 2002:a05:6602:2e0e:: with SMTP id o14mr1740345iow.164.1591224312230;
        Wed, 03 Jun 2020 15:45:12 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id g17sm464578ilc.18.2020.06.03.15.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 15:45:11 -0700 (PDT)
Received: (nullmailer pid 2014599 invoked by uid 1000);
        Wed, 03 Jun 2020 22:45:10 -0000
Date:   Wed, 3 Jun 2020 16:45:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krishna Manikandan <mkrishn@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        kalyan_t@codeaurora.org, nganji@codeaurora.org, mka@chromium.org
Subject: Re: [v4] dt-bindings: msm: disp: add yaml schemas for DPU and DSI
 bindings
Message-ID: <20200603224510.GA1978034@bogus>
References: <1589868421-30062-1-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589868421-30062-1-git-send-email-mkrishn@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 19, 2020 at 11:37:01AM +0530, Krishna Manikandan wrote:
> MSM Mobile Display Subsytem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI etc. Add YAML schema
> for the device tree bindings for the same.
> 
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> 
> Changes in v2:
> 	- Changed dpu to DPU (Sam Ravnborg)
> 	- Fixed indentation issues (Sam Ravnborg)
> 	- Added empty line between different properties (Sam Ravnborg)
> 	- Replaced reference txt files with  their corresponding
> 	  yaml files (Sam Ravnborg)
> 	- Modified the file to use "|" only when it is
> 	  necessary (Sam Ravnborg)
> 
> Changes in v3:
> 	- Corrected the license used (Rob Herring)
> 	- Added maxItems for properties (Rob Herring)
> 	- Dropped generic descriptions (Rob Herring)
> 	- Added ranges property (Rob Herring)
> 	- Corrected the indendation (Rob Herring)
> 	- Added additionalProperties (Rob Herring)
> 	- Split dsi file into two, one for dsi controller
> 	  and another one for dsi phy per target (Rob Herring)
> 	- Corrected description for pinctrl-names (Rob Herring)
> 	- Corrected the examples used in yaml file (Rob Herring)
> 	- Delete dsi.txt and dpu.txt (Rob Herring)
> 
> Changes in v4:
> 	- Move schema up by one level (Rob Herring)
> 	- Add patternProperties for mdp node (Rob Herring)
> 	- Corrected description of some properties (Rob Herring)
> ---
>  .../bindings/display/msm/dpu-sc7180.yaml           | 243 ++++++++++++++++++++
>  .../bindings/display/msm/dpu-sdm845.yaml           | 220 ++++++++++++++++++
>  .../devicetree/bindings/display/msm/dpu.txt        | 141 ------------
>  .../display/msm/dsi-controller-sc7180.yaml         | 123 +++++++++++
>  .../display/msm/dsi-controller-sdm845.yaml         | 120 ++++++++++
>  .../bindings/display/msm/dsi-controller.yaml       | 151 +++++++++++++
>  .../bindings/display/msm/dsi-phy-sc7180.yaml       |  75 +++++++
>  .../bindings/display/msm/dsi-phy-sdm845.yaml       |  76 +++++++
>  .../devicetree/bindings/display/msm/dsi-phy.yaml   |  82 +++++++
>  .../devicetree/bindings/display/msm/dsi.txt        | 246 ---------------------
>  10 files changed, 1090 insertions(+), 387 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu.txt
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-controller-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-controller-sdm845.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-controller.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-sdm845.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dsi.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> new file mode 100644
> index 0000000..b5607f9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> @@ -0,0 +1,243 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DPU dt properties.
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Device tree bindings for MSM Mobile Display Subsytem(MDSS) that encapsulates
> +  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
> +  bindings of MDSS and DPU are mentioned for SC7180 target.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,sc7180-mdss

blank line between properties.

> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    const: mdss
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    description: |
> +      Device clock names in the same order as mentioned in clocks property.
> +      The required clocks are mentioned below.

Not a useful description. Unless you have something specific about 
*this* device, drop it.

> +    items:
> +      - const: iface
> +      - const: ahb
> +      - const: core
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 1
> +
> +  iommus:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2
> +
> +  ranges: true
> +
> +  interconnects:
> +    description: |
> +      Interconnect path specifier for MDSS according to
> +      Documentation/devicetree/bindings/interconnect/interconnect.txt.
> +      An entry should contain 2 paths corresponding to 2 AXI ports representing
> +      source and destination ports.

2 entries or...

> +    maxItems: 1

1? 

> +
> +  interconnect-names:
> +    description: |
> +      MDSS will have 2 port names to differentiate between the
> +      2 interconnect paths defined with interconnect specifier.
> +    maxItems: 1

Need to define the names.

> +
> +  assigned-clocks:
> +    description: |
> +      Clock specifiers for clocks needing rate assignment (optional).

That's every 'assigned-clocks'. Think about that for all of your 
'description' entries and drop them if nothing device specific.

> +    maxItems: 1
> +
> +  assigned-clock-rates:
> +    description: |
> +      Clock frequencies sorted in the same order as the
> +      assigned-clocks property (optional).
> +    maxItems: 1
> +
> +patternProperties:
> +  "^mdp@[0-9a-f]+$":
> +    type: object
> +    description: Node containing the properties of DPU.
> +
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,sc7180-dpu
> +
> +      reg:
> +        maxItems: 2
> +
> +      reg-names:
> +        items:
> +          - const: mdp
> +          - const: vbif
> +
> +      clocks:
> +        maxItems: 6
> +
> +      clock-names:
> +        description: |
> +          Device clock names, must be in same order as clocks property.
> +          The following clocks are required. "bus" is an optional property
> +          in sc7180 due to architecture change. "rot" and "lut" are optional
> +          device clocks, needed for accessing LUT blocks.

The schema doesn't match this description. The schema only allows 
the exact list below. You'll need an if/then schema to define the 
different combinations. Or a 'oneOf' schema if there's different 
possibilities for just the sc7180. There shouldn't be though. A given 
chip either has a clock or it doesn't.

> +        items:
> +          - const: bus
> +          - const: iface
> +          - const: rot
> +          - const: lut
> +          - const: core
> +          - const: vsync
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      ports:
> +        type: object
> +        description: |
> +          Contains the list of output ports from DPU device. These ports
> +          connect to interfaces that are external to the DPU hardware,
> +          such as DSI, DP etc. Each output port contains an endpoint that
> +          describes how it is connected to an external interface. These
> +          are described by the standard properties documented in files
> +          mentioned below.
> +
> +          Documentation/devicetree/bindings/graph.txt
> +          Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +        properties:
> +             port@0:

Wrong indentation.

> +               type: object
> +               description: DPU_INTF1 (DSI1)
> +             port@1:
> +               type: object
> +               description: DPU_INTF2 (DSI2)
> +
> +      assigned-clocks:
> +        description: |
> +          Clock specifiers for clocks needing rate assignment (optional).
> +        maxItems: 4
> +
> +      assigned-clock-rates:
> +        description: |
> +          Clock frequencies sorted in the same order as the
> +          assigned-clocks property (optional).
> +        maxItems: 4
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - power-domains
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-controller
> +  - iommus
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> +    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,sdm845.h>
> +    mdss: mdss@ae00000 {
> +         compatible = "qcom,sc7180-mdss";
> +         reg = <0 0xae00000 0 0x1000>;
> +         reg-names = "mdss";
> +         power-domains = <&dispcc MDSS_GDSC>;
> +
> +         clocks = <&gcc GCC_DISP_AHB_CLK>,
> +                  <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                  <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +
> +         clock-names = "iface", "ahb", "core";
> +
> +         assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +         assigned-clock-rates = <300000000>;
> +
> +         interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +         interrupt-controller;
> +         #interrupt-cells = <1>;
> +
> +         interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;

interconnects = <&mmss_noc MASTER_MDP0>, <&mc_virt SLAVE_EBI1>;

Which will fail with the above schema.

> +
> +         interconnect-names = "mdp0-mem";
> +
> +         iommus = <&apps_smmu 0x800 0x2>;
> +
> +         #address-cells = <2>;
> +         #size-cells = <2>;
> +
> +         mdp: mdp@ae01000 {
> +                   compatible = "qcom,sc7180-dpu";
> +                   reg = <0 0x0ae01000 0 0x8f000>,
> +                         <0 0x0aeb0000 0 0x2008>;
> +
> +                   reg-names = "mdp", "vbif";
> +
> +                   clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +                            <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                            <&dispcc DISP_CC_MDSS_ROT_CLK>,
> +                            <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +                            <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                            <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                   clock-names = "bus", "iface", "rot", "lut", "core",
> +                                 "vsync";
> +                   assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
> +                                     <&dispcc DISP_CC_MDSS_ROT_CLK>,
> +                                     <&dispcc DISP_CC_MDSS_ROT_CLK>;
> +                   assigned-clock-rates = <300000000>,
> +                                          <19200000>,
> +                                          <19200000>,
> +                                          <19200000>;
> +
> +                   interrupt-parent = <&mdss>;
> +                   interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                   ports {
> +                           #address-cells = <1>;
> +                           #size-cells = <0>;
> +
> +                           port@0 {
> +                                   reg = <0>;
> +                                   dpu_intf1_out: endpoint {
> +                                                  remote-endpoint = <&dsi0_in>;
> +                                   };
> +                           };
> +                   };
> +         };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> new file mode 100644
> index 0000000..ed036fd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> @@ -0,0 +1,220 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dpu-sdm845.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DPU dt properties.
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Device tree bindings for MSM Mobile Display Subsytem(MDSS) that encapsulates
> +  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
> +  bindings of MDSS and DPU are mentioned for SDM845 target.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,sdm845-mdss
> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    const: mdss
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    description: |
> +      Device clock names in the same order as mentioned in clocks property.
> +      The required clocks are mentioned below.
> +    items:
> +      - const: iface
> +      - const: bus
> +      - const: core
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 1
> +
> +  iommus:
> +    maxItems: 2

Need to define what each one is:

items:
  - description: ...
  - description: ...

> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2
> +
> +  ranges: true
> +
> +  assigned-clocks:
> +    description: |
> +      Clock specifiers for clocks needing rate assignment (optional).
> +    maxItems: 1
> +
> +  assigned-clock-rates:
> +    description: |
> +      Clock frequencies sorted in the same order as the
> +      assigned-clocks property (optional).
> +    maxItems: 1
> +
> +patternProperties:
> +  "^mdp@[0-9a-f]+$":
> +    type: object
> +    description: Node containing the properties of DPU.
> +
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,sdm845-dpu
> +      reg:
> +        maxItems: 2
> +
> +      reg-names:
> +        items:
> +          - const: mdp
> +          - const: vbif
> +
> +      clocks:
> +        maxItems: 4
> +
> +      clock-names:
> +        description: |
> +          Device clock names, must be in same order as clocks property.
> +          The following clocks are required.
> +        items:
> +          - const: iface
> +          - const: bus
> +          - const: core
> +          - const: vsync
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      ports:
> +        type: object
> +        description: |
> +          Contains the list of output ports from DPU device. These ports
> +          connect to interfaces that are external to the DPU hardware,
> +          such as DSI, DP etc. Each output port contains an endpoint that
> +          describes how it is connected to an external interface. These
> +          are described by the standard properties documented in files
> +          mentioned below.
> +
> +          Documentation/devicetree/bindings/graph.txt
> +          Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +        properties:
> +          port@0:
> +            type: object
> +            description: DPU_INTF1 (DSI1)
> +          port@1:
> +            type: object
> +            description: DPU_INTF2 (DSI2)
> +
> +      assigned-clocks:
> +        description: |
> +          Clock specifiers for clocks needing rate assignment (optional).
> +        maxItems: 2
> +
> +      assigned-clock-rates:
> +        description: |
> +          Clock frequencies sorted in the same order as the
> +          assigned-clocks property (optional).
> +        maxItems: 2
> +
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - power-domains
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-controller
> +  - iommus
> +
> +additionalProperties: false
> +
> +examples:
> +- |
> +    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    mdss: mdss@ae00000 {
> +          compatible = "qcom,sdm845-mdss";
> +          reg = <0 0x0ae00000 0 0x1000>;
> +          reg-names = "mdss";
> +          power-domains = <&dispcc MDSS_GDSC>;
> +
> +          clocks = <&gcc GCC_DISP_AHB_CLK>,
> +                   <&gcc GCC_DISP_AXI_CLK>,
> +                   <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +          clock-names = "iface", "bus", "core";
> +
> +          assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +          assigned-clock-rates = <300000000>;
> +
> +          interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +          interrupt-controller;
> +          #interrupt-cells = <1>;
> +
> +          iommus = <&apps_smmu 0x880 0x8>,
> +                   <&apps_smmu 0xc80 0x8>;
> +
> +          #address-cells = <2>;
> +          #size-cells = <2>;
> +
> +          mdss_mdp: mdp@ae01000 {
> +                    compatible = "qcom,sdm845-dpu";
> +                    reg = <0 0x0ae01000 0 0x8f000>,
> +                          <0 0x0aeb0000 0 0x2008>;
> +                    reg-names = "mdp", "vbif";
> +
> +                    clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                             <&dispcc DISP_CC_MDSS_AXI_CLK>,
> +                             <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                             <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                    clock-names = "iface", "bus", "core", "vsync";
> +
> +                    assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                                      <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                    assigned-clock-rates = <300000000>,
> +                                           <19200000>;
> +
> +                    interrupt-parent = <&mdss>;
> +                    interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                    ports {
> +                           #address-cells = <1>;
> +                           #size-cells = <0>;
> +
> +                           port@0 {
> +                                   reg = <0>;
> +                                   dpu_intf1_out: endpoint {
> +                                                  remote-endpoint = <&dsi0_in>;
> +                                   };
> +                           };
> +
> +                           port@1 {
> +                                   reg = <1>;
> +                                   dpu_intf2_out: endpoint {
> +                                                  remote-endpoint = <&dsi1_in>;
> +                                   };
> +                           };
> +                    };
> +          };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
> deleted file mode 100644
> index 551ae26..0000000
> --- a/Documentation/devicetree/bindings/display/msm/dpu.txt
> +++ /dev/null
> @@ -1,141 +0,0 @@
> -Qualcomm Technologies, Inc. DPU KMS
> -
> -Description:
> -
> -Device tree bindings for MSM Mobile Display Subsytem(MDSS) that encapsulates
> -sub-blocks like DPU display controller, DSI and DP interfaces etc.
> -The DPU display controller is found in SDM845 SoC.
> -
> -MDSS:
> -Required properties:
> -- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss"
> -- reg: physical base address and length of contoller's registers.
> -- reg-names: register region names. The following region is required:
> -  * "mdss"
> -- power-domains: a power domain consumer specifier according to
> -  Documentation/devicetree/bindings/power/power_domain.txt
> -- clocks: list of clock specifiers for clocks needed by the device.
> -- clock-names: device clock names, must be in same order as clocks property.
> -  The following clocks are required:
> -  * "iface"
> -  * "bus"
> -  * "core"
> -- interrupts: interrupt signal from MDSS.
> -- interrupt-controller: identifies the node as an interrupt controller.
> -- #interrupt-cells: specifies the number of cells needed to encode an interrupt
> -  source, should be 1.
> -- iommus: phandle of iommu device node.
> -- #address-cells: number of address cells for the MDSS children. Should be 1.
> -- #size-cells: Should be 1.
> -- ranges: parent bus address space is the same as the child bus address space.
> -- interconnects : interconnect path specifier for MDSS according to
> -  Documentation/devicetree/bindings/interconnect/interconnect.txt. Should be
> -  2 paths corresponding to 2 AXI ports.
> -- interconnect-names : MDSS will have 2 port names to differentiate between the
> -  2 interconnect paths defined with interconnect specifier.
> -
> -Optional properties:
> -- assigned-clocks: list of clock specifiers for clocks needing rate assignment
> -- assigned-clock-rates: list of clock frequencies sorted in the same order as
> -  the assigned-clocks property.
> -
> -MDP:
> -Required properties:
> -- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu"
> -- reg: physical base address and length of controller's registers.
> -- reg-names : register region names. The following region is required:
> -  * "mdp"
> -  * "vbif"
> -- clocks: list of clock specifiers for clocks needed by the device.
> -- clock-names: device clock names, must be in same order as clocks property.
> -  The following clocks are required.
> -  * "bus"
> -  * "iface"
> -  * "core"
> -  * "vsync"
> -- interrupts: interrupt line from DPU to MDSS.
> -- ports: contains the list of output ports from DPU device. These ports connect
> -  to interfaces that are external to the DPU hardware, such as DSI, DP etc.
> -
> -  Each output port contains an endpoint that describes how it is connected to an
> -  external interface. These are described by the standard properties documented
> -  here:
> -	Documentation/devicetree/bindings/graph.txt
> -	Documentation/devicetree/bindings/media/video-interfaces.txt
> -
> -	Port 0 -> DPU_INTF1 (DSI1)
> -	Port 1 -> DPU_INTF2 (DSI2)
> -
> -Optional properties:
> -- assigned-clocks: list of clock specifiers for clocks needing rate assignment
> -- assigned-clock-rates: list of clock frequencies sorted in the same order as
> -  the assigned-clocks property.
> -
> -Example:
> -
> -	mdss: mdss@ae00000 {
> -		compatible = "qcom,sdm845-mdss";
> -		reg = <0xae00000 0x1000>;
> -		reg-names = "mdss";
> -
> -		power-domains = <&clock_dispcc 0>;
> -
> -		clocks = <&gcc GCC_DISP_AHB_CLK>, <&gcc GCC_DISP_AXI_CLK>,
> -			 <&clock_dispcc DISP_CC_MDSS_MDP_CLK>;
> -		clock-names = "iface", "bus", "core";
> -
> -		assigned-clocks = <&clock_dispcc DISP_CC_MDSS_MDP_CLK>;
> -		assigned-clock-rates = <300000000>;
> -
> -		interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> -		interrupt-controller;
> -		#interrupt-cells = <1>;
> -
> -		interconnects = <&rsc_hlos MASTER_MDP0 &rsc_hlos SLAVE_EBI1>,
> -				<&rsc_hlos MASTER_MDP1 &rsc_hlos SLAVE_EBI1>;
> -
> -		interconnect-names = "mdp0-mem", "mdp1-mem";
> -
> -		iommus = <&apps_iommu 0>;
> -
> -		#address-cells = <2>;
> -		#size-cells = <1>;
> -		ranges = <0 0 0xae00000 0xb2008>;
> -
> -		mdss_mdp: mdp@ae01000 {
> -			compatible = "qcom,sdm845-dpu";
> -			reg = <0 0x1000 0x8f000>, <0 0xb0000 0x2008>;
> -			reg-names = "mdp", "vbif";
> -
> -			clocks = <&clock_dispcc DISP_CC_MDSS_AHB_CLK>,
> -				 <&clock_dispcc DISP_CC_MDSS_AXI_CLK>,
> -				 <&clock_dispcc DISP_CC_MDSS_MDP_CLK>,
> -				 <&clock_dispcc DISP_CC_MDSS_VSYNC_CLK>;
> -			clock-names = "iface", "bus", "core", "vsync";
> -
> -			assigned-clocks = <&clock_dispcc DISP_CC_MDSS_MDP_CLK>,
> -					  <&clock_dispcc DISP_CC_MDSS_VSYNC_CLK>;
> -			assigned-clock-rates = <0 0 300000000 19200000>;
> -
> -			interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> -
> -			ports {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
> -				port@0 {
> -					reg = <0>;
> -					dpu_intf1_out: endpoint {
> -						remote-endpoint = <&dsi0_in>;
> -					};
> -				};
> -
> -				port@1 {
> -					reg = <1>;
> -					dpu_intf2_out: endpoint {
> -						remote-endpoint = <&dsi1_in>;
> -					};
> -				};
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-sc7180.yaml
> new file mode 100644
> index 0000000..deb8272
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-sc7180.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-controller-sc7180.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DSI controller dt properties.
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Device tree bindings for DSI controller for SC7180 target.
> +
> +allOf:
> +  - $ref: dsi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,mdss-dsi-ctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    const: dsi_ctrl
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 6
> +
> +  clock-names:
> +    items:
> +         - const: byte
> +         - const: byte_intf
> +         - const: pixel
> +         - const: core
> +         - const: iface
> +         - const: bus
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: dsi
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0

These 2 properties aren't needed here.

> +
> +  ports: true

Need to define what 'port@0' and 'port@1' are.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupt-parent
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - phys
> +  - phy-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +     #include <dt-bindings/interrupt-controller/arm-gic.h>
> +     #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> +     #include <dt-bindings/clock/qcom,gcc-sc7180.h>
> +
> +     dsi0: dsi@ae94000 {
> +           compatible = "qcom,mdss-dsi-ctrl";
> +           reg = <0 0x0ae94000 0 0x400>;
> +           reg-names = "dsi_ctrl";
> +
> +           interrupt-parent = <&mdss>;
> +           interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
> +
> +           clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> +                    <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +                    <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
> +                    <&dispcc DISP_CC_MDSS_ESC0_CLK>,
> +                    <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                    <&gcc GCC_DISP_HF_AXI_CLK>;
> +
> +           clock-names = "byte",
> +                         "byte_intf",
> +                         "pixel",
> +                         "core",
> +                         "iface",
> +                         "bus";
> +
> +           phys = <&dsi_phy>;
> +           phy-names = "dsi";
> +
> +           #address-cells = <1>;
> +           #size-cells = <0>;
> +
> +           ports {
> +                 #address-cells = <1>;
> +                 #size-cells = <0>;
> +                 port@0 {
> +                         reg = <0>;
> +                         dsi0_in: endpoint {
> +                                  remote-endpoint = <&dpu_intf1_out>;
> +                         };
> +                };
> +
> +                port@1 {
> +                        reg = <1>;
> +                        dsi0_out: endpoint {
> +                        };
> +               };
> +          };
> +     };
> +...
> +
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-sdm845.yaml
> new file mode 100644
> index 0000000..264d7c9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-sdm845.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-controller-sdm845.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DSI controller dt properties.
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Device tree bindings for DSI controller for SDM845 target.
> +
> +allOf:
> +  - $ref: dsi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,mdss-dsi-ctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    const: dsi_ctrl
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 6
> +
> +  clock-names:
> +    items:
> +         - const: byte
> +         - const: byte_intf
> +         - const: pixel
> +         - const: core
> +         - const: iface
> +         - const: bus
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: dsi
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  ports: true

Need to define each port.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupt-parent
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - phys
> +  - phy-names
> +  - ports
> +
> +additionalProperties: false

unevaluatedProperties: false

Because DSI bus child nodes defined in dsi-controller.yaml should be 
valid too.

> +
> +examples:
> +  - |
> +     #include <dt-bindings/interrupt-controller/arm-gic.h>
> +     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> +     #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +
> +     dsi0: dsi@ae94000 {
> +           compatible = "qcom,mdss-dsi-ctrl";
> +           reg = <0 0x0ae94000 0 0x400>;
> +           reg-names = "dsi_ctrl";
> +
> +           interrupt-parent = <&mdss>;
> +           interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
> +
> +           clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> +                    <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +                    <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
> +                    <&dispcc DISP_CC_MDSS_ESC0_CLK>,
> +                    <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                    <&dispcc DISP_CC_MDSS_AXI_CLK>;
> +           clock-names = "byte",
> +                         "byte_intf",
> +                         "pixel",
> +                         "core",
> +                         "iface",
> +                         "bus";
> +
> +           phys = <&dsi0_phy>;
> +           phy-names = "dsi";
> +
> +           ports {
> +                  #address-cells = <1>;
> +                  #size-cells = <0>;
> +
> +                  port@0 {
> +                          reg = <0>;
> +                          dsi0_in: endpoint {
> +                                   remote-endpoint = <&dpu_intf1_out>;
> +                          };
> +                  };
> +
> +                  port@1 {
> +                          reg = <1>;
> +                          dsi0_out: endpoint {
> +                          };
> +                  };
> +           };
> +     };
> +...
> +
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller.yaml
> new file mode 100644
> index 0000000..dbec55e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller.yaml
> @@ -0,0 +1,151 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DSI controller dt properties.
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Common Device tree bindings for DSI controller.

Not a correct description. We already have a common binding for DSI 
controllers and should reference it (dsi-controller.yaml).

> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,mdss-dsi-ctrl
> +
> +  clocks:
> +    maxItems: 6
> +
> +  clock-names:
> +    description: |
> +      Device clock names in the same order as mentioned in clocks property.
> +      For DSIv2, we need an additional clock "src" and for DSI6G v2.0
> +      onwards we need "byte_intf" clock.

Need a schema list.

> +
> +  assigned-clocks:
> +    description: Parents of "byte" and "pixel" for the given platform.

How many?

> +
> +  assigned-clock-parents:
> +    description: |
> +      The Byte clock and Pixel clock PLL outputs provided by a DSI PHY block.
> +      Details on clock bindings are mentioned in
> +      Documentation/devicetree/bindings/clock/clock-bindings.txt.
> +
> +  vdd-supply:
> +    description: Phandle to vdd regulator device node.
> +
> +  vddio-supply:
> +    description: Phandle to vdd-io regulator device node.
> +
> +  vdda-supply:
> +    description: Phandle to vdda regulator device node.
> +
> +  phys:
> +    description: Phandle to DSI PHY device node.
> +
> +  phy-names:
> +    description: Name of the corresponding PHY device.
> +
> +  syscon-sfpb:
> +    description: A phandle to mmss_sfpb syscon node (only for DSIv2).

Needs a type $ref.

> +
> +      # Optional Properties for dsi controller
> +  panel@0:
> +    description: |
> +      Node of panel connected to this DSI controller.
> +      See files in Documentation/devicetree/bindings/display/panel/
> +      for each supported panel.

Covered by the common binding. Could be a bridge instead BTW.

> +
> +  qcom,mdss-mdp-transfer-time-us:
> +    description: |
> +      Specifies the DSI transfer time for command mode
> +      panels in microseconds. Driver uses this number to adjust
> +      the clock rate according to the expected transfer time.
> +      Increasing this value would slow down the mdp processing
> +      and can result in slower performance.
> +      Decreasing this value can speed up the mdp processing,
> +      but this can also impact power consumption.
> +      As a rule this time should not be higher than the time
> +      that would be expected with the processing at the
> +      DSI link rate since anyways this would be the maximum
> +      transfer time that could be achieved.
> +      If ping pong split is enabled, this time should not be higher
> +      than two times the DSI link rate time.
> +      If the property is not specified, then the default value is
> +      14000 us. This is an optional property.
> +
> +  qcom,dual-dsi-mode:
> +    type: boolean
> +    description: |
> +      Boolean value indicating if the DSI controller is
> +      driving a panel which needs 2 DSI links.
> +
> +  qcom,master-dsi:
> +    type: boolean
> +    description: |
> +      Boolean value indicating if the DSI controller is driving
> +      the master link of the 2-DSI panel.
> +
> +  qcom,sync-dual-dsi:
> +    type: boolean
> +    description: |
> +      Boolean value indicating if the DSI controller is driving a
> +      2-DSI panel whose 2 links need receive command simultaneously.

Dependencies between these 3 properties? If so, use dependencies.

> +
> +  pinctrl-names:
> +    description: The pin control state names; may be "default" or "sleep".

Sounds like constraints.

> +
> +  pinctrl-0:
> +    description: The default pinctrl state (active)
> +
> +  pinctrl-1:
> +    description: The sleep pinctrl state (suspend)

No need to document these 2.

> +
> +  ports:
> +    type: object
> +    description: |
> +      Contains DSI controller input and output ports as children, each
> +      containing one endpoint subnode as defined in
> +      Documentation/devicetree/bindings/graph.txt and
> +      Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +    properties:
> +      remote-endpoint:

Not a property in 'ports'

> +        description: |
> +          For port@0, set to phandle of the connected panel/bridge's
> +          input endpoint. For port@1, set to the MDP interface output.
> +          See Documentation/devicetree/bindings/graph.txt for
> +          device graph info.
> +
> +      data-lanes:
> +        description: |
> +          This describes how the physical DSI data lanes are mapped
> +          to the logical lanes on the given platform. The value contained in
> +          index n describes what physical lane is mapped to the logical lane n
> +          (DATAn, where n lies between 0 and 3). The clock lane position is fixed
> +          and can't be changed. Hence, they aren't a part of the DT bindings. See
> +          Documentation/devicetree/bindings/media/video-interfaces.txt for
> +          more info on the data-lanes property.
> +
> +          For example:
> +          data-lanes = <3 0 1 2>;
> +
> +          The above mapping describes that the logical data lane DATA0 is mapped
> +          to the physical data lane DATA3, logical DATA1 to physical DATA0,
> +          logic DATA2 to phys DATA1 and logic DATA3 to phys DATA2. There are
> +          only a limited number of physical to logical mappings possible.
> +          oneOf:
> +            - const: <0 1 2 3>
> +            - const: <1 2 3 0>
> +            - const: <2 3 0 1>
> +            - const: <3 0 1 2>
> +            - const: <0 3 2 1>
> +            - const: <1 0 3 2>
> +            - const: <2 1 0 3>
> +            - const: <3 2 1 0>
> +
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-sc7180.yaml
> new file mode 100644
> index 0000000..316b3b7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-sc7180.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-sc7180.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DSI PHY dt properties.
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Device tree bindings for DSI PHY for SC7180 target.
> +
> +allOf:
> +  - $ref: dsi-phy.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,dsi-phy-10nm
> +
> +  reg:
> +    maxItems: 3
> +
> +  reg-names:
> +    maxItems: 3
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: ref
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +     #include <dt-bindings/interrupt-controller/arm-gic.h>
> +     #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> +     #include <dt-bindings/clock/qcom,gcc-sc7180.h>
> +     #include <dt-bindings/clock/qcom,rpmh.h>
> +
> +     dsi_phy: dsi-phy@ae94400 {
> +              compatible = "qcom,dsi-phy-10nm";
> +              reg = <0 0x0ae94400 0 0x200>,
> +                    <0 0x0ae94600 0 0x280>,
> +                    <0 0x0ae94a00 0 0x1e0>;
> +              reg-names = "dsi_phy",
> +                          "dsi_phy_lane",
> +                          "dsi_pll";
> +
> +              #clock-cells = <1>;
> +              #phy-cells = <0>;
> +
> +              clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                       <&rpmhcc RPMH_CXO_CLK>;
> +              clock-names = "iface", "ref";
> +     };
> +...
> +
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-sdm845.yaml
> new file mode 100644
> index 0000000..0c9d19a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-sdm845.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-sdm845.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DSI PHY dt properties.
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Device tree bindings for DSI PHY for SDM845 target.
> +
> +allOf:
> +  - $ref: dsi-phy.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,dsi-phy-10nm
> +
> +  reg:
> +    maxItems: 3
> +
> +  reg-names:
> +    maxItems: 3
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: ref
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +     #include <dt-bindings/interrupt-controller/arm-gic.h>
> +     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> +     #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +     #include <dt-bindings/clock/qcom,rpmh.h>
> +
> +     dsi0_phy: dsi-phy@ae94400 {
> +               compatible = "qcom,dsi-phy-10nm";
> +               reg = <0 0x0ae94400 0 0x200>,
> +                     <0 0x0ae94600 0 0x280>,
> +                     <0 0x0ae94a00 0 0x1e0>;
> +               reg-names = "dsi_phy",
> +                           "dsi_phy_lane",
> +                           "dsi_pll";
> +
> +               #clock-cells = <1>;
> +               #phy-cells = <0>;
> +
> +               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                        <&rpmhcc RPMH_CXO_CLK>;
> +               clock-names = "iface", "ref";

Where's vdds-supply you say is required?

> +
> +     };
> +...
> +
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy.yaml
> new file mode 100644
> index 0000000..46ac96f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DSI PHY dt properties.
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Common Device tree bindings for DSI PHY.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,dsi-phy-28nm-hpm
> +      - const: qcom,dsi-phy-28nm-lp
> +      - const: qcom,dsi-phy-20nm
> +      - const: qcom,dsi-phy-28nm-8960
> +      - const: qcom,dsi-phy-14nm
> +      - const: qcom,dsi-phy-10nm
> +      - const: qcom,dsi-phy-10nm-8998
> +
> +  reg-names:
> +    description: Name of register regions.
> +    oneOf:
> +      - description: |
> +          Following regions are required for DSI 28nm HPM/LP/8960 PHYs and
> +          20nm PHY.
> +        items:
> +          - const: dsi_pll
> +          - const: dsi_phy
> +          - const: dsi_phy_regulator
> +
> +      - description: |
> +          Following regions are required for DSI 14nm and 10nm PHYs:
> +        items:
> +          - const: dsi_phy
> +          - const: dsi_phy_lane
> +          - const: dsi_pll
> +
> +  clock-cells:
> +    description: |
> +      The DSI PHY block acts as a clock provider, creating
> +      2 clocks: A byte clock (index 0), and a pixel clock (index 1).
> +    const: 1
> +
> +  power-domains:
> +    description: Should be <&mmcc MDSS_GDSC>.

How many?

> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    description: |
> +      The following clocks are required.
> +      "iface"
> +      "ref" (only required for new DTS files/entries)

Sounds like constraints.

> +
> +  vddio-supply:
> +    description: |
> +      Phandle to vdd-io regulator device node. Required for 28nm HPM/LP,
> +      28nm 8960 PHYs and 20nm PHY.

I'm not sure a common file helps here with all these free form text 
constraints. We can't validate whether having 'vddio-supply' is correct 
or not.

> +
> +  vcca-supply:
> +    description: |
> +      Phandle to vcca regulator device node. Required for 20nm PHY and
> +      10nm PHY.
> +
> +  vdds-supply:
> +    description: |
> +      Phandle to vdds regulator device node. Required for 10nm PHY.
> +
> +  qcom,dsi-phy-regulator-ldo-mode:
> +    type: boolean
> +    description: |
> +      Boolean value indicating if the LDO mode PHY regulator is wanted (optional).
> +
> +...
> +
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
> deleted file mode 100644
> index af95586..0000000
> --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
> +++ /dev/null
> @@ -1,246 +0,0 @@
> -Qualcomm Technologies Inc. adreno/snapdragon DSI output
> -
> -DSI Controller:
> -Required properties:
> -- compatible:
> -  * "qcom,mdss-dsi-ctrl"
> -- reg: Physical base address and length of the registers of controller
> -- reg-names: The names of register regions. The following regions are required:
> -  * "dsi_ctrl"
> -- interrupts: The interrupt signal from the DSI block.
> -- power-domains: Should be <&mmcc MDSS_GDSC>.
> -- clocks: Phandles to device clocks.
> -- clock-names: the following clocks are required:
> -  * "mdp_core"
> -  * "iface"
> -  * "bus"
> -  * "core_mmss"
> -  * "byte"
> -  * "pixel"
> -  * "core"
> -  For DSIv2, we need an additional clock:
> -   * "src"
> -  For DSI6G v2.0 onwards, we need also need the clock:
> -   * "byte_intf"
> -- assigned-clocks: Parents of "byte" and "pixel" for the given platform.
> -- assigned-clock-parents: The Byte clock and Pixel clock PLL outputs provided
> -  by a DSI PHY block. See [1] for details on clock bindings.
> -- vdd-supply: phandle to vdd regulator device node
> -- vddio-supply: phandle to vdd-io regulator device node
> -- vdda-supply: phandle to vdda regulator device node
> -- phys: phandle to DSI PHY device node
> -- phy-names: the name of the corresponding PHY device
> -- syscon-sfpb: A phandle to mmss_sfpb syscon node (only for DSIv2)
> -- ports: Contains 2 DSI controller ports as child nodes. Each port contains
> -  an endpoint subnode as defined in [2] and [3].
> -
> -Optional properties:
> -- panel@0: Node of panel connected to this DSI controller.
> -  See files in [4] for each supported panel.
> -- qcom,dual-dsi-mode: Boolean value indicating if the DSI controller is
> -  driving a panel which needs 2 DSI links.
> -- qcom,master-dsi: Boolean value indicating if the DSI controller is driving
> -  the master link of the 2-DSI panel.
> -- qcom,sync-dual-dsi: Boolean value indicating if the DSI controller is
> -  driving a 2-DSI panel whose 2 links need receive command simultaneously.
> -- pinctrl-names: the pin control state names; should contain "default"
> -- pinctrl-0: the default pinctrl state (active)
> -- pinctrl-n: the "sleep" pinctrl state
> -- ports: contains DSI controller input and output ports as children, each
> -  containing one endpoint subnode.
> -
> -  DSI Endpoint properties:
> -  - remote-endpoint: For port@0, set to phandle of the connected panel/bridge's
> -    input endpoint. For port@1, set to the MDP interface output. See [2] for
> -    device graph info.
> -
> -  - data-lanes: this describes how the physical DSI data lanes are mapped
> -    to the logical lanes on the given platform. The value contained in
> -    index n describes what physical lane is mapped to the logical lane n
> -    (DATAn, where n lies between 0 and 3). The clock lane position is fixed
> -    and can't be changed. Hence, they aren't a part of the DT bindings. See
> -    [3] for more info on the data-lanes property.
> -
> -    For example:
> -
> -    data-lanes = <3 0 1 2>;
> -
> -    The above mapping describes that the logical data lane DATA0 is mapped to
> -    the physical data lane DATA3, logical DATA1 to physical DATA0, logic DATA2
> -    to phys DATA1 and logic DATA3 to phys DATA2.
> -
> -    There are only a limited number of physical to logical mappings possible:
> -    <0 1 2 3>
> -    <1 2 3 0>
> -    <2 3 0 1>
> -    <3 0 1 2>
> -    <0 3 2 1>
> -    <1 0 3 2>
> -    <2 1 0 3>
> -    <3 2 1 0>
> -
> -DSI PHY:
> -Required properties:
> -- compatible: Could be the following
> -  * "qcom,dsi-phy-28nm-hpm"
> -  * "qcom,dsi-phy-28nm-lp"
> -  * "qcom,dsi-phy-20nm"
> -  * "qcom,dsi-phy-28nm-8960"
> -  * "qcom,dsi-phy-14nm"
> -  * "qcom,dsi-phy-10nm"
> -  * "qcom,dsi-phy-10nm-8998"
> -- reg: Physical base address and length of the registers of PLL, PHY. Some
> -  revisions require the PHY regulator base address, whereas others require the
> -  PHY lane base address. See below for each PHY revision.
> -- reg-names: The names of register regions. The following regions are required:
> -  For DSI 28nm HPM/LP/8960 PHYs and 20nm PHY:
> -  * "dsi_pll"
> -  * "dsi_phy"
> -  * "dsi_phy_regulator"
> -  For DSI 14nm and 10nm PHYs:
> -  * "dsi_pll"
> -  * "dsi_phy"
> -  * "dsi_phy_lane"
> -- clock-cells: Must be 1. The DSI PHY block acts as a clock provider, creating
> -  2 clocks: A byte clock (index 0), and a pixel clock (index 1).
> -- power-domains: Should be <&mmcc MDSS_GDSC>.
> -- clocks: Phandles to device clocks. See [1] for details on clock bindings.
> -- clock-names: the following clocks are required:
> -  * "iface"
> -  * "ref" (only required for new DTS files/entries)
> -  For 28nm HPM/LP, 28nm 8960 PHYs:
> -- vddio-supply: phandle to vdd-io regulator device node
> -  For 20nm PHY:
> -- vddio-supply: phandle to vdd-io regulator device node
> -- vcca-supply: phandle to vcca regulator device node
> -  For 14nm PHY:
> -- vcca-supply: phandle to vcca regulator device node
> -  For 10nm PHY:
> -- vdds-supply: phandle to vdds regulator device node
> -
> -Optional properties:
> -- qcom,dsi-phy-regulator-ldo-mode: Boolean value indicating if the LDO mode PHY
> -  regulator is wanted.
> -- qcom,mdss-mdp-transfer-time-us:	Specifies the dsi transfer time for command mode
> -					panels in microseconds. Driver uses this number to adjust
> -					the clock rate according to the expected transfer time.
> -					Increasing this value would slow down the mdp processing
> -					and can result in slower performance.
> -					Decreasing this value can speed up the mdp processing,
> -					but this can also impact power consumption.
> -					As a rule this time should not be higher than the time
> -					that would be expected with the processing at the
> -					dsi link rate since anyways this would be the maximum
> -					transfer time that could be achieved.
> -					If ping pong split is enabled, this time should not be higher
> -					than two times the dsi link rate time.
> -					If the property is not specified, then the default value is 14000 us.
> -
> -[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> -[2] Documentation/devicetree/bindings/graph.txt
> -[3] Documentation/devicetree/bindings/media/video-interfaces.txt
> -[4] Documentation/devicetree/bindings/display/panel/
> -
> -Example:
> -	dsi0: dsi@fd922800 {
> -		compatible = "qcom,mdss-dsi-ctrl";
> -		qcom,dsi-host-index = <0>;
> -		interrupt-parent = <&mdp>;
> -		interrupts = <4 0>;
> -		reg-names = "dsi_ctrl";
> -		reg = <0xfd922800 0x200>;
> -		power-domains = <&mmcc MDSS_GDSC>;
> -		clock-names =
> -			"bus",
> -			"byte",
> -			"core",
> -			"core_mmss",
> -			"iface",
> -			"mdp_core",
> -			"pixel";
> -		clocks =
> -			<&mmcc MDSS_AXI_CLK>,
> -			<&mmcc MDSS_BYTE0_CLK>,
> -			<&mmcc MDSS_ESC0_CLK>,
> -			<&mmcc MMSS_MISC_AHB_CLK>,
> -			<&mmcc MDSS_AHB_CLK>,
> -			<&mmcc MDSS_MDP_CLK>,
> -			<&mmcc MDSS_PCLK0_CLK>;
> -
> -		assigned-clocks =
> -				 <&mmcc BYTE0_CLK_SRC>,
> -				 <&mmcc PCLK0_CLK_SRC>;
> -		assigned-clock-parents =
> -				 <&dsi_phy0 0>,
> -				 <&dsi_phy0 1>;
> -
> -		vdda-supply = <&pma8084_l2>;
> -		vdd-supply = <&pma8084_l22>;
> -		vddio-supply = <&pma8084_l12>;
> -
> -		phys = <&dsi_phy0>;
> -		phy-names ="dsi-phy";
> -
> -		qcom,dual-dsi-mode;
> -		qcom,master-dsi;
> -		qcom,sync-dual-dsi;
> -
> -		qcom,mdss-mdp-transfer-time-us = <12000>;
> -
> -		pinctrl-names = "default", "sleep";
> -		pinctrl-0 = <&dsi_active>;
> -		pinctrl-1 = <&dsi_suspend>;
> -
> -		ports {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			port@0 {
> -				reg = <0>;
> -				dsi0_in: endpoint {
> -					remote-endpoint = <&mdp_intf1_out>;
> -				};
> -			};
> -
> -			port@1 {
> -				reg = <1>;
> -				dsi0_out: endpoint {
> -					remote-endpoint = <&panel_in>;
> -					data-lanes = <0 1 2 3>;
> -				};
> -			};
> -		};
> -
> -		panel: panel@0 {
> -			compatible = "sharp,lq101r1sx01";
> -			reg = <0>;
> -			link2 = <&secondary>;
> -
> -			power-supply = <...>;
> -			backlight = <...>;
> -
> -			port {
> -				panel_in: endpoint {
> -					remote-endpoint = <&dsi0_out>;
> -				};
> -			};
> -		};
> -	};
> -
> -	dsi_phy0: dsi-phy@fd922a00 {
> -		compatible = "qcom,dsi-phy-28nm-hpm";
> -		qcom,dsi-phy-index = <0>;
> -		reg-names =
> -			"dsi_pll",
> -			"dsi_phy",
> -			"dsi_phy_regulator";
> -		reg =   <0xfd922a00 0xd4>,
> -			<0xfd922b00 0x2b0>,
> -			<0xfd922d80 0x7b>;
> -		clock-names = "iface";
> -		clocks = <&mmcc MDSS_AHB_CLK>;
> -		#clock-cells = <1>;
> -		vddio-supply = <&pma8084_l12>;
> -
> -		qcom,dsi-phy-regulator-ldo-mode;
> -	};
> -- 
> 1.9.1
> 
