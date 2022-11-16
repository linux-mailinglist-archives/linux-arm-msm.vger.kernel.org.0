Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2491362BB73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 12:22:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239085AbiKPLWa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 06:22:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239306AbiKPLWF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 06:22:05 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDF9451C2E
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:10:31 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id x21so21357037ljg.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7EYrIfOfm95eEcOircu5SN8xaZDnTOMDe9lH0hYlMLs=;
        b=Pm1kE3KPNjxyYwzVKT6nAWOAQM1BlqoR0+j9YZ0/wUVnTzsKqHpdSIZvqHDFzD1+5i
         UmBRtSrDrac1mVyOtQyTEYhBdaYbS6yMHD0fSNNLqJblcW5nz37Esk0oe8xxWCkcEr5v
         ChgZJWxAq+QsmxwMW/H33gHZEjSCR0BPCdkCCTWkAv5coS/CFyjTJ5VHPk1ScTW6PauD
         mCfKN36AWldB7sBjfr3uOXoztD3qRuJguBvfUSOnn1Cuqiea9KV10gCbZhvnfV3f60pK
         QzYqgdyKL4pV9mamgjRxXk8PYrUjfNNJrk/ys1jnxr5h22pnTjUqjSi4yNkRxgF1/XRo
         IAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7EYrIfOfm95eEcOircu5SN8xaZDnTOMDe9lH0hYlMLs=;
        b=OvoKPqE7sIis/nvLvYWuJvMs3GJSMGTiNNs0QZyB5Nqt44NGOkVEl3urc5YjoGyRY3
         JYFlKhKSahZlSTmbPzsD02NRDNpfjBF3XFmixYCIii1h7+n023ZDSA9fyvanmagw+MXo
         xi9wqwDobdvq8zuK4zXX8rn8DZMPAq78TwskeKTw9gdCwgLB5lxpJu6fFhBy24XHfdIw
         YATZB2ls0P5AtkkJKopMdDor1GmI1tmaIeuV61H8SIgSJD14SOEp29hHTSm37IP6KE/H
         UnXiiL5T585RK0ZzNgvXQeuN0X8qkjNVmLsAvV/pcIM0mE8FRL3w7E3fovnmTKmZOl+l
         I5rw==
X-Gm-Message-State: ANoB5pkhRautUFcqaj8bnMK0BTTt4ghTa0HGwN8EEhwUKSBGtgUwbTvM
        4lIN0AsAK3smf0B/VceOcy8FiA==
X-Google-Smtp-Source: AA0mqf7yrtAev+rJT3azZzmbOG1r/BriCKy9e6bNbP8UFybabF5u8YMwO7e2ASaK8/RsFUlJwyJQQw==
X-Received: by 2002:a05:651c:90b:b0:277:2e8a:bc59 with SMTP id e11-20020a05651c090b00b002772e8abc59mr7137431ljq.344.1668597030273;
        Wed, 16 Nov 2022 03:10:30 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v4-20020a2ea604000000b0027713ef5360sm2956658ljp.71.2022.11.16.03.10.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 03:10:29 -0800 (PST)
Message-ID: <368cd281-b461-e668-0b57-cbb83f5b8086@linaro.org>
Date:   Wed, 16 Nov 2022 12:10:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/4] dt-bindings: pinctrl: qcom: Add SM8550 pinctrl
 bindings
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <20221116105724.2600349-1-abel.vesa@linaro.org>
 <20221116105724.2600349-2-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221116105724.2600349-2-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/11/2022 11:57, Abel Vesa wrote:
> Add device tree binding Documentation details for Qualcomm SM8550
> TLMM device
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../bindings/pinctrl/qcom,sm8550-pinctrl.yaml | 184 ++++++++++++++++++
>  1 file changed, 184 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8550-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-pinctrl.yaml
> new file mode 100644
> index 000000000000..4c5a8b78315b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-pinctrl.yaml
> @@ -0,0 +1,184 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,sm8550-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. SM8550 TLMM block
> +
> +maintainers:
> +  - Abel Vesa <abel.vesa@linaro.org>
> +
> +description: |
> +  This binding describes the Top Level Mode Multiplexer (TLMM) block found
> +  in the SM8550 platform.

Rebase on recent next and apply same changes as in 09f537065c06.

> +
> +allOf:
> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8550-tlmm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts: true
> +  interrupt-controller: true
> +  '#interrupt-cells': true
> +  gpio-controller: true
> +
> +  gpio-reserved-ranges:
> +    minItems: 1
> +    maxItems: 105
> +
> +  gpio-line-names:
> +    maxItems: 209

You have 210 GPIOs, so maxItems: 210

> +
> +  '#gpio-cells': true
> +  gpio-ranges: true
> +  wakeup-parent: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

This and required go after all properties and defs are listed.
> +
> +patternProperties:
> +  '-state$':
> +    oneOf:
> +      - $ref: "#/$defs/qcom-sm8550-tlmm-state"

Use same quotes - either ' or "

> +      - patternProperties:
> +          "-pins$":
> +            $ref: "#/$defs/qcom-sm8550-tlmm-state"
> +        additionalProperties: false
> +
> +  "^.+-hog(-[0-9]+)?$":
> +    type: object
> +    properties:
> +      gpio-hog: true
> +      gpios: true
> +      input: true
> +      output-high: true
> +      output-low: true
> +      line-name: true

Keep properties sorted by name (just like gpio-hog.yaml).

I wonder if we could add this to the common TLMM schema. It will appear
in multiple places.

> +
> +$defs:
> +  qcom-sm8550-tlmm-state:
> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +
> +    properties:
> +      pins:
> +        description:
> +          List of gpio pins affected by the properties specified in this
> +          subnode.
> +        items:
> +          oneOf:
> +            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-9])$"
> +            - enum: [ ufs_reset, sdc2_clk, sdc2_cmd, sdc2_data ]
> +        minItems: 1
> +        maxItems: 36
> +
> +      function:
> +        description:
> +          Specify the alternative function to be configured for the specified
> +          pins.
> +        enum: [ aon_cci, aoss_cti, atest_char, atest_usb,
> +                audio_ext_mclk0, audio_ext_mclk1, audio_ref_clk,
> +                cam_aon_mclk4, cam_mclk, cci_async_in, cci_i2c_scl,
> +                cci_i2c_sda, cci_timer, cmu_rng, coex_uart1_rx,
> +                coex_uart1_tx, coex_uart2_rx, coex_uart2_tx,
> +                cri_trng, dbg_out_clk, ddr_bist_complete,
> +                ddr_bist_fail, ddr_bist_start, ddr_bist_stop,
> +                ddr_pxi0, ddr_pxi1, ddr_pxi2, ddr_pxi3, dp_hot,
> +                gcc_gp1, gcc_gp2, gcc_gp3, gpio, i2chub0_se0,
> +                i2chub0_se1, i2chub0_se2, i2chub0_se3, i2chub0_se4,
> +                i2chub0_se5, i2chub0_se6, i2chub0_se7, i2chub0_se8,
> +                i2chub0_se9, i2s0_data0, i2s0_data1, i2s0_sck,
> +                i2s0_ws, i2s1_data0, i2s1_data1, i2s1_sck, i2s1_ws,
> +                ibi_i3c, jitter_bist, mdp_vsync, mdp_vsync0_out,
> +                mdp_vsync1_out, mdp_vsync2_out, mdp_vsync3_out,
> +                mdp_vsync_e, nav_gpio0, nav_gpio1, nav_gpio2,
> +                pcie0_clk_req_n, pcie1_clk_req_n, phase_flag,
> +                pll_bist_sync, pll_clk_aux, prng_rosc0, prng_rosc1,
> +                prng_rosc2, prng_rosc3, qdss_cti, qdss_gpio,
> +                qlink0_enable, qlink0_request, qlink0_wmss,
> +                qlink1_enable, qlink1_request, qlink1_wmss,
> +                qlink2_enable, qlink2_request, qlink2_wmss,
> +                qspi0, qspi1, qspi2, qspi3, qspi_clk, qspi_cs,
> +                qup1_se0, qup1_se1, qup1_se2, qup1_se3, qup1_se4,
> +                qup1_se5, qup1_se6, qup1_se7, qup2_se0,
> +                qup2_se0_l0_mira, qup2_se0_l0_mirb, qup2_se0_l1_mira,
> +                qup2_se0_l1_mirb, qup2_se0_l2_mira, qup2_se0_l2_mirb,
> +                qup2_se0_l3_mira, qup2_se0_l3_mirb, qup2_se1,
> +                qup2_se2, qup2_se3, qup2_se4, qup2_se5, qup2_se6,
> +                qup2_se7, sd_write_protect, sdc40, sdc41, sdc42,
> +                sdc43, sdc4_clk, sdc4_cmd, tb_trig_sdc2, tb_trig_sdc4,
> +                tgu_ch0_trigout, tgu_ch1_trigout, tgu_ch2_trigout,
> +                tgu_ch3_trigout, tmess_prng0, tmess_prng1, tmess_prng2,
> +                tmess_prng3, tsense_pwm1, tsense_pwm2, tsense_pwm3,
> +                uim0_clk, uim0_data, uim0_present, uim0_reset,
> +                uim1_clk, uim1_data, uim1_present, uim1_reset,
> +                usb1_hs, usb_phy, vfr_0, vfr_1, vsense_trigger_mirnat ]
> +
> +      bias-disable: true
> +      bias-pull-down: true
> +      bias-pull-up: true
> +      drive-strength: true
> +      input-enable: true
> +      output-high: true
> +      output-low: true
> +      qcom,i2c-pull: true

On current next this seems not documented.

> +
> +    required:
> +      - pins
> +
> +    allOf:
> +      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"

Drop quotes and put the same place as other bindings.

> +      - if:
> +          properties:
> +            pins:
> +              pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-9])$"
> +        then:
> +          required:
> +            - function

Drop entire if.

> +
> +    additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    pinctrl@f100000 {
> +        compatible = "qcom,sm8550-tlmm";
> +        reg = <0x0f100000 0x300000>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&tlmm 0 0 211>;

Add label to the node, since you use it.

> +        interrupt-controller;

Best regards,
Krzysztof

