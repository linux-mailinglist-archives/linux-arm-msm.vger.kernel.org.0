Return-Path: <linux-arm-msm+bounces-85849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B42CCF956
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 12:34:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 160073024C90
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDCEF318146;
	Fri, 19 Dec 2025 11:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fUZDRAx6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SSwsHgK/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AE62F1FCF
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766144024; cv=none; b=U+FgnoeJvRsMJeM8O2c/ECOanloVM6V9OLK/LvKyKFTnTJF5hKOu8mYn8ma7EXZVP0p0+q8JqQBgyVSIqDn2qnyPAmMU317jH00gcRJFRh9UFl8tEqSQxE9Iah8v9/NV/nR4r0lA6hOQmbpJLmwenIUP66EiXPx7YAzPnTkHm9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766144024; c=relaxed/simple;
	bh=x3zhgf9Q0sOp4+j8ZJkL0IUjt5z5dlm6FUtLNilAkDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cB8fN7GBW5viAuddR1N9sVNobshySP8vdPEmYtkFapxhyxTmg9YoaWaH4tHUKKeQPJH86Sx67cEtEaQfNUuFKm6YqyB/m5LGMtjMN17k1u8Akvtho2oB3vOYHQf+12k8l6DHrp3bQzZHley/n7mFDSQYJv6OWOS2gpU0PKh6eus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fUZDRAx6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SSwsHgK/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJB968p3999438
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:33:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fMdx0pQw++OdmVRdKAe5y5wrvzemap1JR50aCfUHmCw=; b=fUZDRAx6yVvWka15
	K+Uc8YxCFiSuV3wtdByC0G7h4K2/0IFH7uwYhL9Wi8L98WrNwXEuwMLFp3YJ7DEQ
	vDIYPLb5ajcrHChN2wx5eVjP62eVzFsSb43ge/IVBqv5hN/L8EFzddicwUug0ZYs
	6Aqk/l4MSAPpTehblYmqu34znUJLK0AS6/uPRQkAnR1qgS0sDYzbkdc71BYMdEnM
	UYDjeoO7VKSTU+xyRkp9ftJd/ya/FzBtynmy+pKXdsvRySWcKBKN+fwamzwrG3cb
	xx+scurk0kLu02MCNMMwa7C8qdpoglOPpydzjRvUl5xkT/pS81Z616nFe0+KoUuj
	mO4OQg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r29jgy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:33:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee23b6b6fdso3027981cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 03:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766144021; x=1766748821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fMdx0pQw++OdmVRdKAe5y5wrvzemap1JR50aCfUHmCw=;
        b=SSwsHgK/GSH+RrfxNZL72mqiHKV1TMFfHZrGhvLrlv25UZAgWk9tHdkm7dpEuQNrxs
         98Fc4xk+x8SCV0pUlX2Zvz2xT9DRNpeBrIKDkWzhvkAzRCWNHmXNzFCWYTJ0TuBZRgDu
         IhAVsW8dmAnYS5KpytOTlSSNMAHlWfDDbdJ5JH1liQyvC+Sot/UUPc6c6wGPEYgSbLh4
         sTbXr0F9xuN/swelA+YL5xb2Zlo3zjE588KOuMBSVgTQj3xjfnWwkW9EIKWkNPkgLwHw
         oZz0AGowzhF8CASv3lx1X/kK97pLnIRWuwrsR8stCMiWmTaSUfBOjqvE/uLTYlihmevE
         oUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144021; x=1766748821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fMdx0pQw++OdmVRdKAe5y5wrvzemap1JR50aCfUHmCw=;
        b=Tt/sDu7v9vQ9hruer5275AvHWg5LAzrdyzJhkRweOtlX5SWp6t7273AEWe8VLcQU7I
         LyiW9vosIVV3Fb+ABlsynvzwuHI3sLej0NfLCitd7ucNqKDxYnYXG0thpL/vauflbOQr
         7Cc2G6FHXdPJmWPx3cglpjK59LD/BIv3RPI50Mn5a3TKV7ny5MMPjWy47tupOv7iw+Ag
         fzPE2U0ROAjDvWcEcGkGA6T9NBvFwoh+ZcCLYg6Mplqp9lK9rI26lM+pQhzQY5WNW2B/
         t9yfPibkXe2bdyjbSUYPa8mGKvbq3vnhW8WAofDv+Ep76TADxfDbyTc5t+DgmgH50eTy
         Imow==
X-Forwarded-Encrypted: i=1; AJvYcCW85/6V4UxCLuGuO47ZqgVpNqly6yESDKZAWapBCU7iHp93Yg44cGCP537OyIIYUr+Hb3I+MS9WKzacDaH1@vger.kernel.org
X-Gm-Message-State: AOJu0YylH7Jn8Ba6Luf2RcvUT9DSRvA1qDZ8HivCFaBU0UK9DoQZGcvW
	FMTH21tOij0AdxfizNceej+zxad2e50zWUQjXVFbx+SVJWzzzPj/5/K4lpa8Z/HxJ2u5CjPfWiu
	O880FLwOy9gKaHY1So5aiqGmBzJOLsboV+cshn08FjnsJXK9q6sEhqFcrIs2cnoaQV4rq
X-Gm-Gg: AY/fxX6ddtwuWMgpu5siMXF6uAJdRKJ89utxqRFPREBPxFSdzq9+4pCGei11TZ0vmj0
	6vVUi+43TscOBRguPy/0GgXFA9EG4ja4Jfeo7EgD+g8pvfi7ZYbapgvo8o7holTpeUFdAZaLdY/
	hxfPwromSYb9PrH+I3E+mPuBXG7w6MHsdiOZdJP3XKMn34qF9xzIVWyr0iqmyGVwYXpzYE7qg7s
	fvhRu484VM8GIYkKHF8YUjiO/gbE8ivb4DRKBfZfPDLFuIZPAWHMKQKa/qpmTy40qZ2Y27zI9k/
	Rg3qes+UpUt+dasC0YFj6l8V+ZVGroaypLds1vicfbWwgRXfPb2cuOr0Mr7ughiONrN/seCSMjZ
	TcS4rvAvNujNy8hawgdMny/4NgS8Ud8PXB13ijWAq1SA59Q/xhG18baexiza6BFRWnw==
X-Received: by 2002:ac8:7c49:0:b0:4ee:1a3:2e79 with SMTP id d75a77b69052e-4f4abddcae9mr23007181cf.8.1766144021160;
        Fri, 19 Dec 2025 03:33:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxqo/hY71IEBjcEElYEuPuhI0i/EacL5t30/TgMJPWqpmemlVJCS5TEqzKfvpqnuLoUyc/eg==
X-Received: by 2002:ac8:7c49:0:b0:4ee:1a3:2e79 with SMTP id d75a77b69052e-4f4abddcae9mr23007011cf.8.1766144020662;
        Fri, 19 Dec 2025 03:33:40 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b12dsm207708366b.48.2025.12.19.03.33.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 03:33:40 -0800 (PST)
Message-ID: <864b2dd7-aaea-418b-baf1-a0d1b452cf95@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:33:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: arm: qcom: Document Microsoft Surface
 Pro 11
To: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        ath12k@lists.infradead.org, Dale Whinham <daleyo@gmail.com>
References: <20251218-surface-sp11-for-next-v3-0-875afc7bd3b7@gmail.com>
 <20251218-surface-sp11-for-next-v3-1-875afc7bd3b7@gmail.com>
 <438a352e-5174-4361-b6e5-6ff5fe1ce0c0@oss.qualcomm.com>
 <CA+kEDGE42HhaWZy1o9DjpwcjPiJcqvq52o-_g+auOkp26ukULg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CA+kEDGE42HhaWZy1o9DjpwcjPiJcqvq52o-_g+auOkp26ukULg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P6c3RyAu c=1 sm=1 tr=0 ts=69453816 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=F5t3yZrAjdDg94tw__kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: zgtfYyzLzap1jSijaI961kj17kYolc3_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5NSBTYWx0ZWRfX/y+Fu8w1iObT
 lEDYkjLwA9HumD21hhgmgDZgFMsqw3rvsDrgx0rVGO03KxXAEQEr2bw2VOs0Nn3rzDcfgNwOxD8
 MMhMVtAatoto+6lY9aCd3ICcOosT3KfDOj6WMbtU+Sz6oQjItl/Ak2/J9RfMDgGYTvxEuafHYfv
 KSMBZ0Wtp6PuQiKlMNq27qc/IsvAAORHuMUMkF5MqaIkJ+L3A91wMU8lMo9mqHnK+elsoAbaRTS
 Z3lkOTu7NnK8jncCjEPG5I8XSRE/zrHp2mFSa0QKDipWqRM/tU7Z4/XqZ9F454HyRDGtEk32rZd
 tC46UMxASwyke0kflJxjLwi5aMcglR/kUa/kTMraGgDKSfawymrAhHlNfDQLhoalnJbLrf5/vkj
 9tj7OxKkGVhZ4DZdH8M1q/qfkJvX2rw940TLESbVv2QoJhtY1yZ0WhjU7FbSVH5JAaXu262yNZg
 WbCUAIx7KmIxUx8NlQw==
X-Proofpoint-GUID: zgtfYyzLzap1jSijaI961kj17kYolc3_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190095

On 12/18/25 5:35 PM, Jérôme de Bretagne wrote:
> Le jeu. 18 déc. 2025 à 15:15, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> a écrit :
>>
>> On 12/18/25 12:56 AM, Jérôme de Bretagne via B4 Relay wrote:
>>> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>>
>>> Add the compatibles for the Qualcomm-based Microsoft Surface Pro 11,
>>> using its Denali codename.
>>>
>>> The LCD models are using the Qualcomm Snapdragon X1 Plus (X1P64100),
>>> the OLED ones are using the Qualcomm Snapdragon X1 Elite (X1E80100).
>>>
>>> Due to the difference in how the built-in panel is being handled
>>> between the OLED variant and LCD one, it is required to have two
>>> separate DTBs, so document the compatible string for both variants.
>>>
>>> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>> ---
>>>  Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>>> index d84bd3bca2010508a8225b9549d8c634efa06531..7c99bc0d3aae3dc6e9c08fef0a535e114a3297a8 100644
>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>> @@ -1067,6 +1067,14 @@ properties:
>>>            - const: qcom,x1e78100
>>>            - const: qcom,x1e80100
>>>
>>> +      - items:
>>> +          - enum:
>>> +              - microsoft,denali-lcd
>>> +              - microsoft,denali-oled
>>> +          - const: microsoft,denali
>>> +          - const: qcom,x1p64100
>>> +          - const: qcom,x1e80100
>>
>> As the bot pointed out, this is valid, but not what you want:
>>
>> This expects
>>
>> "microsoft,denali-(lcd/oled)", "microsoft,denali", "qcom,x1p64100",
>> "qcom,x1e80100"
>>
>> whereas you're looking for 2 entries:
>>
>> - items:
>>         const: microsoft,denali-lcd
>>         const: microsoft,denali
>>         const: qcom,x1p64100
>>         const: qcom,x1e80100
>>
>> - items:
>>         const: microsoft,denali-oled
>>         const: microsoft,denali
>>         const: qcom,x1e80100
> 
> I was trying to group the 2 variants together, as they are very much
> related. Your description captures the 2 variants way more precisely,
> I will switch to 2 distinct entries in v4.

Unfortunately, in math terms, this is a:

ab + ac + bc

situation, as in you see there's a lot of repetition, but there's no way
to find a common neat factor for every entry

Konrad


