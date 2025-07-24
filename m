Return-Path: <linux-arm-msm+bounces-66612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B70B10FF8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 18:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5552F3AF8BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 16:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E536C2EA735;
	Thu, 24 Jul 2025 16:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WsrEFfPD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A432E2F15
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 16:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753376105; cv=none; b=n18oO2+ZpR7tYDHvlXG/+ca8riILTxrrxhReR5v+s1I2plOFKlukRPMaQ5QuaGM9tuhM1ZEtQ7MPLi/t0dXc82GgzLhodPhraOnyj+79m7Ai55afdUSrarl/j4wSe8LsrRVrXr5UtwNq+kltDIwUJZkecsAKSEx6D4+ivkgL9FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753376105; c=relaxed/simple;
	bh=O2W248CaccP07A8DSRtvVrSXZqqTMGLZbh7bR0BGEgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kFg+lqRmq7obMA85LvEEqahK8h5ZhgaskXVg3KyOJy70J4Hxio96jE+b5YAcrjuDeFbj+SYdV0pGgyg0kQJ55vGWLJQZJ5/HfaqGNmlCbI6QT4OJsvEYM3UkG4h2XIaLQXtDk3fSzER2fbzioWOxFvr3lI8tgHNlgofQsReUqQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WsrEFfPD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9j44g031205
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 16:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WkvO3HWuwnO10CopnTi1wToI7EW9iwYWQA6wYcR0+jQ=; b=WsrEFfPDaBoP+9qj
	4Q3M/prEdlMGBq4s0KXkhYo/u8PN/QuqfKpPpApeD/RJ1Wev+rmTbnbi37lxMvMh
	SwMjck/yeJUpRscVsyHPgsUbqm6iIFakKak17vhAjWH15yZTAgpwdiBVv1QPfFyU
	Mu23QuqHsK2qYxBi6gr9I9nf/u2W16jUNXyu+k5h8wJL51/S+/RFTswY0FnxKfy1
	oPsJNnoiQWLhAhh7JIYFC/SzYSJkgwrSwdBMvcN5Y6K5Yzyut8A9HYPPLQexOGhg
	pDG3hLmyXLI9jq+BDyMoHYcGqAyvEp5j9b757WWhZda/7C1LGPsXrbJjgsq4Z18X
	v03xag==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3evawm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 16:55:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23536f7c2d7so19713815ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 09:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753376101; x=1753980901;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WkvO3HWuwnO10CopnTi1wToI7EW9iwYWQA6wYcR0+jQ=;
        b=EoJ/hvQc1G6yPnmeI6Vgs1h4k+PGD504xnVX/27eseyz0jACCAQ2QCUHpLvST9cGpY
         RcTVWhKM5jvcebwSkr/+h5Mu8l9+modUMtdMhcxvYEIr/fCTgph4yV/6/0UxMtiPQ39Q
         2aTidtXqC3XJU4X/4SlrjusgqfyMIhxg6hAc00qpWoFqKB1rGuY4cVAzkVBcja2g1+k8
         zyJzKYTyVpoGa18Qm5NoI6ho9HFUZvslhwdjo5+b0PW5i2KQC6AXP0O1InAwTIpMxNu8
         m+FV/T6eZvKmXmUx+0nrx+xQIldYku9WNMlPyfNyixEn1UYmTzJ2xaaS8IM5zJigsaYi
         QYzA==
X-Forwarded-Encrypted: i=1; AJvYcCXZPEqB2g71y2x45sqccHxOyUSpUMIW6aLFxq7qN8rqxxfxDrXQMZenvV/adCeSI2MNUk0gf6vOVpMJK1c0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl7W15afetj6ZK5zmJXqWXR4uscWmC68BZLS7PW4X32dcEG32+
	lEPZJufXp7+13x5CZ/g4T6kk5gKHc6lT4N5O967uXX22qJgvaDZW4N69vcjKSv1b0oQ/nPBcfDu
	4ivUUTuum6HScxx+6wkU6LdJ+9fgGGmnrwpRrEeiLWZb3IN0MM1zNVgGogZdiP+hXBr08
X-Gm-Gg: ASbGncsBCOgqXjQpKtigItMtzT4JkERFnLUcj2dKvR7NkFs2V1BDEk1q4LESFtC85o/
	/+/FGwY461BvxapRsi0psj6lHaKBVlSbXzCj0wSv1s99hoHcOAW0gK2zHzOT8oSn2qBPsWc6EMD
	x2ijGfqEeuKbGv5W+z5gOZJmMoxYZP98Pigi8+8Rfnv0fqIBYDaNxWs1AAFxAOo/Jw+GRotcbj/
	5QVKUqQHDVgPImKGDBXdyA+AVzE4tKob/KxFknuerCvnrbzqpngbNNsxB8dMjgqWFHHLGNkQHvg
	HyjiHPGQZtnF5c6NND0pJHDu+PGca+HBAIRaugt8azi0SOGBp5SHjcb4rs9j0g==
X-Received: by 2002:a17:902:f693:b0:235:f45f:ed55 with SMTP id d9443c01a7336-23f9812b40emr105598835ad.1.1753376101286;
        Thu, 24 Jul 2025 09:55:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyvLqO0p8DE/R/ENYjSnXqR13kGXRv8iVQZndC6b9Kh2sUCELYpa5iV7vJ24tGDfXy+ZJh2g==
X-Received: by 2002:a17:902:f693:b0:235:f45f:ed55 with SMTP id d9443c01a7336-23f9812b40emr105598655ad.1.1753376100869;
        Thu, 24 Jul 2025 09:55:00 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa4924a8fsm19330245ad.210.2025.07.24.09.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 09:55:00 -0700 (PDT)
Message-ID: <3f58451a-9b5f-4697-9679-d549104e8312@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 22:24:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] drm/msm/adreno: Add fenced regwrite support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-7-9347aa5bcbd6@oss.qualcomm.com>
 <tyjkwrdmsj7k7tkqqxdd65l5v5jxugr5me3ivg5onn3hbffkwp@7uhsbzolqiyd>
 <30442713-2990-490a-b076-93c3cfc3901d@oss.qualcomm.com>
 <d696e7df-7f11-4491-89ff-ba71274ae101@oss.qualcomm.com>
 <1d320aac-e928-4fd0-812c-268a3a943575@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <1d320aac-e928-4fd0-812c-268a3a943575@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jDb4IjQplN3yzaHoFLI4qfWi3-qrKm95
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEyOSBTYWx0ZWRfXwrWp/2OPMBmy
 xx7kjmvX4kM+gZ9tZzLoCuwfjRdsp8rwTLVilY5ZzIicq0G4lZJ+6YQxB0hs+RB/jBt/ZcemSc6
 rBvRFnMUf9H4F1REiMG5XKAON77uDL3alY1b/U0syz8oQxi2W6/j9lycWkjwRZq9UkGigudSf8B
 6JSJW1ezHXZbcAw1xXs4dFAzHdt+tVza1DzYrQvB2ya9Ye2/8qfW9kAT7fILV8AAnHanApSKvrA
 6U0C28GPf04QZeI3OevRi78NzqV7hrmrZ7OPrtnWEgdZudGOoFcmsfuUrDDITW07298TsLJzUna
 Ke61xCrrxDP9hAJbktDHC61dnk1/DLtURxfHKHlgm+kUeF7ReGPrflWpOpqIdBjKvWnFLmPDjq6
 +JH7GeqAuRTyVaU3NPdccV806/wsDwqMH4vHZRAjXA+BiwrwkkEgFHaAe/SCyCN2UYAo/4bx
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=68826566 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=pSIa2sKh8ADkebnh61Ypzg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Dh8trrp802kbo3xzQFwA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: jDb4IjQplN3yzaHoFLI4qfWi3-qrKm95
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240129

On 7/24/2025 5:16 PM, Konrad Dybcio wrote:
> On 7/23/25 11:06 PM, Akhil P Oommen wrote:
>> On 7/22/2025 8:22 PM, Konrad Dybcio wrote:
>>> On 7/22/25 3:39 PM, Dmitry Baryshkov wrote:
>>>> On Sun, Jul 20, 2025 at 05:46:08PM +0530, Akhil P Oommen wrote:
>>>>> There are some special registers which are accessible even when GX power
>>>>> domain is collapsed during an IFPC sleep. Accessing these registers
>>>>> wakes up GPU from power collapse and allow programming these registers
>>>>> without additional handshake with GMU. This patch adds support for this
>>>>> special register write sequence.
>>>>>
>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>> ---
>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 63 ++++++++++++++++++++++++++++++-
>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>>>>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 +++++-----
>>>>>  3 files changed, 73 insertions(+), 11 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>> index 491fde0083a202bec7c6b3bca88d0e5a717a6560..8c004fc3abd2896d467a9728b34e99e4ed944dc4 100644
>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>> @@ -16,6 +16,67 @@
>>>>>  
>>>>>  #define GPU_PAS_ID 13
>>>>>  
>>>>> +static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
>>>>> +{
>>>>> +	/* Success if !writedropped0/1 */
>>>>> +	if (!(status & mask))
>>>>> +		return true;
>>>>> +
>>>>> +	udelay(10);
>>>>
>>>> Why do we need udelay() here? Why can't we use interval setting inside
>>>> gmu_poll_timeout()?
>>>
>>> Similarly here:
>>>
>>> [...]
>>>
>>>>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>>>>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>>>>> +		return 0;
>>>>> +
>>>>> +	dev_err_ratelimited(gmu->dev, "delay in fenced register write (0x%x)\n",
>>>>> +			offset);
>>>>> +
>>>>> +	/* Try again for another 1ms before failing */
>>>>> +	gpu_write(gpu, offset, value);
>>>>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>>>>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>>>>> +		return 0;
>>>>> +
>>>>> +	dev_err_ratelimited(gmu->dev, "fenced register write (0x%x) fail\n",
>>>>> +			offset);
>>>
>>> We may want to combine the two, so as not to worry the user too much..
>>>
>>> If it's going to fail, I would assume it's going to fail both checks
>>> (unless e.g. the bus is so congested a single write can't go through
>>> to a sleepy GPU across 2 miliseconds, but that's another issue)
>>
>> In case of success, we cannot be sure if the first write went through.
>> So we should poll separately.
> 
> You're writing to it 2 (outside fence_status_check) + 2*1000/10 (inside)
> == 202 times, it really better go through..

For the following sequence:
1. write reg1 <- suppose this is dropped
2. write reg2 <- and this went through
3. Check fence status <- This will show success

> 
> If it's just about the write reaching the GPU, you can write it once and
> read back the register you've written to, this way you're sure that the
> GPU can observe the write

This is a very unique hw behavior. We can't do posted write.

-Akhil

> 
> Konrad


