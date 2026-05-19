Return-Path: <linux-arm-msm+bounces-108572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EB88EnOYDGrWjgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 19:05:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9799A582D45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 19:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3836A306BFE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 16:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E843409135;
	Tue, 19 May 2026 16:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Id2Pr/L8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A393409124;
	Tue, 19 May 2026 16:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779209882; cv=none; b=RBqMq3kF7LYBDg+pfHYU7/slRe6U0bYMmQeasGiWeNQOr1Qa86BTmOucxZM1l5zKxjeGdjIyaolpnn1z2a6gnswbtSwxxV+nDr7BtAkEdzGRl/sb+eE9F6seCzM3SpG5B+1saklaRjf88SIBqqIXGXdhAXLNOwY7Zxj9lnC4qYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779209882; c=relaxed/simple;
	bh=pbdFPfSxGxtk+Z8PGKP7qPo4paDw4Vb+7CQIHqf1zCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ubDOUpS+kcTFV8AqSotqC6Q8WXdwPjl9UG7uyDGivhPYZMmFrJFUWNyh03mMicXcfyziazBIFQTe5lEd11+6uMKuQldpY6WiKA0KL1EI1dgRhi/HFqQLw8oFrd9+qXL9j+8mUBu/CvBRDouRfy9m85IRu96TPydbhPk/8/IIzF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Id2Pr/L8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B2A8C2BCB3;
	Tue, 19 May 2026 16:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779209880;
	bh=pbdFPfSxGxtk+Z8PGKP7qPo4paDw4Vb+7CQIHqf1zCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Id2Pr/L8WatPzLEHnjIS8qTBlB/asKnjN0CfwP5fDSlT/Sy4XjgudyAYFFwNyYIkt
	 eE5jQ/b4sfJNk90sBIuHFv/UFtoBMhxjghO3/YPNjV0tI4iUjm90Fgwa64nBvtIpB+
	 jyT1QJwhh9gfNmfEkLxhj3V6e8nDwONX4I9k/mh83GNOPUNgoR05ZSqzGDZ5OfZ0+y
	 +kR2mS2ur7pi48lksdaGa2ku/NpXapmqpMsmqwU5AvWlBLl9JW+vh8x6T1h4FKaJ5h
	 Ls+Yzc6r+wlTBdz0F7AK+OMdKBfPR/OK5W4x2PiXWk/zuIf8j9eLy2k0d9R/HeNpH5
	 +c9GmmG6jMu7Q==
Date: Tue, 19 May 2026 22:27:52 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5210: Enable PCIe support
Message-ID: <ihx6s76exbaaabevhvbn33sxxjae5fqzj4ai2yyvtqbk2xpnbf@sohbcb5zzvjt>
References: <20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com>
 <20260514-pci-ipq5210-v1-2-a09436200b35@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260514-pci-ipq5210-v1-2-a09436200b35@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108572-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,b128000:email,0.0.0.0:email,2.250.240.128:email,0.15.66.64:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9799A582D45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 14, 2026 at 09:43:02AM +0530, Varadarajan Narayanan wrote:
> Add DT entries to enable the PCIe controllers found in ipq5210.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts |  43 +++++
>  arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 261 +++++++++++++++++++++++++++-
>  2 files changed, 302 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
> index 941f866ecfe9..5e599a1cea3f 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
> @@ -5,6 +5,7 @@
>  
>  /dts-v1/;
>  
> +#include <dt-bindings/gpio/gpio.h>
>  #include "ipq5210.dtsi"
>  
>  / {
> @@ -20,6 +21,32 @@ chosen {
>  	};
>  };
>  
> +&pcie0_phy {
> +	status = "okay";
> +};
> +
> +&pcie0_rp {
> +	reset-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
> +};
> +
> +&pcie0 {
> +	pinctrl-0 = <&pcie0_default_state>;
> +	status = "okay";
> +};
> +
> +&pcie1_phy {
> +	status = "okay";
> +};
> +
> +&pcie1_rp {
> +	reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
> +};
> +
> +&pcie1 {
> +	pinctrl-0 = <&pcie1_default_state>;
> +	status = "okay";
> +};
> +
>  &sdhc {
>  	max-frequency = <192000000>;
>  	bus-width = <4>;
> @@ -36,6 +63,22 @@ &sleep_clk {
>  };
>  
>  &tlmm {
> +	pcie0_default_state: pcie0-default-state {
> +		pins = "gpio32";
> +		function = "gpio";
> +		drive-strength = <6>;
> +		bias-pull-down;
> +		output-low;
> +	};
> +
> +	pcie1_default_state: pcie1-default-state {
> +		pins = "gpio29";
> +		function = "gpio";
> +		drive-strength = <6>;
> +		bias-pull-down;
> +		output-low;
> +	};
> +
>  	qup_uart1_default_state: qup-uart1-default-state {
>  		pins = "gpio38", "gpio39";
>  		function = "qup_se1";
> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> index 3761eb03ab24..ec1c9a8c08e0 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> @@ -5,6 +5,7 @@
>  
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,ipq5210-gcc.h>
> +#include <dt-bindings/interconnect/qcom,ipq5210.h>
>  #include <dt-bindings/reset/qcom,ipq5210-gcc.h>
>  
>  / {
> @@ -13,6 +14,18 @@ / {
>  	interrupt-parent = <&intc>;
>  
>  	clocks {
> +		pcie30_phy0_pipe_clk: pcie30_phy0_pipe_clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <250000000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		pcie30_phy1_pipe_clk: pcie30_phy1_pipe_clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <250000000>;
> +			#clock-cells = <0>;
> +		};
> +
>  		sleep_clk: sleep-clk {
>  			compatible = "fixed-clock";
>  			#clock-cells = <0>;
> @@ -130,6 +143,54 @@ soc@0 {
>  		dma-ranges = <0 0 0 0 0x10 0>;
>  		ranges = <0 0 0 0 0x10 0>;
>  
> +		pcie0_phy: phy@84000 {
> +			compatible = "qcom,ipq5210-qmp-gen3x1-pcie-phy",
> +				     "qcom,ipq9574-qmp-gen3x1-pcie-phy";
> +			reg = <0x0 0x00084000 0x0 0x1000>;
> +
> +			clocks = <&gcc GCC_PCIE0_AUX_CLK>,
> +				 <&gcc GCC_PCIE0_AHB_CLK>,
> +				 <&gcc GCC_PCIE0_PIPE_CLK>;
> +			clock-names = "aux", "cfg_ahb", "pipe";
> +
> +			assigned-clocks = <&gcc GCC_PCIE0_AUX_CLK>;
> +			assigned-clock-rates = <20000000>;
> +
> +			resets = <&gcc GCC_PCIE0_PHY_BCR>,
> +				 <&gcc GCC_PCIE0PHY_PHY_BCR>;
> +			reset-names = "phy", "common";
> +
> +			#clock-cells = <0>;
> +			clock-output-names = "gcc_pcie0_pipe_clk_src";
> +
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		pcie1_phy: phy@f4000 {
> +			compatible = "qcom,ipq5210-qmp-gen3x2-pcie-phy",
> +				     "qcom,ipq9574-qmp-gen3x2-pcie-phy";
> +			reg = <0x0 0x000f4000 0x0 0x2000>;
> +
> +			clocks = <&gcc GCC_PCIE1_AUX_CLK>,
> +				 <&gcc GCC_PCIE1_AHB_CLK>,
> +				 <&gcc GCC_PCIE1_PIPE_CLK>;
> +			clock-names = "aux", "cfg_ahb", "pipe";
> +
> +			assigned-clocks = <&gcc GCC_PCIE1_AUX_CLK>, <&gcc GCC_PCIE1_AHB_CLK>;
> +			assigned-clock-rates = <20000000>, <100000000>;
> +
> +			resets = <&gcc GCC_PCIE1_PHY_BCR>,
> +				 <&gcc GCC_PCIE1PHY_PHY_BCR>;
> +			reset-names = "phy", "common";
> +
> +			#clock-cells = <0>;
> +			clock-output-names = "gcc_pcie1_pipe_clk_src";
> +
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		tlmm: pinctrl@1000000 {
>  			compatible = "qcom,ipq5210-tlmm";
>  			reg = <0x0 0x01000000 0x0 0x300000>;
> @@ -146,8 +207,8 @@ gcc: clock-controller@1800000 {
>  			reg = <0x0 0x01800000 0x0 0x40000>;
>  			clocks = <&xo_board>,
>  				 <&sleep_clk>,
> -				 <0>,
> -				 <0>,
> +				 <&pcie30_phy0_pipe_clk>,
> +				 <&pcie30_phy1_pipe_clk>,
>  				 <0>,
>  				 <0>;
>  			#clock-cells = <1>;
> @@ -299,6 +360,202 @@ frame@b128000 {
>  				status = "disabled";
>  			};
>  		};
> +
> +		pcie1: pcie@50000000 {
> +			compatible = "qcom,pcie-ipq5210", "qcom,pcie-ipq9574";
> +			reg = <0x0 0x50000000 0x0 0xf1c>,
> +			      <0x0 0x50000f20 0x0 0xa8>,
> +			      <0x0 0x50001000 0x0 0x1000>,
> +			      <0x0 0x000f0000 0x0 0x3000>,
> +			      <0x0 0x50100000 0x0 0x1000>,
> +			      <0x0 0x000f6000 0x0 0x1000>;
> +			reg-names = "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "parf",
> +				    "config",
> +				    "mhi";
> +			device_type = "pci";
> +			linux,pci-domain = <1>;
> +			bus-range = <0x00 0xff>;
> +			num-lanes = <2>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +
> +			ranges = <0x81000000 0x0 0x50200000 0x0 0x50200000 0x0 0x00100000>,
> +				 <0x82000000 0x0 0x50300000 0x0 0x50300000 0x0 0x0fd00000>;

<0x01000000 0x0 0x0 0x0 0x50200000 0x0 0x00100000>,
<0x02000000 0x0 0x0 0x0 0x50300000 0x0 0x0fd00000>;

> +
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 0x7>;
> +			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &intc 0 0 GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &intc 0 0 GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &intc 0 0 GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "msi0",
> +					  "msi1",
> +					  "msi2",
> +					  "msi3",
> +					  "msi4",
> +					  "msi5",
> +					  "msi6",
> +					  "msi7";
> +
> +			clocks = <&gcc GCC_PCIE1_AXI_M_CLK>,
> +				 <&gcc GCC_PCIE1_AXI_S_CLK>,
> +				 <&gcc GCC_PCIE1_AXI_S_BRIDGE_CLK>,
> +				 <&gcc GCC_PCIE1_RCHNG_CLK>,
> +				 <&gcc GCC_PCIE1_AHB_CLK>,
> +				 <&gcc GCC_PCIE1_AUX_CLK>;
> +
> +			clock-names = "axi_m",
> +				      "axi_s",
> +				      "axi_bridge",
> +				      "rchng",
> +				      "ahb",
> +				      "aux";
> +
> +			resets = <&gcc GCC_PCIE1_PIPE_ARES>,
> +				 <&gcc GCC_PCIE1_CORE_STICKY_RESET>,
> +				 <&gcc GCC_PCIE1_AXI_S_STICKY_RESET>,
> +				 <&gcc GCC_PCIE1_AXI_S_ARES>,
> +				 <&gcc GCC_PCIE1_AXI_M_STICKY_RESET>,
> +				 <&gcc GCC_PCIE1_AXI_M_ARES>,
> +				 <&gcc GCC_PCIE1_AUX_ARES>,
> +				 <&gcc GCC_PCIE1_AHB_ARES>;
> +
> +			reset-names = "pipe",
> +				      "sticky",
> +				      "axi_s_sticky",
> +				      "axi_s",
> +				      "axi_m_sticky",
> +				      "axi_m",
> +				      "aux",
> +				      "ahb";
> +
> +			interconnects = <&gcc MASTER_CNOC_PCIE1 &gcc SLAVE_CNOC_PCIE1>,
> +					<&gcc MASTER_SNOC_PCIE1 &gcc SLAVE_SNOC_PCIE1>;
> +			interconnect-names = "pcie-mem", "cpu-pcie";
> +
> +			status = "disabled";
> +
> +			pcie1_rp: pcie@0 {
> +				device_type = "pci";
> +				reg = <0x0 0x0 0x0 0x0 0x0>;
> +				bus-range = <0x01 0xff>;
> +				phys = <&pcie1_phy>;
> +
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				ranges;
> +			};
> +		};
> +
> +		pcie0: pcie@70000000 {
> +			compatible = "qcom,pcie-ipq5210", "qcom,pcie-ipq9574";
> +			reg = <0x0 0x70000000 0x0 0xf1c>,
> +			      <0x0 0x70000f20 0x0 0xa8>,
> +			      <0x0 0x70001000 0x0 0x1000>,
> +			      <0x0 0x00080000 0x0 0x3000>,
> +			      <0x0 0x70100000 0x0 0x1000>,
> +			      <0x0 0x00086000 0x0 0x1000>;
> +			reg-names = "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "parf",
> +				    "config",
> +				    "mhi";
> +			device_type = "pci";
> +			linux,pci-domain = <0>;
> +			bus-range = <0x00 0xff>;
> +			num-lanes = <1>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +
> +			ranges = <0x81000000 0x0 0x70200000 0x0 0x70200000 0x0 0x00100000>,
> +				 <0x82000000 0x0 0x70300000 0x0 0x70300000 0x0 0x0fd00000>;

Same as above.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

