Return-Path: <linux-arm-msm+bounces-38035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0438C9CE5F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 15:58:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D1361F21188
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 14:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F571D4340;
	Fri, 15 Nov 2024 14:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vvGrN30H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4531CEEAA
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 14:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731682723; cv=none; b=Sq/DuwgrP3igOQQOuQtwUBkw5un43tH9jvUR2yeINxL8NvfLnEpCxfG7DoA+EZuMYrijh1v56tSWE1DFhw1VpLxjKFDV8TxLYeGPs9nHVcQGaqpOgRNn2V6hUX2XL6CFiFyIbpBWSXZGu8es9QmdfFoo9pApp+Lwokg7hUq2Ijc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731682723; c=relaxed/simple;
	bh=spt7Qe97TCcqDkL80p7AIpZTu1KB534Gmt5F7jiy+nU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APiqErOevn1qZ8WCJv8WMMSDr2n1ez8DTNeDDxXvVw5CTZf/Xoe0aebGM57FwfYBozYjzdDtL/uJE5RtpmWGVa3jXpRP+C8Xjr/ceGVp9v+t4bF7dmaYj5+5rwcP/e+m0SHwqWhgcKxFCxFn4JjbUTS09p1lT1AFtaeiHQmLn1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vvGrN30H; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53d9ff8ef3aso2095488e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 06:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731682719; x=1732287519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8/yPbX6d8qnwsQSq0idPhwK61jM6DG729KCLrzeQHZE=;
        b=vvGrN30Hu+rSpLquQO0a0Lg+82xdWfDvPdVBbJieqKvfIx0+kFQ5qE2mq48NXGgZEn
         hejq4+c0Y49+S+qRwJNVr2UvgwGNzrEsyHphogxm1veFnueBMDb09niQopYOasq0sOI4
         dNxODUiP0CxWOs8uP1wFBZjuSPB1n8ctOvuK25qAiyxpZ3P06ViXErfG2Nm4whH8mPMo
         1bcgqif9egs9tKdofvhukjygEcT62DrsSeowaQgT46RXbq/WTgrvNLBibwUQFhMY1JKz
         +4Wxhhim6A5qQW+2al6ta+goy2L1liS3Q4uT53Zq2X+QFv4m6fGMXuYYdP6PuZZwTxSl
         LgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731682719; x=1732287519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/yPbX6d8qnwsQSq0idPhwK61jM6DG729KCLrzeQHZE=;
        b=a482WqFrcHNX2UQ05PH//DLb4Dm31QstUKfAJ3sgGTxm8vwnDsr3crNHohnmVxbEQj
         gjX8ZtRh38tPedD9+Uz1Rncjy7fs1HMfjC6HVPbhNntLhTGtxc+4/b18nM+hvPTyzxsC
         vq9iiCT5BMAaxj/otaRAn+TOvyZyCHSZk1LfmKzZjtbdhG6z5pOoHbfKZ7UtX0vNqjyA
         NZlPmlxnKnkrWaIVCNWGplrzQfmjQ9qPAzDm5zRSaUVoGtisrqFhbIqfirPf9opTuWmC
         euI12QJzrQTo/sW7qQhEfFawO8WiHYWX/AlT9sy+T63HNcLQX7W6/nXgbhyH2kfBQbuB
         Gd4g==
X-Forwarded-Encrypted: i=1; AJvYcCUxAm3xYPT6W2xmm4vXaj2UsoNoiFrkJA+fYhYtuKnaTICfvXJydaOy2oYJ7Em4NtrvataHac4BhZvNl+k5@vger.kernel.org
X-Gm-Message-State: AOJu0YwRm1nY2FYQRVvJLthipYSjEXY6hs1M5kmKHOIasOUKh8SM+bEa
	lViSCJkzLfUgFqFkZP7ZS3x+RoTDCJ8O4lA3J2RGRiQiS4GtuU438vsnU6bXZv4=
X-Google-Smtp-Source: AGHT+IGM7VYPBGqesim+t7hs9KzzN+BSQYtR3TO4u2eRlYMxp9E+CqEav7rt4qbZuYt0jOh+d9Lvlg==
X-Received: by 2002:a05:6512:2823:b0:535:3ca5:daa with SMTP id 2adb3069b0e04-53dab2919f6mr1745737e87.7.1731682719177;
        Fri, 15 Nov 2024 06:58:39 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da653e32fsm581786e87.201.2024.11.15.06.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 06:58:37 -0800 (PST)
Date: Fri, 15 Nov 2024 16:58:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, 
	=?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Jishnu Prakash <quic_jprakash@quicinc.com>
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: Add pmd8028 and pmih0108 PMICs
Message-ID: <r4slda74u7rpqiybsylrnoqiqo5qm4442rfwzhtjkwkkgqt25g@n5idmspl7sfd>
References: <20241112004936.2810509-1-quic_molvera@quicinc.com>
 <20241112004936.2810509-3-quic_molvera@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112004936.2810509-3-quic_molvera@quicinc.com>

On Mon, Nov 11, 2024 at 04:49:32PM -0800, Melody Olvera wrote:
> From: Jishnu Prakash <quic_jprakash@quicinc.com>
> 
> Add descriptions of pmd8028 and pmih0108 PMICs used on SM8750
> platforms.

Up/lower case?

> 
> Signed-off-by: Jishnu Prakash <quic_jprakash@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/pmd8028.dtsi  | 56 +++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/pmih0108.dtsi | 62 ++++++++++++++++++++++++++

Those two are independent changes. Please use two separate patches.

>  2 files changed, 118 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/pmd8028.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/pmih0108.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmd8028.dtsi b/arch/arm64/boot/dts/qcom/pmd8028.dtsi
> new file mode 100644
> index 000000000000..f8ef8e133854
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pmd8028.dtsi
> @@ -0,0 +1,56 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +/ {
> +	thermal-zones {
> +		pmd8028-thermal {
> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&pmd8028_temp_alarm>;
> +
> +			trips {
> +				pmd8028_trip0: trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				pmd8028_trip1: trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";

"critical" ?

> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&spmi_bus {
> +	pmd8028: pmic@4 {
> +		compatible = "qcom,pmd8028", "qcom,spmi-pmic";
> +		reg = <0x4 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pmd8028_temp_alarm: temp-alarm@a00 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0xa00>;
> +			interrupts = <0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			#thermal-sensor-cells = <0>;
> +		};
> +
> +		pmd8028_gpios: gpio@8800 {
> +			compatible = "qcom,pmd8028-gpio", "qcom,spmi-gpio";
> +			reg = <0x8800>;
> +			gpio-controller;
> +			gpio-ranges = <&pmd8028_gpios 0 0 4>;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/pmih0108.dtsi b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
> new file mode 100644
> index 000000000000..3907d8fbcf78
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +/ {
> +	thermal-zones {
> +		pmih0108-thermal {
> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&pmih0108_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";

"critical" ?

> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&spmi_bus {
> +	pmih0108: pmic@7 {
> +		compatible = "qcom,pmih0108", "qcom,spmi-pmic";
> +		reg = <0x7 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pmih0108_temp_alarm: temp-alarm@a00 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0xa00>;
> +			interrupts = <0x7 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			#thermal-sensor-cells = <0>;
> +		};
> +
> +		pmih0108_gpios: gpio@8800 {
> +			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
> +			reg = <0x8800>;
> +			gpio-controller;
> +			gpio-ranges = <&pmih0108_gpios 0 0 18>;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		pmih0108_eusb2_repeater: phy@fd00 {
> +			compatible = "qcom,pm8550b-eusb2-repeater";
> +			reg = <0xfd00>;
> +			#phy-cells = <0>;
> +		};
> +	};
> +};
> -- 
> 2.46.1
> 

-- 
With best wishes
Dmitry

