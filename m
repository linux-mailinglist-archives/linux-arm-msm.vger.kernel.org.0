Return-Path: <linux-arm-msm+bounces-25906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF36C92DF4A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 07:05:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69B17284385
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 05:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6D237169;
	Thu, 11 Jul 2024 05:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lrk13TXq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6D24EB55;
	Thu, 11 Jul 2024 05:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720674295; cv=none; b=QbhzCyDuXSW3I4Snvd6skWv7IBR7CGwRbvB+PjbPTSEaHj2ujW55tPncX4RVruYwez31h2FO74wE6FDPGScvwHok8KkxNxPNXyemR2oq0YhulZnUYTm9W0Qh8epSfIMymvKvnc6043BRMUFHAMG88X4yUlp7u3oGzoLx7uyEPzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720674295; c=relaxed/simple;
	bh=bmmiqnGMym0cd9eaRTuiQ/e0/Tdh4uIOIWOrVn6th5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jv3ZFkpAOaQja9+CvQxqT7UiQiR08XD0KZxs9iQgCyJWETT2mjOFc2mkIL6inKmngoyUXn9XpUxfjm+ULNt8ZPi7u78rzdxKd1EqGOIxAcwy37phybi3EEAqPk7I1+6KkuKW/kUXIZh5ycwPC/i03P6YBkwYrKF4gacEzlZxEYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lrk13TXq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46B4n5RD004611;
	Thu, 11 Jul 2024 05:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UiiGhSGgBi1qiMkn7SfxdUtsB35BvZV/7EeGl5O4RSc=; b=lrk13TXq2aZ82Esc
	jd5SOI/oxpCo4Qd7fZdaC4SIMU4ySOCF4ab2EYydP9bM/HpixLHHWgvmhfWfQcCF
	9Z6pPjBg1FkASwQPJjE8XssGqvkIW0ilUouayOYLlr946ugZ4ZwM5hISEX6l+ZRm
	0nGMe385N1kjJ1VgQ++372D1Gxechdv3tyLEsU9G8A+A5T1QtTsPPNRq9eF9aIR4
	YE0SlHyx8zzNqlPTjNNFKAhC7tL3biVoFgDsDwnkQPrFXbJIaFTC36CgHkz/OJHo
	m8YdtVgH3dygJbPyg3qMSkov4z41NV2ac3QFo8BAnzR9J5IJtbWCp9exOSXGnHNN
	c3OBcQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406we9355n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 05:04:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46B54miY013308
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 05:04:48 GMT
Received: from [10.216.6.181] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 10 Jul
 2024 22:04:44 -0700
Message-ID: <fa189b4c-d407-4d48-9677-528f07f81efa@quicinc.com>
Date: Thu, 11 Jul 2024 10:34:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: sa8775p: Add UART node
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski
	<krzk@kernel.org>, <andersson@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_msavaliy@quicinc.com>, <quic_anupkulk@quicinc.com>
References: <20240710094149.13299-1-quic_vdadhani@quicinc.com>
 <2e309d52-8180-4922-9a5a-022fc8bf8ef5@kernel.org>
 <f5ed3285-82da-4ba8-9b4d-a0cc7323fde4@linaro.org>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <f5ed3285-82da-4ba8-9b4d-a0cc7323fde4@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NXiDcJW_jYI9lOXxVdsNPDzhOfMbWESO
X-Proofpoint-GUID: NXiDcJW_jYI9lOXxVdsNPDzhOfMbWESO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_02,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 mlxscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407110032



On 7/10/2024 4:09 PM, Konrad Dybcio wrote:
> On 10.07.2024 11:47 AM, Krzysztof Kozlowski wrote:
>> On 10/07/2024 11:41, Viken Dadhaniya wrote:
>>> Add missing UART configuration for sa8775.
>>>
>>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 231 ++++++++++++++++++++++++++
>>>   1 file changed, 231 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> index 23f1b2e5e624..c107ee40341d 100644
>>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> @@ -1,6 +1,7 @@
>>>   // SPDX-License-Identifier: BSD-3-Clause
>>>   /*
>>>    * Copyright (c) 2023, Linaro Limited
>>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>    */
>>>   
>>>   #include <dt-bindings/interconnect/qcom,icc.h>
>>> @@ -657,6 +658,21 @@
>>>   				status = "disabled";
>>>   			};
>>>   
>>> +			uart14: serial@880000 {
>>> +				compatible = "qcom,geni-uart";
>>> +				reg = <0x0 0x00880000 0x0 0x4000>;
>>> +				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
>>> +				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
>>> +				clock-names = "se";
>>> +				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
>>> +						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
>>> +						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
>>> +						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
>>> +				interconnect-names = "qup-core", "qup-config";
>>> +				power-domains = <&rpmhpd SA8775P_CX>;
>>
>> All the clocks, interconenct and power domains look to me questionable.
>> AFAIK, most of it (if not all) is going to be removed.
> 
> Yeah.. I'm lukewarm on accepting any sa8775p changes until that qcs9100(?)
> situation is squared out first
> 
> Konrad

Thanks for clarification. Please help to sign-off or let me know in case 
of any concern.


