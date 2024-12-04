Return-Path: <linux-arm-msm+bounces-40175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 969879E33FA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 08:18:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06865B2292B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 07:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72BFD1862B8;
	Wed,  4 Dec 2024 07:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EidmqL3Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBB8184;
	Wed,  4 Dec 2024 07:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733296691; cv=none; b=ma/v0FDShJtrFiP6Hccayv/k/C2M4ik2xAPBmC8KT0le6VLADFsf8Q2KYkP8mjZbhOPqZ/6Sk/mjcZ7BObcKNgHL8ShBsB0NuFu5eaZtyUP0gt5xV4Ynob8a9xbwKxLzXqVmYMo1E7JgJ+BsGxJHNcAIVFD6P4NFkjg9gdwuPhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733296691; c=relaxed/simple;
	bh=Ek8lB3mFDu+n0uSn1+oAO1HJ1c9uXkf4oSjc21yQHxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=skliRrb9eq619xsl+BlPlVwaP6r5kcbbWFtouX2S1vKyu3Zs+5C4bLqRhqlZY4vjpRBjLbygafa7FzkvfreniQZ5CXkDn4wpe49AD5H3lnyTyJDgQ/LgwE7R4gyfx3dtUaJX7gfERj7Aa4OjIkqI3TpYgVUgDJSEfDuEkPoUDj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EidmqL3Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B46li01025018;
	Wed, 4 Dec 2024 07:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g5zWXSlONaKd4AvAgwYPf1vqc/QhuZXvoYZ9i0MBJ2o=; b=EidmqL3Zuzx9jIJU
	RbgnhOX6EQcs4rCrQAjclQJ6fP2H6jheJ/R3dHx0c8RyGcKkeWYLdTwmFcOnyySz
	5NJeKL/EDEP8tBCvHz+50EKu7wIuGIfb5zRRRuCjItebIF4dXlOF8KtKdPAcsDGB
	ikN3UIhmYT+rM2wcZpCKMVAjNRFCQwM4t1AZRrqchXR4PATERZrbY3mKKPe/1Cna
	BTquAIj62JOllsEjZgtvbzdyRBqDcbkf9WpfM1zE6/dHcwWZkRNam101JAveZ3hZ
	eFkLuZeqlL0sG97XccFFUQDxNJHoU9gQHvQUBjXyzu6Mv4KHFLJIpLHWldZOYaUK
	tKf0Tw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43aj4282fj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 07:18:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B47I4KU030518
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 07:18:04 GMT
Received: from [10.217.217.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Dec 2024
 23:18:00 -0800
Message-ID: <9d0bb244-ecbd-4630-a774-6f2cd1ffb2cb@quicinc.com>
Date: Wed, 4 Dec 2024 12:47:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] dt-bindings: clock: qcom: Add SM8750 GCC
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Satya Durga
 Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241112002807.2804021-1-quic_molvera@quicinc.com>
 <20241112002807.2804021-5-quic_molvera@quicinc.com>
 <vzu23hoou5rbcucrsnauq4ygxmqzuonyvxvnarsgxycc7wrnro@vpxauk6zmq36>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <vzu23hoou5rbcucrsnauq4ygxmqzuonyvxvnarsgxycc7wrnro@vpxauk6zmq36>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bwbsGqTWIPdVCbF4raf70A4PJ_RHuD6w
X-Proofpoint-ORIG-GUID: bwbsGqTWIPdVCbF4raf70A4PJ_RHuD6w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412040056



On 11/20/2024 1:47 PM, Krzysztof Kozlowski wrote:
> On Mon, Nov 11, 2024 at 04:28:04PM -0800, Melody Olvera wrote:
>> From: Taniya Das <quic_tdas@quicinc.com>
>>
>> Add bindings documentation for the SM8750 General Clock Controller.
> 
> Subject prefix - use proper file prefix:
> dt-bindings: clock: qcom,sm8650-gcc:
> 
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
>>   .../bindings/clock/qcom,sm8650-gcc.yaml       |   8 +-
>>   include/dt-bindings/clock/qcom,sm8750-gcc.h   | 226 ++++++++++++++++++
>>   2 files changed, 232 insertions(+), 2 deletions(-)
>>   create mode 100644 include/dt-bindings/clock/qcom,sm8750-gcc.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
>> index 976f29cce809..e50b5f1cad75 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
>> @@ -13,11 +13,15 @@ description: |
>>     Qualcomm global clock control module provides the clocks, resets and power
>>     domains on SM8650
>>   
>> -  See also:: include/dt-bindings/clock/qcom,sm8650-gcc.h
>> +  See also: include/dt-bindings/clock/qcom,sm8650-gcc.h
>> +            include/dt-bindings/reset/qcom,sm8750-gcc.h
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,sm8650-gcc
>> +    items:
> 
> No need for items, simpler is just enum.
> 

will fix in the next patch.

>> +      - enum:
>> +          - qcom,sm8650-gcc
>> +          - qcom,sm8750-gcc
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 

-- 
Thanks & Regards,
Taniya Das.

