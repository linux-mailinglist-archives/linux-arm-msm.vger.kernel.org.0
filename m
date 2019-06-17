Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BAC147904
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 06:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbfFQETp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 00:19:45 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38069 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725778AbfFQETp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 00:19:45 -0400
Received: by mail-pf1-f193.google.com with SMTP id a186so4918305pfa.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Jun 2019 21:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=su04xXw6GGHIofn8gHd4eVNyLDpa8LxhUwEEkPCpQSc=;
        b=YJhjCP+avzmLyCZ57MYpCElLTjwZ23ewu4kgW4XKVBE7MtmciCKZ1j3hIAmIE/XUxE
         fcx2PDdatG4zisiSu7a2wrnHc7+C7A0ENUCoIB8gekNnJDRORrJr1SWUuEfD6JD6/qe+
         SXfRlGxJ4kPCstyaTescr1Akp7yfq8ksLq8rRsT4M74j3SmkRrGPjhbDdllBSC1wiQTL
         XYmhvwOeuJFQy/4ZqYQXAuoQrObbN8xIxamP6brJMwyt9o0DbISe6/p/ta0SRGsXqpGA
         RkeYUipqaOmPfE0+VewVya4V4kZfJXYXeRlaKpra2II3mJa3h+gbmYYnkTHfR62kMiOY
         zt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=su04xXw6GGHIofn8gHd4eVNyLDpa8LxhUwEEkPCpQSc=;
        b=E/bBqdihkVaNOT/3BBa7RpKlnCmDWi0w0L4VUI6SzkfNubFDlj4qQQIIpLEbQqTDSE
         jbGULPh49nu51NFhhIAPAtTVzLBtXw3XOCUwOpvmhPF+yiI1u3wjBdz1H3wYp6lBMfGU
         qkB1HZ5Ghh5rIFnLkesULF1Kp8gCfm1fU9tlLa4ABUKHk3OZp9JmrgejIHOBaQiWFynn
         P+1F+t3VvtnTAAql+hgjt0yLOx8Ann/uQhDlDOe5mAeppbRZBCcWyMiecLWrAoVQH6uM
         X+tZRfV+Rj972KNLKbXYJtU/RBaEf2Nb2Q0RYji8EKhAmy/RDgnAIZK5uqfYpouDDWLo
         enGQ==
X-Gm-Message-State: APjAAAXLYOFk7dCOvnFyUkQC8z5gzD0DNeYK3rgUqu5De95ONV8QL2Ya
        PrgKBCxjqiCxBni0SLnpDx9ZiQ==
X-Google-Smtp-Source: APXvYqzv4B+xbIgPU1Wr28MlogF/SGpcxZD14TGttwkrvvwt0+IyKNSX+kQV7wtwLOWxFafGuZfk3Q==
X-Received: by 2002:a17:90a:3225:: with SMTP id k34mr23875597pjb.31.1560745183911;
        Sun, 16 Jun 2019 21:19:43 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j8sm9497867pfi.148.2019.06.16.21.19.42
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 16 Jun 2019 21:19:43 -0700 (PDT)
Date:   Sun, 16 Jun 2019 21:20:32 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Isaac J . Manjarres" <isaacm@codeaurora.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add SM8150 pinctrl
 binding
Message-ID: <20190617042032.GE750@tuxbook-pro>
References: <20190614053032.24208-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614053032.24208-1-vkoul@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 13 Jun 22:30 PDT 2019, Vinod Koul wrote:

> From: Prasad Sodagudi <psodagud@codeaurora.org>
> 
> Add the binding for the TLMM pinctrl block found in the SM8150 platform.
> 
> Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../bindings/pinctrl/qcom,sm8150-pinctrl      | 200 ++++++++++++++++++
>  1 file changed, 200 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8150-pinctrl
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8150-pinctrl b/Documentation/devicetree/bindings/pinctrl/qcom,sm8150-pinctrl
> new file mode 100644
> index 000000000000..4f21d18b0be2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8150-pinctrl
> @@ -0,0 +1,200 @@
> +Qualcomm SM8150 TLMM block
> +
> +This binding describes the Top Level Mode Multiplexer block found in the
> +QCS404 platform.
> +
> +- compatible:
> +	Usage: required
> +	Value type: <string>
> +	Definition: must be "qcom,sm8150-pinctrl"
> +
> +- reg:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: the base address and size of the north, south , west

Extra space after south.

> +		    and east TLMM tiles.
> +
> +- reg-names:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Defintiion: names for the cells of reg, must contain "north", "south"
> +		    "west" and "east".
> +
> +- interrupts:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: should specify the TLMM summary IRQ.
> +
> +- interrupt-controller:
> +	Usage: required
> +	Value type: <none>
> +	Definition: identifies this node as an interrupt controller
> +
> +- #interrupt-cells:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: must be 2. Specifying the pin number and flags, as defined
> +		    in <dt-bindings/interrupt-controller/irq.h>
> +
> +- gpio-controller:
> +	Usage: required
> +	Value type: <none>
> +	Definition: identifies this node as a gpio controller
> +
> +- #gpio-cells:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: must be 2. Specifying the pin number and flags, as defined
> +		    in <dt-bindings/gpio/gpio.h>
> +

Please also document gpio-ranges and gpio-reserved-ranges.

> +Please refer to ../gpio/gpio.txt and ../interrupt-controller/interrupts.txt for
> +a general description of GPIO and interrupt bindings.
> +
> +Please refer to pinctrl-bindings.txt in this directory for details of the
> +common pinctrl bindings used by client devices, including the meaning of the
> +phrase "pin configuration node".
> +
> +The pin configuration nodes act as a container for an arbitrary number of
> +subnodes. Each of these subnodes represents some desired configuration for a
> +pin, a group, or a list of pins or groups. This configuration can include the
> +mux function to select on those pin(s)/group(s), and various pin configuration
> +parameters, such as pull-up, drive strength, etc.
> +
> +
> +PIN CONFIGURATION NODES:
> +
> +The name of each subnode is not important; all subnodes should be enumerated
> +and processed purely based on their content.
> +
> +Each subnode only affects those parameters that are explicitly listed. In
> +other words, a subnode that lists a mux function but no pin configuration
> +parameters implies no information about any pin configuration parameters.
> +Similarly, a pin subnode that describes a pullup parameter implies no
> +information about e.g. the mux function.
> +
> +
> +The following generic properties as defined in pinctrl-bindings.txt are valid
> +to specify in a pin configuration subnode:
> +
> +- pins:
> +	Usage: required
> +	Value type: <string-array>
> +	Definition: List of gpio pins affected by the properties specified in
> +		    this subnode.
> +
> +		    Valid pins are:
> +		      gpio0-gpio149
> +		        Supports mux, bias and drive-strength
> +
> +		      sdc1_clk, sdc1_cmd, sdc1_data sdc2_clk, sdc2_cmd,
> +		      sdc2_data sdc1_rclk
> +		        Supports bias and drive-strength
> +
> +		      ufs_reset
> +		        Supports bias and drive-strength
> +
> +- function:
> +	Usage: required
> +	Value type: <string>
> +	Definition: Specify the alternative function to be configured for the
> +		    specified pins. Functions are only valid for gpio pins.
> +		    Valid values are:
> +
> +		    blsp_uart1, blsp_spi1, blsp_i2c1, blsp_uim1, atest_tsens,
> +		    bimc_dte1, dac_calib0, blsp_spi8, blsp_uart8, blsp_uim8,
> +		    qdss_cti_trig_out_b, bimc_dte0, dac_calib1, qdss_cti_trig_in_b,
> +		    dac_calib2, atest_tsens2, atest_usb1, blsp_spi10, blsp_uart10,
> +		    blsp_uim10, atest_bbrx1, atest_usb13, atest_bbrx0, atest_usb12,
> +		    mdp_vsync, edp_lcd, blsp_i2c10, atest_gpsadc1, atest_usb11,
> +		    atest_gpsadc0, edp_hot, atest_usb10, m_voc, dac_gpio, atest_char,
> +		    cam_mclk, pll_bypassnl, qdss_stm7, blsp_i2c8, qdss_tracedata_b,
> +		    pll_reset, qdss_stm6, qdss_stm5, qdss_stm4, atest_usb2, cci_i2c,
> +		    qdss_stm3, dac_calib3, atest_usb23, atest_char3, dac_calib4,
> +		    qdss_stm2, atest_usb22, atest_char2, qdss_stm1, dac_calib5,
> +		    atest_usb21, atest_char1, dbg_out, qdss_stm0, dac_calib6,
> +		    atest_usb20, atest_char0, dac_calib10, qdss_stm10,
> +		    qdss_cti_trig_in_a, cci_timer4, blsp_spi6, blsp_uart6, blsp_uim6,
> +		    blsp2_spi, qdss_stm9, qdss_cti_trig_out_a, dac_calib11,
> +		    qdss_stm8, cci_timer0, qdss_stm13, dac_calib7, cci_timer1,
> +		    qdss_stm12, dac_calib8, cci_timer2, blsp1_spi, qdss_stm11,
> +		    dac_calib9, cci_timer3, cci_async, dac_calib12, blsp_i2c6,
> +		    qdss_tracectl_a, dac_calib13, qdss_traceclk_a, dac_calib14,
> +		    dac_calib15, hdmi_rcv, dac_calib16, hdmi_cec, pwr_modem,
> +		    dac_calib17, hdmi_ddc, pwr_nav, dac_calib18, pwr_crypto,
> +		    dac_calib19, hdmi_hot, dac_calib20, dac_calib21, pci_e0,
> +		    dac_calib22, dac_calib23, dac_calib24, tsif1_sync, dac_calib25,
> +		    sd_write, tsif1_error, blsp_spi2, blsp_uart2, blsp_uim2,
> +		    qdss_cti, blsp_i2c2, blsp_spi3, blsp_uart3, blsp_uim3, blsp_i2c3,
> +		    uim3, blsp_spi9, blsp_uart9, blsp_uim9, blsp10_spi, blsp_i2c9,
> +		    blsp_spi7, blsp_uart7, blsp_uim7, qdss_tracedata_a, blsp_i2c7,
> +		    qua_mi2s, gcc_gp1_clk_a, ssc_irq, uim4, blsp_spi11, blsp_uart11,
> +		    blsp_uim11, gcc_gp2_clk_a, gcc_gp3_clk_a, blsp_i2c11, cri_trng0,
> +		    cri_trng1, cri_trng, qdss_stm18, pri_mi2s, qdss_stm17, blsp_spi4,
> +		    blsp_uart4, blsp_uim4, qdss_stm16, qdss_stm15, blsp_i2c4,
> +		    qdss_stm14, dac_calib26, spkr_i2s, audio_ref, lpass_slimbus,
> +		    isense_dbg, tsense_pwm1, tsense_pwm2, btfm_slimbus, ter_mi2s,
> +		    qdss_stm22, qdss_stm21, qdss_stm20, qdss_stm19, gcc_gp1_clk_b,
> +		    sec_mi2s, blsp_spi5, blsp_uart5, blsp_uim5, gcc_gp2_clk_b,
> +		    gcc_gp3_clk_b, blsp_i2c5, blsp_spi12, blsp_uart12, blsp_uim12,
> +		    qdss_stm25, qdss_stm31, blsp_i2c12, qdss_stm30, qdss_stm29,
> +		    tsif1_clk, qdss_stm28, tsif1_en, tsif1_data, sdc4_cmd, qdss_stm27,
> +		    qdss_traceclk_b, tsif2_error, sdc43, vfr_1, qdss_stm26, tsif2_clk,
> +		    sdc4_clk, qdss_stm24, tsif2_en, sdc42, qdss_stm23, qdss_tracectl_b,
> +		    sd_card, tsif2_data, sdc41, tsif2_sync, sdc40, mdp_vsync_p_b,
> +		    ldo_en, mdp_vsync_s_b, ldo_update, blsp11_uart_tx_b, blsp11_uart_rx_b,
> +		    blsp11_i2c_sda_b, prng_rosc, blsp11_i2c_scl_b, uim2, uim1, uim_batt,
> +		    pci_e2, pa_indicator, adsp_ext, ddr_bist, qdss_tracedata_11,
> +		    qdss_tracedata_12, modem_tsync, nav_dr, nav_pps, pci_e1, gsm_tx,
> +		    qspi_cs, ssbi2, ssbi1, mss_lte, qspi_clk, qspi0, qspi1, qspi2, qspi3,
> +		    gpio
> +
> +- bias-disable:
> +	Usage: optional
> +	Value type: <none>
> +	Definition: The specified pins should be configued as no pull.
> +
> +- bias-pull-down:
> +	Usage: optional
> +	Value type: <none>
> +	Definition: The specified pins should be configued as pull down.
> +
> +- bias-pull-up:
> +	Usage: optional
> +	Value type: <none>
> +	Definition: The specified pins should be configued as pull up.
> +
> +- output-high:
> +	Usage: optional
> +	Value type: <none>
> +	Definition: The specified pins are configured in output mode, driven
> +		    high.
> +		    Not valid for sdc pins.
> +
> +- output-low:
> +	Usage: optional
> +	Value type: <none>
> +	Definition: The specified pins are configured in output mode, driven
> +		    low.
> +		    Not valid for sdc pins.
> +
> +- drive-strength:
> +	Usage: optional
> +	Value type: <u32>
> +	Definition: Selects the drive strength for the specified pins, in mA.
> +		    Valid values are: 2, 4, 6, 8, 10, 12, 14 and 16
> +
> +Example:
> +
> +	tlmm: pinctrl@3000000 {
> +		compatible = "qcom,sm8150-pinctrl";
> +		reg = <0x03100000 0x300000>,
> +		      <0x03500000 0x300000>,
> +		      <0x03900000 0x300000>,
> +		      <0x03D00000 0x300000>;
> +		reg-names = "west", "east", "north", "south";
> +		interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;

You're missing the required gpio-ranges from the example, see e.g.
msm8996 (and please send a patch to the binding you based this on).

> +	};

Regards,
Bjorn
