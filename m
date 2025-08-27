Return-Path: <linux-arm-msm+bounces-71051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94312B38EEA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 01:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63F287AFBA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 23:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B541730F7FB;
	Wed, 27 Aug 2025 23:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I7Y002sn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC326FC5;
	Wed, 27 Aug 2025 23:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756335968; cv=none; b=CSV6Ee6RJeNMtTmLHIosxOnxKpKNKDBFm0jzqau1NxRH4VzCw1FFoXM+8BbhkSm8zJfOGLfhrNteTIu9xOhWP8eVEpyom+/Nd/vB6E2WIrLUMVHI48QT0JzojwSEBbTrXUrqZVeLYfeG/9gWzVzBmM0fwA65ESNKIWaAC0MgaPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756335968; c=relaxed/simple;
	bh=Hn7z7+h1KlOyEzZ5ogs3LvsbVoefAUfjwa3kkLHCKzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AShOxM64bQqI6aAL4FzdHsqSiAZ9mRSN5mkHHgDfJ9uc6VqgfwzkvPwV5oFUEl21Cxm2l6lBXewf/2hPtj+HAW3irYxA+NLQdarMdH2mXW5IHauyfZXr9H+WNKTYs1bOi4V7WaZHoU/qVGuYAYka6AcVYrb7/IkxrhaZyQGLfsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I7Y002sn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1ECC4CEEB;
	Wed, 27 Aug 2025 23:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756335968;
	bh=Hn7z7+h1KlOyEzZ5ogs3LvsbVoefAUfjwa3kkLHCKzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I7Y002snJSV4qmqDfIVft0ckXjr8ZGtcpG4o2QBK2LRZtR8PJqnsnnc6FbNforb3w
	 E3pjxhm9+QwcAH2bzKummaAdpINg7Pi7agf0gE65TpQqSfM4/601RUoigk4OzzwVit
	 nS+AA/NSE8jc5uPIrbSDlTTkaNMoOkZApZDSTM5UH2Oi+QZGCjUL1m3DZYCyqX/mjP
	 FxVz8mvVmMCEV35CaDHqO56E4kFZV+gCIqO4lI/WR+EvdXoMDk6hGbc35IKIu5G+gm
	 vYhsTDnHUJP6HGa8Nb1/B5xV7JLtujemV1y6V3tE6GtSZVhNCWBCPEJXSIxRmFf3yX
	 6NAksnLVBmpZw==
Date: Wed, 27 Aug 2025 18:06:04 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Sushrut Shree Trivedi <quic_sushruts@quicinc.com>, 
	Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>, Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
	Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>, Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	Monish Chunara <quic_mchunara@quicinc.com>, Vishal Kumar Pal <quic_vispal@quicinc.com>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: lemans-evk: Extend peripheral and
 subsystem support
Message-ID: <uvdrqzpqc5vki6sh5f7phktuk47egtmfuw3jjvoakrbyhqxwvt@obao75mbrtti>
References: <20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com>
 <20250826-lemans-evk-bu-v1-3-08016e0d3ce5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826-lemans-evk-bu-v1-3-08016e0d3ce5@oss.qualcomm.com>

On Tue, Aug 26, 2025 at 11:51:02PM +0530, Wasim Nazir wrote:
> Enhance the Qualcomm Lemans EVK board file to support essential
> peripherals and improve overall hardware capabilities, as
> outlined below:
>   - Enable GPI (Generic Peripheral Interface) DMA-0/1/2 and QUPv3-0/2
>     controllers to facilitate DMA and peripheral communication.
>   - Add support for PCIe-0/1, including required regulators and PHYs,
>     to enable high-speed external device connectivity.
>   - Integrate the TCA9534 I/O expander via I2C to provide 8 additional
>     GPIO lines for extended I/O functionality.
>   - Enable the USB0 controller in device mode to support USB peripheral
>     operations.
>   - Activate remoteproc subsystems for supported DSPs such as Audio DSP,
>     Compute DSP-0/1 and Generic DSP-0/1, along with their corresponding
>     firmware.
>   - Configure nvmem-layout on the I2C EEPROM to store data for Ethernet
>     and other consumers.
>   - Enable the QCA8081 2.5G Ethernet PHY on port-0 and expose the
>     Ethernet MAC address via nvmem for network configuration.
>     It depends on CONFIG_QCA808X_PHY to use QCA8081 PHY.
>   - Add support for the Iris video decoder, including the required
>     firmware, to enable video decoding capabilities.
>   - Enable SD-card slot on SDHC.

I know I asked for you to lump things together in the initial
contribution to provide as much features as possible in that initial
patch, but now that is in place and this patch really is a bunch of
independent logical changes and this commit message reads much more like
a cover letter...

> 
> Co-developed-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> Co-developed-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
> Signed-off-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
> Co-developed-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> Co-developed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> Co-developed-by: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
> Signed-off-by: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
> Co-developed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> Co-developed-by: Monish Chunara <quic_mchunara@quicinc.com>
> Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> Co-developed-by: Vishal Kumar Pal <quic_vispal@quicinc.com>
> Signed-off-by: Vishal Kumar Pal <quic_vispal@quicinc.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>

And I don't think you all wrote this patch, you probably all wrote
individual pieces and then one of you created the actual patch?

The important part is that we don't want 9 different patch series
floating around with unmet dependencies and relying on me to try to
stitch them together.

But if you could do what you did for patch 2, 4, and 5 for logical
chunks of this change, that would be excellent (i.e. you collect the
individual patches, you add your signed-off-by, and you send them all
together).

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 387 ++++++++++++++++++++++++++++++++
>  1 file changed, 387 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> index 9e415012140b..642b66c4ad1e 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> @@ -16,7 +16,10 @@ / {
>  	compatible = "qcom,lemans-evk", "qcom,qcs9100", "qcom,sa8775p";
>  
>  	aliases {
> +		ethernet0 = &ethernet0;
> +		mmc1 = &sdhc;
>  		serial0 = &uart10;
> +		serial1 = &uart17;
>  	};
>  
>  	chosen {
> @@ -46,6 +49,30 @@ edp1_connector_in: endpoint {
>  			};
>  		};
>  	};
> +
> +	vmmc_sdc: regulator-vmmc-sdc {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vmmc_sdc";
> +
> +		regulator-min-microvolt = <2950000>;
> +		regulator-max-microvolt = <2950000>;
> +	};
> +
> +	vreg_sdc: regulator-vreg-sdc {
> +		compatible = "regulator-gpio";
> +
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <2950000>;
> +		regulator-name = "vreg_sdc";
> +		regulator-type = "voltage";
> +
> +		startup-delay-us = <100>;
> +
> +		gpios = <&expander1 7 GPIO_ACTIVE_HIGH>;
> +
> +		states = <1800000 0x1
> +			  2950000 0x0>;
> +	};
>  };
>  
>  &apps_rsc {
> @@ -277,6 +304,161 @@ vreg_l8e: ldo8 {
>  	};
>  };
>  
> +&ethernet0 {
> +	phy-handle = <&hsgmii_phy0>;
> +	phy-mode = "2500base-x";
> +
> +	pinctrl-0 = <&ethernet0_default>;
> +	pinctrl-names = "default";
> +
> +	snps,mtl-rx-config = <&mtl_rx_setup>;
> +	snps,mtl-tx-config = <&mtl_tx_setup>;
> +	snps,ps-speed = <1000>;
> +
> +	nvmem-cells = <&mac_addr0>;
> +	nvmem-cell-names = "mac-address";
> +
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		hsgmii_phy0: ethernet-phy@1c {
> +			compatible = "ethernet-phy-id004d.d101";
> +			reg = <0x1c>;
> +			reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <11000>;
> +			reset-deassert-us = <70000>;
> +		};
> +	};
> +
> +	mtl_rx_setup: rx-queues-config {
> +		snps,rx-queues-to-use = <4>;
> +		snps,rx-sched-sp;
> +
> +		queue0 {
> +			snps,dcb-algorithm;
> +			snps,map-to-dma-channel = <0x0>;
> +			snps,route-up;
> +			snps,priority = <0x1>;
> +		};
> +
> +		queue1 {
> +			snps,dcb-algorithm;
> +			snps,map-to-dma-channel = <0x1>;
> +			snps,route-ptp;
> +		};
> +
> +		queue2 {
> +			snps,avb-algorithm;
> +			snps,map-to-dma-channel = <0x2>;
> +			snps,route-avcp;
> +		};
> +
> +		queue3 {
> +			snps,avb-algorithm;
> +			snps,map-to-dma-channel = <0x3>;
> +			snps,priority = <0xc>;
> +		};
> +	};
> +
> +	mtl_tx_setup: tx-queues-config {
> +		snps,tx-queues-to-use = <4>;
> +
> +		queue0 {
> +			snps,dcb-algorithm;
> +		};
> +
> +		queue1 {
> +			snps,dcb-algorithm;
> +		};
> +
> +		queue2 {
> +			snps,avb-algorithm;
> +			snps,send_slope = <0x1000>;
> +			snps,idle_slope = <0x1000>;
> +			snps,high_credit = <0x3e800>;
> +			snps,low_credit = <0xffc18000>;
> +		};
> +
> +		queue3 {
> +			snps,avb-algorithm;
> +			snps,send_slope = <0x1000>;
> +			snps,idle_slope = <0x1000>;
> +			snps,high_credit = <0x3e800>;
> +			snps,low_credit = <0xffc18000>;
> +		};
> +	};
> +};
> +
> +&gpi_dma0 {
> +	status = "okay";
> +};
> +
> +&gpi_dma1 {
> +	status = "okay";
> +};
> +
> +&gpi_dma2 {
> +	status = "okay";
> +};
> +
> +&i2c18 {
> +	status = "okay";
> +
> +	expander0: pca953x@38 {
> +		compatible = "ti,tca9538";
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		reg = <0x38>;
> +	};
> +
> +	expander1: pca953x@39 {
> +		compatible = "ti,tca9538";
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		reg = <0x39>;
> +	};
> +
> +	expander2: pca953x@3a {
> +		compatible = "ti,tca9538";
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		reg = <0x3a>;
> +	};
> +
> +	expander3: pca953x@3b {
> +		compatible = "ti,tca9538";
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		reg = <0x3b>;
> +	};
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c256";
> +		reg = <0x50>;
> +		pagesize = <64>;
> +
> +		nvmem-layout {
> +			compatible = "fixed-layout";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			mac_addr0: mac-addr@0 {
> +				reg = <0x0 0x6>;
> +			};
> +		};
> +	};
> +};
> +
> +&iris {
> +	firmware-name = "qcom/vpu/vpu30_p4_s6.mbn";
> +
> +	status = "okay";
> +};
> +
>  &mdss0 {
>  	status = "okay";
>  };
> @@ -323,14 +505,196 @@ &mdss0_dp1_phy {
>  	status = "okay";
>  };
>  
> +&pcie0 {
> +	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie0_default_state>;
> +
> +	status = "okay";
> +};
> +
> +&pcie0_phy {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l1c>;
> +
> +	status = "okay";
> +};
> +
> +&pcie1 {
> +	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie1_default_state>;
> +
> +	status = "okay";
> +};
> +
> +&pcie1_phy {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l1c>;
> +
> +	status = "okay";
> +};
> +
> +&qupv3_id_0 {
> +	status = "okay";
> +};
> +
>  &qupv3_id_1 {
>  	status = "okay";
>  };
>  
> +&qupv3_id_2 {
> +	status = "okay";
> +};
> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/sa8775p/adsp.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp0 {
> +	firmware-name = "qcom/sa8775p/cdsp0.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp1 {
> +	firmware-name = "qcom/sa8775p/cdsp1.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_gpdsp0 {
> +	firmware-name = "qcom/sa8775p/gpdsp0.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_gpdsp1 {
> +	firmware-name = "qcom/sa8775p/gpdsp1.mbn";
> +
> +	status = "okay";
> +};
> +
> +&sdhc {
> +	vmmc-supply = <&vmmc_sdc>;
> +	vqmmc-supply = <&vreg_sdc>;
> +
> +	pinctrl-0 = <&sdc_default>, <&sd_cd>;
> +	pinctrl-1 = <&sdc_sleep>, <&sd_cd>;
> +	pinctrl-names = "default", "sleep";
> +
> +	power-domains = <&rpmhpd SA8775P_CX>;
> +	operating-points-v2 = <&sdhc_opp_table>;
> +
> +	cd-gpios = <&tlmm 36 GPIO_ACTIVE_LOW>;
> +
> +	status = "okay";
> +
> +	sdhc_opp_table: opp-table {
> +		compatible = "operating-points-v2";
> +
> +		opp-100000000 {
> +			opp-hz = /bits/ 64 <100000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <1800000 400000>;
> +			opp-avg-kBps = <100000 0>;
> +		};
> +
> +		opp-384000000 {
> +			opp-hz = /bits/ 64 <384000000>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +			opp-peak-kBps = <5400000 1600000>;
> +			opp-avg-kBps = <390000 0>;
> +		};
> +	};
> +};
> +
> +&serdes0 {
> +	phy-supply = <&vreg_l5a>;
> +
> +	status = "okay";
> +};
> +
>  &sleep_clk {
>  	clock-frequency = <32768>;
>  };
>  
> +&tlmm {
> +	ethernet0_default: ethernet0-default-state {
> +		ethernet0_mdc: ethernet0-mdc-pins {
> +			pins = "gpio8";
> +			function = "emac0_mdc";
> +			drive-strength = <16>;
> +			bias-pull-up;
> +		};
> +
> +		ethernet0_mdio: ethernet0-mdio-pins {
> +			pins = "gpio9";
> +			function = "emac0_mdio";
> +			drive-strength = <16>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	pcie0_default_state: pcie0-default-state {
> +		clkreq-pins {
> +			pins = "gpio1";
> +			function = "pcie0_clkreq";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-pins {
> +			pins = "gpio2";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-down;
> +		};
> +
> +		wake-pins {
> +			pins = "gpio0";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	pcie1_default_state: pcie1-default-state {
> +		clkreq-pins {
> +			pins = "gpio3";
> +			function = "pcie1_clkreq";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-pins {
> +			pins = "gpio4";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-down;
> +		};
> +
> +		wake-pins {
> +			pins = "gpio5";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	sd_cd: sd-cd-state {
> +		pins = "gpio36";
> +		function = "gpio";
> +		bias-pull-up;
> +	};
> +};
> +
>  &uart10 {
>  	compatible = "qcom,geni-debug-uart";
>  	pinctrl-0 = <&qup_uart10_default>;
> @@ -356,6 +720,29 @@ &ufs_mem_phy {
>  	status = "okay";
>  };
>  
> +&usb_0 {
> +	status = "okay";
> +};
> +
> +&usb_0_dwc3 {
> +	dr_mode = "peripheral";
> +};
> +
> +&usb_0_hsphy {
> +	vdda-pll-supply = <&vreg_l7a>;
> +	vdda18-supply = <&vreg_l6c>;
> +	vdda33-supply = <&vreg_l9a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_0_qmpphy {
> +	vdda-phy-supply = <&vreg_l1c>;
> +	vdda-pll-supply = <&vreg_l7a>;
> +
> +	status = "okay";
> +};
> +
>  &xo_board_clk {
>  	clock-frequency = <38400000>;
>  };
> 
> -- 
> 2.51.0
> 

