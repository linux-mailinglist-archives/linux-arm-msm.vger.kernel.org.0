Return-Path: <linux-arm-msm+bounces-54801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAA6A9429C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 11:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C913189F182
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 09:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D2D1ACED2;
	Sat, 19 Apr 2025 09:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="2XzxFNgv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDF719E975;
	Sat, 19 Apr 2025 09:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745055227; cv=none; b=YelUmHYYCuU30oSmxwaihNF/OTApZxuYhV8mUKf6M7bTCe3xZnh76xzaraaVtbGj81hLlnLdw9jeca4i7SVCitttdvvlB5QB8L7h6X2ykhXejTHCLFGfYVbEdmxXAzq2Jrt6IcJoEWSIk2KgiiFkEhzNd0oLQS38bqdrHOH+eYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745055227; c=relaxed/simple;
	bh=tujxZc5FPqQZaxnHUo43K6r9AT/xvx1PqUeV+WBpWHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rJhUDqodz2uBADBMjtsoCvEiD0/ZXD5vZ8L7bZTxKf6j2fiLp4ahgu4PBSMvwiQrKz3Fp+vW7Y9WFPi885cstiXeb1xhvImzjMxH0gt8doYJenw95SHOP2Urpe3WZKaFmA8pN0ntww383oh/DpB3stljspx/s1KJj43BRe4rh6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=2XzxFNgv; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1745055223; bh=tujxZc5FPqQZaxnHUo43K6r9AT/xvx1PqUeV+WBpWHI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=2XzxFNgvjEvYAKv7VH49Xsa9L9X9dmjsKP5Rc3yeXS+PiL6qd2ai6CZZl3OmbkYa5
	 U0TTddQHNBriLMSeZnpGOhhng2EzCz+/0UOZp1tcxjUuZJX8TfcYXKZrPulvrIy3MZ
	 NploxEi+Nniuc1bQNEWEODsmuAnzbBp9hEZWtuCY=
Message-ID: <89d37770-48b4-474e-abbe-99c974032613@lucaweiss.eu>
Date: Sat, 19 Apr 2025 11:32:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] ARM: dts: qcom: msm8974-samsung-hlte: Add touchkey
 support
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Adam Honse <calcprogrammer1@gmail.com>
References: <20250419-hlte-touchkey-v1-1-9d93c3e2b31f@lucaweiss.eu>
Content-Language: en-US
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <20250419-hlte-touchkey-v1-1-9d93c3e2b31f@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/19/25 11:08 AM, Luca Weiss wrote:
> From: Adam Honse <calcprogrammer1@gmail.com>
> 
> Add support for the touchkeys on the Samsung Galaxy Note 3 (hlte).
> 
> Signed-off-by: Adam Honse <calcprogrammer1@gmail.com>
> ---
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>

This Signed-off-by is obviously meant to be above the ---

B4 is unfortunately not warning when your own Signed-off-by is missing 
and it added this one from the "cover letter".

Regards
Luca

> ---
>   .../boot/dts/qcom/qcom-msm8974-samsung-hlte.dts    | 45 ++++++++++++++++++++++
>   1 file changed, 45 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts b/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts
> index 903bb4d125135771504281df50aa11c9b6576a28..17d3e319941b8fd0363af600d93fc10127e4ab21 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts
> @@ -50,6 +50,34 @@ key-volume-up {
>   		};
>   	};
>   
> +	i2c-gpio-touchkey {
> +		compatible = "i2c-gpio";
> +
> +		sda-gpios = <&tlmm 95 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		scl-gpios = <&tlmm 96 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +
> +		pinctrl-0 = <&i2c_touchkey_pins>;
> +		pinctrl-names = "default";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		touchkey@20 {
> +			compatible = "cypress,midas-touchkey";
> +			reg = <0x20>;
> +
> +			interrupts-extended = <&pm8941_gpios 29 IRQ_TYPE_EDGE_FALLING>;
> +
> +			pinctrl-0 = <&touchkey_pin>;
> +			pinctrl-names = "default";
> +
> +			vcc-supply = <&pm8941_lvs3>;
> +			vdd-supply = <&pm8941_l13>;
> +
> +			linux,keycodes = <KEY_APPSELECT KEY_BACK>;
> +		};
> +	};
> +
>   	touch_ldo: regulator-touch {
>   		compatible = "regulator-fixed";
>   		regulator-name = "touch-ldo";
> @@ -149,6 +177,14 @@ touch_ldo_pin: touchscreen-ldo-state {
>   		power-source = <PM8941_GPIO_S3>;
>   		qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
>   	};
> +
> +	touchkey_pin: touchkey-int-state {
> +		pins = "gpio29";
> +		function = "normal";
> +		bias-disable;
> +		input-enable;
> +		power-source = <PM8941_GPIO_S3>;
> +	};
>   };
>   
>   &remoteproc_adsp {
> @@ -332,6 +368,9 @@ pm8941_l24: l24 {
>   			regulator-min-microvolt = <3075000>;
>   			regulator-max-microvolt = <3075000>;
>   		};
> +
> +		pm8941_lvs1: lvs1 {};
> +		pm8941_lvs3: lvs3 {};
>   	};
>   };
>   
> @@ -378,6 +417,12 @@ sdhc3_pin_a: sdhc3-pin-active-state {
>   		drive-strength = <8>;
>   		bias-disable;
>   	};
> +
> +	i2c_touchkey_pins: i2c-touchkey-state {
> +		pins = "gpio95", "gpio96";
> +		function = "gpio";
> +		bias-pull-up;
> +	};
>   };
>   
>   &usb {
> 
> ---
> base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
> change-id: 20250419-hlte-touchkey-8ea2f37a0795
> 
> Best regards,


