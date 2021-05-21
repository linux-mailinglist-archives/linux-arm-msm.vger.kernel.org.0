Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64D5338CA84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 18:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230424AbhEUQB7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 12:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231587AbhEUQB5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 12:01:57 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DA3FC0613ED
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 09:00:32 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id i23-20020a9d68d70000b02902dc19ed4c15so18509805oto.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 09:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H63HtpaE+6Xg3N3fCciau2vnWnPyL31t9ItUFtyRdok=;
        b=QZuIb1L8Cww3FE7u/iFMOZm50aekfIs+zrZYX9X0xwy6iRDtY5kWNsIHTBbPIHCpuU
         BWnGfW7MXZqPAq4JDbctBsR919m7XzMICQJBogrnv+NRhl03wE6A5sK+1rU6PdmGmqHm
         Yqn0Euw+zfU373uQrd5n60RWRTWFZwViL2CQC6ovDdnXSGOnd3nlYN8UDMWrL1n6MYQR
         muFXMesZUnCCXt0GtvwRGTZjxKr2GmUKYSRyHuhyHLCEyfGKcn8KupXoQNjKaBsqvEJC
         FhFzIbsLlQ4o4z4HOlQqUV4JRuFU5r/+ge3eKVYLRCpqaeMERhMmzV12CS8p3tgku6aa
         K8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H63HtpaE+6Xg3N3fCciau2vnWnPyL31t9ItUFtyRdok=;
        b=CeAzlhYhDgEqPa6+ZyU0M9bZufvNkNCJAF4QP4ZeEBTTrnTcZ9WfW6Yt91bplJ5IIg
         eGIiDjYSs+J3E6qgLbn3WfeYiLxHvTwXNtW5L+Clc5MK+W4a5S+OfgHjXD71BQ8Krde/
         sqqc4chUABPNX5a94NmOoe1IzkRU3lmmBm8LWxrJFlCWZtqlkNP0U6KV3TcHfvWFmQTF
         mKMswjrj426SOqDmu42TsjJgCazSrKjBFTKQYyVGoJn6bBABRZn1oy9wUB3uUAE2B5OO
         uYr3dgf+LkIelf+uYDAyLqS2OUHkuEa+PWVgKcoDttGDcrw0qUEu3akLTDdc+nTZP8DS
         qnRw==
X-Gm-Message-State: AOAM5315WJAdr1rFrA+8mxiRfHcsn4WVDL57t1QXgRo5ILhSWFKn37Pz
        z43D2Jgsz3ss5TBoMmi/ldp2aA==
X-Google-Smtp-Source: ABdhPJxVYsBy/bGxAKrQ+85jYaJthqjgGvNjNriEMYLFbGFw4brOKshTM3SBpMd4+avuCFoQSzGFzw==
X-Received: by 2002:a05:6830:109a:: with SMTP id y26mr8900044oto.164.1621612832077;
        Fri, 21 May 2021 09:00:32 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id i9sm1275832oog.17.2021.05.21.09.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 09:00:31 -0700 (PDT)
Date:   Fri, 21 May 2021 11:00:29 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Krishna Manikandan <mkrishn@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kalyan_t@codeaurora.org,
        tanmay@codeaurora.org, abhinavk@codeaurora.org,
        robdclark@gmail.com, swboyd@chromium.org, vinod.koul@linaro.org,
        dianders@chromium.org, khsieh@codeaurora.org, robh+dt@kernel.org,
        sean@poorly.run, robh@kernel.org
Subject: Re: [PATCH v17 1/4] dt-bindings: msm: disp: add yaml schemas for DPU
 bindings
Message-ID: <20210521160029.GA2484@yoga>
References: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 21 May 05:27 CDT 2021, Krishna Manikandan wrote:
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
[..]
> +      ports:
> +        $ref: /schemas/graph.yaml#/properties/ports
> +        description: |
> +          Contains the list of output ports from DPU device. These ports
> +          connect to interfaces that are external to the DPU hardware,
> +          such as DSI, DP etc. Each output port contains an endpoint that
> +          describes how it is connected to an external interface.
> +
> +        properties:
> +          port@0:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: DPU_INTF1 (DSI1)
> +
> +          port@2:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: DPU_INTF0 (DP)

Why is port@0 INTF1 and why is port@2 INTF0? In the binding you're
translating the two ports that are described are 0 and 1, representing
INTF1 and INTF2, or DSI1 and DSI2, respectively.

Further more, I have a need for somehow describing the pairing of 4 DP
INTFs (INTF 0, 3, 4 and 5) and how they are connected to the 3+1 DP+eDP
controllers.

Downstream this seems to be handled by adding cell-index to the DP
controllers and then matching that against the numbering in the driver's
INTF array. But rather than adding cell-index to map this, can't we
define that the port index is the INTF-number here?


This would obviously break compatibility with existing DTBs, but we
could start by doing it selectively for the new compatibles, fix up the
existing dts files and then drop the selective application after 1 or 2
LTS releases.

> +
> +        required:
> +          - port@0

Does this imply that I am not allowed to build a product on sc7180 that
only has DP output?

> +
> +    required:
> +      - compatible
> +      - reg
> +      - reg-names
> +      - clocks
> +      - interrupts
> +      - power-domains
> +      - operating-points-v2
> +      - ports
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
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> +    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,sdm845.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    display-subsystem@ae00000 {
> +         #address-cells = <1>;
> +         #size-cells = <1>;
> +         compatible = "qcom,sc7180-mdss";
> +         reg = <0xae00000 0x1000>;
> +         reg-names = "mdss";
> +         power-domains = <&dispcc MDSS_GDSC>;
> +         clocks = <&gcc GCC_DISP_AHB_CLK>,
> +                  <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                  <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +         clock-names = "iface", "ahb", "core";
> +
> +         interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +         interrupt-controller;
> +         #interrupt-cells = <1>;
> +
> +         interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
> +         interconnect-names = "mdp0-mem";
> +
> +         iommus = <&apps_smmu 0x800 0x2>;
> +         ranges;
> +
> +         display-controller@ae01000 {
> +                   compatible = "qcom,sc7180-dpu";
> +                   reg = <0x0ae01000 0x8f000>,
> +                         <0x0aeb0000 0x2008>;
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
> +
> +                   interrupt-parent = <&mdss>;
> +                   interrupts = <0>;
> +                   power-domains = <&rpmhpd SC7180_CX>;
> +                   operating-points-v2 = <&mdp_opp_table>;
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
> +
> +                            port@2 {
> +                                    reg = <2>;
> +                                    dpu_intf0_out: endpoint {
> +                                                   remote-endpoint = <&dp_in>;
> +                                    };
> +                            };

The indentation is inconsistent among the ports.

> +                   };
> +         };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> new file mode 100644
> index 0000000..b4ea7c9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> @@ -0,0 +1,212 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dpu-sdm845.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DPU dt properties for SDM845 target
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
> +  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
> +  bindings of MDSS and DPU are mentioned for SDM845 target.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,sdm845-mdss
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
> +  "#address-cells": true
> +
> +  "#size-cells": true
> +
> +  "#interrupt-cells":
> +    const: 1
> +
> +  iommus:
> +    items:
> +      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
> +      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
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
> +      power-domains:
> +        maxItems: 1
> +
> +      operating-points-v2: true

You have a blank line between all other properties, but not here.

> +      ports:
> +        $ref: /schemas/graph.yaml#/properties/ports
> +        description: |
> +          Contains the list of output ports from DPU device. These ports
> +          connect to interfaces that are external to the DPU hardware,
> +          such as DSI, DP etc. Each output port contains an endpoint that
> +          describes how it is connected to an external interface.
> +
> +        properties:
> +          port@0:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: DPU_INTF1 (DSI1)
> +
> +          port@1:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: DPU_INTF2 (DSI2)
> +
> +        required:
> +          - port@0
> +          - port@1

In what sense are both these required?

> +

Regards,
Bjorn
