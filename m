Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06D5D32678B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 20:46:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbhBZTqO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Feb 2021 14:46:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbhBZTqO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Feb 2021 14:46:14 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9BC7C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Feb 2021 11:45:33 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id f8so5844849plg.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Feb 2021 11:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=65uK8ztNtqtc2xORZ8T47okcLuDY6OP5XO9nJGUcM/U=;
        b=MKN42lrjBACYglY3cxTYLb88plpfBpeL5/UswBpdiufeapav/XqgZMkNNg6jBjSsHC
         Au8/n/xL8etGzCM3XNeD0rbUP+51YsOcKoNuifDRQ3ltikqoUdx4obC5JaAP+Xq7DAKK
         nR8KyZrGPu3JJb4ezFwJx+Jh37e3++rpegj9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=65uK8ztNtqtc2xORZ8T47okcLuDY6OP5XO9nJGUcM/U=;
        b=SLNkeEpPNcnQ1Fi5uJVQf5kgxMVMK/lnGCX0ccC+sqMLczPbbklOh3m8a0CMC9Rxec
         JzARXrkOL+kLjH6/yI/6DSNmr1O/cNmqt7eCAuwUp0+djteakQEQCmoh5sXnLzokrJpA
         vbiouQnZeGY92jmv+U4zjGroPdbLBtUZWmc5HfNJT+IH2nxyDNNXzlaxni8RVy7FeKP7
         C9Q2XcNHcOfledu3Y8Mk/vOMhAfWbWVM/4YwJc4sWtFc2pRlcEMUP1H6S/mGUwZze66i
         /eZe3O3roaVRCoLSDNa9k9RirJ7HkRXakHmt9OuQHFd1c6AtSJOOKc5F1Y0LU+dtXmMw
         rJlA==
X-Gm-Message-State: AOAM532DdAhnXu7xI2zhIlyNxo1ePT1lEeQt8Ja3kGTW84MaZ75Ikf2l
        m+oaHS4UbRWwcIbXRKim46VYcQ==
X-Google-Smtp-Source: ABdhPJwRsb79+hA7idvDNwNXyStCrV2yGUmCOFAqWK2xMAWi4DK3bs1WBeiQj60Cxup9sCwwajWopQ==
X-Received: by 2002:a17:90a:788f:: with SMTP id x15mr5212079pjk.70.1614368733174;
        Fri, 26 Feb 2021 11:45:33 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:e8bb:5726:f58b:4e37])
        by smtp.gmail.com with ESMTPSA id e10sm9384121pjr.56.2021.02.26.11.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 11:45:32 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1613127000-3015-1-git-send-email-mkrishn@codeaurora.org>
References: <1613127000-3015-1-git-send-email-mkrishn@codeaurora.org>
Subject: Re: [PATCH v12 1/4] dt-bindings: msm: disp: add yaml schemas for DPU bindings
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        kalyan_t@codeaurora.org, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        rnayak@codeaurora.org, dianders@chromium.org, sibis@codeaurora.org,
        khsieh@codeaurora.org
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Date:   Fri, 26 Feb 2021 11:45:29 -0800
Message-ID: <161436872955.1254594.2765257503019122275@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2021-02-12 02:49:57)
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
> ---

Looks mostly good to me. Some minor comments but otherwise seems OK.

> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yam=
l b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> new file mode 100644
> index 0000000..df88146
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> @@ -0,0 +1,212 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DPU dt properties
> +
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
> +    items:
> +      - description: Address offset and size for mdss register set

I think the "rule" is if there's only one reg property then it is
maxItems: 1, sorry about that confusion.

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
> +      - description: Phandle to apps_smmu node with sid mask for hf0
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2
> +
> +  ranges: true

Why isn't this part of the example?

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
> +
> +          port@1:
> +            type: object
> +            description: DPU_INTF2 (DSI2)
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

Shouldn't ranges be required?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> +    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,sdm845.h>
> +
> +    soc {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +
> +      mdss@ae00000 {
> +         compatible =3D "qcom,sc7180-mdss";
> +         #address-cells =3D <2>;
> +         #size-cells =3D <2>;
> +         reg =3D <0 0xae00000 0 0x1000>;
> +         reg-names =3D "mdss";
> +         power-domains =3D <&dispcc MDSS_GDSC>;
> +
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
> +
> +         display-controller@ae01000 {
> +                   compatible =3D "qcom,sc7180-dpu";
> +                   reg =3D <0 0x0ae01000 0 0x8f000>,
> +                         <0 0x0aeb0000 0 0x2008>;
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
> +                   };
> +         };
> +      };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yam=
l b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> new file mode 100644
> index 0000000..71f8658
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> @@ -0,0 +1,202 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dpu-sdm845.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DPU dt properties
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Device tree bindings for MSM Mobile Display Subsytem(MDSS) that encaps=
ulates
> +  sub-blocks like DPU display controller, DSI and DP interfaces etc. Dev=
ice tree
> +  bindings of MDSS and DPU are mentioned for SDM845 target.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,sdm845-mdss
> +
> +  reg:
> +    items:
> +      - description: Address offset and size for mdss register set
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
> +      - description: Display AXI clock
> +      - description: Display core clock
> +
> +  clock-names:
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
> +    items:
> +      - description: Phandle to apps_smmu node with sid mask for hf0
> +      - description: Phandle to apps_smmu node with sid mask for hf1

What does 'hf' mean here? Can you spell it out? And capitalize SID for
Stream ID?

> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    description: Node containing the properties of DPU.
> +
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,sdm845-dpu
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
> +          - description: Display ahb clock
> +          - description: Display axi clock
> +          - description: Display core clock
> +          - description: Display vsync clock
> +
> +      clock-names:
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
> +
> +          port@1:
> +            type: object
> +            description: DPU_INTF2 (DSI2)
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
> +
> +additionalProperties: false
> +
> +examples:
> +- |
> +    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;

I think we can drop the soc node from the examples.

> +
> +      mdss@ae00000 {
> +          compatible =3D "qcom,sdm845-mdss";
> +          #address-cells =3D <2>;
> +          #size-cells =3D <2>;
> +          reg =3D <0 0x0ae00000 0 0x1000>;
> +          reg-names =3D "mdss";
> +          power-domains =3D <&dispcc MDSS_GDSC>;
> +
> +          clocks =3D <&gcc GCC_DISP_AHB_CLK>,
> +                   <&gcc GCC_DISP_AXI_CLK>,
> +                   <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +          clock-names =3D "iface", "bus", "core";
> +
> +          interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +          interrupt-controller;
> +          #interrupt-cells =3D <1>;
> +
> +          iommus =3D <&apps_smmu 0x880 0x8>,
> +                   <&apps_smmu 0xc80 0x8>;
> +
> +          display-controller@ae01000 {
> +                    compatible =3D "qcom,sdm845-dpu";
> +                    reg =3D <0 0x0ae01000 0 0x8f000>,
> +                          <0 0x0aeb0000 0 0x2008>;
> +                    reg-names =3D "mdp", "vbif";
> +
> +                    clocks =3D <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                             <&dispcc DISP_CC_MDSS_AXI_CLK>,
> +                             <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                             <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                    clock-names =3D "iface", "bus", "core", "vsync";
> +
> +                    interrupt-parent =3D <&mdss>;
> +                    interrupts =3D <0>;
> +
> +                    ports {
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
> +                           port@1 {
> +                                   reg =3D <1>;
> +                                   dpu_intf2_out: endpoint {
> +                                                  remote-endpoint =3D <&=
dsi1_in>;
> +                                   };
> +                           };
> +                    };
> +          };
> +      };
> +    };
> +...
