Return-Path: <linux-arm-msm+bounces-30737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0C096BFC9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 16:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F6FAB246E8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 14:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C851DA630;
	Wed,  4 Sep 2024 14:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gkAueRqy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CAC1CCEFC;
	Wed,  4 Sep 2024 14:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725459260; cv=none; b=jw2GD01JFfZrb6szUPNa1yfVdcFxZkNnlbolVtRoqI6f2vaG3RQ5xBy0nE3goUbdFcrKse3Q9vbjJk+UafZxsUJ0heQ2hGRbbDTL6lymilPZvccBevZ7sFvonegfZua+E1ykubgEi5Le7g2k5DcXufsqgoKSuiAlW05gCumG/SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725459260; c=relaxed/simple;
	bh=lqqwnBiFir5y8kxoG40XSQZYTH4Hoz7eCP4L1qiQifo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WyWkr4vr+MOM2so6kXKMvJuTwbAZkFSuSwt9BnYfweCCE3rzRL47z6GZTBkNUfS68O8d+vz53afsiAW8cGSMQ8txlPWUiitQ8KTak+Nw5KhqIk09wGs+IZ//YV80q7+AmXF9kCXnBFEaYVky1VjLTrqVb5P76croCxt2X8iNEww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gkAueRqy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11533C4CEC2;
	Wed,  4 Sep 2024 14:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725459259;
	bh=lqqwnBiFir5y8kxoG40XSQZYTH4Hoz7eCP4L1qiQifo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gkAueRqyxW7JqsdNwk6nxv6F2XTpJfgMyIZ9lmcL/ILnruuSnXkMLECIXD94YIaEm
	 hwyT5e0AD86ygJ0isM+5VUUvbvXEom7ZsiMtmM5BobHqhrxpIY//p+twcZxx68ruLF
	 pGidDNRdtnJxQJcL9UZt8VtYTmh0QbOb6a3ejQvMvl1w1yc0HVTt41e5qV9V3TUB5h
	 9TYwWrC84iryAdHlEVi4uh/RUcujyc3DxJKjC74wI3KlG6Pqsv2UiMjAK0atW4SEYi
	 MXg85+MwVtyEThxz//hOmNvOTyHXbgzGT9LQmP8KdiSKuHZY9hwAh/P2NE3V2UIEst
	 4P1vrnHWBh9dA==
Message-ID: <74608385-a3a6-4e59-9c63-6fb9d746d234@kernel.org>
Date: Wed, 4 Sep 2024 16:14:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sc8280xp: Add Microsoft Surface Pro
 9 5G
To: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240903224252.6207-1-jerome.debretagne@gmail.com>
 <20240903224252.6207-5-jerome.debretagne@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240903224252.6207-5-jerome.debretagne@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4.09.2024 12:42 AM, Jérôme de Bretagne wrote:
> Add an initial devicetree for the Microsoft Surface Pro 9 5G, based
> on SC8280XP.
> 
> It enables the support for Wi-Fi, NVMe, the two USB Type-C ports,
> Bluetooth, 5G cellular modem, audio output (via Bluetooth headsets),
> external display via DisplayPort over Type-C (only the bottom USB
> Type-C port is working so far, corresponding to the usb1 / dp1 nodes),
> charging, the Surface Aggregator Module (SAM) to get keyboard and
> touchpad working with the Surface Type Cover accessories.
> 
> Some key features not supported yet:
> - built-in display (but software fallback is working with efifb
>   when blacklisting the msm module)
> - built-in display touchscreen
> - external display with the top USB Type-C port
> - speakers and microphones
> - physical volume up and down keys
> - LID switch detection
> 
> This devicetree is based on the other SC8280XP ones, for the Lenovo
> ThinkPad X13s and the Qualcomm CRD.
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---

[...]

> +
> +	pmic-glink {
> +		compatible = "qcom,sc8280xp-pmic-glink", "qcom,pmic-glink";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_con0_hs: endpoint {
> +						remote-endpoint = <&usb_0_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_con0_ss: endpoint {
> +						remote-endpoint = <&usb_0_qmpphy_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					pmic_glink_con0_sbu: endpoint {
> +						remote-endpoint = <&usb0_sbu_mux>;
> +					};
> +				};
> +			};
> +		};
> +
> +		connector@1 {
> +			compatible = "usb-c-connector";
> +			reg = <1>;
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				port@0 {

Missing newline above

Could you add a comment explaining which port is which (physically)?
See x1e device trees for an example

[...]

> +	usb0-sbu-mux {
> +		compatible = "pericom,pi3usb102", "gpio-sbu-mux";
> +
> +		enable-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
> +		select-gpios = <&tlmm 164 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usb0_sbu_default>;

property-n
property-names

please, all throughout the file

[...]

> +&pcie4_port0 {
> +	wifi@0 {
> +		compatible = "pci17cb,1103";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		qcom,ath11k-calibration-variant = "LE_X13S";

This is most likely not a x13s, please add a new calibration variant

[...]


> +&sound {
> +	compatible = "qcom,sc8280xp-sndcard";
> +	model = "SC8280XP-MICROSOFT-SURFACE-PRO-9-5G";
> +	audio-routing =
> +		"SpkrLeft IN", "WSA_SPK1 OUT",

Drop the newline after =
> +		"SpkrRight IN", "WSA_SPK2 OUT",
> +		"IN1_HPHL", "HPHL_OUT",
> +		"IN2_HPHR", "HPHR_OUT",
> +		"AMIC2", "MIC BIAS2",
> +		"VA DMIC0", "MIC BIAS1",
> +		"VA DMIC1", "MIC BIAS1",
> +		"VA DMIC2", "MIC BIAS3",
> +		"VA DMIC0", "VA MIC BIAS1",
> +		"VA DMIC1", "VA MIC BIAS1",
> +		"VA DMIC2", "VA MIC BIAS3",
> +		"TX SWR_ADC1", "ADC2_OUTPUT";
> +
> +	wcd-playback-dai-link {
> +		link-name = "WCD Playback";
> +		cpu {

Add a newline between the last property and subnodes

[...]

> +
> +&uart18 {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart18_state>;
> +
> +	surface-aggregator {
> +		compatible = "surface,aggregator";

This wasn't tested against the upstream driver (see
Documentation/devicetree/bindings/platform/microsoft,surface-sam.yaml)

[...]

> +
> +&tlmm {
> +	gpio-reserved-ranges = <70 2>, <74 6>, <125 2>, <128 2>, <154 4>;

Please check that all of these entries are necessary (if they
aren't, removing them will break booting)

Konrad

