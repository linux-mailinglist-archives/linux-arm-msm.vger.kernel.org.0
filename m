Return-Path: <linux-arm-msm+bounces-49411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2C5A45489
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 05:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DF0F189DCB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 04:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7409923026D;
	Wed, 26 Feb 2025 04:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WrJw/GWR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C3721ABD7;
	Wed, 26 Feb 2025 04:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740543613; cv=none; b=EscC5P/bEgOhfvmJiS2yPOEiHbvHhr1frM2FW/vV4xsxDa+9CRO25H8rC3Kg0RYmpqIrwegqeST+XUnmaMjJOMH0qmLp7JNiItsTQ0q0+GrNaROk5JKpU6spRdCzwQd/6+e9lmrjTtuxdhyLXilH3p91F0GDGsDclZdsrnlwR5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740543613; c=relaxed/simple;
	bh=ZHVrDwJExnx36XfFWRiPc6MnOFvFnKgaoMa3KBB53o8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eAZXzolTRLo05a+RvbN2i1+UtHExYMlGlFOGAfP8O8EYF+9rla6fpiIKGzZdGtbZQU/U/zqw6TUr2lAjFnH0yxg0xW7CiYSYlmn2yVyPOil9wnLC6khS/5knHvNehQszWHgHU/Kszbj4Fpn8+0Xp+3M1cpk+vhUDh8KX+F8UWjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WrJw/GWR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PMX4I7017692;
	Wed, 26 Feb 2025 04:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HziE7p2em3oylv3aYDJyUsu7KPrCXdkhC04EonUReFU=; b=WrJw/GWRlGPrJy5+
	QHtzhMaVna8M0b0AD9Z8cQdIn/i1HgVO2ay3LtG5nFMPzYEeF+ID09M2EP9Ue61T
	c8HxJxNcH9reuPFVz1EFqrmZLCbbJzRd/qfs5+xZ0iTUx10ADqLfHTSBa+Ywi87P
	IMZY6hNcVisLdHEYSKPghyfpj6TuiKJQbPJ194Vof+k420ZC90yDLvRZDC/a4xr1
	eFg9DQR0QI6j2et2a/zMZucsz430fI4n4+iSFweGGcmERoGn1Rm7328YJ/FdsA2d
	WJ9gerWf7PFmcpJLzKVzAh77UiQJA3FKHV9Nl6xmNZNW6FuN8Xm3TI4zQapacy+z
	gmJi7w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prn0phn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:20:07 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51Q4K59a025206
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:20:05 GMT
Received: from [10.216.47.64] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Feb
 2025 20:20:01 -0800
Message-ID: <c367e9bf-d04d-4757-b061-5803ba6304d4@quicinc.com>
Date: Wed, 26 Feb 2025 09:49:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] dt-bindings: qcom: geni-se: Rename qcom,geni-se.yaml
 to qcom,geni-se-qup.yaml
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_msavaliy@quicinc.com>, <quic_anupkulk@quicinc.com>
References: <20250221085439.235821-1-quic_vdadhani@quicinc.com>
 <49fc59ed-9d09-46bd-9ca6-99d3445221f7@kernel.org>
 <f3349d2a-7eba-4865-9b58-0b2e7e57cc92@quicinc.com>
 <ed8f7aee-e5be-453c-b324-e59e90ecee77@kernel.org>
 <428a1384-bc06-4952-a117-d57f5ab6446c@quicinc.com>
 <03587630-9378-4b67-822a-563379c06655@kernel.org>
 <a65344c8-9b1d-44b1-923a-3840298d19d1@quicinc.com>
 <e508f58f-70cc-4c6a-a6e1-2f046d54d1c3@kernel.org>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <e508f58f-70cc-4c6a-a6e1-2f046d54d1c3@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FUIbBqbcg98zwAX1L77hXiDuSePGzcDT
X-Proofpoint-GUID: FUIbBqbcg98zwAX1L77hXiDuSePGzcDT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=422
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260032



On 2/25/2025 6:49 PM, Krzysztof Kozlowski wrote:
> On 25/02/2025 10:33, Viken Dadhaniya wrote:
>>
>>
>> On 2/24/2025 6:59 PM, Krzysztof Kozlowski wrote:
>>> On 24/02/2025 14:25, Viken Dadhaniya wrote:
>>>>
>>>>
>>>> On 2/24/2025 3:48 PM, Krzysztof Kozlowski wrote:
>>>>> On 24/02/2025 09:47, Viken Dadhaniya wrote:
>>>>>>
>>>>>>
>>>>>> On 2/21/2025 5:05 PM, Krzysztof Kozlowski wrote:
>>>>>>> On 21/02/2025 09:54, Viken Dadhaniya wrote:
>>>>>>>> The qcom,geni-se.yaml file describes the Qualcomm Universal Peripheral
>>>>>>>> (QUP) wrapper and the common entities required by QUP to run any Serial
>>>>>>>> Engine (SE) as I2C, SPI, UART, or I3C protocol.
>>>>>>>>
>>>>>>>> Rename qcom,geni-se.yaml to qcom,geni-se-qup.yaml to better reflect its
>>>>>>>> association with QUP (Qualcomm Universal Peripheral) and the compatible
>>>>>>>> string.
>>>>>>>>
>>>>>>>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>>>>>>>> ---
>>>>>>>>      .../soc/qcom/{qcom,geni-se.yaml => qcom,geni-se-qup.yaml}       | 2 +-
>>>>>>>>      1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>>      rename Documentation/devicetree/bindings/soc/qcom/{qcom,geni-se.yaml => qcom,geni-se-qup.yaml} (98%)
>>>>>>>>
>>>>>>>
>>>>>>> That's just churn for no real gain. Not even tested churn.
>>>>>>
>>>>>> That's just churn for no real gain.
>>>>>>
>>>>>> We made this change based on below plan, we think this will be helpful.
>>>>>>
>>>>>> 1. Rename qcom,geni-se.yaml to qcom,geni-se-qup.yaml. Reason at 2 below.
>>>>>
>>>>> There is no reason 2 at this point. You split your patchsets
>>>>> incorrectly. At this point this is churn, without gain. No users of this
>>>>> rename, no benefits.
>>>>>
>>>>>> 2. Create qcom,geni-se.yaml with shared properties for SE-protocol (spi,
>>>>>> i2c, uart) nodes. This will be helpful for the shared schema in the
>>>>>> ongoing changes
>>>>>
>>>>> Then post it, instead of sending something which makes no sense on its own.
>>>>
>>>> Should I include this change in v3 of the following serial patch?
>>>>
>>>> https://lore.kernel.org/linux-arm-msm/f090d637-1ef1-4967-b5bc-6bfce3d7130e@kernel.org/T/
>>>>
>>>> I hope the approach below is fine for you:
>>>>
>>>> 1. Rename qcom,geni-se.yaml to qcom,geni-se-qup.yaml.
>>>
>>> I still do not see any need nor justification for above.
>>>
>>>> 2. Create qcom,geni-se.yaml with shared properties for SE-protocol (i2c,
>>>> spi, uart) nodes.
>>>
>>> Look how other common qcom schemas are named :/
>>>
>>
>> Yes, but we need to get agreement on whether we can create it or not. I
> 
> That's not how upstream works.
> https://www.goodreads.com/quotes/437173-talk-is-cheap-show-me-the-code
> 
> I don't have time to discuss imaginary future work which might happen or
> might not. Send complete work.
> 

I will post the code in the next patch.

> 
>> found a few commonly used files:
>>
>> - /pci/qcom,pcie-common.yaml
>> - /pinctrl/qcom,tlmm-common.yaml
> 
> so common suffix - geni-se-common... or geni-se-qup-props to mimic
> peripheral properties.
> 
> Best regards,
> Krzysztof

