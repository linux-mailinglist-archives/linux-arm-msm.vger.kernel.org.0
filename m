Return-Path: <linux-arm-msm+bounces-48924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF26FA3F90B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:39:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E87119E24F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 15:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D04F8632E;
	Fri, 21 Feb 2025 15:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nrTcbptD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEAD1E87B;
	Fri, 21 Feb 2025 15:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740152068; cv=none; b=dMtx2mIeUzueSSl+Sie9KJa3Tu4dewc+PUH8xTuWOmPwv8ZFcdLtRlfcOhhfr9OciOhHa94RZsgS0ZuAS+qbqQIqP5/MuwU8A+y05AudhU79876eYRYAztC8pDiGnMlF/VUOPR8oi82c3QkbzPGTm9T4YHBgZpb53pjBSPN8Cug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740152068; c=relaxed/simple;
	bh=+Z3XfbTAZg67slX1S2nMCGuCzrMKLEVhy8QHBbbegAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MlWNF/qvFNJVlSRSDdcUIV/9Yw9YzWf3ZbBq+121/a2l037u9R0LHaSoVB87q28awvlFK6299PNuyTdEEJqRvQjmBMqZNBVnvO9DAObXA8vHSzYdHWErOXCVcPdJZkJ6czzaYsqFjGrC/sZCPFrHKCUOTJZUf+WtkgGb/zRuU4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nrTcbptD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LD0TdK012089;
	Fri, 21 Feb 2025 15:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zNGkxsDdav15OKMPklH64+1ptIhGBJSq1byiab6H0rU=; b=nrTcbptDfTv6ksZf
	dM0bbRzcQUTHCLE+NPCY7KZ5YI5T8s6S5fs7jL9lGmpz7146caARDulBxQG77xz1
	8a5FfaokHprYeyoLisxyWo7NG3/6P4mCgR0bxBycxXOjYmMt4dOVgtX/zLkFhBg6
	wjP5Mn+cctmjAOMDDo2rjqgiLtix5SQeZPQik+5yLZKi+npEWOQ4SHWyXJdF9GL0
	dI5gZIm335fLdPwBU7t7KtlQq7HO9GP1WywmToWlkWIF2ryTTB8mEEBgLLneG0Di
	a8ql2UVz86GtzqYergNvu+u2e5TGxH7Dwk3+gJXamqgZhluFckq7BIOWqIfxoRac
	EBMSrQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy1tgec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 15:34:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51LFYHus004446
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 15:34:17 GMT
Received: from [10.219.0.139] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Feb
 2025 07:34:12 -0800
Message-ID: <87f042c2-16df-4ffd-9178-9a13b4ea7acb@quicinc.com>
Date: Fri, 21 Feb 2025 21:04:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v9 1/2] arm64: dts: qcom: qcs6490-rb3gen: add and
 enable BT node
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marcel Holtmann
	<marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        <quic_mohamull@quicinc.com>, <quic_hbandi@quicinc.com>,
        <quic_anubhavg@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-bluetooth@vger.kernel.org>
References: <20250220112945.3106086-1-quic_janathot@quicinc.com>
 <20250220112945.3106086-2-quic_janathot@quicinc.com>
 <s36psuynvcak337thjcy6o532mvxrqogwutdinqodco6tzeebu@npaazdpl6qh3>
Content-Language: en-US
From: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
In-Reply-To: <s36psuynvcak337thjcy6o532mvxrqogwutdinqodco6tzeebu@npaazdpl6qh3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: C4q-OqX5UI9zA275EU6Y0zGN8b0Uy5P1
X-Proofpoint-ORIG-GUID: C4q-OqX5UI9zA275EU6Y0zGN8b0Uy5P1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_05,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 adultscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210112



On 2/21/2025 7:25 PM, Dmitry Baryshkov wrote:
> On Thu, Feb 20, 2025 at 04:59:44PM +0530, Janaki Ramaiah Thota wrote:
>> Add the PMU node for WCN6750 present on the qcs6490-rb3gen
>> board and assign its power outputs to the Bluetooth module.
>>
>> In WCN6750 module sw_ctrl and wifi-enable pins are handled
>> in the wifi controller firmware. Therefore, it is not required
>> to have those pins' entries in the PMU node.
>>
>> Signed-off-by: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 167 ++++++++++++++++++-
>>   1 file changed, 166 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index 7a36c90ad4ec..0a3243499dfb 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: BSD-3-Clause
>>   /*
>> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>   
>>   /dts-v1/;
>> @@ -34,6 +34,7 @@ / {
>>   
>>   	aliases {
>>   		serial0 = &uart5;
>> +		serial1 = &uart7;
>>   	};
>>   
>>   	chosen {
>> @@ -218,6 +219,63 @@ vph_pwr: vph-pwr-regulator {
>>   		regulator-min-microvolt = <3700000>;
>>   		regulator-max-microvolt = <3700000>;
>>   	};
>> +
>> +	wcn6750-pmu {
>> +		compatible = "qcom,wcn6750-pmu";
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&bt_en>;
> 
> pinctrl-0
> (pinctrl-1 etc.)
> pinctrl-names
> 
> 
>> +		vddaon-supply = <&vreg_s7b_0p972>;
>> +		vddasd-supply = <&vreg_l11c_2p8>;
>> +		vddpmu-supply = <&vreg_s7b_0p972>;
>> +		vddrfa0p8-supply = <&vreg_s7b_0p972>;
>> +		vddrfa1p2-supply = <&vreg_s8b_1p272>;
>> +		vddrfa1p7-supply = <&vreg_s1b_1p872>;
>> +		vddrfa2p2-supply = <&vreg_s1c_2p19>;
>> +
>> +		bt-enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
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
>> @@ -799,6 +857,39 @@ &pon_resin {
>>   	status = "okay";
>>   };
>>   
>> +&qup_uart7_cts {
>> +	/*
>> +	 * Configure a bias-bus-hold on CTS to lower power
>> +	 * usage when Bluetooth is turned off. Bus hold will
>> +	 * maintain a low power state regardless of whether
>> +	 * the Bluetooth module drives the pin in either
>> +	 * direction or leaves the pin fully unpowered.
>> +	 */
>> +	bias-bus-hold;
>> +};
>> +
>> +&qup_uart7_rts {
>> +	/* We'll drive RTS, so no pull */
>> +	drive-strength = <2>;
>> +	bias-disable;
>> +};
>> +
>> +&qup_uart7_rx {
>> +	/*
>> +	 * Configure a pull-up on RX. This is needed to avoid
>> +	 * garbage data when the TX pin of the Bluetooth module is
>> +	 * in tri-state (module powered off or not driving the
>> +	 * signal yet).
>> +	 */
>> +	bias-pull-up;
>> +};
>> +
>> +&qup_uart7_tx {
>> +	/* We'll drive TX, so no pull */
>> +	drive-strength = <2>;
>> +	bias-disable;
>> +};
>> +
>>   &qupv3_id_0 {
>>   	status = "okay";
>>   };
>> @@ -842,12 +933,86 @@ &sdhc_2 {
>>   &tlmm {
>>   	gpio-reserved-ranges = <32 2>, /* ADSP */
>>   			       <48 4>; /* NFC */
>> +
>> +	bt_en: bt-en-state {
>> +		pins = "gpio85";
>> +		function = "gpio";
>> +		output-low;
>> +		bias-disable;
>> +	};
>> +
>> +	qup_uart7_sleep_cts: qup-uart7-sleep-cts-state {
>> +		pins = "gpio28";
>> +		function = "gpio";
>> +		/*
>> +		 * Configure a bias-bus-hold on CTS to lower power
>> +		 * usage when Bluetooth is turned off. Bus hold will
>> +		 * maintain a low power state regardless of whether
>> +		 * the Bluetooth module drives the pin in either
>> +		 * direction or leaves the pin fully unpowered.
>> +		 */
>> +		bias-bus-hold;
>> +	};
>> +
>> +	qup_uart7_sleep_rts: qup-uart7-sleep-rts-state {
>> +		pins = "gpio29";
>> +		function = "gpio";
>> +		/*
>> +		 * Configure pull-down on RTS. As RTS is active low
>> +		 * signal, pull it low to indicate the BT SoC that it
>> +		 * can wakeup the system anytime from suspend state by
>> +		 * pulling RX low (by sending wakeup bytes).
>> +		 */
>> +		bias-pull-down;
>> +	};
>> +
>> +	qup_uart7_sleep_rx: qup-uart7-sleep-rx-state {
>> +		pins = "gpio31";
>> +		function = "gpio";
>> +		/*
>> +		 * Configure a pull-up on RX. This is needed to avoid
>> +		 * garbage data when the TX pin of the Bluetooth module
>> +		 * is floating which may cause spurious wakeups.
>> +		 */
>> +		bias-pull-up;
>> +	};
>> +
>> +	qup_uart7_sleep_tx: qup-uart7-sleep-tx-state {
>> +		pins = "gpio30";
>> +		function = "gpio";
>> +		/*
>> +		 * Configure pull-up on TX when it isn't actively driven
>> +		 * to prevent BT SoC from receiving garbage during sleep.
>> +		 */
>> +		bias-pull-up;
>> +	};
>>   };
>>   
>>   &uart5 {
>>   	status = "okay";
>>   };
>>   
>> +&uart7 {
>> +	/delete-property/interrupts;
> 
> Missing space before 'interrupts'.
> 
>> +	interrupts-extended = <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
>> +				<&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
> 
> Align by the opening angle bracket.
> 
>> +	pinctrl-1 =  <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>,
>> +		<&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;
> 
> Align '<' vertically.
> 
>> +	pinctrl-names = "default", "sleep";
> 
> Vertical list, please, aligned by the opening quote.
> 
> Also please add empty line before status.
> 

Thanks for the review comments Dmitry, will address all the comments in
patch v10.
Thanks,
Janakiram

