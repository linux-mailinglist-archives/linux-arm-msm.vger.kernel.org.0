Return-Path: <linux-arm-msm+bounces-75488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5561BA8827
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 11:03:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FBEB3A55A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 09:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AFB02032D;
	Mon, 29 Sep 2025 09:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dDBoMyhc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A0C1448E3
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 09:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759136595; cv=none; b=aHRoh7s8c1UCz6toos2mgcGDUnELGiH8HA6WcEA/AsJFHdyoqj7bmnoYMT+fenJ0r6XybEk7s3zIeLo1X8KQAwAdGVsMEYMTP1aRdd0JQNKKeUlS0Cw0EUXthYp/ylxAruiihwfpQeUVgBT6PrUypPJGBwL80jRfqBaoJMc5S7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759136595; c=relaxed/simple;
	bh=YDkB1cC1lei3HB7fQRoAVOGBWOAs06N/aEhJ0IeU4eQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=af+mYw673BgpjZnMH7ufJ7GRFa3wsvMXbkzQer6H2Chcii9j9/uR2X0AbGZXe5DetfL+UF8322+/uBVYAZ4/CDasj/rfxDSvY2P+JdPM21Nl36wEIMPryrCnzR4BBvv/hzSCkVjagkwsVq1NtuSU3eosKT0LCaAaPlM9BIZ6az0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dDBoMyhc; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5848a2b3c8aso532542e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 02:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759136590; x=1759741390; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQ1kR/YUyZ1nKY+v1ygHX/aXlVuO3SwbSwJRstRbb9s=;
        b=dDBoMyhc87yvAJOHgaElDJMprkqDNtYY8fXo7lOlADdonOZ/cJYXHdOcxQ9rQueuBR
         LERpIoy2kOXv+/KEbIpKqeKu4wq95AGTEyiEwXZHtnI8HMTLzF6sj6Blh35h+Hvgefoq
         sRYzZtXijZjKxrJR9T2PYGrsGZbPNBNnHMzGHfZwRHZOXi02I0yV3VWAiIeWjMJ2ncvh
         XiuUscm1Ea/CkRtqt7sBf4rVE+9G2kcqO8Fes2EZW0At0HqeddhTqIWWjS+xb31wKSwg
         7c3FTEqrVe4FnFJPctZJJTaHeTjtS/eWyZgWAjxas/nJToi0p3Yyefp0kHabOB2VJVrw
         Z5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759136590; x=1759741390;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SQ1kR/YUyZ1nKY+v1ygHX/aXlVuO3SwbSwJRstRbb9s=;
        b=HJ5pGemZsngpqMhE/dvOQe3CDl8xeZ1aZEy8CUFk4yQfSnpCY4381GwTffBywR5NMW
         t9bu7bAxIcI+mgh2V2F33HLa57INaccgAK1pdDFvM+Eup3blOxWUlvbt9EbSHNFexOj9
         jC3eyEuxP+rubKz9yvxSfQok5iGpaRLfz1wRAZpexqRTQ5epDWcy4mC1Ey2bgBX90955
         bmxIwBee/SZjMQrgMCMfAAhqZJicgW8fQHYBo1W3r+WKyMNDX5scZcsbHykw17YvH6Q1
         Q9jFq2NHDX90GbDt1RhVDK0oW//HjryzuXF07VgqSuoVccwQmjJUnDvFAPgno+3RI/Vm
         vmhg==
X-Gm-Message-State: AOJu0Ywb2n+u35x8IEmY+i3hnaw4aUHVwSHXi17WIXm1M4kVcDaJ46uv
	5HAi0JRVfjjAEBmM/GgugiI+63Z1mdTYiSUWD5W0eioHxX6q4BwgcHqFWb6C9gYQ03M=
X-Gm-Gg: ASbGnct3hgxXgdCDKEIxJ9fhPmj2Nmf76wqNsXBf6/WCJx95SeqlXJxHhuHG4uimKrr
	YLuF9Uuo2mAD4bKo5rlX1ObSPexca/gwJsDHX5sj8+MATblPT/r0ZVmhqGxfzG49pDYOSgBDc0L
	TJ6vy2ZmvHupo6udQXa2maTObN3RTZG8AXpw4/+oixJGM3IIiSB/StAaou87KW0ImsT1oRjzTVp
	eqyHli9pgI2JJ7AGHvfXETbpjIZdaQzNTyzqD/qeT9/eKEEJnDogo42aYnnSBcPrl0avjXeKAae
	NQSrQoSp5KIZwMlxpPQWAqfL+xKjLCkX1s3q/5LKDlCkO1GgBOZTDCOpCg8ZmT6YEdKQJPN6WZr
	I1CyX/N0NYWWdcp05Aot5fj+1MQrHp2Zr8lsuHW0oUE+Lr2XUCBur3ag0iph5HmkWM6/PwjXGj+
	XY5w==
X-Google-Smtp-Source: AGHT+IFxskxasAcUCzpw5FlswrTo8wIg2CVztTjf3s5U11u0jYRFd9ekebyNAAIZnj0TT5QUNQxd4w==
X-Received: by 2002:a19:5212:0:b0:584:2ad8:7cd1 with SMTP id 2adb3069b0e04-5842ad87ee4mr1305280e87.3.1759136590100;
        Mon, 29 Sep 2025 02:03:10 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316ff552esm4006185e87.127.2025.09.29.02.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 02:03:09 -0700 (PDT)
Message-ID: <d6530142-469e-4859-ac71-fd4af82ed4be@linaro.org>
Date: Mon, 29 Sep 2025 12:03:08 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qrb2210-rb1: Add overlay for
 vision mezzanine
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
 konradybcio@kernel.org, dave.stevenson@raspberrypi.com,
 sakari.ailus@linux.intel.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, mchehab@kernel.org, conor+dt@kernel.org,
 robh@kernel.org
References: <20250926073421.17408-1-loic.poulain@oss.qualcomm.com>
 <20250926073421.17408-4-loic.poulain@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250926073421.17408-4-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/26/25 10:34, Loic Poulain wrote:
> This initial version includes support for OV9282 camera sensor.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile             |  5 ++
>   .../qcom/qrb2210-rb1-vision-mezzanine.dtso    | 76 +++++++++++++++++++
>   2 files changed, 81 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index d7f22476d510..bee021efc249 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -138,6 +138,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
> +
> +qrb2210-rb1-vision-mezzanine-dtbs	:= qrb2210-rb1.dtb qrb2210-rb1-vision-mezzanine.dtbo
> +
> +dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1-vision-mezzanine.dtb
> +
>   dtb-$(CONFIG_ARCH_QCOM)	+= qrb4210-rb2.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5.dtb
>   
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso
> new file mode 100644
> index 000000000000..3b6261131b75
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso
> @@ -0,0 +1,76 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.

Year is missing, please set it.

> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/qcom,gcc-qcm2290.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&tlmm {
> +	cam0a_default: cam0a-default-state {
> +		pins = "gpio28";
> +		function = "cam_mclk";
> +		drive-strength = <16>;
> +		bias-disable;
> +	};
> +};

This is a generic non-changeable MCLK3 pin configuration, which is
specific to the SoC. Like in a number of other cases please consider
to define this and other MCLKx pin configurations in the SoC .dtsi file.

> +
> +&pm8008 {
> +	status = "okay";
> +};
> +
> +&camss {
> +	status = "okay";
> +
> +	vdd-csiphy-1p2-supply = <&pm4125_l5>;
> +	vdd-csiphy-1p8-supply = <&pm4125_l13>;
> +
> +	ports {
> +		port@0 {
> +			csiphy0_ep: endpoint {
> +				data-lanes = <0 1>;
> +				remote-endpoint = <&ov9282_ep>;
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
> +	/* Vision Mezzanine DIP3-1 must be ON (Selects camera CAM0A&B) */
> +	camera@60 {
> +		compatible = "ovti,ov9282";
> +		reg = <0x60>;
> +
> +		/* Note: Reset is active-low but ov9282 driver logic is inverted... */
> +		reset-gpios = <&tlmm 18 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 = <&cam0a_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&gcc GCC_CAMSS_MCLK3_CLK>;
> +		assigned-clocks = <&gcc GCC_CAMSS_MCLK3_CLK>;
> +		assigned-clock-rates = <24000000>;
> +

It makes little sense to split properties with blank lines.

> +		avdd-supply = <&vreg_l3p>;
> +		dvdd-supply = <&vreg_l1p>;
> +		dovdd-supply = <&vreg_l7p>;
> +
> +		port {
> +			ov9282_ep: endpoint {
> +				link-frequencies = /bits/ 64 <400000000>;
> +				data-lanes = <1 2>;
> +				remote-endpoint = <&csiphy0_ep>;

It's quite strange to see CSI0 and MCLK3 in the same boat, but the
schematics says so.

> +                        };
> +                };
> +	};
> +};

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

