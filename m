Return-Path: <linux-arm-msm+bounces-112888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aXbdDeu+K2rgEAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 10:10:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 355C2677A8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 10:10:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=s4J6cpCW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112888-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112888-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5CFB1300F258
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 08:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 173B2374E76;
	Fri, 12 Jun 2026 08:10:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF68374198
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 08:10:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251812; cv=none; b=OPsw0T+b/SfX/L9n6w+CvejI9stNJvWSz/7jqIiIzur0uYYhmu90UPciXgQ1ZSeQP+RHMxkkABDFSwFUDioTtK4nCqxs3bvNqDmn2VYeMzrXxe6G3s3UfW2BYfRMGnNyKeqf0aErV6aO8X/jZKJANaXyP/aXaMf74vu1ajABOvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251812; c=relaxed/simple;
	bh=tlIFSDGimFC4A3TsOlVc1dm/d2ZHPIEkda2SqO3cXYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d+ogi2+axEiPa7DtE/sVc/keD3Gcd8m8PvJrXuzHsMgkAmwmaPmXIeJMgVtioGTJ6QlToLDIICRWcxqgK84bIGhCryf7/pKPjPPesNNaeFT3HrskR2ngEIWhVzsuNdL7XBk9yGR6D2p4N9RiZO/70WPI/OMtaVnGTAQ1xWsgC8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s4J6cpCW; arc=none smtp.client-ip=209.85.208.176
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-396770b47eeso390901fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 01:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781251808; x=1781856608; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qzqd0JGS+LvqWWHcM0Pu7KnmR8I/e+6J9UGxu+nu8iA=;
        b=s4J6cpCWL9+J/ts+XsGbAdn3vO8YyU7Ov9Ni7LPEWXJEEbA2ojahSYgc3CfsrfqPId
         EN/wHJ4v0guU3FrdS0wdj2NZYOi+noTMPZbbCio1Bnv5b6Cx2yME/UThwixIecqgaifj
         OO22hzzY2t9xHWXt1Egs82Rp44+WD6MHIQJbJintei5or8ZooYZ/lRJ1N8TrBdfuQpNU
         JX13NFxlQO8+MK6Ku5W6wv4EQfnl10OrQ/d1idwfiH20pdNlQx4Nwrlu861vBSI89z4F
         X++HBGFstY4A3BCrag8SFqFZiRCr0WvO1uapOlc0Rpi1GPuIHN0+CasPzc4g+mmD9i5/
         Jstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251808; x=1781856608;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qzqd0JGS+LvqWWHcM0Pu7KnmR8I/e+6J9UGxu+nu8iA=;
        b=YhqST0bPB/dYlKwGD3CgSTi1VfuP97/UptHbbmQGrfaKTCoMBDx/kDJ11sKZXyzZXx
         tidFk7tSTziOCft8+IU2GajDnQsl7Qv+mIHW7gQ7Xq0VpwR1BoMTNgxJgoZOkBsy03c0
         Z7hatVAWA+HP7Nnv/5yBN29Fnw99gji7SNLnDIz8hmmqFlQJIu+dhSAWP+w6f2id0ner
         Yx1seXtLsarEq4ZJF/yjM1KJzVngdjc49tSILidsUcUcyml/CZg8CTGXcDon5MgQOj4q
         UTNosYxcNjwbbxUN+PFOMnrW8c4PiZLdioHti9517dtEsu96nxtxSBEXdcWVpuL2kxFm
         JXUQ==
X-Gm-Message-State: AOJu0YyIFBFl84Amj2NLLbwuC3dCcfTPzRMcsH+oCXkYsC4rA/kPoACd
	RL2mgKyQ/3irCl9gOnJMAHQAOweN5RFBWQc+COiE9Up9UUQDPuZ+DhmIA+FmYVkR05g=
X-Gm-Gg: Acq92OEXwzvqj/XXZqZYTf3fSUy/VhjdRnrBZHwByODUzS4g/zpXAkwL7Vj+q/tI+9H
	IryGIejW2Wu1bfrdNKY1+FWxno8H1eJy+uYfPuNmJ69GSOeZdIWVqI+atpNS5CyAONSjDqLymUz
	N2GJmlcoi3awfe9SSL/OfEbPwytWIbrsNImeH/UciWA/IgBu5eZ3YNCk/5B+W1JNiat4SL8I7In
	zaRnwTHU7tSJ3snBOdnMJV0CEvsy2iV0EFUpM1EEOw5evNkvET3lfm0xgZZFy0oiCr7KV+6UMue
	sQ+/jpG/ESIC/MVKasUUdRJrQTHhAvy0pTKHEI+iGb72cjUAdXl6MgIOWuvbVmd6WCGjD9ygXHp
	UxuVxTmF2Hy6vfOz7bd0LQoXfTe11uss/VF6IIuJKN9i3feskbUB0bNKSQajTS+9zw/W++obZGB
	y859sjX5pRmm6kmGTuxdUwBZWR45E9W1m7MNNxZeJHSzG1EYPe+s609gClM0HUbDQh5923dE63p
	ApHrg==
X-Received: by 2002:a05:6512:3b0a:b0:5aa:6ba4:46f2 with SMTP id 2adb3069b0e04-5ad2db189d7mr289426e87.1.1781251807831;
        Fri, 12 Jun 2026 01:10:07 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a6fc0sm332575e87.51.2026.06.12.01.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 01:10:07 -0700 (PDT)
Message-ID: <b10ecb42-0d4f-4037-b786-cc52bcd1bdd6@linaro.org>
Date: Fri, 12 Jun 2026 11:10:06 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom:
 shikra-cqm-cqs-evk-imx577-camera: Add DT overlay
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
 <20260608-shikra-camss-review-v2-6-ca1936bf1219@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260608-shikra-camss-review-v2-6-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112888-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linaro.org,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:nihal.gupta@oss.qualcomm.com,m:bod@kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 355C2677A8F

On 6/8/26 17:06, Nihal Kumar Gupta wrote:
> Shikra CQM and CQS are retail variants sharing the same PM4125 PMIC
> and identical camera supply rails. The only difference between them
> is the integrated modem on CQM, which does not affect camera hardware.
> 
> Add a shared overlay for optional IMX577 integration via CSIPHY1,
> used by both CQM and CQS EVK boards.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile                  |  6 ++
>   .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso | 70 ++++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |  9 +++
>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |  9 +++
>   4 files changed, 94 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index a9e9d829fb962386b3975f345ec006504607130a..76b8f144983827f4905a72935e8d5291a227dc97 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -337,6 +337,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
> +
> +shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
> +shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
> +
> +dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..e3dad7c81e5e8aeb1061c784b5b893965f914a6f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso
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
> +	vdd-csiphy-1p2-supply = <&pm4125_l5>;
> +	vdd-csiphy-1p8-supply = <&pm4125_l13>;
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
> +		dovdd-supply = <&pm4125_l15>;
> +
> +		port {
> +			imx577_ep1: endpoint {
> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <0 1 2 3>;

The numeration of data-lanes shall be started from 1, this has to be fixed.

> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> index 0a52ab9b7a4c34d371f5ac23efe59d1c9d2723f4..0d5c3e31b1f613157d4d2ec6947c630f1031b73b 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
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

Since it's a mezzanine specific pinctl assignment, it shall go to the
correspondent .dtso file.

It's a concidence that one .dtso file is good enough for describing the
mezzanine for two diffferent boards, but let's exploit it by keeping one
dt overlay file as it is now.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> index b3f19a64d7aed3121ef092df684b19a4de39b497..515af370ca014a668dc035ff944fb82b6e09ceeb 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
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

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

