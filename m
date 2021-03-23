Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73626346AC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Mar 2021 22:06:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233548AbhCWVFr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 17:05:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233485AbhCWVFd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 17:05:33 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 575E1C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 14:05:33 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id c17so8730146pfn.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 14:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=ufv2VhTUc8reY3RznXXee9o25l9I8YOq41cY6M313G0=;
        b=CSV+Mcv+z1mi/yaB1zDdK9PNv1WVBknwrXrd0k3sSzE1YOMKgK2Eng1svDo3BYROVm
         aezfXcCZ8iH2ai3Tojm6xihgdLDjcCb5GADGKx7clouFswGhvHfeQiH9/s723jlqjkSl
         YN2aWDLmX3M3E7IE1X0zr3QJB0U78ywQlfBnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=ufv2VhTUc8reY3RznXXee9o25l9I8YOq41cY6M313G0=;
        b=pOm1ZaEzcHkaJbAoR6ZwTvnI6SCUq7QIOgvF3mc0I0gAK5b6Epp0y22xhGBwYQvtXU
         MhBABWIXlw9VwyvG/Eynwek7vIcwXMLiFHDjlWw/5qXTDMCarUhokfuClqfcfLbw8w6q
         p4VtZeToUAGxKbUvD7xPu8igloxtd/OyEqDHIY4fUtE46jifdsHrxBP49u+wWgd0mIbz
         7nQLf3364kk078XmkYlixulK9l5K9hRvI1sP4AZbox4FANFd3N2urTOpV9UvzdTuKStD
         twAYlINKBsYG5/VlwSXYWIlff6S0Yds3ww9Zep/H61xDJT/dgDvjT8ss2lZETRdgRMrP
         MgjQ==
X-Gm-Message-State: AOAM533rMTr8ccGxogKI+4bGb8JdQO+mhqzzJ14HVmdmysw6ExmWyWaH
        ipcvYjRQKUOqZXOdRxkrs+O1+w==
X-Google-Smtp-Source: ABdhPJyEaEV0vSvIsGroeTlGkOr8IKFR19iqK+JHg4Gs+urcILvHuFx/hjoF9nMrZBVnwNAE+NpidA==
X-Received: by 2002:a63:81:: with SMTP id 123mr150662pga.307.1616533532865;
        Tue, 23 Mar 2021 14:05:32 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:84ac:62f7:16a8:ccc7])
        by smtp.gmail.com with ESMTPSA id i22sm93242pjz.56.2021.03.23.14.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 14:05:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1614950952-13351-1-git-send-email-mkrishn@codeaurora.org>
References: <1614950952-13351-1-git-send-email-mkrishn@codeaurora.org>
Subject: Re: [PATCH v13 1/4] dt-bindings: msm: disp: add yaml schemas for DPU bindings
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        kalyan_t@codeaurora.org, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        rnayak@codeaurora.org, dianders@chromium.org, sibis@codeaurora.org,
        khsieh@codeaurora.org
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Date:   Tue, 23 Mar 2021 14:05:30 -0700
Message-ID: <161653353088.3012082.14737740532594140624@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2021-03-05 05:29:09)
> MSM Mobile Display Subsytem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI etc. Add YAML schema
> for DPU device tree bindings.
>=20
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
>=20
> Changes in v2:
>     - Changed dpu to DPU (Sam Ravnborg)
>     - Fixed indentation issues (Sam Ravnborg)
>     - Added empty line between different properties (Sam Ravnborg)
>     - Replaced reference txt files with  their corresponding
>       yaml files (Sam Ravnborg)
>     - Modified the file to use "|" only when it is
>       necessary (Sam Ravnborg)
>=20
> Changes in v3:
>     - Corrected the license used (Rob Herring)
>     - Added maxItems for properties (Rob Herring)
>     - Dropped generic descriptions (Rob Herring)
>     - Added ranges property (Rob Herring)
>     - Corrected the indendation (Rob Herring)
>     - Added additionalProperties (Rob Herring)
>     - Split dsi file into two, one for dsi controller
>       and another one for dsi phy per target (Rob Herring)
>     - Corrected description for pinctrl-names (Rob Herring)
>     - Corrected the examples used in yaml file (Rob Herring)
>     - Delete dsi.txt and dpu.txt (Rob Herring)
>=20
> Changes in v4:
>     - Move schema up by one level (Rob Herring)
>     - Add patternProperties for mdp node (Rob Herring)
>     - Corrected description of some properties (Rob Herring)
>=20
> Changes in v5:
>     - Correct the indentation (Rob Herring)
>     - Remove unnecessary description from properties (Rob Herring)
>     - Correct the number of interconnect entries (Rob Herring)
>     - Add interconnect names for sc7180 (Rob Herring)
>     - Add description for ports (Rob Herring)
>     - Remove common properties (Rob Herring)
>     - Add unevalutatedProperties (Rob Herring)
>     - Reference existing dsi controller yaml in the common
>       dsi controller file (Rob Herring)
>     - Correct the description of clock names to include only the
>       clocks that are required (Rob Herring)
>     - Remove properties which are already covered under the common
>       binding (Rob Herring)
>     - Add dsi phy supply nodes which are required for sc7180 and
>       sdm845 targets (Rob Herring)
>     - Add type ref for syscon-sfpb (Rob Herring)
>=20
> Changes in v6:
>     - Fixed errors during dt_binding_check (Rob Herring)
>     - Add maxItems for phys and phys-names (Rob Herring)
>     - Use unevaluatedProperties wherever required (Rob Herring)
>     - Removed interrupt controller from required properties for
>       dsi controller (Rob Herring)
>     - Add constraints for dsi-phy reg-names based on the compatible
>       phy version (Rob Herring)
>     - Add constraints for dsi-phy supply nodes based on the
>       compatible phy version (Rob Herring)
>=20
> Changes in v7:
>     - Add default value for qcom,mdss-mdp-transfer-time-us (Rob Herring)
>     - Modify the schema for data-lanes (Rob Herring)
>     - Split the phy schema into separate schemas based on
>       the phy version (Rob Herring)
>=20
> Changes in v8:
>     - Resolve merge conflicts with latest dsi.txt file
>     - Include dp yaml change also in the same series
>=20
> Changes in v9:
>     - Combine target specific dsi controller yaml files
>       to a single yaml file (Rob Herring)
>     - Combine target specific dsi phy yaml files into a
>       single yaml file (Rob Herring)
>     - Use unevaluatedProperties and additionalProperties
>       wherever required
>     - Remove duplicate properties from common yaml files
>=20
> Changes in v10:
>     - Split the patch into separate patches for DPU, DSI and
>       PHY (Stephen Boyd)
>     - Drop unnecessary fullstop (Stephen Boyd)
>     - Add newline whereever required (Stephen Boyd)
>     - Add description for clock used (Stephen Boyd)
>     - Modify the description for interconnect entries  (Stephen Boyd)
>     - Drop assigned clock entries as it a generic property (Stephen Boyd)
>     - Correct the definition for interrupts (Stephen Boyd)
>     - Drop clock names from required properties (Stephen Boyd)
>     - Drop labels for display nodes from example (Stephen Boyd)
>     - Drop flags from interrupts entries (Stephen Boyd)
>=20
> Changes in v11:
>     - Drop maxItems for clocks (Stephen Boyd)
>=20
> Changes in v12:
>     - Add description for register property (Stephen Boyd)
>     - Add maxItems for interrupts (Stephen Boyd)
>     - Add description for iommus property (Stephen Boyd)
>     - Add description for interconnects (Stephen Boyd)
>     - Change display node name to display_controller (Stephen Boyd)
>=20
> Changes in v13:
>     - Add maxItems for reg property (Stephen Boyd)
>     - Add ranges property in example (Stephen Boyd)
>     - Modify description for iommus property (Stephen Boyd)
>     - Add Dp bindings for ports in the same patch (Stephen Boyd)
>     - Remove soc from examples and change address and size cells
>       accordingly (Stephen Boyd)
>     - Add reference for ports
> ---
>  .../bindings/display/msm/dpu-sc7180.yaml           | 207 +++++++++++++++=
++++++
>  .../bindings/display/msm/dpu-sdm845.yaml           | 188 +++++++++++++++=
++++
>  .../devicetree/bindings/display/msm/dpu.txt        | 141 --------------
>  3 files changed, 395 insertions(+), 141 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7=
180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sdm=
845.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu.txt
>=20
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yam=
l b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> new file mode 100644
> index 0000000..8f0c24f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> @@ -0,0 +1,207 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DPU dt properties
> +

Maybe add sc7180 to the title somewhere?

> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Device tree bindings for MSM Mobile Display Subsytem(MDSS) that encaps=
ulates
> +  sub-blocks like DPU display controller, DSI and DP interfaces etc. Dev=
ice tree
> +  bindings of MDSS and DPU are mentioned for SC7180 target.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,sc7180-mdss
> +
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
> +    items:
> +      - description: Display AHB clock from gcc
> +      - description: Display AHB clock from dispcc
> +      - description: Display core clock
> +
> +  clock-names:
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
> +    items:
> +      - description: Phandle to apps_smmu node with SID mask for Hard-Fa=
il port0
> +
> +  ranges: true
> +
> +  interconnects:
> +    items:
> +      - description: Interconnect path specifying the port ids for data =
bus
> +
> +  interconnect-names:
> +    const: mdp0-mem
> +
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    description: Node containing the properties of DPU.
> +
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,sc7180-dpu
> +
> +      reg:
> +        items:
> +          - description: Address offset and size for mdp register set
> +          - description: Address offset and size for vbif register set
> +
> +      reg-names:
> +        items:
> +          - const: mdp
> +          - const: vbif
> +
> +      clocks:
> +        items:
> +          - description: Display hf axi clock
> +          - description: Display ahb clock
> +          - description: Display rotator clock
> +          - description: Display lut clock
> +          - description: Display core clock
> +          - description: Display vsync clock
> +
> +      clock-names:
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
> +        $ref: /schemas/graph.yaml#/properties/port
> +        type: object
> +        description: |
> +          Contains the list of output ports from DPU device. These ports
> +          connect to interfaces that are external to the DPU hardware,
> +          such as DSI, DP etc. Each output port contains an endpoint that
> +          describes how it is connected to an external interface.
> +
> +        properties:
> +          port@0:
> +            type: object
> +            description: DPU_INTF1 (DSI1)
> +
> +          port@1:
> +            type: object
> +            description: DPU_INTF2 (DSI2)
> +          port@2:
> +            type: object
> +            description: DPU_INTF0 (DP)

Is there a required list for this display-controller node?

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - power-domains
> +  - clocks
> +  - interrupts
> +  - interrupt-controller
> +  - iommus
> +  - ranges
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> +    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,sdm845.h>
> +
> +    mdss@ae00000 {

Can we name this node 'subsystem'?

> +         #address-cells =3D <1>;
> +         #size-cells =3D <1>;
> +         compatible =3D "qcom,sc7180-mdss";
> +         reg =3D <0xae00000 0x1000>;
> +         reg-names =3D "mdss";
> +         power-domains =3D <&dispcc MDSS_GDSC>;
> +         clocks =3D <&gcc GCC_DISP_AHB_CLK>,
> +                  <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                  <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +         clock-names =3D "iface", "ahb", "core";
> +
> +         interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +         interrupt-controller;
> +         #interrupt-cells =3D <1>;
> +
> +         interconnects =3D <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
> +         interconnect-names =3D "mdp0-mem";
> +
> +         iommus =3D <&apps_smmu 0x800 0x2>;
> +         ranges;
> +
> +         display-controller@ae01000 {
> +                   compatible =3D "qcom,sc7180-dpu";
> +                   reg =3D <0x0ae01000 0x8f000>,
> +                         <0x0aeb0000 0x2008>;
> +
> +                   reg-names =3D "mdp", "vbif";
> +
> +                   clocks =3D <&gcc GCC_DISP_HF_AXI_CLK>,
> +                            <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                            <&dispcc DISP_CC_MDSS_ROT_CLK>,
> +                            <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +                            <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                            <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                   clock-names =3D "bus", "iface", "rot", "lut", "core",
> +                                 "vsync";
> +
> +                   interrupt-parent =3D <&mdss>;
> +                   interrupts =3D <0>;
> +
> +                   ports {
> +                           #address-cells =3D <1>;
> +                           #size-cells =3D <0>;
> +
> +                           port@0 {
> +                                   reg =3D <0>;
> +                                   dpu_intf1_out: endpoint {
> +                                                  remote-endpoint =3D <&=
dsi0_in>;
> +                                   };
> +                           };
> +
> +                            port@2 {
> +                                    reg =3D <2>;
> +                                    dpu_intf0_out: endpoint {
> +                                                   remote-endpoint =3D <=
&dp_in>;
> +                                    };
> +                            };
> +                   };
> +         };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yam=
l b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> new file mode 100644
> index 0000000..47bbc26
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> @@ -0,0 +1,188 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dpu-sdm845.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DPU dt properties

Same comments apply to this doc.

> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
