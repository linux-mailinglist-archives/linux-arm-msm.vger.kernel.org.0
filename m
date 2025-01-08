Return-Path: <linux-arm-msm+bounces-44290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B30A051C5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 04:55:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53C643A7792
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 03:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979DC19CC3E;
	Wed,  8 Jan 2025 03:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mbWbjDoA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBB22E40E;
	Wed,  8 Jan 2025 03:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736308550; cv=none; b=qLuE6LgcuYVWB+sbgqdg46ytXbpTZ89rKS+T0NUsMmalPIQvRoGg4xkeQBfIrA1moysySvlSJCgXhUzuW5Vkzoe8DeoPcjhCgHFurcxFfYwobzAqV2Kxm341GkwWehr+BRE2UJOxt0cxyAzTgnKFeKjOBQS38Wo5qmuDwnOusmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736308550; c=relaxed/simple;
	bh=XGy6G/W4nAOPA/3sPSPvEhx/r5AQBpdaJXDaU2+f0hg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NS6syf5dVaFLtyZw8SKsf/X9jph9emiJTfrgURTOG4GaLZlBzYdJzPZURH5t8AG29szpPQGes7yZKX6dhvuGbslTxNGf/vgXwmJMYbRMtsQ/8u1gX6YjYpOl0tqrfcYv/tY8A5SCr7vw3DotSvO3weCkytPxPiNQgl367fu06cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mbWbjDoA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5083oT5C008498;
	Wed, 8 Jan 2025 03:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D9i1jamYlRX3OfZ8YG6YE7zWOjoGuDi6CDvf9P2LO9c=; b=mbWbjDoAufEOhnlo
	8IyTgD8D7R/WhPeq1RuitqeZ1NuN7Z9PhBjHmebOUIcskMN2yRwuLvakDQwGn5ar
	dkGYJYDkWmkz2S4BoMPT3IBVUUeM3j0ArlffCRzWPqkNbwE8ChlXrdiVhzmvrhMe
	YfXcfzHn6VNxOEvLRT7xghx1ARY097xSYpRr6VWyIfWZMq/cS06NprYvPbYzW5gL
	sAN3g5ULk/vCk0lB7OtXGwriaTz3kSzsFqQ7Xclvko8Ydv1n0NzbuMhsOb9YLCN3
	bPebICE+s04T/6aTGfNzmTyD/Y4Zpl8amRLeDpqRzQD2XQge916jDkGZZGbbZHER
	U+O75g==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441ht580b4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 03:55:44 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5083thTV016261
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 03:55:43 GMT
Received: from [10.231.207.28] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 Jan 2025
 19:55:38 -0800
Message-ID: <2b1a1d32-7bd0-4062-ad55-f2346ffcc205@quicinc.com>
Date: Wed, 8 Jan 2025 11:55:35 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs8300-ride: Enable PMIC
 peripherals
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <quic_fenglinw@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <kernel@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241126-adds-spmi-pmic-peripherals-for-qcs8300-v1-0-28af84cb86f8@quicinc.com>
 <20241126-adds-spmi-pmic-peripherals-for-qcs8300-v1-2-28af84cb86f8@quicinc.com>
 <5ae55ca2-d9ef-49c0-8868-2c5bb665ddb1@oss.qualcomm.com>
 <4f3921b1-412e-4982-b360-d0e6cec69673@oss.qualcomm.com>
Content-Language: en-US
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
In-Reply-To: <4f3921b1-412e-4982-b360-d0e6cec69673@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: it04FEFjVC66e4O8AHJRY1Yel8JWPdNR
X-Proofpoint-GUID: it04FEFjVC66e4O8AHJRY1Yel8JWPdNR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 bulkscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080028



On 11/29/2024 7:30 PM, Konrad Dybcio wrote:
> On 29.11.2024 12:14 PM, Konrad Dybcio wrote:
>> On 26.11.2024 10:35 AM, Tingguo Cheng wrote:
>>> Enable PMIC and PMIC peripherals for qcs8300-ride board. The qcs8
>>> 300-ride uses 2 pmics(pmm8620au:0,pmm8650au:1) on the board, which
>>> are variants of pmm8654au used on sa8775p/qcs9100 -ride(4x pmics).
>>>
>>> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 23 +++++++++++++++++++++++
>>>   1 file changed, 23 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>>> index 7eed19a694c39dbe791afb6a991db65acb37e597..9447efb9cd01654b74ec4c18dec58b1956ffe710 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>>> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>>> @@ -9,6 +9,7 @@
>>>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>>   
>>>   #include "qcs8300.dtsi"
>>> +#include "sa8775p-pmics.dtsi"
>>>   / {
>>>   	model = "Qualcomm Technologies, Inc. QCS8300 Ride";
>>>   	compatible = "qcom,qcs8300-ride", "qcom,qcs8300";
>>> @@ -223,6 +224,28 @@ &gcc {
>>>   		 <0>;
>>>   };
>>>   
>>> +&pmm8654au_0_pon_resin{
>>> +	linux,code = <KEY_VOLUMEDOWN>;
>>> +
>>> +	status = "okay";
>>> +};
>>> +
>>> +&pmm8654au_2{
>>> +	status = "disabled";
>>> +};
>>> +
>>> +&pmm8654au_2_thermal{
>>> +	status = "disabled";
>>> +};
>>> +
>>> +&pmm8654au_3{
>>> +	status = "disabled";
>>> +};
>>> +
>>> +&pmm8654au_3_thermal{
>>> +	status = "disabled";
>>> +};
>>
>> Are all these PMICs absent?
 >
Yes, sa8775p/qcs9100 -ride devices get 4 pmics inside, but qcs8300-ride 
gets only 2 pmics inside(0 and 1). So pmm8654au_2 and pmm8654au_3 are 
going to be removed to align with the board configuration.
> 
> OK I re-read the commit message..
> 
> Disabling a lot of things usually points to a backwards approach,
> are there any other PMICs on board?
 >
No any other PMICs on board. There are only 2 PMICs on this type of 
board. And the 2 PMICs is the variant of the PMICs used on 
sa8775p/qcs9100 -ride. From this perspective, just like qcs615-ride 
device, so I reused the original xxx-pmics.dtsi to reflect the 
relationship of "variant".

> 
> Konrad

-- 
Thank you & BRs
Tingguo


