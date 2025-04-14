Return-Path: <linux-arm-msm+bounces-54176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF12A87A6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 10:30:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8FE91888061
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 08:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B895D25D20F;
	Mon, 14 Apr 2025 08:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c9Z6ujeC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC4A25A2AB;
	Mon, 14 Apr 2025 08:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744619332; cv=none; b=XmHhFAv2AlMSaJVXqukl+pmn9ZaqG3y1jgQhA631rakpEWm8Dn2+XrqYT+lW+SxQo8UwXY1SpR11y6e3BtH46794bqWnt00h2t5wtLbk3nW67wr/7DFrICVLPYr8BL8HGXh8OK/bkdVinZUiIbKHR8E4rPN7kxTP4Rp8b9QUs0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744619332; c=relaxed/simple;
	bh=ffXckLFAEntokyD5tZmTxTHpPkPxnbYqbNEtevXijA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ai6IQERhVGXIAoOJ5ZVqgrAVFQMGK+IF5Z/ulCcaO5wHkGwgggwuE+V5aQpQG+a1UMRhHHkfDr0nPCIrr3mRLO4Z+gH2sWt8wzTMZn4bdI9ZBkUaF3B7mP+YC0WFvzZ5Rq9tOAbJw4oJ3wpbGoyBqxqmk/43W7EBANSqLy9mAcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c9Z6ujeC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DNFZ7j015231;
	Mon, 14 Apr 2025 08:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sym5/oRgWVcdmGxvI50kBhVFvYYDpnJCchnP364Tvpo=; b=c9Z6ujeCt6IkUA2N
	usp4frsZqq0JlGPtL83fMSw41tX1kQiNlj/FIoK/nQ3Jysrd0GKO6WGDMtcwUdOu
	atI+S9wzoWZT+Tl3fFz4evOIlwTWSZsiYuu93EEPcAbTZEuhTjJOf+fEhnF91MI/
	13U7OvQZDYMYShrj1xThgBPdiFe3tbR0DzJgGRGx02Lg9V1CRDFgc/01xn/HXHuN
	SttNyhs/nxFU5kuR0lOyyMTT3wKhlUOXzUm99mzH9RMdpPJXbfLp9KsHRvSLpXZK
	7KkE0EbQgJlAvQPXCBP/BHeV1haRC7+9hUmf2frlMIzcvxBQxBxD79h2ikmsnd5J
	lh6qtA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vbwk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 08:28:42 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53E8SfqA012861
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 08:28:41 GMT
Received: from [10.217.199.111] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Apr
 2025 01:28:37 -0700
Message-ID: <46cd600e-b388-4225-a839-a6af76524efe@quicinc.com>
Date: Mon, 14 Apr 2025 13:58:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: Enable TSENS support for QCS615
 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <amitk@kernel.org>,
        <rafael@kernel.org>, <daniel.lezcano@linaro.org>,
        <rui.zhang@intel.com>, <lukasz.luba@arm.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <andersson@kernel.org>, <konradybcio@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_manafm@quicinc.com>
References: <cover.1744292503.git.quic_gkohli@quicinc.com>
 <76e0ce0e312f691abae7ce0fd422f73306166926.1744292503.git.quic_gkohli@quicinc.com>
 <7f893243-572b-4e23-8f2b-ae364d154107@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <quic_gkohli@quicinc.com>
In-Reply-To: <7f893243-572b-4e23-8f2b-ae364d154107@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4yztpCmde8wFKtCk9OlXGZT0O_y_1kUf
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=67fcc73a cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=3QMT7e6M7s-aR6NrdO8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4yztpCmde8wFKtCk9OlXGZT0O_y_1kUf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=735 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140060

thanks for review!

On 4/12/2025 5:13 AM, Konrad Dybcio wrote:
> On 4/10/25 4:00 PM, Gaurav Kohli wrote:
>> Add TSENS and thermal devicetree node for QCS615 SoC.
>>
>> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
>> ---
> 
> subject: "arm64: dts: qcom: qcs615: ..">  arch/arm64/boot/dts/qcom/qcs615.dtsi | 281 +++++++++++++++++++++++++++
>>   1 file changed, 281 insertions(+)
>>
will fix this.
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> index edfb796d8dd3..f0d8aed7da29 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> @@ -3668,6 +3668,17 @@ usb_2_dwc3: usb@a800000 {
>>   				maximum-speed = "high-speed";
>>   			};
>>   		};
>> +
>> +		tsens0: tsens@c222000 {
>> +			compatible = "qcom,qcs615-tsens", "qcom,tsens-v2";
>> +			reg = <0x0 0xc263000 0x0 0x1ff>,
>> +				<0x0 0xc222000 0x0 0x8>;
> Pad the address part to 8 hex digits with leading zeroes> +			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
> 
> &pdc 26
> 
>> +					<GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
> 
> &pdc 28
we don't want to mark this as wake up capable, so using this approach.
> 
> Please align the <s
> 
>> +			#qcom,sensors = <16>;
>> +			interrupt-names = "uplow", "critical";
> 
> it would make sense for interrupt-names to come right under interrupts
yes, will update in next patch set.
>> +			#thermal-sensor-cells = <1>;
>> +		};
>>   	};
>>   
>>   	arch_timer: timer {
>> @@ -3677,4 +3688,274 @@ arch_timer: timer {
>>   			     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
>>   			     <GIC_PPI 0 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
>>   	};
>> +
>> +	thermal-zones {
>> +		aoss-thermal {
>> +			thermal-sensors = <&tsens0 0>;
>> +
>> +			trips {
>> +
>> +				trip-point0 {
>> +					temperature = <110000>;
>> +					hysteresis = <5000>;
>> +					type = "passive";
>> +				};
>> +			};
>> +		};
>> +
>> +		cpuss-0-thermal {
>> +			thermal-sensors = <&tsens0 1>;
>> +
>> +			trips {
>> +
>> +				trip-point0 {
>> +					temperature = <115000>;
>> +					hysteresis = <5000>;
>> +					type = "passive";
>> +				};
>> +
>> +				trip-point1 {
>> +					temperature = <118000>;
>> +					hysteresis = <5000>;
>> +					type = "passive";
>> +				};
> 
> Please drop the passive trip point for the *CPU* tzones, see
> 

we are using trip-point 0 for cpu idle injection mitigation which i will 
add in subsequent patches, if you are fine i will add cpu idle injection 
cooling map in this series only ?
> commit 06eadce936971dd11279e53b6dfb151804137836
> ("arm64: dts: qcom: x1e80100: Drop unused passive thermal trip points for CPU")
> 
> and add a single critical point instead, see
> 
As critical shutdown is already supported by hardware, so we are not 
defining here.
> commit 03f2b8eed73418269a158ccebad5d8d8f2f6daa1
> ("arm64: dts: qcom: x1e80100: Apply consistent critical thermal shutdown")
> 
> Konrad


