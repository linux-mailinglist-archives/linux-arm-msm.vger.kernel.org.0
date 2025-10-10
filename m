Return-Path: <linux-arm-msm+bounces-76789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E30B8BCCDA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 14:19:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECBB5189D142
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 12:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD6F23E347;
	Fri, 10 Oct 2025 12:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="babjanoT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4709023D7FC
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 12:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760098790; cv=none; b=rVObUHasQUJe6a0sqcZ4GYtaRwDKbb6PmOA2QlY7Dm9wroWGhRpruQdPXigXe5+o8GQVY1akqxNLACEDRbj5HoQUPaMmOYBbd005/3uPd3dw8miJJno02cO1UjBoCknObURejFVC5nfVlq/Y6IdyxgGpHjdjLWa3pczZuA9Rygo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760098790; c=relaxed/simple;
	bh=HT+JCCqaZ1q90NmqpixoMzg8teS2H4eFeALphqxd/Cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZ5lPaNtJCUrnvxjPkbfFhTudketcdjrhT62LWYrUwEEnGyrCII18vQG75pPDp9BSU3Qlibe8EK3LFmIcY+WTDX7oU+cY+UbtKVZ8LeUOdB5hWZ4KTgbxCcBcJvG6OmDPAfx8kvfLvgt+jZeCX/ygjcRnZxqTOcmS4CNKCmGCEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=babjanoT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A6WxaR032492
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 12:19:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lvFWwKyOCjvPuAG00qQuUT8b
	fdOszIjBy5BDHZQzJX8=; b=babjanoTp4TUypi+xWk97cg1DH6GCJNjyr/q8ThQ
	urEBzNyGtRJvPlDvgCxy3zf9D+0aCAzImF0rzrt7F28t5fKdyqWrwB1P2NcXNZhy
	GbFuQnKxfXOzDCgF/UGTc4rTexjR94cLcQet9q/kZRlTA18uTDAsbzPiP0akrkxj
	65a1WAZzIuaG/RZ97loo4BDMb6bnjvXYgZUZdS1oGj8bs5JdohULycIMPlCvgow6
	pK80mLG7HY3Glo8Mx52fPsEuq4JpQd/FXTbqSrI6muMJYzZp7Id1lrIGvRXAkp9s
	Cga+GU94eAvQaJ8J4FmGXYhX5M1oO50ueYUDyKGQJFHKTg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kx9eq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 12:19:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4df7cdf22cbso142645251cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 05:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760098787; x=1760703587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvFWwKyOCjvPuAG00qQuUT8bfdOszIjBy5BDHZQzJX8=;
        b=uI1tw5MjYFcd2j316tefa0DmcGVMM1y+euyZN3ulwG8ZHM4bgId3urEnwYsIrNNzTO
         W2iG4zbo83vc9VacvUnWcLJgp82S5ACB++THYSnTWfZDhbYqeLWcBoeaEH4LV+O92yPn
         qmrUXQ/3o5KIxPIh9qsgfFJtXoiGnieGfGcIrwDqgHaHLDtRTHKmFc8K2Isr1mMl4Njq
         6iTNibF8Qsw0ltBEvd/b2DhoLIK4jItKMe4RxiftGjDCdjZ/gBehenMGD3sQjfseizIY
         RsTZ/fzgHaLWeUG1sULo+g2DQLlf2LeJTYm7JQqwRB0EButTgFNU0/HhKHGQTViITRgs
         IphQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEIS9JpyrC6dPXPaY105S+UbIj7CNC4g4KMYw3qqWrOf16gR4kAmCNAFdti47VSPq3Fgz/IEVXHKUj8OfX@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb8VviJ3cS3/U9oCy2yYQugWW0ObyC7wp2xQ0zkn2gOYqPwkkd
	p0hUtC9dw2xvw8m9ZjcTz+8ryLl/+UoycdwYYW6V6dtaFSYpeIyuJoFgma4KTKrygwFfpbRIQzB
	7Gy+cAiniNuS8deHGAu74o2GhjuiMN+mNyXqX+uuIdLeQMTMtrvcf8aToJIKVS0TclWop
X-Gm-Gg: ASbGncuQcn3VoakNu2ouwjtwfSh7ztWlTWXZK6h6KSqzN6Q7swrdut24pe0eAMWLtJ3
	meqNoSQBJkKbyz4G+3KcRqU5YUbx4LCh51Q0OfcHchzNGJFDkPf9K8EG/YpIQTJroB74ABD/RqH
	NY8k7oEzsx3+4kXoF5KMv/hsuEnwgAZusA/CJ84o+CtL2NFjP0JfrMHZYnQ+vm4+8UaUhRhFSrd
	iDDdxEGal4jeGIcJLJmycTcAZBZ6jrOaWIcJ7fOZAAOeysemu/a7e//vnH1ZEsY0lZyJMiLxteG
	POH2J3n/QAj0e6RjLuU9GNmDIvd8iVi12NXXVC0FCxMjBhFUBkZwWhdwXPbDIAirJuD/VJqrYe9
	fTMOuE5dF/pQarIuan3BdRNryREtURkxAfP8pTFBEl0H+LLRHjsSB
X-Received: by 2002:a05:622a:1651:b0:4b7:a1b6:cf29 with SMTP id d75a77b69052e-4e6de928b64mr200323501cf.41.1760098786949;
        Fri, 10 Oct 2025 05:19:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqF3OeFFz961cC5H5LveXGud7hymmIq4uOMYlN8XBu2oeW98QjyLegjaL0mcBo3AoEoWwaPA==
X-Received: by 2002:a05:622a:1651:b0:4b7:a1b6:cf29 with SMTP id d75a77b69052e-4e6de928b64mr200323071cf.41.1760098786419;
        Fri, 10 Oct 2025 05:19:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762e77ca04sm5952731fa.4.2025.10.10.05.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 05:19:45 -0700 (PDT)
Date: Fri, 10 Oct 2025 15:19:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add support for QCS615 talos
 evk board
Message-ID: <q32oj6ry7ixulfaxzkm63nidg7ddmdl2moaakmx6rlv77p3wzl@wd2ekastvyms>
References: <qq4aak33bn3mqxd2edu6zgkkshby63mmitg7zqkly2rj4c2lh7@4s7sndb7e2jr>
 <20251010114745.1897293-1-tessolveupstream@gmail.com>
 <20251010114745.1897293-2-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010114745.1897293-2-tessolveupstream@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX+0vJbQD3/+uQ
 OKssZhj2ymEDMwu9Q+qVnDZfS7btS3MJhbdJyZbOgMV+VKp6h7IPn47D+qEVPkR/1jw2Xf5Mb3B
 6TSjKsdgryvdx+17GDX1Jjb0SjBqn0vpux0aHC/2DYg53ibS1wVAS/E4Km7imKmhiQUfMjipgN1
 OaJ/I30YfBUCsIj9yVr2M7x/qC9GYnmtDTpuhrlftSnKP2pXQkrbP4c9cysAiNGFquS4Obzmvk8
 KB0NPpHtF08uXbHtfwx/0fS6T42f2uo2a6pW8BXQoMZZKa2WOaAmS1DVWE4ftQvsZfJkRji+Lky
 XT8PCC1Yw4bzaRdsGvRhBuI2hQxEe0v+EXnztG/ngc+XT8hAMBfB9eNRwz6zcleIaLtT42yJL7L
 /1L3ldDuX3oJVJSTAygIqvqkc8Bo0g==
X-Authority-Analysis: v=2.4 cv=CbcFJbrl c=1 sm=1 tr=0 ts=68e8f9e4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=2vav2hW6rFjcptNlzBEA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 4FP4wfIJpFYOM0-YD6G4PHaAbZA5YTIG
X-Proofpoint-ORIG-GUID: 4FP4wfIJpFYOM0-YD6G4PHaAbZA5YTIG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Fri, Oct 10, 2025 at 05:17:45PM +0530, Sudarshan Shetty wrote:
> Introduce the device tree support for the QCS615-based talos-evk
> platform, which follows the SMARC (Smart Mobility ARChitecture)
> standard. The platform is composed of two main hardware
> components: the talos-evk-som and the talos-evk carrier board.
> 
> The talos-evk-som is a compact System on Module that integrates the
> QCS615 SoC, PMIC, and essential GPIO connectivity. It follows the
> SMARC standard, which defines a modular form factor allowing the SoM
> to be paired with different carrier boards for varied applications.
> 
> The talos-evk is one such carrier board, designed for evaluation
> and development purposes. It provides additional peripherals
> such as UART, USB, and other interfaces to enable rapid
> prototyping and hardware bring-up.
> 
> This initial device tree provides the basic configuration needed
> to boot the platform to a UART shell. Further patches will extend
> support for additional peripherals and subsystems.
> 
> The initial device tree includes basic support for:
> 
> - CPU and memory
> 
> - UART
> 
> - GPIOs
> 
> - Regulators
> 
> - PMIC
> 
> - Early console
> 
> - AT24MAC602 EEPROM
> 
> - MCP2515 SPI to CAN
> 
> QCS615 talos-evk uses a Quectel AF68E WiFi/BT module (PCIe for
> WiFi and UART for Bluetooth), which is different from the RIDE
> platform. Plan to enable these in a follow-up patch series.
> 
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
> Changes in v2:
>  - Rename compatible to "qcom,talos-evk" (suggested by Dmitry/Bjorn)
>  - Merge enum entry with existing qcs615-ride block (suggested by Krzysztof)
>  - Fix subject and commit message to use imperative mood
> 
>  arch/arm64/boot/dts/qcom/Makefile           |   1 +
>  arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 406 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/talos-evk.dts      |  42 ++
>  3 files changed, 449 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts
> 
> +
> +	vreg_v3p3_can: regulator-v3p3-can {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg-v3p3-can";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	vreg_v5p0_can: regulator-v5p0-can {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg-v5p0-can";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};

Is there a way to control those regulators or are they always enabled by
the hardware?

> +};
> +

[...]

> +
> +&tlmm {
> +	pcie_default_state: pcie-default-state {
> +		clkreq-pins {
> +			pins = "gpio90";
> +			function = "pcie_clk_req";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-pins {
> +			pins = "gpio101";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-down;
> +		};
> +
> +		wake-pins {
> +			pins = "gpio100";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +	};
> +};
> +
> +&sdhc_1 {

tlmm > sdhc_1

> +	pinctrl-0 = <&sdc1_state_on>;
> +	pinctrl-1 = <&sdc1_state_off>;
> +	pinctrl-names = "default", "sleep";
> +
> +	bus-width = <8>;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	mmc-hs400-1_8v;
> +	mmc-hs400-enhanced-strobe;
> +	vmmc-supply = <&vreg_l17a>;
> +	vqmmc-supply = <&vreg_s4a>;
> +
> +	non-removable;
> +	no-sd;
> +	no-sdio;
> +
> +	status = "okay";
> +};
> +
> +&spi6 {
> +	status = "okay";
> +
> +	mcp2515@0 {
> +		compatible = "microchip,mcp2515";
> +		reg = <0>;
> +		clock-frequency = <20000000>;
> +		interrupts-extended = <&tlmm 87 IRQ_TYPE_LEVEL_LOW>;
> +		spi-max-frequency = <10000000>;
> +		vdd-supply = <&vreg_v3p3_can>;
> +		xceiver-supply = <&vreg_v5p0_can>;
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&usb_1_hsphy {
> +	vdd-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +	vdda-phy-dpdm-supply = <&vreg_l13a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_qmpphy {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "okay";
> +};

Please keep all the nodes sorted.

> +
> +&usb_1 {
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3 {
> +	dr_mode = "host";

Is it really host-only?

> +};
> +
> +&usb_hsphy_2 {
> +	vdd-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +	vdda-phy-dpdm-supply = <&vreg_l13a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_2 {
> +	status = "okay";
> +};
> +
> +&usb_2_dwc3 {
> +	dr_mode = "host";

Is it really host-only?

> +};
> +
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 123 GPIO_ACTIVE_LOW>;
> +	vcc-supply = <&vreg_l17a>;
> +	vcc-max-microamp = <600000>;
> +	vccq2-supply = <&vreg_s4a>;
> +	vccq2-max-microamp = <600000>;
> +
> +	status = "okay";
> +};
> +
> +&ufs_mem_phy {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "okay";
> +};
> +
> +&venus {
> +	status = "okay";
> +};

-- 
With best wishes
Dmitry

