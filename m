Return-Path: <linux-arm-msm+bounces-119050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wYavN3E/Vmqs2AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:53:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3B6755602
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:53:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NlrPtVpf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119050-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119050-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A939C3054EA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 13:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9935833BBC0;
	Tue, 14 Jul 2026 13:53:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C8247AF4D;
	Tue, 14 Jul 2026 13:53:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784037207; cv=none; b=UlxVVFPWYXzAcQpxkoB04ecGCP73CQ+0t0eQv5F6GvTwr1DFujiX0MC9ErSod+b7WNxbQT3O6lhT3MhREqrPIrYUepfHhhIWNipiCozn3K7BjLiFWbHFvWV0LJfIjga66N9gF/qZExAZ+B9OfhFTM5Narhaf8uNuh703VmHINpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784037207; c=relaxed/simple;
	bh=vXMwitJgtYXSlDnw38YkQK3Q/5dx2k+2wNuvAumhJi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BV760DoQPGBVugJFS5rz1AtHug17sN+pgitsqQoqgK+ruJxETXTXYKJEIkPN/MPXiheQNIFATsfJvheS2UfjsUcS2+7EFq7xrg397yK44w5Qhb9ToFqMo8PZSX7D9ralGDoboAozJsdBM8yR//TH/9gX72dvXqpEBhh8lC1ZBLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NlrPtVpf; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 454791F000E9;
	Tue, 14 Jul 2026 13:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784037203;
	bh=QaaBGqZH0Ys6NC7fb6XgsKHiHb+sRdLLVPO1+TCjC4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NlrPtVpfj0ahfbKwLQ06xzmp66N5lylhdM7f73FY/uGNXxTIfGJjenOCBwWpoCOSD
	 sZQZKhWk554O5nBbbRjvh2kee4PPkBTiHPmnS8mrpNeMnJFx4klhwu/3RS2OQwSL37
	 P4WpKzFFy8zFXJcNSLdD8BflOUxdExOumQXuXT8FyEb2m+3xJYsdKR8pyF1oetA7vw
	 Pz7sCSu2g1KqOXjCD421enQzKOC4JDtRsfTPdkWPtrRBOsdTM7MIeCvg46kyOV4wL3
	 OwLdx5VtsUVwqCQUEF0R2vVE0iN2yNWFo72o4HAemzfpAzFBrQiGMez25YoIxCoy8F
	 FGmbOngi7Ko5Q==
Date: Tue, 14 Jul 2026 15:53:14 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Wei Deng <wei.deng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH 1/3] arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe
 M.2 Key E connector
Message-ID: <yjdklxiwhpnpzkuuqfz7slggewnputddyx2sehoajk4qjfhmu3@5kw3r22cbmkx>
References: <20260709-fix-hamoa-m2-w-disable2-v1-0-5e725091266a@oss.qualcomm.com>
 <20260709-fix-hamoa-m2-w-disable2-v1-1-5e725091266a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260709-fix-hamoa-m2-w-disable2-v1-1-5e725091266a@oss.qualcomm.com>
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
	FORGED_RECIPIENTS(0.00)[m:wei.deng@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:mengshi.wu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119050-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 7B3B6755602

On Thu, Jul 09, 2026 at 12:59:40PM +0530, Wei Deng wrote:
> The hamoa IoT EVK has the PCIe M.2 Mechanical Key E connector to
> connect wireless connectivity cards over PCIe and UART interfaces.
> Hence, describe the connector node, link it with the PCIe 4 Root Port
> node and replace the static BT serdev under UART14 and the
> chip-specific wifi@0 child node with graph port/endpoints, allowing
> the pwrseq-pcie-m2 driver to power the card and dynamically create
> the BT serdev device.
> 
> The M.2 Key E connector is powered by vreg_wcn_3p3. WLAN enable is
> controlled via W_DISABLE1# (GPIO117) and BT enable via W_DISABLE2#
> (GPIO116), both described as active-low GPIOs on the connector node.
> 
> Remove the chip-specific wcn7850-pmu node as the M.2 connector
> approach replaces the WCN7850-specific power sequencing with a
> chip-agnostic one managed by the pwrseq-pcie-m2 driver.
> 
> Also add 'compatible = "pciclass,0604"' to pcie4_port0 in hamoa.dtsi
> to allow the PCI subsystem to associate the DT node with the
> PCI-to-PCI bridge device.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 129 ++++++++++-------------------
>  arch/arm64/boot/dts/qcom/hamoa.dtsi        |   1 +
>  2 files changed, 47 insertions(+), 83 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> index 9fa86bb6438e..41c2004f0ef6 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> @@ -68,6 +68,44 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	connector {
> +		compatible = "pcie-m2-e-connector";
> +		vpcie3v3-supply = <&vreg_wcn_3p3>;
> +
> +		w-disable1-gpios = <&tlmm 117 GPIO_ACTIVE_LOW>;
> +		w-disable2-gpios = <&tlmm 116 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 = <&wcn_wlan_en>, <&wcn_bt_en>;
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
> +					remote-endpoint = <&pcie4port0_ep>;
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
> +					remote-endpoint = <&uart14_ep>;
> +				};
> +			};
> +		};
> +	};
> +
>  	connector3 {
>  		compatible = "usb-a-connector";
>  		label = "USB-3-Type-A";
> @@ -676,65 +714,6 @@ usb_1_ss0_sbu_mux: endpoint {
>  			};
>  		};
>  	};
> -
> -	wcn7850-pmu {
> -		compatible = "qcom,wcn7850-pmu";
> -
> -		vdd-supply = <&vreg_wcn_0p95>;
> -		vddio-supply = <&vreg_l15b_1p8>;
> -		vddaon-supply = <&vreg_wcn_0p95>;
> -		vdddig-supply = <&vreg_wcn_0p95>;
> -		vddrfa1p2-supply = <&vreg_wcn_1p9>;
> -		vddrfa1p8-supply = <&vreg_wcn_1p9>;
> -
> -		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
> -		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
> -
> -		pinctrl-0 = <&wcn_bt_en>, <&wcn_wlan_en>;
> -		pinctrl-names = "default";
> -
> -		regulators {
> -			vreg_pmu_rfa_cmn: ldo0 {
> -				regulator-name = "vreg_pmu_rfa_cmn";
> -			};
> -
> -			vreg_pmu_aon_0p59: ldo1 {
> -				regulator-name = "vreg_pmu_aon_0p59";
> -			};
> -
> -			vreg_pmu_wlcx_0p8: ldo2 {
> -				regulator-name = "vreg_pmu_wlcx_0p8";
> -			};
> -
> -			vreg_pmu_wlmx_0p85: ldo3 {
> -				regulator-name = "vreg_pmu_wlmx_0p85";
> -			};
> -
> -			vreg_pmu_btcmx_0p85: ldo4 {
> -				regulator-name = "vreg_pmu_btcmx_0p85";
> -			};
> -
> -			vreg_pmu_rfa_0p8: ldo5 {
> -				regulator-name = "vreg_pmu_rfa_0p8";
> -			};
> -
> -			vreg_pmu_rfa_1p2: ldo6 {
> -				regulator-name = "vreg_pmu_rfa_1p2";
> -			};
> -
> -			vreg_pmu_rfa_1p8: ldo7 {
> -				regulator-name = "vreg_pmu_rfa_1p8";
> -			};
> -
> -			vreg_pmu_pcie_0p9: ldo8 {
> -				regulator-name = "vreg_pmu_pcie_0p9";
> -			};
> -
> -			vreg_pmu_pcie_1p8: ldo9 {
> -				regulator-name = "vreg_pmu_pcie_1p8";
> -			};
> -		};
> -	};
>  };
>  
>  &i2c1 {
> @@ -1025,19 +1004,10 @@ &pcie4_port0 {
>  	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
>  	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
>  
> -	wifi@0 {
> -		compatible = "pci17cb,1107";
> -		reg = <0x10000 0x0 0x0 0x0 0x0>;
> -
> -		vddaon-supply = <&vreg_pmu_aon_0p59>;
> -		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> -		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> -		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> -		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> -		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> -		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
> -		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> -		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> +	port {
> +		pcie4port0_ep: endpoint {
> +			remote-endpoint = <&m2_e_pcie_ep>;
> +		};
>  	};
>  };
>  
> @@ -1531,17 +1501,10 @@ wcn_usb_sw_n: wcn-usb-sw-n-state {
>  &uart14 {
>  	status = "okay";
>  
> -	bluetooth {
> -		compatible = "qcom,wcn7850-bt";
> -		max-speed = <3200000>;
> -
> -		vddaon-supply = <&vreg_pmu_aon_0p59>;
> -		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> -		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> -		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> -		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> -		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> -		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
> +	port {
> +		uart14_ep: endpoint {
> +			remote-endpoint = <&m2_e_uart_ep>;
> +		};
>  	};
>  };
>  
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index 60f485a4892e..566a6b4c6208 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -3776,6 +3776,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  
>  			pcie4_port0: pcie@0 {
>  				device_type = "pci";
> +				compatible = "pciclass,0604";
>  				reg = <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range = <0x01 0xff>;
>  
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

