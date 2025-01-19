Return-Path: <linux-arm-msm+bounces-45502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9558A1613E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 11:38:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 492A518861DE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 10:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BAF51A725C;
	Sun, 19 Jan 2025 10:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a3EPqmzV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCED13C80E;
	Sun, 19 Jan 2025 10:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737283113; cv=none; b=UIziuuZkBIQWhi7abXhzpEewEMYJteevqe48ATDSnejTNgbovXhuiXbicDxGSX73UniLbR+XfFrSkeOO/aFslPrPxO4zitzeG5Pz6E7md9xeFGJsvOoS6pfeCNSZFDVekNfUQHHHtPGsGEOL7rgCPUiS3m6ZyiJ5sohafOIPf54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737283113; c=relaxed/simple;
	bh=TWRppRiRl7+ff+DUJ+RcM3e5Orlu4jtCCnqnLQZMCtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=u0McqpvI3cIrJt3KFPPqIijEopLhPMyo543lmVsAJYGlV/iEyZ9bVrxPeppMjXdroelIr7xand/ENzz6illPMH0nHFSu/Cy2iOFT8LITRd5aPoKOpfXqjiThtqZXmcLrGyYjtasnQnir4h+3E3QeiVaW78KXBYixi7Hkv7er6nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a3EPqmzV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50JAOKQd021957;
	Sun, 19 Jan 2025 10:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H1s2wUBKcAIYwyA0pnMvGuHeN4EbNzqV744YNhosl6A=; b=a3EPqmzVujFOz8od
	RJIH6sKZGkbCs5/lCBEF3n/PxgxbbNRpR0pi1dCubNKz4NE1hA1TWUhGpDv57N1n
	yaCC0TcKhUFhZchXQkhUv6zbUt8nr/XeHLb5drq5VHCrbWv+wTxXDPsfCuLXWPAJ
	s1gxPKgMXFXFxOdJ/HReh+IOy7TgNY9E7aYmIGQoImi/5ySlgOBeN+UsV05KYbyV
	uSeKouHrDuDp5oB0BOyU0M1+O4YzLVkurbD466CCz3jrqUcp3plS/FD6nNWGEVvC
	Y7xuwLPyiWECWtnWXM0tbtDRhv/028ki1XpGsh++6D7FgDezjFdFGc7+N4GOsBoi
	VOHUQA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4484h19vws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 10:38:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50JAcRmN024855
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 10:38:27 GMT
Received: from [10.216.35.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 19 Jan
 2025 02:38:23 -0800
Message-ID: <71635b71-71e4-4c17-add1-bf41ce770632@quicinc.com>
Date: Sun, 19 Jan 2025 16:08:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add cpu scaling clock node
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com>
 <20241108-qcs615-mm-dt-nodes-v1-2-b2669cac0624@quicinc.com>
 <cgg3s6f555eb4jl5segz7irwx2kkza7w6zucfyo7myrbjhng3v@2qmyrobzakhd>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <cgg3s6f555eb4jl5segz7irwx2kkza7w6zucfyo7myrbjhng3v@2qmyrobzakhd>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hu3b5rSfPbKc1KZAiuHNekXvn3suSMtK
X-Proofpoint-GUID: hu3b5rSfPbKc1KZAiuHNekXvn3suSMtK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-18_10,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501190086



On 11/9/2024 5:30 AM, Dmitry Baryshkov wrote:
> On Fri, Nov 08, 2024 at 11:54:05AM +0530, Taniya Das wrote:
>> Add cpufreq-hw node to support cpu frequency scaling.
> 
> CPU, not cpu.
> Also the prefix is incorrect for both patches.
> 

Will update to CPU.

>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615.dtsi | 29 +++++++++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> index 8c98ac77dc5c665ef296e65ac76c1b59be485abb..2c61da790e78b131e454991c968ece40dd5ca56d 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> @@ -33,6 +33,8 @@ cpu0: cpu@0 {
>>   			power-domains = <&cpu_pd0>;
>>   			power-domain-names = "psci";
>>   			next-level-cache = <&l2_0>;
>> +			clocks = <&cpufreq_hw 0>;
>> +			qcom,freq-domain = <&cpufreq_hw 0>;
>>   			#cooling-cells = <2>;
>>   
>>   			l2_0: l2-cache {
>> @@ -51,6 +53,8 @@ cpu1: cpu@100 {
>>   			power-domains = <&cpu_pd1>;
>>   			power-domain-names = "psci";
>>   			next-level-cache = <&l2_100>;
>> +			clocks = <&cpufreq_hw 0>;
>> +			qcom,freq-domain = <&cpufreq_hw 0>;
>>   
>>   			l2_100: l2-cache {
>>   			      compatible = "cache";
>> @@ -68,6 +72,8 @@ cpu2: cpu@200 {
>>   			power-domains = <&cpu_pd2>;
>>   			power-domain-names = "psci";
>>   			next-level-cache = <&l2_200>;
>> +			clocks = <&cpufreq_hw 0>;
>> +			qcom,freq-domain = <&cpufreq_hw 0>;
>>   
>>   			l2_200: l2-cache {
>>   			      compatible = "cache";
>> @@ -85,6 +91,8 @@ cpu3: cpu@300 {
>>   			power-domains = <&cpu_pd3>;
>>   			power-domain-names = "psci";
>>   			next-level-cache = <&l2_300>;
>> +			clocks = <&cpufreq_hw 0>;
>> +			qcom,freq-domain = <&cpufreq_hw 0>;
>>   
>>   			l2_300: l2-cache {
>>   			      compatible = "cache";
>> @@ -102,6 +110,8 @@ cpu4: cpu@400 {
>>   			power-domains = <&cpu_pd4>;
>>   			power-domain-names = "psci";
>>   			next-level-cache = <&l2_400>;
>> +			clocks = <&cpufreq_hw 0>;
>> +			qcom,freq-domain = <&cpufreq_hw 0>;
>>   
>>   			l2_400: l2-cache {
>>   			      compatible = "cache";
>> @@ -119,6 +129,8 @@ cpu5: cpu@500 {
>>   			power-domains = <&cpu_pd5>;
>>   			power-domain-names = "psci";
>>   			next-level-cache = <&l2_500>;
>> +			clocks = <&cpufreq_hw 0>;
>> +			qcom,freq-domain = <&cpufreq_hw 0>;
>>   
>>   			l2_500: l2-cache {
>>   			      compatible = "cache";
>> @@ -136,6 +148,8 @@ cpu6: cpu@600 {
>>   			power-domains = <&cpu_pd6>;
>>   			power-domain-names = "psci";
>>   			next-level-cache = <&l2_600>;
>> +			clocks = <&cpufreq_hw 1>;
>> +			qcom,freq-domain = <&cpufreq_hw 1>;
>>   			#cooling-cells = <2>;
>>   
>>   			l2_600: l2-cache {
>> @@ -154,6 +168,8 @@ cpu7: cpu@700 {
>>   			power-domains = <&cpu_pd7>;
>>   			power-domain-names = "psci";
>>   			next-level-cache = <&l2_700>;
>> +			clocks = <&cpufreq_hw 1>;
>> +			qcom,freq-domain = <&cpufreq_hw 1>;
>>   
>>   			l2_700: l2-cache {
>>   			      compatible = "cache";
>> @@ -729,6 +745,19 @@ rpmhpd_opp_turbo_l1: opp-9 {
>>   		};
>>   	};
>>   
>> +	cpufreq_hw: cpufreq@18323000 {
>> +		compatible = "qcom,cpufreq-hw";
> 
> This doesn't follow the bindings, does it?

I will add and re-use the closest target compatible.

> 
>> +		reg = <0 0x18323000 0 0x1400>,
>> +		      <0 0x18325800 0 0x1400>;
>> +		reg-names = "freq-domain0", "freq-domain1";
>> +
>> +		clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
>> +		clock-names = "xo", "alternate";
> 
> Are the DCVSH interrupts?
> 
This target does not have DCVSH interrupts directly connected to the 
CPUFREQ-HW.

>> +
>> +		#freq-domain-cells = <1>;
>> +		#clock-cells = <1>;
>> +	};
>> +
>>   	arch_timer: timer {
>>   		compatible = "arm,armv8-timer";
>>   		interrupts = <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
>>
>> -- 
>> 2.45.2
>>
> 

-- 
Thanks & Regards,
Taniya Das.


