Return-Path: <linux-arm-msm+bounces-102538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDVCBDf012llVAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 20:47:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A168B3CED31
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 20:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8C6413006800
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 18:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 507EA3126B1;
	Thu,  9 Apr 2026 18:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K35JxDfO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D432EC54A;
	Thu,  9 Apr 2026 18:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775760435; cv=none; b=loCVsvJ6VWHtRZ1dY3rly5T0l7OefN3tJfAV66eqjSfKu8H2WCqvbbjgLTfCIko422M6h7/7MiJonow5q9RA1/cHirtmhClOOrhcn9GhVr+KLL9KKH9zKvJnlNYJrVwHXRPsueb6kB+ZVRERhU1jOuF0/mMiXEkuzmiRCaMs/Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775760435; c=relaxed/simple;
	bh=1PcBfpln8hnkL7gfSAcGhDK1XkUt8OcEqry2ZyF2N+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wtk9q6ACaXZakcSP81EpBAUzLifAIjh5N9oGxJanQZZJTvfmNIlglUlQEvO+AUxoz825fnB6j1TD+oZLWMew6jev5g24bU+M3ztUABQ2hFK14fV0YlsK5CEemyD/Vx0rFaIN22Us23SE2a+fD8yoGGqsk0qZ9fYly5WY7GVr5Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K35JxDfO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B510C116C6;
	Thu,  9 Apr 2026 18:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775760434;
	bh=1PcBfpln8hnkL7gfSAcGhDK1XkUt8OcEqry2ZyF2N+0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K35JxDfOYh1XUFxotvzpXIipv6GLfMHNfllOVugqhIH8qt4HB/CXq2UxKSHakq654
	 hUF93Cze7HmAxj23Qx2rOQd8WFr+ONfM1/x1QcQxwyX7HpDpQM3RAvjQ1f66TNoi3q
	 Bw5CqwxLi0Gl06Y3UcqZ9EUiI1Yuyw32kC90BwsWhbfVm0nQFP4sfyK6DMe8yY/TMW
	 mMr5mwCvD9iotOgLFHTKlpfcc3oNa1hQovi5tJcU7lh69AeihNc050G7pb+wBnIFlk
	 fCRCCvgsaHrJVav7K+Rbxtbf8rcV3s+lFbpnX8VtPBiNMx6NhsX9Om9LDK+NWmqnhH
	 zEk38XFh9JHzw==
Message-ID: <e2dbfe26-d1dc-4842-97d6-a22cb8affbe9@kernel.org>
Date: Thu, 9 Apr 2026 19:47:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-microsoft-romulus: enable
 OV02C10 webcam
To: Oliver White <oliverjwhite07@gmail.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <kgIcRmrN-nnKnAZJcqsZcRPp3GQVY-saH_a--KwDezB5APFRIQj7Qm2E6NMkM-6-CevWksG-StyswtMWda66NQ==@protonmail.internalid>
 <20260409083609.75341-1-oliverjwhite07@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20260409083609.75341-1-oliverjwhite07@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102538-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	NEURAL_SPAM(0.00)[0.870];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.36:email];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c09:e001:a7::/64:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.0:email,0.0.0.3:email]
X-Rspamd-Queue-Id: A168B3CED31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09/04/2026 09:36, Oliver White wrote:
> Wire up the front-facing OV02C10 camera on Microsoft Romulus by enabling
> CAMSS, CCI1 and CSIPHY4, adding the sensor node and its endpoint, and
> describing the PM8010 regulator rails and pinctrl states required by the
> camera module.
> 
> With these DT nodes in place the webcam can be probed and used through
> the upstream OV02C10 driver.

Technically its a MIPI CSI2 camera not a webcam...

> Signed-off-by: Oliver White <oliverjwhite07@gmail.com>
> ---
>   .../dts/qcom/x1e80100-microsoft-romulus.dtsi  | 127 ++++++++++++++++++
>   1 file changed, 127 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> index 14b5663a4d48..9e910813fa48 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> @@ -857,6 +857,57 @@ vreg_l3j: ldo3 {
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   	};
> +
> +	regulators-8 {
> +		compatible = "qcom,pm8010-rpmh-regulators";
> +		qcom,pmic-id = "m";
> +
> +		vdd-l1-l2-supply = <&vreg_s5j>;
> +		vdd-l3-l4-supply = <&vreg_s4c>;
> +		vdd-l7-supply = <&vreg_bob1>;
> +
> +		vreg_l1m_1p2: ldo1 {
> +			regulator-name = "vreg_l1m_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1260000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2m_1p2: ldo2 {
> +			regulator-name = "vreg_l2m_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1260000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3m_1p8: ldo3 {
> +			regulator-name = "vreg_l3m_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1900000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4m_1p8: ldo4 {
> +			regulator-name = "vreg_l4m_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1900000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l5m_2p8: ldo5 {
> +			regulator-name = "vreg_l5m_2p8";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <3072000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7m_2p8: ldo7 {
> +			regulator-name = "vreg_l7m_2p8";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <3072000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};

I would recommend breaking this patch into two parts.

One adding the regulators the other adding the camera enablement.

>   };
> 
>   &gpu {
> @@ -867,6 +918,66 @@ &gpu_zap_shader {
>   	firmware-name = "qcom/x1e80100/microsoft/qcdxkmsuc8380.mbn";
>   };
> 
> +&camss {
> +	status = "okay";
> +
> +	ports {
> +		/*
> +		 * port0 => csiphy0
> +		 * port1 => csiphy1
> +		 * port2 => csiphy2
> +		 * port3 => csiphy4
> +		 */
> +		port@3 {
> +			camss_csiphy4_inep0: endpoint@0 {
> +				clock-lanes = <7>;
> +				data-lanes = <0 1>;
> +				remote-endpoint = <&ov02c10_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci1 {
> +	status = "okay";
> +};
> +
> +&cci1_i2c1 {
> +	camera@36 {
> +		compatible = "ovti,ov02c10";
> +		reg = <0x36>;
> +
> +		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cam_rgb_default>;
> +
> +		clocks = <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clock-rates = <19200000>;
> +
> +		orientation = <0>; /* front facing */
> +
> +		avdd-supply = <&vreg_l5m_2p8>;
> +		dvdd-supply = <&vreg_l1m_1p2>;
> +		dovdd-supply = <&vreg_l3m_1p8>;
> +
> +		port {
> +			ov02c10_ep: endpoint {
> +				data-lanes = <1 2>;
> +				link-frequencies = /bits/ 64 <400000000>;
> +				remote-endpoint = <&camss_csiphy4_inep0>;
> +			};
> +		};
> +	};
> +};
> +
> +&csiphy4 {
> +	vdda-0p8-supply = <&vreg_l2c>;
> +	vdda-1p2-supply = <&vreg_l1c>;
> +
> +	status = "okay";
> +};
> +

+1 for using the new style but, you should make clear in your cover 
letter that there is a depends on the style change.

>   &i2c0 {
>   	clock-frequency = <100000>;
> 
> @@ -1441,6 +1552,22 @@ wcn_sw_en: wcn-sw-en-state {
>   		bias-disable;
>   	};
> 
> +	cam_rgb_default: cam-rgb-default-state {
> +		mclk-pins {
> +			pins = "gpio100";
> +			function = "cam_aon";
> +			drive-strength = <16>;
> +			bias-disable;
> +		};
> +
> +		reset-n-pins {
> +			pins = "gpio237";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};
> +
>   	cam_indicator_en: cam-indicator-en-state {
>   		pins = "gpio225";
>   		function = "gpio";
> --
> 2.51.0
> 

Please cc me on V2 as I'd like to give RB for this.

---
bod

