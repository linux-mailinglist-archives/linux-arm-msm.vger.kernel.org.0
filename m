Return-Path: <linux-arm-msm+bounces-117988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +ReZDCudT2pUlAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:07:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2A473165F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:07:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cWeCNFvZ;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117988-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117988-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E360E30434E0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 13:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC8A25B09F;
	Thu,  9 Jul 2026 13:06:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FF225A354;
	Thu,  9 Jul 2026 13:06:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602416; cv=none; b=u4yvYj8wect81MBdPLZjj1wXgn3t4mljUYbtMFs6d0At1l63FhfD74fNnNcCRS/XocvCjmz6hrBKZCBEVUTBPUofwn3F0vVbGjQ0uuUlv22TGR2lwRFi5tn0T5xVY/0Ec+96O752pK5wC3Ek8nLkrmXIypn2p45vFdCAr0AUkdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602416; c=relaxed/simple;
	bh=Dof8XhwYjSFqmcMhLA8ka9FKc3kOtS19iaB0epMgNho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cb2aH3hBL0ftbSEocvbToCwdWA9WyQNbQ1vUnTVecCVoeAEswuRhiG8BFm2yyu/uRuAhUNTMX+kGSRIGIRzrUzDM9NjBey7J/7SEwRbtufk2+I4UjPZDDtxFtcIZE8KBh/g2jbFnabxQ/WUM4Xi6FY2oFsCsGGYh7FA+Ql1IQYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cWeCNFvZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B0C1F000E9;
	Thu,  9 Jul 2026 13:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783602415;
	bh=z6JSKq8c4C6JVKQqJp+bC2Msv4Dnv7XkGJWu/rV3OJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cWeCNFvZP8OeaOr/gLHsGq+E2lqITQPDNpDs1bNwIYjG4aDA9rYKqC6z2epF5raR8
	 NyfsU5i8wq93jg4Un+Pxr3FbT0Oa6DZ9TV4gEd+nBu0XSkRSjF9XU4PoAJtMOQvRVY
	 buB6Oi5P9BMpAAqGSzFEQZPLnlEhCgryYFAemmnlbWbsKUhPJOHO36AIZGMbLU1Si8
	 LEqK360T9wT59rSOym0aCgfeFBapZ2cj53Rz0F5uEJptvBH/PdYSbLnJbm5SXx5g+f
	 7+dHE8yy96KiRVExaBq4xnUO7G59yye5D4b20VSIrTyZLDD2l4etFrGrw97xlE78VZ
	 joM/OyxPNqyrw==
Date: Thu, 9 Jul 2026 15:06:39 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: eliza-evk: Add PCIe0 with M.2 E
 key connector
Message-ID: <ze7dfikl7kzz3ovenrpjw62obimwgxwwvlycwoebgx4ify3e46@dnvp4olbatbh>
References: <20260708-eliza_evk-v2-0-c599246ceba1@oss.qualcomm.com>
 <20260708-eliza_evk-v2-1-c599246ceba1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260708-eliza_evk-v2-1-c599246ceba1@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:krishna.chundru@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117988-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD2A473165F

On Wed, Jul 08, 2026 at 11:47:16AM +0530, Krishna Chaitanya Chundru wrote:
> The Eliza EVK board features an M.2 E key connector connected to PCIe0.
> Enable the PCIe0 root port and its QMP PHY with the necessary RPMH
> regulator supplies. The M.2 slot's 3.3V supply rail is GPIO-controlled
> via a TCA9538 I/O expander on I2C4.
> 
> The M.2 E key slot hosts a WLAN card connected over PCIe and a Bluetooth
> device connected over UART. Model the connector using the
> pcie-m2-e-connector binding, wiring the PCIe root port and UART5 for
> the respective interfaces.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 116 ++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/eliza.dtsi     |   1 +
>  2 files changed, 117 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
> index e47b24f8b827..6d76715ccffb 100644
> --- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
> @@ -11,6 +11,92 @@ aliases {
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> +
> +	vreg_pcie_m_3p3: regulator-3p3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg_3p3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&gpio_expander1 6 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	connector-0 {
> +		compatible = "pcie-m2-e-connector";
> +		vpcie3v3-supply = <&vreg_pcie_m_3p3>;
> +		w-disable1-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
> +		w-disable2-gpios = <&pm8550vs_g_gpios 4 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 = <&m2_w_disable1>, <&m2_w_disable2>;
> +		pinctrl-names = "default";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				m2_e_pcie_ep: endpoint@0 {
> +					reg = <0>;
> +					remote-endpoint = <&pcieport0_ep>;
> +				};
> +			};
> +
> +			port@3 {
> +				reg = <3>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				m2_e_uart_ep: endpoint@0 {
> +					reg = <0>;
> +					remote-endpoint = <&uart5_ep>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&i2c4 {
> +	pinctrl-0 = <&qup_i2c4_data_clk>;
> +	pinctrl-names = "default";
> +
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	gpio_expander1: gpio@3c {
> +		compatible = "ti,tca9538";
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		reg = <0x3c>;
> +	};
> +};
> +
> +&pcie0 {
> +	status = "okay";
> +};
> +
> +&pcie0_phy {
> +	vdda-phy-supply = <&vreg_l1k>;
> +	vdda-pll-supply = <&vreg_l3k>;
> +
> +	status = "okay";
> +};
> +
> +&pcie0port0 {
> +	wake-gpios = <&tlmm 114 GPIO_ACTIVE_LOW>;
> +	reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
> +
> +	port {
> +		pcieport0_ep: endpoint {
> +			remote-endpoint = <&m2_e_pcie_ep>;
> +		};
> +	};
>  };
>  
>  &uart13 {
> @@ -18,3 +104,33 @@ &uart13 {
>  
>  	status = "okay";
>  };
> +
> +&uart5 {
> +	status = "okay";
> +
> +	port {
> +		uart5_ep: endpoint {
> +			remote-endpoint = <&m2_e_uart_ep>;
> +		};
> +	};
> +};
> +
> +&pm8550vs_g_gpios {
> +	m2_w_disable2: m2-w-disable2-state {
> +		pins = "gpio4";
> +		function = "normal";
> +		input-disable;
> +		output-enable;
> +		bias-disable;
> +		power-source = <2>;
> +	};
> +};
> +
> +&tlmm {
> +	m2_w_disable1: m2-w-disable1-state {
> +		pins = "gpio35";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
> index 7cfd242bc192..cce65e18f979 100644
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
> @@ -1909,6 +1909,7 @@ opp-8000000-3 {
>  			};
>  
>  			pcie0port0: pcie@0 {
> +				compatible = "pciclass,0604";
>  				device_type = "pci";
>  				reg = <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range = <0x01 0xff>;
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

