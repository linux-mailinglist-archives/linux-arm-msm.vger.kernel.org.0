Return-Path: <linux-arm-msm+bounces-4676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0645C81296B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 08:34:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 667A7B20FF0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 07:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65DC912E5E;
	Thu, 14 Dec 2023 07:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fz3lXTFa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B796C187
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 23:33:56 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-548ce39b101so10560953a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 23:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702539235; x=1703144035; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wcv7sGgcNTnRT1bBWy6u9QOHZXNv+hQLmOYd4/d0PoQ=;
        b=fz3lXTFaTFLONBQg6yXFDZkqqUX6TesePAk7qOeP26LER0oIgqJeO+rMtH1XKdflji
         hXSMRT2C5Z771LmvtHjefGPg9R74SJolK2/pLdHTOMcXjBh2N0rsXrCe0xCPN6Iiru4s
         Zxg7+afdf1tDvD5ahcRDoQ5Db1TSPfzrRLUlBxvP+tWZwKJ8bX+Sn7ha/2dLY1PPweg6
         KLfqLR+EMduHIkqChJ7k1zATPGJn+dmFsD/eBqylWIQPEhpBMgUFtvbOcnNAzBFmhysP
         I1mZjCrmJA5JxTd3tL1tCVlmrS0ZF+S9kKsKGSGZ3/f+SO4QMqJzOdVJFnVQAEbDHfcd
         Cyqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702539235; x=1703144035;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wcv7sGgcNTnRT1bBWy6u9QOHZXNv+hQLmOYd4/d0PoQ=;
        b=OJGUsJ27W81NIxOlWLWwOyCRDgAJ0WgnwbURmlTAmhTbVdN87Uu/mpdRmYPVeHTGLQ
         3bILPY6fgqs7ZZWp2zEU3jTTsJxVFeiHDMizolsobg9sjz2BKPFpQTE7cVQPPobzXnnu
         z+FlhzC9DE/7LY63lNaK8gTOyE0XOSdkwCsua6Xwh/wNdZZLEC5Dui3QUiVy8v96b0Xt
         Wg+g8O/fIwdazQf5/eaacHdKJopoJ/8o7V+B9c2I/MclWOoRwWv6NIswjQrerRgHfjVm
         W1VN2+8pGi4I0A2IwnwkZLfo+TK9QWvatOzVdfT2AxkUBCiZiQm4eA/wTvUui7hLNXug
         rCLw==
X-Gm-Message-State: AOJu0YwWr/IZGJDkmtUjYMh8//IiMtnciD0Mx4uHH8ID0xHWqdMm8EKC
	J4Ik1oG5P28qQFJZjtOeKu8aow==
X-Google-Smtp-Source: AGHT+IHGEVebgVIc7poq1NDQSzshE/fnhw0BckYI+SIiFGDxAtHqp+Z8O+dGXQIENOcUlIoKkOebrA==
X-Received: by 2002:a50:cd81:0:b0:552:5c38:5d59 with SMTP id p1-20020a50cd81000000b005525c385d59mr430628edi.48.1702539235155;
        Wed, 13 Dec 2023 23:33:55 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id bd18-20020a056402207200b00542db304680sm6440491edb.63.2023.12.13.23.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 23:33:54 -0800 (PST)
Message-ID: <a1563e29-2f20-4b1e-acbf-2b6d77dc7831@linaro.org>
Date: Thu, 14 Dec 2023 08:33:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: qcom: msm8926-motorola-peregrine: Add
 initial device tree
Content-Language: en-US
To: =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20231213-peregrine-v1-0-5229e21bca3f@apitzsch.eu>
 <20231213-peregrine-v1-2-5229e21bca3f@apitzsch.eu>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231213-peregrine-v1-2-5229e21bca3f@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/12/2023 21:33, André Apitzsch wrote:
> This dts adds support for Motorola Moto G 4G released in 2013.
> 
> Add a device tree with initial support for:
> 
> - GPIO keys
> - Hall sensor
> - SDHCI
> - Vibrator
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
>  arch/arm/boot/dts/qcom/Makefile                    |   1 +
>  .../dts/qcom/qcom-msm8926-motorola-peregrine.dts   | 297 +++++++++++++++++++++
>  2 files changed, 298 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
> index 0cb272f4fa45..9cc1e14e6cd0 100644
> --- a/arch/arm/boot/dts/qcom/Makefile
> +++ b/arch/arm/boot/dts/qcom/Makefile
> @@ -35,6 +35,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
>  	qcom-msm8926-htc-memul.dtb \
>  	qcom-msm8926-microsoft-superman-lte.dtb \
>  	qcom-msm8926-microsoft-tesla.dtb \
> +	qcom-msm8926-motorola-peregrine.dtb \
>  	qcom-msm8960-cdp.dtb \
>  	qcom-msm8960-samsung-expressatt.dtb \
>  	qcom-msm8974-lge-nexus5-hammerhead.dtb \
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts
> new file mode 100644
> index 000000000000..3c5256120502
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts
> @@ -0,0 +1,297 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +
> +/dts-v1/;
> +
> +#include "qcom-msm8226.dtsi"
> +#include "pm8226.dtsi"
> +
> +/delete-node/ &smem_region;
> +
> +/ {
> +	model = "Motorola Moto G 4G";
> +	compatible = "motorola,peregrine", "qcom,msm8926", "qcom,msm8226";
> +	chassis-type = "handset";
> +
> +	aliases {
> +		mmc0 = &sdhc_1; /* SDC1 eMMC slot */
> +		mmc1 = &sdhc_2; /* SDC2 SD card slot */
> +	};
> +
> +	chosen {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		framebuffer0: framebuffer@3200000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0x03200000 0x800000>;
> +			width = <720>;
> +			height = <1280>;
> +			stride = <(720 * 3)>;
> +			format = "r8g8b8";
> +		};
> +	};
> +
> +	gpio-hall-sensor {
> +		compatible = "gpio-keys";
> +
> +		label = "GPIO Hall Effect Sensor";
> +
> +		event-hall-sensor {
> +			label = "Hall Effect Sensor";
> +			gpios = <&tlmm 51 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <EV_SW>;
> +			linux,code = <SW_LID>;
> +			linux,can-disable;
> +		};
> +	};
> +
> +	gpio-keys {

No need to have two nodes for gpio-keys. Combine them.

> +		compatible = "gpio-keys";
> +
> +		key-volume-up {
> +			label = "Volume Up";



Best regards,
Krzysztof


