Return-Path: <linux-arm-msm+bounces-33195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E11AD99199B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 20:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10E4F1C20E90
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 18:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77E215CD55;
	Sat,  5 Oct 2024 18:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CJQR+C77"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4C815B968;
	Sat,  5 Oct 2024 18:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728153860; cv=none; b=A6yh5mpZJ+mZvvW+daGl+iQoPeWUJhj0d9RDpN/NdFXxRXxpdvlnoS42/iZfBaJnDVT9MnqjqEkAs6Dkw/7VVUxyeeMVTZgRBHCVKF1C74R7Wk0g9HMSfMhppPFNWV0TOq9QF6h7QMQEuDEh62BdcomSCNNVtqHHfiWnFJr3big=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728153860; c=relaxed/simple;
	bh=wB7Un9VRp7HvKwMQk8Fh1uTsZm2QX+Z1Y4BOWsemTkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JMGd1WJ5qBBL5Qslc7ELMiIGdlVYMniqllB4Wzg/fG+b0rJwptxfmEDcVheGL47SCiMyoWjt8RE5Sm6xcbSqV+1OOANBMXvvcJ8S3ihp0HDokwFJHsdjpD3AxO38ra4IFVCVvvZqriKkRTbQn0LU15dHiQHvNC0mQst7W0tn+FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CJQR+C77; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 495HmXmo016227;
	Sat, 5 Oct 2024 18:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	POBJ5T37OzO6X+3S+s8VGfO4mcLHZPulkYvOlT3iUDg=; b=CJQR+C77JRZl2CmY
	CU5YZEIZqjzaq+8qg/btiffDNo/fp9I8uIjQCthc2boZBhscqznrjnHDqGyUbXni
	ZoZ8j4abwde2uCoHKEGTM3JYz8r6DbdEA2Pxu7ahHP+YYUrWtpxww5zECZRkMFhH
	fz/cWFsxJ5jV4rCCATF0VUFS3a+uiC1US/7LG4+XaIILwHypSzRbEJqHLc4XxpdD
	QNqdleOLiEk1kRxoxVJU/c2hHopMF6j58LiZhv9DPjce5ZoU7jWlbYEU/WEnICDm
	P4fnT4g8XyZDja1oHv+IcyT4ztuYXuuJ+2JoNTbCzgEjcHz9yHd9cvXWjl+JriOG
	oh2BTA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xtb0y5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 05 Oct 2024 18:44:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 495Ihukr006256
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 5 Oct 2024 18:43:56 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 5 Oct 2024
 11:43:51 -0700
Message-ID: <a657c632-b231-6f62-a45b-300921208582@quicinc.com>
Date: Sun, 6 Oct 2024 00:13:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for
 Windows
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <krzk+dt@kernel.org>,
        <robh+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <conor+dt@kernel.org>, <abel.vesa@linaro.org>,
        <srinivas.kandagatla@linaro.org>
References: <20240911073337.90577-1-quic_sibis@quicinc.com>
 <20240911073337.90577-3-quic_sibis@quicinc.com>
 <pt4wtycddqhcvw2iblaojmzsdggmlafft4vu6lg5j2vstbhbqj@acenyi5k3yeq>
Content-Language: en-US
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <pt4wtycddqhcvw2iblaojmzsdggmlafft4vu6lg5j2vstbhbqj@acenyi5k3yeq>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GcEwr8aoNccsadRJh14RmwdWH2i9XVJe
X-Proofpoint-GUID: GcEwr8aoNccsadRJh14RmwdWH2i9XVJe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410050137



On 9/11/24 13:25, Dmitry Baryshkov wrote:
> On Wed, Sep 11, 2024 at 01:03:37PM GMT, Sibi Sankar wrote:
>> Add initial support for x1e001de devkit platform. This includes:
>>
>> -DSPs
>> -Ethernet (RTL8125BG) over the pcie 5 instance.
>> -NVme
>> -Wifi
>> -USB-C ports
>>

Hey Dmitry,

Thanks for taking time to review the series!

>> Link: https://www.qualcomm.com/news/releases/2024/05/qualcomm-accelerates-development-for-copilot--pcs-with-snapdrago
>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile            |   1 +
>>   arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 813 +++++++++++++++++++
>>   2 files changed, 814 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
>>
> 
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index ae002c7cf126..1cbc7b91389d 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -268,6 +268,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk-display-card.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e78100-lenovo-thinkpad-t14s.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-asus-vivobook-s15.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-crd.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
>> new file mode 100644
>> index 000000000000..07b4e60d9b66
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
>> @@ -0,0 +1,813 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>> +
>> +#include "x1e80100.dtsi"
>> +#include "x1e80100-pmics.dtsi"
>> +
>> +/ {
>> +	model = "Qualcomm Technologies, Inc. X1E001DE Snapdragon Devkit for Windows";
>> +	compatible = "qcom,x1e001de-devkit", "qcom,x1e001de", "qcom,x1e80100";
>> +
>> +	aliases {
>> +		serial0 = &uart21;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +	};
>> +
>> +	pmic-glink {
>> +		compatible = "qcom,x1e80100-pmic-glink",
>> +			     "qcom,sm8550-pmic-glink",
>> +			     "qcom,pmic-glink";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
>> +				    <&tlmm 123 GPIO_ACTIVE_HIGH>,
>> +				    <&tlmm 125 GPIO_ACTIVE_HIGH>;
>> +
>> +		/* Back panel port closer to the RJ45 connector */
>> +		connector@0 {
>> +			compatible = "usb-c-connector";
>> +			reg = <0>;
>> +			power-role = "dual";
>> +			data-role = "dual";
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +
>> +					pmic_glink_ss0_hs_in: endpoint {
>> +						remote-endpoint = <&usb_1_ss0_dwc3_hs>;
>> +					};
>> +				};
>> +
>> +				port@1 {
>> +					reg = <1>;
>> +
>> +					pmic_glink_ss0_ss_in: endpoint {
>> +						remote-endpoint = <&usb_1_ss0_qmpphy_out>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +
>> +		/* Back panel port closer to the audio jack */
>> +		connector@1 {
>> +			compatible = "usb-c-connector";
>> +			reg = <1>;
>> +			power-role = "dual";
>> +			data-role = "dual";
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +
>> +					pmic_glink_ss1_hs_in: endpoint {
>> +						remote-endpoint = <&usb_1_ss1_dwc3_hs>;
>> +					};
>> +				};
>> +
>> +				port@1 {
>> +					reg = <1>;
>> +
>> +					pmic_glink_ss1_ss_in: endpoint {
>> +						remote-endpoint = <&usb_1_ss1_qmpphy_out>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +
>> +		/* Front panel port */
>> +		connector@2 {
>> +			compatible = "usb-c-connector";
>> +			reg = <2>;
>> +			power-role = "dual";
>> +			data-role = "dual";
>> +
> 
> [trimmed]
> 
>> +
>> +&pcie5 {
>> +	perst-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
>> +	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
>> +
>> +	vddpe-3v3-supply = <&vreg_wwan>;
> 
> Please use pwrseq instead.
> 
>> +
>> +	pinctrl-0 = <&pcie5_default>;
>> +	pinctrl-names = "default";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&pcie5_phy {
>> +	vdda-phy-supply = <&vreg_l3i_0p8>;
>> +	vdda-pll-supply = <&vreg_l3e_1p2>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&pcie6a {
>> +	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
>> +	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
>> +
>> +	vddpe-3v3-supply = <&vreg_nvme>;
> 
> Please use pwrseq instead.
> 
>> +
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pcie6a_default>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&pcie6a_phy {
>> +	vdda-phy-supply = <&vreg_l1d_0p8>;
>> +	vdda-pll-supply = <&vreg_l2j_1p2>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&qupv3_0 {
>> +	status = "okay";
>> +};
>> +
>> +&qupv3_1 {
>> +	status = "okay";
>> +};
>> +
>> +&qupv3_2 {
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_adsp {
>> +	firmware-name = "qcom/x1e80100/devkit/qcadsp8380.mbn",
>> +			"qcom/x1e80100/devkit/adsp_dtbs.elf";
> 
> qcom/SoC/Vendor/Device/foo.ext. Here the Vendor part is missing.
> 
>> +
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_cdsp {
>> +	firmware-name = "qcom/x1e80100/devkit/qccdsp8380.mbn",
>> +			"qcom/x1e80100/devkit/cdsp_dtbs.elf";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&smb2360_0_eusb2_repeater {
>> +	vdd18-supply = <&vreg_l3d_1p8>;
>> +	vdd3-supply = <&vreg_l2b_3p0>;
>> +};
>> +
>> +&smb2360_1_eusb2_repeater {
>> +	vdd18-supply = <&vreg_l3d_1p8>;
>> +	vdd3-supply = <&vreg_l14b_3p0>;
>> +};
>> +
>> +&smb2360_2 {
>> +	status = "okay";
>> +};
>> +
>> +&smb2360_2_eusb2_repeater {
>> +	vdd18-supply = <&vreg_l3d_1p8>;
>> +	vdd3-supply = <&vreg_l8b_3p0>;
>> +};
>> +
>> +&tlmm {
>> +	gpio-reserved-ranges = <34 2>, /* Unused */
>> +			       <44 4>, /* SPI (TPM) */
>> +			       <238 1>; /* UFS Reset */
> 
> A comment would be nice. Usually the GPIOs are reserved because
> accessing them is forbidden by TZ / hyp. Is this the case for the Unused
> GPIOs? And why is the UFS reset marked as reserved?

I went back and figured out that 34,35 and 238 are no longer reserved.
It might be the case for other devices as well. I'll fix that.

> 
>> +
>> +	nvme_reg_en: nvme-reg-en-state {
>> +		pins = "gpio18";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	pcie4_default: pcie4-default-state {
>> +		clkreq-n-pins {
>> +			pins = "gpio147";
>> +			function = "pcie4_clk";
>> +			drive-strength = <2>;
>> +			bias-pull-up;
>> +		};
>> +
>> +		perst-n-pins {
>> +			pins = "gpio146";
>> +			function = "gpio";
>> +			drive-strength = <2>;
>> +			bias-disable;
>> +		};
>> +
>> +		wake-n-pins {
>> +			pins = "gpio148";
>> +			function = "gpio";
>> +			drive-strength = <2>;
>> +			bias-pull-up;
>> +		};
>> +	};
>> +
>> +	pcie5_default: pcie5-default-state {
>> +		clkreq-n-pins {
>> +			pins = "gpio150";
>> +			function = "pcie5_clk";
>> +			drive-strength = <2>;
>> +			bias-pull-up;
>> +		};
>> +
>> +		perst-n-pins {
>> +			pins = "gpio149";
>> +			function = "gpio";
>> +			drive-strength = <2>;
>> +			bias-disable;
>> +		};
>> +
>> +		wake-n-pins {
>> +			pins = "gpio151";
>> +			function = "gpio";
>> +			drive-strength = <2>;
>> +			bias-pull-up;
>> +		};
>> +	};
>> +
>> +	pcie6a_default: pcie6a-default-state {
>> +		clkreq-n-pins {
>> +			pins = "gpio153";
>> +			function = "pcie6a_clk";
>> +			drive-strength = <2>;
>> +			bias-pull-up;
>> +		};
>> +
>> +		perst-n-pins {
>> +			pins = "gpio152";
>> +			function = "gpio";
>> +			drive-strength = <2>;
>> +			bias-disable;
>> +		};
>> +
>> +		wake-n-pins {
>> +			pins = "gpio154";
>> +			function = "gpio";
>> +			drive-strength = <2>;
>> +			bias-pull-up;
>> +		};
>> +	};
>> +
>> +	wwan_sw_en: wwan-sw-en-state {
>> +		pins = "gpio221";
>> +		function = "gpio";
>> +		drive-strength = <4>;
>> +		bias-disable;
>> +	};
>> +};
>> +
>> +&uart21 {
>> +	compatible = "qcom,geni-debug-uart";
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_ss0_hsphy {
>> +	vdd-supply = <&vreg_l3j_0p8>;
>> +	vdda12-supply = <&vreg_l2j_1p2>;
>> +
>> +	phys = <&smb2360_0_eusb2_repeater>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_ss0_qmpphy {
>> +	vdda-phy-supply = <&vreg_l3e_1p2>;
>> +	vdda-pll-supply = <&vreg_l1j_0p8>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_ss0 {
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_ss0_dwc3 {
>> +	dr_mode = "host";
>> +};
>> +
>> +&usb_1_ss0_dwc3_hs {
>> +	remote-endpoint = <&pmic_glink_ss0_hs_in>;
>> +};
>> +
>> +&usb_1_ss0_qmpphy_out {
>> +	remote-endpoint = <&pmic_glink_ss0_ss_in>;
>> +};
>> +
>> +&usb_1_ss1_hsphy {
>> +	vdd-supply = <&vreg_l3j_0p8>;
>> +	vdda12-supply = <&vreg_l2j_1p2>;
>> +
>> +	phys = <&smb2360_1_eusb2_repeater>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_ss1_qmpphy {
>> +	vdda-phy-supply = <&vreg_l3e_1p2>;
>> +	vdda-pll-supply = <&vreg_l2d_0p9>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_ss1 {
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_ss1_dwc3 {
>> +	dr_mode = "host";
> 
> All three USB-C connectors have data-role set to "dual". So this needs a
> comment.

Docs show that only port0 supports DRD. Will fix it in v2.

-Sibi

> 
>> +};
>> +
>> +&usb_1_ss1_dwc3_hs {
>> +	remote-endpoint = <&pmic_glink_ss1_hs_in>;
>> +};
>> +
>> +&usb_1_ss1_qmpphy_out {
>> +	remote-endpoint = <&pmic_glink_ss1_ss_in>;
>> +};
>> +
>> +&usb_1_ss2_hsphy {
>> +	vdd-supply = <&vreg_l3j_0p8>;
>> +	vdda12-supply = <&vreg_l2j_1p2>;
>> +
>> +	phys = <&smb2360_2_eusb2_repeater>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_ss2_qmpphy {
>> +	vdda-phy-supply = <&vreg_l3e_1p2>;
>> +	vdda-pll-supply = <&vreg_l2d_0p9>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_ss2 {
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_ss2_dwc3 {
>> +	dr_mode = "host";
>> +};
>> +
>> +&usb_1_ss2_dwc3_hs {
>> +	remote-endpoint = <&pmic_glink_ss2_hs_in>;
>> +};
>> +
>> +&usb_1_ss2_qmpphy_out {
>> +	remote-endpoint = <&pmic_glink_ss2_ss_in>;
>> +};
>> -- 
>> 2.34.1
>>
> 

