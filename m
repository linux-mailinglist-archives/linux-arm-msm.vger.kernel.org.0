Return-Path: <linux-arm-msm+bounces-67005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6740FB14E62
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 15:30:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D1931616C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 13:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92E915AF6;
	Tue, 29 Jul 2025 13:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e0F8kmoc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCA579C0
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 13:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753795817; cv=none; b=d/n63fpzWFXxQBllbEubbCjmhJqXyUfDJHy6AsUM997gf4RZX/Oc1rWSK9wEWYey8uQVbSkjejnNX6hjjO3dlVlfzgvieUFG4LNU0KYQGafpLjLWCoZ0YzQu3NBnnlhinhP+3OINDMroSAVgi4v0dFe0vBMHecNn4ji8VfhQ2YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753795817; c=relaxed/simple;
	bh=A1IBdYEvRBuXpG+jBuTQu7qU22EuY2wSvICH9PDPrFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=luc7CUvCzCZicKupSbjSdplkqVSMyqd3vBpjXBAmPydCw4NnL+NjDEXXc3XQ24U+5vs4MabsJTZNe2pGIucAvI+8NLycHCc/2t5KwM410tm3s0hlkD6RH3GIYREWUJboxIy/Om2o31v/zqP7HeyHU2Hb68bSB56uxTLJ7PQYG80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e0F8kmoc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8WvYp014098
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 13:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZkVVfMqcS22T194hcW1I5vSe52GnRrmOg+MhaqqVH00=; b=e0F8kmocfkMJoXQq
	+f69DQcn3OviJUPsS1EksTyfmXysLxm4zjTmoRPyUJOSUjhEVYeAZvNlfRNE5jyM
	ZWwizMblp4PWgzlsaXvnCnUPQmJKLHtVq9d0ZFHTpRbVNF3yqSAK6J1IC3MwV8xe
	xMcLsF6gg0BRQozsjKr4L98O1ITXlDp8HdLimdLXqeMAfEj00HeS25FdxIpqNPxo
	o1fcomAbux0r8MA7gagI2yO9P4Z4DS1fO0eDZBY+GBKqB2Ycuq+U+Bzh5KzTR3K5
	NjRp+4T14Pu9NVxHtjSmxnbuzZ/f+8LW31SxfYnVUHThzEtoanDDYmgMjZ0k1sZi
	OzGVDg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q3xr6bb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 13:30:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7dfd0470485so49447785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 06:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753795814; x=1754400614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZkVVfMqcS22T194hcW1I5vSe52GnRrmOg+MhaqqVH00=;
        b=edROHvxbWvrFlanc0luV6yrSuZg4qKMx+XkvGUQ9M8+KG4zIquJ8Ah1L1ytFi5TVHQ
         ZX5HdjOw4IK+UX4BZGOW1dESQ/f7jJShMqb/Knj6XfC3Hta6JBOjqdDp8GhG9eiYAz3a
         pKS/abtaa181XVZPXeIyMdz3aOzELnq2pBQMHbGfoNOm8rXxM4nevwavl9TN49DqRbDM
         wkMCTzvcWkWjJZGRXGA/ucHEWFgsuGtkipJWsEVTMF05tcQFJPbN6GZ03ZrQ0t6hMcN0
         bqXZHQYTfZg+5uKxwEil0SpRc/77BJp0DyHgv9qoEWaDeLA3OlldJwzA4hcdDR6C2/wi
         xuVg==
X-Forwarded-Encrypted: i=1; AJvYcCXyYt3lcky5gAYC8I6XpBnYs/V0Z8j3wb7cHh/Q7pmrzKSpP5euuZIQPqv+ZqBQwybJrq8MxitdBH1666qw@vger.kernel.org
X-Gm-Message-State: AOJu0YzG7GyjWVr+JuL6tgHUgtS2ea+JBJIhk+I7PiIgiX2Gl0BbYKIa
	crVEtufjz1TQueeEtJHYemVr94bfHRhDS7sUY+k0nm1DJ/H5R6fezFnefZ1s+1I860RtnH9+n37
	pf71QT1RSXfkiCLf4H+NYMIcEZhecMMM/c3uvk+wTBKxN3Em/lNRApbAU8wFPzq4+vO8S
X-Gm-Gg: ASbGnctzPELfn+ZnM1g+w5OIUvxZX3n0Dekk3aCkdSJM0urDDIBhvfZ0lrZJnvLUPHc
	pKwNMHiX41aTC6H4s6EQdQQZNndKAAkTgwIdMemlp/XoYz0ntvHt4tm45CCZybphzuWLBwUdHcB
	zH2Q8iyUQIWdqz6+ccNcLmUKXa4RhIDkqE6kgPlopjZdJnsnIWX0K6yNgLUIJxh8//RSw6DSzkA
	0iuwOddoLT83EWF0HWEf8iNAMh+duXENdQpN259rhfcYau/SGW477abrHYBLbcmT02h3pFzsRHJ
	jdKn6vQw773pZqHrQWbm5kHggS7quzAM7dRuST7BhAgWwhU/2fAgacUtpbSGYU6OiWpr9MSIb51
	6m11xOzxSJBJO0edGPg==
X-Received: by 2002:a05:620a:284c:b0:7e3:297d:ec32 with SMTP id af79cd13be357-7e63bfc3749mr814896185a.10.1753795814163;
        Tue, 29 Jul 2025 06:30:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgmtqIpfxLvIlR9V46R14lP22op8xYzy/QAirfAkHBUcpzQdLdsiTffbYJQzdMY2lRH96DEg==
X-Received: by 2002:a05:620a:284c:b0:7e3:297d:ec32 with SMTP id af79cd13be357-7e63bfc3749mr814890485a.10.1753795813536;
        Tue, 29 Jul 2025 06:30:13 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635a62af3sm592795066b.84.2025.07.29.06.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 06:30:12 -0700 (PDT)
Message-ID: <4a1c3cf1-9688-4275-87ac-8fffd4469889@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 15:30:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/17] drm/msm/a6xx: Switch to GMU AO counter
To: rob.clark@oss.qualcomm.com
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-9-9347aa5bcbd6@oss.qualcomm.com>
 <0a2188e7-3919-48f7-b5c1-8f779f617f28@oss.qualcomm.com>
 <CACSVV02x1s9oBSV8khgPhqPJdT1igOzRSOp5wYUZowKvXsb-Dw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV02x1s9oBSV8khgPhqPJdT1igOzRSOp5wYUZowKvXsb-Dw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JovxrN4C c=1 sm=1 tr=0 ts=6888cce7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ERHQbKNnysnh4IVj_LEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: M46Jgfm4y2JOKvSj6a_BS3NEi6j6xIcx
X-Proofpoint-GUID: M46Jgfm4y2JOKvSj6a_BS3NEi6j6xIcx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDEwNCBTYWx0ZWRfX4Ql7rqmYqGlr
 1AMnz9qDtEwre7coNXM/Zqn6dSYwqB7NsPVnGTfRwG/9WK9DiXkNtq2KYzrFE7qJxECpQO1UCLY
 SzcSNXYIijRo2PA8nMMXWyj57487X6bk+SV8HZYJnoHLxxZLqPvaXWn20ZND3yUmtJAGHrUYgN3
 LLne5NYwOZDvM35xIIBR6bnT+633XEH0U7C5s8+s4jpWrEaFXd4yZyLFiRbVyVNlYMImqzfJqtP
 BB+0yEdReDh0uZbemaDijMBINOOhlLjkRzAFwY0irRQSgdyUCNJ51JFIFs+RCA6LDz+hqHJKaSR
 TbxH06oICNfYrZ/LjpFpPXJyq4NtYyJXmSJd3MEmaXB3oTGhZw2uA+8OsF2lNdCbylxoSrnjXWt
 EAgjTt4OVTmzJFpNFYbgZSvNurfsPLiX0Fw6SL+whKfzmcMuH2TU4p+p0/wroexz15Hz2YBh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290104

On 7/23/25 2:15 PM, Rob Clark wrote:
> On Wed, Jul 23, 2025 at 3:19 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>>> CP_ALWAYS_ON counter falls under GX domain which is collapsed during
>>> IFPC. So switch to GMU_ALWAYS_ON counter for any CPU reads since it is
>>> not impacted by IFPC. Both counters are clocked by same xo clock source.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 30 ++++++++++++++++--------------
>>>  1 file changed, 16 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> index 6770f0363e7284e4596b1188637a4615d2c0779b..f000915a4c2698a85b45bd3c92e590f14999d10d 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> @@ -16,6 +16,19 @@
>>>
>>>  #define GPU_PAS_ID 13
>>>
>>> +static u64 read_gmu_ao_counter(struct a6xx_gpu *a6xx_gpu)
>>> +{
>>> +     u64 count_hi, count_lo, temp;
>>> +
>>> +     do {
>>> +             count_hi = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
>>> +             count_lo = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_L);
>>> +             temp = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
>>> +     } while (count_hi != temp);
>>
>> The original logic is as follows:
>>
>> static u64 gen7_read_alwayson(struct adreno_device *adreno_dev)
>> {
>>         struct kgsl_device *device = KGSL_DEVICE(adreno_dev);
>>         u32 lo = 0, hi = 0, tmp = 0;
>>
>>         /* Always use the GMU AO counter when doing a AHB read */
>>         gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_H, &hi);
>>         gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_L, &lo);
>>
>>         /* Check for overflow */
>>         gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_H, &tmp);
>>
>>         if (hi != tmp) {
>>                 gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_L,
>>                                 &lo);
>>                 hi = tmp;
>>         }
>>
>>         return (((u64) hi) << 32) | lo;
>> }
>>
>> Doing this in a while-loop almost looks like you want a lot of time to
>> pass - REG_WIDTH(u32?)/19.2 MHz
> 
> would:
> 
>    } while (unlikely(count_hi != temp));
> 
> make it more clear?

I guess so

Konrad

