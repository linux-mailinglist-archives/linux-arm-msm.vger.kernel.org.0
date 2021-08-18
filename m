Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E05C3F0C24
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Aug 2021 21:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232713AbhHRT4p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Aug 2021 15:56:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232149AbhHRT4o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Aug 2021 15:56:44 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBF6EC0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Aug 2021 12:56:08 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id o20so4981667oiw.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Aug 2021 12:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=lnkk/T/aSVI4Ump22xAFuwRx7dWfYC9RRa9zf5h/Kgg=;
        b=IX/JYcTzfF7BoKHZ+2ft1Yhwky6jC9DYooFKt3ldlMpHdw9ltSCrS4F1caWdWQ9g+/
         hyGA0mF+j5Rn+AlccOcroHSGkJ1bKtdu+wc6T9nZbh9g6DV8dv8g7LgKQYCh2UiEreIl
         JpjTt0rJFKTIQMDC0cWhkutUS4taiN7XLuPQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=lnkk/T/aSVI4Ump22xAFuwRx7dWfYC9RRa9zf5h/Kgg=;
        b=LUQLJOjFg+mAVSg4uF7+l+EQ/pT/GSSlvuHZdjSkIcfsC9sQJUmWRHt89g1XhLK7sQ
         KsasHnDdaYBo8Ueo9wfgss0sfMI2CL1z0Fi8+hM/SATG80B1+J9ZKB9Cr6QhMuo0Z3Y3
         t2qFX2fhrvnSu7JDSHJRc3+1UiH0F2ral1SboShvIkGzT1TPwYH85teVxB0Omi2dfKDj
         Du0onzqPQ3rmnmnnvTE8GinwkXaE/Ky0LERlsInfKuRBTTHFultVPRMXo9Fec7ZI/78g
         Cpz0x8+/VZ1BFclGrGMISYRjAaxgKFXxPLw2KJa61JMHHJA9kSD7C9MuyAoSVcF6qDfj
         alyA==
X-Gm-Message-State: AOAM530bDwxTTQDrAuX4NCwFDleh1npESz6r/FXzjA776WMdi5AODh5K
        ywWzry+grlofJq2/emakrqh1UiuljRk6J9R0xm7eOw==
X-Google-Smtp-Source: ABdhPJwWaSEh0l4rfS6AnLEn+5Nky79nrd23VWAk2Jz9D3cE+s4pVEATJomMUMIfl0VwJmICzX0QUe2NO2sWJ/kd0nc=
X-Received: by 2002:a05:6808:114a:: with SMTP id u10mr8633175oiu.19.1629316568179;
 Wed, 18 Aug 2021 12:56:08 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Aug 2021 12:56:07 -0700
MIME-Version: 1.0
In-Reply-To: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org>
References: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 18 Aug 2021 12:56:07 -0700
Message-ID: <CAE-0n51EY9_D26um_YjOEzcCzMvBu5m6e5jTRwsSsi_cj3mE-w@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: msm: add DT bindings for sc7280
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kalyan_t@codeaurora.org, sbillaka@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, khsieh@codeaurora.org,
        rajeevny@codeaurora.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2021-08-18 03:27:01)
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
> new file mode 100644
> index 0000000..3d256c0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
> @@ -0,0 +1,228 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dpu-sc7280.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DPU dt properties for SC7280 target

Drop "target"?

> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates

Space after Subsystem please.

> +  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
> +  bindings of MDSS and DPU are mentioned for SC7280 target.

Drop "target"?

> +
> +properties:
> +  compatible:
> +    items:

Will there be anymore? If not, drop items and only have const.

> +      - const: qcom,sc7280-mdss
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
> +
> +  ranges: true
> +
> +  interconnects:
> +    items:
> +      - description: Interconnect path specifying the port ids for data bus
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
> +          - const: qcom,sc7280-dpu

Will there be anymore? If not, drop items and only have const.

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
> +          - description: Display sf axi clock
> +          - description: Display ahb clock
> +          - description: Display lut clock
> +          - description: Display core clock
> +          - description: Display vsync clock
> +
> +      clock-names:
> +        items:
> +          - const: bus
> +          - const: nrt_bus
> +          - const: iface
> +          - const: lut
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
> +
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
> +            description: DPU_INTF1 (DSI)
> +
> +          port@1:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: DPU_INTF5 (EDP)
> +
> +        required:
> +          - port@0
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
> +    #include <dt-bindings/clock/qcom,dispcc-sc7280.h>
> +    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,sc7280.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    display-subsystem@ae00000 {

Maybe just 'subsystem' as that is generic enough.

> +         #address-cells = <1>;
> +         #size-cells = <1>;
> +         compatible = "qcom,sc7280-mdss";
> +         reg = <0xae00000 0x1000>;
> +         reg-names = "mdss";
> +         power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>;
> +         clocks = <&gcc GCC_DISP_AHB_CLK>,
> +                  <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                  <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +         clock-names = "iface", "ahb", "core";

Can these names be one per line? It makes it easier to match to the
clocks property above.

> +
> +         interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +         interrupt-controller;
> +         #interrupt-cells = <1>;
> +
> +         interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
> +         interconnect-names = "mdp0-mem";
> +
> +         iommus = <&apps_smmu 0x900 0x402>;
> +         ranges;
> +
> +         display-controller@ae01000 {
> +                   compatible = "qcom,sc7280-dpu";
> +                   reg = <0x0ae01000 0x8f000>,
> +                         <0x0aeb0000 0x2008>;
> +
> +                   reg-names = "mdp", "vbif";
> +
> +                   clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +                            <&gcc GCC_DISP_SF_AXI_CLK>,
> +                            <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                            <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +                            <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                            <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                   clock-names = "bus", "nrt_bus", "iface", "lut", "core",
> +                                 "vsync";

Can these names be one per line? It makes it easier to match to the
clocks property above.

> +
> +                   interrupt-parent = <&mdss>;
> +                   interrupts = <0>;
> +                   power-domains = <&rpmhpd SC7280_CX>;
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

Tabbed one too many times.

> +                                   };
> +                           };
> +
> +                           port@1 {
> +                                   reg = <1>;
> +                                   dpu_intf5_out: endpoint {
> +                                                  remote-endpoint = <&edp_in>;

Tabbed one too many times.

> +                                   };
> +                           };
> +                   };
> +         };
> +    };
