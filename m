Return-Path: <linux-arm-msm+bounces-39089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 017649D8575
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 13:32:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6068284BCE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 12:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D69199EB7;
	Mon, 25 Nov 2024 12:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jvjMcojI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F6518AFC;
	Mon, 25 Nov 2024 12:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732537973; cv=none; b=PGB9PCnW209GMCi3bNEwq5UwEhzQ9rhLuoNpQkhNJFZ4rVqylOuQ6CYYrV0iU8GVrw5CVt918KXy/j+oQKx92cD0a5GElEATFtiNalz3QEk8o0sn4sq8k8JHpW1dmVdlh1LdqaCaagYWs7Sy2p4PfUgLKPkhZfb1Pkuc9Rm5y3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732537973; c=relaxed/simple;
	bh=MKM5BNtsaEvnc+u6Bsi/hfyUiNrhnoueqiJalymbdVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qsUXgT1PJq2PjG6OEfH/SRKtBUi0xF2QbSb7o0D43shQFhLjgSEChKKiQ8/k8uW1ppya09klK66jH97GoRqugsgOxpFHu4iMH2hcAlCqgYPtne1mM/8qmnFFp0abwMx4ikzirobK5qVNDFoosMHXeQbCOxQZaNSMLT88EcIWGjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jvjMcojI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APApYgF017784;
	Mon, 25 Nov 2024 12:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i5SDqL2/0vA/GjsTc6ViAivrXQCVLAtlqde9t09nRrg=; b=jvjMcojICzjeOfY8
	8UMiLLk7wckW/cod4wldOdq49V9cAUto8/zHRjGAuWdmi+yD7gorXn7akJK3ASJW
	N14Vf5Ry2VJCDQug2VE7QR3H+TUalTvrbn9k5rz2c2nSttKZHjyrpKlzHWeWz4vn
	yUeyD6pypmGlXsvYMn0WGitL2ystYvM4zRNXTH2mPL7udtc27cX4J/FEqznFx3dN
	AzgK78T4p8quvE+UuwUK7PrhJ5QmnJoNLbxOrCTgLxMmUFCm1HESynScZI9rlus1
	eYQ4sahn71zqgFNEc5ix19Iosot6Fo7Td0fN6VWDDPyXW868XvQGN5rl64pWEuuP
	aAQNCw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 433dny42y7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 12:32:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4APCWkD0016719
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 12:32:46 GMT
Received: from [10.214.66.218] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 25 Nov
 2024 04:32:43 -0800
Message-ID: <6ebf5fcc-011c-4984-ac5b-8139d0da8588@quicinc.com>
Date: Mon, 25 Nov 2024 18:02:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: qdu/qru1000-idp: Fix the voltage
 setting
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241119070812.16079-1-quic_kbajaj@quicinc.com>
 <orvnnjclxlwrab34daxrepn3m3la3heogkxbncl44yjyn3wxkt@vnp4knb5nedo>
Content-Language: en-US
From: Komal Bajaj <quic_kbajaj@quicinc.com>
In-Reply-To: <orvnnjclxlwrab34daxrepn3m3la3heogkxbncl44yjyn3wxkt@vnp4knb5nedo>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2NRacCmB3DpaXEXbpF68RqEKVt95wl87
X-Proofpoint-ORIG-GUID: 2NRacCmB3DpaXEXbpF68RqEKVt95wl87
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 suspectscore=0 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=530 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250107

On 11/20/2024 5:27 PM, Dmitry Baryshkov wrote:
> On Tue, Nov 19, 2024 at 12:38:11PM +0530, Komal Bajaj wrote:
>> While adding the USB support, it was found that the configuration
>> for regulator smps5 was incorrectly set. Upon cross verifying for
>> all the regulators, found that smps4, smps6 and smps8 are also
>> incorrectly configured. The patch corrects these configurations.
>>
>> In particular -
>> - smps4 is 1.574V min and 2.04V max
>> - smps5 is 1.2V min and 1.4V max
>> - smps6 is 0.382V min and 1.12V max
>> - smps8 is fixed at 0.752V
> Could you please comment whether your values represent the min/max
> supported by the regulators themselves or the shared min/max by all the
> devices powered by the corresponding regulator?

values represent the min/max supported by the regulators themselves


>> Fixes: d1f2cfe2f669 ("arm64: dts: qcom: Add base QDU1000/QRU1000 IDP DTs")
>> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
>> ---
>> Changes in v3 -
>> * Minor nit pick in commit message
>> * Link to v2: https://lore.kernel.org/all/20240524082236.24112-1-quic_kbajaj@quicinc.com/
>>
>> Changes in v2-
>> * Updated the commit message as suggested by Krzysztof
>> * Link to v1: https://lore.kernel.org/linux-arm-msm/20240514131038.28036-1-quic_kbajaj@quicinc.com/
>> ---
>>   arch/arm64/boot/dts/qcom/qdu1000-idp.dts | 16 ++++++++--------
>>   arch/arm64/boot/dts/qcom/qru1000-idp.dts | 16 ++++++++--------
>>   2 files changed, 16 insertions(+), 16 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
>> index e65305f8136c..6e8f9007068b 100644
>> --- a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
>> @@ -96,20 +96,20 @@ vreg_s3a_1p05: smps3 {
>>
>>   		vreg_s4a_1p8: smps4 {
>>   			regulator-name = "vreg_s4a_1p8";
>> -			regulator-min-microvolt = <1800000>;
>> -			regulator-max-microvolt = <1800000>;
>> +			regulator-min-microvolt = <1574000>;
>> +			regulator-max-microvolt = <2040000>;
>>   		};
>>
>>   		vreg_s5a_2p0: smps5 {
>>   			regulator-name = "vreg_s5a_2p0";
>> -			regulator-min-microvolt = <1904000>;
>> -			regulator-max-microvolt = <2000000>;
>> +			regulator-min-microvolt = <1200000>;
>> +			regulator-max-microvolt = <1400000>;
> Having 2.0 V regulator with the range of 1.2V - 1.4V is strange.

The configuration for this regulator was incorrectly set, as its nominal 
range is 1.2 V.

There was no scenario utilizing this regulator, but we discovered this 
misconfiguration while enabling USB.


>
>>   		};
>>
>>   		vreg_s6a_0p9: smps6 {
>>   			regulator-name = "vreg_s6a_0p9";
>> -			regulator-min-microvolt = <920000>;
>> -			regulator-max-microvolt = <1128000>;
>> +			regulator-min-microvolt = <382000>;
>> +			regulator-max-microvolt = <1120000>;
> The same applies to this regulator, 0.9V usually can not go to 0.382 V
> and still let the devices to continue working.


This regulator supports a minimum voltage, but it won't actually drop to 
that level. The previous voltage values did not align with the Power Grid.


>
>>   		};
>>
>>   		vreg_s7a_1p2: smps7 {
>> @@ -120,8 +120,8 @@ vreg_s7a_1p2: smps7 {
>>
>>   		vreg_s8a_1p3: smps8 {
>>   			regulator-name = "vreg_s8a_1p3";
>> -			regulator-min-microvolt = <1352000>;
>> -			regulator-max-microvolt = <1352000>;
>> +			regulator-min-microvolt = <752000>;
>> +			regulator-max-microvolt = <752000>;
> 1.3V at 0.752V?


same applies here as well.


Thanks

Komal


>
>>   		};
>>
>>   		vreg_l1a_0p91: ldo1 {
>> diff --git a/arch/arm64/boot/dts/qcom/qru1000-idp.dts b/arch/arm64/boot/dts/qcom/qru1000-idp.dts
>> index 1c781d9e24cf..8b0ddc187ca0 100644
>> --- a/arch/arm64/boot/dts/qcom/qru1000-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/qru1000-idp.dts
>> @@ -96,20 +96,20 @@ vreg_s3a_1p05: smps3 {
>>
>>   		vreg_s4a_1p8: smps4 {
>>   			regulator-name = "vreg_s4a_1p8";
>> -			regulator-min-microvolt = <1800000>;
>> -			regulator-max-microvolt = <1800000>;
>> +			regulator-min-microvolt = <1574000>;
>> +			regulator-max-microvolt = <2040000>;
>>   		};
>>
>>   		vreg_s5a_2p0: smps5 {
>>   			regulator-name = "vreg_s5a_2p0";
>> -			regulator-min-microvolt = <1904000>;
>> -			regulator-max-microvolt = <2000000>;
>> +			regulator-min-microvolt = <1200000>;
>> +			regulator-max-microvolt = <1400000>;
>>   		};
>>
>>   		vreg_s6a_0p9: smps6 {
>>   			regulator-name = "vreg_s6a_0p9";
>> -			regulator-min-microvolt = <920000>;
>> -			regulator-max-microvolt = <1128000>;
>> +			regulator-min-microvolt = <382000>;
>> +			regulator-max-microvolt = <1120000>;
>>   		};
>>
>>   		vreg_s7a_1p2: smps7 {
>> @@ -120,8 +120,8 @@ vreg_s7a_1p2: smps7 {
>>
>>   		vreg_s8a_1p3: smps8 {
>>   			regulator-name = "vreg_s8a_1p3";
>> -			regulator-min-microvolt = <1352000>;
>> -			regulator-max-microvolt = <1352000>;
>> +			regulator-min-microvolt = <752000>;
>> +			regulator-max-microvolt = <752000>;
>>   		};
>>
>>   		vreg_l1a_0p91: ldo1 {
>> --
>> 2.46.0
>>

