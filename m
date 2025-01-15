Return-Path: <linux-arm-msm+bounces-45154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD201A12B88
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 20:09:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02E8E1885F83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 19:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075B61D63D4;
	Wed, 15 Jan 2025 19:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AVAS/iep"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B551C24A7CC;
	Wed, 15 Jan 2025 19:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736968177; cv=none; b=QkpQ3fRuk7xPyKJxbNujOldppZpPNaV9rEe0xfnqfjrGl4ThRlLaKdtrvS9d41gkeJ5Dlycq0/0wdhTXR4sE+KeKv1AhdKqduThmSthTPdUcvsKFRn07R98mc+JxKYOIlTJI+ss5qFcSdjU27Ufe4Cu4FAEuTg4bFYj++Ac7634=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736968177; c=relaxed/simple;
	bh=D4ux0L/wRVzc0uqJED/mlhtMpy/qn4a5eYlmFq/u5qQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cKD917Biz8SHRPXi1qi5jYaSGRxDNJjZGbNQL88Z+y4SDkJiolhBiiWvm9mpQCKhTw6ljFLaoyEx/JHUDt4h5ywxCndyGPZPmnh3E8yU02KuIC4B55l22DxZZcDVp8I8wkoixn1hRr81V2qWYdfda1CTj+USth6iUG0BPnnbmUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AVAS/iep; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50FGqjDq019418;
	Wed, 15 Jan 2025 19:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ZZbuurAXSU51+q98A+V16YviXERee+aw2dCYQIXy3g=; b=AVAS/iepagvbPhEV
	ajG5me1XfNy86oY6lW34/uVOAlAVeFEqGoSl1iC9v2gDvVcmYLqYuFo/cuSlTwGI
	ezX15zLKSANKzQwODkrXaQcRjITHYPU8rci88yXtI31ZZ5cS3+RKxTW18gG7zO88
	BqbY3nQB6Lx9lvLOo9KUhikmRdmU6MPot/tXSKqZIWz8zkjQ3cBshkWW/QE/RSC3
	QFMenU/BTeWMckDn+nCvDo4DYKwSMF9+1r4+JlhiK25UiY/7sOtWs0OwDueTDUqh
	je1hHPn/bnHeciEV0FxWNheniet+mZmYFaZ1HlSlA3tS/XBENr7xb/4TgSXqso+a
	GRToYQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446gx38aq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 19:09:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50FJ9Stq021627
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 19:09:28 GMT
Received: from [10.216.6.163] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 Jan
 2025 11:09:25 -0800
Message-ID: <82f44295-a3c9-487c-98db-916cdc30fc4f@quicinc.com>
Date: Thu, 16 Jan 2025 00:39:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8650: setup gpu thermal with
 higher temperatures
To: <neil.armstrong@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250110-topic-sm8650-thermal-cpu-idle-v2-0-5787ad79abbb@linaro.org>
 <20250110-topic-sm8650-thermal-cpu-idle-v2-2-5787ad79abbb@linaro.org>
 <8fc3b958-5c2f-4c79-8dc0-d1eec9f5e47d@quicinc.com>
 <c09192f4-30ae-4dd8-bc88-2aaf02088374@linaro.org>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <c09192f4-30ae-4dd8-bc88-2aaf02088374@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2yotSXbNp0kVI6UDZoNF3NVVXM_bjooh
X-Proofpoint-ORIG-GUID: 2yotSXbNp0kVI6UDZoNF3NVVXM_bjooh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_09,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150138

On 1/13/2025 4:15 PM, Neil Armstrong wrote:
> Hi,
> 
> On 13/01/2025 11:28, Akhil P Oommen wrote:
>> On 1/10/2025 4:06 PM, Neil Armstrong wrote:
>>> On the SM8650, the dynamic clock and voltage scaling (DCVS) for the GPU
>>> is done in an hardware controlled loop by the GPU Management Unit (GMU).
>>>
>>> Since the GMU does a better job at maintaining the GPUs temperature
>>> in an
>>> acceptable range by taking in account more parameters like the die
>>> characteristics or other internal sensors, it makes no sense to try
>>> and reproduce a similar set of constraints with the Linux devfreq
>>> thermal
>>> core.
>>
>> Just FYI, this description is incorrect. SM8650's GMU doesn't do any
>> sort of thermal management.
> 
> Ok, thx for confirming this, in our tests the temperature steadily stayed
> at a max trip point when setting them higher. But perhaps it's a side
> effect
> of other mitigations.
> 
> Are the new trip points still ok ? they are derived from the downstream DT.

I don't have expertise on the thermal side. But in my non-expert
opinion, it is fine to use a similar configuration from downstream.

-Akhil.

> 
> Thanks,
> Neil
> 
>>
>> -Akhil.
>>
>>>
>>> Instead, set higher temperatures in the GPU trip points corresponding to
>>> the temperatures provided by Qualcomm in the dowstream source, which
>>> will
>>> trigger the devfreq thermal core if the GMU cannot handle the
>>> temperature
>>> surge, and try our best to avoid reaching the critical temperature trip
>>> point which should trigger an inevitable thermal shutdown.
>>>
>>> Fixes: 497624ed5506 ("arm64: dts: qcom: sm8650: Throttle the GPU when
>>> overheating")
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 48 +++++++++++++++++
>>> +------------------
>>>   1 file changed, 24 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/
>>> dts/qcom/sm8650.dtsi
>>> index
>>> 95509ce2713d4fcc3dbe0c5cd5827312d5681af4..e9fcf05cb084b7979ecf0f4712fed332e9f4b07a 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>> @@ -6173,19 +6173,19 @@ map0 {
>>>                 trips {
>>>                   gpu0_alert0: trip-point0 {
>>> -                    temperature = <85000>;
>>> +                    temperature = <95000>;
>>>                       hysteresis = <1000>;
>>>                       type = "passive";
>>>                   };
>>>                     trip-point1 {
>>> -                    temperature = <90000>;
>>> +                    temperature = <115000>;
>>>                       hysteresis = <1000>;
>>>                       type = "hot";
>>>                   };
>>>                     trip-point2 {
>>> -                    temperature = <110000>;
>>> +                    temperature = <125000>;
>>>                       hysteresis = <1000>;
>>>                       type = "critical";
>>>                   };
>>> @@ -6206,19 +6206,19 @@ map0 {
>>>                 trips {
>>>                   gpu1_alert0: trip-point0 {
>>> -                    temperature = <85000>;
>>> +                    temperature = <95000>;
>>>                       hysteresis = <1000>;
>>>                       type = "passive";
>>>                   };
>>>                     trip-point1 {
>>> -                    temperature = <90000>;
>>> +                    temperature = <115000>;
>>>                       hysteresis = <1000>;
>>>                       type = "hot";
>>>                   };
>>>                     trip-point2 {
>>> -                    temperature = <110000>;
>>> +                    temperature = <125000>;
>>>                       hysteresis = <1000>;
>>>                       type = "critical";
>>>                   };
>>> @@ -6239,19 +6239,19 @@ map0 {
>>>                 trips {
>>>                   gpu2_alert0: trip-point0 {
>>> -                    temperature = <85000>;
>>> +                    temperature = <95000>;
>>>                       hysteresis = <1000>;
>>>                       type = "passive";
>>>                   };
>>>                     trip-point1 {
>>> -                    temperature = <90000>;
>>> +                    temperature = <115000>;
>>>                       hysteresis = <1000>;
>>>                       type = "hot";
>>>                   };
>>>                     trip-point2 {
>>> -                    temperature = <110000>;
>>> +                    temperature = <125000>;
>>>                       hysteresis = <1000>;
>>>                       type = "critical";
>>>                   };
>>> @@ -6272,19 +6272,19 @@ map0 {
>>>                 trips {
>>>                   gpu3_alert0: trip-point0 {
>>> -                    temperature = <85000>;
>>> +                    temperature = <95000>;
>>>                       hysteresis = <1000>;
>>>                       type = "passive";
>>>                   };
>>>                     trip-point1 {
>>> -                    temperature = <90000>;
>>> +                    temperature = <115000>;
>>>                       hysteresis = <1000>;
>>>                       type = "hot";
>>>                   };
>>>                     trip-point2 {
>>> -                    temperature = <110000>;
>>> +                    temperature = <125000>;
>>>                       hysteresis = <1000>;
>>>                       type = "critical";
>>>                   };
>>> @@ -6305,19 +6305,19 @@ map0 {
>>>                 trips {
>>>                   gpu4_alert0: trip-point0 {
>>> -                    temperature = <85000>;
>>> +                    temperature = <95000>;
>>>                       hysteresis = <1000>;
>>>                       type = "passive";
>>>                   };
>>>                     trip-point1 {
>>> -                    temperature = <90000>;
>>> +                    temperature = <115000>;
>>>                       hysteresis = <1000>;
>>>                       type = "hot";
>>>                   };
>>>                     trip-point2 {
>>> -                    temperature = <110000>;
>>> +                    temperature = <125000>;
>>>                       hysteresis = <1000>;
>>>                       type = "critical";
>>>                   };
>>> @@ -6338,19 +6338,19 @@ map0 {
>>>                 trips {
>>>                   gpu5_alert0: trip-point0 {
>>> -                    temperature = <85000>;
>>> +                    temperature = <95000>;
>>>                       hysteresis = <1000>;
>>>                       type = "passive";
>>>                   };
>>>                     trip-point1 {
>>> -                    temperature = <90000>;
>>> +                    temperature = <115000>;
>>>                       hysteresis = <1000>;
>>>                       type = "hot";
>>>                   };
>>>                     trip-point2 {
>>> -                    temperature = <110000>;
>>> +                    temperature = <125000>;
>>>                       hysteresis = <1000>;
>>>                       type = "critical";
>>>                   };
>>> @@ -6371,19 +6371,19 @@ map0 {
>>>                 trips {
>>>                   gpu6_alert0: trip-point0 {
>>> -                    temperature = <85000>;
>>> +                    temperature = <95000>;
>>>                       hysteresis = <1000>;
>>>                       type = "passive";
>>>                   };
>>>                     trip-point1 {
>>> -                    temperature = <90000>;
>>> +                    temperature = <115000>;
>>>                       hysteresis = <1000>;
>>>                       type = "hot";
>>>                   };
>>>                     trip-point2 {
>>> -                    temperature = <110000>;
>>> +                    temperature = <125000>;
>>>                       hysteresis = <1000>;
>>>                       type = "critical";
>>>                   };
>>> @@ -6404,19 +6404,19 @@ map0 {
>>>                 trips {
>>>                   gpu7_alert0: trip-point0 {
>>> -                    temperature = <85000>;
>>> +                    temperature = <95000>;
>>>                       hysteresis = <1000>;
>>>                       type = "passive";
>>>                   };
>>>                     trip-point1 {
>>> -                    temperature = <90000>;
>>> +                    temperature = <115000>;
>>>                       hysteresis = <1000>;
>>>                       type = "hot";
>>>                   };
>>>                     trip-point2 {
>>> -                    temperature = <110000>;
>>> +                    temperature = <125000>;
>>>                       hysteresis = <1000>;
>>>                       type = "critical";
>>>                   };
>>>
>>
> 


