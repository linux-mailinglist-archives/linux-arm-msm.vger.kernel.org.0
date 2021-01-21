Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8A52FF1C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 18:25:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732933AbhAURY2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 12:24:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388754AbhAURYQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 12:24:16 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 388DCC0613D6
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 09:23:33 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id q205so2888592oig.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 09:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RQ5+Do5Cazl17/D3fpg5vQ4oJxDshM57AjN6+c8S+7g=;
        b=FuphuC3xj1Z5gDH7rxnYFK4s8vyVs7NJZzvAKAVWNH2K/xriXqrQ8r6jfRPy8RLyeq
         c2s+/1Am2en3flaj9QtEEx85/GqqFI2+NEfS+PvNIWaRA3q3yfF20ElpkWok9Y4yyr1S
         f9Z9KhYiLN724WUzivJeE8gch4xQBWRgovCvhCfkx5n9wqAH8BQW5U8bzSUBUOmmxnTq
         3VX0gUtv2FUlQjrRIb05s+M7XROi25NSPgc0+VPren3meEsgQ8EfeGc2YxGFgFuUlnsp
         TgG4MQTTsbPDbA25guJrmA5u4Aw6PiByV6NZc0uxHXk9Crj4yqXZP5UCbn1nLe6D/AAO
         QtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RQ5+Do5Cazl17/D3fpg5vQ4oJxDshM57AjN6+c8S+7g=;
        b=RdJAUs+rwYSux422hZEMqmQmRhri5Fjr6VSAjsJtGmUW9r3mfvtqAK4fsyfv2iisSL
         nGds65CdhJ2ayXb1SG9mSKydC7/xIwVlVgoshjf+tAhzqWr8SBRpqe9ORDgK9mpLGNnb
         /gskdQh7phRzfHTg/eyJsk+SvuDGdoFw4TJbtGGU/x1dftmQjjmBc2DeTF5C2MKAxtWo
         aurD2/3SVPrLZxqpb2cgznXwX4Kb9/e7lGSnJToBpQNMOjlo2nxZ9Dk5t1MNIqFPzeLZ
         usvnAj84Ifaxo8nzBnRTOmi7vZbNXd/6yFRtujM8r/ceugFq+GZUNbEPch8ePx2u+ZhF
         AyZg==
X-Gm-Message-State: AOAM533S/pbHW7Wfttl8mrPRmTcT+vX+Lm8GxVx8ViMRtJEVfcD4Cs/B
        sZ2Xa06/ROWo+uowmISnjcE8Yw==
X-Google-Smtp-Source: ABdhPJz5+T+p+Y4whp9mwJd5I3G4h+SPW3sz91ZIuVF3d595ALCFXeC+qhR2XyXV5H61PhmG7qjKRA==
X-Received: by 2002:a54:478a:: with SMTP id o10mr467888oic.100.1611249812592;
        Thu, 21 Jan 2021 09:23:32 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r1sm1090626ooq.16.2021.01.21.09.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 09:23:32 -0800 (PST)
Date:   Thu, 21 Jan 2021 11:23:30 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: pinctrl: qcom: Add SM8350 pinctrl
 bindings
Message-ID: <YAm4kjaV7A1BYlF8@builder.lan>
References: <20210121171747.3161543-1-vkoul@kernel.org>
 <20210121171747.3161543-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121171747.3161543-2-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 21 Jan 11:17 CST 2021, Vinod Koul wrote:

> Add device tree binding Documentation details for Qualcomm SM8350
> pinctrl driver.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Although that's dependent on the acceptance of the common binding in a
state similar its current one.

Regards,
Bjorn

> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../bindings/pinctrl/qcom,sm8350-pinctrl.yaml | 146 ++++++++++++++++++
>  1 file changed, 146 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
> new file mode 100644
> index 000000000000..706bc79db60b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
> @@ -0,0 +1,146 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,sm8350-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. SM8350 TLMM block
> +
> +maintainers:
> +  - Vinod Koul <vkoul@kernel.org>
> +
> +description: |
> +  This binding describes the Top Level Mode Multiplexer (TLMM) block found
> +  in the SM8350 platform.
> +
> +allOf:
> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8350-tlmm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts: true
> +  interrupt-controller: true
> +  '#interrupt-cells': true
> +  gpio-controller: true
> +  gpio-reserved-ranges: true
> +  '#gpio-cells': true
> +  gpio-ranges: true
> +  wakeup-parent: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +patternProperties:
> +  '-state$':
> +    oneOf:
> +      - $ref: "#/$defs/qcom-sm8350-tlmm-state"
> +      - patternProperties:
> +          ".*":
> +            $ref: "#/$defs/qcom-sm8350-tlmm-state"
> +
> +'$defs':
> +  qcom-sm8350-tlmm-state:
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
> +            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-3])$"
> +            - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk, sdc2_cmd, sdc2_data ]
> +        minItems: 1
> +        maxItems: 36
> +
> +      function:
> +        description:
> +          Specify the alternative function to be configured for the specified
> +          pins.
> +
> +        enum: [ atest_char, atest_usb, audio_ref, cam_mclk, cci_async,
> +                cci_i2c, cci_timer, cmu_rng, coex_uart1, coex_uart2, cri_trng,
> +                cri_trng0, cri_trng1, dbg_out, ddr_bist, ddr_pxi0, ddr_pxi1,
> +                ddr_pxi2, ddr_pxi3, dp_hot, dp_lcd, gcc_gp1, gcc_gp2, gcc_gp3,
> +                gpio, ibi_i3c, jitter_bist, lpass_slimbus, mdp_vsync, mdp_vsync0,
> +                mdp_vsync1, mdp_vsync2, mdp_vsync3, mi2s0_data0, mi2s0_data1,
> +                mi2s0_sck, mi2s0_ws, mi2s1_data0, mi2s1_data1, mi2s1_sck,
> +                mi2s1_ws, mi2s2_data0, mi2s2_data1, mi2s2_sck, mi2s2_ws,
> +                mss_grfc0, mss_grfc1, mss_grfc10, mss_grfc11, mss_grfc12,
> +                mss_grfc2, mss_grfc3, mss_grfc4, mss_grfc5, mss_grfc6,
> +                mss_grfc7, mss_grfc8, mss_grfc9, nav_gpio, pa_indicator,
> +                pcie0_clkreqn, pcie1_clkreqn, phase_flag, pll_bist, pll_clk,
> +                pri_mi2s, prng_rosc, qdss_cti, qdss_gpio, qlink0_enable,
> +                qlink0_request, qlink0_wmss, qlink1_enable, qlink1_request,
> +                qlink1_wmss, qlink2_enable, qlink2_request, qlink2_wmss, qspi0,
> +                qspi1, qspi2, qspi3, qspi_clk, qspi_cs, qup0, qup1, qup10,
> +                qup11, qup12, qup13, qup14, qup15, qup16, qup17, qup18, qup19,
> +                qup2, qup3, qup4, qup5, qup6, qup7, qup8, qup9, qup_l4, qup_l5,
> +                qup_l6, sd_write, sdc40, sdc41, sdc42, sdc43, sdc4_clk,
> +                sdc4_cmd, sec_mi2s, tb_trig, tgu_ch0, tgu_ch1, tgu_ch2,
> +                tgu_ch3, tsense_pwm1, tsense_pwm2, uim0_clk, uim0_data,
> +                uim0_present, uim0_reset, uim1_clk, uim1_data, uim1_present,
> +                uim1_reset, usb2phy_ac, usb_phy, vfr_0, vfr_1, vsense_trigger ]
> +
> +
> +      bias-disable: true
> +      bias-pull-down: true
> +      bias-pull-up: true
> +      drive-strength: true
> +      input-enable: true
> +      output-high: true
> +      output-low: true
> +      phandle: true
> +
> +    required:
> +      - pins
> +      - function
> +
> +    additionalProperties: false
> +
> +examples:
> +  - |
> +        #include <dt-bindings/interrupt-controller/arm-gic.h>
> +        pinctrl@f100000 {
> +                compatible = "qcom,sm8350-tlmm";
> +                reg = <0x0f100000 0x300000>;
> +                interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +                interrupt-controller;
> +                #interrupt-cells = <2>;
> +                gpio-ranges = <&tlmm 0 0 203>;
> +
> +                gpio-wo-subnode-state {
> +                        pins = "gpio1";
> +                        function = "gpio";
> +                };
> +
> +                uart-w-subnodes-state {
> +                        rx {
> +                                pins = "gpio18";
> +                                function = "qup3";
> +                                bias-pull-up;
> +                        };
> +
> +                        tx {
> +                                pins = "gpio19";
> +                                function = "qup3";
> +                                bias-disable;
> +                        };
> +                };
> +        };
> +...
> -- 
> 2.26.2
> 
