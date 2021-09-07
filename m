Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF71C402E73
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Sep 2021 20:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345873AbhIGSih (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Sep 2021 14:38:37 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:33552 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230354AbhIGSih (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Sep 2021 14:38:37 -0400
Received: by mail-ot1-f48.google.com with SMTP id c42-20020a05683034aa00b0051f4b99c40cso349300otu.0;
        Tue, 07 Sep 2021 11:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VGXBiHd8aGiY42ZI/fI58ICBBOHjaU8L6zf9vtrLjgM=;
        b=nJBCwNDN55C7kWeIdu3aX3sKoAODbBss6uHoykb3ryTf9DVDSMI9lpSAwvxkW3wcj/
         XX7K8KaiCuQG++WGG5mFmNgTj3APNFSNRJCxom0T0FXAuUKXxd8xN/E+xuoZoy6kI9Jt
         sqZjZ+WNF130UffmSqT1k8ejM0o5g+X4bjQGKTW16ZA9UvF+D8tWVWlqCjAnZd2s0bjw
         ySkdffiJUDb5Xv9gYjY1colsPS1VmJWqwdtk16aY3J96eBYVrv76A3BhQl2r+dTBzq4R
         +Awtn6kFkSByHWs4xeJGlkmyfEy/crhH1WPxQF23+t1i6AEkWBC6FehBzJb2zwZ3UgJe
         6NBQ==
X-Gm-Message-State: AOAM531917abJWTuzS8DuIwNepveItjMgOnZ3/BMWgWCznm1WR8sFMQ6
        7KEh7hwscH6k5Ufn54PmTA==
X-Google-Smtp-Source: ABdhPJzpedN7Uv+lz7hd5t31kUf84boXO+DYEziXPnP+k2WKfHCFw4wTNB1/H2gD4Z64yRKl0c0l3w==
X-Received: by 2002:a05:6830:91:: with SMTP id a17mr17024877oto.189.1631039849985;
        Tue, 07 Sep 2021 11:37:29 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id b11sm2372980ooi.0.2021.09.07.11.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 11:37:29 -0700 (PDT)
Received: (nullmailer pid 122301 invoked by uid 1000);
        Tue, 07 Sep 2021 18:37:28 -0000
Date:   Tue, 7 Sep 2021 13:37:28 -0500
From:   Rob Herring <robh@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, dmitry.baryshkov@linaro.org,
        abhinavk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        paul.bouchara@somainline.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: display: msm: Add binding for msm8998
 dpu
Message-ID: <YTexaJuQSNazh9sn@robh.at.kernel.org>
References: <20210901181138.1052653-1-angelogioacchino.delregno@somainline.org>
 <20210901181138.1052653-3-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901181138.1052653-3-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 01, 2021 at 08:11:38PM +0200, AngeloGioacchino Del Regno wrote:
> Add yaml binding for msm8998 dpu1 support.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  .../bindings/display/msm/dpu-msm8998.yaml     | 220 ++++++++++++++++++
>  1 file changed, 220 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
> new file mode 100644
> index 000000000000..db435342ecbf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
> @@ -0,0 +1,220 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dpu-msm8998.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DPU dt properties for MSM8998 target
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> +
> +description: |
> +  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
> +  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
> +  bindings of MDSS and DPU are mentioned for MSM8998 target.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,msm8998-mdss
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
> +      - description: Display AHB clock
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
> +          - const: qcom,msm8998-dpu
> +
> +      reg:
> +        items:
> +          - description: Address offset and size for mdp register set
> +          - description: Address offset and size for regdma register set
> +          - description: Address offset and size for vbif register set
> +          - description: Address offset and size for non-realtime vbif register set
> +
> +      reg-names:
> +        items:
> +          - const: mdp
> +          - const: regdma
> +          - const: vbif
> +          - const: vbif_nrt
> +
> +      clocks:
> +        items:
> +          - description: Display ahb clock
> +          - description: Display axi clock
> +          - description: Display mem-noc clock
> +          - description: Display core clock
> +          - description: Display vsync clock
> +
> +      clock-names:
> +        items:
> +          - const: iface
> +          - const: bus
> +          - const: mnoc
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
> +    #include <dt-bindings/clock/qcom,mmcc-msm8998.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    display-subsystem@c900000 {
> +        compatible = "qcom,msm8998-mdss";
> +        reg = <0x0c900000 0x1000>;
> +        reg-names = "mdss";
> +
> +        clocks = <&mmcc MDSS_AHB_CLK>,
> +                 <&mmcc MDSS_AXI_CLK>,
> +                 <&mmcc MDSS_MDP_CLK>;
> +        clock-names = "iface", "bus", "core";
> +
> +        #address-cells = <1>;
> +        #interrupt-cells = <1>;
> +        #size-cells = <1>;
> +
> +        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-controller;
> +        iommus = <&mmss_smmu 0>;
> +
> +        power-domains = <&mmcc MDSS_GDSC>;
> +        ranges;
> +        status = "disabled";

Drop. Why disable an example?

> +
> +        display-controller@c901000 {
> +            compatible = "qcom,msm8998-dpu";
> +            reg = <0x0c901000 0x8f000>,
> +                  <0x0c9a8e00 0xf0>,
> +                  <0x0c9b0000 0x2008>,
> +                  <0x0c9b8000 0x1040>;
> +            reg-names = "mdp", "regdma", "vbif", "vbif_nrt";
> +
> +            clocks = <&mmcc MDSS_AHB_CLK>,
> +                     <&mmcc MDSS_AXI_CLK>,
> +                     <&mmcc MNOC_AHB_CLK>,
> +                     <&mmcc MDSS_MDP_CLK>,
> +                     <&mmcc MDSS_VSYNC_CLK>;
> +            clock-names = "iface", "bus", "mnoc", "core", "vsync";
> +
> +            interrupt-parent = <&mdss>;
> +            interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +            operating-points-v2 = <&mdp_opp_table>;
> +            power-domains = <&rpmpd MSM8998_VDDMX>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    dpu_intf1_out: endpoint {
> +                        remote-endpoint = <&dsi0_in>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    dpu_intf2_out: endpoint {
> +                        remote-endpoint = <&dsi1_in>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...
> -- 
> 2.32.0
> 
> 
