Return-Path: <linux-arm-msm+bounces-82202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DF347C6810A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 08:51:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 824BE4F2E9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 07:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2C432F28F5;
	Tue, 18 Nov 2025 07:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b5BXBk9H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RrHqWqrZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0014F2580F2
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 07:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763452036; cv=none; b=tq7tS4pSL8KW6xJHL8T7Pu4mY2AnbFQsVlqQGEU4QnhfNBwaTIF4GtEVkszs7LFEBeUc8jrtOy7TOQ6E6UC1O4CXRa7OIP/13tAVzqXWq1x6mttn/yttvpxd1kdmdbmx9x2TuiQlZAUNLak4sU4lW8pE4tpQfZGJ3fVrMnS1S38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763452036; c=relaxed/simple;
	bh=C1rEJjHU5fq3T94rEz3Jy2tF4h6qLv+ouk3QdMusPL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L47HBbykqvLbELHXso3TbD3lrdsI2hec4+y5yoigw+UR3gPh1nsbEHZXcydySuR/4CKSzM98aq0quPnPd00kYWy6dIP+Adg0jjo7S4tMEdkHVHQxTU1D5iC82/2VOAW+7fLVhNThKHchPwm4wwc9zm9mRUtg2V577RquT5NMSto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b5BXBk9H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RrHqWqrZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI1TmVv375556
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 07:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q1LWjTec/cNj1zznlk0UfLKuZfQ9QSNnT3txdizlw+Q=; b=b5BXBk9HdZKRGk83
	OyMwQ4JGrVT010MvU+JoNyjHmGDP+XCZLfK47dTGZp2pnD8WyXJy13JAy3DR6VzV
	SNlt/6zOK2nBd4uJY+ldaU/v66O0Ic+ZjRyw1Em+/X79j4nx2/q1hTvDe0pIahLE
	yrOf4jX9spDnZhgVJFhv8kOLuF78huV44JXvNkynFnua1+VTUZVNGaI0JNk8FfbT
	s2BpuPK/CSKJVhcYEp9GU8nSw79DY5BJZGka1g8bjcpjGD6US3ndEwXcaJ9RMeQD
	8ElvHrHnrZ9/eOc2BozpEulbn8ZO08rRC047KBgIY2rElg9DNh4tk8kQqUp9UjQj
	tdosCQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag599anb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 07:47:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-341616a6fb7so6525231a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 23:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763452030; x=1764056830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q1LWjTec/cNj1zznlk0UfLKuZfQ9QSNnT3txdizlw+Q=;
        b=RrHqWqrZJNLqTeHmjGYORXaC69dxCWje8HgG0DjvX5jwdTEX/kZ9mmHF/hIkIz4NmM
         ux+44MmZN6siUHi730ORvZ+fCDK49Wti7ra8/IbfEhqmiuL9+1EU4LIL45Az9gUcq+kV
         +xe3h1VlQkPouOzDpeOXGktuoReptxScfgSmq3wl3AajwJJe+nZA5o+p3AyQwgp1OVdF
         kBCrKTjI22H7jXwDPq49VvMOr6mCD8DWBIN28wQJXJZvimxO6g2EHpR1jM8xxCVMtKjJ
         8X+cSQUaY+ZmdN7i96w761TDj2KWkSrgZcejuBXpm5axHWFIm6+AmSQWi25ZZCEoeUAP
         U2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763452030; x=1764056830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1LWjTec/cNj1zznlk0UfLKuZfQ9QSNnT3txdizlw+Q=;
        b=lDsDg59M+xkTHQ61DyvzxCZqFn/0EhdCrYjp4vS5B4dAqyWzrvqzf+teVxLOIsPaay
         5Mdm+DrwZCVaD7XbnBaN6wXICSXJvmIo2Qstx9/0B/ACT8/9dpP1lBOizbIwIF/dVadK
         CEKyZ2b4Eo6FiC1Urgj9Af3mzb9w/BWRC0ieboorTRA21MI1m7bFi7G95Y014p1LYm1F
         9P41ZpjJdtv4dL+XndpuWZGlnC2jwvWPiirxyxoF9gwnHQLFmOYdl+U4xWzL0SI1+Kz7
         6LDC2uNu69pfnPEQZxZxp63ksTFO0/olOlLn2RefsXTqtDnFVr8MTLQZUTkeEusyiPWn
         GlKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOsjeiU4OMViNGI/H2u15RQFBQ9MHvT18peqyi+NOInPltN4YuFZpG1La31s3pv7tH/lvW0sy8lmYbi1OI@vger.kernel.org
X-Gm-Message-State: AOJu0YzwFni/6n3/tNu8uNHXXu1nAUmX+tj8BoXA08ekcuj0FPphMym6
	qwJURwNqo+feDN52fnaBiV8lyY/kSYKzCuYgOIPmqwcjmIqJh35J1xjfl16AeFOCbZd+0qIbjey
	/A7hQreaar3C19INslwtotwJgKOAUmXH4nxAXQK/6WWtYe22VPtuzkJK5T52BNHaw9HO+
X-Gm-Gg: ASbGncuOr4paN6rzqzjWO/lB19/jsz6RXZf9WX8rnE3ihuc/DRUKmEy7tSYNAL/Bn6S
	lwpt98tvcgA6zYHlsi5VPAP9lypwBGSNmq5fCPGr2b4T6lswqRb8016TbYuFyYV0APlWwICFLUr
	eBHeQZAAhxTPp0mmFXj+54z+Aqpe4ijBF4e/EcBFx/cf1EUE0i9yH4T6IwtewRpFQ4jroDPvKyU
	h+AeLX6ypFbfCta1azaeCgb94wFysep8bZQ7gVlcdH//3hf0AWMjUGg5qJXi5N97NZLg44AV1aH
	y3p9a/Vo+egrpZ82yv7Sv2sIeXOtHWJnY2U0EIo9redVPFSDOe/h/p1QpZQm2xo/iBQq3Lsr1qd
	+r8xZrCUpPmyRc0hhnu1qHnxrDKIvS6YJnuqNEdv0xaSV4A6TpFPMaCalPf/T
X-Received: by 2002:a17:90b:2d85:b0:340:bc27:97b8 with SMTP id 98e67ed59e1d1-343f9e9fed3mr16849639a91.10.1763452029754;
        Mon, 17 Nov 2025 23:47:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUOPpGmBx8rKkZzj0uTmBKIWodmlBH/li4fkOhajEWnDrqLQS2O3q75qH/Lbykyu6xMmPnMA==
X-Received: by 2002:a17:90b:2d85:b0:340:bc27:97b8 with SMTP id 98e67ed59e1d1-343f9e9fed3mr16849592a91.10.1763452029261;
        Mon, 17 Nov 2025 23:47:09 -0800 (PST)
Received: from ?IPV6:2401:4900:1cb4:7658:a83f:a091:98a7:4ddd? ([2401:4900:1cb4:7658:a83f:a091:98a7:4ddd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924aee147sm15589487b3a.13.2025.11.17.23.47.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 23:47:08 -0800 (PST)
Message-ID: <a874d12a-6da4-4a2a-bea3-20c69bd53c6b@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 13:17:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: adreno: fix deferencing ifpc_reglist when not
 declared
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251117-topic-sm8x50-fix-a6xx-non-ifpc-v1-1-e4473cbf5903@linaro.org>
 <04aec988-59ba-4c98-b922-510d86b10ea5@oss.qualcomm.com>
 <1488f09b-63b7-4412-ba56-28b1c81528ac@linaro.org>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <1488f09b-63b7-4412-ba56-28b1c81528ac@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fhbxAhN6tily0TB54-Bn8yNn-BIfZlPG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2MCBTYWx0ZWRfX/hoLWsq5qaio
 Tpzen+ro6BF+xYujux0Ri98BQDK7++eeSDBK4Y0II3RjVW4DarGbVqLaukvO8DwM9vmRrVbhh3t
 o9GihIUyHxVlWX/6QV49uuqQf9QmvDMSLdy7kAvnGJ2JRBEfpnkZ9t+MMAg2LkkCFyCVQZCxV0n
 laC9QMooR7uQGlYBP9g3ymPceud8B5LenKvrB0Ervlu7WyCHssI6X9QOO8kCiePdFHivA3NgNwT
 o2QdBo03ryOFUhISvQhEFf0/attXelud8pmRNhU3OK8DT7kLj+TQOUIgRki5mHVgYl6Zg1FG6VC
 uGNdtPZKgjN+YboEMP3eaQP6IUsGelUB88d9QQdeujLPnywpwNQHh/seuACB17pbBL7/0T5qVAb
 QpIKcw5oyl6p039HqH5wQVq8TaC59w==
X-Authority-Analysis: v=2.4 cv=HaMZjyE8 c=1 sm=1 tr=0 ts=691c247e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=O7ohuQCFNY90Bn7chwgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: fhbxAhN6tily0TB54-Bn8yNn-BIfZlPG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180060

On 11/17/2025 9:17 PM, Neil Armstrong wrote:
> On 11/17/25 16:02, Konrad Dybcio wrote:
>> On 11/17/25 3:51 PM, Neil Armstrong wrote:
>>> On plaforms with an a7xx GPU not supporting IFPC, the ifpc_reglist
>>> if still deferenced in a7xx_patch_pwrup_reglist() which causes
>>> a kernel crash:
>>> Unable to handle kernel NULL pointer dereference at virtual address
>>> 0000000000000008
>>> ...
>>> pc : a6xx_hw_init+0x155c/0x1e4c [msm]
>>> lr : a6xx_hw_init+0x9a8/0x1e4c [msm]
>>> ...
>>> Call trace:
>>>    a6xx_hw_init+0x155c/0x1e4c [msm] (P)
>>>    msm_gpu_hw_init+0x58/0x88 [msm]
>>>    adreno_load_gpu+0x94/0x1fc [msm]
>>>    msm_open+0xe4/0xf4 [msm]
>>>    drm_file_alloc+0x1a0/0x2e4 [drm]
>>>    drm_client_init+0x7c/0x104 [drm]
>>>    drm_fbdev_client_setup+0x94/0xcf0 [drm_client_lib]
>>>    drm_client_setup+0xb4/0xd8 [drm_client_lib]
>>>    msm_drm_kms_post_init+0x2c/0x3c [msm]
>>>    msm_drm_init+0x1a4/0x228 [msm]
>>>    msm_drm_bind+0x30/0x3c [msm]
>>> ...
>>>
>>> Check the validity of ifpc_reglist before deferencing the table
>>> to setup the register values.
>>>
>>> Fixes: a6a0157cc68e ("drm/msm/a6xx: Enable IFPC on Adreno X1-85")
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>
>> I think it should be fine to skip calling this func altogether
>> if !ifpc || !pwrup_reglist
>>
>> Although ifpc && !pwrup_reglist should probably scream very loud

That's correct. It is a weird combo.

> 
> Sorry but why? pwrup_reglist was introduced way earlier than IFPC.

Pwrup list is shared with preemption feature too. And preemption support
was introduced before IFPC.

nit: It is nice to have a similar NULL check for pwrup reglist too. We
sometimes skip these during initial GPU bringup (like A840 for eg:).

-Akhil

> 
> Why would we be skipping the a7xx_patch_pwrup_reglist() because
> ifpc_reglist is not declared ???
> 
> Neil
> 
>>
>> Konrad
> 


