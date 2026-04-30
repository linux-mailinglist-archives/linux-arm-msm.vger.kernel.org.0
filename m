Return-Path: <linux-arm-msm+bounces-105326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Bh1IMI882kGywEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 13:28:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E17934A21DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 13:28:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BBDE302F69D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 11:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F373D7D61;
	Thu, 30 Apr 2026 11:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XcYxx0ah"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBB33D566D
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 11:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777546846; cv=none; b=YtuCkYwzg8M0Tvxk9AxM88A7LDe+cbOxBeRBnYUjU9J6RKtJ6w1R6JIxR3k6ZZRIQ23JKi5hz0nb3HpGbfdvfSqpxh4qNKkh5N5rr0+CIFU5ppq+h27/swaKf6SJaghNtk9PNfr55H5DCToaZ4SDHHC5ZkcKHs+sf7k8hFtq24A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777546846; c=relaxed/simple;
	bh=4XLAVbaZpTk3wINhLWZowaujYOwzPCe+OLMhBJ6fubQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iVc+/dvueQTkKV1McEf0XkHCFCRh7wCeZgOgtaPa48AUcOisCVY6a1T4pCqWGVU3/kM/3nQBDH8D4r1Z3Jnsh4f2IcLRntQhLnT7CjiT8KWcUXusVC7vDylQtsEUwssuGncParUerQTRK5BCvzv1/K4sBMQiH0pYQZrqM+EO1FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XcYxx0ah; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38e8232b28dso1101821fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 04:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777546842; x=1778151642; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wqmpJe7hg5NPSfjQFL8LIdfA62WQcT26qf/cbgPS9B4=;
        b=XcYxx0ah+ixsinfwEU9AZdppurUpZvE4883kEakMJObQ294gKX9kNkNTtxpko4m5l8
         QoldGsbWHOkMJJNEVpTfn0h8/b1KLljCdN+C0SpNBqq4dsGqJD7glmL1XIj+L6fOKX0u
         +yzAxjKWAa17WNh/2EyIvUyZ4yyVdmmyOJbTPUlL4PBIgZNRUx58W5hhjHkpCnqdi7X7
         3f0ugpfRXLyPs99uZpb8QUXgdjPx2GOm5TB89Y/5NxOhSECfgBxPFJDv6Oq+FHjaRHRn
         sN5NGtlI9/w2pb8Ma3bsnJKQXMDizlmDyOSJmv/fzmy3ZH/xTfPxL1f4AShJn1kI2ySu
         dMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777546842; x=1778151642;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wqmpJe7hg5NPSfjQFL8LIdfA62WQcT26qf/cbgPS9B4=;
        b=cLNAbssWW8knbzZ4slxOYqWiyOgh+qyg7LZ3c/e6u74RwCuWRxzmrEWPq+15HL6lv+
         gBltC+rB8gW49mkzOm2VtTCdusi11S0dQbXaf1PutQ/BDqaN+XASWG98Sw/+jHaQC+8o
         xXVzEfENcs85MwE0aAk7fG5TQJrh/3+sp8wBZtzZU4QNbti3eaOrutRzvMC/bdgk6D0H
         wowQwq1DNs147809HCX4ycu0soIVUQIroLAFOVlNDWnhGQkTcfHCJ043K+3/xir0BghQ
         +4u4bSPdmDp6hVs+Bd8qivTCYSpulYtjg3a96FgoVqbepHyLA3iYE6qwCzhz8UvX+Qel
         JtfA==
X-Gm-Message-State: AOJu0Ywp0qFS8oKajdiak6focZjGxHf8El39i77/j5697ia4JFRBJGnD
	dehND5JRvpBNdA8oxxjjwnM09hLYHJbnh4sdY6s8dMwX4Q6m46RFvygId+fXxLWMP6U=
X-Gm-Gg: AeBDiesqazjmBZUtGKaoCS1xEq23AeHiLrs+tPao6VCSxGqojlxTOTb87lHLfIoZJWr
	ezInuy5mFbWpeauaRVH8pubay2MtUtebGUQO+rxuVDCB9yrbCk/v4JfCmkW2tJCF3Pf2561Yj59
	WX+3S6Rusje6+qVQAcuRQjp7mRjhU7LRKlp87aOFQz0Ar+A8gSGRvGRaQc0tOzwlH8EMEG2hz+I
	9hrfyT6cofC7IAj0UciSl2+kTgYo6AsSR5oqi5/YrpTpi7y/ZTRM2jvHFPNROrbw3SAtD6tbTx7
	ktj6hrVNgd3icqM7vDvoYTVBu3lKqEaaBvUuO4uyAJfUk6Vy9oTz/rV8ZDWX+VM1Yo06KrsC+1I
	boopWE/y22SGtFdz5mhT6P+H4jrY1R1Q2ZqFtPtcI8+ETJxIRJ2Njd56A24UPCQ3DmQUaOH+Dxt
	463SzAC05sVd3qmkpKlz+gQa3R6PFDRrOTWpegBuhU9ZFbEtWfRGHAAdw9tHNSNF9am9ziOsGaK
	3bwlulbAvm9TgMO
X-Received: by 2002:a05:6512:224e:b0:5a3:ff48:f7fd with SMTP id 2adb3069b0e04-5a8522de224mr321512e87.8.1777546842144;
        Thu, 30 Apr 2026 04:00:42 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a74a6fa2b4sm1357336e87.35.2026.04.30.04.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 04:00:41 -0700 (PDT)
Message-ID: <db441eb6-195e-4018-a84d-77b2d1531243@linaro.org>
Date: Thu, 30 Apr 2026 14:00:39 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sc8280xp: gaokun3: describe rear
 camera module information as musch as possible
To: Pengyu Luo <mitltlatltl@gmail.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Martin Kepplinger-Novakovic <martink@posteo.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Martin Kepplinger <martin.kepplinger@puri.sm>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260425105300.745044-1-mitltlatltl@gmail.com>
 <20260425105300.745044-5-mitltlatltl@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260425105300.745044-5-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E17934A21DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105326-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[linaro.org:s=google];
	GREYLIST(0.00)[pass,body];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,posteo.de,linux.intel.com,puri.sm];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.959];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.3:email]

On 4/25/26 13:53, Pengyu Luo wrote:
> The rear sensor is S5K3L6, describing it but dropping compatible
> string, since there is no upstream driver. A funcitonal downstream
> driver is in comment.
> 
> The VCM is dw9714, describe it.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
> Please take this patch as a RFC, I am not sure, how much I am allowed
> to add without a sensor driver.
> ---
>   .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts | 129 +++++++++++++++++-
>   1 file changed, 123 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> index 39e559e91289..76b1ecb3819d 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> @@ -22,12 +22,18 @@
>   #include "sc8280xp.dtsi"
>   #include "sc8280xp-pmics.dtsi"
>   
> +/* remove due to gpio pins collision, skip 2nd instance won't break things */
> +/delete-node/ &cci1_i2c1;
> +/delete-node/ &cci1_i2c1_default;
> +/delete-node/ &cci1_i2c1_sleep;

Instead of removal 'cci1_default' and 'cci1_sleep' nodes shall be rewritten
by excluding 'cci1_i2c1_default' and 'cci1_i2c1_sleep' from them.

> +
>   / {
>   	chassis-type = "tablet";
>   	model = "Matebook E Go";
>   	compatible = "huawei,gaokun3", "qcom,sc8280xp";
>   
>   	aliases {
> +		i2c1 = &cci1_i2c0;

Likely this I2C alias can be removed.

>   		i2c2 = &cci2_i2c1;
>   		i2c4 = &i2c4;
>   		i2c15 = &i2c15;
> @@ -52,9 +58,17 @@ framebuffer0: framebuffer@c6200000 {
>   	leds {
>   		compatible = "gpio-leds";
>   
> -		pinctrl-0 = <&cam_indicator_en>;
> +		pinctrl-0 = <&cam_indicator_en>, <&camera_flash_en>;
>   		pinctrl-names = "default";
>   
> +		camera_flash: led {
> +			function = LED_FUNCTION_FLASH;
> +			color = <LED_COLOR_ID_WHITE>;
> +			gpios = <&tlmm 93 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "none";
> +			default-state = "off";
> +		};
> +
>   		privacy_led: privacy-led {
>   			function = LED_FUNCTION_INDICATOR;
>   			color = <LED_COLOR_ID_WHITE>;
> @@ -129,6 +143,18 @@ vreg_camf_1p2: regulator-camf-1p2 {
>   		pinctrl-names = "default";
>   	};
>   
> +	vreg_camr: regulator-camr {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg_camr";
> +
> +		gpio = <&tlmm 92 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&camr_reg_en>;
> +		pinctrl-names = "default";
> +	};
> +
>   	vreg_misc_3p3: regulator-misc-3p3 {
>   		compatible = "regulator-fixed";
>   
> @@ -387,8 +413,8 @@ vreg_l1b: ldo1 {
>   
>   		vreg_l2b: ldo2 {
>   			regulator-name = "vreg_l2b";
> -			regulator-min-microvolt = <1904000>;
> -			regulator-max-microvolt = <1904000>;
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2800000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
> @@ -433,10 +459,9 @@ vreg_l6b: ldo6 {
>   
>   		vreg_l7b: ldo7 {
>   			regulator-name = "vreg_l7b";
> -			regulator-min-microvolt = <1800000>;
> -			regulator-max-microvolt = <1800000>;
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2800000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> -			regulator-boot-on;
>   		};

ldo2 and ldo7 changes shall be done in separate commits.

>   
>   		vreg_l9b: ldo9 {
> @@ -622,6 +647,16 @@ &camss {
>   	status = "okay";
>   
>   	ports {
> +		port@0 {
> +			csiphy0_ep: endpoint@0 {
> +				reg = <0>;
> +
> +				clock-lanes = <7>;

Please remove 'clock-lanes' property here.

> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&s5k3l6_ep>;
> +			};
> +		};
> +
>   		port@3 {
>   			csiphy3_ep: endpoint@0 {
>   				reg = <0>;
> @@ -634,6 +669,58 @@ csiphy3_ep: endpoint@0 {
>   	};
>   };
>   
> +&cci1 {
> +	status = "okay";
> +};
> +
> +&cci1_i2c0 {
> +	voice_coil_motor: vcm@c {
> +		compatible = "dongwoon,dw9714";
> +		reg = <0xc>;
> +		vcc-supply = <&vreg_l7b>; /* FIXME: require l2c on first */
> +	};
> +
> +	/*
> +	 * https://source.puri.sm/Librem5/linux/-/blob/pureos/latest/drivers/media/i2c/s5k3l6xx.c
> +	 *
> +	 * This sensor has never been detected on Goakun3(2.69GHz)
> +	 */
> +	camera_rear: camera@10 {
> +		reg = <0x10>;
> +
> +		pinctrl-0 = <&camr_rgb_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&camcc CAMCC_MCLK4_CLK>;
> +		clock-names = "mclk";
> +		clock-frequency = <24000000>;
> +
> +		rstn-gpios = <&tlmm 7 GPIO_ACTIVE_LOW>;
> +
> +		vddio-supply = <&vreg_camr>;
> +		vdda-supply = <&vreg_l2b>;
> +		vddd-supply = <&vreg_l2c>;
> +
> +		/* &camera_flash can't be enabled directly for now */
> +		leds = <&privacy_led>;
> +		led-names = "privacy";
> +
> +		lens-focus = <&voice_coil_motor>;
> +
> +		orientation = <1>;
> +		rotation = <180>;
> +
> +		port {
> +			s5k3l6_ep: endpoint {
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&csiphy0_ep>;
> +			};
> +		};
> +	};
> +
> +	/* eeprom@50/51 */
> +};

I believe it is unacceptable to add device tree nodes like this one
without a compatible property. While the motivation behind it is clear,
unfortunately it has to be removed.

> +
>   &cci2 {
>   	status = "okay";
>   };
> @@ -1423,6 +1510,13 @@ cam_indicator_en: cam-indicator-en-state {
>   		bias-disable;
>   	};
>   
> +	camera_flash_en: camera-flash-en-state {
> +		pins = "gpio93";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
>   	camf_1p2_reg_en: camf-1p2-reg-en-state {
>   		pins = "gpio44";
>   		function = "gpio";
> @@ -1446,6 +1540,29 @@ sc-rgb-xshut-n-pins {
>   		};
>   	};
>   
> +	camr_reg_en: camr-reg-en-state {
> +		pins = "gpio92";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	camr_rgb_default: camr-rgb-default-state {
> +		mclk-pins {
> +			pins = "gpio6";
> +			function = "cam_mclk";
> +			drive-strength = <6>;
> +			bias-disable;
> +		};

MCLK pad function shoul be a part of the change to sc8280xp.dtsi

> +
> +		sc-rgb-xshut-n-pins {
> +			pins = "gpio7";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};
> +
>   	i2c4_default: i2c4-default-state {
>   		pins = "gpio171", "gpio172";
>   		function = "qup4";

-- 
Best wishes,
Vladimir

