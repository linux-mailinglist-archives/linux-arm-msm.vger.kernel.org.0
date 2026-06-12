Return-Path: <linux-arm-msm+bounces-112889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9MxpDGHAK2pfEQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 10:16:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E768677B81
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 10:16:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=Poip8q+F;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112889-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112889-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EBCA5301E9BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 08:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83533749FD;
	Fri, 12 Jun 2026 08:12:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49E635675D
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 08:11:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251921; cv=none; b=SOCeorIlJv6eLt3LhLm/R2L7phcTGDNPTYkhW1GaSJfF20iT6KiwZqSqreV6j+0591Ok/yoydt+blypDpSNl3Qbo9XOula4ZqqkhMw+Glpa3AHc9lwqlxDw11Rfh81fnfTu/w3eydvVFVEaK1qVUqPoeTo3JQY0YLCqUnZ5LgMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251921; c=relaxed/simple;
	bh=w/KMCvTAaLSnkJCY40Gg7KHEFZvGewFVkWrfXQdQo0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dhuPsgJaEhLMyX2O5SiZoD4dfsrF4AXc40zsI9vaRpr5fhSy+++Ahpep2W+PahN4fQ3IotsJLkUZivQkPAKGYTIOrg6WnVJpZb3/rGZ5gFr/6w5aBD+AYDu1GKbRT7cwUOWZOQgIiRQrAprSLVbSSOlu96OX3b73IdIPpWjjqiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Poip8q+F; arc=none smtp.client-ip=209.85.167.52
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa5a77c07aso104947e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 01:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781251918; x=1781856718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrRgMzUk2Tnqgkc/wKcgEOgJeLLj9KV+tTDn5EhNFR8=;
        b=Poip8q+F82ckFzVo4AomKTGiFGAL3Z6jV0RrXwe/uzdrEIh2x7AXdzqenay0iuT+Iy
         z5E/Vb0YAuZkpn2QxRWVfCJLgflSlWck9dtY/SLck59166D75HWVGDxIIeMZBI47bKhb
         Q8W/xGZE2OvLJzbt+35LObA5tx9vOSzDBKVbtb5A/RBIjaWDxaEcO/0DcII9hrcNo3JA
         /4ByqYZq8TrGaXp5wV94CC6SiMy5KSVCNM4hBSdYRjwG72wW40izLbIrkYpj3iuHpdYm
         YBOwq1B/Ew/APWxREvh93loWftMHjcO1tOkIl8nHif8ecI8ijTysQcw2LOY64DvqcQt8
         AJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251918; x=1781856718;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MrRgMzUk2Tnqgkc/wKcgEOgJeLLj9KV+tTDn5EhNFR8=;
        b=m1ZxKV/FmtpkA3HKCKFviXIhy+VITa3eJ1KPb9RA6hOtIEWvhVnDQzcibp1Ldy0iX6
         dIXzPtAgYMS+q+et6hoUZKhp7Ep7hKHCAZ2D9kG3rx8pIpglBTR2M8wMs3dC2epkUhuu
         UNlXphiFfvLjEwnbuo9IKUNgmFXe1F+5944WwcywfQUw3vCJiO9Wf09Sw5KFtD6gPd+N
         uGB6q+3//xWePxHKrqBZw4LJ9A7g/EZnGb21Kpe9/+XudAZkV2YRrOSEXe4CyZpmho7g
         kA72PSu91pVOcdIJoelAbxlN9Rc/76Cx4C7PzK35PLKSEk2/I0OyHka6V/sjmaC3QHbN
         hEpQ==
X-Gm-Message-State: AOJu0YxwTyoM2qmMPXB/EYb1nHyCthB0KurQIedBJHtQYk0Y1guznbq0
	QY5SByVEwd7XGx/FjEqEBw89kcPVcAJ6p6XF4QcCO6iiOP8SDkP8IMtP6ONd48OzkMQ=
X-Gm-Gg: Acq92OFrysnTLD9EAwpiQ8E7kSw3CkhQcCPFqIcPzpp/VfnLlk43rLIi6wxYVdk6OMW
	GJ4pcgbmVHzLWKAcKG0gbJwWBZRk7K9Kv2YfLoJ4ZbeeLXDi+1xVSmLMuOHJ0ew59aG67dJM16K
	j9mr7tOzJwzk0kSeFMApjC0tr0217Sdgn9Sl8YOh+p9GBijbWWAF8f/t6TIKZl9kUVZbPxf1fKf
	qGl/rmm64V+kXltdsBBOdam31gBP1cO/nya0UMpKwar9BietWk/nO6ILpBmusFZsH/ef1FLCyAV
	efVuDTN2SL4R1sAB00+0VtwIOrLzxhm/joYotDzuZSqh1Y7fdQI1cnoCq+3DL66ZTpUacslZkjy
	LZ5zUgSj/w8G8Q6WZeS2dJeqmVvzYV4A9DguQBcUpnbQoHYWmBW5LjL5mCWafCtR5O/1sMB5RiR
	Ln155Reczgik0TOc7+JFz6dyFabMEOmHlhPOtg+zMpzDrXHxppDmKrMvqxhIIsg/0p/eOn6A7nG
	bz/2w==
X-Received: by 2002:ac2:5f19:0:b0:5aa:6ba5:9a58 with SMTP id 2adb3069b0e04-5ad2db30090mr185209e87.1.1781251917979;
        Fri, 12 Jun 2026 01:11:57 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1bb12csm324070e87.84.2026.06.12.01.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 01:11:57 -0700 (PDT)
Message-ID: <6ec25a28-9d0f-4c87-a4e1-85d8e410eaba@linaro.org>
Date: Fri, 12 Jun 2026 11:11:56 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: shikra-iqs-evk-imx577-camera:
 Add DT overlay
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-7-ca1936bf1219@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260608-shikra-camss-review-v2-7-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112889-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linaro.org,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:nihal.gupta@oss.qualcomm.com,m:bod@kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E768677B81

On 6/8/26 17:06, Nihal Kumar Gupta wrote:
> Shikra IQS is an industrial-grade variant using PM8150 PMIC, requiring
> different CSIPHY and sensor supply rails compared to the retail boards
> (CQM and CQS) which use PM4125.
> 
> Add a dedicated overlay for optional IMX577 integration via CSIPHY1.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile                  |  2 +
>   .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     | 70 ++++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        |  9 +++
>   3 files changed, 81 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 76b8f144983827f4905a72935e8d5291a227dc97..09f2318d1c12c4239a6a7bac4ecbca38eb65ffa2 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -340,9 +340,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
>   
>   shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
>   shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
> +shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
>   
>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..340d6303adc6e1bea55f1bd0598175f0cb269737
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/qcom,shikra-gcc.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&camss {
> +	vdd-csiphy-1p2-supply = <&pm8150_l11>;
> +	vdd-csiphy-1p8-supply = <&pm8150_l12>;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			csiphy1_ep: endpoint {
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx577_ep1>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci {
> +	status = "okay";
> +};
> +
> +&cci_i2c1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@1a {
> +		compatible = "sony,imx577";
> +		reg = <0x1a>;
> +
> +		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam_mclk1_default &cam1_reset_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
> +		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		/*
> +		 * avdd and dvdd are supplied by on-board regulators on the
> +		 * IMX577 module from the connector's 3.3 V rail; they are
> +		 * not SoC-controlled. dovdd (1.8 V) powers the carrier board
> +		 * level-shifter that translates CCI I2C and reset lines
> +		 * between the SoC and the connector.
> +		 */
> +		dovdd-supply = <&pm8150_l15>;
> +
> +		port {
> +			imx577_ep1: endpoint {
> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <0 1 2 3>;

Same as before, the numeration of data lanes starts from 1.

> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> index 3003a47bd7594206f0ac54957e0af509fa365f54..811fd5da4af7babd412d70fee84434849846dc2f 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> @@ -38,3 +38,12 @@ &sdhc_1 {
>   
>   	status = "okay";
>   };
> +
> +&tlmm {
> +	cam1_reset_default: cam1-reset-default-state {
> +		pins = "gpio33";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +};
> 

This part goes directly to the mezzanine .dtso file.

After fixing it,

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

