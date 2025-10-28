Return-Path: <linux-arm-msm+bounces-79134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F9AC13C3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 10:20:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72F901B219ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 09:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1F02FFDDE;
	Tue, 28 Oct 2025 09:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MmNLpI80"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CFD2FFDCB
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 09:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761643150; cv=none; b=MlPA5yKSYesQH13H+1gNkCp5PMZ5UHa3M8Uhbsl3D2MUhc0gWR27Ai4kfIYFNVYKjJhpYEKMGWYTuBPlaj2eXncahFHpO5+Je88qtxbXnbjPphF3HC4SltBuDlNRHVsorx5Z9/7xWOKALciNpiu3QRJmv91+Odh+ktGcw1ynbag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761643150; c=relaxed/simple;
	bh=Pnj/ANiWZ3zbGY5THI/UoM08Gmvsdy56Z74g/owEQ3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gQNMIsjUyULnYPdRnBQB6wWNsFLRy09/uLwUEcPogsy3hcZiJuEAeenpoAze9/UDKjJCbjZgWPCQgF4xRt1bW90Bs1IFt3xwjtWoYRbai4FkC2zLtgROjXJkaF9VtGGqFGxbzK1yXvG0GKOEMU8N6SKk+pzCTafyDp8t8mMvMC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MmNLpI80; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S8EjxS2752247
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 09:19:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B2aobvIHktpLHzNo8G24JAfXJ2XnQNll5brV8BTWDVI=; b=MmNLpI80nEebDgZ1
	s3rkGaYQWPTE9Gx+uIdVyzPqz9I1hYJNGUccRNWhQ7EEmU1NKWSVmcmGyPTsitLY
	70zNPZ+8X+DZs8esFMzKUwo4UR9wCwLdkyYnTS1gGN1W1eQSLuG4IXqQw1thMYjM
	4guYoA431eickn4RGF4i/+i8m8DMvvUwJLwadn/PNNaA64LA0oNryiX8Tgb6igxR
	//0ux2IWF0z9d3Osp8XmiBQ+tsrYW3kMAu/UegItMzNCKescDxZZH+MXZdLxxPv4
	mvSUR5UWaMdPM14g0yOh7edC2TVD4dtsJmcnYccp8jBbncnOc1J+r9KjS5IlvI6r
	xRaLnQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a28swke7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 09:19:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87bd2dececeso22952486d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 02:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761643146; x=1762247946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B2aobvIHktpLHzNo8G24JAfXJ2XnQNll5brV8BTWDVI=;
        b=WmrVjRmYGxbG7nncl3b5hA0OlNIg3dUd4mCcyj/plHuaZeBXfYb341k8tBVuQC/Pf2
         OZ9eOQYD0tuJ0DJ4H7aJ7/v49DauDa7p91lPIS4pyhJ5z0bOQWWCcW9WEnyOlzAAPVKK
         WQgc0g4OrWeQEvFjuDMgqAea9ZTCkrUrtRs/JO30iV612Rg/6BIwwMApSd1nvqathiwb
         vajvWWToFLd5mOYarCkYE41N1KN6cOTgHmkR5FWnsAK9Z7a4d8GmUJW9NKwtXxuzIh34
         1w320eTPjEKLa6OQ5jJIJLSSQbPRRKqdWk/znz0W1H/AyrwAPgqVA7XGBya9meTqdz1t
         2I4A==
X-Forwarded-Encrypted: i=1; AJvYcCX+S4Oy5nyXRA8nqmEd8PiksliZ8f/VoScaQ1Xnxltzv1DHKby3dk272qYQ1h2csIXWAa2NwBOwI3eyp5f7@vger.kernel.org
X-Gm-Message-State: AOJu0YwscECElCagpCUZf0cHbuklmsqjRWoizlrbsDvBFv0TRha5Vle3
	kpiOH3cq9ZpZQbOR++zG5EyoEaMDgNpXvLXu1illQT4J8NfWreFnO5Qvs4QaY95C23d030m25NA
	dRXjMtvEa2re3ZFlES8y5hfPef3t6HzM4VHgqxRB+4n43BmY10qjz3hnfpertOkd245xy
X-Gm-Gg: ASbGncvlNtTm7mKM5fNcRBUA7xwUXBsCQ1uymufuE3XAND8r4pqfzUgAYnzSX03m0v0
	3mjKXM1dYDBErOkt8WRpwBhKk5CaNEc+i74EUxqZm5p2Do2oXWpx93kE40dxFoxKHZ3rs0bMJCT
	Z091ABriZO3jsNGpOaDz9qI7t3CDcL77vPTyWxhWegQC79jMDUivPbohy4y0/YE4Eor+FEGiNkE
	q/+RmwersclPVo6bpfFfSf4mFgCxxsZqq49KsXVUOELqiUuI+Fj/k/Tzh8I6WAADxBXDp4joQkN
	tJOKn2PgouQE1whyokgdng00HtZG0tB0Ye6yija5I3p6qlvh5VX1Q1qxYOqG9uhuTOrGWVXOiXp
	sbYaZBY4bKDViIrDvino3BDMQfr/q2JSMgFtR5dgQVzzTJg+l/Hx+dNy0
X-Received: by 2002:ad4:5cab:0:b0:87d:c7db:7897 with SMTP id 6a1803df08f44-87ffaffe2dfmr21043526d6.2.1761643145818;
        Tue, 28 Oct 2025 02:19:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEurnIObiANgUA7/WbW6dXnIR12D0Q5V5D96yWxFPBx6HjF0EpwoTt8uaIEOM3yWKyv4b5smw==
X-Received: by 2002:ad4:5cab:0:b0:87d:c7db:7897 with SMTP id 6a1803df08f44-87ffaffe2dfmr21043356d6.2.1761643145401;
        Tue, 28 Oct 2025 02:19:05 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8544f8eesm1009886566b.69.2025.10.28.02.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 02:19:04 -0700 (PDT)
Message-ID: <2676d88f-89a9-4b1f-895b-3bdc048f6fbf@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 10:19:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add
 Kaanapali and Glymur compatibles
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251027212250.3847537-1-anjelique.melendez@oss.qualcomm.com>
 <20251027212250.3847537-2-anjelique.melendez@oss.qualcomm.com>
 <20251028-private-chirpy-earthworm-6fccfe@kuoka>
 <4cb41e69-fb32-4331-a989-529b5af0081c@kernel.org>
 <918fc9d3-2cd5-4442-8bc6-b930596d95c1@oss.qualcomm.com>
 <ba760468-ac41-48e0-a56e-a675c3c0d5b7@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ba760468-ac41-48e0-a56e-a675c3c0d5b7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5Yi2Z4NdIFtGGtAQzv_flHRrc2vLbWQJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA3OCBTYWx0ZWRfX5nuovX+HSM/g
 wIVth/XsPgyT8Ke23aGW2r3u7ENzLzHDXLhk2qCCZqrONw8njOKM5g6DyymCWkEfHAVnEizP4OI
 vgfUD+frT/g3Q0Ru+Aec0nsZLzuCLzFHKyly2ZcIsdXy2RviwU9hWmeAtXANupfrItehSzdd1kw
 DR0puGghLiJlaykl8RoJZ233JEmEtF7zc+3xUuJKWRnSEcMelo/MczKwovykWNl4TXyLIDNUTJs
 XtdiXHRhqnyLgLQUZD0HXcazIL0ntfUsaprQ33KYWVR1k9x8VrLJYvFBWlhEUBFqqN6BpX/A2Yj
 zXbqhuWbH5AeEJIWxfH2rlQXT8/BMBIwm3T7LqdaNCnZ4QleL3n4Wbr8oX4N0CIPG5VXAysV9VI
 2FK0X1NowNwQuuHFuS0SVqg7FB+kuQ==
X-Proofpoint-GUID: 5Yi2Z4NdIFtGGtAQzv_flHRrc2vLbWQJ
X-Authority-Analysis: v=2.4 cv=fL40HJae c=1 sm=1 tr=0 ts=69008a8a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Hujz_9XNg8WYzFnulF4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280078

On 10/28/25 10:16 AM, Krzysztof Kozlowski wrote:
> On 28/10/2025 10:04, Konrad Dybcio wrote:
>> On 10/28/25 9:36 AM, Krzysztof Kozlowski wrote:
>>> On 28/10/2025 09:29, Krzysztof Kozlowski wrote:
>>>> On Mon, Oct 27, 2025 at 02:22:49PM -0700, Anjelique Melendez wrote:
>>>>> Document the Kaanapali and Glymur compatibles used to describe the PMIC
>>>>> glink on each platform.
>>>>> Kaanapali will have the same battery supply properties as sm8550 platforms
>>>>> so define qcom,sm8550-pmic-glink as fallback for Kaanapali.
>>>>> Glymur will have the same battery supply properties as x1e80100 platforms
>>>>> so define qcom,x1e80100-pmic-glink as fallback for Glymur.
>>>>
>>>> What does it mean "battery supply properties"? Binding does not define
>>>> them, so both paragraphs do not help me understanding the logic behind
>>>> such choice at all.
>>>>
>>>> What are you describing in this binding? Battery properties? No, battery
>>>> properties go to the monitored-battery, right? So maybe you describe SW
>>>> interface...
>>>
>>> Or maybe you describe the device that it is different? >
>>
>> Certain versions of the pmic-glink stack expose services (such as battmgr)
>> which support different features (e.g. 8550 exposes state of health and
>> charge control, x1e exposes charge control, 8280 exposes neither)
>>
>> There seems to be a similar situation here
> 
> Then say that. Otherwise it feels like describing current Linux
> implementation and that would be obvious no-go. Why? Because then
> argument is: change Linux driver implementation.
> 
>>
>>>>>
>>>>> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
>>>>> ---
>>>>>  .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml      | 7 +++++++
>>>>>  1 file changed, 7 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
>>>>> index 7085bf88afab..c57022109419 100644
>>>>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
>>>>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
>>>>> @@ -37,12 +37,19 @@ properties:
>>>>>            - const: qcom,pmic-glink
>>>>>        - items:
>>>>>            - enum:
>>>>> +              - qcom,kaanapali-pmic-glink
>>>>>                - qcom,milos-pmic-glink
>>>>>                - qcom,sm8650-pmic-glink
>>>>>                - qcom,sm8750-pmic-glink
>>>>
>>>> Why qcom,kaanapali-pmic-glink is not compatible with
>>>> qcom,sm8750-pmic-glink? If Glymur is compatible with previous
>>>> generation, I would expect that here too.
>>>
>>> And again to re-iterate:
>>>
>>> If X1E is compatible with SM8550 AND:
>>> SM8750 is compatible with SM8550 THEN
>>> WHY Glymur is compatible with previous generation but Kaanapali is not
>>> compatible with previous generation?
>>
>> The announcement date does not directly correlate to 'generation'
> I don't know exactly this IP block/component, but in general these SoCs
> follow some sort of previous design, thus term "generation" is correct
> in many cases. Anyway don't be picky about wording.
> 
> You can remove the generation and statement will be the same.
> 
> If A is compatible with B AND
> C is compatible with B
> THEN
> 
> WHY D is compatible with (A and B) but E is not
> compatible with (C and B)?
> 
> Easier for you?
> 
> Why nitpicking on wording "generation" instead of explaining the
> problems or issues with bindings...

What I'm saying is that Kaanapali and Glymur are disjoint projects
that shouldn't be thought of as having a common base

Konrad

