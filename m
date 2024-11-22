Return-Path: <linux-arm-msm+bounces-38825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5169D5D65
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 11:38:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E1F2283661
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 10:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70AE01D9688;
	Fri, 22 Nov 2024 10:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E9C/i6rZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11511304BA;
	Fri, 22 Nov 2024 10:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732271924; cv=none; b=W9NRoe5itDWnw6GhsyUUXYoDzSQ3IKmH28JxZ6nyKk3pPgp/GHD9QQdXsp4kWQUvZLHMRpPyEF9mtF8WYu6vHjyQUUzhTBbIw94aE5xaVJ15YpeDFHab+dCtRLV8L7c5HASuUoG9HXv7QC+/rjh1pZdsfrCbKNLXT9psfQ8gDCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732271924; c=relaxed/simple;
	bh=r/b3Td5N3dQTrbXMdIwv4GfFi5yyjShOpjCm4Woqxr8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=ruWX+0Hq2ndqD4KpxpJJxeJ6bXIWdMQN6S52Yvww0uwaPEAMsPWHCtSEBU9mWIjPWZENxYeba0rlMlHNR0wmX+ubSpsnYUEse7HTvPMqf6vsDy2Rnqm7ZHKRBfSw1n5jVIGt0fYrKZAs/PjHxLxZjLpQT2cwvBAZM+JqvTpMFxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E9C/i6rZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM7tmqX002954;
	Fri, 22 Nov 2024 10:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yaeaYr98+fbsR9DLE90GgBAnpX0QZ47zRyGbUfUjRsU=; b=E9C/i6rZ04Ya9OED
	928Vl3I+ckgF/YqGHF1yuLW0NsDoj7L3vHEEbfKPRGXoL1Ro2TKvneGO1iCE5Wgs
	WaKjZeOOJXEyJ9Ed5egiAPybZwtSnfrN+d6FOJyl4LA2y4w3RuQHYca0QBiLIV3s
	4H/qK4v4otrz+DDl/ItbMAjHj1ICThLnQBr1m7Wne+EoiNEeditIUjYe6W7ulP2d
	/j08CeE+4gnCAmBI9HkS7kvpx3+w/GraBjUloQkX3QQZiLaIG9odHCP8DSfF3gkL
	C3auzVusN6gl7CTeHKFU6nXQMeejijpds6h1oN+3eLLPM9HJW8ZdYEAGFRB9Rk7O
	qchZwQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 432p0d8erw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 10:38:38 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AMAcb39022911
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 10:38:37 GMT
Received: from [10.231.207.28] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 22 Nov
 2024 02:38:31 -0800
Message-ID: <89228c85-9b0e-477f-9cb9-e775850b2eb0@quicinc.com>
Date: Fri, 22 Nov 2024 18:38:29 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: pmic: enable rtc
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_kotarake@quicinc.com>, <quic_kamalw@quicinc.com>,
        <quic_skakitap@quicinc.com>, <quic_fenglinw@quicinc.com>
References: <20240902104302.3959670-1-quic_tingguoc@quicinc.com>
 <f5b768b3-37ad-4bdf-9cb6-b39b14c8ee45@kernel.org>
 <14392fbf-9bf6-4e39-8ba2-59473351a64b@quicinc.com>
Content-Language: en-US
In-Reply-To: <14392fbf-9bf6-4e39-8ba2-59473351a64b@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UsCjIRpN91dkqMPcGJNU0tAOefnGXCal
X-Proofpoint-GUID: UsCjIRpN91dkqMPcGJNU0tAOefnGXCal
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxlogscore=949
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220090



On 9/19/2024 10:23 AM, Tingguo Cheng wrote:
> 
> 
> On 9/6/2024 8:22 PM, Krzysztof Kozlowski wrote:
>> On 02/09/2024 12:43, Tingguo Cheng wrote:
>>> Add RTC node, the RTC is controlled by PMIC device via spmi bus.
>>>
>>> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/ 
>>> arm64/boot/dts/qcom/sa8775p-pmics.dtsi
>>> index 1369c3d43f86..47d05b897d5a 100644
>>> --- a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
>>
>> We achieved consensus allowing sa8775p to stay, but now Qualcomm changes
>> point of view and insists on new approach of dropping sa8775p. Therefore
>> this change does not make much sense in the new approach.
>>
> The new approach(QCS9100+sa8775p compatible) will still use the same 
> PMIC chip(As usually, include sa8775p-pmics.dtsi as it's pmic part). 
> Therefore, from this point, it does make sense in the new approach.
>  From another point, for old boards, this change should have been there.
> 
>> Best regards,
>> Krzysztof
>>
> 
We have aligned this internally again, "sa8775p-pmics.dtsi" still 
continue to be used for qcs9100-ride. Can you help review/apply this
change? We need this RTC function in some boards.

-- 
Thank you & BRs
Tingguo


