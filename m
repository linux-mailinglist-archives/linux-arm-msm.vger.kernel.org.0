Return-Path: <linux-arm-msm+bounces-40184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1289E3680
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 10:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE47F285D79
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 09:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25BB319DFB4;
	Wed,  4 Dec 2024 09:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E85ttCz7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58442BE5E;
	Wed,  4 Dec 2024 09:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733304308; cv=none; b=oD6CHGYtPaL5h7cF3SCvmPBVDi0a6l+qI0fGq8EG4HbzVG34IYWCdqeCl/HG/Lri8wIdZQWvMjmhO0oljl3tx/Vdk+iqdONZEg2bqTd9wrOqkWp53U12u/6vwSdGrwIhveDhoNVYZUv3OUENhFeUuXB3SUfn3yRauILDbdk6BAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733304308; c=relaxed/simple;
	bh=PKY4LPXFn8gf3Y/PMNn+IFZxA1QBme7qcuSLsElyEkk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=HHhHfygCvx6cRmX5X2vxGxgUOK6//Z6MrFX0Ok/v7b6BoCZScOWBaVpN6hBw3qVudF3D4VXR71dTv2TBKpNhFsIPp78/8NjNHsPQzpQUYfjm3WwHHp8RfCarYp5+LcyumTui80ZcRijHoHs0M30oH5Qmos28KwcRkrtdp2H/w9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E85ttCz7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B47Ur0S024918;
	Wed, 4 Dec 2024 09:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KSwHfDvtubrWGiVXiJkI8w2z2WeskjwStT/I6Vufs84=; b=E85ttCz7oRzvvKzw
	k1QPxl10KQ75AWyy8nUzooS82Vf21ucA/XUN/mntapNSTk3iLwzceovRY0rdWZ+I
	NhM+1Bb3UZYHYvxUjdIBJWTWPSaluE9u37gKVDWrMJoQ+8uvy1Sm8mySxNIhrv5m
	kb9sAUJZB86sk3P2+j1KLXTXwUrvjUDHk8fdoeqxxClPo9TB+t3Yx3SVqBX42qtK
	oGNP0tfdKIlGMSYvta1GQ4o/akoj8vWPQ4shMnas921gkcDr4o/3tX4BhPxlJDBV
	Kfv2QYafUaBCeyYL9J4ZwvWS/y5vQ3z5U149C/zoBqyzBB1OARNHtelnXFtc7SqH
	WHf07w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439vnyur08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 09:25:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B49P0x2009889
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 09:25:00 GMT
Received: from [10.217.217.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Dec 2024
 01:24:56 -0800
Message-ID: <cfb08783-a561-4636-853e-0903713008f8@quicinc.com>
Date: Wed, 4 Dec 2024 14:54:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] dt-bindings: clock: qcom: Add SM8750 GCC
From: Taniya Das <quic_tdas@quicinc.com>
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
 <9d0bb244-ecbd-4630-a774-6f2cd1ffb2cb@quicinc.com>
Content-Language: en-US
In-Reply-To: <9d0bb244-ecbd-4630-a774-6f2cd1ffb2cb@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6uYUI4IC6xZAeCU0qb7dwZDfbUPoiFZ6
X-Proofpoint-GUID: 6uYUI4IC6xZAeCU0qb7dwZDfbUPoiFZ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040073



On 12/4/2024 12:47 PM, Taniya Das wrote:
> 
> 
> On 11/20/2024 1:47 PM, Krzysztof Kozlowski wrote:
>> On Mon, Nov 11, 2024 at 04:28:04PM -0800, Melody Olvera wrote:
>>> From: Taniya Das <quic_tdas@quicinc.com>
>>>
>>> Add bindings documentation for the SM8750 General Clock Controller.
>>
>> Subject prefix - use proper file prefix:
>> dt-bindings: clock: qcom,sm8650-gcc:
>>
>>>
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>>> ---
>>>   .../bindings/clock/qcom,sm8650-gcc.yaml       |   8 +-
>>>   include/dt-bindings/clock/qcom,sm8750-gcc.h   | 226 ++++++++++++++++++
>>>   2 files changed, 232 insertions(+), 2 deletions(-)
>>>   create mode 100644 include/dt-bindings/clock/qcom,sm8750-gcc.h
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml 
>>> b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
>>> index 976f29cce809..e50b5f1cad75 100644
>>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
>>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
>>> @@ -13,11 +13,15 @@ description: |
>>>     Qualcomm global clock control module provides the clocks, resets 
>>> and power
>>>     domains on SM8650
>>> -  See also:: include/dt-bindings/clock/qcom,sm8650-gcc.h
>>> +  See also: include/dt-bindings/clock/qcom,sm8650-gcc.h
>>> +            include/dt-bindings/reset/qcom,sm8750-gcc.h
>>>   properties:
>>>     compatible:
>>> -    const: qcom,sm8650-gcc
>>> +    items:
>>
>> No need for items, simpler is just enum.
>>
> 
> will fix in the next patch.
> 

As there are binding differences between SM8650 and SM8750 will bring 
back the new file as in v1 
https://patchwork.kernel.org/project/linux-clk/patch/20241021230359.2632414-5-quic_molvera@quicinc.com/ 
  and fix the unused bindings.

>>> +      - enum:
>>> +          - qcom,sm8650-gcc
>>> +          - qcom,sm8750-gcc
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Best regards,
>> Krzysztof
>>
> 

-- 
Thanks & Regards,
Taniya Das.

