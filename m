Return-Path: <linux-arm-msm+bounces-66349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D34B0FADB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 21:12:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5C753B19A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 19:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99A5222564;
	Wed, 23 Jul 2025 19:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ej0NzkNI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619CE21D3F5
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 19:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753297914; cv=none; b=tXYHpiaNPKGF8hEy8Fsirpds7uScVdKo7JOJXo7W/7rrDvqsUMlJY9xNmaD2tYQpdiE/zqVslbV2tDbm4nCKQcsjUbw8pphV6Y29j4MGMPh9QnJ10xliPvNzuifBqnoYJBYTpUV28Dl3986E3goK66T2vnbbCcx0W9w0TcuYAzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753297914; c=relaxed/simple;
	bh=rjMF4SS+OV0lz6i4T4F6UW1KEe904m37qQLEFlE8G88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=riO2Q3Naqd28c5Jo4EXsTxJxvHZ8Y5MyMuhZJG5mqMLdLiIQ3TzveOMyXFHtmf2EoVlnFuGOrrDpLmLc+8+jXlxUPsMh5tXh8S8QovNWusbsdMjxDqLHAjvLg+Skt2q3b0bC+eSe435ySkk7gJUpuhpdVblyXnR1LIGy124dWgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ej0NzkNI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NI5Puh010916
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 19:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V9jA6Mn1SUrOwM4UhmLUB7hjDyvroazQdXjiBfsPsCw=; b=Ej0NzkNILdycTX5T
	esuaRP1GVX4zJvOHh8fOZB/+MpZnGQecrdbCk8vy/8otih5K7GO/k0FKrWARUsTj
	bwKdoLFdhLYDnntf/gqU/InnPDXFshmXQG5tMb/uOK/gygRBFZ08xctthVgijDcu
	oPnjpRtyg935NMbiUlFSgcmQ4use9cVUtD+SYC8npC3IjlR5D9EIDRrCssMR4elf
	V4ZXt9nWXPEqdO+YlPN/zGVdz30g6U3iUGjvqwMayeainleHSlvhHnz/KxLBu5CX
	wDJLCt+oNAel0kyA4NQIe1oPzsusSZrmhIw1dpjyp1jD4BOyMxgYp+Aqm38ZfIlG
	wC31cw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t1dm8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 19:11:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2356ce55d33so2229685ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 12:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753297911; x=1753902711;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V9jA6Mn1SUrOwM4UhmLUB7hjDyvroazQdXjiBfsPsCw=;
        b=YlgN67jRqdc/ROOzBKx1RldXof3k4rjESsT6fLNeQgQt4y6pSd0QIduPBVK1/SrPqn
         7X5JHjojJekZ5rJLSDI6yf/uA3raa+9kfwMgjLdM7cgCU2uWpiU6kLrADkdShpd5P3O9
         LOTIvanV4fOnstq60rakAMMI5V+QQgaFvRd5t7NwZyAwz+P5gOc8Lfhu/Qtp0EwM4ASf
         tL8mmOGIOQbQWCPG0Ys7Ngdb6rH9IeIMuzVgu33STdC9JzVZFgnbbsDR/phUXhy5eEB/
         +4I5EO+IvQr7e+nBd7Y3kAyKuqAmJcWvc63YfIEqjH3yT1NBZT+6e11+scfHUIsL5WFF
         m9yg==
X-Forwarded-Encrypted: i=1; AJvYcCXxuU+wjWySmO4rV2Ggrb5lG6zup9/HiIyZ4XpzR3zfazgJAZjJ0mFRGQ781Sb25ascBfm3BhGJnuxGNk73@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7te9lTHHLMsf6uUVnb4Yhu1kaU3x6UlgFxkQ0KkWCeSNPn0MY
	BK3J6ykuD2SeZVRXJTOjxU3FgLC3HCn2jXHVRXp8KextR10LeXrcP/zz2cMWdBtPzp1SuUibgw5
	62r6ycRNpc/xIGovOUX8P0f0QcnKQfgoRkEN2nhoQi+gPNZGrrrxcFREpC0M1MtrBRPpB
X-Gm-Gg: ASbGncs10gKfUoPld14rmNmeN6wUhkPlDKjEgvXQoYINKox09A1P24Hl0KbPX4ddcKs
	/naiO1QqBggkFYIWxQL9Em5s+VCy7HTmy+6sXHQcoyxPdZgwT6JIKysesWAqqQqndwpppfk5A/K
	xKCmEtoRJvZUdTh7NxV128hJNCvOlHDuFU+39/vT697rsrJa7PkOO/OYPkp5zXtnGhSaKURxeSN
	EY6ngb751DP4/4miAsizZ/pej/rSSAtux8Rm05ctvezw8UpkSTykxFLKYYpomtc/WCWCrdvcuBE
	fUArW4Ar+FVuVkhjCb2Zrcu9uySEcI6YGzrPYCZ2hK8semU/9B3tIqgbVC+ex2XC
X-Received: by 2002:a17:902:e885:b0:238:120:134a with SMTP id d9443c01a7336-23f9814034bmr71876845ad.22.1753297910879;
        Wed, 23 Jul 2025 12:11:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFE6DGeXECpuu6lms2ga/Vg8TctuO58RgApUp7nY5NpQJNo+xZQMgkHkcbiQe/1P/POntb0nw==
X-Received: by 2002:a17:902:e885:b0:238:120:134a with SMTP id d9443c01a7336-23f9814034bmr71876565ad.22.1753297910432;
        Wed, 23 Jul 2025 12:11:50 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e4918sm102288265ad.41.2025.07.23.12.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 12:11:50 -0700 (PDT)
Message-ID: <135cbad8-6c33-4a0c-babd-31477d9be4b0@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 00:41:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] drm/msm: a6xx: Fix gx_is_on check for a7x family
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-3-9347aa5bcbd6@oss.qualcomm.com>
 <84a33e15-edaf-4951-8411-24b17ee5f4f5@oss.qualcomm.com>
 <62391e11-2f26-4e30-9c8d-b47d4985b41b@oss.qualcomm.com>
 <jeg4dw6wpxpfaio5kd5vcbqswq5nlclor7tbbh7er7zlwgdgxr@ksrw7waxj3mp>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <jeg4dw6wpxpfaio5kd5vcbqswq5nlclor7tbbh7er7zlwgdgxr@ksrw7waxj3mp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WXw4keQHafmFxwmX0h6w2LnXZj4UTYAs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE2MiBTYWx0ZWRfX2x2RaTUAaP+G
 dsTvNI/4BGtRost8EU4c/Ln3WDOhwONtzgSLo9JBuq1PUF26bxIN0sLImvfr30ozouGCU+/svP2
 zJsPzC08UKBguLDPvnsNRLGB1aC8P69bbeif2XQxwgC+ESx9iE78Lie15kEDvpmxqcMCE2rmb+V
 7d++g50eLDyr/aPsD5Ohe6t3QM7tXq2O0NNCxKgG9fuCQpQro/d7pQo6gMiDRQUqQzO6NplrTeo
 TWLzqnmdalEo/0p6D8yqCMbHetcZCjhg7id7dJdLu/EvZOqk7llmG64pbOLFQbYbZAvKhAAhlq2
 1wTEO9/C0PjzSqGva6jEzFDZAsUporTFitOgIC3YEBHEFM21ElIQjmDRekn8erd26nlZ11CO834
 ylR1Ma6dr/xIvN5AGFK+c0fictEK9wpZGm4R0wEsKaDyANHfF4wta0dGSmh8SeQc35q2ZkBK
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=688133f8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=R4_TJjaFeOAkSM8ik1MA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: WXw4keQHafmFxwmX0h6w2LnXZj4UTYAs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230162

On 7/23/2025 4:40 PM, Dmitry Baryshkov wrote:
> On Wed, Jul 23, 2025 at 01:22:20AM +0530, Akhil P Oommen wrote:
>> On 7/22/2025 8:03 PM, Konrad Dybcio wrote:
>>> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>>>> Bitfield definition for REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS register is
>>>> different in A7XX family. Check the correct bits to see if GX is
>>>> collapsed on A7XX series.
>>>>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
>>>
>>> This seems to have been introduced all the way back in the initial
>>> a7xx submission downstream, so I'll assume this concerns all SKUs
>>> and this is a relevant fixes tag:
>>>
>>> Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Dmitry/Konrad,
>>
>> We don't have to backport this change because the existing code reads a
>> couple of unused bits which are '0's and that is okay when IFPC is not
>> supported. So there is no practical benefit in cherry-picking this
>> change to older kernel versions.
> 
> Fixes tag is not about backporting. It is to point out that there was an
> issue in the original commit which is fixed by a new one.

Ack. Will add the tag. Thanks.

-Akhil
> 
>>
>> -Akhil.
>>
>>>
>>> Konrad
>>
> 


