Return-Path: <linux-arm-msm+bounces-43664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D769FE7D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 16:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC0E03A1286
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 15:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 733AD1ACEA5;
	Mon, 30 Dec 2024 15:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DF+mFRZ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDC92594B6
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 15:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735573546; cv=none; b=nfG3hrmzzir30yCCOesQu/UwOKWq3mWnGbmfRCOTgcCjOyvm4QINzvfcyuKC0gsniS4Se0bch32JfWYD3eAJL7eWgeaBpOlMXMphUjXiSIxWnkFX3wNVLsFDoDyKTHfDIGuWncYjTSxDre2lkLwmLTiSfVPNGdGS1qQRPxJXXN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735573546; c=relaxed/simple;
	bh=d9w1ByfuwvwTgp6c4V+YvOUl6gKXyOhZSiqaZpjEPCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fu3v1xIeW2jnfyE0EDS2AC5dUhIZ0PpFK0jKtPYi2yD2CQ632t6j/2JiO4fAFJ6riV4LDMbNfdY0xMNGEYe//+OQ//LQVZyj170+QB7vONZquHfP9VfEt7yZU0mNYymmwLQxcPxCos2mxFj9obwqmkxttiF95Dq4Q1hYC5BSuYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DF+mFRZ8; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3022c61557cso130597141fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 07:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735573541; x=1736178341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jyn8Jb6pVgtm3xpliZM0SKkmFJiJaoSCcTjod9fYJYI=;
        b=DF+mFRZ8aH1PX8n1r/KTvR4sOHH5ILo9f37L6M3gwD69xuVUyYjlwZkxt7lqvDT67+
         fuuUHF/jaXmupzDx4XIMSYivPuMj+izI0zPQsfNiUW26MtySt2yn+7wZpf59u157DgAZ
         3M0bMlZqLy8LHjY1iyYb1+hBmoHrgfYGDqw7dNs/mmVmAbar/3XYn+IMu8Yl7BcJ3p79
         EOXji3WaVS4SZH7kCxpcVbjZD70rFcr397MszSeOkSsHoao4ZfGw1QO1eJp7yIguKGbg
         hh9gvLziZnD7vyP78RieSW63ozC6NqDXPYf7b66SqdWpIsDN/cqscbd0Bu+ykz7fIVjB
         rPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735573541; x=1736178341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jyn8Jb6pVgtm3xpliZM0SKkmFJiJaoSCcTjod9fYJYI=;
        b=xBihG+ksDfcodd8bgedbpMjeLNWKvoLLpogXVl5I1kX8zaR1ICfGJlG4IAQ2wVm7uK
         JmFwK6z+F8jTNW2rO7fTPnCQC+5mnVUmlmng/pQkyfVJa5awaK06x++HmB33VTm6Cixn
         v/wNS/amMVNBS0UihAVoyGjqmej69IZ2HOSEiriRfS+PEDcQmCuIEKDmoN7A7WVgMbWy
         gXlKzluyIahlSgJoI6HUybqmY26oqTAbEUFZEcAJPYTuB3IpgJvVkVout5xZWHxci9Kd
         f9NymN9nSAyeFpsAbrA3cjxm3QoJNqDC0MtSU1F0e61tmNcpChvvwEoJGc26RNhi+Bcv
         KOmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6eINSNb/aL24puvwp5OLUVGy3dNCoAJmRHS/M6IXCzkYv3bOOFldmIV/xzVWVm+Wa3aKYsAYGsmrrpsiH@vger.kernel.org
X-Gm-Message-State: AOJu0YxSWjWuRllMPTOOl903NdWyJBnuecItLT088jhYOpTL02Lr09Go
	qoBoXRCCsGQVgZBsvm5CyVhMzra4Z5EIeNtuZXmR2CoekwYgtXCvC4IjI4h7SF8=
X-Gm-Gg: ASbGncuUMWfyLQMSqJvsw9PneK7utVObaosh3RqdBmxdLVRhTWQSdsxmqi8QyrkbHwu
	ZohAXbyR2UYRjq3dizmGXuvtWOgwwZSGdO1HdK9JPTnB/BwgJ9WuaaY0T38Oshn7vswmhMh0EyP
	vksm9JQQ8Hnu62eHCbyiWWFbZD6IFpU1R5s2fpcJaACpoTfHsPQ9nByGjMVZlH2gWvQOa+49OPR
	iqgECFrgXuVO7YHKxWfdWJ+jbrvyZFiw0yHirOIekD9AGfwv9vRM2qB2jCGKAACL6h4oO4TGldf
	FJEDWDqUUCLHZiBrHHe5bgA/9PVIysn0lQav
X-Google-Smtp-Source: AGHT+IG9MrS2hI8ccmEUsAyqMBeyORqO90FmSns7PKapdc9rr/Ek0Nw0jZgLJi+lu1iaLmCuZxksyA==
X-Received: by 2002:a2e:be06:0:b0:302:16da:a052 with SMTP id 38308e7fff4ca-3046860d39dmr104324791fa.27.1735573541266;
        Mon, 30 Dec 2024 07:45:41 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b06a47fsm36659931fa.86.2024.12.30.07.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 07:45:40 -0800 (PST)
Date: Mon, 30 Dec 2024 17:45:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@quicinc.com
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: Add support for QCS9075 Ride &
 Ride-r3
Message-ID: <tjrg5zqggupjo36udpyv3vynsij76f4qlus6lkbqotuimusqgq@hosmksp77sif>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-6-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241229152332.3068172-6-quic_wasimn@quicinc.com>

On Sun, Dec 29, 2024 at 08:53:31PM +0530, Wasim Nazir wrote:
> Add device tree support for QCS9075 Ride & Ride-r3 boards.
> 
> QCS9075 lacks the safety monitoring features of Safety-Island (SAIL)
> subsystem which is available in QCS9100, and it affects thermal
> management.
> 
> Also, between ride and ride-r3 ethernet phy is different.
> Ride uses 1G ethernet phy while ride-r3 uses 2.5G ethernet phy.

Your board files duplicate sa8775p-ride-r3.dts and sa8775p-ride.dts, but
include them. Existing qcs9100-ride-r3.dts and qcs9100-ride-r3.dts just
include corresponding SA8775P files.

This is not ideal for the following reasons:
- The approach is not uniform (between QCS9100 and QCS9075), which might
  lead to mistakes.
- The approach ends up duplicating DT code unnecessarily, which can lead
  to issues being patches in the one board file, but not in the other
  file.

If there are any reasons why you want to follow this approach, they must
be a part of the commit message.

> 
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile            |  2 +
>  arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts | 46 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qcs9075-ride.dts    | 46 ++++++++++++++++++++
>  3 files changed, 94 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 78613a1bd34a..41cb2bbd3472 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -118,6 +118,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-rb8.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-ride.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-ride-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> new file mode 100644
> index 000000000000..d9a8956d3a76
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +/dts-v1/;
> +
> +#include "sa8775p-ride.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. QCS9075 Ride Rev3";
> +	compatible = "qcom,qcs9075-ride-r3", "qcom,qcs9075", "qcom,sa8775p";
> +};
> +
> +&ethernet0 {
> +	phy-mode = "2500base-x";
> +};
> +
> +&ethernet1 {
> +	phy-mode = "2500base-x";
> +};
> +
> +&mdio {
> +	compatible = "snps,dwmac-mdio";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	sgmii_phy0: phy@8 {
> +		compatible = "ethernet-phy-id31c3.1c33";
> +		reg = <0x8>;
> +		device_type = "ethernet-phy";
> +		interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
> +		reset-assert-us = <11000>;
> +		reset-deassert-us = <70000>;
> +	};
> +
> +	sgmii_phy1: phy@0 {
> +		compatible = "ethernet-phy-id31c3.1c33";
> +		reg = <0x0>;
> +		device_type = "ethernet-phy";
> +		interrupts-extended = <&tlmm 26 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
> +		reset-assert-us = <11000>;
> +		reset-deassert-us = <70000>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> new file mode 100644
> index 000000000000..3b524359a72d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +/dts-v1/;
> +
> +#include "sa8775p-ride.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. QCS9075 Ride";
> +	compatible = "qcom,qcs9075-ride", "qcom,qcs9075", "qcom,sa8775p";
> +};
> +
> +&ethernet0 {
> +	phy-mode = "sgmii";
> +};
> +
> +&ethernet1 {
> +	phy-mode = "sgmii";
> +};
> +
> +&mdio {
> +	compatible = "snps,dwmac-mdio";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	sgmii_phy0: phy@8 {
> +		compatible = "ethernet-phy-id0141.0dd4";
> +		reg = <0x8>;
> +		device_type = "ethernet-phy";
> +		interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
> +		reset-assert-us = <11000>;
> +		reset-deassert-us = <70000>;
> +	};
> +
> +	sgmii_phy1: phy@a {
> +		compatible = "ethernet-phy-id0141.0dd4";
> +		reg = <0xa>;
> +		device_type = "ethernet-phy";
> +		interrupts-extended = <&tlmm 26 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
> +		reset-assert-us = <11000>;
> +		reset-deassert-us = <70000>;
> +	};
> +};
> --
> 2.47.0
> 

-- 
With best wishes
Dmitry

