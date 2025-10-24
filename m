Return-Path: <linux-arm-msm+bounces-78737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D85EC06A04
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 16:10:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5FC43A7B77
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 14:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FAC328489B;
	Fri, 24 Oct 2025 14:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hf4JTpxp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667202F39BC
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 14:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761315048; cv=none; b=aDkwmvjDSwzDbPK8lLLEKJf9L1Ytv/Vjk71CcfoXJSQZ4oVe7FYc3Fimc3ZPgM0gceRZJSqyQOCNrH84rSguM42JpRDfNm8vHVR+QZwDOa2uq7ohmxb6y+rZD6uZenwhvVo9aJf/SsWY9JgFZhMeNkpR98yyzCvq7D7pyKuzFO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761315048; c=relaxed/simple;
	bh=6EhyPMORGQ8dQ66Pg/Ba395+tsOWWreONj562IkAF44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kqieUteP4xLzgq7YaJfrOrCiNKMfAzUKanLkRz8XoOH1hl23hKh8ZPer6jt5cDGXIJvtdYv93361EYfINzv2bN7SP6LRhJI5Pqz+u0gOJfUM/p19dsRBpH4h+ew1hWrejfVtGwd2sC1DHLKXBBwuYCRkRP+lkgIsEXx1Ypyyo6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hf4JTpxp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OCS971003822
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 14:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2EwzhNU0hLrCYQoy/rgZGyJrIlbbka4ufJYL4tWLm4g=; b=hf4JTpxp6ZTNoAXi
	KJP8KxE23HU7Aw7/yQWj6QU0lRdhrQ+QV1hgrZ5bIuHt//DhIHGJkztLNevie8sQ
	Alugi6oMfJhQCJCN38YNrEKZYdf7zvbsAP33Tz9Z7MqocwpWncq2c/8qkf0XBbYP
	kx01T4wZhfV1pYsywBtyfbuQOChFuEyIery3QgrAfWXXNchXCSmqSHOz++gQDWIP
	hwEkiZSFM8oJbk7Z8XAkJip2LZs2H69effn9DdKtgytwf73cK7X0OAAD/VpLDV/y
	SJcVpFbJXmKn1Z8x0nt6xhcRTHLXffW8kkol+Mnas4QjB6T2aV7dXqAr1ibn7iLM
	tI1Vag==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27jc51v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 14:10:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-290cd61855eso19402095ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 07:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761315044; x=1761919844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2EwzhNU0hLrCYQoy/rgZGyJrIlbbka4ufJYL4tWLm4g=;
        b=HgMbAZRkSvrqToD9rAHBdQunG2OpGoABV8z7BBg8qSNHpa7IkbJsmjDcznuWVQtCk6
         dV+y84gE8KibfGE0mOQJY9fqU+WaqkqlZhQkMYBXERcfrN7jYfiSKAkMzHPacxZhAYEN
         nMAlD/k22n+/HAb/9Iua3ho5IdrlPK8O6jW+V3Wv7tfgeG5qOZ8L2nn5fC4yKk2U5dZ7
         e4i62Ql1CNVpJN43oAUjZevF10NAlBgmkS5pF3CiOJ5gnhYtSwgKKpS5uWUZoPn7FR7r
         9qOyOiua2xrMgVlz4n/2H6TzES/IbcfikEWYOZjGQhAGhLDQJ+6NZ6gdRNhYrnnNSyBP
         FI4Q==
X-Gm-Message-State: AOJu0Yzl9rfhJAkqT+KPGs6oZsm0EiCYe4ZMQc00/iG35bz+gIE7UatR
	Df283FrTWynzTVJW2a96pmapRMaXrSqlcXHC8X4uls6Tfbb/AfeS/T8XsYghRDY+i785p4l+81+
	cXQOakekYy7Yjsop2h1a2+JmjjggIGYU9Uw/lvD1p60rO/IP8/Lftf5YEvsQnAjQprDuF
X-Gm-Gg: ASbGncsBYUB1mMfWB22MBvocNJog8wqujvrsMmBzixggQF567ccOBOBJe7WW6UR2HGj
	qucNkL5vR7OE/E353pK8fQZrWs4EDjsZplBFLR/8b4On4FmUyYY0rZ+C1s1+tTZi3rP5NlBQ7r0
	ua2jwzpDSrDucnrQMnA7tGd23NSkFC+tyaU1nkLHpLYiCeTYNiZAGwYIhKhs+6T8dV95vHajz99
	YlSOoeju+LjBY3DxdAxIwb/QpRmYKZ+MZyCLe4tDHNN9kyGUJmiNGiusUKOEqh5k5PZ/5UBsUyD
	ph8WeigOOuXEcQ6/Xm7eifiEaJGxWq7V0wO9kTmEDEhjelcVYHAYyGmcRcs9dm6YrXIJlx0JEUl
	+o/XyZzaw9NhMl/HfCCwgoQ==
X-Received: by 2002:a17:902:dac3:b0:273:7d52:e510 with SMTP id d9443c01a7336-290cba42370mr374643295ad.58.1761315043568;
        Fri, 24 Oct 2025 07:10:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCxbxbl89eRys7AEmR9vsf2AEBuj924PXVSollg/7tpRp2GR8BpHCrwzGDrKdCguLCpt+ZYA==
X-Received: by 2002:a17:902:dac3:b0:273:7d52:e510 with SMTP id d9443c01a7336-290cba42370mr374642585ad.58.1761315042915;
        Fri, 24 Oct 2025 07:10:42 -0700 (PDT)
Received: from [10.204.104.20] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4e0a43asm5250189a12.27.2025.10.24.07.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 07:10:42 -0700 (PDT)
Message-ID: <c7334b38-3d6e-4fbf-a385-40551fbb7c93@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 19:40:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: display/msm/gmu: Document A612 RGMU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-3-0baa44f80905@oss.qualcomm.com>
 <8f3f4874-2e82-473e-87bd-e3bd58089b90@kernel.org>
 <181af756-09a1-4694-98c4-53cea556e172@oss.qualcomm.com>
 <ff37b635-b3dc-4180-8eae-e798ef6ce55a@kernel.org>
 <f677f8ee-d635-4131-8ee2-8ca6ead43095@oss.qualcomm.com>
 <qcs6y22hozfmb2ipmahfw25m2xti2gr5kjn43c2woiueqe4xmd@ovnrhwibhhe2>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <qcs6y22hozfmb2ipmahfw25m2xti2gr5kjn43c2woiueqe4xmd@ovnrhwibhhe2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX22sTOHuoY1y7
 RYtshydNXlpsMcXhCWsZ7bDC6O+EtKGq32MuAnWU6NzN9Zh2xodak8KVgDmOHWG9/lcZ0xINZ8f
 FEgqj0NsCYLci+Pq7pyyn1usWKc0iHXGhd5drmv95FX9w341bnIngpoDUz3of8rvZdIW6PkJg8P
 2nQ63pHbRRD7UAw/2jEUoDg8V8TRu5n9vx5p//05FULam+9J+tzJ5pj1Ot+ZYvxJcnOrNbTzumc
 egpBVtH7pcz5H6VMtGXBBKW5rybTFiOt1jk1TFOtbukNEvQyyuo2pU4iS/NigDERJ7wfl1400im
 Mzd7S0Kvfja0ABCo3gXx6HBxjBofEeZqjEmUI69st/UCQOURfA9hZXwN/WP6lvZNFy1CpnFn8Sd
 LC53oQ/kGYONRYuC4QGWEp1tagZwQg==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68fb88e5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=V0jSdCJ6aHfz9AKaKsYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: VXSkfxlHqHy81RdU5-zcHeYHfNJ4rEP7
X-Proofpoint-ORIG-GUID: VXSkfxlHqHy81RdU5-zcHeYHfNJ4rEP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

On 10/24/2025 2:58 PM, Dmitry Baryshkov wrote:
> On Fri, Oct 24, 2025 at 04:33:28AM +0530, Akhil P Oommen wrote:
>> On 10/22/2025 12:49 AM, Krzysztof Kozlowski wrote:
>>> On 21/10/2025 17:51, Akhil P Oommen wrote:
>>>> On 10/19/2025 2:43 PM, Krzysztof Kozlowski wrote:
>>>>> On 17/10/2025 19:08, Akhil P Oommen wrote:
>>>>>> RGMU a.k.a Reduced Graphics Management Unit is a small state machine
>>>>>> with the sole purpose of providing IFPC (Inter Frame Power Collapse)
>>>>>> support. Compared to GMU, it doesn't manage GPU clock, voltage
>>>>>> scaling, bw voting or any other functionalities. All it does is detect
>>>>>> an idle GPU and toggle the GDSC switch. As it doesn't access DDR space,
>>>>>> it doesn't require iommu.
>>>>>>
>>>>>> So far, only Adreno 612 GPU has an RGMU core. Document RGMU in the GMU's
>>>>>> schema.
>>>>>>
>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>> ---
>>>>>>  .../devicetree/bindings/display/msm/gmu.yaml       | 98 +++++++++++++++++-----
>>>>>>  1 file changed, 79 insertions(+), 19 deletions(-)
>>>>>>
>>>>>> @@ -313,13 +360,26 @@ allOf:
>>>>>>            items:
>>>>>>              - const: gmu
>>>>>>      else:
>>>>>> -      required:
>>>>>> -        - clocks
>>>>>> -        - clock-names
>>>>>> -        - interrupts
>>>>>> -        - interrupt-names
>>>>>> -        - iommus
>>>>>> -        - operating-points-v2
>>>>>> +      if:
>>>>>> +        properties:
>>>>>> +          compatible:
>>>>>> +            contains:
>>>>>> +              const: qcom,adreno-rgmu
>>>>>> +      then:
>>>>>> +        required:
>>>>>> +          - clocks
>>>>>> +          - clock-names
>>>>>> +          - interrupts
>>>>>> +          - interrupt-names
>>>>>> +          - operating-points-v2
>>>>>> +      else:
>>>>>
>>>>> No. Don't nest multiple ifs.
>>>>
>>>> I guess we should split this. I will add a 'required' constraint to the
>>>> rgmu constraints above. And apply the below 'required' constraint
>>>> specifically to 'qcom,adreno-gmu' instead of the 'else' fallback case.
>>>>
>>>> Please let me know if you have any suggestion.
>>>
>>> Maybe the binding is getting to complicated and RGMU should have its own.
>>
>> There is just a single chipset with RGMU and we haven't seen another one
>> in the last 8 yrs. So it is very unlikely we will see another one again.
>> So I feel it is not worth splitting this file just for RGMU.
> 
> I'd second the suggestion to split the RGMU schema. It's not about the
> number of platforms supported by the file. It's about the clarity. I
> think it would make the file easier to read.

Alright. If there is a general consensus, we can split out RGMU schema
to a new file.

-Akhil

> 
>>
>> Let me send another revision and let's take a call after that.
> 


