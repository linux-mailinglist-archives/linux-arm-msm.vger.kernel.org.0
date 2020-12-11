Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0E42D829D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Dec 2020 00:12:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390978AbgLKXLT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Dec 2020 18:11:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407064AbgLKXLT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Dec 2020 18:11:19 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCFCCC0613D6
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Dec 2020 15:10:38 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id g18so8199470pgk.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Dec 2020 15:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=bZZyhlVb28dFQdVGZU1IYPyMUJ4apAhOiD7qQ+NRiIY=;
        b=lIOu04IUOlOoWO609413uxu/0UagLaQ5UKmPwRidBcLGOXdY6rV/KuqUK47qDAG5FM
         mDh4ypetFFHoU6ORaFZw8111OYh5YGAdRScrmHas4ST93fzTYUIMWWP0uZMenG6spXxF
         vFqSSHKcuRzxW+7fjNXvfnAGSCk59o5bsdqyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=bZZyhlVb28dFQdVGZU1IYPyMUJ4apAhOiD7qQ+NRiIY=;
        b=TWVf3BmMKhIXWCUh75POge2E1xfq+yIeEEdcZ1QpwJeamdZhfCeaBZhSJdremT6JLh
         N1dg9YLJi+lg8iKBnS14p26PLXVnJU6kyK1AVykIQXc2Rbma2RzbYbUtb0ijlkjB94Pv
         sRA5GMoUkOlmrdmZg2avVNypQHMFOJzUrFPg9tIDxxelwfO8h/m7bJ3wjwduvt58V5no
         gg/mc4fRl6vUAik35rfyapMtimN9sEe9VrI4fFS++TUl8N0XSMdzkNDWhB6A0yihiRxg
         SGnybi8WHpN8J3Zi9rTgF/W2xVEDy5VM9y49NY9OwIrjFLEICtlvB5JTChEp4GY5oJEZ
         edig==
X-Gm-Message-State: AOAM532PM77da5NMF9qv7OiU71CM3CfRf+Jjrpu27NsQSd6rbbfv412a
        TCjFrY/zHy5iYQwL0OzC/3k1zTC9jhj0Yw==
X-Google-Smtp-Source: ABdhPJx0PkW1ZTGbTo7BOm7M1davQZOlN0NsZn4U1zzl8JCS1IooQA7NMupZy2JD7InUTHkBKWcEWg==
X-Received: by 2002:a63:2265:: with SMTP id t37mr1026144pgm.336.1607728237854;
        Fri, 11 Dec 2020 15:10:37 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id w2sm11423104pjb.22.2020.12.11.15.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 15:10:37 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1607670585-26438-1-git-send-email-mkrishn@codeaurora.org>
References: <1607670585-26438-1-git-send-email-mkrishn@codeaurora.org>
Subject: Re: [PATCH v9 1/2] dt-bindings: msm: disp: add yaml schemas for DPU and DSI bindings
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        kalyan_t@codeaurora.org, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        rnayak@codeaurora.org, dianders@chromium.org, sibis@codeaurora.org
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Date:   Fri, 11 Dec 2020 15:10:35 -0800
Message-ID: <160772823551.1580929.17011175154206191008@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2020-12-10 23:09:44)
>  .../bindings/display/msm/dpu-sc7180.yaml           | 235 +++++++++++++++=
++++
>  .../bindings/display/msm/dpu-sdm845.yaml           | 216 +++++++++++++++=
+++
>  .../devicetree/bindings/display/msm/dpu.txt        | 141 ------------
>  .../display/msm/dsi-common-controller.yaml         | 235 +++++++++++++++=
++++
>  .../bindings/display/msm/dsi-controller-main.yaml  | 119 ++++++++++
>  .../bindings/display/msm/dsi-phy-10nm.yaml         |  64 ++++++
>  .../bindings/display/msm/dsi-phy-14nm.yaml         |  64 ++++++
>  .../bindings/display/msm/dsi-phy-20nm.yaml         |  68 ++++++
>  .../bindings/display/msm/dsi-phy-28nm.yaml         |  64 ++++++
>  .../devicetree/bindings/display/msm/dsi-phy.yaml   |  81 +++++++
>  .../devicetree/bindings/display/msm/dsi.txt        | 249 ---------------=
------
>  11 files changed, 1146 insertions(+), 390 deletions(-)

This is quite a bit to review. Any chance to split it up into different
patches? Looks like that could be: dpu, phy, and dsi to make this a bit
more reviewable.

>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7=
180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sdm=
845.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu.txt
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-com=
mon-controller.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-con=
troller-main.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy=
-10nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy=
-14nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy=
-20nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy=
-28nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy=
.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dsi.txt
>=20
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yam=
l b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> new file mode 100644
> index 0000000..8397ea8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> @@ -0,0 +1,235 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DPU dt properties.

Drop the full stop?

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

Add a newline here please.

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

items:
 - const: "description"
 ...

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
> +      An entry should contain 2 paths corresponding to 2 AXI ports repre=
senting
> +      source and destination ports.

Why such a long description?

> +    minItems: 1

Why not items: and then a const element with description?

> +
> +  interconnect-names:
> +    description: |
> +      MDSS will have 2 port names to differentiate between the
> +      2 interconnect paths defined with interconnect specifier.

Drop description?

> +    items:
> +      - const: mdp0-mem
> +
> +  assigned-clocks:
> +    maxItems: 1
> +
> +  assigned-clock-rates:
> +    maxItems: 1

Are these properties necessary? Aren't they able to be applied to any
node? Seems like they don't need to be called out here.

> +
> +patternProperties:
> +  "^mdp@[0-9a-f]+$":

Name should be 'display-controller'?

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
> +          The following clocks are required.

Just drop this description and have items.

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

It's optional?=20

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

Add a newline please.

> +          port@1:
> +            type: object
> +            description: DPU_INTF2 (DSI2)
> +
> +      assigned-clocks:
> +        maxItems: 4
> +
> +      assigned-clock-rates:
> +        maxItems: 4

These two properties can be dropped.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names

reg-names shouldn't be required.

> +  - power-domains
> +  - clocks
> +  - clock-names

Same for clock-names technically.

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
> +
> +    soc: soc {

Is this node needed? Seems like we can remove it.

> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +
> +      mdss: mdss@ae00000 {

Node name should be something like 'subsystem@<reg>'.

> +         compatible =3D "qcom,sc7180-mdss";
> +         reg =3D <0 0xae00000 0 0x1000>;
> +         reg-names =3D "mdss";

Please drop this useless reg-names.

> +         power-domains =3D <&dispcc MDSS_GDSC>;
> +
> +         clocks =3D <&gcc GCC_DISP_AHB_CLK>,
> +                  <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                  <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +

Drop newline?

> +         clock-names =3D "iface", "ahb", "core";
> +
> +         assigned-clocks =3D <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +         assigned-clock-rates =3D <300000000>;

Ok I guess.

> +
> +         interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +         interrupt-controller;
> +         #interrupt-cells =3D <1>;
> +
> +         interconnects =3D <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
> +

Drop newline please.

> +         interconnect-names =3D "mdp0-mem";
> +
> +         iommus =3D <&apps_smmu 0x800 0x2>;
> +
> +         #address-cells =3D <2>;
> +         #size-cells =3D <2>;

Can this be much higher up?

> +
> +         mdp: mdp@ae01000 {

Node name needs some work. Drop label?

> +                   compatible =3D "qcom,sc7180-dpu";
> +                   reg =3D <0 0x0ae01000 0 0x8f000>,
> +                         <0 0x0aeb0000 0 0x2008>;

Wow size ends in 8!

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
> +                   assigned-clocks =3D <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
> +                                     <&dispcc DISP_CC_MDSS_ROT_CLK>,
> +                                     <&dispcc DISP_CC_MDSS_ROT_CLK>;

Is ROT_CLK here twice for some reason?

> +                   assigned-clock-rates =3D <300000000>,
> +                                          <19200000>,
> +                                          <19200000>,
> +                                          <19200000>;
> +
> +                   interrupt-parent =3D <&mdss>;
> +                   interrupts =3D <0 IRQ_TYPE_LEVEL_HIGH>;

Drop flags?

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
> index 0000000..17395f6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> @@ -0,0 +1,216 @@
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
> +  Device tree bindings for MSM Mobile Display Subsytem(MDSS) that encaps=
ulates
> +  sub-blocks like DPU display controller, DSI and DP interfaces etc. Dev=
ice tree
> +  bindings of MDSS and DPU are mentioned for SDM845 target.

Is this substantially different from the previous binding? Can they just
be merged together?

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
> +      Device clock names in the same order as mentioned in clocks proper=
ty.
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
> +    maxItems: 1
> +
> +  assigned-clock-rates:
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
> +        maxItems: 2
> +
> +      assigned-clock-rates:
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
> +
> +    soc: soc {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +
> +      mdss: mdss@ae00000 {
> +          compatible =3D "qcom,sdm845-mdss";
> +          reg =3D <0 0x0ae00000 0 0x1000>;
> +          reg-names =3D "mdss";
> +          power-domains =3D <&dispcc MDSS_GDSC>;
> +
> +          clocks =3D <&gcc GCC_DISP_AHB_CLK>,
> +                   <&gcc GCC_DISP_AXI_CLK>,
> +                   <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +          clock-names =3D "iface", "bus", "core";
> +
> +          assigned-clocks =3D <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +          assigned-clock-rates =3D <300000000>;
> +
> +          interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +          interrupt-controller;
> +          #interrupt-cells =3D <1>;
> +
> +          iommus =3D <&apps_smmu 0x880 0x8>,
> +                   <&apps_smmu 0xc80 0x8>;
> +
> +          #address-cells =3D <2>;
> +          #size-cells =3D <2>;
> +
> +          mdss_mdp: mdp@ae01000 {
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
> +                    assigned-clocks =3D <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                                      <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                    assigned-clock-rates =3D <300000000>,
> +                                           <19200000>;
> +
> +                    interrupt-parent =3D <&mdss>;
> +                    interrupts =3D <0 IRQ_TYPE_LEVEL_HIGH>;
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
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Docu=
mentation/devicetree/bindings/display/msm/dpu.txt
> deleted file mode 100644
> index 551ae26..0000000
> --- a/Documentation/devicetree/bindings/display/msm/dpu.txt
> +++ /dev/null
> @@ -1,141 +0,0 @@
> -Qualcomm Technologies, Inc. DPU KMS
> -
> -Description:
> -
> -Device tree bindings for MSM Mobile Display Subsytem(MDSS) that encapsul=
ates
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
> -- clock-names: device clock names, must be in same order as clocks prope=
rty.
> -  The following clocks are required:
> -  * "iface"
> -  * "bus"
> -  * "core"
> -- interrupts: interrupt signal from MDSS.
> -- interrupt-controller: identifies the node as an interrupt controller.
> -- #interrupt-cells: specifies the number of cells needed to encode an in=
terrupt
> -  source, should be 1.
> -- iommus: phandle of iommu device node.
> -- #address-cells: number of address cells for the MDSS children. Should =
be 1.
> -- #size-cells: Should be 1.
> -- ranges: parent bus address space is the same as the child bus address =
space.
> -- interconnects : interconnect path specifier for MDSS according to
> -  Documentation/devicetree/bindings/interconnect/interconnect.txt. Shoul=
d be
> -  2 paths corresponding to 2 AXI ports.
> -- interconnect-names : MDSS will have 2 port names to differentiate betw=
een the
> -  2 interconnect paths defined with interconnect specifier.
> -
> -Optional properties:
> -- assigned-clocks: list of clock specifiers for clocks needing rate assi=
gnment
> -- assigned-clock-rates: list of clock frequencies sorted in the same ord=
er as
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
> -- clock-names: device clock names, must be in same order as clocks prope=
rty.
> -  The following clocks are required.
> -  * "bus"
> -  * "iface"
> -  * "core"
> -  * "vsync"
> -- interrupts: interrupt line from DPU to MDSS.
> -- ports: contains the list of output ports from DPU device. These ports =
connect
> -  to interfaces that are external to the DPU hardware, such as DSI, DP e=
tc.
> -
> -  Each output port contains an endpoint that describes how it is connect=
ed to an
> -  external interface. These are described by the standard properties doc=
umented
> -  here:
> -       Documentation/devicetree/bindings/graph.txt
> -       Documentation/devicetree/bindings/media/video-interfaces.txt
> -
> -       Port 0 -> DPU_INTF1 (DSI1)
> -       Port 1 -> DPU_INTF2 (DSI2)
> -
> -Optional properties:
> -- assigned-clocks: list of clock specifiers for clocks needing rate assi=
gnment
> -- assigned-clock-rates: list of clock frequencies sorted in the same ord=
er as
> -  the assigned-clocks property.
> -
> -Example:
> -
> -       mdss: mdss@ae00000 {
> -               compatible =3D "qcom,sdm845-mdss";
> -               reg =3D <0xae00000 0x1000>;
> -               reg-names =3D "mdss";
> -
> -               power-domains =3D <&clock_dispcc 0>;
> -
> -               clocks =3D <&gcc GCC_DISP_AHB_CLK>, <&gcc GCC_DISP_AXI_CL=
K>,
> -                        <&clock_dispcc DISP_CC_MDSS_MDP_CLK>;
> -               clock-names =3D "iface", "bus", "core";
> -
> -               assigned-clocks =3D <&clock_dispcc DISP_CC_MDSS_MDP_CLK>;
> -               assigned-clock-rates =3D <300000000>;
> -
> -               interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> -               interrupt-controller;
> -               #interrupt-cells =3D <1>;
> -
> -               interconnects =3D <&rsc_hlos MASTER_MDP0 &rsc_hlos SLAVE_=
EBI1>,
> -                               <&rsc_hlos MASTER_MDP1 &rsc_hlos SLAVE_EB=
I1>;
> -
> -               interconnect-names =3D "mdp0-mem", "mdp1-mem";
> -
> -               iommus =3D <&apps_iommu 0>;
> -
> -               #address-cells =3D <2>;
> -               #size-cells =3D <1>;
> -               ranges =3D <0 0 0xae00000 0xb2008>;
> -
> -               mdss_mdp: mdp@ae01000 {
> -                       compatible =3D "qcom,sdm845-dpu";
> -                       reg =3D <0 0x1000 0x8f000>, <0 0xb0000 0x2008>;
> -                       reg-names =3D "mdp", "vbif";
> -
> -                       clocks =3D <&clock_dispcc DISP_CC_MDSS_AHB_CLK>,
> -                                <&clock_dispcc DISP_CC_MDSS_AXI_CLK>,
> -                                <&clock_dispcc DISP_CC_MDSS_MDP_CLK>,
> -                                <&clock_dispcc DISP_CC_MDSS_VSYNC_CLK>;
> -                       clock-names =3D "iface", "bus", "core", "vsync";
> -
> -                       assigned-clocks =3D <&clock_dispcc DISP_CC_MDSS_M=
DP_CLK>,
> -                                         <&clock_dispcc DISP_CC_MDSS_VSY=
NC_CLK>;
> -                       assigned-clock-rates =3D <0 0 300000000 19200000>;
> -
> -                       interrupts =3D <0 IRQ_TYPE_LEVEL_HIGH>;
> -
> -                       ports {
> -                               #address-cells =3D <1>;
> -                               #size-cells =3D <0>;
> -
> -                               port@0 {
> -                                       reg =3D <0>;
> -                                       dpu_intf1_out: endpoint {
> -                                               remote-endpoint =3D <&dsi=
0_in>;
> -                                       };
> -                               };
> -
> -                               port@1 {
> -                                       reg =3D <1>;
> -                                       dpu_intf2_out: endpoint {
> -                                               remote-endpoint =3D <&dsi=
1_in>;
> -                                       };
> -                               };
> -                       };
> -               };
> -       };
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-common-con=
troller.yaml b/Documentation/devicetree/bindings/display/msm/dsi-common-con=
troller.yaml
> new file mode 100644
> index 0000000..2b7d928
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-common-controller=
.yaml
> @@ -0,0 +1,235 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-common-controller.yam=
l#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DSI controller dt properties.
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Common Device tree bindings for DSI controller.
> +
> +allOf:
> +  - $ref: "../dsi-controller.yaml#"
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,mdss-dsi-ctrl
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

Don't think we need descriptions on these.

> +    maxItems: 1

It's optional?

> +
> +  phy-names:
> +    description: Name of the corresponding PHY device.

Doesn't seem like it's optional so just items: const?

> +    maxItems: 1
> +
> +  syscon-sfpb:
> +    description: A phandle to mmss_sfpb syscon node (only for DSIv2).
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +
> +      # Optional Properties for dsi controller

Weird tab?

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
> +      This is an optional property.
> +    default: 14000
> +
> +  qcom,dual-dsi-mode:
> +    type: boolean
> +    description: |
> +      Boolean value indicating if the DSI controller is

"Boolean value" is redundant.

> +      driving a panel which needs 2 DSI links.

Shouldn't this be a property of the panel?

> +
> +  qcom,master-dsi:
> +    type: boolean
> +    description: |
> +      Boolean value indicating if the DSI controller is driving
> +      the master link of the 2-DSI panel.

Shouldn't this be a property of the panel?

> +
> +  qcom,sync-dual-dsi:
> +    type: boolean
> +    description: |
> +      Boolean value indicating if the DSI controller is driving a
> +      2-DSI panel whose 2 links need receive command simultaneously.

Shouldn't this be a property of the panel?

> +
> +  pinctrl-names:
> +    description: The pin control state names.
> +    items:
> +      - const: default
> +      - const: sleep
> +
> +  pinctrl-0:
> +    description: The default pinctrl state (active)
> +
> +  pinctrl-1:
> +    description: The sleep pinctrl state (suspend)

These can be left out? Doesn't seem like they're non-standard.

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
> +      port@0:
> +        type: object
> +        description: |
> +          Input endpoints of the controller.
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +          endpoint:
> +            type: object
> +            properties:
> +              remote-endpoint:

Can this and the properties below go into some generic binding instead
of here?

> +                description: |
> +                  For port@0, set to phandle of the connected panel/brid=
ge's
> +                  input endpoint. For port@1, set to the MDP interface o=
utput.
> +                  See Documentation/devicetree/bindings/graph.txt for
> +                  device graph info.
> +
> +              data-lanes:
> +                description: |
> +                  This describes how the physical DSI data lanes are map=
ped
> +                  to the logical lanes on the given platform. The value =
contained in
> +                  index n describes what physical lane is mapped to the =
logical lane n
> +                  (DATAn, where n lies between 0 and 3). The clock lane =
position is fixed
> +                  and can't be changed. Hence, they aren't a part of the=
 DT bindings. See
> +                  Documentation/devicetree/bindings/media/video-interfac=
es.txt for
> +                  more info on the data-lanes property.
> +
> +                  For example:
> +                  data-lanes =3D <3 0 1 2>;
> +
> +                  The above mapping describes that the logical data lane=
 DATA0 is mapped
> +                  to the physical data lane DATA3, logical DATA1 to phys=
ical DATA0,
> +                  logic DATA2 to phys DATA1 and logic DATA3 to phys DATA=
2. There are
> +                  only a limited number of physical to logical mappings =
possible.
> +                oneOf:

That is a lot.

> +                  - items:
> +                    - const: 0
> +                    - const: 1
> +                    - const: 2
> +                    - const: 3
> +                  - items:
> +                    - const: 1
> +                    - const: 2
> +                    - const: 3
> +                    - const: 0
> +                  - items:
> +                    - const: 2
> +                    - const: 3
> +                    - const: 0
> +                    - const: 1
> +                  - items:
> +                    - const: 3
> +                    - const: 0
> +                    - const: 1
> +                    - const: 2
> +                  - items:
> +                    - const: 0
> +                    - const: 3
> +                    - const: 2
> +                    - const: 1
> +                  - items:
> +                    - const: 1
> +                    - const: 0
> +                    - const: 3
> +                    - const: 2
> +                  - items:
> +                    - const: 2
> +                    - const: 1
> +                    - const: 0
> +                    - const: 3
> +                  - items:
> +                    - const: 3
> +                    - const: 2
> +                    - const: 1
> +                    - const: 0
> +      port@1:
> +        type: object
> +        description: |
> +          Output endpoints of the controller.
> +        properties:
> +          reg:
> +            const: 1
> +
> +          endpoint:
> +            type: object
> +            properties:
> +              remote-endpoint: true
> +              data-lanes:
> +                oneOf:
> +                  - items:
> +                    - const: 0
> +                    - const: 1
> +                    - const: 2
> +                    - const: 3
> +                  - items:
> +                    - const: 1
> +                    - const: 2
> +                    - const: 3
> +                    - const: 0
> +                  - items:
> +                    - const: 2
> +                    - const: 3
> +                    - const: 0
> +                    - const: 1
> +                  - items:
> +                    - const: 3
> +                    - const: 0
> +                    - const: 1
> +                    - const: 2
> +                  - items:
> +                    - const: 0
> +                    - const: 3
> +                    - const: 2
> +                    - const: 1
> +                  - items:
> +                    - const: 1
> +                    - const: 0
> +                    - const: 3
> +                    - const: 2
> +                  - items:
> +                    - const: 2
> +                    - const: 1
> +                    - const: 0
> +                    - const: 3
> +                  - items:
> +                    - const: 3
> +                    - const: 2
> +                    - const: 1
> +                    - const: 0
> +
> +unevaluatedProperties: false
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller=
-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-m=
ain.yaml
> new file mode 100644
> index 0000000..418b3efe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.y=
aml
> @@ -0,0 +1,119 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DSI controller dt properties.

Drop full stop?

> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Device tree bindings for DSI controller.
> +
> +allOf:
> +  - $ref: dsi-common-controller.yaml#

That's neat, but now makes this harder to read?

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

items:
 - description:=20
 - description:=20
 - description:=20
 - description:=20

> +
> +  clock-names:
> +    items:
> +         - const: byte
> +         - const: byte_intf
> +         - const: pixel
> +         - const: core
> +         - const: iface
> +         - const: bus

Indent seems wrong.

> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: dsi
> +
> +  ports: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - phys
> +  - phy-names
> +  - ports
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +     #include <dt-bindings/interrupt-controller/arm-gic.h>
> +     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> +     #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +
> +     mdss: mdss {
> +       #address-cells =3D <2>;
> +       #size-cells =3D <2>;
> +       interrupt-controller;
> +       #interrupt-cells =3D <1>;
> +
> +       dsi0: dsi@ae94000 {
> +           compatible =3D "qcom,mdss-dsi-ctrl";
> +           reg =3D <0 0x0ae94000 0 0x400>;
> +           reg-names =3D "dsi_ctrl";
> +
> +           interrupt-parent =3D <&mdss>;
> +           interrupts =3D <4 IRQ_TYPE_LEVEL_HIGH>;
> +
> +           clocks =3D <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> +                    <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +                    <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
> +                    <&dispcc DISP_CC_MDSS_ESC0_CLK>,
> +                    <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                    <&dispcc DISP_CC_MDSS_AXI_CLK>;
> +           clock-names =3D "byte",
> +                         "byte_intf",
> +                         "pixel",
> +                         "core",
> +                         "iface",
> +                         "bus";
> +
> +           phys =3D <&dsi0_phy>;
> +           phy-names =3D "dsi";
> +
> +           ports {
> +                  #address-cells =3D <1>;
> +                  #size-cells =3D <0>;
> +
> +                  port@0 {
> +                          reg =3D <0>;
> +                          dsi0_in: endpoint {
> +                                   remote-endpoint =3D <&dpu_intf1_out>;
> +                          };
> +                  };
> +
> +                  port@1 {
> +                          reg =3D <1>;
> +                          dsi0_out: endpoint {
> +                          };
> +                  };
> +           };
> +       };
> +     };
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.y=
aml b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> new file mode 100644
> index 0000000..40d2c6b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-10nm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DSI 10nm PHY dt properties.
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Common Device tree bindings for DSI 10nm PHY.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,dsi-phy-10nm
> +      - const: qcom,dsi-phy-10nm-8998
> +
> +  reg-names:
> +    items:
> +      - const: dsi_phy
> +      - const: dsi_phy_lane
> +      - const: dsi_pll
> +
> +  clock-cells:
> +    description: |
> +      The DSI PHY block acts as a clock provider, creating
> +      2 clocks: A byte clock (index 0), and a pixel clock (index 1).
> +    const: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    description: |
> +      The following clocks are required.
> +    items:
> +      - const: iface
> +      - const: ref
> +
> +  vdds-supply:
> +    description: |
> +      Phandle to vdds regulator device node.
> +
> +  qcom,dsi-phy-regulator-ldo-mode:
> +    type: boolean
> +    description: |
> +      Boolean value indicating if the LDO mode PHY regulator is wanted (=
optional).
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - vdds-supply
> +
> +additionalProperties: true
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.y=
aml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> new file mode 100644
> index 0000000..8407255
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-14nm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DSI 14nm PHY dt properties.
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Common Device tree bindings for DSI 14nm PHY.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,dsi-phy-14nm
> +      - const: qcom,dsi-phy-14nm-660
> +
> +  reg-names:
> +    items:
> +      - const: dsi_phy
> +      - const: dsi_phy_lane
> +      - const: dsi_pll
> +
> +  clock-cells:
> +    description: |
> +      The DSI PHY block acts as a clock provider, creating
> +      2 clocks: A byte clock (index 0), and a pixel clock (index 1).
> +    const: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    description: |
> +      The following clocks are required.
> +    items:
> +      - const: iface
> +      - const: ref
> +
> +  qcom,dsi-phy-regulator-ldo-mode:

Please remove this property.

> +    type: boolean
> +    description: |
> +      Boolean value indicating if the LDO mode PHY regulator is wanted (=
optional).
> +
> +  vcca-supply:
> +    description: |
> +      Phandle to vcca regulator device node.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - vcca-supply
> +
> +additionalProperties: true
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.y=
aml b/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
> new file mode 100644
> index 0000000..ad7c1c9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-20nm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DSI 20nm PHY dt properties.
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Common Device tree bindings for DSI 20nm PHY.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,dsi-phy-20nm
> +
> +  reg-names:
> +    items:
> +      - const: dsi_pll
> +      - const: dsi_phy
> +      - const: dsi_phy_regulator
> +
> +  clock-cells:

Should be '#clock-cells'

> +    description: |
> +      The DSI PHY block acts as a clock provider, creating
> +      2 clocks: A byte clock (index 0), and a pixel clock (index 1).
> +    const: 1

i.e.

'#clock-cells':
  const: 1

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    description: |
> +      The following clocks are required.

Please remove description.

> +    items:
> +      - const: iface
> +      - const: ref
> +
> +  qcom,dsi-phy-regulator-ldo-mode:
> +    type: boolean
> +    description: |
> +      Boolean value indicating if the LDO mode PHY regulator is wanted (=
optional).

Please remove this property.

> +
> +  vcca-supply:
> +    description: |
> +      Phandle to vcca regulator device node.
> +
> +  vddio-supply:
> +    description: |
> +      Phandle to vdd-io regulator device node.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - vddio-supply
> +  - vcca-supply
> +
> +additionalProperties: true
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.y=
aml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
> new file mode 100644
> index 0000000..d48359b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-28nm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DSI 28nm PHY dt properties.
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Common Device tree bindings for DSI 28nm PHY.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,dsi-phy-28nm-hpm
> +      - const: qcom,dsi-phy-28nm-lp
> +      - const: qcom,dsi-phy-28nm-8960
> +
> +  reg-names:
> +    items:
> +      - const: dsi_pll
> +      - const: dsi_phy
> +      - const: dsi_phy_regulator
> +
> +  clock-cells:
> +    description: |
> +      The DSI PHY block acts as a clock provider, creating
> +      2 clocks: A byte clock (index 0), and a pixel clock (index 1).
> +    const: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    description: |
> +      The following clocks are required.
> +    items:
> +      - const: iface
> +      - const: ref
> +
> +  qcom,dsi-phy-regulator-ldo-mode:
> +    type: boolean
> +    description: |
> +      Boolean value indicating if the LDO mode PHY regulator is wanted (=
optional).

Please remove this property.

> +
> +  vddio-supply:
> +    description: |
> +      Phandle to vdd-io regulator device node.

Don't think we need | here, i.e just

vddio-supply:
  description: vddIO supply for dsi controller.

Honestly it would be GREAT if this told us which PX_<N> pin on the SoC
this is connected to so we don't have to dig through docs to figure out
how the hardware block is connected to the power pins on the SoC. My
understanding is the PX pins fan out to various hardware blocks inside
the SoC, so 'vddio-supply' makes sense from the internal hardware block
but at the edge of the SoC it is basically meaningless.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - vddio-supply
> +
> +additionalProperties: true
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy.yaml b=
/Documentation/devicetree/bindings/display/msm/dsi-phy.yaml
> new file mode 100644
> index 0000000..d729d89
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy.yaml
> @@ -0,0 +1,81 @@
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
> +  Device tree bindings for DSI PHY.
> +
> +allOf:
> +  - $ref: dsi-phy-10nm.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,dsi-phy-10nm

This should be merged with dsi-phy-10nm? Nothing else references the
dsi-phy-10nm.yaml binding so I'm confused why this is split from it.

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
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +     #include <dt-bindings/interrupt-controller/arm-gic.h>

This include is not used.

> +     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> +     #include <dt-bindings/clock/qcom,gcc-sdm845.h>

This include is not used.

> +     #include <dt-bindings/clock/qcom,rpmh.h>
> +
> +     mdss: mdss {
> +       #address-cells =3D <2>;
> +       #size-cells =3D <2>;

Do we need this wrapper node? I guess it helps to know where to put this
node but it's not enforced in the binding at all.

> +
> +       dsi0_phy: dsi-phy@ae94400 {

Why not just 'phy@ae94400'?

> +               compatible =3D "qcom,dsi-phy-10nm";
> +               reg =3D <0 0x0ae94400 0 0x200>,
> +                     <0 0x0ae94600 0 0x280>,
> +                     <0 0x0ae94a00 0 0x1e0>;
> +               reg-names =3D "dsi_phy",
> +                           "dsi_phy_lane",
> +                           "dsi_pll";
> +
> +               #clock-cells =3D <1>;
> +               #phy-cells =3D <0>;
> +
> +               vdds-supply =3D <&vdda_mipi_dsi0_pll>;
> +               clocks =3D <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                        <&rpmhcc RPMH_CXO_CLK>;
> +               clock-names =3D "iface", "ref";
> +
> +       };
> +     };
> +...
