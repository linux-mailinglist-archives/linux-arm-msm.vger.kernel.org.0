Return-Path: <linux-arm-msm+bounces-75325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 025C9BA3FF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 15:57:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F0F64C6AE2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 13:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D228E2FC86B;
	Fri, 26 Sep 2025 13:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kpp4eoz7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D032F90C4
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758894940; cv=none; b=rRvMHZV44nQ/H6Xhmgf6xnyXn8cUibHnOzlszMcMkJ9KSZDHquwMbjcnqd0OD7vTera74FK4xd/Ycs8Svw6buZ9XGLpKduhCLP5J+kvV+0v6aKxMMAeg4PPXR6Ht6KtxFhGk3vyt01WuxiRaQAxe+rUj1zOFweLVyRnbQE9AXkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758894940; c=relaxed/simple;
	bh=LJ+ueTE0bDWUCWdc4ScZPk1W991TIS8P7+CZKeVEoAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rLjvRGTqdW+6smpP1lA5aEEHAW2G+Y9Yfn6tNUlX+clm+nh6b9Gpp6HW+rmZ9HlzFKS2DXZp1ElavXIMqmEDVafcDze/25vme41YGoFnVmILgFXNG8Qdw6tfM5Mh430gYZsgJThQHkawH9/Nrq8AbaQfBUHQKIGjC46omVwwglw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kpp4eoz7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vqfZ029048
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t/0WdPEeGFmFc2UEt2SE4Y9yd1OQcuTfJccTLwtozas=; b=kpp4eoz7wkAJpTiY
	w3yfFTh+Bpv9NrC+mwKmIufcC4wgRwEh4Rp/91KmFbSwub5F3gR5G8Cgf4vLupMV
	WWSEAna2qAB4KH1Ki0WdK6Yd/qvaWssNCr9utyk3p/XR/AEEna9LMubNb9cJo63M
	xzRuN48GwZ5WCO8Y70MU4j7NBoPKWuz1/m6hfTp9cxIusrHNm+sAYeJEbhxs2/Gr
	SedeS38rpCMEEKHZrGiC+93p9bNpj/ILJR7qoNCfMcc/qe3gLJgpO6KcKRrY5zBg
	cH6udCIlvXwNWbqOM8UoBitCikQX3bkWZNDEZ+ogwR4AmdpboAlvlRgAj8mKxa9F
	NQnEmg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q31fm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:55:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b4c72281674so1431547a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 06:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758894938; x=1759499738;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t/0WdPEeGFmFc2UEt2SE4Y9yd1OQcuTfJccTLwtozas=;
        b=ROFbAyKskw9EggErxloPrh0+nQ12zd6M3p/kGMYtP2828F9V+E/w5QTDeN6eKgXgVR
         oP4xu1FUKBIr9davlBpsTIUlm0B50UaEtsseDEn6xxbyEibpIYHbWsgKQmVzevlNl+Rp
         KTchz24MBiQPY3kXMTcGU6yePau3l3Zk809G5q8lcQygQKsGp9GYQ7PwaOSZBecVeCmB
         qTkYgr4NpAW0CWrlu5N+M0f5PQexc8BK0J/FWekM4owriUX5ylPPhW/BtPTA/HXi/dyJ
         S4c6M+uQT126fn4N5B8qP+RiPaSvKbQpDGVwvOgOgR0ZViUJbILjuj3xFOXLOw4LQVgi
         T5XA==
X-Forwarded-Encrypted: i=1; AJvYcCUTIWPNb5SeV7LN5SFOOdxPHWugd+/ORHuo5htDCH9px24aSjPxuk4AMeywNYSZzEZAuB25zyGZi1dsNd8F@vger.kernel.org
X-Gm-Message-State: AOJu0YwLqpI4CWyJK2QFHFk06Fz8Pw7pZ4Xwrvfwa2g3YCUegzyMyeGU
	7Rt1VGGM/zu/a/vNVaXjB03684CqX3a+BU2JrFcEmz7rKwr+J3SPJRGeI+vI5rHpTvQ4jLbBKWe
	DtwcsXjvOQ9bgAcF2+pRtJ3Pl8cHdtvsm2cYc4KmST7vap1kpKrl13YfILsQ22g4tXClJ
X-Gm-Gg: ASbGnctKTXi2ncdm0454vqUG+vRRibq9OxcIvQnWNzjwv7ZPQUh0fDFtO7iM5J0oYCD
	98WYOITTfFCQuJQV8PjPGbJT1ytmpJi3pqICJzVudFDz9u9al4LBCoy0p8VzMzvJCqwPnuaJZyB
	O26Xtt57jTTT9+Y38BvkuaVBpBeStY56wq6WczJNctdUCViMDWjnJNiWAMXutHLr83YIZiMxBUx
	TzGHH51ev1cUv6fqoYKQ7aY1cotXWmYcKHq5IjD5O3qOw3tcAiMNzmdus7ym0LZf7jLZmFybviE
	u4TRmvvzZiTiz/4j5ezCRX9MFn9QNqD1pTDtAovVPaCIbAQd+vMH4ONBGhPOaZ+mkkqnyaJM
X-Received: by 2002:a05:6a20:3d88:b0:2e6:a01e:f229 with SMTP id adf61e73a8af0-2e7cdda13b7mr9392166637.30.1758894937583;
        Fri, 26 Sep 2025 06:55:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQn3apaZplc6IpGFkileVv3rgMceoNRvwTZIfdt27hxJke1P6Jas/4sFLWPbGfnXSZUbQ8VQ==
X-Received: by 2002:a05:6a20:3d88:b0:2e6:a01e:f229 with SMTP id adf61e73a8af0-2e7cdda13b7mr9392141637.30.1758894937131;
        Fri, 26 Sep 2025 06:55:37 -0700 (PDT)
Received: from [10.204.100.85] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c057ecsm4478394b3a.80.2025.09.26.06.55.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 06:55:36 -0700 (PDT)
Message-ID: <b5d465e9-e84c-fabf-f275-3d0a5abf764f@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 19:25:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/8] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <7c6ab647-0c54-4480-9eb2-5c2bbf5f857d@oss.qualcomm.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <7c6ab647-0c54-4480-9eb2-5c2bbf5f857d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX+tXvoT+Hh1Wk
 245EnLOOmkangwKDcfQDC9EsPOUBTpe45uFoKIADG84GDwoLRM35GBHrJ9fuGVDWoaGacqOYRgZ
 1AEjW18ds3Xbqm8n08CNgIuEclUxyPINeJgvhWfi0+kd7QW42/IjAAFKYC3gRy2BGtntw4rIXgd
 jZ3PRb7oGLNtSEnFqovsb8JKfPK1F6hONb6gRrvLixcC1YsvXFTqzW4mrP7/LnVNpLo/s9F9N8H
 TH9hx7HR0wIg0cMzUolbspZzO+IgXeFU6vZiTpo4xAoIvOMkUMrUPvdtBEJ0yXzgsHCvFr6Qc4W
 TMsI35YAt1YLNG8xJqzOHUPGXjC2A2TwCIjREf9lr5XOubmez7wzY/675VpwaZYxe59GRuwMr6n
 4dy5e26ytFvc4fqtekZIx+hPfZ0oDw==
X-Proofpoint-GUID: 9amzVgliUmuGteczQlkCXffy-VGdCCxP
X-Proofpoint-ORIG-GUID: 9amzVgliUmuGteczQlkCXffy-VGdCCxP
X-Authority-Analysis: v=2.4 cv=JsX8bc4C c=1 sm=1 tr=0 ts=68d69b5a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=WMJ26Vy-SEQUeRUQdDoA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171


On 9/26/2025 5:17 PM, Konrad Dybcio wrote:
> On 9/25/25 9:38 PM, Dmitry Baryshkov wrote:
>> On Fri, Sep 26, 2025 at 01:01:29AM +0530, Vikash Garodia wrote:
>>>
>>> On 9/26/2025 12:55 AM, Dmitry Baryshkov wrote:
>>>> On Thu, Sep 25, 2025 at 04:44:39AM +0530, Vikash Garodia wrote:
> 
> 
> [...]
> 
>>>>> +  power-domains:
>>>>> +    minItems: 5
>>>>> +    maxItems: 7
>>>>
>>>> You are sending bindings for a single device on a single platform. How
>>>> comes that it has min != max?
>>>
>>> I was planning to reuse this binding for the variant SOCs of kaanapali/vpu4. If
>>> we do not have min interface, then for those variants, we have to either have
>>> separate bindings or add if/else conditions(?). Introducing min now can make it
>>> easily usable for upcoming vpu4 variants.
>>
>> No, it makes it harder to follow the changes. This platform has
>> this-and-that requirements. Then you add another platform and it's clear
>> that the changes are for that platform. Now you have mixed two different
>> patches into a single one.
> 
> Vikash, preparing for future submissions is a very good thing,
> however "a binding" can be thought of as a tuple of
> 
> (compatible, allowed_properties, required_properties)
> 
> which needs(asterisk) to remain immutable
> 
> You can make changes to this file later, when introducing said
> platforms and it will be fine, so long as you preserve the same allowed
> and required properties that you're trying to associate with Kanaapali
> here

Let say, we have a kaanapali hardware (calling it as kaanapali_next) with 6
power domains, instead of 7, given that one of the pipe is malfunctional or
fused out in that hardware distrubution, should the binding be extended for such
variant like below ?

power-domains:
  maxItems: 7

  - if:
      properties:
        compatible:
          enum:
            - qcom,kaanapali_next-iris
    then:
      properties:
        power-domains:
          maxItems: 6

    else:
      properties:
        power-domains:
          maxItems: 7

Also, what is the downside in existing approach where we say that the hardware
can be functional with 5 pds, and 2 are optional based on hardware having them
or not ? So all combinations of [5, 6, 7] pds are valid. IIUC, the optional
entries are made for such cases where some hardware parts are variable, please
correct my understanding.

Regards,
Vikash

> (i.e. YAML refactors are OK but the result must come out identical)
> 
> Konrad

