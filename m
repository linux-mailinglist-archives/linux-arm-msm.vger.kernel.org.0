Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C75912FF55
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jan 2020 00:59:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbgACX7G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jan 2020 18:59:06 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:33051 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbgACX7G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jan 2020 18:59:06 -0500
Received: by mail-io1-f68.google.com with SMTP id z8so43059797ioh.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2020 15:59:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LACUrtg785uiAnshI5y6g26nVt7CN5SDOx6ApB3lhZY=;
        b=lf/XFtUc7Z1L5VmaNc9E9V6Oj2XURi+swBl4ttG5yCtljx5RuwgtCDBTAkq4zfWQMS
         +T2X7K7uCRtIJ7IDnOwC2SLTiD2da+U8jTYKMzDwKev7eDYzVE1Pnfu49tdEVfFcDm9F
         r0qDOkygDyQ2yNwTVUK4Geb9ILDoKVEWwps9uqN08dxd5YL6ajQKajT3NWkPi1Kvvbqr
         3maCztXWl7PTJwmL3ctWF2aAqBAF0pH3jHwd/gi/qbACEqLb25BWTXlb9mXnmTYv4a6O
         IeVoFRNtbYiviArywf01py766NDrrt6t832QXw3i/8dmnKGvEFjejwec3lQoH0WSqPav
         M4eg==
X-Gm-Message-State: APjAAAXRsh7H4rYykYzVDoHni4l6GiRkwT1fJmYiD5D0R92cfOYHjp6V
        /7IDpbUtz5rwntbYzuweIKaWuUM=
X-Google-Smtp-Source: APXvYqwUDmnBWEUXK7rdq35IkwaneGke0yIc5UlF8O/F8XOXFgeqgjiDvnmrkTQpk2FzcrP0jS5c4A==
X-Received: by 2002:a5e:cb4b:: with SMTP id h11mr55467906iok.302.1578095945259;
        Fri, 03 Jan 2020 15:59:05 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id m22sm15390365ion.1.2020.01.03.15.59.04
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 15:59:04 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219a5
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 16:59:02 -0700
Date:   Fri, 3 Jan 2020 16:59:02 -0700
From:   Rob Herring <robh@kernel.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        dikshita@codeaurora.org
Subject: Re: [PATCH v3 06/12] dt-bindings: media: venus: Convert msm8916 to
 DT schema
Message-ID: <20200103235902.GA7619@bogus>
References: <20191223113311.20602-1-stanimir.varbanov@linaro.org>
 <20191223113311.20602-7-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191223113311.20602-7-stanimir.varbanov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 23, 2019 at 01:33:05PM +0200, Stanimir Varbanov wrote:
> Convert qcom,msm8916-venus Venus binding to DT schema
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../bindings/media/qcom,msm8916-venus.yaml    | 117 ++++++++++++++++++
>  1 file changed, 117 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
> new file mode 100644
> index 000000000000..14331c16135c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
> @@ -0,0 +1,117 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm Venus video encode and decode accelerators
> +
> +maintainers:
> +  - Stanimir Varbanov <stanimir.varbanov@linaro.org>
> +
> +description: |
> +  The Venus IP is a video encode and decode accelerator present
> +  on Qualcomm platforms
> +
> +properties:
> +  compatible:
> +    const: "qcom,msm8916-venus"

No need for quotes.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: iface
> +      - const: bus
> +
> +  iommus:
> +    minItems: 1
> +    maxItems: 20

You can have 20 IOMMUs attached to the Venus IP? The binding is for 1 
SoC, you should know how many IOMMUs there are.

> +
> +  memory-region:
> +    maxItems: 1
> +
> +  video-decoder:
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: "venus-decoder"
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
> +        const: "venus-encoder"
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
> +        minItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - power-domains
> +  - clocks
> +  - clock-names
> +  - iommus
> +  - memory-region
> +  - video-decoder
> +  - video-encoder
> +
> +examples:
> +  - |
> +        #include <dt-bindings/interrupt-controller/arm-gic.h>
> +        #include <dt-bindings/clock/qcom,gcc-msm8916.h>
> +
> +        video-codec@1d00000 {
> +                compatible = "qcom,msm8916-venus";
> +                reg = <0x01d00000 0xff000>;
> +                interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +                clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
> +                        <&gcc GCC_VENUS0_AHB_CLK>,
> +                        <&gcc GCC_VENUS0_AXI_CLK>;
> +                clock-names = "core", "iface", "bus";
> +                power-domains = <&gcc VENUS_GDSC>;
> +                iommus = <&apps_iommu 5>;
> +                memory-region = <&venus_mem>;
> +
> +                video-decoder {
> +                        compatible = "venus-decoder";
> +                };
> +
> +                video-encoder {
> +                        compatible = "venus-encoder";
> +                };
> +        };
> -- 
> 2.17.1
> 
