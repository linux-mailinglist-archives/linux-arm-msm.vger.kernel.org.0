Return-Path: <linux-arm-msm+bounces-52269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AA0A6D4F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 08:22:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CEBD16C702
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 07:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27832250BEB;
	Mon, 24 Mar 2025 07:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Tukkuj9h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696EC2505A5;
	Mon, 24 Mar 2025 07:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742800938; cv=none; b=oW5Q8m0sSKXRrS1HFH61XQlUl3YXfWL1WptsL+UdfEG9Miv17krL2HbVeeuBCVSbjKtqdydpg3ea1rZNpC2MNfhHauzAbRsZJ3GFGFFj5c5VNHLTkQVfbhL/Ts4D9tFs4bbm1mcTa8nAIee5k4mfX1I6JT++c9ONLFOzxm7gKBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742800938; c=relaxed/simple;
	bh=GD8mUBTlaCk9XHl24Tc35Y+NinCF+coEPAtI6DhQv2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=c4mzP8pngLU+ULwPL3KloXo1QX+wDMoCSZ358I3ZOtD6unfktoQVQI8ulE/VW3rGKYK32I48skuSz1RQuMUmaFBJ30ZFS7z3lKa02Seh7h0jqkrG8EEaSbUEcoVOOd3MUQcbEtQKZEdDH/8StiWGzrSUmy3ecE1gd+o1yIWX/NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Tukkuj9h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O6c27D000529;
	Mon, 24 Mar 2025 07:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fiBK3k2MO0T9Nq+cnZNmVgQOcY1jGw6wYPK3Cg4ZuNU=; b=Tukkuj9hlbJzOe5l
	XGDDLgOVmvFXhJlQRtSS+gQJg6173ABOzqSsmZBs8D2XtlNG7YRlLmkC50No3qqC
	m7Esi4ZcrKTaoomxaxat2I89Swzdh+RmZ7VUH5Zr0b/f3+yWXbGxnL32hnMl6hds
	f7b1lGFuo4QWIjAREmQctRx929IUozLvHbV/Kxxfe8HC2qiL/U1Awuz/fb9FlDv5
	jOrOExFdyNaE4wKRLDBW+iTEDLem4EbjEfYuffRv+nj8F2htD77lDelCGas1YjFM
	bFyJIVPhKdLtVFpxjSDxIA3iIyMrny7Cl5uWlSLPUTLckgzB9XsmdmBULpa8x3st
	zgfXgg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hn9wbdjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 07:22:00 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52O7LxIK027659
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 07:21:59 GMT
Received: from [10.233.19.224] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Mar
 2025 00:21:56 -0700
Message-ID: <70db6155-a230-4f9c-a2e1-2c872c87cd39@quicinc.com>
Date: Mon, 24 Mar 2025 15:21:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: x1e80100-qcp: Add power control
 and sideband signals for PCIe3
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <quic_qianyu@quicinc.com>, <sfr@canb.auug.org.au>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250320055502.274849-1-quic_wenbyao@quicinc.com>
 <w7mbnqG7DHPCH6hVoSu4E2p8pV7Rw6uvurlK-CUxF7TYQ53fFyagxmLUCmCTfG0DOUgIQn7GdppXgBlq8Gyv9Q==@protonmail.internalid>
 <20250320055502.274849-4-quic_wenbyao@quicinc.com>
 <54c588be-d630-4901-8885-a042b477f168@linaro.org>
Content-Language: en-US
From: "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>
In-Reply-To: <54c588be-d630-4901-8885-a042b477f168@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rSKfBKjZoSF1N6qxinMMgdaZVnSNQaYe
X-Proofpoint-ORIG-GUID: rSKfBKjZoSF1N6qxinMMgdaZVnSNQaYe
X-Authority-Analysis: v=2.4 cv=CPoqXQrD c=1 sm=1 tr=0 ts=67e10818 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=d_BdsECxPa-TM83sDTsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_03,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240052

On 3/21/2025 6:08 AM, Bryan O'Donoghue wrote:
> On 20/03/2025 05:55, Wenbin Yao wrote:
>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>
>> Add perst, wake and clkreq sideband signals and required regulators in
>> PCIe3 controller and PHY device tree node. Describe the voltage rails of
>> the x8 PCI slots for PCIe3 port.
>>
>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 119 ++++++++++++++++++++++
>>   1 file changed, 119 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts 
>> b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
>> index 28086a2bc..9cd313802 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
>> @@ -318,6 +318,48 @@ vreg_wcn_3p3: regulator-wcn-3p3 {
>>           regulator-boot-on;
>>       };
>>
>> +    vreg_pcie_12v: regulator-pcie_12v {
>> +        compatible = "regulator-fixed";
>> +
>> +        regulator-name = "VREG_PCIE_12V";
>> +        regulator-min-microvolt = <12000000>;
>> +        regulator-max-microvolt = <12000000>;
>> +
>> +        gpio = <&pm8550ve_8_gpios 8 GPIO_ACTIVE_HIGH>;
>> +        enable-active-high;
>> +
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&pcie_x8_12v>;
>> +    };
>> +
>> +    vreg_pcie_3v3_aux: regulator-pcie_3v3_aux {
>> +        compatible = "regulator-fixed";
>> +
>> +        regulator-name = "VREG_PCIE_3P3_AUX";
>> +        regulator-min-microvolt = <3300000>;
>> +        regulator-max-microvolt = <3300000>;
>> +
>> +        gpio = <&pmc8380_3_gpios 8 GPIO_ACTIVE_HIGH>;
>> +        enable-active-high;
>> +
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&pm_sde7_aux_3p3_en>;
>> +    };
>> +
>> +    vreg_pcie_3v3: regulator-pcie_3v3 {
>> +        compatible = "regulator-fixed";
>> +
>> +        regulator-name = "VREG_PCIE_3P3";
>> +        regulator-min-microvolt = <3300000>;
>> +        regulator-max-microvolt = <3300000>;
>> +
>> +        gpio = <&pmc8380_3_gpios 6 GPIO_ACTIVE_HIGH>;
>> +        enable-active-high;
>> +
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&pm_sde7_main_3p3_en>;
>> +};
>> +
>>       usb-1-ss0-sbu-mux {
>>           compatible = "onnn,fsusb42", "gpio-sbu-mux";
>>
>> @@ -907,6 +949,60 @@ &mdss_dp3_phy {
>>       status = "okay";
>>   };
>>
>> +&pm8550ve_8_gpios {
>> +    pcie_x8_12v: pcie-12v-default-state {
>> +        pins = "gpio8";
>> +        function = "normal";
>> +        output-enable;
>> +        output-high;
>> +        bias-pull-down;
>> +        power-source = <0>;
>> +    };
>> +};
>> +
>> +&pmc8380_3_gpios {
>> +    pm_sde7_aux_3p3_en: pcie-aux-3p3-default-state {
>> +        pins = "gpio8";
>> +        function = "normal";
>> +        output-enable;
>> +        output-high;
>> +        bias-pull-down;
>> +        power-source = <0>;
>> +    };
>> +
>> +    pm_sde7_main_3p3_en: pcie-main-3p3-default-state {
>> +        pins = "gpio6";
>> +        function = "normal";
>> +        output-enable;
>> +        output-high;
>> +        bias-pull-down;
>> +        power-source = <0>;
>> +    };
>> +};
>> +
>> +&pcie3 {
>> +
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&pcie3_default>;
>> +    perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
>> +    wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
>> +    status = "okay";
>> +};
>> +
>> +&pcie3_phy {
>> +    vdda-phy-supply = <&vreg_l3j_0p8>;
>> +    vdda-pll-supply = <&vreg_l3e_1p2>;
>> +    vdda-qref-supply = <&vreg_l3c_0p8>;
>> +
>> +    status = "okay";
>> +};
>> +
>> +&pcie3port {
>> +    vpcie12v-supply = <&vreg_pcie_12v>;
>> +    vpcie3v3-supply = <&vreg_pcie_3v3>;
>> +    vpcie3v3aux-supply = <&vreg_pcie_3v3_aux>;
>> +};
>> +
>>   &pcie4 {
>>       perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
>>       wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
>> @@ -1118,6 +1214,29 @@ nvme_reg_en: nvme-reg-en-state {
>>           bias-disable;
>>       };
>>
>> +    pcie3_default: pcie3-default-state {
>> +        clkreq-n-pins {
>> +            pins = "gpio144";
>> +            function = "pcie3_clk";
>> +            drive-strength = <2>;
>> +            bias-pull-up;
>> +        };
>> +
>> +        perst-n-pins {
>> +            pins = "gpio143";
>> +            function = "gpio";
>> +            drive-strength = <2>;
>> +            bias-pull-down;
>> +        };
>> +
>> +        wake-n-pins {
>> +               pins = "gpio145";
>> +               function = "gpio";
>> +               drive-strength = <2>;
>> +               bias-pull-up;
>> +        };
>> +    };
>> +
>>       pcie4_default: pcie4-default-state {
>>           clkreq-n-pins {
>>               pins = "gpio147";
>> -- 
>> 2.34.1
>>
>>
>
> Recommend breaking this patch into at least two patches @ the and
>
> -> Add power control
> -> Add sideband signals
>
> if your patch title requires an and its usually a good indicator of a 
> place to break that patch into different parts.

Will fix in the next version.

>
> ---
> bod

-- 
With best wishes
Wenbin


