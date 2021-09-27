Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5E4341A2B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 00:08:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237721AbhI0WKd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 18:10:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237555AbhI0WK2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 18:10:28 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFE41C061252
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 15:07:06 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id 67-20020a9d0449000000b00546e5a8062aso26413760otc.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 15:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pE4LoJNe6aiZGbDfJevs62XkngxPShYLVoLkOqnY23Y=;
        b=o2W/DcgMy4QSk6OPy1n/9sjhmE64IXvDpGB3MPd88YfzrNyEdSRNnNKThJIQLf4yMM
         ig7pl/mm3fM26U1N0vpoyBnDw1XPHAvB1lJuqH4VTsceDgxCxZvt71E5RnMrVV4ASLFd
         UrGlDY/N63RPKmZOt59huAcPs0zPi+uAEzTVBUJCzdWJ65k/2I6aUdCA0dhM0gkkG5a8
         4lvt8TnMbsW8Egz/RHjy1BcRZ23PxSZt5n/w1nWqiq4SJXv5JbbpTjTxeRTRcbG3COKV
         F2eXnvns0jB3zHGK5aQSw+vbRugvJly8IJlHiAuJX11g6WZdpP8nSz76X5QJMGnBb+Ow
         mKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pE4LoJNe6aiZGbDfJevs62XkngxPShYLVoLkOqnY23Y=;
        b=jsPr8+/WhHYQo22Bbf4dtV2yMShVCNnt5hE35jwhuxIAJzxQ04SBxFWngOUAPm+6D+
         GBstDexbL9A6oZ3SDrr+obrYSSKwogod6NdEVJ4DWhM7CEWNwQyhCuMiF4KJVgZCQ0Hj
         7p7SuHgDeAU5GS39OaTR0tSdN+cDNBKx/g/C1jbbw0DYqWdE6DreQsIwvEBzR5NHFWgS
         MIFoiKYSmm4TVmxaRA3Hw3SjOD31ow4h1VyLUfCJQzyYlCMkETO7dhuXV47QjvNYJOYW
         SBQ43huUOy4St4h7zCAvWIRgLKbFNs27wRjXsq/7yNdeRAHYw+N4PTmakraCQU0O6B69
         o9NQ==
X-Gm-Message-State: AOAM531+Z5jALJnKgVJ7QO3I7Mw7QF0p9XU+XXEy1AAxFhXMDQ9+oUrW
        HvXmczR2m4F1S5qomHxXBNGlsKORi+H27w==
X-Google-Smtp-Source: ABdhPJxb/FzfkZZPwmaSKjlSXGlQHw6gffGSSr7sxmhcd0GOVCLaCcHwvO/pAVkdyYrfSngudlcHGg==
X-Received: by 2002:a9d:4618:: with SMTP id y24mr2035942ote.326.1632780426192;
        Mon, 27 Sep 2021 15:07:06 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j10sm701905oog.39.2021.09.27.15.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 15:07:05 -0700 (PDT)
Date:   Mon, 27 Sep 2021 17:07:03 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Philip Chen <philipchen@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, dianders@chromium.org,
        swboyd@chromium.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: sc7180: Factor out ti-sn65dsi86 support
Message-ID: <YVJAh755zCGUmobm@builder.lan>
References: <20210924165322.1.Ib7e63ae17e827ce0636a09d5dec9796043e4f80a@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210924165322.1.Ib7e63ae17e827ce0636a09d5dec9796043e4f80a@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 24 Sep 18:54 CDT 2021, Philip Chen wrote:

> Factor out ti-sn65dsi86 edp bridge as a separate dts fragment.
> This helps us introduce the second source edp bridge later.
> 

I'd prefer to see the second patch in this series to conclude that this
is the right approach.

Regards,
Bjorn

> Signed-off-by: Philip Chen <philipchen@chromium.org>
> ---
> 
>  .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  |  1 +
>  .../boot/dts/qcom/sc7180-trogdor-lazor.dtsi   |  1 +
>  .../boot/dts/qcom/sc7180-trogdor-pompom.dtsi  |  1 +
>  .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts |  1 +
>  .../dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi | 87 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 81 -----------------
>  6 files changed, 91 insertions(+), 81 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> index a758e4d22612..1d13fba3bd2f 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> @@ -11,6 +11,7 @@
>  ap_h1_spi: &spi0 {};
>  
>  #include "sc7180-trogdor.dtsi"
> +#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
>  
>  /* Deleted nodes from trogdor.dtsi */
>  
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> index 00535aaa43c9..27b26a782af9 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> @@ -11,6 +11,7 @@
>  ap_h1_spi: &spi0 {};
>  
>  #include "sc7180-trogdor.dtsi"
> +#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
>  
>  &ap_sar_sensor {
>  	semtech,cs0-ground;
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
> index a246dbd74cc1..e7c7cad14989 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
> @@ -11,6 +11,7 @@
>  ap_h1_spi: &spi0 {};
>  
>  #include "sc7180-trogdor.dtsi"
> +#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
>  
>  / {
>  	thermal-zones {
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
> index 2b522f9e0d8f..457c25499863 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
> @@ -13,6 +13,7 @@
>  ap_h1_spi: &spi0 {};
>  
>  #include "sc7180-trogdor.dtsi"
> +#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
>  
>  / {
>  	model = "Google Trogdor (rev1+)";
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
> new file mode 100644
> index 000000000000..7b1034a5a8e9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
> @@ -0,0 +1,87 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Trogdor dts fragment for the boards with TI sn65dsi86 edp bridge
> + *
> + * Copyright 2021 Google LLC.
> + */
> +
> +&dsi0_out {
> +	remote-endpoint = <&sn65dsi86_in>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&edp_brij_i2c {
> +	sn65dsi86_bridge: bridge@2d {
> +		compatible = "ti,sn65dsi86";
> +		reg = <0x2d>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&edp_brij_en>, <&edp_brij_irq>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		enable-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
> +
> +		vpll-supply = <&pp1800_edp_vpll>;
> +		vccio-supply = <&pp1800_brij_vccio>;
> +		vcca-supply = <&pp1200_brij>;
> +		vcc-supply = <&pp1200_brij>;
> +
> +		clocks = <&rpmhcc RPMH_LN_BB_CLK3>;
> +		clock-names = "refclk";
> +
> +		no-hpd;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				sn65dsi86_in: endpoint {
> +					remote-endpoint = <&dsi0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				sn65dsi86_out: endpoint {
> +					data-lanes = <0 1>;
> +					remote-endpoint = <&panel_in_edp>;
> +				};
> +			};
> +		};
> +
> +		aux-bus {
> +			panel: panel {
> +				/* Compatible will be filled in per-board */
> +				power-supply = <&pp3300_dx_edp>;
> +				backlight = <&backlight>;
> +				hpd-gpios = <&sn65dsi86_bridge 2 GPIO_ACTIVE_HIGH>;
> +
> +				port {
> +					panel_in_edp: endpoint {
> +						remote-endpoint = <&sn65dsi86_out>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&tlmm {
> +	edp_brij_irq: edp-brij-irq {
> +		pinmux {
> +			pins = "gpio11";
> +			function = "gpio";
> +		};
> +
> +		pinconf {
> +			pins = "gpio11";
> +			drive-strength = <2>;
> +			bias-pull-down;
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 0f2b3c00e434..5ad3f15652d5 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -602,15 +602,6 @@ &camcc {
>  &dsi0 {
>  	status = "okay";
>  	vdda-supply = <&vdda_mipi_dsi0_1p2>;
> -
> -	ports {
> -		port@1 {
> -			endpoint {
> -				remote-endpoint = <&sn65dsi86_in>;
> -				data-lanes = <0 1 2 3>;
> -			};
> -		};
> -	};
>  };
>  
>  &dsi_phy {
> @@ -621,65 +612,6 @@ &dsi_phy {
>  edp_brij_i2c: &i2c2 {
>  	status = "okay";
>  	clock-frequency = <400000>;
> -
> -	sn65dsi86_bridge: bridge@2d {
> -		compatible = "ti,sn65dsi86";
> -		reg = <0x2d>;
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&edp_brij_en>, <&edp_brij_irq>;
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -
> -		interrupt-parent = <&tlmm>;
> -		interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
> -
> -		enable-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
> -
> -		vpll-supply = <&pp1800_edp_vpll>;
> -		vccio-supply = <&pp1800_brij_vccio>;
> -		vcca-supply = <&pp1200_brij>;
> -		vcc-supply = <&pp1200_brij>;
> -
> -		clocks = <&rpmhcc RPMH_LN_BB_CLK3>;
> -		clock-names = "refclk";
> -
> -		no-hpd;
> -
> -		ports {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			port@0 {
> -				reg = <0>;
> -				sn65dsi86_in: endpoint {
> -					remote-endpoint = <&dsi0_out>;
> -				};
> -			};
> -
> -			port@1 {
> -				reg = <1>;
> -				sn65dsi86_out: endpoint {
> -					data-lanes = <0 1>;
> -					remote-endpoint = <&panel_in_edp>;
> -				};
> -			};
> -		};
> -
> -		aux-bus {
> -			panel: panel {
> -				/* Compatible will be filled in per-board */
> -				power-supply = <&pp3300_dx_edp>;
> -				backlight = <&backlight>;
> -				hpd-gpios = <&sn65dsi86_bridge 2 GPIO_ACTIVE_HIGH>;
> -
> -				port {
> -					panel_in_edp: endpoint {
> -						remote-endpoint = <&sn65dsi86_out>;
> -					};
> -				};
> -			};
> -		};
> -	};
>  };
>  
>  ap_sar_sensor_i2c: &i2c5 {
> @@ -1245,19 +1177,6 @@ pinconf {
>  		};
>  	};
>  
> -	edp_brij_irq: edp-brij-irq {
> -		pinmux {
> -			pins = "gpio11";
> -			function = "gpio";
> -		};
> -
> -		pinconf {
> -			pins = "gpio11";
> -			drive-strength = <2>;
> -			bias-pull-down;
> -		};
> -	};
> -
>  	en_pp3300_codec: en-pp3300-codec {
>  		pinmux {
>  			pins = "gpio83";
> -- 
> 2.33.0.685.g46640cef36-goog
> 
