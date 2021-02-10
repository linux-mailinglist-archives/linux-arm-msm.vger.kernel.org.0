Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D38073173E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 00:04:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233231AbhBJXDr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 18:03:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232578AbhBJXDp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 18:03:45 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6383FC06178A
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 15:03:04 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id fa16so2024472pjb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 15:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=IjGlw67S4HT+y09BWaA/ElCfy4H4nmZCU+jUdyhxTME=;
        b=h2PFxIFjt/ApW7niNCOX5hg1CQD9Nt5Zv0L0c14oojSwvonX3rtsGQsNru7ajuZ0tV
         NkeVsCQRwDfDyVIrHl8iaz+PrO90WZm4WUiRwRg5taOBbxG01FTPBuNvkDqt/qMOb78q
         etTEHwkLLlfqv40kPlvXmLM05ytPpiLBWxwjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=IjGlw67S4HT+y09BWaA/ElCfy4H4nmZCU+jUdyhxTME=;
        b=HsaeZEjmzYVfYEq4M2sz3wQ7w/Oc3ftpY5PHpvAwMkDD2+xWOsbB4j2GgLo6ygUftc
         cjlAFg+smviR0XBJsEmJqydzeJoDg2pvCr4cAr8b2tsS09+FP253PRiP7tExLnaAuczz
         Jhonv88MHTXTDHz8RSgtOMPEYw7tKg7fTasYx/ArbtjZwLBZwE5JquxJHorxDiX2CcxL
         WpsN0gy4rY0d75OQ6anuRgWG7OMVV9h66Bnuxa9Ib6uDoF1eNBgzd88rm2+Ka7B9k2U9
         H6+RJUD+tleF3o3XCQ7ndZaPJjvJXwWG8TJPEmvtIAsomxyV3AH3FWaiTmZJ8sHwFQ1n
         29ag==
X-Gm-Message-State: AOAM530OWdBVUCL7+mOHptekSqLbc1hHeUizSShJrh5mubXXtBWtbl+2
        Vd98qwc5BLKahnzKyHMyiJW7Vg==
X-Google-Smtp-Source: ABdhPJyZ86C24O+6fSuPBJC1cokqDCCxNGONb+nbBduJdH5l2qug1tc/YSjVEZvKCMkMy1LwzsVUgQ==
X-Received: by 2002:a17:90a:5217:: with SMTP id v23mr1172520pjh.126.1612998183904;
        Wed, 10 Feb 2021 15:03:03 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:5533:1106:2710:3ce])
        by smtp.gmail.com with ESMTPSA id q2sm3255689pfj.32.2021.02.10.15.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 15:03:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1612957913-23982-1-git-send-email-mkrishn@codeaurora.org>
References: <1612957913-23982-1-git-send-email-mkrishn@codeaurora.org>
Subject: Re: [PATCH v11 1/4] dt-bindings: msm: disp: add yaml schemas for DPU bindings
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        kalyan_t@codeaurora.org, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        rnayak@codeaurora.org, dianders@chromium.org, sibis@codeaurora.org,
        khsieh@codeaurora.org
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Date:   Wed, 10 Feb 2021 15:03:01 -0800
Message-ID: <161299818159.418021.1243536374062913589@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2021-02-10 03:51:50)
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yam=
l b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> new file mode 100644
> index 0000000..821c253
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> @@ -0,0 +1,211 @@
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
> +    minItems: 1

Should this be maxItems: 1 instead? Is there the possibility for more
than one interrupt?

> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 1
> +
> +  iommus:
> +    maxItems: 1

Can this be 'items' instead with some description of what it is?

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
> +    minItems: 1

Any max here? I'd rather see an 'items' list similar to the clocks
property.

> +
> +  interconnect-names:
> +    items:
> +      - const: mdp0-mem

Seems like there's only one.

> +
> +patternProperties:
> +  "^mdp@[0-9a-f]+$":

Still think this should be something more generic like
display-controller.

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

Can this be 'items' list as well?

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
> +        minItems: 1
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
> +         mdp@ae01000 {
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
