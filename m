Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D983E3B4B0D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jun 2021 01:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbhFYXpK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 19:45:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbhFYXpI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 19:45:08 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F84AC061767
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 16:42:46 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id o17-20020a9d76510000b02903eabfc221a9so11174937otl.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 16:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XJzIh2JkGxP58GX/cJ+/xUCKFsezqhv3QXbazK5lK4g=;
        b=QDmD+WBdd8ta+jv58fd7/QjV3qzTmxBqy5Y5N16zCKJAwX8smfAbI8/+gs8B8nTESw
         LgUrhcP3x27kyzgXautD5zNRdP3Sph+RUe10BYPD3TlaUBp5A14a4Z3v36LH1MCm4EJo
         KmGxn6JuFTfz6JXArWGRmn0AyQ9KafQDsdOmTxvDA4NMqT+tJyMKNs+1nsP7iXrSAvUn
         W7GBgoZu6JRFdNOaoAQyGol+6pPgYoHxgFAFcQQqVzNjQMhry8ONRKTtKxaCCqOi/lNJ
         KAbFxAQ3MFXn3wHc9a7I0GIFbDHzvLWKsZX8PZKzc9hNBWeDfO2TwKpQeTnmoGH8XOE0
         Ts9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XJzIh2JkGxP58GX/cJ+/xUCKFsezqhv3QXbazK5lK4g=;
        b=lLKSonXfwPt71t8ct+OddkxOnVpt3sucnBZnb3a1Vm0htt/gyAlpWf2qkAl6kCgF6N
         h1xJO0yMiaVx7ym+Fi1LtzYQU0gwCSbKoBTePvMGzW3i1ONjiwG3HUOnR3HE/V1nIrrs
         m41+v4L2Rd31Uu5FYS90Lv0ZLc9tsMjBA3jwqr+qgvD/pw7H6a/h544XsS11QkyWhyck
         Fqm+rhGM7OwEVO+H9DSEdeMpb/kSWeqYAtx+EEyFMmtxmx52WOhnO5iFQ48sfYo8DCFD
         HSNM+x2IXz0OqTl8MfytcI9zp8DYSXejDJkmBjMDGXgpQkUouzwjEbrmBq2+w4XhuCMG
         9XBQ==
X-Gm-Message-State: AOAM531w20H4YmbnnIUdH1aGaTm22JtRv0Na3pI5vdvUDFSHgeWA0pAf
        GeR124fRHyKJKzMdbWtpNRjEHw==
X-Google-Smtp-Source: ABdhPJyh5VI+bwZ7/QmSQ+hANOA4BljFjcEANpzpoXm0Mc/abMGnPvHtZIY21GdPH/UuitQTE8fsJg==
X-Received: by 2002:a9d:4006:: with SMTP id m6mr11841816ote.130.1624664565630;
        Fri, 25 Jun 2021 16:42:45 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t3sm1553002oic.48.2021.06.25.16.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 16:42:45 -0700 (PDT)
Date:   Fri, 25 Jun 2021 18:42:43 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add SM6115 pinctrl
 bindings
Message-ID: <YNZp83NhZ5p2PtQI@yoga>
References: <20210625102147.51162-1-iskren.chernev@gmail.com>
 <20210625102147.51162-2-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210625102147.51162-2-iskren.chernev@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 25 Jun 05:21 CDT 2021, Iskren Chernev wrote:

> Add device tree binding Documentation details for Qualcomm SM6115 and
> SM4250 pinctrl.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  .../bindings/pinctrl/qcom,sm6115-pinctrl.yaml | 182 ++++++++++++++++++
>  1 file changed, 182 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
> new file mode 100644
> index 000000000000..34d57a5c5f75
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
> @@ -0,0 +1,182 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,sm6115-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. SM6115, SM4250 TLMM block
> +
> +maintainers:
> +  - Iskren Chernev <iskren.chernev@gmail.com>
> +
> +description:
> +  This binding describes the Top Level Mode Multiplexer block found in the
> +  SM6115 and SM4250 platforms.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sm4250-tlmm
> +      - qcom,sm6115-tlmm
> +
> +  reg:
> +    minItems: 3
> +    maxItems: 3
> +
> +  reg-names:
> +    items:
> +      - const: west
> +      - const: south
> +      - const: east
> +
> +  interrupts:
> +    description: Specifies the TLMM summary IRQ
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    description:
> +      Specifies the PIN numbers and Flags, as defined in defined in
> +      include/dt-bindings/interrupt-controller/irq.h
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    description: Specifying the pin number and flags, as defined in
> +      include/dt-bindings/gpio/gpio.h
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  wakeup-parent:
> +    maxItems: 1
> +
> +#PIN CONFIGURATION NODES
> +patternProperties:
> +  '-state$':
> +    oneOf:
> +      - $ref: "#/$defs/qcom-sm6115-tlmm-state"
> +      - patternProperties:
> +          ".*":
> +            $ref: "#/$defs/qcom-sm6115-tlmm-state"
> +
> +'$defs':
> +  qcom-sm6115-tlmm-state:
> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
> +
> +    properties:
> +      pins:
> +        description:
> +          List of gpio pins affected by the properties specified in this
> +          subnode.
> +        items:
> +          oneOf:
> +            - pattern: "^gpio([0-9]|[1-9][0-9]|10[0-9]|11[0-3])$"
> +            - enum: [ sdc1_rclk, sdc1_clk, sdc1_cmd, sdc1_data,
> +                      sdc2_clk, sdc2_cmd, sdc2_data ]
> +        minItems: 1
> +        maxItems: 36
> +
> +      function:
> +        description:
> +          Specify the alternative function to be configured for the specified
> +          pins.
> +
> +        enum: [ adsp_ext, agera_pll, atest, cam_mclk, cci_async, cci_i2c,
> +                cci_timer, cri_trng, dac_calib, dbg_out, ddr_bist, ddr_pxi0,
> +                ddr_pxi1, ddr_pxi2, ddr_pxi3, gcc_gp1, gcc_gp2, gcc_gp3, gpio,
> +                gp_pdm0, gp_pdm1, gp_pdm2, gsm0_tx, gsm1_tx, jitter_bist,
> +                mdp_vsync, mdp_vsync_out_0, mdp_vsync_out_1, mpm_pwr, mss_lte,
> +                m_voc, nav_gpio, pa_indicator, pbs, pbs_out, phase_flag,
> +                pll_bist, pll_bypassnl, pll_reset, prng_rosc, qdss_cti,
> +                qdss_gpio, qup0, qup1, qup2, qup3, qup4, qup5, sdc1_tb,
> +                sdc2_tb, sd_write, ssbi_wtr1, tgu, tsense_pwm, uim1_clk,
> +                uim1_data, uim1_present, uim1_reset, uim2_clk, uim2_data,
> +                uim2_present, uim2_reset, usb_phy, vfr_1, vsense_trigger,
> +                wlan1_adc0, elan1_adc1 ]
> +
> +      drive-strength:
> +        enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +        default: 2
> +        description:
> +          Selects the drive strength for the specified pins, in mA.
> +
> +      bias-pull-down: true
> +
> +      bias-pull-up: true
> +
> +      bias-disable: true
> +
> +      output-high: true
> +
> +      output-low: true
> +
> +    required:
> +      - pins
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +        #include <dt-bindings/interrupt-controller/arm-gic.h>
> +        tlmm: pinctrl@500000 {
> +                compatible = "qcom,sm4250-tlmm";
> +                reg = <0x500000 0x400000>,
> +                        <0x900000 0x400000>,
> +                        <0xd00000 0x400000>;
> +                reg-names = "west", "south", "east";
> +                interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +                interrupt-controller;
> +                #interrupt-cells = <2>;
> +                gpio-ranges = <&tlmm 0 0 114>;
> +
> +                sdc2_on_state: sdc2-on-state {
> +                        clk {
> +                                pins = "sdc2_clk";
> +                                bias-disable;
> +                                drive-strength = <16>;
> +                        };
> +
> +                        cmd {
> +                                pins = "sdc2_cmd";
> +                                bias-pull-up;
> +                                drive-strength = <10>;
> +                        };
> +
> +                        data {
> +                                pins = "sdc2_data";
> +                                bias-pull-up;
> +                                drive-strength = <10>;
> +                        };
> +
> +                        sd-cd {
> +                                pins = "gpio88";
> +                                function = "gpio";
> +                                bias-pull-up;
> +                                drive-strength = <2>;
> +                        };
> +                };
> +        };
> +
> -- 
> 2.32.0
> 
