Return-Path: <linux-arm-msm+bounces-75305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B6ABA3883
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 13:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEABC1889154
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 11:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967022DCF5D;
	Fri, 26 Sep 2025 11:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XBUlLIN6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233332D0601
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 11:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758887269; cv=none; b=nxt+i/PQac5bbBVqJsw19VCobzi16/upv1SJbcto94bGpNUaYukoQ1fxWFqbW1O8EGicgUe9J9b5ZY7WXSe5YVmKkCdQTL0Xp0uPJgO63JwPYI2VmWdVTJ2tS++TPy7c1bGRZJLVdulSxxd337PjwWxeu9KPnqYF1RB7kD6d9VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758887269; c=relaxed/simple;
	bh=OAgwbS/VknejtABxzuaNwsXHRFEJYCx7WnLwqMVsnJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O+CHKe+OY5X5tvRt7wJqJ3yERNFHhhGYcRu8s+hT/tcFQkbsuKMjZbrJN42XUjtUkQOkjrBW6/fvm5fjvi4cGmSTUAcQgCZqbQ0GLuDtAGpuYoVpfbqPvLcAjD94QYuUPX2/Sqpscww+PKF0h2awOn8AndB3Y2AHd6jKaL0FWtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XBUlLIN6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vY6L028367
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 11:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zeXt8RmZ2p5jBB+q4SRx697VU8GfH0Yutu8AdTfa1to=; b=XBUlLIN6zCNjcVfb
	t6IoF1uc9+Ascp3//GivOuaaeYuAa3oHjIpWzHBWLuZnIPmCADG4qL4L8QgZdjhF
	o2NLswvvz1ctSKn8J+0ulZebyL1VZP4rnBjh+UlFt72I+eIuS4xc6RoP6KN8FUmg
	uRmNLWBl2OLMVcKK2RjKJt/PtCqfUtBxIvnWsvnZJpwJNqKbi/BgqL5sfe9R9FxC
	xXgCFo4wtek8uL5eRO7iyISPK3mhnW+44WNDAu4Srxk45mqQak6nhxY49477wFcP
	WwF4oZVCcbp46Wnb33q1zyFsjqgBfybUq1+TVjPBZGErhPsR6VuohFtDwTHtqK9G
	KsGflQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q2pmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 11:47:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-85e23ce41bdso55385685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 04:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758887266; x=1759492066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zeXt8RmZ2p5jBB+q4SRx697VU8GfH0Yutu8AdTfa1to=;
        b=G3y9qCNPQuBl03XLr1WkFwnWSsNEExvGJV0YBjhVFOYLV7UKQIl51Ac7ZWkmmno0iT
         Y/ivknkhqZXibvk+vMGwpQGInubHyQneg7xDHQgvXErDuMRpWDkNRuVTGQla8iW+yhk7
         jc2MNiizVi4FvkHd7P5Rmg7Rg5IavV1lx8f+knjn9LgiMCF1LtMpsnv7ysnGlWXJezia
         EnxcCrpg2DvrQxKTA8SmNFi5sgOKCnglOefg8qjpFSEf7CWkHEirWHQskaA5spKMHXif
         6qNJv0B1uEHKNVFe+DWqaQ3CTLCfmZh7217MImFM5pnmOyKCXFvJRmrYgDfC1qWHXRXJ
         xltw==
X-Forwarded-Encrypted: i=1; AJvYcCViKu/CL0Iyv54jPdwd0XiR/l1Wyp7rWhRTH/Iy5s190rbFmKYPpi1jVv18iBqXvgl7GHjYY31SnkJ6IiNI@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3nMT0aSARi4Sa8Hd0OrD/WBB2vbBT49qheVq9iiJzHcOp+sOJ
	Q8iHw+RLTLxN2YyPVPbXpKBNQu+Z47EHS89gMkQzG/azCygCydkPj3zr/ayr6wP7GJLQExeqcoz
	ES/BNB7FhTcXn21+cAkeF1aSWEvsR9v7LWIf4G6mBl7dJ019LMsfwKoW1l9T/TuM65jpm
X-Gm-Gg: ASbGncupElAcDQvz1irUhczojGfRt8rYHiVLHQEOJgnv7s+EAKTEk5g1Lm3dvGQ9iyE
	TpMmZRjou3Uyp7TohK4sO06ZQxYcHTkZFUIPnkIyb7SlkX+AtdgMZcZ395Ar62HPctrUaX4emgU
	aBOq0S+rsHzTg5liV4B6euMbgI1WRTT+C5rGJGq4PTDPhxVJ2xhn1iFI+ygXSWbm8Kgz34EVTWw
	eSQ+USJE/cj6+9NswjtdbNS3yez4rXnVEZyoV+wWDPoc93kLijGco/Ly0EzT6kwga8qsUzNIWPZ
	iNLacvlfqhGmixQoEAaTdTLNT6CbeLOMoZ/YQGK7pILfoqbuNtgkHGGMG9EArHzTf8HPnLDGx9A
	mYrf4kYzjCKVId2iLPV5Zag==
X-Received: by 2002:ad4:5dcb:0:b0:797:1974:b824 with SMTP id 6a1803df08f44-7fc2740a087mr61520936d6.2.1758887265863;
        Fri, 26 Sep 2025 04:47:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr5bf6UETViENcg6o3qIp7ZoNsIv4FMqZ6Ft48XN9AJDhNwFvEybD2BRdLu3eBM3Rbt2dbWQ==
X-Received: by 2002:ad4:5dcb:0:b0:797:1974:b824 with SMTP id 6a1803df08f44-7fc2740a087mr61520556d6.2.1758887265269;
        Fri, 26 Sep 2025 04:47:45 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae31cfsm2693665a12.33.2025.09.26.04.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 04:47:44 -0700 (PDT)
Message-ID: <7c6ab647-0c54-4480-9eb2-5c2bbf5f857d@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 13:47:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-1-e323c0b3c0cd@oss.qualcomm.com>
 <nuunkv3xwfes6wed5xf4re2efakndvvrfl4lhmenilkic4sjiy@5cb2f5ygegvm>
 <522d7244-0003-a42e-9be0-1d353df8d5bd@oss.qualcomm.com>
 <oimuo26ohcye74j6rl5hfbmd4ip5wzudhyiaibf74b5zmjb4vl@xh3dnp7gmvq7>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <oimuo26ohcye74j6rl5hfbmd4ip5wzudhyiaibf74b5zmjb4vl@xh3dnp7gmvq7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX8vr6u2HiaR2R
 L4LsC36nEPg8idhVLGT3KrBxgM4RocRSD6YGJL6MSW9Vk8p0iUC380vc14VjXkoP6VoFriFIt3o
 Os5nkz7ZpXg5Aic2Yf2icPzctgfuEdJ4Ci3BP1z7B0+roGsyp3uI7wvlPG2D7vayYoz+w7qzBcX
 r8rP09KHrJOyiWZJfTHg07zxj/yDkcRU+OgqbYFAeShYcSBzn0iHTpi48INx8wjWPxb6TB24G71
 u16eK2Bsc2skTQQCVrWwZmsOD+A5uQbMJvqQe+RMvplA7EMI2fVTbleGzAP3/a97s1qwVEme2XQ
 XPnq+IuqAbk1O8D2P8w/8QK2qH3rM4TpEuR/scsMetL9vKpTw9QNTMeZwWWBQJKFEOrPWNyhDCR
 9Y9Ekg6cAqBsOAPwrOKGKGXW6/Hhow==
X-Proofpoint-GUID: fJX6umQaY2_nWmCMo0rkD24PG5S3QExM
X-Proofpoint-ORIG-GUID: fJX6umQaY2_nWmCMo0rkD24PG5S3QExM
X-Authority-Analysis: v=2.4 cv=JsX8bc4C c=1 sm=1 tr=0 ts=68d67d63 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=4CA5EJrnJ1NXJjxpXhEA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On 9/25/25 9:38 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 26, 2025 at 01:01:29AM +0530, Vikash Garodia wrote:
>>
>> On 9/26/2025 12:55 AM, Dmitry Baryshkov wrote:
>>> On Thu, Sep 25, 2025 at 04:44:39AM +0530, Vikash Garodia wrote:


[...]

>>>> +  power-domains:
>>>> +    minItems: 5
>>>> +    maxItems: 7
>>>
>>> You are sending bindings for a single device on a single platform. How
>>> comes that it has min != max?
>>
>> I was planning to reuse this binding for the variant SOCs of kaanapali/vpu4. If
>> we do not have min interface, then for those variants, we have to either have
>> separate bindings or add if/else conditions(?). Introducing min now can make it
>> easily usable for upcoming vpu4 variants.
> 
> No, it makes it harder to follow the changes. This platform has
> this-and-that requirements. Then you add another platform and it's clear
> that the changes are for that platform. Now you have mixed two different
> patches into a single one.

Vikash, preparing for future submissions is a very good thing,
however "a binding" can be thought of as a tuple of

(compatible, allowed_properties, required_properties)

which needs(asterisk) to remain immutable

You can make changes to this file later, when introducing said
platforms and it will be fine, so long as you preserve the same allowed
and required properties that you're trying to associate with Kanaapali
here

(i.e. YAML refactors are OK but the result must come out identical)

Konrad

