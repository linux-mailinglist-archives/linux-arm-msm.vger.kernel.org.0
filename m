Return-Path: <linux-arm-msm+bounces-37451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A1B9C3A03
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 09:50:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBBC02811F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 08:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F88015B115;
	Mon, 11 Nov 2024 08:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kVBxRecD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB66A158520;
	Mon, 11 Nov 2024 08:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731315026; cv=none; b=qaccshVO/Oo4iZ2peTDpwMaOxthVoMK94YMVw1MgWS24qjJDSk2DimTv30WqxCxOT0jjfKdnrkLAv831n4q1kCdnalYAOaBQxUm18ZZXIBYiko51v4YEUU3iWBYUURfWSAjQdFBDkejXNBmnkd+cNVy3ym/VD8Nn+jN9LK2HtJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731315026; c=relaxed/simple;
	bh=lG8o1MKTlVVfSUAngj5g1ZCsLFqYs+QWdnIionqECK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Qwhhdj3UvcHQjGsbWEugoHrmzQ5ooOWYa/e+ajjhn/iMFZ/JH2ketKMAGbC7l/QZFFvtaQLSQ/Fpp2UtHtA9D0m7Y/5lHSNEZ9ggTpUeaRx3iSLUM/M8xyFMm0jo6ITl+1BnwDnn1uauT9zN0KEv3Fd0Lj3kzSq+lhgECyeIkZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kVBxRecD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AANUbrs018369;
	Mon, 11 Nov 2024 08:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FNQ5/IJzmWYuZGXtdgzqHNiFonh0j3afUAUHqheW2RM=; b=kVBxRecDXXcq3f2O
	faECaGc6m3Vot54xXThy4P2Xym3Mc4+tjUZwDK+t51JuzKOMnpYH7azQnuEfuirM
	jyB+QaNVQoVv6zK64xmxFklYSHvDnjy+/A2sPyBTDVeYYlXOzzIcUsBUvZthw69D
	FX5Mx3fD6k57Q/PljffGh1mNRfX2AuAJEdWrNRY8hoFyLb8fbttk1Tu9kcEhEofP
	HUNisYPEkC4hkG5it+XIXEKyp09QMXrAPrQ3VjfOJXAZ5jfI7mwzr1qn7dnoSQ+7
	mhtPAf/MfF4kUA1ih0la2ATXbhsd2IDZjXx4wZeZ1Q4C9hP+7Yi9l8NAfOqZeDBE
	SsKoCA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42syy23pyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 08:50:21 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AB8oLxx027422
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 08:50:21 GMT
Received: from [10.216.36.177] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 11 Nov
 2024 00:50:17 -0800
Message-ID: <9de51e90-635c-4990-bad1-0a7fd9ba6d88@quicinc.com>
Date: Mon, 11 Nov 2024 14:20:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: qcs615: Add QUPv3 configuration
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_msavaliy@quicinc.com>, <quic_anupkulk@quicinc.com>
References: <20241011103346.22925-1-quic_vdadhani@quicinc.com>
 <b7a24d5b-bb0f-4eb5-8830-f32701cb94d1@kernel.org>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <b7a24d5b-bb0f-4eb5-8830-f32701cb94d1@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: S-Wf5ElBu-CMiJ4ONwggc7uJLcU8_Zdt
X-Proofpoint-ORIG-GUID: S-Wf5ElBu-CMiJ4ONwggc7uJLcU8_Zdt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411110074



On 10/28/2024 5:03 PM, Krzysztof Kozlowski wrote:
> On 11/10/2024 12:33, Viken Dadhaniya wrote:
>> Add DT support for QUPv3 Serial Engines.
>>
>> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> ---
>>
>> Build Dependencies:
>>
>> Base:
>> https://lore.kernel.org/linux-devicetree/20240926-add_initial_support_for_qcs615-v3-5-e37617e91c62@quicinc.com/
>> https://lore.kernel.org/linux-devicetree/20240926-add_initial_support_for_qcs615-v3-6-e37617e91c62@quicinc.com/
>>
>> Clock: https://lore.kernel.org/linux-devicetree/20240920-qcs615-clock-driver-v2-3-2f6de44eb2aa@quicinc.com/
>> ICC: https://lore.kernel.org/linux-devicetree/20240924143958.25-2-quic_rlaggysh@quicinc.com/
>> Apps SMMU: https://lore.kernel.org/all/20241011063112.19087-1-quic_qqzhou@quicinc.com/
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615.dtsi | 602 ++++++++++++++++++++++++++-
>>   1 file changed, 598 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> index 865ead601f85..9d7fc6fc5c6e 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> @@ -5,6 +5,7 @@
>>   
>>   #include <dt-bindings/clock/qcom,qcs615-gcc.h>
>>   #include <dt-bindings/clock/qcom,rpmh.h>
>> +#include <dt-bindings/dma/qcom-gpi.h>
>>   #include <dt-bindings/interconnect/qcom,icc.h>
>>   #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>> @@ -17,6 +18,21 @@
>>   	#address-cells = <2>;
>>   	#size-cells = <2>;
>>   
>> +	aliases {
>> +		i2c1 = &i2c1;
>> +		i2c2 = &i2c2;
>> +		i2c3 = &i2c3;
>> +		i2c4 = &i2c4;
>> +		i2c5 = &i2c5;
>> +		i2c6 = &i2c6;
>> +		i2c7 = &i2c7;
>> +		spi2 = &spi2;
>> +		spi4 = &spi4;
>> +		spi6 = &spi6;
>> +		spi7 = &spi7;
>> +		serial0 = &uart0;
> 
> Bus aliases are not supposed to be specific to SoC. Drop them from SoC DTSI.

Sure, Updated in v3.

> 
>> +	};
>> +
>>   	cpus {
>>   		#address-cells = <2>;
>>   		#size-cells = <0>;
>> @@ -296,6 +312,25 @@
>>   		qcom,bcm-voters = <&apps_bcm_voter>;
>>   	};
>>   
>> +	qup_opp_table: opp-table-qup {
>> +		compatible = "operating-points-v2";
>> +
>> +		opp-75000000 {
>> +			opp-hz = /bits/ 64 <75000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +		};
>> +
>> +		opp-100000000 {
>> +			opp-hz = /bits/ 64 <100000000>;
>> +			required-opps = <&rpmhpd_opp_svs>;
>> +		};
>> +
>> +		opp-128000000 {
>> +			opp-hz = /bits/ 64 <128000000>;
>> +			required-opps = <&rpmhpd_opp_nom>;
>> +		};
>> +	};
>> +
>>   	psci {
>>   		compatible = "arm,psci-1.0";
>>   		method = "smc";
>> @@ -392,6 +427,24 @@
>>   			#size-cells = <1>;
>>   		};
>>   
>> +		gpi_dma0: qcom,gpi-dma@800000  {
> 
> That's again downstream code. Do not send us stuff from downstream.
> 

Sure. updated in v3.

> 
> 
> 
> Best regards,
> Krzysztof
> 

