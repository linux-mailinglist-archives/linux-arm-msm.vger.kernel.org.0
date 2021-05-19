Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C453838952E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 20:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231311AbhESSTQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 14:19:16 -0400
Received: from mail-oi1-f177.google.com ([209.85.167.177]:45933 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230363AbhESSTP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 14:19:15 -0400
Received: by mail-oi1-f177.google.com with SMTP id w127so10123298oig.12;
        Wed, 19 May 2021 11:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Xv1R4zIlb2KLbQUXKopKjRzoOj8h7CKz2z712JBWe3w=;
        b=EgaXy6Cu7bQvmxagGHqwflysuie7rs9FLBph9ZA0uH1mOVh1JVeGfn41IPA8Ky0j3S
         JH05asCfQRsjNOi4+J2K7gHyV4SuOO3m2cm2LlQ+AucXM+sHrq6d4d+ZqRDwwR6ftaIO
         K/h77n5EMyh3KhsPCg9m2Yon6QoJ7sNGOCP6uJg6sRvKRfV9CemKTPnLXu+RrtjO3c1F
         1TtTARcYbss73Rji4Y08wZQ+Ooi3AJJy9V/GgWQEq9IF3DqIk5zAYUVKpsx9VcOOMSVi
         U4ioolbPvTTqC+WQ4lqaUCEJbiaK6dbI9T9VWS+vqjj44AX1ssF9G9PBlU3oJ6b0o0qq
         Ef8g==
X-Gm-Message-State: AOAM531BbH2JG8QI2F1JXZBtOqpX7RJxsXirBogfHlk0w77C5mJiPc3b
        qH8oM865X3MctghJ4sVxpA==
X-Google-Smtp-Source: ABdhPJweCrxBmfI0euQsWJqaqU0Wo3NZRqJvXbR8WqVWLvtZoQ0cHrGfSRTFrp4EaRxH8jqEhHYIZg==
X-Received: by 2002:a54:4690:: with SMTP id k16mr455866oic.57.1621448275201;
        Wed, 19 May 2021 11:17:55 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y13sm24379oon.32.2021.05.19.11.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 11:17:54 -0700 (PDT)
Received: (nullmailer pid 3388020 invoked by uid 1000);
        Wed, 19 May 2021 18:17:53 -0000
Date:   Wed, 19 May 2021 13:17:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dikshita Agarwal <dikshita@codeaurora.org>
Cc:     andy.gross@linaro.org, david.brown@linaro.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, stanimir.varbanov@linaro.org
Subject: Re: [RESEND v2] dt-bindings: media: venus: Add sc7280 dt schema
Message-ID: <20210519181753.GA3375586@robh.at.kernel.org>
References: <1621318440-12375-1-git-send-email-dikshita@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621318440-12375-1-git-send-email-dikshita@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 18, 2021 at 11:44:00AM +0530, Dikshita Agarwal wrote:
> Add a schema description for the venus video encoder/decoder on the sc7280.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> 
> changes since v1:
> - adrressed comments from stanimir.
> 
> this patch depends on [1],[2] & [3].
> ---
>  .../bindings/media/qcom,sc7280-venus.yaml          | 157 +++++++++++++++++++++
>  1 file changed, 157 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> 
> [1] https://patchwork.kernel.org/project/linux-clk/list/?series=449621
> [2] https://lkml.org/lkml/2021/4/9/812
> [3] https://lore.kernel.org/patchwork/project/lkml/list/?series=488429
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> new file mode 100644
> index 0000000..32bdb65
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> @@ -0,0 +1,157 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/media/qcom,sc7280-venus.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm Venus video encode and decode accelerators
> +
> +maintainers:
> +  - Stanimir Varbanov <stanimir.varbanov@linaro.org>
> +
> +description: |
> +  The Venus Iris2 IP is a video encode and decode accelerator present
> +  on Qualcomm platforms
> +
> +properties:
> +  compatible:
> +    const: qcom,sc7280-venus
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    minItems: 2
> +    maxItems: 3
> +
> +  power-domain-names:
> +    minItems: 2
> +    maxItems: 3
> +    items:
> +      - const: venus
> +      - const: vcodec0

What about the 3rd power domain name?

> +
> +  clocks:
> +    maxItems: 5
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: bus
> +      - const: iface
> +      - const: vcodec_core
> +      - const: vcodec_bus
> +
> +  iommus:
> +    maxItems: 2
> +
> +  memory-region:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: cpu-cfg
> +      - const: video-mem
> +
> +  video-decoder:
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: venus-decoder
> +
> +    required:
> +      - compatible
> +
> +    additionalProperties: false
> +
> +  video-encoder:
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: venus-encoder
> +
> +    required:
> +      - compatible
> +
> +    additionalProperties: false
> +
> +  video-firmware:
> +    type: object
> +
> +    description: |
> +      Firmware subnode is needed when the platform does not
> +      have TrustZone.
> +
> +    properties:
> +      iommus:
> +        maxItems: 1
> +
> +    required:
> +      - iommus
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - power-domains
> +  - power-domain-names
> +  - clocks
> +  - clock-names
> +  - iommus
> +  - memory-region
> +  - video-decoder
> +  - video-encoder
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +        #include <dt-bindings/clock/qcom,videocc-sc7280.h>
> +
> +        venus: video-codec@aa00000 {
> +                compatible = "qcom,sc7280-venus";
> +                reg = <0x0aa00000 0xd0600>;
> +                interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                clocks = <&videocc VIDEO_CC_MVSC_CORE_CLK>,
> +                         <&videocc VIDEO_CC_MVSC_CTL_AXI_CLK>,
> +                         <&videocc VIDEO_CC_VENUS_AHB_CLK>,
> +                         <&videocc VIDEO_CC_MVS0_CORE_CLK>,
> +                         <&videocc VIDEO_CC_MVS0_AXI_CLK>;
> +                clock-names = "core", "bus", "iface",
> +                              "vcodec_core", "vcodec_bus";
> +
> +                power-domains = <&videocc MVSC_GDSC>,
> +                                <&videocc MVS0_GDSC>;
> +                power-domain-names = "venus", "vcodec0";
> +
> +                interconnects = <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_VENUS_CFG 0>
> +                                <&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI1 0>;
> +                interconnect-names = "cpu-cfg", "video-mem";
> +
> +                iommus = <&apps_smmu 0x2180 0x20>,
> +                         <&apps_smmu 0x2184 0x20>;
> +
> +                memory-region = <&video_mem>;
> +
> +                video-decoder {
> +                        compatible = "venus-decoder";
> +                };
> +
> +                video-encoder {
> +                        compatible = "venus-encoder";
> +                };
> +
> +                video-firmware {
> +                        iommus = <&apps_smmu 0x21a2 0x0>;
> +                };
> +        };
> -- 
> 2.7.4
> 
