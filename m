Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C891ECDE4B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2019 11:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727252AbfJGJgT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Oct 2019 05:36:19 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.217]:33894 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727103AbfJGJgS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Oct 2019 05:36:18 -0400
X-Greylist: delayed 357 seconds by postgrey-1.27 at vger.kernel.org; Mon, 07 Oct 2019 05:36:16 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570440976;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Bj1O5xYRymHpK6nNk3268j2rAofXHl9iamXyOZB5rRw=;
        b=DTrhg9wMtEBntmxqnDYmUHckUfyo8Y+RGWoxSaiqqoiTBx1DbDpX/vgb+zxHLnrG+F
        JaLtUmrIW8XSqD64PnU3HfpQTY/7tFXkKHwziGlIyn3sWyVUV6MhpijCPMMucKVx8qlo
        AuMK3EaYTv/P3MLZP+vE8dbJ31BL/gQLMbrvvcxFoHY82NGVllp1+/LXFiZv3vKdErcf
        64CWanvZWu46laVyAMb0DIRSLBb6VR5FmmInCfTBVp84RSRqq4qqicXJ4L4DH7eiJMab
        MSbmZWzDQ0bf+urjXJJUHBHT1mmko370alYoDHIOpvp1fdSPGcFTRNelX7bBuMub1Jeb
        v8UA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u266EZF6ORJEoj602eCm"
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 44.28.0 AUTH)
        with ESMTPSA id L0811cv979UFzFL
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 7 Oct 2019 11:30:15 +0200 (CEST)
Date:   Mon, 7 Oct 2019 11:30:08 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     michael.srba@seznam.cz
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: msm8916-samsung-a2015: add tactile buttons
 and hall sensor
Message-ID: <20191007093008.GA15831@gerhold.net>
References: <20191007064528.6543-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007064528.6543-1-michael.srba@seznam.cz>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 07, 2019 at 08:45:28AM +0200, michael.srba@seznam.cz wrote:
> From: Michael Srba <Michael.Srba@seznam.cz>
> 
> Add nodes for basic GPIO connected hardware to the Samsung A3/A5 common dtsi. 
> This includes the Volume UP button, the Home button, and the hall sensor used 
> to sense "smart cover" open state. Related to that, add a node for the Volume 
> DOWN button, which is handled by the pm8916 as is common with msm8916 devices.
> 
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>
Tested-by: Stephan Gerhold <stephan@gerhold.net> # a5u

> ---
>  .../qcom/msm8916-samsung-a2015-common.dtsi    | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
> index 6fc0b80d1f90..bd1eb3eeca53 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
> @@ -3,6 +3,7 @@
>  #include "msm8916.dtsi"
>  #include "pm8916.dtsi"
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  
>  / {
> @@ -91,6 +92,44 @@
>  		etm@85f000 { status = "disabled"; };
>  	};
>  
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
> +
> +		home {
> +			label = "Home";
> +			gpios = <&msmgpio 109 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_HOMEPAGE>;
> +		};
> +	};
> +
> +	gpio-hall-sensor {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_hall_sensor_default>;
> +
> +		label = "GPIO Hall Effect Sensor";
> +
> +		hall-sensor {
> +			label = "Hall Effect Sensor";
> +			gpios = <&msmgpio 52 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <EV_SW>;
> +			linux,code = <SW_LID>;
> +			linux,can-disable;
> +		};
> +	};
> +
>  	i2c-muic {
>  		compatible = "i2c-gpio";
>  		sda-gpios = <&msmgpio 105 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
> @@ -113,6 +152,30 @@
>  };
>  
>  &msmgpio {
> +	gpio_keys_default: gpio_keys_default {
> +		pinmux {
> +			function = "gpio";
> +			pins = "gpio107", "gpio109";
> +		};
> +		pinconf {
> +			pins = "gpio107", "gpio109";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	gpio_hall_sensor_default: gpio_hall_sensor_default {
> +		pinmux {
> +			function = "gpio";
> +			pins = "gpio52";
> +		};
> +		pinconf {
> +			pins = "gpio52";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};
> +
>  	muic_int_default: muic_int_default {
>  		pinmux {
>  			function = "gpio";
> @@ -238,3 +301,16 @@
>  		regulator-max-microvolt = <2700000>;
>  	};
>  };
> +
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
> -- 
> 2.23.0
> 
