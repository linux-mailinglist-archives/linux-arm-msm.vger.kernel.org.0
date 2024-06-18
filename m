Return-Path: <linux-arm-msm+bounces-22979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8F890C782
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 12:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4930FB241BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 10:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1040A1BB68E;
	Tue, 18 Jun 2024 08:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eMPbv+Rn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F0E1552EB;
	Tue, 18 Jun 2024 08:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718701093; cv=none; b=rzMIP9tTZEoS7gvs4Becj1lmglAiUqxmIr2l/+KRzK/pn9+iregk1aRFMivpshzFZiAnBRCCFWY21h8n1lEDJ3MiFh7m+3K7zIgzekklxvpAmvygMygJLqNlRtmP9AF/T8E4fliWK9YUF11t82Gd/HenPVXdnKjssRjZQyKffjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718701093; c=relaxed/simple;
	bh=3W21+/H7uqXSeUl2bt/Yf5odrWTi0tOATJxnwNClTSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RnA4Vo2I9KEeqeKsPpXaaBmobyj1vikWE5aJIRLHezHGIXlJcbxBfRc52dgTefV4mLRdC8N16wirxsF4fb3yqWQmRh28AMuMtgVVbkq/yhXwzvfQa0PsNipPU+fzAUFBtRL84cqPINawnraPw6lYj7o+hqo/QWG2v4q4DeG4DB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eMPbv+Rn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45I3ZZNw029915;
	Tue, 18 Jun 2024 08:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FOCmB1tNzN+HF0fTxu3qndThVQYt4zFG9ozhTsAp/BA=; b=eMPbv+Rn8+BWp44a
	iTFCqy8ryHYHzfuimMBy3YhTps/HOMSsuSepPeoJO/aoGl/pYtiPmvDQm8RThn53
	SYgljCqRFiGjuSx4xxfDsmdL71bY56UCXW/U77LxuqAFmqBZwBkxVVwD72GuSB7l
	Z/EZZh4KpeJVFvm6nnd+XWseS6JDjjgYjm/aITaYA8g+v5ullym8KARdbrmfcwlu
	PCul3Tba2ePcqt0QWqKnuwiBaVehj+n/wEgciYwLA66UHwWA1PGh1YjXaYcTiThE
	7ECFTJmfytWfkB9+deYCLeWchf5VERBiSD/0lFrAsg/MaB6qEOKE+pSuIiznHe6a
	4KtEOw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ytfut37pe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 08:58:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45I8w6wJ029547
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 08:58:06 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 01:58:00 -0700
Message-ID: <0c10b451-792d-4f71-943e-16511f9d2a3d@quicinc.com>
Date: Tue, 18 Jun 2024 16:57:38 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/4] arm64: dts: qcom: aim300: add AIM300 AIoT
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Qiang Yu <quic_qianyu@quicinc.com>,
        Ziyue Zhang
	<quic_ziyuzhan@quicinc.com>
References: <20240618072202.2516025-1-quic_tengfan@quicinc.com>
 <20240618072202.2516025-5-quic_tengfan@quicinc.com>
 <qck3nuenuizs46an3kd2akhmadu6dwumxsv5jrg4uwk53ke4l2@vt47suphknyq>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <qck3nuenuizs46an3kd2akhmadu6dwumxsv5jrg4uwk53ke4l2@vt47suphknyq>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FxSsyrT-LB7t5rafO8ZyfwlM4KmvXrKw
X-Proofpoint-GUID: FxSsyrT-LB7t5rafO8ZyfwlM4KmvXrKw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 mlxscore=0
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406180066



On 6/18/2024 4:48 PM, Dmitry Baryshkov wrote:
> On Tue, Jun 18, 2024 at 03:22:02PM GMT, Tengfei Fan wrote:
>> Add AIM300 AIoT Carrier board DTS support, including usb, UART, PCIe,
>> I2C functions support.
>> Here is a diagram of AIM300 AIoT Carrie Board and SoM
>>   +--------------------------------------------------+
>>   |             AIM300 AIOT Carrier Board            |
>>   |                                                  |
>>   |           +-----------------+                    |
>>   |power----->| Fixed regulator |---------+          |
>>   |           +-----------------+         |          |
>>   |                                       |          |
>>   |                                       v VPH_PWR  |
>>   | +----------------------------------------------+ |
>>   | |                          AIM300 SOM |        | |
>>   | |                                     |VPH_PWR | |
>>   | |                                     v        | |
>>   | |   +-------+       +--------+     +------+    | |
>>   | |   | UFS   |       | QCS8550|     |PMIC  |    | |
>>   | |   +-------+       +--------+     +------+    | |
>>   | |                                              | |
>>   | +----------------------------------------------+ |
>>   |                                                  |
>>   |                    +----+          +------+      |
>>   |                    |USB |          | UART |      |
>>   |                    +----+          +------+      |
>>   +--------------------------------------------------+
>>
>> Co-developed-by: Qiang Yu <quic_qianyu@quicinc.com>
>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>> Co-developed-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
>> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>   .../boot/dts/qcom/qcs8550-aim300-aiot.dts     | 315 ++++++++++++++++++
>>   2 files changed, 316 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dts
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 0c1cebd16649..5576c7d6ea06 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -102,6 +102,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= qrb4210-rb2.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dts b/arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dts
>> new file mode 100644
>> index 000000000000..d4fb10149e66
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dts
>> @@ -0,0 +1,315 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/leds/common.h>
>> +#include "qcs8550-aim300.dtsi"
>> +#include "pm8010.dtsi"
>> +#include "pmr735d_a.dtsi"
>> +#include "pmr735d_b.dtsi"
>> +
>> +/ {
>> +	model = "Qualcomm Technologies, Inc. QCS8550 AIM300 AIOT";
>> +	compatible = "qcom,qcs8550-aim300-aiot", "qcom,qcs8550-aim300", "qcom,qcs8550",
>> +		     "qcom,sm8550";
>> +
>> +	aliases {
>> +		serial0 = &uart7;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +	};
>> +
>> +	gpio-keys {
>> +		compatible = "gpio-keys";
>> +
>> +		pinctrl-0 = <&volume_up_n>;
>> +		pinctrl-names = "default";
>> +
>> +		key-volume-up {
>> +			label = "Volume Up";
>> +			debounce-interval = <15>;
>> +			gpios = <&pm8550_gpios 6 GPIO_ACTIVE_LOW>;
>> +			linux,code = <KEY_VOLUMEUP>;
>> +			linux,can-disable;
>> +			wakeup-source;
>> +		};
>> +	};
>> +
>> +	pmic-glink {
>> +		compatible = "qcom,sm8550-pmic-glink", "qcom,pmic-glink";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		orientation-gpios = <&tlmm 11 GPIO_ACTIVE_HIGH>;
>> +
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
>> +					pmic_glink_hs_in: endpoint {
>> +						remote-endpoint = <&usb_1_dwc3_hs>;
>> +					};
>> +				};
>> +
>> +				port@1 {
>> +					reg = <1>;
>> +
>> +					pmic_glink_ss_in: endpoint {
>> +						remote-endpoint = <&redriver_ss_out>;
>> +					};
>> +				};
>> +
>> +				port@2 {
>> +					reg = <2>;
>> +
>> +					pmic_glink_sbu: endpoint {
>> +						remote-endpoint = <&fsa4480_sbu_mux>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	vph_pwr: regulator-vph-pwr {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vph_pwr";
>> +		regulator-min-microvolt = <3700000>;
>> +		regulator-max-microvolt = <3700000>;
>> +
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +	};
>> +};
>> +
>> +&apps_rsc {
>> +	regulators-0 {
>> +		vdd-bob1-supply = <&vph_pwr>;
>> +		vdd-bob2-supply = <&vph_pwr>;
>> +	};
>> +
>> +	regulators-3 {
>> +		vdd-s4-supply = <&vph_pwr>;
>> +		vdd-s5-supply = <&vph_pwr>;
>> +	};
>> +
>> +	regulators-4 {
>> +		vdd-s4-supply = <&vph_pwr>;
>> +	};
>> +
>> +	regulators-5 {
>> +		vdd-s1-supply = <&vph_pwr>;
>> +		vdd-s2-supply = <&vph_pwr>;
>> +		vdd-s3-supply = <&vph_pwr>;
>> +		vdd-s4-supply = <&vph_pwr>;
>> +		vdd-s5-supply = <&vph_pwr>;
>> +		vdd-s6-supply = <&vph_pwr>;
>> +	};
>> +};
>> +
>> +&i2c_hub_2 {
>> +	status = "okay";
>> +
>> +	typec-mux@42 {
>> +		compatible = "fcs,fsa4480";
>> +		reg = <0x42>;
>> +
>> +		vcc-supply = <&vreg_bob1>;
>> +
>> +		mode-switch;
>> +		orientation-switch;
>> +
>> +		port {
>> +			fsa4480_sbu_mux: endpoint {
>> +				remote-endpoint = <&pmic_glink_sbu>;
>> +			};
>> +		};
>> +	};
>> +
>> +	typec-retimer@1c {
>> +		compatible = "onnn,nb7vpq904m";
>> +		reg = <0x1c>;
>> +
>> +		vcc-supply = <&vreg_l15b_1p8>;
>> +
>> +		orientation-switch;
>> +		retimer-switch;
>> +
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +
>> +				redriver_ss_out: endpoint {
>> +					remote-endpoint = <&pmic_glink_ss_in>;
>> +				};
>> +			};
>> +
>> +			port@1 {
>> +				reg = <1>;
>> +
>> +				redriver_ss_in: endpoint {
>> +					data-lanes = <3 2 1 0>;
>> +					remote-endpoint = <&usb_dp_qmpphy_out>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&mdss_dsi0 {
>> +	status = "okay";
>> +
>> +	panel@0 {
>> +		compatible = "visionox,vtdr6130";
>> +		reg = <0>;
>> +
>> +		pinctrl-0 = <&dsi_active>, <&te_default>;
>> +		pinctrl-1 = <&dsi_suspend>, <&te_default>;
>> +		pinctrl-names = "default", "sleep";
>> +
>> +		reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
>> +
>> +		vci-supply = <&vreg_l13b_3p0>;
>> +		vdd-supply = <&vreg_l11b_1p2>;
>> +		vddio-supply = <&vreg_l12b_1p8>;
>> +
>> +		port {
>> +			panel0_in: endpoint {
>> +				remote-endpoint = <&mdss_dsi0_out>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&mdss_dsi0_out {
>> +	remote-endpoint = <&panel0_in>;
>> +	data-lanes = <0 1 2 3>;
>> +};
>> +
>> +&mdss_dsi0_phy {
>> +	status = "okay";
>> +};
>> +
>> +&pcie0 {
>> +	status = "okay";
>> +};
>> +
>> +&pcie0_phy {
>> +	status = "okay";
>> +};
>> +
>> +&pcie1 {
>> +	status = "okay";
>> +};
>> +
>> +&pcie1_phy {
>> +	status = "okay";
>> +};
>> +
>> +&pm8550_gpios {
>> +	volume_up_n: volume-up-n-state {
>> +		pins = "gpio6";
>> +		function = "normal";
>> +		power-source = <1>;
>> +		bias-pull-up;
>> +		input-enable;
>> +	};
>> +};
>> +
>> +&pon_pwrkey {
>> +	status = "okay";
>> +};
>> +
>> +&pon_resin {
>> +	linux,code = <KEY_VOLUMEDOWN>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&qupv3_id_0 {
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_adsp {
>> +	firmware-name = "qcom/qcs8550/adsp.mbn",
>> +			"qcom/qcs8550/adsp_dtbs.mbn";
> 
> adsp_dtb.mbn, not _dtbs.mbn.
> 
> https://lore.kernel.org/linux-arm-msm/s5gt3p6zsd5ebrkop4dhd33tykln33f6ahu3pibymecxsmakyd@lg5wfgec6dat/

Previously, I observed different names in the comments and the patch, 
and I initially think that "_dtb" is a clerical error. However, I now 
realize that this is my mistake, and I will update "_dtbs" with "_dtb" 
in the next verion patch series.

> 
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_cdsp {
>> +	firmware-name = "qcom/qcs8550/cdsp.mbn",
>> +			"qcom/qcs8550/cdsp_dtbs.mbn";
>> +	status = "okay";
>> +};
>> +
>> +&swr1 {
>> +	status = "okay";
>> +};
>> +
>> +&swr2 {
>> +	status = "okay";
>> +};
>> +
>> +&tlmm {
>> +	gpio-reserved-ranges = <32 8>;
>> +
>> +	dsi_active: dsi-active-state {
>> +		pins = "gpio133";
>> +		function = "gpio";
>> +		drive-strength = <8>;
>> +		bias-disable;
>> +	};
>> +
>> +	dsi_suspend: dsi-suspend-state {
>> +		pins = "gpio133";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-pull-down;
>> +	};
>> +
>> +	te_default: te-default-state {
>> +		pins = "gpio86";
>> +		function = "mdp_vsync";
>> +		drive-strength = <2>;
>> +		bias-pull-down;
>> +	};
>> +};
>> +
>> +&uart7 {
>> +	status = "okay";
>> +};
>> +
>> +&usb_1 {
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_dwc3_hs {
>> +	remote-endpoint = <&pmic_glink_hs_in>;
>> +};
>> +
>> +&usb_1_hsphy {
>> +	status = "okay";
>> +};
>> +
>> +&usb_dp_qmpphy {
>> +	status = "okay";
>> +};
>> +
>> +&usb_dp_qmpphy_out {
>> +	remote-endpoint = <&redriver_ss_in>;
>> +};
>> -- 
>> 2.25.1
>>
> 

-- 
Thx and BRs,
Tengfei Fan

