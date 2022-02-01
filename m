Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7EB24A6257
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 18:26:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241480AbiBAR0d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 12:26:33 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:41497 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239385AbiBAR0d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 12:26:33 -0500
Received: by mail-ot1-f53.google.com with SMTP id b12-20020a9d754c000000b0059eb935359eso16911953otl.8;
        Tue, 01 Feb 2022 09:26:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1YcJgZXSFgUR1P0H/Wki7WoVkcK8z8lEiCx4ovxrYG0=;
        b=235jEODplqwj1qViLA8rV9Xy49jUYe3hN7u585MfBNIvBKZGlDB5Ps4PYuKOnPYO1S
         etpluQt8enmwBIeDi3HN92ZWPm8k9v1uIfCrXnVOh9/P5i8w8Vikj5ZgDbHaRddRWzuL
         tBg6cpjmSku5dRgO+ioWhOaX+34y8Xmy/cAjGHcHkhriaEPhhXIvcL+NUObECpN5JXqv
         vbXpVwECqCokKw2+YBfB2o9FMJaWuaezRnOsABf8wXybrSCNV8ZjVmAgAqxJ90d7BbFM
         LlzLaj4uXLrniK67264dyfTfyjhFUii4wPK8+xrTr6pp3YS9Ymu6PoxuaBNn2LhjzGP/
         Ia0A==
X-Gm-Message-State: AOAM533n4XoBlafwTbLAIx1ErS/KFNBUzu33pv40juXnqWxQt79m1H0S
        Zwrokt4p5Zg3PRthVNwmDw==
X-Google-Smtp-Source: ABdhPJyjuh3yIT85q6AkZ0Qo13CZn2i3dA2wkW/+fujtm0WB9mvm/QuDRweI4A2wxBBN13YX5pT1yw==
X-Received: by 2002:a9d:67d0:: with SMTP id c16mr14536009otn.270.1643736392153;
        Tue, 01 Feb 2022 09:26:32 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j3sm12707868oig.37.2022.02.01.09.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 09:26:31 -0800 (PST)
Received: (nullmailer pid 240619 invoked by uid 1000);
        Tue, 01 Feb 2022 17:26:30 -0000
Date:   Tue, 1 Feb 2022 11:26:30 -0600
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
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/5] dt-bindings: bus: add device tree bindings for
 qcom,ssc-block-bus
Message-ID: <YfltRkup8QhY2Tar@robh.at.kernel.org>
References: <20220126183250.11924-1-michael.srba@seznam.cz>
 <20220126183250.11924-3-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126183250.11924-3-michael.srba@seznam.cz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 26, 2022 at 07:32:48PM +0100, michael.srba@seznam.cz wrote:
> From: Michael Srba <Michael.Srba@seznam.cz>
> 
> This patch adds bindings for the AHB bus which exposes the SCC block in
> the global address space. This bus (and the SSC block itself) is present
> on certain qcom SoCs.
> 
> In typical configuration, this bus (as some of the clocks and registers
> that we need to manipulate) is not accessible to the OS, and the
> resources on this bus are indirectly accessed by communicating with a
> hexagon CPU core residing in the SSC block. In this configuration, the
> hypervisor is the one performing the bus initialization for the purposes
> of bringing the haxagon CPU core out of reset.
> 
> However, it is possible to change the configuration, in which case this
> binding serves to allow the OS to initialize the bus.
> 
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> ---
>  CHANGES:
>  - v2: fix issues caught by by dt-schema
>  - v3: none
>  - v4: address the issues pointed out in the review
> ---
>  .../bindings/bus/qcom,ssc-block-bus.yaml      | 150 ++++++++++++++++++
>  1 file changed, 150 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml
> 
> diff --git a/Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml b/Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml
> new file mode 100644
> index 000000000000..4bde169b1a19
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml
> @@ -0,0 +1,150 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,msm8998-ssc-block-bus
> +      - const: qcom,ssc-block-bus
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
> +    description: describes how to locate the ssc AXI halt register
> +    items:
> +      - items:
> +        - description: Phandle reference to a syscon representing TCSR
> +        - description: offset for the ssc AXI halt register
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

To say anything else should be a node:

additionalProperties:
  type: object

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
> +        // devices under this node are physically located in the SSC block, connected to an ssc-internal bus;
> +        ssc_ahb_slave: bus@10ac008 {
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +            ranges;
> +
> +            compatible = "qcom,msm8998-ssc-block-bus", "qcom,ssc-block-bus";
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

If you don't want to define a schema for this, pick another node that 
has a schema already.

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
