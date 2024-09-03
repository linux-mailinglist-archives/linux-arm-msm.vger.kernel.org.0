Return-Path: <linux-arm-msm+bounces-30464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7773A9694D5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 09:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04F251F249A2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 07:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EFFF2101BC;
	Tue,  3 Sep 2024 07:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HixSsc/5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541271D6DA9;
	Tue,  3 Sep 2024 07:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725347378; cv=none; b=mGfncUzuwDUm0kY/tDEVKdk7fxYqU1ZSDIy7/TPzInIcByobRq2mmmiV1AGnjJUkjqa/2o273e3NFaq6y3pQOfz5OdS1bSSfye2iF0FI19GCCDUclsOYK5jW+ZddZBEuvwT8nSI9cvn1Md9UvYq7yZ6FvtaeKG9/jFdqEx6aUI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725347378; c=relaxed/simple;
	bh=CCHkRuR4zttYm/e6dnZVqhZ28DY1hQ+/eBD7H++fyLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FStQH6DSFsMF39LPtAADtFRUjHIhtokKkdHABFrIzcTGq09o/Hac6XBQhM5+78xXTE+WDRV2igQ/En1B401aVv0G+bxQmlhanmrXP4VCV/jD031ReinF4L66hlf6lQB4T02jlyKS/YWYKEcr30/xImGjgFsvLwe3ZGQ6iRarDj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HixSsc/5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C34A2C4CEC5;
	Tue,  3 Sep 2024 07:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725347377;
	bh=CCHkRuR4zttYm/e6dnZVqhZ28DY1hQ+/eBD7H++fyLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HixSsc/5RszCmF59GVgXkdhV75LwmOcBgaqwAu2T3hPwuUuNtcOWfL1tt4xgYYvKN
	 LwAUyb/U2pG3pQna/r4cdzGT8RfVSiDezqUPND4uo8Ac1L3adyOrRhWzJrgIqauyKX
	 A6kY8gsX0AYN3WEEUfxxPkymnNrz3NkswqY7gQfLU9J9NTGs4xCBzRFCCd8H4Ttfeu
	 7nP6sVdxFV+uI4G+fwRnOGgaO43mbIJC5OvN2ViEw/0LXHl9U/c+4pzwV01b/T4mRi
	 WAkSL05IAvCK7GHuv85u8UO/bJZeXWR55CohX/pdW0Bk/aT8aBVw3IeMSQV9syjTv+
	 MNh9CfBuesdbg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1slNfk-000000000wU-3gP9;
	Tue, 03 Sep 2024 09:09:52 +0200
Date: Tue, 3 Sep 2024 09:09:52 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: Enable external DP
 support
Message-ID: <Zta2QJr6jIJcNdUg@hovoldconsulting.com>
References: <20240902-x1e80100-crd-dts-add-external-dp-support-v1-0-899c264c0eb7@linaro.org>
 <20240902-x1e80100-crd-dts-add-external-dp-support-v1-1-899c264c0eb7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902-x1e80100-crd-dts-add-external-dp-support-v1-1-899c264c0eb7@linaro.org>

On Mon, Sep 02, 2024 at 06:01:35PM +0300, Abel Vesa wrote:
> The Qualcomm Snapdragon X Elite CRD board has 3 USB Type-C ports,
> all of them supporting external DP altmode. Between each QMP
> combo PHY and the corresponding Type-C port, sits one Parade PS8830
> retimer which handles both orientation and SBU muxing. Add nodes for
> each retimer, fix the graphs between connectors and the PHYs accordingly,
> add the voltage regulators needed by each retimer and then enable all
> 3 remaining DPUs.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 414 +++++++++++++++++++++++++++++-
>  1 file changed, 408 insertions(+), 6 deletions(-)

> @@ -288,6 +312,134 @@ vreg_edp_3p3: regulator-edp-3p3 {
>  		regulator-boot-on;
>  	};
>  
> +	vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_RTMR0_1P15";
> +		regulator-min-microvolt = <1150000>;
> +		regulator-max-microvolt = <1150000>;
> +
> +		gpio = <&pm8550ve_8_gpios 8 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&rtmr0_1p15_reg_en>;
> +		pinctrl-names = "default";
> +	};

> +	vreg_rtmr2_3p3: regulator-rtmr2-3p3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_RTMR2_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 187 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&rtmr2_3p3_reg_en>;
> +	};
> +
> +
> +

Double stray newline.

Also move these nodes below the nvme one to maintain sort order.

>  	vreg_nvme: regulator-nvme {
>  		compatible = "regulator-fixed";
>  
> @@ -709,6 +861,163 @@ keyboard@3a {
>  	};
>  };

> +&i2c7 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	typec-mux@8 {
> +		compatible = "parade,ps8830";
> +		reg = <0x8>;
> +
> +		clocks = <&rpmhcc RPMH_RF_CLK4>;
> +		clock-names = "xo";
> +
> +		vdd15-supply = <&vreg_rtmr1_1p15>;
> +		vdd18-supply = <&vreg_rtmr1_1p8>;
> +		vdd33-supply = <&vreg_rtmr1_3p3>;
> +
> +		reset-gpios = <&tlmm 176 GPIO_ACTIVE_HIGH>;
> +
> +		retimer-switch;
> +		orientation-switch;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				retimer_ss1_ss_out: endpoint {
> +					remote-endpoint = <&pmic_glink_ss1_ss_in>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				retimer_ss1_ss_in: endpoint {
> +					remote-endpoint = <&usb_1_ss1_qmpphy_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				retimer_ss1_con_sbu_out: endpoint {
> +					remote-endpoint = <&pmic_glink_ss1_con_sbu_in>;
> +				};
> +			};
> +

Stray newline.

> +		};
> +	};
> +};
 
> +&pm8550_gpios {
> +	rtmr0_3p3_reg_en: rtmr0-3p3-reg-en-state {
> +		pins = "gpio11";
> +		function = "func1";
> +		input-disable;
> +		output-enable;
> +	};
> +};
> +
> +&pm8550ve_8_gpios {
> +	rtmr0_1p15_reg_en: rtmr0-1p15-reg-en-state {
> +		pins = "gpio8";
> +		function = "func1";
> +		input-disable;
> +		output-enable;
> +	};
> +};
> +
> +&pm8550ve_9_gpios {
> +	rtmr0_1p8_reg_en: rtmr0-1p8-reg-en-state {
> +		pins = "gpio8";
> +		function = "func1";
> +		input-disable;
> +		output-enable;
> +	};
> +};

Shouldn't you specify the drive strength here as well? (Same on T14s).

Johan

