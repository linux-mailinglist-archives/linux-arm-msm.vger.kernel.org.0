Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE91CD1F2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 06:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbfJJEEW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 00:04:22 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42488 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725822AbfJJEEW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 00:04:22 -0400
Received: by mail-pg1-f195.google.com with SMTP id z12so2776588pgp.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2019 21:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4dRHx9kwDfqi2jIB+R6UC0q1jwHtPdnI7NHOJR7dfK8=;
        b=FtBYUXleYCHEXZ9azY/xl6NBSebYrKPfooEQhlD6WDgZ8PUkrpFQHJUarrmQZLizGL
         ZvJJcwWVRCCZRlUHZSCmczQR3Qf3f2o5znu09xGPIIoEqVppj4w5D4WqFTrbvjDPQmba
         gng7FCA904Lf3Y86eZ8HDOZB78TrKi4tGbBIB5yr5j6f6a7X9U0XAEC1Dy4FHNV3+SEp
         PAt4SUyFW89HcT4ajEADap9/GNlPVmqFkOykS+LxW8BMS0/bznIJTR9yuU47IZmBiWdN
         wYatfO43YNp2kXO68XHcpRlYE+NF/XobCKmx9S+R4rPl8+UslbD8PMwd3WYPUiMxYewI
         NoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4dRHx9kwDfqi2jIB+R6UC0q1jwHtPdnI7NHOJR7dfK8=;
        b=tA+mGIJNxr6eMXeh5cIwx90GILNr+E+3xLTzrw/NS/dxzGYH0xlyukugi5p/u+Dag4
         GmolqGDfwuRJViZVLHxOUAFUt3pwmpOAiJDx8U0xzNTAp/VGYYMdFLPk3oI5MEUztYyb
         9XDLLM183QgUNZ+EjtT/GmFHPToz88UVhrgXb2mL3DwyaCa009/1pz2VqSRfH0UgUafP
         cILK7797jHbtNL8z9o1NR8AtZfl9jxORPhuB1eCD+1XtWhqBHTXaGxW77qx2yr9tKfIc
         B3h+bHMt1KYUhR30LpWmXrFwtglzH1mUmt0S6YUeIG8Jw29kF6c5tWS7gZ5YM5PjkigW
         ukbg==
X-Gm-Message-State: APjAAAUh1st+GaoRqb5SySyVV68Sevn/DEq2Go/U2Vh8TniCJ6bAHNHy
        IiI43+1yUQvNmUuc8wOBAYgbRQ==
X-Google-Smtp-Source: APXvYqzQQnnxSmjkc2277Defb/ijEkp0j77+dg5mqy0z8nHzKEVssomusTv1lFXCOoM236Lh2M6s0Q==
X-Received: by 2002:a17:90a:35d1:: with SMTP id r75mr8684449pjb.46.1570680259911;
        Wed, 09 Oct 2019 21:04:19 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q132sm4309052pfq.16.2019.10.09.21.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 21:04:19 -0700 (PDT)
Date:   Wed, 9 Oct 2019 21:04:16 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     michael.srba@seznam.cz
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH] arm64: dts: msm8916-samsung-a2015: add tactile buttons
 and hall sensor
Message-ID: <20191010040416.GQ6390@tuxbook-pro>
References: <20191007064528.6543-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007064528.6543-1-michael.srba@seznam.cz>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 06 Oct 23:45 PDT 2019, michael.srba@seznam.cz wrote:

> From: Michael Srba <Michael.Srba@seznam.cz>
> 
> Add nodes for basic GPIO connected hardware to the Samsung A3/A5 common dtsi. 
> This includes the Volume UP button, the Home button, and the hall sensor used 
> to sense "smart cover" open state. Related to that, add a node for the Volume 
> DOWN button, which is handled by the pm8916 as is common with msm8916 devices.
> 
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>

Applied with Stephan's acks

Thanks,
Bjorn

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
