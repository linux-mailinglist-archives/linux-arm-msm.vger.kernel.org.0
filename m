Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A401211C618
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 07:49:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728006AbfLLGtz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 01:49:55 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:36176 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727891AbfLLGtz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 01:49:55 -0500
Received: by mail-pj1-f66.google.com with SMTP id n96so615613pjc.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 22:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7alBOWMBOw01l5ZvKzB8PzRlMI+d1fuDgAvtsx1Cs+A=;
        b=FpZH513r5ci7cDAB2WTk1UyTDgmvGjKU3SGUyd0EDu/2/TLvvYLDkU2ppOaIKYfwgL
         iMonzMybr7wGVG0ha8JJ5mix9X7FtLfiZtqfennWRSkU4fiSy5bIB5elUex5PzDhIwc7
         IjJ7NQq7nADBayNY2PqLpAClihJfYKGi+qZbUZlyDv1OdMh779Jt517SuMoYHShAIXZT
         ajj3dth88N5Wc3mFY3cpOHslvttbGv8B9QhA0Gb7h87YCWI0xtIAfpTN2/adAJlqRUJp
         m/Z5bdEtkx+Wc/8AYCoVBLE0SEO52i/3MB9WxFAf5lEcY4vKVJP8hiSoDRBD03rchYOu
         EZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7alBOWMBOw01l5ZvKzB8PzRlMI+d1fuDgAvtsx1Cs+A=;
        b=fpq8xBvINv+G6VHvEPDALowZ7reTa2SqkrsRSaaQtX6TOlVu6WPkai1Nxwe0GSPFgM
         /n8KaoESYYy78Ev3KF1U4DQcMz4SF9TZhjY9EnQpi/BykjptOHwjSmZS/C5kMNT+cQY0
         E216gVXFyiQbkqHi2KteTs5Ox0WI4be3B14kXhZhbcoqlNjVLPgZ/IM7arcjEl/VZ2xS
         fGAvK/01Dy33DsF6m5S9dWp2HJGTNNsyeQV5SRfd0JtldmEydDE0eVS86RS53gjsW86c
         vIUZrRznN2YN2f87amiGlG7Q3brTxwgB68YjbbCCKNX8VtOj5E5aSApQjiGr6VS4tXPa
         1f5A==
X-Gm-Message-State: APjAAAXoC0F5yCd6+Yw2w90qQSm4Kx5la9i+Qp2uIQ2bNk7MIEem8m5d
        J7j7qjFyOVVTB//y1h4oQMpk2Q==
X-Google-Smtp-Source: APXvYqwa9SZE7PFE8Bp3TeM6caoeJXHZffw9/+jLbdUZSRPpbdRXF/cG0YTJEJYVKt8BnS5g7iXynQ==
X-Received: by 2002:a17:902:44a:: with SMTP id 68mr7952542ple.27.1576133394663;
        Wed, 11 Dec 2019 22:49:54 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h14sm5221883pfn.174.2019.12.11.22.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 22:49:53 -0800 (PST)
Date:   Wed, 11 Dec 2019 22:49:51 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     robh+dt@kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        amit.pundir@linaro.org
Subject: Re: [PATCH] arm: dts: qcom: db410c: Enable USB OTG support
Message-ID: <20191212064951.GD415177@yoga>
References: <1576083014-5842-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1576083014-5842-1-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 11 Dec 08:50 PST 2019, Loic Poulain wrote:

> The Dragonboard-410c is able to act either as USB Host or Device.
> The role can be determined at runtime via the USB_HS_ID pin which is
> derived from the micro-usb port VBUS pin.
> 
> In Host role, SoC USB D+/D- are routed to the onboard USB 2.0 HUB.
> In Device role, SoC USB D+/D- are routed to the USB 2.0 micro B port.
> Routing is selected via USB_SW_SEL_PM gpio.
> 
> In device role USB HUB can be held in reset.
> 
> chipidea driver expects two extcon device pointers, one for the
> EXTCON_USB event and one for the EXTCON_USB_HOST event. Since
> the extcon-usb-gpio device is capable of generating both these
> events, point two times to this extcon device.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Applied

Thanks,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi | 19 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi           | 11 ++++++-----
>  2 files changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi
> index ec2f0de..aff218c 100644
> --- a/arch/arm64/boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi
> @@ -8,6 +8,15 @@
>  		pinconf {
>  			pins = "gpio3";
>  			function = PMIC_GPIO_FUNC_NORMAL;
> +			input-disable;
> +			output-high;
> +		};
> +	};
> +
> +	usb_hub_reset_pm_device: usb_hub_reset_pm_device {
> +		pinconf {
> +			pins = "gpio3";
> +			function = PMIC_GPIO_FUNC_NORMAL;
>  			output-low;
>  		};
>  	};
> @@ -22,6 +31,16 @@
>  		};
>  	};
>  
> +	usb_sw_sel_pm_device: usb_sw_sel_pm_device {
> +		pinconf {
> +			pins = "gpio4";
> +			function = PMIC_GPIO_FUNC_NORMAL;
> +			power-source = <PM8916_GPIO_VPH>;
> +			input-disable;
> +			output-low;
> +		};
> +	};
> +
>  	pm8916_gpios_leds: pm8916_gpios_leds {
>  		pinconf {
>  			pins = "gpio1", "gpio2";
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> index e12a36c..037e26b 100644
> --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> @@ -358,14 +358,15 @@
>  		};
>  
>  		usb@78d9000 {
> -			extcon = <&usb_id>;
> +			extcon = <&usb_id>, <&usb_id>;
>  			status = "okay";
>  			adp-disable;
>  			hnp-disable;
>  			srp-disable;
> -			dr_mode = "host";
> -			pinctrl-names = "default";
> -			pinctrl-0 = <&usb_sw_sel_pm>;
> +			dr_mode = "otg";
> +			pinctrl-names = "default", "device";
> +			pinctrl-0 = <&usb_sw_sel_pm &usb_hub_reset_pm>;
> +			pinctrl-1 = <&usb_sw_sel_pm_device &usb_hub_reset_pm_device>;
>  			ulpi {
>  				phy {
>  					v1p8-supply = <&pm8916_l7>;
> @@ -504,7 +505,7 @@
>  
>  	usb_id: usb-id {
>  		compatible = "linux,extcon-usb-gpio";
> -		vbus-gpio = <&msmgpio 121 GPIO_ACTIVE_HIGH>;
> +		id-gpio = <&msmgpio 121 GPIO_ACTIVE_HIGH>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&usb_id_default>;
>  	};
> -- 
> 2.7.4
> 
