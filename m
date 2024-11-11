Return-Path: <linux-arm-msm+bounces-37466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 940F89C3F4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 14:10:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 585BA281C2A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 13:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2EB71850AF;
	Mon, 11 Nov 2024 13:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Hb4zRtgD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D94158558;
	Mon, 11 Nov 2024 13:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731330654; cv=none; b=i5EKPvkM/v1IUPgCWHCrjKiqOtPQwtpEuyrqSFxO7VmVrVq2TU6rzyJJU6/A/mUSPzQh0MystBNZTDwqLmmANcDKHZIFoqSNkDCkMVmSsV4WUrdcLDA6dx73718Aj1UJwnmSPBnll5uuC4hUTbLu2hR6VSjnQhQeIVY79foDvog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731330654; c=relaxed/simple;
	bh=wWHR7bs35f2vdoRdhXPOdikZVKoprunC6yrOLchHhAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=B2eG4r9YyUbRqic0MQaGbF+Q12C2cgq0UFjQ2PjeSdLtwWkA6G0jXv1lD4+6NlXlSBYsqypwQci7E+Q0TWdJrN/IwoHShoFp5p3uwI1Z8IedPLj2/EGYe9KGVUrhaoI3Da6DQzrsCZk2HvK6/2PP1iUnvHDhxwka8YANG2lGDFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Hb4zRtgD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABBw3aJ029346;
	Mon, 11 Nov 2024 13:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nf0D9y54gYtwN/iNSPv35cVmT6TVnmuzWnaH0IDfGEw=; b=Hb4zRtgDiDVbU5tE
	kvor9BjPLwgjKDDV/pG9L22sLGAPHdbKteT0kJL5dHLCFJ2Roe1dbo09hVfDrkru
	a+Rfksi7Fs/Nwjre4hwkwKVTPlkmznTYOQ0XasXJG3Bg0ZAAudO44gR5QwrB4pJU
	E1X+wMDiDNP8pncQQTbj5NzWwABDOddJANu9pgrUGQuqhYk+YrHa/73968nTvbDD
	b2KO3AisIcS2enodN0zj4A/cjyJTyvevUYpkk8jZJEgU6B9APyluZBu77aUN0fEA
	utswOFbLnTyGzBug0EvVIijYmBBXu6j8mGH/DKAU2hnRIB6P5Vym96YHuGFmeof0
	fUMSww==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sxr5vbab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 13:10:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ABDAaqG031427
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 13:10:36 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 11 Nov
 2024 05:10:31 -0800
Message-ID: <74c78910-f49d-4818-8b55-3ec370894602@quicinc.com>
Date: Mon, 11 Nov 2024 18:40:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sa8775p: Add support to scale
 DDR/L3
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran
 Shaik" <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya Kakitapalli" <quic_skakitap@quicinc.com>
References: <20241017-sa8775p-cpufreq-l3-ddr-scaling-v1-0-074e0fb80b33@quicinc.com>
 <20241017-sa8775p-cpufreq-l3-ddr-scaling-v1-1-074e0fb80b33@quicinc.com>
 <f9191c4d-a41b-463b-959d-14152cce080e@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <f9191c4d-a41b-463b-959d-14152cce080e@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0e5MOjKRwMDC6ABcIW83tDG_qa81ukHo
X-Proofpoint-GUID: 0e5MOjKRwMDC6ABcIW83tDG_qa81ukHo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 mlxlogscore=864 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411110109



On 10/18/2024 4:22 AM, Konrad Dybcio wrote:
> On 17.10.2024 11:28 AM, Jagadeesh Kona wrote:
>> Add support to scale DDR and L3 based on CPU frequencies
>> on SA8775P platform.
>>
>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 33 +++++++++++++++++++++++++++++++++
>>  1 file changed, 33 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> index 06bf2ba556b89b643da901857a9aa7cdc7ba90cc..d8b90bd4b1f05604185f015929a1f296799ad6a4 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> @@ -4,6 +4,7 @@
>>   */
>>  
>>  #include <dt-bindings/interconnect/qcom,icc.h>
>> +#include <dt-bindings/interconnect/qcom,osm-l3.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>  #include <dt-bindings/clock/qcom,rpmh.h>
>>  #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
>> @@ -47,6 +48,10 @@ CPU0: cpu@0 {
>>  			next-level-cache = <&L2_0>;
>>  			capacity-dmips-mhz = <1024>;
>>  			dynamic-power-coefficient = <100>;
>> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
> 
> Please align the '&'s and squash with patch 2. This one doesn't cause
> much difference on its own, which makes the commit message misleading
> 
> Konrad

Thanks Konrad for your review. Sure will take care of this in next series.

Thanks,
Jagadeesh

