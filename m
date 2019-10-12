Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF388D509D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2019 17:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729223AbfJLPKG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Oct 2019 11:10:06 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:36628 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727115AbfJLPKG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Oct 2019 11:10:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570893004;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=cN8n+QXvGzhX/uWxSyrg7bj6OfRKWm0QPJfLcwJTSkY=;
        b=BnReYw9XpNfJgOo7+pSMYtwQ0ZjHw3uHjovehfg524DNkrnnZRZbNG4foRJdQpMOKW
        Bq9Pu6SgYI6GkhpUjIDz+GlsY+cMQyALF1/xtwux+6uK4CxflieHJAmV3ftQR7YkT6PV
        bMSgwWztEWmtJG0NyYRHZqc46d5rifRtsHWiiZtd92n7ii+FrTbHnyMQzpabnbLpMK2b
        ikZAokHUihRsbSKCEcaesVXTOIQ0MvYYOY0aX1Hd4qT5Stb7AlcdJEINMdlMstAzmLjg
        We2KCuHuthHkqbFqDO86R8FgFk6RsGogwRL6bnqQcIjWmCysR4TcjKcxjxGoBzM71rpS
        Xatw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u266HpF+ORJDYrzyYxxieg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 44.28.0 DYNA|AUTH)
        with ESMTPSA id L0811cv9CFA3Tiu
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Sat, 12 Oct 2019 17:10:03 +0200 (CEST)
Date:   Sat, 12 Oct 2019 17:10:02 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     nikitos.tr@gmail.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: msm8916-longcheer-l8150: Add Volume
 buttons
Message-ID: <20191012151002.GB33229@gerhold.net>
References: <20191012145821.20846-1-nikitos.tr@gmail.com>
 <20191012145821.20846-2-nikitos.tr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191012145821.20846-2-nikitos.tr@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Oct 12, 2019 at 07:58:21PM +0500, nikitos.tr@gmail.com wrote:
> From: Nikita Travkin <nikitos.tr@gmail.com>
> 
> Add nodes for Volume UP button connected to GPIO and Volume DOWN button,
> which is handled by the pm8916 as is common with msm8916 devices.
> 
> Signed-off-by: Nikita Travkin <nikitos.tr@gmail.com>

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

> ---
>  .../boot/dts/qcom/msm8916-longcheer-l8150.dts | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
> index e4d467e7dedb..d1ccb9472c8b 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
> @@ -5,6 +5,7 @@
>  #include "msm8916.dtsi"
>  #include "pm8916.dtsi"
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
>  
>  / {
>  	model = "Longcheer L8150";
> @@ -113,9 +114,36 @@
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&usb_vbus_default>;
>  	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_keys_default>;
> +
> +		label = "GPIO Buttons";
> +
> +		volume-up {
> +			label = "Volume Up";
> +			gpios = <&msmgpio 107 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +		};
> +	};
>  };
>  
>  &msmgpio {
> +	gpio_keys_default: gpio_keys_default {
> +		pinmux {
> +			function = "gpio";
> +			pins = "gpio107";
> +		};
> +		pinconf {
> +			pins = "gpio107";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +	};
> +
>  	usb_vbus_default: usb-vbus-default {
>  		pinmux {
>  			function = "gpio";
> @@ -128,6 +156,19 @@
>  	};
>  };
>  
> +&spmi_bus {
> +	pm8916@0 {
> +		pon@800 {
> +			volume-down {
> +				compatible = "qcom,pm8941-resin";
> +				interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
> +				bias-pull-up;
> +				linux,code = <KEY_VOLUMEDOWN>;
> +			};
> +		};
> +	};
> +};
> +
>  &smd_rpm_regulators {
>  	vdd_l1_l2_l3-supply = <&pm8916_s3>;
>  	vdd_l4_l5_l6-supply = <&pm8916_s4>;
> -- 
> 2.19.1
> 
