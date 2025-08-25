Return-Path: <linux-arm-msm+bounces-70726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B168CB34726
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 18:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBC261A885FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 16:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24E12FF65B;
	Mon, 25 Aug 2025 16:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l0IsHYm8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558CE2E7F39
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 16:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756138996; cv=none; b=qsIAjO+/zib30LxVOMkuAhOLD/x1+QcGaxrEQObYU5CvMS1d1PMOtxh+nwvUHYT0PtfBFZlGJxXZBDbS+VRNSq7Vhhv826aMYNhOai+3WHHoo2GmwuhhYITLffK4MrSZyN0OHkEAtSdiYiajAiH8FtGBRjh9py4xvX9PzhJoE3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756138996; c=relaxed/simple;
	bh=Ic+Wi+QSgnS5gFlavR/eRxT2p6/NMPQaeO1MV51PFDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W0jcjYkrRgLBQHwm7b53u34YXM2mna+RSBEn7PCqUrOVZB5vVOZv8cD6FYmQYsYOvTFPGLcUWlQCY3tgl1kyJWmxA3Au/kCxEna4K0PQUdYds1Os73coA0RFd2wLpH4XDUBJguSnwzuo+quVh/IkLYA61MKn3uwQcH89gyZE/uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l0IsHYm8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PFbr6o018802
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 16:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xT06D3RMtfKindU2hH6cWWUxy48f/VTeJ7LJts2PzLo=; b=l0IsHYm8ZLqNxwWE
	19BVYhwsOB2Nedq144wm1aq6qmdQ+p0aqo6p4khH405fJo81CQndAxNXAcAJLT8d
	J1CYwL8IjpN/SmwBjMpBQDD07bYCMeSG/28co0kPOm1Ks+4KyzutoKkBywZfkUsd
	/F30GNa8dbSYsJV5qmGlanc0UyTVMDqaSpJKtBjqMHI2/XFG1gohnlw3+MR6xkFe
	cqVGOc9Vk92JSW7ZTq9GYbV2k9ZVAK0PBMy0xncsqCo7JYFt/yH3DSQdbCXozRxr
	aM1LQw1gpcpAymzttOtRneJdP98+HikrKzte3OcHntAuCG8oGixOaR6olDyIOW59
	GGYEdg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpnvb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 16:23:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2461907278dso42356875ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 09:23:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756138993; x=1756743793;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xT06D3RMtfKindU2hH6cWWUxy48f/VTeJ7LJts2PzLo=;
        b=uE1/ghBJPV6/dxQ4AovMNQHL5IAl+XIIL4ycbQFgaZmFO6EnqNaQcKIX3MJvVwihnO
         KZ+0OlS0vZTwWFNytJufEheUkTlOxy1PvvJYOKx6XNt9dynWmjnEikg0kqzBUl4vdYv4
         WZJWl+XqybPaWybO+PhagF//ccWIP2rIJAyqwdL2VKs/sbyO0RPZRm3jrozoFQVboH5T
         tb9ic2i/M9CLQRwcW3Mk+cMuWFVcaBF+dUmUI9nm2p9LzJTag7AQA/75cDk+4l17N2KZ
         PzwDbYii1okEMdm8heDD/vIQcTTjm2E8ZPuFdhxIwjEnHBkcrsSTT66//2oTmy1bv+Gp
         +QHA==
X-Forwarded-Encrypted: i=1; AJvYcCVLCvhvpjlMtuhg/mESRaW+/1GJDAKASpmDkEvX9FbDsVzYti1NCfttiOPsQBxrWpq27ZnsCNr1DlE1vmNW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4y0zcVzQRwXkD7t+W2RIQ3oi9i9PDk1g8i1y01v2jQikjjjeo
	3YlILHQe34J0KsQYY8Z6DNNt3OHPpl+t/f8x2WLMQCOTdmMcYJQYV1RtRlOe8FgNq94Wr3eHqco
	oEz64bY+BaEPhQdSPsY6uH5Z6DTkh5wSn1afG3USfgyH8Wjs7Sn+ybeA3kjYrz504i3nC
X-Gm-Gg: ASbGnctRO4WNiCrJQ/PoyyOvqnmu0XMj4CUTjQnLdt8rqsBhu1VMqepbOc6X83PqkZl
	cnoz1DAqfp2QHqA1b7wilycbYX+fyf+0s2y/vzH4XtRqBNHf1qIzO2FjaeFP+JQnf+2IHQPIs6N
	GBEQq+ETuZpVJx9AtdE3yQ5xic4NCVRYeObERbUKx6Zh46CMeoYtlv9Ny83wcJG7FXZesQFi3Uc
	jtSqkQCuyeU+Kz6j/k9eQiIUPBdpTKcJRkxIQGtiHJ4XNkBLyCN0b9e0OuV3mPQhIEKKehIKvuS
	4DnOkuF49VqB5R9KFS+mw7uP3u/ImF8YDTIQX8iVaacP9xxA5L9rEg/M0WN/vA==
X-Received: by 2002:a17:903:2281:b0:23d:dd04:28e2 with SMTP id d9443c01a7336-2462ef4444fmr164017025ad.35.1756138993502;
        Mon, 25 Aug 2025 09:23:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3DDyXq0HbIVkH89aU17F4O+BE4oPf252DFOqa7KvXWd8OP2tBXEimcEdWPIlxPlDOWeBx5A==
X-Received: by 2002:a17:903:2281:b0:23d:dd04:28e2 with SMTP id d9443c01a7336-2462ef4444fmr164016785ad.35.1756138993054;
        Mon, 25 Aug 2025 09:23:13 -0700 (PDT)
Received: from [10.91.118.43] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466885efc8sm72180705ad.90.2025.08.25.09.23.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 09:23:12 -0700 (PDT)
Message-ID: <5a405510-3eec-4262-9855-483dd589d8dc@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 21:53:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: fix race in Adreno header generation
To: rob.clark@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Alex Robinson <alex@ironrobin.net>, lumag@kernel.org,
        abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250823020919.9947-1-alex@ironrobin.net>
 <6sdzghcc4uynvmk6r4axpwgqlmgxqzi457ttedqlrql7f7lt47@glsrzu46a63x>
 <CACSVV01R=FPAErpfJJvESKig+Z8=amEkpf6QFnkXHhTjFsPf5g@mail.gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACSVV01R=FPAErpfJJvESKig+Z8=amEkpf6QFnkXHhTjFsPf5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68ac8df2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=foaXouvCAAAA:8
 a=qt1P906IrRIBMUR0lrMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=lBkOZJTZZNyIbKe29SIT:22
X-Proofpoint-GUID: -6WlJC5cXdUov0c5g91UV6HjZVIiVO9q
X-Proofpoint-ORIG-GUID: -6WlJC5cXdUov0c5g91UV6HjZVIiVO9q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX8zk3bkN8Ern+
 Z1d/3E6rcpxpZVmCY9vS2zYpzsSeLi+6nPHqkkgqnJTIUdqgQ6KzbxPQSgfowGUUDrrdMPuATLz
 X735oGTEDCbb+16FidQjcVrqtjyeSrhCL1diusgkeIzV5kUNBJH+Z9WZmUJX4f/wMHAV780OWTZ
 VZl4c/LFR7suOpL7qwEDUx0Vvk6Krenhe4wyb2uHi+HexpPuuWviJpxLKx9y6roKBJH9ycer8jF
 nxmRg0kCJidjhop/UVQBXNrWOl6+27+CGWsguLFvWyKAt5GVkTALYJ0L4V3v3UrQT77KqlL37I4
 hCYwKE+O9F5olxue+e5McqlXeQ9rQXkM3NH+JgTMmJ2WZSM6oK7hMFpAzcAaQrbJJBLCwyPpAZ2
 k3x+QFcY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

On 8/23/2025 7:46 PM, Rob Clark wrote:
> On Sat, Aug 23, 2025 at 6:49 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Sat, Aug 23, 2025 at 02:09:39AM +0000, Alex Robinson wrote:
>>> Builds can compile msm-y objects (e.g. msm_gpu_devfreq.o)
>>> before adreno_common.xml.h is generated in trees that generate Adreno
>>> headers at build time. Make msm-y depend on the generated headers,
>>> removing the race.
>>>
>>> Signed-off-by: Alex Robinson <alex@ironrobin.net>
>>> ---
>>>  drivers/gpu/drm/msm/Makefile | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
>>> index 0c0dfb25f01b..1a918d44ac48 100644
>>> --- a/drivers/gpu/drm/msm/Makefile
>>> +++ b/drivers/gpu/drm/msm/Makefile
>>> @@ -221,6 +221,7 @@ DISPLAY_HEADERS = \
>>>       generated/sfpb.xml.h
>>>
>>>  $(addprefix $(obj)/,$(adreno-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
>>> +$(addprefix $(obj)/,$(msm-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
>>
>> I'd say, no. The idea was that msm-y should not depend on
>> ADRENO_HEADERS. If there is any dependency, please move it to adreno-y.
> 
> probably we should s/adreno/gpu/ and move all the msm_gpu*.* there..
> 
> In the mean time, I think we were going to drop this patch from the IFPC series

Yeah. I will drop that patch.

Btw, was my usage of adreno_gpu symbol in msm_gpu* files incorrect?

-Akhil

> 
> BR,
> -R
> 
>>>  $(addprefix $(obj)/,$(msm-display-y)): $(addprefix $(obj)/,$(DISPLAY_HEADERS))
>>>
>>>  targets += $(ADRENO_HEADERS) $(DISPLAY_HEADERS)
>>> --
>>> 2.50.1
>>>
>>>
>>
>> --
>> With best wishes
>> Dmitry


