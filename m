Return-Path: <linux-arm-msm+bounces-30462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8BF969497
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 09:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F1171F23DDF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 07:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26BC61D619F;
	Tue,  3 Sep 2024 07:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NWs85Gwj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA5C1D6186;
	Tue,  3 Sep 2024 07:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725347118; cv=none; b=CE5E5sNiRg2nUzYD9SwZL7fLV9fYihLZYBSGYE/YM6YkgQIHbLSrgDIBtFN8nQQ5jbN67HiBsIhADMQKftrLK4V62/9OwS8rbAoacxkmdWdPlbHA8BesYgR51ZKimTZc4MGiwy0yTZoNFRtYU3sG8VinjBkKygxw/hRP8SrfryY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725347118; c=relaxed/simple;
	bh=g0Cp1fv3EY9RybFOpZ16xUq2zvaYfPTo5AJYXb8Jf9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oK1JDVke/+/dFu6tWCdtT0fU3a3p8R5fJhfLe584oWfV5+pliR2qPln7LpOE4YpmprmkFgNEWVYGJyfvHy6j0PnLtpPpw3J+3umTX49PGqTPYofr4Rtvg4YmtVC2NXPM5kYhShe2l6Kh4tph82ZPoOMthomTxbxYCLNHT4xXlb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NWs85Gwj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94982C4CEC6;
	Tue,  3 Sep 2024 07:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725347117;
	bh=g0Cp1fv3EY9RybFOpZ16xUq2zvaYfPTo5AJYXb8Jf9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NWs85Gwjo39OiZkBv/qSN9J64ksnsFTHSbphoxCcNqJ2RLRYejE0sSjXp5gcWFDDy
	 B5krl2A46VMGdtiF666ZGJ4na7ukMpQLIRp1FpTezW8N9Bhn10lzt5OhkV7O/e+iFr
	 jBe4qGuS5mWrsbowe5e+XLyvsEEnnOLuugAC3Hg1fiihljb/wJmZaEDX/hXLNpYZIW
	 V9pqhlPjBN7OL1b8GlqD0e22aLrGCWszmXXgJIZMLzvr49TfPGOv2Rfd8EL8iH6cF6
	 9dhaVYLTGo8aGLg+wPmwGIU7RdwSgdaXStEhgcFMQjh/nPfAqHEv9gYsCtn0MdG/OA
	 BdsTTQ1/9TyiQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1slNbY-000000000tZ-370a;
	Tue, 03 Sep 2024 09:05:32 +0200
Date: Tue, 3 Sep 2024 09:05:32 +0200
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100-t14s: Add external DP
 support
Message-ID: <Zta1PN-bvOyPYJCs@hovoldconsulting.com>
References: <20240902-x1e80100-crd-dts-add-external-dp-support-v1-0-899c264c0eb7@linaro.org>
 <20240902-x1e80100-crd-dts-add-external-dp-support-v1-2-899c264c0eb7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902-x1e80100-crd-dts-add-external-dp-support-v1-2-899c264c0eb7@linaro.org>

On Mon, Sep 02, 2024 at 06:01:36PM +0300, Abel Vesa wrote:
> The Lenovo Thinkpad T14s has only 2 USB Type-C ports, both of them
> supporting external DP altmode. Between each QMP combo PHY and the
> corresponding Type-C port, sits one Parade PS8830 retimer which handles
> both orientation and SBU muxing. Add nodes for each retimer, fix the
> graphs between connectors and the PHYs accordingly add the voltage
> regulators needed by each retimer and then enable DP 0 and 1.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     | 278 ++++++++++++++++++++-
>  1 file changed, 274 insertions(+), 4 deletions(-)
 			};
> @@ -127,6 +143,90 @@ vreg_edp_3p3: regulator-edp-3p3 {
>  		regulator-boot-on;
>  	};
>  
> +	vreg_rtmr0_1p15: regulator-rtmr0-1p15 {

Please consider spelling out "retimer". It seems it's mostly you that
use "rtmr" in the kernel currently, and not sure saving those three
chars is worth the cost in readability.

But if this is what these rails are called in the (CRD) schematics (I
didn't check), then just ignore this comment.

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

Please keep the nodes sorted by name (by moving the retimer nodes below
the nvme regulator.

>  	vreg_nvme: regulator-nvme {
>  		compatible = "regulator-fixed";
>  
> @@ -484,6 +584,111 @@ keyboard@3a {
>  	};
>  };
>  
> +&i2c3 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	typec-mux@8 {
> +		compatible = "parade,ps8830";
> +		reg = <0x08>;
> +
> +		clocks = <&rpmhcc RPMH_RF_CLK3>;
> +		clock-names = "xo";
> +
> +		vdd15-supply = <&vreg_rtmr0_1p15>;

As Konrad already pointed on the retimer patch, this one should be name
vdd115 or similar.

> +		vdd18-supply = <&vreg_rtmr0_1p8>;
> +		vdd33-supply = <&vreg_rtmr0_3p3>;

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

> +	rtmr1_3p3_reg_en: rtmr1-3p3-reg-en-state {
> +		pins = "gpio186";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +

Stray newline.

>  	wcd_default: wcd-reset-n-active-state {
>  		pins = "gpio191";
>  		function = "gpio";

Johan

