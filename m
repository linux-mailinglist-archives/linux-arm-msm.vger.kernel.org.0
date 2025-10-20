Return-Path: <linux-arm-msm+bounces-78053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EE5BF2F82
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 20:39:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 142744F8916
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 18:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A672D130C;
	Mon, 20 Oct 2025 18:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L5a5tW1P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5460523C4E9
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 18:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760985547; cv=none; b=msdALcOVNz4YtMHwgb61hEGOnhCm+QX5fGv59Y7iP9gqbayTN/i69yuDyV3BlHm820EPS8tRU9LuwbGc+iot2ILRkRsod+paL1Gw/Xolzr3x/iySQ+tEnTynUvNtQ4lquuO7rDqrkuM4w0+Sk8YS4ztrLqvmzhIM+mGmCfGXXno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760985547; c=relaxed/simple;
	bh=yulSoibBDiWX6jmpP3Ns1uXrdkIcA9BOI6Zi04OhpfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MuhdniyOUuTYvbUa2KlVb0gfSOQe1YwO971QVeqW5U9V5kLy0aCj0ce61sG8uIdbTSnTk7vEOJ5T//Fmpr1lku6wctCkAmRnA7k7/bPB30hY6OwUxKKDJe9Z1GXx4KDic00ZIKnE8gqTd3pNic5IKy1AzP/so2yyAvD2Qm21isg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L5a5tW1P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KCaOUs013587
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 18:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fcmR2kO0kprkS+hm2HYcnN1OE+DeFwRjnQPZTNVK23s=; b=L5a5tW1PBrgMDnbQ
	86ykVpx576xBLHDMIL1J2G1cas1zjehYpfvjWU0c5sbhTqajZXcaFfopgW4KqmM8
	A/Q7gf228qOx0umNVcSmWhaxW/golnCh69NgO5mlEIW8LpSPz+vLI6G/B9sOXTYE
	oPAWDEAw2wNHJzJW1i2X7h4FIsfXfT61oKTn15naaxjGQnI2AUPosw6hpag+2f+O
	nBoNHODh7MnLVM0R1Yq0dKqAY1hXCSkVbX3Q3i3Jyf4DMszQg07tIfVBW+3p2nlA
	dMKoqqwC02rAvFzRnzD/f88bSCEmjx3rRR9XrftMyBuTreLelMfHHwY+89o19reb
	HjXKkw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pdyw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 18:39:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-780f9cc532bso4384247b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 11:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760985542; x=1761590342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fcmR2kO0kprkS+hm2HYcnN1OE+DeFwRjnQPZTNVK23s=;
        b=GKA3jD8GXygdL+m5NTpE4svAKC7zGN8EL9qPKpbAHcdyDm58ppWCvjhq6UexSxE2Zy
         lmLDT96pAqaIaqvkRjJtXxtGLytw+YF/UPiWorVGQPqNYSsjaYN8/s/F4bdVaI6EFu/7
         qqjUzAbEhHkZ9V64Wtl7982ChndM6q4hsUzPXhPqKOZNJm9d6OC/sSFPBuy1h4UcJ1s1
         fvyE87RR/PS/rdXgQaTp6CmxAT68tnPRYzdrARXWA5EeNlsQuWWi/9G/5QDiYJIXxksS
         yU4Z2sFqgHIO/AiNkGEAY59rmZ76mu9i1HUKoYqe54Pa6Zgl8SCjulFZQgJc83XR02/a
         DUTg==
X-Forwarded-Encrypted: i=1; AJvYcCVMJkP2qpH0fDRpGBs8cuTcXDGgtn3n5WIDnuflcyqDI4BSLwXa7AanU1nDuk6hM1UKZIQnAGY0BwlVlHpu@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn1IXoMHS6r9Mzld3bWWJwiCePtBp5ah+S1uygw6ducn5YQDLW
	soniNkd6J2YPspyGyTuy4HwQOsqJuECInnHiQ2cHVPqktyLXXInBOifog4wkrcPbU008K7UYvjz
	6rECqXaTjQWX91qJGLSNitlxnRJFlxNQ8cp/P2D4BuzXQEATBJaVyel6dXJ3hWtMS6L68
X-Gm-Gg: ASbGncuXJWZ8Q9WyIGZFTZLxjNqcEti9ejiLPHcAPn8+kROluutNOYavusa4vZOP0WQ
	wp6W8fOD6y3KdRK/YhS3S6NHvv6nuZ3Sl9UtrzD+rG7Ya8oCB2rdqVLK7urEzOEsxWSbV/HLr0m
	nFyC9FryCAXW2FpKFirYUl8EZc8s0e8/c5Dx5xZs0Rv39zgg9MFc97BC2z3X385R4Xd77+stsFX
	Aew6fDAjnWMuiadJZljjtMH8CPiRSakU5DWornmkHl8Td207Ji0DfamDfp5MaIKCbbjMrnocek3
	kCCureemRqPZk7Zkjk7eOpfHg+OZ4IgTgPzHUbFXVAxDQ0mqesUz8DCUwiZJe9y4tHsaaH5eAVw
	EQU/axzfhF5VCLolf0Z7t6YXGamZlH+UxQPjVSrrkYJRDIGCtTLaUGA==
X-Received: by 2002:a05:6a00:1ad1:b0:783:44b9:cbc9 with SMTP id d2e1a72fcca58-7a210f59a7dmr21228059b3a.9.1760985541786;
        Mon, 20 Oct 2025 11:39:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd531l029AZFQSWcfW9dfoCX2M4tkX+bVgsI6Qgj1PP+Mt6uKXHJbY5qWihEk2UM8XaRvFog==
X-Received: by 2002:a05:6a00:1ad1:b0:783:44b9:cbc9 with SMTP id d2e1a72fcca58-7a210f59a7dmr21228013b3a.9.1760985541129;
        Mon, 20 Oct 2025 11:39:01 -0700 (PDT)
Received: from [10.62.37.19] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff1599dsm9006920b3a.4.2025.10.20.11.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 11:39:00 -0700 (PDT)
Message-ID: <9d6b7e9d-1656-408d-ae8b-4b3dc95ba905@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 11:38:58 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali
 compatible
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-1-f5745ba2dff9@oss.qualcomm.com>
 <e2c43a8c-a9cc-46a1-9ddd-5d6dfc7e917b@linaro.org>
 <49eaf7ec-ac71-4bf3-9a4e-25fa633d815e@oss.qualcomm.com>
 <abc9d825-1e98-4838-9e9c-ca18ba191e11@oss.qualcomm.com>
 <22d47da0-4912-4880-8a42-f6d4e61e094c@oss.qualcomm.com>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <22d47da0-4912-4880-8a42-f6d4e61e094c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX+TX9SRtrJIcy
 3zeajrY041+dPj2qc6vqJ1etoErAcsTl1F3Xe9WRBoZrszst0sguxJEz6PV4G3sN6heaR0e3UWe
 ozPvLNYgj6/5p/lxyzfqeWADUPviZgYVdAvDXcDyB/Sg11eCwAbTVdjtLt8c7aRmt0E3lY51+M8
 ecgf5ntRwekDn3AFwNB4acvybSAf5Y/imLjkvCCpH10ofYdj5Rez6a2gnR05UkPLlpPsMwlUCQD
 NRvMR+eY1YsKDl0+gCGuoX55XhiejCRCGufs40ljI99tFt65v/R/44izKP/mArKk3/2QEyp01yb
 5GnN4+RZqzFn0PLUeeqJ2z54B1a2g15Z8guMnegEgOoL2QlfjYDKJB4N78ljvjX13MRjDtYoJel
 tEPrYeaGP3r6Ly0WYu53j3BAcIJxIg==
X-Proofpoint-GUID: Iappgw35R5BARfSPejMdfCNGpCz0vN9L
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f681c7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=xzpADP0L3AAWVpYwfikA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: Iappgw35R5BARfSPejMdfCNGpCz0vN9L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000


On 10/19/2025 9:13 PM, Hangxiang Ma wrote:
> On 10/16/2025 3:56 PM, Konrad Dybcio wrote:
>> On 10/16/25 3:56 AM, Hangxiang Ma wrote:
>>> On 10/16/2025 3:30 AM, Vladimir Zapolskiy wrote:
>>>
>>>> On 10/15/25 05:56, Hangxiang Ma wrote:
>>>>> Add Kaanapali compatible consistent with CAMSS CCI interfaces. The 
>>>>> list
>>>>> of clocks for Kaanapali requires its own compat string 'cam_top_ahb',
>>>>> aggregated into 'qcom,qcm2290-cci' node.
>>>>>
>>>>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>>>> ---
>>>>>    Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 6 +++++-
>>>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git 
>>>>> a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml 
>>>>> b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>>>> index 9bc99d736343..0140c423f6f4 100644
>>>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>>>> @@ -25,6 +25,7 @@ properties:
>>>>>          - items:
>>>>>              - enum:
>>>>> +              - qcom,kaanapali-cci
>>>>>                  - qcom,qcm2290-cci
>>>>>                  - qcom,sa8775p-cci
>>>>>                  - qcom,sc7280-cci
>>>>> @@ -128,6 +129,7 @@ allOf:
>>>>>            compatible:
>>>>>              contains:
>>>>>                enum:
>>>>> +              - qcom,kaanapali-cci
>>>>>                  - qcom,qcm2290-cci
>>>>>        then:
>>>>>          properties:
>>>>> @@ -136,7 +138,9 @@ allOf:
>>>>>              maxItems: 2
>>>>>            clock-names:
>>>>>              items:
>>>>> -            - const: ahb
>>>>> +            - enum:
>>>>> +                - ahb
>>>>> +                - cam_top_ahb
>>>>
>>>> Why is not to give the clock "ahb" name like on QCM2290?
>>>>
>>>> On QCM2290 the macro in front of the vlaue is GCC_CAMSS_TOP_AHB_CLK,
>>>> and name "ahb" is good for both, I believe.
>>>>
>>>>>                - const: cci
>>>>>      - if:
>>>>>
>>>>
>>>
>>> On Kaanapali the macro has been changed to CAM_CC_CAM_TOP_AHB_CLK. 
>>> GCC clock domain doesn't manage the AHB clock but CAMCC does. I 
>>> think it's better to create a new and more complete clock name to 
>>> denote the differences between them.
>>
>> Are there any other "AHB" clocks going to this block?
>>
>> If not, then this is more confusing instead
>>
>> Konrad
>
> On 10/16/2025 6:40 PM, Krzysztof Kozlowski wrote:
>> On 16/10/2025 03:56, Hangxiang Ma wrote:
>>>>
>>>> On QCM2290 the macro in front of the vlaue is GCC_CAMSS_TOP_AHB_CLK,
>>>> and name "ahb" is good for both, I believe.
>>>>
>>>>>                - const: cci
>>>>>      - if:
>>>>>
>>>>
>>>
>>> On Kaanapali the macro has been changed to CAM_CC_CAM_TOP_AHB_CLK. GCC
>>
>>
>> It seems you do not see the difference between GCC output clock and
>> actual clock input so some other block.
>>
>>
>>
>> Best regards,
>> Krzysztof
>
> No more clocks will be added, at least for KNP. And I acknowledge the 
> substance of AHB clock doesn't change. I will update and keep AHB 
> clock name the same as QCM2290. Thanks for both of you. @Konrad 
> @Krzysztof
>
> ---
> Hangxiang
There are several AHB clocks into the Titan subsystem, TOP AHB, core 
(TFE, OFE, IPE, IFE Lit etc.)level AHBs and fast and / or slow AHB 
variants of some of those, AHBs to the firmwares etc. It should be 
similar for any architecture, if I am not wrong. So should we consider 
using "cam_top_ahb" for it to be clear commonly for both Kaanapali and 
2290? Thanks.
>
>

