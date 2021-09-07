Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93287402E5A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Sep 2021 20:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345867AbhIGS3z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Sep 2021 14:29:55 -0400
Received: from mail-oo1-f46.google.com ([209.85.161.46]:43567 "EHLO
        mail-oo1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236461AbhIGS3z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Sep 2021 14:29:55 -0400
Received: by mail-oo1-f46.google.com with SMTP id y16-20020a4ad6500000b0290258a7ff4058so53455oos.10;
        Tue, 07 Sep 2021 11:28:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RgWj/Qv5gZmPND1H+/OHor/S2gG4REaKzWiuf8h5NB0=;
        b=ZXEAb2AMK6xq0DsYjrdaaH9tSSTcOoDgXif5FubqNjHab6SEGfQ2U9bNX9m3PsByM7
         bV5gX2Jb8dPuK3EUJJ3PNQltrF8nk8Enzu6u8pP52fyyyYRuyrmed3CTOFV7p+SzsXZf
         MV+uYT6cMuUbCsZphjRUV6FliF0qrGvG+WCHqH0sZIvJudm+gYTsKYz7LJwiCWQEddW4
         wTTFJ5/bNfAbBJtyqobGREYakOV4Ye0c53oFSubDA3IS817oXFTv088mUK/jZWu6g6BF
         XuHp/PKObn2cTjxmJUzNjEYKFm++XJjx46GoMyYkPI0cMWZA6V6sLFZ7mt1H5yyaWg0s
         JmXQ==
X-Gm-Message-State: AOAM533EqPK8wDk/PbkVN8gtUwldLd97fGxRNYqOQqPwvAcftJH7nCaN
        kpK5eNnRNAFvgpBIYvnZTA==
X-Google-Smtp-Source: ABdhPJzpmcGdm/qS9Y4WLEbsZ1OG4RAACOvtY26G2Dl1is2ooI+vLH2rLFKyHl6x6bgGNA7riqeHMg==
X-Received: by 2002:a4a:2549:: with SMTP id v9mr1131256ooe.28.1631039326491;
        Tue, 07 Sep 2021 11:28:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j14sm2372334oor.33.2021.09.07.11.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 11:28:45 -0700 (PDT)
Received: (nullmailer pid 107179 invoked by uid 1000);
        Tue, 07 Sep 2021 18:28:44 -0000
Date:   Tue, 7 Sep 2021 13:28:44 -0500
From:   Rob Herring <robh@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, lgirdwood@gmail.com,
        broonie@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, jami.kettunen@somainline.org,
        paul.bouchara@somainline.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, jeffrey.l.hugo@gmail.com
Subject: Re: [PATCH v7 2/6] dt-bindings: avs: cpr: Convert binding to YAML
 schema
Message-ID: <YTevXErwZ+H9BSWr@robh.at.kernel.org>
References: <20210901155735.629282-1-angelogioacchino.delregno@somainline.org>
 <20210901155735.629282-3-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901155735.629282-3-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 01, 2021 at 05:57:31PM +0200, AngeloGioacchino Del Regno wrote:
> Convert the qcom,cpr.txt document to YAML schema and place it in the
> appropriate directory, since this driver was moved from power/avs
> to soc/qcom, but forgets to move the documentation.
> 
> Fixes: a7305e684fcf ("PM: AVS: qcom-cpr: Move the driver to the qcom specific drivers")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  .../bindings/power/avs/qcom,cpr.txt           | 131 +-------------
>  .../bindings/soc/qcom/qcom,cpr.yaml           | 167 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 169 insertions(+), 131 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,cpr.yaml


> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,cpr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,cpr.yaml
> new file mode 100644
> index 000000000000..20f65427c762
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,cpr.yaml
> @@ -0,0 +1,167 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/soc/qcom/qcom,cpr.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm Core Power Reduction (CPR)
> +
> +description: |
> +  CPR (Core Power Reduction) is a technology to reduce core power on a CPU
> +  or other device. Each OPP of a device corresponds to a "corner" that has
> +  a range of valid voltages for a particular frequency. While the device is
> +  running at a particular frequency, CPR monitors dynamic factors such as
> +  temperature, etc. and suggests adjustments to the voltage to save power
> +  and meet silicon characteristic requirements.
> +
> +maintainers:
> +  - Niklas Cassel <nks@flawful.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qcom,qcs404-cpr
> +      - const: qcom,cpr
> +
> +  reg:
> +    description: Base address and size of the RBCPR register region
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: ref
> +
> +  clocks:
> +    items:
> +      - description: CPR reference clock
> +
> +  vdd-apc-supply:
> +    description: Autonomous Phase Control (APC) power supply
> +
> +  '#power-domain-cells':
> +    const: 0
> +
> +  acc-syscon:
> +    description: phandle to syscon for writing ACC settings

Needs a type reference.

> +
> +  nvmem-cells:
> +    minItems: 9
> +    maxItems: 32
> +    description: Cells containing the fuse corners and revision data
> +
> +  nvmem-cell-names:
> +    minItems: 9
> +    maxItems: 32

There were a bunch of names defined that you dropped.

> +
> +  operating-points-v2: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clock-names
> +  - clocks
> +  - vdd-apc-supply
> +  - "#power-domain-cells"
> +  - nvmem-cells
> +  - nvmem-cell-names
> +  - operating-points-v2
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    cpus {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        cpu@100 {
> +            compatible = "arm,cortex-a53";
> +            device_type = "cpu";
> +            reg = <0x100>;
> +            operating-points-v2 = <&cpu_opp_table>;
> +            power-domains = <&cpr>;
> +            power-domain-names = "cpr";
> +        };
> +    };
> +
> +    cpu_opp_table: opp-table-cpu {
> +        compatible = "operating-points-v2-kryo-cpu";
> +        opp-shared;
> +
> +        opp-1094400000 {
> +            opp-hz = /bits/ 64 <1094400000>;
> +            required-opps = <&cpr_opp1>;
> +        };
> +        opp-1248000000 {
> +            opp-hz = /bits/ 64 <1248000000>;
> +            required-opps = <&cpr_opp2>;
> +        };
> +        opp-1401600000 {
> +            opp-hz = /bits/ 64 <1401600000>;
> +            required-opps = <&cpr_opp3>;
> +        };
> +    };
> +
> +    cpr_opp_table: opp-table-cpr {
> +        compatible = "operating-points-v2-qcom-level";
> +
> +        cpr_opp1: opp1 {
> +            opp-level = <1>;
> +            qcom,opp-fuse-level = <1>;
> +        };
> +        cpr_opp2: opp2 {
> +            opp-level = <2>;
> +            qcom,opp-fuse-level = <2>;
> +        };
> +        cpr_opp3: opp3 {
> +            opp-level = <3>;
> +            qcom,opp-fuse-level = <3>;
> +        };
> +    };
> +
> +    power-controller@b018000 {
> +        compatible = "qcom,qcs404-cpr", "qcom,cpr";
> +        reg = <0x0b018000 0x1000>;
> +        interrupts = <0 15 IRQ_TYPE_EDGE_RISING>;
> +        clocks = <&xo_board>;
> +        clock-names = "ref";
> +        vdd-apc-supply = <&pms405_s3>;
> +        #power-domain-cells = <0>;
> +        operating-points-v2 = <&cpr_opp_table>;
> +        acc-syscon = <&tcsr>;
> +
> +        nvmem-cells = <&cpr_efuse_quot_offset1>,
> +                      <&cpr_efuse_quot_offset2>,
> +                      <&cpr_efuse_quot_offset3>,
> +                      <&cpr_efuse_init_voltage1>,
> +                      <&cpr_efuse_init_voltage2>,
> +                      <&cpr_efuse_init_voltage3>,
> +                      <&cpr_efuse_quot1>,
> +                      <&cpr_efuse_quot2>,
> +                      <&cpr_efuse_quot3>,
> +                      <&cpr_efuse_ring1>,
> +                      <&cpr_efuse_ring2>,
> +                      <&cpr_efuse_ring3>,
> +                      <&cpr_efuse_revision>;
> +        nvmem-cell-names = "cpr0_quotient_offset1",
> +                           "cpr0_quotient_offset2",
> +                           "cpr0_quotient_offset3",
> +                           "cpr0_init_voltage1",
> +                           "cpr0_init_voltage2",
> +                           "cpr0_init_voltage3",
> +                           "cpr0_quotient1",
> +                           "cpr0_quotient2",
> +                           "cpr0_quotient3",
> +                           "cpr0_ring_osc1",
> +                           "cpr0_ring_osc2",
> +                           "cpr0_ring_osc3",
> +                           "cpr_fuse_revision";
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f58dad1a1922..90f1db301fae 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15490,7 +15490,7 @@ M:	Niklas Cassel <nks@flawful.org>
>  L:	linux-pm@vger.kernel.org
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/power/avs/qcom,cpr.txt
> +F:	Documentation/devicetree/bindings/soc/qcom/qcom,cpr.yaml
>  F:	drivers/soc/qcom/cpr.c
>  
>  QUALCOMM CPUFREQ DRIVER MSM8996/APQ8096
> -- 
> 2.32.0
> 
> 
