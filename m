Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E86A742A411
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 14:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236281AbhJLMNx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 08:13:53 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.22]:9000 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236273AbhJLMNx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 08:13:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1634040707;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=U313DFpo9ezbnoBiv46BnqOtg1kmpQjmiJbwYSuqHPg=;
    b=hsvTMMVXtAI/+9fFXgvT/IvkbAxmURwE31wCT7Gqk724U8yzUWQPC5N6O1nce5TwOG
    VxxYE8+ws9QNf0wnzF75ZcuTYU0PI8nsz1c4pwOflMCCBEgQCbLExD/kkXs68uyFCwCJ
    7UQ+g9CaV/OZomtZ3zjAp2ML1BtH7yVJXwvytK20sYUodEi+CQruEJxSRLeqrtnEJefm
    9fVtmcmuBQOY4ZffACUbn/aJyRqGVXwcrr7febf21PgxsATVd0utI8jIr9Cn8/Qm3dAc
    7q713UyMY1JIfWT5Md1vSMyFqaE2WNXiHZx+2Coj9cf2+Sivb9QJz+DNPI6jngARaWeg
    VzHA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJD4pSA8p7h"
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.33.8 SBL|AUTH)
    with ESMTPSA id 301038x9CCBlzte
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 12 Oct 2021 14:11:47 +0200 (CEST)
Date:   Tue, 12 Oct 2021 14:11:41 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     "J.R. Divya Antony" <d.antony.jr@gmail.com>
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: msm8916-asus-z00l: Add
 touchscreen
Message-ID: <YWV7fT63HXZwjqnY@gerhold.net>
References: <20211012112735.2765-1-d.antony.jr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211012112735.2765-1-d.antony.jr@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 12, 2021 at 04:57:33PM +0530, J.R. Divya Antony wrote:
> Add support for touchscreen in this device.
> 
> Signed-off-by: J.R. Divya Antony <d.antony.jr@gmail.com>

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

> ---
>  .../arm64/boot/dts/qcom/msm8916-asus-z00l.dts | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
> index cee451e59385..71f4aa16058f 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
> @@ -4,6 +4,8 @@
>  
>  #include "msm8916-pm8916.dtsi"
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
>  
>  / {
>  	model = "Asus Zenfone 2 Laser";
> @@ -48,6 +50,29 @@ usb_id: usb-id {
>  	};
>  };
>  
> +&blsp_i2c5 {
> +	status = "okay";
> +
> +	touchscreen@38 {
> +		compatible = "edt,edt-ft5306";
> +		reg = <0x38>;
> +
> +		interrupt-parent = <&msmgpio>;
> +		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
> +
> +		reset-gpios = <&msmgpio 12 GPIO_ACTIVE_LOW>;
> +
> +		vcc-supply = <&pm8916_l11>;
> +		iovcc-supply = <&pm8916_l6>;
> +
> +		touchscreen-size-x = <720>;
> +		touchscreen-size-y = <1280>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&touchscreen_default>;
> +	};
> +};
> +
>  &blsp1_uart2 {
>  	status = "okay";
>  };
> @@ -185,6 +210,22 @@ gpio_keys_default: gpio-keys-default {
>  		bias-pull-up;
>  	};
>  
> +	touchscreen_default: touchscreen-default {
> +		pins = "gpio13";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-pull-up;
> +
> +		reset {
> +			pins = "gpio12";
> +			function = "gpio";
> +
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};
> +
>  	usb_id_default: usb-id-default {
>  		pins = "gpio110";
>  		function = "gpio";
> -- 
> 2.33.0
> 
