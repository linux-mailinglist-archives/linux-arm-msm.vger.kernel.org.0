Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 696821E738B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 05:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391831AbgE2DVJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 23:21:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391824AbgE2DVI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 23:21:08 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AADC2C08C5C6
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 20:21:06 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id a45so1266573pje.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 20:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=y0JFcp/iPCmu9DU6Nd8gpyzv46xvhokUHqizSgGLqso=;
        b=GuT2YxhOlqhgMg3ljsVSJE/jRRraorYvYdr//h82N/Ml2GzrjY8kh2Ad0vxYImlesY
         v6Yvvepqe2iTT73pH+DQQoHcumKdR8QMQhYFo+JaKVH4QZVwzn3fC+lqUx3HEBzajG5v
         9pXpHQwvP4Uh3Czw9Au18G6OSE+1P2Bw5cXCto64aW0u/acHabc5iDL9TKevIfIu8Ouy
         QefhVgAqhieenBRZaK3zN7A9zYnkar9rwO/BdPExLUMd6Jd9sddyOchW16u1N+zq2GmY
         8MUurdjP4DiYbnhUAYJy0NJnfOe4B9rg1Z9NorrrXqzOzc2qL7B5kMWylb5wy+yOSoz+
         CWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y0JFcp/iPCmu9DU6Nd8gpyzv46xvhokUHqizSgGLqso=;
        b=a/sdQWrRn59S2ZYmKFIaMuO50v0P+OV0+Y4kCnxgRScQR5I0qBG5n9aXZwnSXKFkF8
         F8fBOZbGzi2p09gEgOGja0MCxPErHQE/9AMV+Qb3pN7jxkYpJ0aU21ktWnrSFIiI7hXx
         cAMmzLfxxgjZqE/YcTUxzn6Ryn7DnxVYVrf0DODDAuVWCovJklOGTg1ahJNcqdKx/dWw
         FOBmnOtLFemHttKuT2xj9fjwf+EghFbg1r+g4Yj3TtFwuVDWm3aLfgWJ4syQ2go3wfuC
         A9CiOiRtaDnJFWixcjvIwcDf1mDRboJiEEjj6PEuWYmgkifFjPOAemwaG26MBNREvmbH
         QFTw==
X-Gm-Message-State: AOAM5329D4TiSkA5PRZAPaAMp9cI932PPoqDS8nl+UC9Td5YwLfT0Ty5
        FgDt676rd1RBblsKCzKJDLV9Yw==
X-Google-Smtp-Source: ABdhPJwBwzFf91owD50w1QB148f3rhNVzApgfnBr+Q2s1uVaSa5eEsXosE5sUCzlX0tcy0oSFOHBWg==
X-Received: by 2002:a17:90a:20ae:: with SMTP id f43mr7533944pjg.29.1590722466116;
        Thu, 28 May 2020 20:21:06 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 192sm5578027pfz.198.2020.05.28.20.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 20:21:05 -0700 (PDT)
Date:   Thu, 28 May 2020 20:20:00 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jonathan McDowell <noodles@earth.li>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ARM: dts: qcom: Add MikroTik RB3011
Message-ID: <20200529032000.GA279327@builder.lan>
References: <cover.1589824955.git.noodles@earth.li>
 <75390e66c9e6e36ddd42dc7f54cac28dfd7a24b9.1589824955.git.noodles@earth.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75390e66c9e6e36ddd42dc7f54cac28dfd7a24b9.1589824955.git.noodles@earth.li>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 18 May 11:10 PDT 2020, Jonathan McDowell wrote:

> This patch adds a DTS file for the MikroTik RouterBoard 3011, which is a
> 1U rackmount router based on the IPQ8064, supporting the serial UART,
> dual QCA8337 Gigabit ethernet switches, boot loader NOR and user LED
> device.
> 
> Signed-off-by: Jonathan McDowell <noodles@earth.li>

Patch 2 and 3 picked up for 5.9

Thanks,
Bjorn

> ---
>  arch/arm/boot/dts/Makefile                |   1 +
>  arch/arm/boot/dts/qcom-ipq8064-rb3011.dts | 308 ++++++++++++++++++++++
>  2 files changed, 309 insertions(+)
>  create mode 100644 arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index e8dd99201397..e697a4bd7426 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -884,6 +884,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
>  	qcom-ipq4019-ap.dk07.1-c1.dtb \
>  	qcom-ipq4019-ap.dk07.1-c2.dtb \
>  	qcom-ipq8064-ap148.dtb \
> +	qcom-ipq8064-rb3011.dtb \
>  	qcom-msm8660-surf.dtb \
>  	qcom-msm8960-cdp.dtb \
>  	qcom-msm8974-fairphone-fp2.dtb \
> diff --git a/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts b/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
> new file mode 100644
> index 000000000000..282b89ce3d45
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
> @@ -0,0 +1,308 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include "qcom-ipq8064.dtsi"
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +	model = "MikroTik RB3011UiAS-RM";
> +	compatible = "mikrotik,rb3011";
> +
> +	aliases {
> +		serial0 = &gsbi7_serial;
> +		ethernet0 = &gmac0;
> +		ethernet1 = &gmac3;
> +		mdio-gpio0 = &mdio0;
> +		mdio-gpio1 = &mdio1;
> +	};
> +
> +	chosen {
> +		bootargs = "loglevel=8 console=ttyMSM0,115200";
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory@0 {
> +		reg = <0x42000000 0x3e000000>;
> +		device_type = "memory";
> +	};
> +
> +	mdio0: mdio@0 {
> +		status = "okay";
> +		compatible = "virtual,mdio-gpio";
> +		gpios = <&qcom_pinmux 1 GPIO_ACTIVE_HIGH>,
> +			<&qcom_pinmux 0 GPIO_ACTIVE_HIGH>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pinctrl-0 = <&mdio0_pins>;
> +		pinctrl-names = "default";
> +
> +		switch0: switch@10 {
> +			compatible = "qca,qca8337";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			dsa,member = <0 0>;
> +
> +			pinctrl-0 = <&sw0_reset_pin>;
> +			pinctrl-names = "default";
> +
> +			reset-gpios = <&qcom_pinmux 16 GPIO_ACTIVE_LOW>;
> +			reg = <0x10>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				switch0cpu: port@0 {
> +					reg = <0>;
> +					label = "cpu";
> +					ethernet = <&gmac0>;
> +					phy-mode = "rgmii-id";
> +					fixed-link {
> +						speed = <1000>;
> +						full-duplex;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					label = "sw1";
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +					label = "sw2";
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +					label = "sw3";
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +					label = "sw4";
> +				};
> +
> +				port@5 {
> +					reg = <5>;
> +					label = "sw5";
> +				};
> +			};
> +		};
> +	};
> +
> +	mdio1: mdio@1 {
> +		status = "okay";
> +		compatible = "virtual,mdio-gpio";
> +		gpios = <&qcom_pinmux 11 GPIO_ACTIVE_HIGH>,
> +			<&qcom_pinmux 10 GPIO_ACTIVE_HIGH>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pinctrl-0 = <&mdio1_pins>;
> +		pinctrl-names = "default";
> +
> +		switch1: switch@14 {
> +			compatible = "qca,qca8337";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			dsa,member = <1 0>;
> +
> +			pinctrl-0 = <&sw1_reset_pin>;
> +			pinctrl-names = "default";
> +
> +			reset-gpios = <&qcom_pinmux 17 GPIO_ACTIVE_LOW>;
> +			reg = <0x10>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				switch1cpu: port@0 {
> +					reg = <0>;
> +					label = "cpu";
> +					ethernet = <&gmac3>;
> +					phy-mode = "sgmii";
> +					fixed-link {
> +						speed = <1000>;
> +						full-duplex;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					label = "sw6";
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +					label = "sw7";
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +					label = "sw8";
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +					label = "sw9";
> +				};
> +
> +				port@5 {
> +					reg = <5>;
> +					label = "sw10";
> +				};
> +			};
> +		};
> +	};
> +
> +	soc {
> +		gsbi5: gsbi@1a200000 {
> +			qcom,mode = <GSBI_PROT_SPI>;
> +			status = "okay";
> +
> +			spi4: spi@1a280000 {
> +				status = "okay";
> +				spi-max-frequency = <50000000>;
> +
> +				pinctrl-0 = <&spi_pins>;
> +				pinctrl-names = "default";
> +
> +				cs-gpios = <&qcom_pinmux 20 GPIO_ACTIVE_HIGH>;
> +
> +				norflash: s25fl016k@0 {
> +					compatible = "jedec,spi-nor";
> +					#address-cells = <1>;
> +					#size-cells = <1>;
> +					spi-max-frequency = <50000000>;
> +					reg = <0>;
> +
> +					partition@0 {
> +						label = "RouterBoot";
> +						reg = <0x0 0x40000>;
> +					};
> +				};
> +			};
> +		};
> +
> +		gpio_keys {
> +			compatible = "gpio-keys";
> +			pinctrl-0 = <&buttons_pins>;
> +			pinctrl-names = "default";
> +
> +			button@1 {
> +				label = "reset";
> +				linux,code = <KEY_RESTART>;
> +				gpios = <&qcom_pinmux 66 GPIO_ACTIVE_LOW>;
> +				linux,input-type = <1>;
> +				debounce-interval = <60>;
> +			};
> +		};
> +
> +		leds {
> +			compatible = "gpio-leds";
> +			pinctrl-0 = <&leds_pins>;
> +			pinctrl-names = "default";
> +
> +			led@7 {
> +				label = "rb3011:green:user";
> +				gpios = <&qcom_pinmux 33 GPIO_ACTIVE_HIGH>;
> +				default-state = "off";
> +			};
> +		};
> +
> +	};
> +};
> +
> +&gmac0 {
> +	status = "okay";
> +
> +	phy-mode = "rgmii";
> +	qcom,id = <0>;
> +	phy-handle = <&switch0cpu>;
> +
> +	fixed-link {
> +		speed = <1000>;
> +		full-duplex;
> +	};
> +};
> +
> +&gmac3 {
> +	status = "okay";
> +
> +	phy-mode = "sgmii";
> +	qcom,id = <3>;
> +	phy-handle = <&switch1cpu>;
> +
> +	fixed-link {
> +		speed = <1000>;
> +		full-duplex;
> +	};
> +};
> +
> +&gsbi7 {
> +	status = "okay";
> +	qcom,mode = <GSBI_PROT_I2C_UART>;
> +};
> +
> +&gsbi7_serial {
> +	status = "okay";
> +};
> +
> +&qcom_pinmux {
> +	buttons_pins: buttons_pins {
> +		mux {
> +			pins = "gpio66";
> +			drive-strength = <16>;
> +			bias-disable;
> +		};
> +	};
> +
> +	leds_pins: leds_pins {
> +		mux {
> +			pins = "gpio33";
> +			drive-strength = <16>;
> +			bias-disable;
> +		};
> +	};
> +
> +	mdio0_pins: mdio0_pins {
> +		mux {
> +			pins = "gpio0", "gpio1";
> +			function = "gpio";
> +			drive-strength = <8>;
> +			bias-disable;
> +		};
> +	};
> +
> +	mdio1_pins: mdio1_pins {
> +		mux {
> +			pins = "gpio10", "gpio11";
> +			function = "gpio";
> +			drive-strength = <8>;
> +			bias-disable;
> +		};
> +	};
> +
> +	sw0_reset_pin: sw0_reset_pin {
> +		mux {
> +			pins = "gpio16";
> +			drive-strength = <16>;
> +			function = "gpio";
> +			bias-disable;
> +			input-disable;
> +		};
> +	};
> +
> +	sw1_reset_pin: sw1_reset_pin {
> +		mux {
> +			pins = "gpio17";
> +			drive-strength = <16>;
> +			function = "gpio";
> +			bias-disable;
> +			input-disable;
> +		};
> +	};
> +};
> -- 
> 2.20.1
> 
