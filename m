Return-Path: <linux-arm-msm+bounces-50093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF72A4D1B0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 03:30:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FFF516E34E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 02:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5712413B5A0;
	Tue,  4 Mar 2025 02:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UxP/ka4t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7564043172;
	Tue,  4 Mar 2025 02:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741055429; cv=none; b=niEfhikOQg78965GhRVE+YlOMCuGYtSkoBhJq5Lh+Rkw5hZ1C7YGZYEFB0KGkINYMDKXCIS2OQE3N7fYPuHHVixaBa7Ql+CIGqIU33TVQLHw/7b6V3pV+eC4QQc12ulNmQ0rOammUWNDmB99VOW/Lcb40awi7lCIf6O+0diws5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741055429; c=relaxed/simple;
	bh=ex56feHrmx2X0e+31CiEcI5vTAYDfJisFEioKUQRr0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=h6KQvHeo1dDwbat4FCJzqiNGvLfj3WbXJ4n8unXsiZ6m54tkZshK4W5viy2P19zv4yHY985pnyb98PkS0mUUZtfrkhdwlZpB9yfpP0ABH4S/RW6uExFb59wErxqCD5BCe5EnV3hYg0sC+qqr2jJJ17pGfiyRRdkvGuMYxq5jXUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UxP/ka4t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523NXEtT009556;
	Tue, 4 Mar 2025 02:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ohJLKKotCsVa3UHvAhZ1mVLyucJqB2FeUKEBkspj9bU=; b=UxP/ka4tLMEtr4Hz
	bsWIvRDgT88K3Bel8R1TElyyyFH/6CWFRL4ubOfwaUiAT6R41Gvvi3cSeNsLWpMN
	cEH0fu0cIMCTJyHpT7F+DKYmEF8DKcTopTZvGSs2AjQqlUpq4VUtrevfMXQs/qFD
	SLb4QVEQPwrr2H2deRN5LRdjTrf+RYV+Fi0m8Vyyb30KjXKgdEgSYDT2P6vAZJa8
	XBcJuGf8v1R/5ITTXT5tauaAlcsqkVy+JLgL6O3/tRwKTYdhy7b0JYq5+cYppxRU
	yZ7igjhNABmALXcKfJ90/pHoEfsozPVXWAbQlqews1UG5Ruw8T2ra1NA2WF/Qm8R
	uqxQkw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6wgag1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 02:30:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5242ULQw025838
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Mar 2025 02:30:21 GMT
Received: from [10.231.216.225] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Mar 2025
 18:30:18 -0800
Message-ID: <34b4859e-16c4-4661-a545-669643a9b34c@quicinc.com>
Date: Tue, 4 Mar 2025 10:30:15 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs8300-ride: enable WLAN on
 qcs8300-ride
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_miaoqing@quicinc.com>, <quic_zhichen@quicinc.com>,
        <quic_yuzha@quicinc.com>
References: <20250227065439.1407230-1-quic_stonez@quicinc.com>
 <20250227065439.1407230-3-quic_stonez@quicinc.com>
 <6wr6slqdigcrhda3aldy3iggwdhpqcb7xp54jszxksr3sli2td@h6sxf5qth27c>
Content-Language: en-US
From: Stone Zhang <quic_stonez@quicinc.com>
In-Reply-To: <6wr6slqdigcrhda3aldy3iggwdhpqcb7xp54jszxksr3sli2td@h6sxf5qth27c>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EZcyQOmC c=1 sm=1 tr=0 ts=67c665be cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=unvQHNRaX-SxzvrGyokA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: eh0LyvOEUBx5dB0OHRv5HOpa6RXL2OH4
X-Proofpoint-ORIG-GUID: eh0LyvOEUBx5dB0OHRv5HOpa6RXL2OH4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_01,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 clxscore=1011 priorityscore=1501 spamscore=0 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040020



On 2/27/2025 11:15 PM, Dmitry Baryshkov wrote:
> On Thu, Feb 27, 2025 at 02:54:39PM +0800, Stone Zhang wrote:
>> Enable WLAN on qcs8300-ride by adding a node for the PMU module
>> of the WCN6855 and assigning its LDO power outputs to the existing
>> WiFi module.
>>
>> Signed-off-by: Stone Zhang <quic_stonez@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 100 ++++++++++++++++++++++
>>   1 file changed, 100 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>> index 3e246fbc5759..e9304420c93e 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>> @@ -22,6 +22,80 @@ aliases {
>>   	chosen {
>>   		stdout-path = "serial0:115200n8";
>>   	};
>> +
>> +	vreg_conn_1p8: vreg-conn-1p8 {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg_conn_1p8";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +		startup-delay-us = <4000>;
>> +		enable-active-high;
>> +		gpio = <&pmm8650au_1_gpios 4 GPIO_ACTIVE_HIGH>;
>> +	};
>> +
>> +	vreg_conn_pa: vreg-conn-pa {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg_conn_pa";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +		startup-delay-us = <4000>;
>> +		enable-active-high;
>> +		gpio = <&pmm8650au_1_gpios 6 GPIO_ACTIVE_HIGH>;
>> +	};
>> +
>> +	wcn6855-pmu {
>> +		compatible = "qcom,wcn6855-pmu";
>> +
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&wlan_en_state>;
>> +
>> +		vddaon-supply = <&vreg_conn_pa>;
>> +		vddpmu-supply = <&vreg_conn_1p8>;
> 
> This is very incomplete. Compare it to sa8775p-ride.dtsi.
It will be completed according to the supply voltage defined in the 
power sequence driver.
> 
>> +
>> +		wlan-enable-gpios = <&tlmm 54 GPIO_ACTIVE_HIGH>;
> 
> Missing bt-enable-gpios and corresponding bluetooth node.
The BT-related changes will be placed in another change submission.
> 
>> +
>> +		regulators {
>> +			vreg_pmu_rfa_cmn: ldo0 {
>> +				regulator-name = "vreg_pmu_rfa_cmn";
>> +			};
>> +
>> +			vreg_pmu_aon_0p59: ldo1 {
>> +				regulator-name = "vreg_pmu_aon_0p59";
>> +			};
>> +
>> +			vreg_pmu_wlcx_0p8: ldo2 {
>> +				regulator-name = "vreg_pmu_wlcx_0p8";
>> +			};
>> +
>> +			vreg_pmu_wlmx_0p85: ldo3 {
>> +				regulator-name = "vreg_pmu_wlmx_0p85";
>> +			};
>> +
>> +			vreg_pmu_btcmx_0p85: ldo4 {
>> +				regulator-name = "vreg_pmu_btcmx_0p85";
>> +			};
>> +
>> +			vreg_pmu_rfa_0p8: ldo5 {
>> +				regulator-name = "vreg_pmu_rfa_0p8";
>> +			};
>> +
>> +			vreg_pmu_rfa_1p2: ldo6 {
>> +				regulator-name = "vreg_pmu_rfa_1p2";
>> +			};
>> +
>> +			vreg_pmu_rfa_1p7: ldo7 {
>> +				regulator-name = "vreg_pmu_rfa_1p7";
>> +			};
>> +
>> +			vreg_pmu_pcie_0p9: ldo8 {
>> +				regulator-name = "vreg_pmu_pcie_0p9";
>> +			};
>> +
>> +			vreg_pmu_pcie_1p8: ldo9 {
>> +				regulator-name = "vreg_pmu_pcie_1p8";
>> +			};
>> +		};
>> +	};
>>   };
>>   
>>   &apps_rsc {
>> @@ -337,6 +411,25 @@ &pcie1_phy {
>>   	status = "okay";
>>   };
>>   
>> +&pcieport0 {
>> +	wifi@0 {
>> +		compatible = "pci17cb,1103";
>> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
>> +
>> +		qcom,ath11k-calibration-variant = "QC_QCS8300_Ride";
>> +
>> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
>> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
>> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
>> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
>> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
>> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
>> +		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
>> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
>> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
>> +	};
>> +};
>> +
>>   &qupv3_id_0 {
>>   	status = "okay";
>>   };
>> @@ -446,6 +539,13 @@ perst-pins {
>>   			bias-pull-down;
>>   		};
>>   	};
>> +
>> +	wlan_en_state: wlan-en-state {
>> +		pins = "gpio54";
>> +		function = "normal";
>> +		output-low;
>> +		bias-pull-up;
>> +	};
>>   };
>>   
>>   &uart7 {
>> -- 
>> 2.45.2
>>
> 


