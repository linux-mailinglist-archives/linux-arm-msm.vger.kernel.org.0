Return-Path: <linux-arm-msm+bounces-36589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E439B819A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 18:51:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76E181F22520
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 17:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232531C3F1B;
	Thu, 31 Oct 2024 17:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xY12C7iy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1881C1AD9
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 17:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730397110; cv=none; b=e/0ACprQDzKi90+3mX3xsSpsTB4OdanTexgpR5TUVC8H9e5CGElysBR5Sh54mxDrC/TqGi6xfjy8VpJ0/H0iHJDNlraEXxnjJJnOXuHKlhCXCsOuZlFP4Ils1jkyzK0r723znwMiBH9/PUfgDPhzWsePOPeaRdcxWm253pfbUr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730397110; c=relaxed/simple;
	bh=ptABP0e0Wvw/Wxu6DGoLRdJtE1/VDzmIlCbvifsdmNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VnHMoWcllLOxuvif1RosK7Vncwdp9gRyRBPKHWp1xk5FiNI6wOuUWJXikNqg6AMjvX4mHbcU01pZgIyQQ4je+iyCXckZ7khR2ZCOP1hj6uk9LMvwKvDLo+39Mb+qnaZWkfYsFsSxnS+H9UoBRPEUu7pZzpCtXF6oGiRQExctbr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xY12C7iy; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fabb837ddbso17606661fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 10:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730397105; x=1731001905; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a5aLVrj4WXvI6hFfIdLjXLV7yfXI0anIP6OvfltaNKs=;
        b=xY12C7iykaAfgdOQsqvBcBMR/+cMd/fZRXBnj4CmcOrUh+fedG5BWQoG2liG2NBw0i
         3MuPHIB00D2i0DOGqdlwM2mao9MngKpmf9HlLtts6ioYGJ7+Xu3NKFyXtOibooUD2H3t
         nWcya2ubr8Lmsd6vn4rl6kCMcHKNTIqhj7htnyoMYgQC4Ns8rOl7DzvXSlBH59wmYGuh
         mvu14y9+q2Pt+1Td1vCChoUC2mZTV36LmSnvbBSluE98wEZaU2j5m3OsgbpnhESuiVjf
         EnEtrTvXaQH3sqRoygLo7lmmJ6MeVbFR7OpmvsbJhMlvL4oJKL8tqnmcCXWq3ZRcO5IG
         hH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730397105; x=1731001905;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a5aLVrj4WXvI6hFfIdLjXLV7yfXI0anIP6OvfltaNKs=;
        b=kdCU/RxE5Qk93NpzpAs0t8jOEcZ0P3CPCY6e8M6KjrmWPNbf97v/+FMQmiZjr5icX6
         gbeRT+fyC1mKXcK5o1dA+5VywDUSQFKevv58hwbN+6TEljzSzzv/AcNwOcHaYybmIIO8
         wxSQoDMbpS6rTpLVF+JwIvOysdKPcwhlWuUdKJ1kwyilSiDb6OkVBjGYoN/chSpIJUVX
         CHOIXLUZuiRVK7zidpCaUgC+VGzq/Xv4jULKlmGOFGv0iVzQ6IyrHkcUIX8jmturGV5O
         yt2IO8A4Us2KHsLo0T7afhWxwzOVPgaQntIB7mNNRgeWGwQHKNHon9no5DDWtKNj4Ijo
         UFuw==
X-Forwarded-Encrypted: i=1; AJvYcCU67GTC/PZlorYeS58vbjLEudfaRTKeq0O7CtqsJUb+xM5hlguwxUv6YNB0rTDpI0FQveGdXJ4XVGkbqD+j@vger.kernel.org
X-Gm-Message-State: AOJu0YyIFcZNadZbrNtRuDnEyU5B2Rog+/ncVHnYW6QJJIWzRe/Hmo6W
	3hnE+d6+MYNiAnbwr4K+j2RjFecbaPW/TeNt+d87HGh5NIGJ0y4reBDddbX7g+g=
X-Google-Smtp-Source: AGHT+IFYZPEOV6p06lZ93i4ANb9YYXufF8mZJ+V3JCP434PwIAQE/gzVU9Bib5FDd+kuDnX8fzi+rw==
X-Received: by 2002:a05:651c:506:b0:2fc:9869:2e0b with SMTP id 38308e7fff4ca-2fedb7c7dc2mr8110841fa.20.1730397105416;
        Thu, 31 Oct 2024 10:51:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef5d62acsm2887161fa.33.2024.10.31.10.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 10:51:43 -0700 (PDT)
Date: Thu, 31 Oct 2024 19:51:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>, Amit Kucheria <amitk@kernel.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev, 
	Dang Huynh <danct12@riseup.net>
Subject: Re: [PATCH v2 05/15] arm64: dts: qcom: Add PM8937 PMIC
Message-ID: <vynqe5gqhval4enmnbmamshnu7o5bkpp3fnr7bnyfbgxfm7muc@tn4afxxht7vq>
References: <20241031-msm8917-v2-0-8a075faa89b1@mainlining.org>
 <20241031-msm8917-v2-5-8a075faa89b1@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241031-msm8917-v2-5-8a075faa89b1@mainlining.org>

On Thu, Oct 31, 2024 at 02:19:46AM +0100, Barnabás Czémán wrote:
> From: Dang Huynh <danct12@riseup.net>
> 
> The PM8937 features integrated peripherals like ADC, GPIO controller,
> MPPs, PON keys and others.
> 
> Add the device tree so that any boards with this PMIC can use it.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/pm8937.dtsi | 216 +++++++++++++++++++++++++++++++++++
>  1 file changed, 216 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8937.dtsi b/arch/arm64/boot/dts/qcom/pm8937.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..34e2b4cd0d5f4f92c16bb20f53e4520544a644bc
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pm8937.dtsi
> @@ -0,0 +1,216 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2023, Dang Huynh <danct12@riseup.net>
> + */
> +
> +#include <dt-bindings/iio/qcom,spmi-vadc.h>
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-mpp.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +/ {
> +	thermal-zones {
> +		pm8937-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&pm8937_temp>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <105000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <125000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +
> +				trip2 {
> +					temperature = <145000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&spmi_bus {
> +	pmic@0 {
> +		compatible = "qcom,pm8937", "qcom,spmi-pmic";
> +		reg = <0x0 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pon@800 {
> +			compatible = "qcom,pm8916-pon";
> +			reg = <0x800>;
> +			mode-bootloader = <0x2>;
> +			mode-recovery = <0x1>;
> +
> +			pm8937_pwrkey: pwrkey {
> +				compatible = "qcom,pm8941-pwrkey";
> +				interrupts = <0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
> +				debounce = <15625>;
> +				bias-pull-up;
> +				linux,code = <KEY_POWER>;
> +			};
> +
> +			pm8937_resin: resin {
> +				compatible = "qcom,pm8941-resin";
> +				interrupts = <0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
> +				debounce = <15625>;
> +				bias-pull-up;
> +				status = "disabled";
> +			};
> +		};
> +
> +		pm8937_gpios: gpio@c000 {
> +			compatible = "qcom,pm8937-gpio", "qcom,spmi-gpio";
> +			reg = <0xc000>;
> +			gpio-controller;
> +			gpio-ranges = <&pm8937_gpios 0 0 8>;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		pm8937_mpps: mpps@a000 {
> +			compatible = "qcom,pm8937-mpp", "qcom,spmi-mpp";
> +			reg = <0xa000>;
> +			gpio-controller;
> +			gpio-ranges = <&pm8937_mpps 0 0 4>;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		pm8937_temp: temp-alarm@2400 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0x2400>;
> +			interrupts = <0 0x24 0 IRQ_TYPE_EDGE_RISING>;
> +			io-channels = <&pm8937_vadc VADC_DIE_TEMP>;
> +			io-channel-names = "thermal";
> +			#thermal-sensor-cells = <0>;
> +		};
> +
> +		pm8937_vadc: adc@3100 {
> +			compatible = "qcom,spmi-vadc";
> +			reg = <0x3100>;
> +			interrupts = <0 0x31 0 IRQ_TYPE_EDGE_RISING>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			#io-channel-cells = <1>;
> +
> +			channel@5 {
> +				reg = <VADC_VCOIN>;
> +				qcom,pre-scaling = <1 1>;
> +				label = "vcoin";

Are all the channels available and usable on all the boards?

> +			};
> +
> +			channel@7 {
> +				reg = <VADC_VSYS>;
> +				qcom,pre-scaling = <1 1>;
> +				label = "vph_pwr";
> +			};
> +
> +			channel@8 {
> +				reg = <VADC_DIE_TEMP>;
> +				qcom,pre-scaling = <1 1>;
> +				label = "die_temp";
> +			};
> +
> +			channel@9 {
> +				reg = <VADC_REF_625MV>;
> +				qcom,pre-scaling = <1 1>;
> +				label = "ref_625mv";
> +			};
> +
> +			channel@a {
> +				reg = <VADC_REF_1250MV>;
> +				qcom,pre-scaling = <1 1>;
> +				label = "ref_1250mv";
> +			};
> +
> +			channel@c {
> +				reg = <VADC_SPARE1>;
> +				qcom,pre-scaling = <1 1>;
> +				label = "ref_buf_625mv";
> +			};
> +
> +			channel@e {
> +				reg = <VADC_GND_REF>;
> +				qcom,pre-scaling = <1 1>;
> +				label = "ref_gnd";
> +			};
> +
> +			channel@f {
> +				reg = <VADC_VDD_VADC>;
> +				qcom,pre-scaling = <1 1>;
> +				label = "ref_vdd";
> +			};
> +
> +			channel@11 {
> +				reg = <VADC_P_MUX2_1_1>;
> +				qcom,pre-scaling = <1 1>;
> +				qcom,ratiometric;
> +				qcom,hw-settle-time = <200>;
> +				label = "pa_therm1";
> +			};
> +
> +			channel@13 {
> +				reg = <VADC_P_MUX4_1_1>;
> +				qcom,pre-scaling = <1 1>;
> +				qcom,ratiometric;
> +				qcom,hw-settle-time = <200>;
> +				label = "case_therm";

This one looks particularly board-specific. Please move device-specific
channels to the board.dtsi.

> +			};
> +
> +			channel@32 {
> +				reg = <VADC_LR_MUX3_XO_THERM>;
> +				qcom,pre-scaling = <1 1>;
> +				qcom,ratiometric;
> +				qcom,hw-settle-time = <200>;
> +				label = "xo_therm";
> +			};
> +
> +			channel@36 {
> +				reg = <VADC_LR_MUX7_HW_ID>;
> +				qcom,pre-scaling = <1 1>;
> +				qcom,ratiometric;
> +				qcom,hw-settle-time = <200>;
> +				label = "pa_therm0";
> +			};
> +
> +			channel@3c {
> +				reg = <VADC_LR_MUX3_BUF_XO_THERM>;
> +				qcom,pre-scaling = <1 1>;
> +				qcom,ratiometric;
> +				qcom,hw-settle-time = <200>;
> +				label = "xo_therm_buf";
> +			};
> +		};
> +
> +		rtc@6000 {
> +			compatible = "qcom,pm8941-rtc";
> +			reg = <0x6000>, <0x6100>;
> +			reg-names = "rtc", "alarm";
> +			interrupts = <0x0 0x61 0x1 IRQ_TYPE_EDGE_RISING>;
> +		};
> +	};
> +
> +	pmic@1 {
> +		compatible = "qcom,pm8937", "qcom,spmi-pmic";
> +		reg = <0x1 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pm8937_spmi_regulators: regulators {
> +			compatible = "qcom,pm8937-regulators";
> +		};
> +	};
> +};
> 
> -- 
> 2.47.0
> 

-- 
With best wishes
Dmitry

