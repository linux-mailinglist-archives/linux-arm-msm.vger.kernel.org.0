Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D4B142A41A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 14:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236322AbhJLMPA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 08:15:00 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.20]:10393 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233045AbhJLMPA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 08:15:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1634040778;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=7aEKWdqtoYn80LbDpNdD3GL8wyvlyW5y0TFXJA8fE78=;
    b=jigS33HIfnSx06jGtWudJ1gpZpRgbth9a4R0VPuTOulDeLOodPo4qmM2dHx5tU+Kua
    hfILrwmwaZFZsJiZXA33mKlaa50frkiPQ6CW9E1tgUoNVKSCwEDp/39glD5NIzNmCpS1
    CGLvIyaWf6Mn7dP3m/8RnKWNZCXjbqDek9YXRVIALoj+VWWO9JRqmBi8IWy6v35NDxfb
    rRMbZuDjXRej7QzyF8MvrcTL5x6eQUrpOJTlm8lM9IHQnWr3BRF1ubvMlAJxJoEqFYCD
    HzaDozgrm6DfA+Y2ELNpMdmjYQ8gzoH6gQBhtgE1QeSUbot/Za6iA5h1K8+cdWkDaXtj
    GpaA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJD4pSA8p7h"
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.33.8 SBL|AUTH)
    with ESMTPSA id 301038x9CCCvzu7
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 12 Oct 2021 14:12:57 +0200 (CEST)
Date:   Tue, 12 Oct 2021 14:12:56 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     "J.R. Divya Antony" <d.antony.jr@gmail.com>
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: msm8916-asus-z00l: Add SDCard
Message-ID: <YWV7yL3tFJNgRqgO@gerhold.net>
References: <20211012112735.2765-1-d.antony.jr@gmail.com>
 <20211012112735.2765-2-d.antony.jr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211012112735.2765-2-d.antony.jr@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 12, 2021 at 04:57:34PM +0530, J.R. Divya Antony wrote:
> Enable SDHCI (SD Card) Storage.
> 
> Signed-off-by: J.R. Divya Antony <d.antony.jr@gmail.com>

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

> ---
>  .../arm64/boot/dts/qcom/msm8916-asus-z00l.dts | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
> index 71f4aa16058f..355c95365fcd 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
> @@ -42,6 +42,21 @@ volume-down {
>  		};
>  	};
>  
> +	reg_sd_vmmc: regulator-sdcard-vmmc {
> +		compatible = "regulator-fixed";
> +		regulator-name = "sdcard-vmmc";
> +		regulator-min-microvolt = <2950000>;
> +		regulator-max-microvolt = <2950000>;
> +
> +		gpio = <&msmgpio 87 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		startup-delay-us = <200>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sd_vmmc_en_default>;
> +	};
> +
>  	usb_id: usb-id {
>  		compatible = "linux,extcon-usb-gpio";
>  		id-gpios = <&msmgpio 110 GPIO_ACTIVE_HIGH>;
> @@ -89,6 +104,16 @@ &sdhc_1 {
>  	pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off>;
>  };
>  
> +&sdhc_2 {
> +	status = "okay";
> +	vmmc-supply = <&reg_sd_vmmc>;
> +
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
> +	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
> +	cd-gpios = <&msmgpio 38 GPIO_ACTIVE_LOW>;
> +};
> +
>  &usb {
>  	status = "okay";
>  	extcon = <&usb_id>, <&usb_id>;
> @@ -210,6 +235,14 @@ gpio_keys_default: gpio-keys-default {
>  		bias-pull-up;
>  	};
>  
> +	sd_vmmc_en_default: sd-vmmc-en-default {
> +		pins = "gpio87";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
>  	touchscreen_default: touchscreen-default {
>  		pins = "gpio13";
>  		function = "gpio";
> -- 
> 2.33.0
> 
