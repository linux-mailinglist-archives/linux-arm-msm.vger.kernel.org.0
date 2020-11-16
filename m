Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85C002B42C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 12:26:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728510AbgKPL0B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 06:26:01 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:20711 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbgKPL0B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 06:26:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1605525959;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=W5YuYqCZqUertzgZmSMZVZhAWyV7komXHaTMw/Ekmb0=;
        b=k/ChY7HeKDr6Xu6ibdThScM6OX/1eSoZ8hWiy3B2WtnJ4wQsTKxGelpJuDBP0dD6iM
        psCYDWv8fhjH0pjP7h+rKs9i+YoBlav/zUCc5gx1dyWDysBKKz2OfDo5r1f3BMHmDxSf
        lvoJrjlkVYU2W+9y8XwO8ooGaSPBmqhLLdttdPyU9Q3INfyQpZvS8pk1FvDD2GLCXyRp
        CoormGjFO2h6jIcBXyH+X/uYFfRrDk9R+l/iFwyObl31Rae4wucd/V12SgbhjbSH/TIY
        PSccPYaqxAvt3A1udSo4R+WHR2//2FBP4dfLq2Co8oAX3GVzIL0TwpP6yZ/tjkPxSeUe
        aH+w==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j+Ic/GaIo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 47.3.4 SBL|AUTH)
        with ESMTPSA id Z061efwAGBPvK7V
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 16 Nov 2020 12:25:57 +0100 (CET)
Date:   Mon, 16 Nov 2020 12:25:50 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     michael.srba@seznam.cz
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-samsung-a3u: add nodes for
 touchscreen
Message-ID: <X7JhvpJ4sbGuP0eX@gerhold.net>
References: <20201115195058.27097-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201115195058.27097-1-michael.srba@seznam.cz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Nov 15, 2020 at 08:50:58PM +0100, michael.srba@seznam.cz wrote:
> From: Michael Srba <Michael.Srba@seznam.cz>
> 
> This patch wires up touchscreen support on Samsung Galaxy A3 2015.
> 
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

> ---
> 
> Tested on Samsung Galaxy A3 (sm-a3ulte).
> 
> ---
>  .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
> index 086f07ead5cb..661f41ad978b 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
> @@ -28,6 +28,27 @@ &accelerometer {
>  		       "0", "0", "1";
>  };
>  
> +&blsp_i2c5 {
> +	status = "okay";
> +
> +	touchscreen@20 {
> +		compatible = "zinitix,bt541";
> +
> +		reg = <0x20>;
> +		interrupt-parent = <&msmgpio>;
> +		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
> +
> +		touchscreen-size-x = <540>;
> +		touchscreen-size-y = <960>;
> +
> +		vdd-supply = <&reg_vdd_tsp>;
> +		vddo-supply = <&pm8916_l6>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&ts_int_default>;
> +	};
> +};
> +
>  &dsi0 {
>  	panel@0 {
>  		reg = <0>;
> @@ -59,4 +80,12 @@ panel_vdd3_default: panel-vdd3-default {
>  		drive-strength = <2>;
>  		bias-disable;
>  	};
> +
> +	ts_int_default: ts-int-default {
> +		pins = "gpio13";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
>  };
> -- 
> 2.28.0
> 
