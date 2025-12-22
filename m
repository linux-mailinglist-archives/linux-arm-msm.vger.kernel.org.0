Return-Path: <linux-arm-msm+bounces-86220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E94ECD5AEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 11:57:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C079300AC64
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37B3C31196C;
	Mon, 22 Dec 2025 10:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JABJmUxD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165C730BB94
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766401055; cv=none; b=Zo+fN6nETgK4CJsyBzBlOpXcNdzoBvRF+CK1k2uqoZ9bMAcx7vUlV2wpN0wGI7CBmaieF0m3tU8K2nblBPPrrb+PeIonALMFYfPHe8E531iFYF1h5E8emQGodduCZiVEJforCO+zVB5ZvFZRF+pr6TELX3qLjBQZ/6TmISGB2yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766401055; c=relaxed/simple;
	bh=Zohit+d7Nqia2qO+AWIiWXwBTYOoY4KMNV14bQFFtUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sLv/fH1sjZVO+UwDwVTPaNxuWJZY/zPY+yhHdAg2+AKdyGhZjdwox4wVkCeGsUk9LUeijdUNei/PVlcboRsDnsOap90RAOpH4rUcbsQzP6n0IjirCv1JD0Q4qJik6PVyAP2ngGOnXmalvZIghaylcUcQhZH4Sog8/r+tDEv9JYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JABJmUxD; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b736d883ac4so684287566b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 02:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766401051; x=1767005851; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vEtUYlPnDW4g49nMdGggYHqAcvj6eSx1T3T4Pklvktw=;
        b=JABJmUxDYhNsUypEE1eyhPHMgjlpXBWT5xRb4KARejAWisGftpe4BTSTV4n6vcOV2X
         qo57Rejzy/ZBJ/WquvkXmvJEJtRBChmLnaUitp1tVEtewD97zokPFxqpuuivny34mmbd
         gqGUUuDrtxfbg2S/OaBirfjXjoenWoSBxTMFAXraR2+jr07gIp57S21jn85imO8tM5Bx
         TdhmrUVCkC2gjMEKdhwWEZrgWLkpEAETZJ/7JEpqtc+PdvGYCXpQzRmQzjB8eokNlgvc
         VW+kn1sy5+lnjqGV9d67PcEDVoM7xk1+dU4Qdsb9h83iCALzQ0y7/rR9a/7F/M8EpJ+p
         Q80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766401051; x=1767005851;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vEtUYlPnDW4g49nMdGggYHqAcvj6eSx1T3T4Pklvktw=;
        b=jkIq3vHlZ3ovAe00jpdQ4cKiJNN7EKfcXiRbAqoaJkAgml9LKMfoglRW8FJ4loOXSa
         IAbnUngiDgX7xwoFGEimn+VWM6bN0KTLA4GBMlsedUAxoUN1e4Glg/BILBkB9C5iGLUn
         EEDGEZ61+trF3ShKmi2bWJNj+Cw15jKH7dQh7wcu5eJm1FwuZxjpu8DI2oAwfMcUbdQC
         xupdV5YaZUZF3j97dTkkyb3yLWHB3LRHDmgtA+gxEFz18CruQswiiRJDg0kOmGE1Jruk
         MHfXgK6qpSgUSgeLtcU22nHBriCW+3pCbGx6+A+O4JULPNCa4W9uBj4WlHIO0D+aVgCX
         nigQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkz4+oqlWRo9d/6b5BtK6UiayZVg+U9qFiHhHFw6hIynV2I/U+qIiSfz2cDG1EjZvn9FlTHN8GFyIrrceP@vger.kernel.org
X-Gm-Message-State: AOJu0YzvnkLSCxQEFFwV8LQ5E3BXSer3awjKm8LADIKa6qoYArTMTwVP
	26KYgX/7/v3HGJLk2KHO41iNr6ak+SfUGPIXS7f8dQ3T3vGrkpIQZxoKclSzwrEhvA8=
X-Gm-Gg: AY/fxX6VbLsGTXE2b+Oa+Vzxq2K0MpZoHNOvmYZzakAMcIFh3mQOG59rDkIZWKWJomF
	KY/A5XBNk/3iM1/lTJsQm9liO0KL0B8LWkjc5xIP5KviEQX6fYfb7soA/scOMYM6kBbLk8eQq06
	OwGxPxvKzN2SSfRh7VV2lBJuBZ4LNJ2DZmDdlP8DuGpPaMsjaawsJ6HLNQ7eOieafo/h65PSWUq
	sI9nIrLGFyMA3wZOZje1wiIpBVx6jPIWwQGJHiVA7Y5x8hSaW4rWr4UKCw2PjyL5HbYUCQ3YZOT
	UzvkSZtjhUSZbw1vdZlqrHt6Os6D/Qp6D9WKLO5iYHMkQbdAD3EGP+eAd9gBAGa63H8KkR+4Xi/
	+PyJizTb4IGZi0iJmu5dJcR1KXFLFWypkNPZme1dpAzVJjltPVqjI8msMUoRWj93bABgiLU3aao
	1r0dm8y6fC1OntANEJ
X-Google-Smtp-Source: AGHT+IELyK7A/NLPhzrn4VgYN4L21tWVeMZBHHK46LVxKYhntQeFKJ42FL+SIPd64kGNWNo9z4iz0Q==
X-Received: by 2002:a17:907:9719:b0:b80:f4d:4aba with SMTP id a640c23a62f3a-b80371d6999mr1126177266b.47.1766401051268;
        Mon, 22 Dec 2025 02:57:31 -0800 (PST)
Received: from linaro.org ([77.64.146.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0cc52sm1034561866b.52.2025.12.22.02.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 02:57:30 -0800 (PST)
Date: Mon, 22 Dec 2025 11:56:56 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	rajendra.nayak@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
	Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: Introduce Glymur base dtsi
Message-ID: <aUkj-CkSSOlG8X6Q@linaro.org>
References: <20251219-upstream_v3_glymur_introduction-v3-0-32271f1f685d@oss.qualcomm.com>
 <20251219-upstream_v3_glymur_introduction-v3-3-32271f1f685d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251219-upstream_v3_glymur_introduction-v3-3-32271f1f685d@oss.qualcomm.com>

On Fri, Dec 19, 2025 at 08:16:56PM +0530, Pankaj Patil wrote:
> Introduce the base device tree support for Glymur – Qualcomm's
> next-generation compute SoC. The new glymur.dtsi describes the core SoC
> components, including:
> 
> - CPUs and CPU topology
> - Interrupt controller and TLMM
> - GCC,DISPCC and RPMHCC clock controllers
> - Reserved memory and interconnects
> - SMMU and firmware SCM
> - Watchdog, RPMHPD, APPS RSC and SRAM
> - PSCI and PMU nodes
> - QUPv3 serial engines
> - CPU power domains and idle states, plus SCMI/ SRAM pieces for CPU DVFS
> - PDP0 mailbox, IPCC and AOSS
> - Display clock controller
> - SPMI PMIC arbiter with SPMI0/1/2 buses
> - SMP2P nodes
> - TSENS and thermal zones (8 instances, 92 sensors)
> 
> Add dtsi files for PMH0101, PMK8850, PMCX0102, SMB2370, PMH0104,
> PMH0110 along with temp-alarm and GPIO nodes needed on Glymur
> 
> Add glmur-pmics.dtsi file for all the pmics enabled
> 
> Enabled PCIe controllers and associated PHY to support boot to
> shell with nvme storage,
> List of PCIe instances enabled:
> 
> - PCIe3b
> - PCIe4
> - PCIe5
> - PCIe6
>
> [...]
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> new file mode 100644
> index 000000000000..eb042541cfe1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -0,0 +1,5700 @@
> [...]
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "qcom,oryon";
> +			reg = <0x0 0x0>;
> +			enable-method = "psci";
> +			power-domains = <&cpu_pd0>, <&scmi_perf 0>;
> +			power-domain-names = "psci", "perf";
> +			cpu-idle-states = <&cpu_c4>;

You probably want to move this to domain-idle-states:
https://lore.kernel.org/linux-arm-msm/20251010-topic-x1e_dt_idle-v1-1-b1c8d558e635@oss.qualcomm.com/

> +			next-level-cache = <&l2_0>;
> +
> +			l2_0: l2-cache {
> +				compatible = "cache";
> +				cache-level = <2>;
> +				cache-unified;
> +			};
> +		};
> [...]
> +		qupv3_2: geniqup@8c0000 {
> +			compatible = "qcom,geni-se-qup";
> +			reg = <0x0 0x008c0000 0x0 0x3000>;
> +			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
> +				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
> +			clock-names = "m-ahb",
> +				      "s-ahb";
> +			iommus = <&apps_smmu 0xd63 0x0>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			status = "disabled";
> +
> +			i2c16: i2c@880000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0x0 0x00880000 0x0 0x4000>;
> +				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
> +				clock-names = "se";
> +				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
> +						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
> +						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,

CPU->something paths should be QCOM_ICC_TAG_ACTIVE_ONLY (everywhere).

> +						<&aggre3_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +				interconnect-names = "qup-core",
> +						     "qup-config",
> +						     "qup-memory";
> +				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
> +				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
> +				dma-names = "tx",
> +					    "rx";
> +				pinctrl-0 = <&qup_i2c16_data_clk>;
> +				pinctrl-names = "default";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> [...]
> +		pcie4: pci@1bf0000 {
> +			device_type = "pci";
> +			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
> +			reg = <0x0 0x01bf0000 0x0 0x3000>,
> +			      <0x0 0x78000000 0x0 0xf20>,
> +			      <0x0 0x78000f40 0x0 0xa8>,
> +			      <0x0 0x78001000 0x0 0x4000>,
> +			      <0x0 0x78005000 0x0 0x100000>,
> +			      <0x0 0x01bf3000 0x0 0x1000>;
> +			reg-names = "parf",
> +				    "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "config",
> +				    "mhi";
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x78105000 0x0 0x100000>,
> +				<0x02000000 0x0 0x78205000 0x0 0x78205000 0x0 0x1dfb000>,
> +				<0x03000000 0x7 0x80000000 0x7 0x80000000 0x0 0x20000000>;
> +			bus-range = <0 0xff>;
> +
> +			dma-coherent;
> +
> +			linux,pci-domain = <4>;
> +			num-lanes = <2>;
> +
> +			operating-points-v2 = <&pcie4_opp_table>;
> +
> +			msi-map = <0x0 &gic_its 0xc0000 0x10000>;
> +
> +			interrupts = <GIC_SPI 505 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 510 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 511 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 512 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 944 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "msi0",
> +					  "msi1",
> +					  "msi2",
> +					  "msi3",
> +					  "msi4",
> +					  "msi5",
> +					  "msi6",
> +					  "msi7",
> +					  "global";
> +
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 0x7>;
> +			interrupt-map = <0 0 0 1 &intc 0 0 0 513 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &intc 0 0 0 514 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &intc 0 0 0 515 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &intc 0 0 0 516 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&gcc GCC_PCIE_4_AUX_CLK>,
> +				 <&gcc GCC_PCIE_4_CFG_AHB_CLK>,
> +				 <&gcc GCC_PCIE_4_MSTR_AXI_CLK>,
> +				 <&gcc GCC_PCIE_4_SLV_AXI_CLK>,
> +				 <&gcc GCC_PCIE_4_SLV_Q2A_AXI_CLK>,
> +				 <&gcc GCC_AGGRE_NOC_PCIE_4_WEST_SF_AXI_CLK>;
> +			clock-names = "aux",
> +				      "cfg",
> +				      "bus_master",
> +				      "bus_slave",
> +				      "slave_q2a",
> +				      "noc_aggr";
> +
> +			assigned-clocks = <&gcc GCC_PCIE_4_AUX_CLK>;
> +			assigned-clock-rates = <19200000>;
> +
> +			interconnects = <&pcie_west_anoc MASTER_PCIE_4 QCOM_ICC_TAG_ALWAYS
> +					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +					&pcie_west_slv_noc SLAVE_PCIE_4 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "pcie-mem",
> +					     "cpu-pcie";
> +
> +			resets = <&gcc GCC_PCIE_4_BCR>,
> +				 <&gcc GCC_PCIE_4_LINK_DOWN_BCR>;
> +			reset-names = "pci",
> +				      "link_down";
> +
> +			power-domains = <&gcc GCC_PCIE_4_GDSC>;
> +
> +			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
> +			eq-presets-16gts = /bits/ 8 <0x55 0x55>;

Shouldn't there be an IOMMU assigned here? (i.e. iommus = <...> or
iommu-map = <...>). The reason we don't have these directly in
hamoa.dtsi is that it runs in EL1 by default and the Gunyah hypervisor
prevents direct access to the SMMUv3 that protects the PCIe endpoints.

Your cover letter says Glymur is capable of booting at EL2, so this
can't be the case here. Is there no SMMU for PCIe on Glymur?

There are significant security and performance downsides without a IOMMU
assigned here (especially with the upcoming USB4 enablement), so this is
not something I would expect to be omitted without any TODO comment or
similar mentioned anywhere.

> [...]
> +		dispcc: clock-controller@af00000 {
> +			compatible = "qcom,glymur-dispcc";
> +			reg = <0x0 0x0af00000 0x0 0x20000>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&sleep_clk>,
> +				 <0>, /* dp0 */
> +				 <0>,
> +				 <0>, /* dp1 */
> +				 <0>,
> +				 <0>, /* dp2 */
> +				 <0>,
> +				 <0>, /* dp3 */
> +				 <0>,
> +				 <0>, /* dsi0 */
> +				 <0>,
> +				 <0>, /* dsi1 */
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>;
> +			power-domains = <&rpmhpd RPMHPD_MMCX>;
> +			required-opps = <&rpmhpd_opp_turbo>;

Are you sure you want to force TURBO here?

> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
> [...]
> +		watchdog@17600000 {
> +			compatible = "qcom,kpss-wdt";

This compatible is deprecated.

> +			reg = <0x0 0x17600000 0x0 0x1000>;
> +			clocks = <&sleep_clk>;
> +			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
> +		};
> +
> [...]

Thanks,
Stephan

