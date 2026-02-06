Return-Path: <linux-arm-msm+bounces-92067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMd9BKUWhmk1JgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 17:28:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E57100409
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 17:28:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBCA830432FB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 16:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3109328B78;
	Fri,  6 Feb 2026 16:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w35VbR9o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67903328B52
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 16:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770395152; cv=none; b=FUbTwx5+i7tgcJCy/6HJpQCNLW1Bs9HodsjOw3f4sMBfhwpd/Ie9KTuDJ9ciZUoKgYQc+VTspsdtMM5osWAAVGGJEE1BXDOuoqmiriMMyLEQtiyLBFPwqItWqfMNKDx84uM369cJKURQRQ4Mit/t8zF4kb9nB9x4HJ30E1rZ4NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770395152; c=relaxed/simple;
	bh=kkIsEzWW3sArWoc9saj9rYNsVs8MtIvVRU0xQyiN1e0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tSDDXsr0VyZaV50yi7f+TP7KR5hzIOMUsARxWveMMVs9pTAzCdR6jMAlzW6vIZ2zsd7bshPXxfpwi7Pk/7dXOLw197EGNNX0xyE/MIznktKKwnYPyuB+X02VV3pCT2CwPpb5Ox5EpgQQjFMMUq8DK86GRMZc6R6yvtL3GENWrhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w35VbR9o; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59de2ad4af8so271409e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 08:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770395150; x=1770999950; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLftybbN8ivPeyXwk8NLfhAbzG7sAr9RazdOdi/8IEo=;
        b=w35VbR9onlYYMy2J3u65j8zFHUzDRlVSRi4exxD/hccPl0YkO16ilQyU1hHl3n4qUE
         zu/vy3Y5Oeh0t+h6X4viqnpWC5H4uC7QO+uhD1EMK2xWgyhUWi/+jzN3fpbPJyVamYDJ
         gNW4uBB8zIFe7ITpL2He37AW+OtswXBEVPfuC/mgO74UBq3cuIIDJPX3Qgi/7KapzUBk
         mB2Dr8vMjEEaOPywHiiFn1p+Ah7WY9aNW4eoTJFs7kXwxey1HRDgk07EKX5Gy/RSdkst
         IVpNK926LCuXmHRNs4OITrbPWvwiY0/ObcuLdF/9wwX3R4L17yaNAypzCOuULreh3gPy
         vgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770395150; x=1770999950;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fLftybbN8ivPeyXwk8NLfhAbzG7sAr9RazdOdi/8IEo=;
        b=MriTW5dvcGFatn/hV9hNc0+bStk9zkXXXJo4CrVP7r1Z5Kd70yNzbbaKc8G+6I08Sw
         lJnmsAQ37FJXqbnJGU3wOW+M3YRpL0XXMPBCxQgh2iIzI4ow0NYdnnuaVS/kPyQlbRHd
         2khsYvsHR3OzR73T0Tgvp+kb5IRtWwet8aO2kFAHmhP7Susi9ImmLzlhFvZLVGgG1krE
         N4emBTHlMlVl+j62wEUwbpkrzcXZB7Ptg2hc8V4LH+E29p5/tWnilHfU3KxKKCuGE8t8
         TQoVRmUk1jLBt+9rDDL54/sqBtoOu9bFnE+yuDs57MvPdqPLSCZTNo41E1dn+LkI6M20
         nzJw==
X-Forwarded-Encrypted: i=1; AJvYcCVlenA+DP/NdQ7Sgc+jdkCU4qHESGrptxmwYpbOvjUTa5Au/Eelfu0jdiuE+mTZZLoYX3jf0n8P99dsUwQw@vger.kernel.org
X-Gm-Message-State: AOJu0YyIZXt5R36rleB+FdTDCD8yU/epM5VGTjFaSaIdTSWd+r91Wdzp
	UpctTKyKJrUhmOFGqKWPnfJYX43j6E2RrdBiBBpBXjOQQ6/0L1t+5mhrGiVogo5YP14=
X-Gm-Gg: AZuq6aK+ewCdllPK3TGFEbIxS3QgeoPYXH6B9LzoyFlvKwJtDdN8j5FT8VWaQWURD3w
	OlijQn6BVQO2Mm9vaF4Uv5S1qy7BV3XJC2y3w2XzSIdz0DSKcua4OEAIK17FEvCbqdA+BoqmJVx
	ZsFYbW0MG2hxs5PXxqij2ShYf1xopb9IPA0o6kQZytTzMkoSLsIuyMlR2ZpX4mz1seCAh/VHJhp
	yDSHXkZw+X4OA07gOvRNxGir59inX5nNxxG9xii9I5sNMoeCC376IIBoVlUF/g9BjfRvW0wjwMG
	/tg+bipYg35G1euX2PqOTum9YBqx2MoVR+4HFiDoHl8PG+EbQjddEPJXGcpc9IyVsH9cImWM5lr
	m1T5kEpgKlNGRcb7osCPvTT4NJ1Q78mj0ngh96sDlTR58KQrNNNaYY5QrupHVrnTAmhZ6pJdYhH
	eFs6jR8nBn8zGCdCsy+CgvcBL3R/sSi/Uf7Kd4+ri4x4pRUbc0/Tst+Cvxxm+lbV2mIw==
X-Received: by 2002:a05:651c:154c:b0:37a:7a9c:5c0f with SMTP id 38308e7fff4ca-386b51d93cemr7758311fa.3.1770395150443;
        Fri, 06 Feb 2026 08:25:50 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b623668asm6346741fa.3.2026.02.06.08.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 08:25:49 -0800 (PST)
Message-ID: <e0969b37-8a7b-416a-9789-8662ce7f3307@linaro.org>
Date: Fri, 6 Feb 2026 18:25:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
 <20260122-sm6150_evk-v5-5-039b170450a3@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260122-sm6150_evk-v5-5-039b170450a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92067-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,1a:email,linaro.org:email,linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 68E57100409
X-Rspamd-Action: no action

On 1/22/26 12:48, Wenmeng Liu wrote:
> Enable IMX577 via CCI on Taloss EVK Core Kit.

Typo, s/Taloss/Talos/

> 
> The Talos EVK board does not include a camera sensor
> by default, this DTSO has enabled the Arducam 12.3MP
> IMX577 Mini Camera Module on the CSI-1 interface.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile                  |  3 ++
>   .../boot/dts/qcom/talos-evk-camera-imx577.dtso     | 63 ++++++++++++++++++++++
>   2 files changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index a2e48b58323c10735c8b98996cee6669e4f918e7..b505b5b1aa2feaaae691977b35a2d872751c4a46 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -349,8 +349,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtbo
> +talos-evk-camera-imx577-dtbs	:= talos-evk.dtb talos-evk-camera-imx577.dtbo
>   talos-evk-lvds-auo,g133han01-dtbs	:= \
>   	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
>   x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso b/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..53006a861878f9112673b9a0ad954bed7a5fdca5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/qcom,qcs615-camcc.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&camss {
> +	vdd-csiphy-1p2-supply = <&vreg_l11a>;
> +	vdd-csiphy-1p8-supply = <&vreg_l12a>;
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
> +		reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam2_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		avdd-supply = <&vreg_s4a>;
> +
> +		port {
> +			imx577_ep1: endpoint {

I'd suggest to rename "imx577_ep1" label by dropping the '1' at the end,
it brings more confusion than meaning, at least in 'csiphy1_ep' name it
means the CSIPHY id, but here "imx577_ep" would be better.

> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};
> 

-- 
Best wishes,
Vladimir

