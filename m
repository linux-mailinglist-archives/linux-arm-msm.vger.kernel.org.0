Return-Path: <linux-arm-msm+bounces-29285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF4D95B923
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 16:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AAF9B2685B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 14:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85DFC1CC173;
	Thu, 22 Aug 2024 14:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vaq7bSKm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AC21CB329;
	Thu, 22 Aug 2024 14:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724338601; cv=none; b=ZfuTiujoeJ+jmjAlQlaRqP2TfIXThLmKCLq13AIvkIe7LeFYwPkQgL+6igtSG38BZZF72yeGtyTAOmqr3g3DKVoOph7flES78OOBFuNlAm1q7aNaukvaWi0/D/WPo0WaNW+SugFug/ofO9gi048QDhnBQkZ8Q4QBRRyYTKiADKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724338601; c=relaxed/simple;
	bh=87KazmTizy+D2FCRp2hvoGuNOtRKG5QCAnV7hmXvxyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gLCKve21Mcc1FSoPHTxWrKYadMQuPvKh+dS2AvrxbLiWxFh/waQX1GAjFFLUCOYy5PCY/Ji/TtvEMnj07yEhhlseCRYuPQYtHcE4qcAnjmZBKOnZswN1+5rN0TRweO/MJkucQReiHnRcyK6mxpQ+QljHfiWNpVb4R43KJDm8iUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vaq7bSKm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE213C32782;
	Thu, 22 Aug 2024 14:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724338600;
	bh=87KazmTizy+D2FCRp2hvoGuNOtRKG5QCAnV7hmXvxyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vaq7bSKmJavpaAg8Uq1GyXe5lufWVlKPiaiKefuOBgbCYjf0K2WBUEAjVF6iRo4fa
	 PS+vdYEU8kfuBmiFna7kvL+/KWDkL9yBXR87nc5l1b12PUrRziMZPtR5lGEdV96Ue5
	 PRVTjXxvdaPW2yoKftm7/Qpzwd7QIUNaK/jNiuLeWIn1nGsvsMizOrtG2Cawrp49/6
	 nF1SGI1fD6JpqobgV6ZMB/u9vnlM0SHkSd/9PqCZWkEzg1frDTaec9/XgOAMwK50kC
	 v/w4GUfoidW2yM0fUrb5zkAk1ltQqMKeyEpwEG6moAqBMouOVklGu776hEWeFv744I
	 Hu4hUuUTWN4dA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sh9Ey-0000000015Y-3cRZ;
	Thu, 22 Aug 2024 16:56:45 +0200
Date: Thu, 22 Aug 2024 16:56:44 +0200
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sc8280xp-crd: enable wifi
Message-ID: <ZsdRrHK7kCYs7MJF@hovoldconsulting.com>
References: <20240813190639.154983-1-brgl@bgdev.pl>
 <20240813190639.154983-2-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813190639.154983-2-brgl@bgdev.pl>

On Tue, Aug 13, 2024 at 09:06:36PM +0200, Bartosz Golaszewski wrote:
> From: Konrad Dybcio <konradybcio@kernel.org>
> 
> Add nodes for the WCN6855 PMU, the WLAN module and relevant regulators
> and pin functions to enable wifi support on sc8280xp-crd.

What are you guys smoking? The Wi-Fi has been enabled on the CRD since
6.2 and commit d907fe5acbf1 ("arm64: dts: qcom: sc8280xp-crd: enable
WiFi controller").

> Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
> [Bartosz:
>   - write the commit message,
>   - rebase Konrad's commit,
>   - fix one of the supplies' name]
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 112 ++++++++++++++++++++++
>  1 file changed, 112 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> index 6020582b0a59..57efeefbc89e 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> @@ -177,6 +177,17 @@ vreg_misc_3p3: regulator-misc-3p3 {
>  		regulator-always-on;
>  	};
>  
> +	vreg_s10b: regulator-s10b {
> +		compatible = "regulator-fixed";

I don't think this is a fixed regulator.

> +
> +		regulator-name = "VREG_S10B";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
>  	vreg_wlan: regulator-wlan {
>  		compatible = "regulator-fixed";
>  
 
> +&pcie4_port0 {
> +	wifi@0 {
> +		compatible = "pci17cb,1103";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
> +		vddaon-supply = <&vreg_pmu_aon_0p8>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
> +
> +		qcom,ath11k-calibration-variant = "LE_X13S";

This is not the right calibration variant either. In fact, Qualcomm has
not yet released any calibration data for this CRD yet:

	https://bugzilla.kernel.org/show_bug.cgi?id=216036

I use a patch like this locally, but we shouldn't merge this upstream.
 
> +	wlan_en: wlan-en-state {
> +		pins = "gpio134";
> +		function = "gpio";
> +		drive-strength = <8>;

Why increase the drive strength?

> +		bias-pull-down;
> +	};

Johan

