Return-Path: <linux-arm-msm+bounces-52268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B212A6D4D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 08:16:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F092F7A3F9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 07:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BEBC2512D0;
	Mon, 24 Mar 2025 07:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OFt5tfT+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72935250C04;
	Mon, 24 Mar 2025 07:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742800583; cv=none; b=S0jZsJmCxnHGp7D7Zy1Jya3baxPQLQ2aqpzUiihJCLUmakg3zCpUn0xjUPR4nlWj6DONY/HBelPi535OseTtv0tRCCENaSkWuXugpy9CCMJq5BsUj4Vemp6KlB4XpdfTUgpQrDdCMlWC/DaW+K6vHlPOU3E8NTgPKmtiJIvfZyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742800583; c=relaxed/simple;
	bh=fs8CzO1K9MjTFGnpsaH21J3uneP81UTm6gTR0JK4478=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=skANtmYg44aV07xYVf9VOtu9g8RvYUeHWZvDUla2alVa/2SYhmYVHeCR5prIvdn+uZIUWoT3kuTTiPCkEi6NfCr0uI8npsoeMDKZ/Wh0SiBNrxhLRhfjDLEWc78ImvJra9GixA6S4IzxRmm8cpEBRLMoxuMVsNeAtwqtaMHb6JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OFt5tfT+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O6cTMe022710;
	Mon, 24 Mar 2025 07:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L2fUcpJuoMYMYBv2me7UrE3bL9Ib1bHjvNUviqyRdA0=; b=OFt5tfT+GxSP44gn
	ELaOcUgJ3AuWOAe1aayDiu/BppoFLt90s52Qgq2NhTbSCzHrXnPYpQXBvi8CV+Wm
	NwzhVEJ1mvf6aD4IgUXdPYvs8a+/tbEIapbZYFMfIWUGHZD42l+eShYmm3BxigGZ
	RWOr0l9g+PXfJ6+g19aZUcY39lfPK1BG6fTJ9rk8D/8XHXEbWkhzu1GapWrM6gMK
	4aiqXY1SFHyWTwtNeZKtcSFo0STOaWEeQ6AFZ3vfXLHJbslbUyfOet3+gEjjDL2B
	CEC/Fqnom3wGOKIX7VXHI16SFrAuFuBJ9Oiye0s/vt0Xolp2BbEKVPSpOySiddHA
	69jeiw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hmhk3ecj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 07:16:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52O7GIpG022422
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 07:16:18 GMT
Received: from [10.231.216.225] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Mar
 2025 00:16:14 -0700
Message-ID: <e085027f-2ec9-439a-be07-66f2cad1baaf@quicinc.com>
Date: Mon, 24 Mar 2025 15:16:12 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs8300-ride: enable WLAN on
 qcs8300-ride
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_miaoqing@quicinc.com>, <quic_zhichen@quicinc.com>,
        <quic_yuzha@quicinc.com>
References: <20250318093350.2682132-1-quic_stonez@quicinc.com>
 <20250318093350.2682132-3-quic_stonez@quicinc.com>
 <fhpsphwz65dlsqhyycwabofamacynshz5e5ez4gafkmdain5dp@32dpgc5mrhdr>
Content-Language: en-US
From: Stone Zhang <quic_stonez@quicinc.com>
In-Reply-To: <fhpsphwz65dlsqhyycwabofamacynshz5e5ez4gafkmdain5dp@32dpgc5mrhdr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=C4PpyRP+ c=1 sm=1 tr=0 ts=67e106c3 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=d2MxNM1SO2chPncIAK4A:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: WbAHe_Oht4L-SFvuHzJPq03Q3oRNoYfV
X-Proofpoint-ORIG-GUID: WbAHe_Oht4L-SFvuHzJPq03Q3oRNoYfV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_03,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=892 priorityscore=1501 impostorscore=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240052



On 3/19/2025 6:13 PM, Dmitry Baryshkov wrote:
> On Tue, Mar 18, 2025 at 05:33:50PM +0800, Stone Zhang wrote:
>> Enable WLAN on qcs8300-ride by adding a node for the PMU module
>> of the WCN6855 and assigning its LDO power outputs to the existing
>> WiFi module.
>>
>> Signed-off-by: Stone Zhang <quic_stonez@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 108 ++++++++++++++++++++++
>>   1 file changed, 108 insertions(+)
>>
>> @@ -320,6 +402,25 @@ &pcie1_phy {
>>   	status = "okay";
>>   };
>>   
>> +&pcieport0 {
>> +	wifi@0 {
>> +		compatible = "pci17cb,1103";
>> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
>> +
>> +		qcom,ath11k-calibration-variant = "QC_QCS8300_Ride";
> 
> Almost missed it. What is your baseline? Krzysztof has sent his
> qcom,calibration-variant patches [1] in February. Bjorn has picked them
> up on March 4th.
> 
> This needs to be rebased on top of [1].
Understood.
> 
> [1] https://lore.kernel.org/linux-arm-msm/20250225-dts-qcom-wifi-calibration-v1-0-347e9c72dcfc@linaro.org/
> 
>> +
>> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
>> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
>> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
>> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
>> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
>> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
>> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
>> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
>> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
>> +	};
>> +};
>> +
>>   &qupv3_id_0 {
>>   	status = "okay";
>>   };


