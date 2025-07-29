Return-Path: <linux-arm-msm+bounces-67038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BB2B154C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 23:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3868188B2E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 21:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A41D279357;
	Tue, 29 Jul 2025 21:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pLhoMbso"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD019237180
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 21:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753825239; cv=none; b=ILe2Ne23+XAwNavbkI+BoV753BWyWrZf7HnBy6+rv7VbgqfBjA10Nq0lDQs9DBn0mV9xZa8aWxL+C0e5u5ksf3ALRAVifZlWGSnYdgXHma7NJ8YFjjKOQe590cUXGaUbOum1gcrIkmqCmehsex4pe1+H6JUB702iS8Do6yrj+eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753825239; c=relaxed/simple;
	bh=1s2C5NLMm5STpMWhuT2DRE7VuG+76Zwd6y7eFrgoy64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WooE5Vmtu7lSOWjWZXFRnTJZ5uagGTPZRM19UfDUwWpEAJxVde0+jtJYR3n8jcFHzQBjEsBS54DOza40qRhjnM2WGwQQmVECJn8rOOegzTQK7+HpBi92rlK9YsjNjBfDuY2YocCyDMVFCT95HkuGcye1OXeVSq+Z5taqE3hppSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pLhoMbso; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56TKelPx016326
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 21:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nQGazUCFnz3W6AC4AtQi0R1LPe8Tk7TrQs4pGUNhc7A=; b=pLhoMbsoPVixRGYP
	8Wa8bAGjawrMAcfh6cS/s2ykrjgZcXj+Pq2hclywNWd+ZEgQ0xHWIiiVsCNVS9Vg
	Q8dZ0FzCrDbrnKuju2BLNMAUP5BQ4nOntq2EgEuePwSGgymJadSCxSXVhNuYhHHo
	04EfL2W7Xf8uAEd/G8D49tLF0Z6t02N46AqlyJWpt3jES+PaZSmFvt+ZFIpuGpMo
	NyseJGlXraM70KobOgp6DpY/5SusLNjK305f26RtlpN47nlFnvQ6ZNG2QnGnj22Z
	zdRu+nSx4Tw8F6vBAtPeUG3j38m8TAm8/+HeY7wQD1ZTUl5bIkB4y76PlzHMtOPY
	CIHp9g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 486v6y1xxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 21:40:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-748e6457567so179167b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 14:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753825230; x=1754430030;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nQGazUCFnz3W6AC4AtQi0R1LPe8Tk7TrQs4pGUNhc7A=;
        b=AQuoSLz1mBcTZ+mIARMSmVGOYiBbY50wsG35Zh6q+u1YFz/IPbxZqCvr0JUF5C5ARZ
         j3hthWLcsjPkoliAdj1CBMf+EDCa8Yit2aPrvU4mFt5+kOH9uZZkPe7HYMlobNLjfwX6
         zhg3gzUvenKTMvTSqyruSy3zKATmh+hItmnj+rAxooqKRVjlXgaI0Az3uKMlQzcmfL7f
         9sNVekvHQJ3z3Jf8ZAkNWFU+v/SYAXY/orOTyjUW/nlTGhM4ZeZhriSWvmwtluTa/OPw
         fZ95Zaz3bxCQLRQlCwcaFIfJi5ICo6cyIcv4rNfwjfglmuTC/nRuGm1oz3xVEnVJBQA2
         Vn/A==
X-Forwarded-Encrypted: i=1; AJvYcCXJglk+7YV1IfDDlrgMI0h5/lCuMc/zvXRT1xPXHBJ4BQ+gS5Rp3kKQv7uCk4u+TVCsHlxjr90FmujYl9XW@vger.kernel.org
X-Gm-Message-State: AOJu0YxVHC0oQ95e6Jrz7OKkHbunNJvCLtc9KBpQG4wO4Uu+0RIEywsM
	nvv/txszcBH5ugjvgbPj/5Ej3mgl+cdWhz5/cIHUJISN7aFKH86cqgAfDSBDCPqlhBDoj/GdBZz
	bJiMKvFMYMWXfy+wFA4+Tgbkr9v3eLTYXHsaRy+TLRPVQqhKW6k+wNuVtylIAsC3fsq+A
X-Gm-Gg: ASbGncvUfSuR0RbTh9p8VH5B9/fxLKE/ujucu5lPy+6R+pQf41JelMyQpBT3XwH5lO/
	jDYZ3IXBGB8NAAUGYhs6kLC8A7Zw0Nbugi7LpDuo/DS4FvfX+Pw2iQE/iOj3DGVA8J1t5hefJMh
	Bn7c401kyiOfOWNg5hpI0kW/CSQXBpn5BBYTCIufU5S6p1v/Y7jkkGdidoaLm5YMVtP4Reck7IH
	zBcd8rR0vfw6pFkxbRz8bXmkPNTAw0Njdz+7KaSSV/+rSDy73Iz1aKIjqEJ+P8prb4WOnbvOY/N
	HPcbzwcFdES8Khab7GsFSH/SxXL1S0qNwR7Q1xSiBptXK2wCiTngCQ7/vNrPj0gW
X-Received: by 2002:a05:6a21:3e04:b0:220:1843:3b7b with SMTP id adf61e73a8af0-23dc37f92d3mr324704637.4.1753825230230;
        Tue, 29 Jul 2025 14:40:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWVlgY3u4zexg+eEceCSWMsg/EHdyVJS0PVYhJEmiMBniSzidqzlG0GWYEezlewSXjjY5DuQ==
X-Received: by 2002:a05:6a21:3e04:b0:220:1843:3b7b with SMTP id adf61e73a8af0-23dc37f92d3mr324667637.4.1753825229723;
        Tue, 29 Jul 2025 14:40:29 -0700 (PDT)
Received: from [192.168.1.6] ([106.222.231.177])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b420df76dd8sm2262382a12.19.2025.07.29.14.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 14:40:29 -0700 (PDT)
Message-ID: <bd6076a5-f888-4044-8a5d-ea6e6fea28e8@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 03:10:23 +0530
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
 <3f58451a-9b5f-4697-9679-d549104e8312@oss.qualcomm.com>
 <9e48ea8e-b59b-4620-9781-211cc1f7cc07@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <9e48ea8e-b59b-4620-9781-211cc1f7cc07@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDE2NyBTYWx0ZWRfX6H8en400UemO
 3DwBiE8GQT7CS/mxAz5CmZ5XcBNztypc+/RBKzRmBPmR9nRIq1mdfzzbdgKfIFtojgz1Mmd8M8X
 lhMcMtVuyGasv7I95jIFzkXC9GQ0bincovW48O+MzBX+Eji8g9zvjawiUVi49kQSeNXrbe2TQYo
 PjEDq8o3zCwsBEA+orXEKmAsGC2+a9T5Uj8Z1o3rrmQ80yqtILEh8udhFYS/ZFmh+kzCsWgeDDv
 IT500pZkDhul5D/EJV9vGdT9ubX28npkJe5L90IAdUwSdEL92Fg1Q0wwgtNEBuUADH+WQwBzaJf
 4X1Diy1KurHKZVzbZjOJPHUS2Sr9nU7uCPdMHE00qly7dNUd5WPN9P4zCSoK+7rx1NnheK8MMwk
 vH8oRONxXwTUiINuSoYsChgk+mcPO74cA67gRLdMWhZgModLN2Po+SiiLz0AvmGF8C8eiC91
X-Proofpoint-GUID: _1dvFuL9AZrwjoMEn4JgTC9m5iXR15Vh
X-Proofpoint-ORIG-GUID: _1dvFuL9AZrwjoMEn4JgTC9m5iXR15Vh
X-Authority-Analysis: v=2.4 cv=QYlmvtbv c=1 sm=1 tr=0 ts=68893fcf cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=9XpMM9ZEX5jLuhR58p3+Fw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=UL6EBj8_IJHJ2Owmy10A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_04,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290167

On 7/29/2025 6:31 PM, Konrad Dybcio wrote:
> On 7/24/25 6:54 PM, Akhil P Oommen wrote:
>> On 7/24/2025 5:16 PM, Konrad Dybcio wrote:
>>> On 7/23/25 11:06 PM, Akhil P Oommen wrote:
>>>> On 7/22/2025 8:22 PM, Konrad Dybcio wrote:
>>>>> On 7/22/25 3:39 PM, Dmitry Baryshkov wrote:
>>>>>> On Sun, Jul 20, 2025 at 05:46:08PM +0530, Akhil P Oommen wrote:
>>>>>>> There are some special registers which are accessible even when GX power
>>>>>>> domain is collapsed during an IFPC sleep. Accessing these registers
>>>>>>> wakes up GPU from power collapse and allow programming these registers
>>>>>>> without additional handshake with GMU. This patch adds support for this
>>>>>>> special register write sequence.
>>>>>>>
>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 63 ++++++++++++++++++++++++++++++-
>>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 +++++-----
>>>>>>>  3 files changed, 73 insertions(+), 11 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>> index 491fde0083a202bec7c6b3bca88d0e5a717a6560..8c004fc3abd2896d467a9728b34e99e4ed944dc4 100644
>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>> @@ -16,6 +16,67 @@
>>>>>>>  
>>>>>>>  #define GPU_PAS_ID 13
>>>>>>>  
>>>>>>> +static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
>>>>>>> +{
>>>>>>> +	/* Success if !writedropped0/1 */
>>>>>>> +	if (!(status & mask))
>>>>>>> +		return true;
>>>>>>> +
>>>>>>> +	udelay(10);
>>>>>>
>>>>>> Why do we need udelay() here? Why can't we use interval setting inside
>>>>>> gmu_poll_timeout()?
>>>>>
>>>>> Similarly here:
>>>>>
>>>>> [...]
>>>>>
>>>>>>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>>>>>>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>>>>>>> +		return 0;
>>>>>>> +
>>>>>>> +	dev_err_ratelimited(gmu->dev, "delay in fenced register write (0x%x)\n",
>>>>>>> +			offset);

This print should be after the 2nd polling. Otherwise the delay due to
this may allow GPU to go back to IFPC.

>>>>>>> +
>>>>>>> +	/* Try again for another 1ms before failing */
>>>>>>> +	gpu_write(gpu, offset, value);
>>>>>>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>>>>>>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>>>>>>> +		return 0;
>>>>>>> +
>>>>>>> +	dev_err_ratelimited(gmu->dev, "fenced register write (0x%x) fail\n",
>>>>>>> +			offset);
>>>>>
>>>>> We may want to combine the two, so as not to worry the user too much..
>>>>>
>>>>> If it's going to fail, I would assume it's going to fail both checks
>>>>> (unless e.g. the bus is so congested a single write can't go through
>>>>> to a sleepy GPU across 2 miliseconds, but that's another issue)
>>>>
>>>> In case of success, we cannot be sure if the first write went through.
>>>> So we should poll separately.
>>>
>>> You're writing to it 2 (outside fence_status_check) + 2*1000/10 (inside)
>>> == 202 times, it really better go through..
>>
>> For the following sequence:
>> 1. write reg1 <- suppose this is dropped
>> 2. write reg2 <- and this went through
>> 3. Check fence status <- This will show success
> 
> What I'm saying is that fence_status_check() does the same write you
> execute inbetween the polling calls

On a second thought I think it is simpler to just use a single polling
of 2ms and measure the time taken using ktime to print a warning if it
took more that 1ms.

-Akhil.

> 
> Konrad
>>
>>>
>>> If it's just about the write reaching the GPU, you can write it once and
>>> read back the register you've written to, this way you're sure that the
>>> GPU can observe the write
>>
>> This is a very unique hw behavior. We can't do posted write.
>>
>> -Akhil
>>
>>>
>>> Konrad
>>


