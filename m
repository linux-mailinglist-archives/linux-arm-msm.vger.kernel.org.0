Return-Path: <linux-arm-msm+bounces-33244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2528C991FEA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 19:31:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 442361C20AD3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 17:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C5D189911;
	Sun,  6 Oct 2024 17:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kChJC9n1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3967E16133C
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 17:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728235902; cv=none; b=QfL7OKPfcT2CDVwq2+4+BoSmRIalzEexWeT/EsAscBAlAU4GBfqmqwdPEGMIRdDXE1GfbBooiz0Z4WMFTX97BB3sTXl7ThfyPTMHgVj3CnOiWKe4aLKK+QAhYBzInegbckD0CMDHwAXrTtgsz7Tbp0AlAJ/H5/+wfNIUSu0cRE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728235902; c=relaxed/simple;
	bh=5reU071AudGIq+Jb/4wWifce2UEcCyqy4Aqcy5ObWDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bRUByzBet8lwLK+/+yarAHFs3k+u7vdtu9uvdAnV1CXrGJxbEZUTUwue8DnaUweJexjhBgn3IGSHWZuRbnjQZn1Ktr+Nt56xvzyHh3L+DQcamkpMKJgsPpTLGheKzKgsym9SSQQi9ARrxv/y0UiX82Awn4OfR1gpd9eOwozoNSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kChJC9n1; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fac187eef2so43012871fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 10:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728235898; x=1728840698; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V+1x2eaZdfcJAkN59aUewel3ZrAt0ipgCKYfkI0nklM=;
        b=kChJC9n1wUcUCfFRzSMRT3Chz3KhSvXXtUPsTIW5d31V0j6vjBEbRknESJhkwqgF3b
         KyOmX1oWY7DZrYub3DWrrQBTHKj9XriZ6z9vch3Ulx3s9mo7yYqNnEpRLRneyF2uvWEZ
         3xpt1Q04l6bXTGAHqmshFY17K5ycRCTtQhCTZZWMpgQNb2i7QFLqDzFkDd4IiEHyRdti
         maDO1RX685oFmsl6z6cDICwsWNrzGnbRXNusFU5h6KOVgYWcXenAxwyGNX4eZf3EXaHz
         cuG/I9V9XvpEdzj8zjjfd5j7G2eJdSrBMUMRWcF+xh+tJbbEAKiBTTBGzbQs3zDlVzrm
         cmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728235898; x=1728840698;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+1x2eaZdfcJAkN59aUewel3ZrAt0ipgCKYfkI0nklM=;
        b=CiK3plSmVRz99n+Pp3/0YoMUWPJOzV1s1ZXcRtkz/JTUwjQz4fj25+8pVl7B8o/CrN
         5e0rinM48hQ7FELHjZTFAoDl42dW6caTyciSVU8A6CNgmpzvoOlzcXfhUxs0GRmnRIhJ
         HlMSb5ImfHFrCaNiHszOgo4GzKrtSEjyfFLowt/KfyVIcLbgtuHvllpKttP+VKA47yTn
         g8HPjYxzEUqx/P74jPBI6A9nPbbvGyrKQG4jJhN3X43eXiRXgnXGtl5BsyTJ02LGWU33
         rBF0DAs4Kz4kKGMjuQCkLFkrIpRWEAP+/3VO7CW0Hfo3JaTXZlJgCtZKwx8yW8fwwmuB
         /3SQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4q5tOxMxh8jx4fkVXHct+SoBhvnZyBQetDd6QyRzC3vkZLlTrfiyLm+l7aLLDryTWANzst38KNi0OvpNI@vger.kernel.org
X-Gm-Message-State: AOJu0YyHyWAuZq9WkcTi9AV951yL22tDKahkXXPHCqRkqDzS6Gq7FRv1
	WTk9MD5sjpVbCZV9aZ3/RAw7XHjRSk/5tiXrZmWdHNISKRx5f+1511x8NVNKnUc=
X-Google-Smtp-Source: AGHT+IHolkfwm4FBBelPsLDfGFCd+24JRefY1B/Z701nMZ0U0k5vjdWpT1yBJvYueMpODE5WTFONnQ==
X-Received: by 2002:a05:651c:b2c:b0:2fa:d9db:7bac with SMTP id 38308e7fff4ca-2faf3c2ff99mr38901531fa.3.1728235898218;
        Sun, 06 Oct 2024 10:31:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faf9b336a8sm5762111fa.120.2024.10.06.10.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 10:31:36 -0700 (PDT)
Date: Sun, 6 Oct 2024 20:31:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org, 
	robh+dt@kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, conor+dt@kernel.org, abel.vesa@linaro.org, 
	srinivas.kandagatla@linaro.org, quic_jjohnson@quicinc.com
Subject: Re: [PATCH V2 2/2] arm64: dts: qcom: Add X1E001DE Snapdragon Devkit
 for Windows
Message-ID: <2q7yoc2rrlbusqqjc3j5arxhjbrl4u4uykwg2mvrqedoe3bzxx@t3et2e2slgwx>
References: <20241005182250.788272-1-quic_sibis@quicinc.com>
 <20241005182250.788272-3-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241005182250.788272-3-quic_sibis@quicinc.com>

On Sat, Oct 05, 2024 at 11:52:50PM GMT, Sibi Sankar wrote:
> Add initial support for x1e001de devkit platform. This includes:
> 
> -DSPs
> -Ethernet (RTL8125BG) over the pcie 5 instance.
> -NVme
> -Wifi
> -USB-C ports
> 
> Link: https://www.qualcomm.com/news/releases/2024/05/qualcomm-accelerates-development-for-copilot--pcs-with-snapdrago
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
> 
> v2:
> * Fix Ghz -> GHz  [Jeff]
> * Pick up Ab tag from Rob.
> * Use Vendor in ADSP/CDSP firmware path [Dmitry]
> * Fix reserved gpios [Dmitry]
> * Only port0 supports DRD update the dt accordingly [Dmitry]
> 
>  arch/arm64/boot/dts/qcom/Makefile            |   1 +
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 811 +++++++++++++++++++
>  2 files changed, 812 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index ae002c7cf126..1cbc7b91389d 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -268,6 +268,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk-display-card.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e78100-lenovo-thinkpad-t14s.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-asus-vivobook-s15.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-crd.dtb
> diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> new file mode 100644
> index 000000000000..afd718c25be7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> @@ -0,0 +1,811 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "x1e80100.dtsi"
> +#include "x1e80100-pmics.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. X1E001DE Snapdragon Devkit for Windows";
> +	compatible = "qcom,x1e001de-devkit", "qcom,x1e001de", "qcom,x1e80100";
> +
> +	aliases {
> +		serial0 = &uart21;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	pmic-glink {
> +		compatible = "qcom,x1e80100-pmic-glink",
> +			     "qcom,sm8550-pmic-glink",
> +			     "qcom,pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
> +				    <&tlmm 123 GPIO_ACTIVE_HIGH>,
> +				    <&tlmm 125 GPIO_ACTIVE_HIGH>;
> +
> +		/* Back panel port closer to the RJ45 connector */
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
> +					pmic_glink_ss0_hs_in: endpoint {
> +						remote-endpoint = <&usb_1_ss0_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss0_ss_in: endpoint {
> +						remote-endpoint = <&usb_1_ss0_qmpphy_out>;
> +					};
> +				};

No SBU? Please at least document, which ports have DP support by adding
the SBU nodes and a comment why the DP is not wired up (e.g. lack of the
retimer driver).

> +			};
> +		};
> +
> +		/* Back panel port closer to the audio jack */
> +		connector@1 {
> +			compatible = "usb-c-connector";
> +			reg = <1>;
> +			power-role = "dual";
> +			data-role = "host";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_ss1_hs_in: endpoint {
> +						remote-endpoint = <&usb_1_ss1_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss1_ss_in: endpoint {
> +						remote-endpoint = <&usb_1_ss1_qmpphy_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		/* Front panel port */
> +		connector@2 {
> +			compatible = "usb-c-connector";
> +			reg = <2>;
> +			power-role = "dual";
> +			data-role = "host";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_ss2_hs_in: endpoint {
> +						remote-endpoint = <&usb_1_ss2_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss2_ss_in: endpoint {
> +						remote-endpoint = <&usb_1_ss2_qmpphy_out>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +
> +	reserved-memory {
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			size = <0x0 0x8000000>;
> +			reusable;
> +			linux,cma-default;
> +		};
> +	};
> +
> +	vph_pwr: vph-pwr-regulator {

regulator-vphh-pwr.

> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vreg_nvme: regulator-nvme {

Sort nodes alphabetically.

> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_NVME_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 18 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&nvme_reg_en>;
> +	};
> +
> +	vreg_wwan: regulator-wwan {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "SDX_VPH_PWR";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 221 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&wwan_sw_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +};
> +

[skipped]

> +
> +&pcie4 {
> +	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
> +
> +	pinctrl-0 = <&pcie4_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie4_phy {
> +	vdda-phy-supply = <&vreg_l3i_0p8>;
> +	vdda-pll-supply = <&vreg_l3e_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&pcie5 {
> +	perst-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
> +
> +	vddpe-3v3-supply = <&vreg_wwan>;

pwrseq.

> +
> +	pinctrl-0 = <&pcie5_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie5_phy {
> +	vdda-phy-supply = <&vreg_l3i_0p8>;
> +	vdda-pll-supply = <&vreg_l3e_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&pcie6a {
> +	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
> +
> +	vddpe-3v3-supply = <&vreg_nvme>;

pwrseq.

> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie6a_default>;
> +
> +	status = "okay";
> +};
> +
> +&pcie6a_phy {
> +	vdda-phy-supply = <&vreg_l1d_0p8>;
> +	vdda-pll-supply = <&vreg_l2j_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&qupv3_0 {
> +	status = "okay";
> +};
> +
> +&qupv3_1 {
> +	status = "okay";
> +};
> +
> +&qupv3_2 {
> +	status = "okay";
> +};
> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/x1e80100/THUNDERCOMM/DEVKIT/qcadsp8380.mbn",
> +			"qcom/x1e80100/THUNDERCOMM/DEVKIT/adsp_dtbs.elf";

Thundercomm, not THUNDERCOMM. Also, which devkit? does it have some
name? Usually there is a model or a codename for a device.

> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/x1e80100/THUNDERCOMM/DEVKIT/qccdsp8380.mbn",
> +			"qcom/x1e80100/THUNDERCOMM/DEVKIT/cdsp_dtbs.elf";
> +
> +	status = "okay";
> +};
> +

[skipped]

> +
> +&usb_1_ss0_hsphy {
> +	vdd-supply = <&vreg_l3j_0p8>;
> +	vdda12-supply = <&vreg_l2j_1p2>;
> +
> +	phys = <&smb2360_0_eusb2_repeater>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_ss0_qmpphy {
> +	vdda-phy-supply = <&vreg_l3e_1p2>;
> +	vdda-pll-supply = <&vreg_l1j_0p8>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_ss0 {
> +	status = "okay";
> +};
> +
> +&usb_1_ss0_dwc3 {
> +	dr_mode = "host";

How does it match the data-role = "dual" set for connector@0? What does
UCSI report for all the ports?

> +};
> +
> +&usb_1_ss0_dwc3_hs {
> +	remote-endpoint = <&pmic_glink_ss0_hs_in>;
> +};
> +
> +&usb_1_ss0_qmpphy_out {
> +	remote-endpoint = <&pmic_glink_ss0_ss_in>;
> +};
> +
> +&usb_1_ss1_hsphy {
> +	vdd-supply = <&vreg_l3j_0p8>;
> +	vdda12-supply = <&vreg_l2j_1p2>;
> +
> +	phys = <&smb2360_1_eusb2_repeater>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_ss1_qmpphy {
> +	vdda-phy-supply = <&vreg_l3e_1p2>;
> +	vdda-pll-supply = <&vreg_l2d_0p9>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_ss1 {
> +	status = "okay";
> +};
> +
> +&usb_1_ss1_dwc3 {
> +	dr_mode = "host";
> +};
> +
> +&usb_1_ss1_dwc3_hs {
> +	remote-endpoint = <&pmic_glink_ss1_hs_in>;
> +};
> +
> +&usb_1_ss1_qmpphy_out {
> +	remote-endpoint = <&pmic_glink_ss1_ss_in>;
> +};
> +
> +&usb_1_ss2_hsphy {
> +	vdd-supply = <&vreg_l3j_0p8>;
> +	vdda12-supply = <&vreg_l2j_1p2>;
> +
> +	phys = <&smb2360_2_eusb2_repeater>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_ss2_qmpphy {
> +	vdda-phy-supply = <&vreg_l3e_1p2>;
> +	vdda-pll-supply = <&vreg_l2d_0p9>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_ss2 {
> +	status = "okay";
> +};
> +
> +&usb_1_ss2_dwc3 {
> +	dr_mode = "host";
> +};
> +
> +&usb_1_ss2_dwc3_hs {
> +	remote-endpoint = <&pmic_glink_ss2_hs_in>;
> +};
> +
> +&usb_1_ss2_qmpphy_out {
> +	remote-endpoint = <&pmic_glink_ss2_ss_in>;
> +};
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

