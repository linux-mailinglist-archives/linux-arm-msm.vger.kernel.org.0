Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C54B549A830
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jan 2022 05:08:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344482AbiAYDAA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jan 2022 22:00:00 -0500
Received: from mail-oi1-f177.google.com ([209.85.167.177]:35467 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2363136AbiAXXno (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jan 2022 18:43:44 -0500
Received: by mail-oi1-f177.google.com with SMTP id s127so28154113oig.2;
        Mon, 24 Jan 2022 15:43:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sloTTdrZw0oQkB24V2px4Kdlo+RWLKd74koj9pRg6oY=;
        b=Iz2HzRgCrV+1eemylxPR6PsU5oyFIEMhjKyc3IuYNkMlMVjWhAx2HMOdKGKUSv4R/i
         iZFQprQ7ZwDiKyC3+iRA8CdbdBcXVpoQcmfh+QssD8PsfS4qCZR+HVDKnsw6PFoVd3Xp
         Xmu2v8dD+HE3JU7nYOwwEUQLDR6+AfGRudIgoTACd1w+PNTwP/sRZMo/Wjwe4/+swJLm
         nfPQcsZqR/IuGOAyWQleTTP27NxpXXEzgPqqb05v40S3OgxZTbxi3uxhzXOCV/qJuj+7
         9yo+qyEuG5QGxmGlwTCHyGNavYXt5tmAT1mtnR5V1aFVOHuj+y9sL4v0YGDtsc9QsITD
         yKpw==
X-Gm-Message-State: AOAM532RePauPPAmwVrRbJ5FmnfQ8BX1PipnW/0mqo/eVCd0+yGNNH9+
        bdajvBtzZW2XadrdycmJGg==
X-Google-Smtp-Source: ABdhPJxPwwhpLI/Cn2Mu5NfA/tnjOa5QsoV3pil1+P42x3R7DiRGxQ7vbC5lBpzKlxDNrKdKkuuUVw==
X-Received: by 2002:a05:6808:1782:: with SMTP id bg2mr2589511oib.70.1643067823968;
        Mon, 24 Jan 2022 15:43:43 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id z186sm3995194oiz.20.2022.01.24.15.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 15:43:43 -0800 (PST)
Received: (nullmailer pid 740303 invoked by uid 1000);
        Mon, 24 Jan 2022 23:43:42 -0000
Date:   Mon, 24 Jan 2022 17:43:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     michael.srba@seznam.cz
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/5] dt-bindings: bus: add device tree bindings for
 qcom,ssc-block-bus
Message-ID: <Ye85rqmf/9f0sY83@robh.at.kernel.org>
References: <20220124121853.23600-1-michael.srba@seznam.cz>
 <20220124121853.23600-3-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124121853.23600-3-michael.srba@seznam.cz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 24, 2022 at 01:18:51PM +0100, michael.srba@seznam.cz wrote:
> From: Michael Srba <Michael.Srba@seznam.cz>
> 
>  This patch adds bindings for the AHB bus which exposes the SCC block in
>  the global address space. This bus (and the SSC block itself) is present
>  on certain qcom SoCs.
> 
>  In typical configuration, this bus (as some of the clocks and registers
>  that we need to manipulate) is not accessible to the OS, and the
>  resources on this bus are indirectly accessed by communicating with a
>  hexagon CPU core residing in the SSC block. In this configuration, the
>  hypervisor is the one performing the bus initialization for the purposes
>  of bringing the haxagon CPU core out of reset.
> 
>  However, it is possible to change the configuration, in which case this
>  binding serves to allow the OS to initialize the bus.
> 
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> ---
>  CHANGES:
>  - v2: fix issues caught by by dt-schema
>  - v3: none
> ---
>  Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml | 159 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

You should adjust your git setup for this long line.

>  1 file changed, 159 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml
> 
> diff --git a/Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml b/Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml
> new file mode 100644
> index 000000000000..f3f4a991337b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml
> @@ -0,0 +1,159 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/qcom,ssc-block-bus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: The AHB Bus Providing a Global View of the SSC Block on (some) qcom SoCs
> +
> +maintainers:
> +  - Michael Srba <Michael.Srba@seznam.cz>
> +
> +description: |
> +  This binding describes the dependencies (clocks, resets, power domains) which
> +  need to be turned on in a sequence before communication over the AHB bus
> +  becomes possible.
> +
> +  Additionally, the reg property is used to pass to the driver the location of
> +  two sadly undocumented registers which need to be poked as part of the sequence.
> +
> +  Currently, this binding is known to apply to msm8998. If the binding applies
> +  in it's current form, the compatible should contain "qcom,ssc-block-bus-v1".
> +  If the binding needs tweaking in order to apply to another SoC, this binding
> +  shall be extended.

Rather than explaining this, follow normal practice for 
> +
> +
> +properties:
> +  compatible:
> +    contains:

Drop contains.

> +      items:
> +      - enum: [ qcom,ssc-block-bus-v1 ]

qcom,msm8998-ssc-block-bus

And IMO, that should be the only compatible for now. If some other 
identical implementation appears, then it can use 
'qcom,msm8998-ssc-block-bus' too. That seems doubtful given there's a 
bunch of both older and new QCom SoCs already out there and this doesn't 
really seem like something reused unchanged.

> +      - const: qcom,ssc-block-bus
> +    description:
> +      Shall contain "qcom,ssc-block-bus"

Don't repeat what the schema says in free form text.

> +
> +  reg:
> +    description: |
> +      Shall contain the addresses of the SSCAON_CONFIG0 and SSCAON_CONFIG1
> +      registers
> +    minItems: 2
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: mpm_sscaon_config0
> +      - const: mpm_sscaon_config1
> +
> +  '#address-cells':
> +    enum: [ 1, 2 ]
> +
> +  '#size-cells':
> +    enum: [ 1, 2 ]
> +
> +  ranges: true
> +
> +  clocks:
> +    description: |
> +      Clock phandles for the xo, aggre2, gcc_im_sleep, aggre2_north,
> +      ssc_xo and ssc_ahbs clocks

Again, don't repeat.

> +    minItems: 6
> +    maxItems: 6
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +      - const: aggre2
> +      - const: gcc_im_sleep
> +      - const: aggre2_north
> +      - const: ssc_xo
> +      - const: ssc_ahbs
> +
> +  power-domains:
> +    description: Power domain phandles for the ssc_cx and ssc_mx power domains
> +    minItems: 2
> +    maxItems: 2
> +
> +  power-domain-names:
> +    items:
> +      - const: ssc_cx
> +      - const: ssc_mx
> +
> +  resets:
> +    description: |
> +      Reset phandles for the ssc_reset and ssc_bcr resets (note: ssc_bcr is the
> +      branch control register associated with the ssc_xo and ssc_ahbs clocks)
> +    minItems: 2
> +    maxItems: 2
> +
> +  reset-names:
> +    items:
> +      - const: ssc_reset
> +      - const: ssc_bcr
> +
> +  qcom,halt-regs:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      Phandle reference to a syscon representing TCSR followed by the
> +      offset within syscon for the ssc AXI halt register.

This can be a bit stricter:

items:
  - items:
      - description: Phandle reference to a syscon representing TCSR
      - description: offset for the ssc AXI halt register


> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - '#address-cells'
> +  - '#size-cells'
> +  - ranges
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - power-domain-names
> +  - resets
> +  - reset-names
> +  - qcom,halt-regs
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-msm8998.h>
> +    #include <dt-bindings/clock/qcom,rpmcc.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    soc {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        ssc_ahb_slave: bus@10ac008 { // devices under this node are physically located in the SSC block, connected to an ssc-internal bus;
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +            ranges;
> +
> +            compatible = "qcom,ssc-block-bus";
> +            reg = <0x10ac008 0x4>, <0x10ac010 0x4>;
> +            reg-names = "mpm_sscaon_config0", "mpm_sscaon_config1";
> +
> +            clocks = <&xo>,
> +                     <&rpmcc RPM_SMD_AGGR2_NOC_CLK>,
> +                     <&gcc GCC_IM_SLEEP>,
> +                     <&gcc AGGRE2_SNOC_NORTH_AXI>,
> +                     <&gcc SSC_XO>,
> +                     <&gcc SSC_CNOC_AHBS_CLK>;
> +            clock-names = "xo", "aggre2", "gcc_im_sleep", "aggre2_north", "ssc_xo", "ssc_ahbs";
> +
> +            resets = <&gcc GCC_SSC_RESET>, <&gcc GCC_SSC_BCR>;
> +            reset-names = "ssc_reset", "ssc_bcr";
> +
> +            power-domains = <&rpmpd MSM8998_SSCCX>, <&rpmpd MSM8998_SSCMX>;
> +            power-domain-names = "ssc_cx", "ssc_mx";
> +
> +            qcom,halt-regs = <&tcsr_mutex_regs 0x26000>;
> +
> +            ssc_tlmm: pinctrl@5e10000 {
> +                compatible = "qcom,msm8998-ssc-tlmm-pinctrl";
> +                reg = <0x5E10000 0x10000>;
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +                gpio-ranges = <&ssc_tlmm 0 0 20>;
> +            };
> +        };
> +    };
> -- 
> 2.34.1
> 
> 
