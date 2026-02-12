Return-Path: <linux-arm-msm+bounces-92699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMYAD2rUjWlA7wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 14:23:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C836D12DC6F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 14:23:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3B4BC3012B41
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 13:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0196435B628;
	Thu, 12 Feb 2026 13:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CgoLPsbK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26722EBB8C;
	Thu, 12 Feb 2026 13:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770902629; cv=none; b=Z/fvj6U1QXM5o1g66yIECSEAGkRWStossG+S4O+Mm9JNkGJ4FCzXzHryl+WAHfaI2+M9WBEOVbibrGHcVUbPiAZTQVOy8xOoOEdBDUwd04yTYGOCRsKEkvmLKNYbfowh3zn8lYguvtexGR0M+m0sT0MrF5BnYwirXPSf1pz+e5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770902629; c=relaxed/simple;
	bh=gl5/5t8D7zsH/gb57zvV4bpj+WBiVW8OChyYJxqemMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=asumgXfiLRit6TDXiwJzXfOS+UcjSyer90duz0L6lfTr52Pv27X6vNVjHnwavRRdIan4Fhyse78YGQzSB+m5pCU/328hoeiJtlj71jEJctwdVoIP7wpEcZ1j3vC6MOnbPXh7/j/5a9M0uEoiI44DRxpBMbTS3yORD0IMQgsTIis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CgoLPsbK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF25C4CEF7;
	Thu, 12 Feb 2026 13:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770902629;
	bh=gl5/5t8D7zsH/gb57zvV4bpj+WBiVW8OChyYJxqemMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CgoLPsbKSVgI9IxSMcANWUUrspIHuOz7CVHQaIV5wNluytEj8ONEcSFBx17VqSJQv
	 8GkommHU6iWYiCzlIRWaBI3AL+Y9lSrz6NTZOuoYPt9Unmw+4l6GhcjDnNZL0ltnFt
	 11OhYUHRVcCS5tRu1gm92Al2UvqfQQ6iAkb3IARFYW05SiSPDQP52p3W9Apz3Vt1EL
	 NVPufKGEX6VxxDcZFOvsGiZGTbRvVRTicWJcD3voUAT6U7EHhGjbdhvkr9kSIPsIFV
	 Dq8+XoPOgoT+Sj3ZWCwWEtAeqWvAX5sVUQ8hwYL+Bif7qgDbfmZjSbg4esUtKngCSb
	 9NIXWEABS45Jw==
Date: Thu, 12 Feb 2026 07:23:46 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: lemans-evk: Enable the tertiary
 USB controller
Message-ID: <wjvmr4qiamg6pqntca74mopv77a7mweiwqy5lgt2ihrsn7mcae@xmcowa5nwzhp>
References: <20260210125348.2800846-1-swati.agarwal@oss.qualcomm.com>
 <20260210125348.2800846-3-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210125348.2800846-3-swati.agarwal@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92699-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: C836D12DC6F
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 06:23:48PM +0530, Swati Agarwal wrote:
> Enable the tertiary usb controller connected to micro usb port in OTG mode
> on Lemans EVK platform.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 52 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/lemans.dtsi    |  7 ++++
>  2 files changed, 59 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> index 265bdad10ae4..6f8b0d067256 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> @@ -107,6 +107,25 @@ usb1_ss_in: endpoint {
>  		};
>  	};
>  
> +	connector-2 {
> +		compatible = "gpio-usb-b-connector", "usb-b-connector";
> +		label = "micro-USB";
> +		type = "micro";
> +
> +		id-gpios = <&pmm8654au_2_gpios 11 GPIO_ACTIVE_HIGH>;
> +		vbus-gpios = <&expander3 3 GPIO_ACTIVE_HIGH>;
> +		vbus-supply = <&vbus_supply_regulator_2>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usb2_id>;
> +
> +		port {
> +			usb2_con_hs_ep: endpoint {
> +				remote-endpoint = <&usb_2_dwc3_hs>;
> +			};
> +		};
> +	};
> +
>  	edp0-connector {
>  		compatible = "dp-connector";
>  		label = "EDP0";
> @@ -190,6 +209,15 @@ vbus_supply_regulator_1: regulator-vbus-supply-1 {
>  		enable-active-high;
>  	};
>  
> +	vbus_supply_regulator_2: vbus-supply-regulator-2 {

Please follow
https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-nodes
point 2. "Nodes without unit addresses shall be ordered
alpha-numerically by the node name."

You have regulator-vbus- above and regulator-vmmc- below, so this seems
to be the right place.

> +		compatible = "regulator-fixed";
> +		regulator-name = "vbus_supply_2";

Please confirm that this really is what this supply is named in the
schematics.

> +		gpio = <&pmm8654au_1_gpios 9 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		enable-active-high;
> +	};
> +
>  	vmmc_sdc: regulator-vmmc-sdc {
>  		compatible = "regulator-fixed";
>  
> @@ -809,6 +837,14 @@ usb1_intr: usb1-intr-state {
>  		bias-pull-up;
>  		power-source = <0>;
>  	};
> +
> +	usb2_id: usb2-id-state {
> +		pins = "gpio11";
> +		function = "normal";
> +		input-enable;
> +		bias-pull-up;
> +		power-source = <0>;
> +	};
>  };
>  
>  &qup_i2c19_default {
> @@ -1174,6 +1210,22 @@ &usb_1_qmpphy {
>  	status = "okay";
>  };
>  
> +&usb_2 {
> +	status = "okay";
> +};
> +
> +&usb_2_dwc3_hs {
> +	remote-endpoint = <&usb2_con_hs_ep>;
> +};
> +
> +&usb_2_hsphy {
> +	vdda-pll-supply = <&vreg_l7a>;
> +	vdda18-supply = <&vreg_l6c>;
> +	vdda33-supply = <&vreg_l9a>;
> +
> +	status = "okay";
> +};
> +
>  &xo_board_clk {
>  	clock-frequency = <38400000>;
>  };
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 808827b83553..d0e63336be6b 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -4270,7 +4270,14 @@ usb_2: usb@a400000 {
>  			snps,dis-u1-entry-quirk;
>  			snps,dis-u2-entry-quirk;
>  
> +			usb-role-switch;

This changes the behavior of two other boards, not only the EVK. So
please keep this in a separate commit.

Regards,
Bjorn

> +
>  			status = "disabled";
> +
> +			port {
> +				usb_2_dwc3_hs: endpoint {
> +				};
> +			};
>  		};
>  
>  		tcsr_mutex: hwlock@1f40000 {
> -- 
> 2.34.1
> 

