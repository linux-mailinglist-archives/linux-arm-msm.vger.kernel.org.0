Return-Path: <linux-arm-msm+bounces-67003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FBFB14E00
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 15:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46D8718A1104
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 13:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E80E224FA;
	Tue, 29 Jul 2025 13:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ptyRps1r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E49F510
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 13:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753794112; cv=none; b=ebyrrnd+04PwjZIm8K/WXPW2a1o1+Mv6EU2474N8xqB85cslsO33nc2FJiVJmTGGW45Skil6GH97g7u8QvQkjcEE5Qt6jVChP+pkovFuWHReOfx/Ju4a72Gvw55mYmdJgigAhV5PDh5ccAyeG/0UymPFjSRIr3fo1+lxG37gJh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753794112; c=relaxed/simple;
	bh=VNG4d0MTvleX4tYg5mr/JKAvLnfAPWjFKhL4Ysw/WFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NCwfZMXQuaAincZqMc51eNv+994l+sJUbdAYgpLhPcSLqVrch92jtK0ZyJK66u3NNwBvV6oPwMlXgxBuzZ9S4q0PwZDSXbG7ty+7W7rxq/AAFFL502IplcsFwpdoVNDMsLJ5tLEQaHft97mpoZ6vPCpZeWDr5hdX7UNjvnF1V+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ptyRps1r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8bcFB031247
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 13:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	juelwFjR0xLghnG+f+9iPeOqQI/44lFNaWH/bAdlNAM=; b=ptyRps1rY0xMNoXh
	EOyXS2PpTv3+wYuRo1OUBzUHolaxzWKMLyVOlWyJcSeLFMlw2EtahowaE+jQM4KY
	qmQxb+aq8T4/gR1VKVTXhKAF35ySBOXxrDowLNNUCmdITgbaGECJ8muXnRNbdekJ
	/lzn+fPoL0s5kB5DmJYNCCwJD5sBs4+EZlXWkJIkcBQkioQntrdccK2oUfvcDUVr
	FpfLdQC/ceAZwLaZGnfzGqOnzv2fM1WRQzEgzC6X4oPEycQj0dSs0KqPlDSdtzcC
	BDSyBNqSvKQOt5JtZmC/EO/9yRwSXVgiRm6CCRUsYmwrtD4pQYrx/x48SgpJfEiS
	ohJFQw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 485v1xdgq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 13:01:49 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-4ecd0d8920eso118175137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 06:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753794108; x=1754398908;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=juelwFjR0xLghnG+f+9iPeOqQI/44lFNaWH/bAdlNAM=;
        b=banYGi7PhKAy+YyhUB7O+Aqmx0OUdDI4gJUSaq+VnwyBtmsTfMBzL/SXM08KCbbasN
         6QH8z1aHPXiIZza4PVSgnA+5hQAk4G2a+kwTxi5uqwz/PKxZlDv4WslG93fGgH0PknJE
         z1jIghgyXaBhwk8sl60vKdp4mvWwuAMWVXxg4EicYAhmSjhwR1eFLGGgJiqH3EMK3CVe
         /eimTcPqiruZYHlyD3tMUbrmahcp4RY47zMGzTu2CrMZuNtUr0ytfeKwAx9blvTA1s/Z
         x9m++8q4pRIApuTQ5kZ9Tpwd+Hvn3uJnRu8p7Oz5d3l3qqOhV0c0Yi0N11Xh9MUWJCB0
         k2gg==
X-Forwarded-Encrypted: i=1; AJvYcCVJMMrQu/6HyrjWnSN5L5lT38CvF/8tMfGxnP53v9HCoOR5jqLBSvgctGsjAto2S3C33VRHGH6bSKT+W0Fw@vger.kernel.org
X-Gm-Message-State: AOJu0YxtDPtwAC4LM1oD1sRn2nayBqv0xPAp+7AbR60GruV2owidbthx
	H/ERrrHj60XeiA0vVKaqFdZOpnNtCNJhNNAAD0u7u34n3TylJgwc2WycU8Q9J7dKhP1SnNg9DyX
	wGxT1KX0JwVagnt9mqQCv+e2qKDyuQW29eQqd6Yesq11yITFBDPBTLGl7aKBSDgrfENaH
X-Gm-Gg: ASbGncsY9VEXBDV8PC6YLOjxYxeEg+WJKJvC1nu6ZRJExpqXQ1rOyUZ2ojvsIcSQl4X
	9p2iW/BaJ9pLdH4R2bGOKVb6PsfLs+U19+Q3x1LK6mnumln0zymJxgJC9mnRqt3E34EXWcVYANX
	AVV9dbksbF44UdILBgyuFKjCm14ksTSFLkfVotGe4N5+KCFeYEPOqK25jMwHFhSHEvL3Y1cYJTU
	0TXL/Re+0CpGYJBqEgrfB3tWAwQOddsURhqITvHYxaOmifhyWQhi20CWA2ZKZsku3pPNuTJ0u2C
	iEcKZXTEiaaLNTd5mE44eeaA2Di1rEy/9qJKbudGVNyw3CFxwiz8BulJBRVRhYSDIaDy+pf5xzv
	8SDIzxlJA7ODEwTr1IA==
X-Received: by 2002:a05:6122:3642:b0:537:426e:bd0 with SMTP id 71dfb90a1353d-538db607c97mr1409818e0c.1.1753794108157;
        Tue, 29 Jul 2025 06:01:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3XZWl+BOftPeIJVe+mX7EzNQo4NU6m5CJLOb08qSGkjUakLEtnkqZAh4Nc9Ct/8TqmnlT/w==
X-Received: by 2002:a05:6122:3642:b0:537:426e:bd0 with SMTP id 71dfb90a1353d-538db607c97mr1409759e0c.1.1753794107351;
        Tue, 29 Jul 2025 06:01:47 -0700 (PDT)
Received: from [192.168.43.17] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af6358a0994sm585862966b.44.2025.07.29.06.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 06:01:45 -0700 (PDT)
Message-ID: <9e48ea8e-b59b-4620-9781-211cc1f7cc07@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 15:01:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] drm/msm/adreno: Add fenced regwrite support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3f58451a-9b5f-4697-9679-d549104e8312@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDEwMSBTYWx0ZWRfXy4g4hV9sOwrI
 E+8EyIPoKIVK2PQM5EgCI2nJl82qpLVFZnauSdK0kZkj/byc+Sbmsq86cJXI90V4zt06QOdjXP4
 nthH/dYtskg7jJ2GiGbO3ToCJF57DhLENKrBL07KGBvqHFV4uCOdFERetnAteJOYpodnFWImddA
 K4pTUJCXO5K2aB/7irz9XL40UuEqil5QJXmtfoylMLMfzsPPBxt9VMpSKR7TIp3MmFmP4RjRnXm
 k8drEOt4qjUnMtKfw/sU7xEecRrh1W0Tut4dliWg9Zo7qLtT/4hOlUOzSA2MospQlq0dtxdWz1M
 s/mlZH7QjAiCDTIpMojZj8Psj+vXRDYcikz4lJtcvUTVa2eujunIAVgsOpftErXgdB6Ru4q8ndB
 ay123CKo/I32MMDhTE8nw8HVZ4cw3wJxCsXXMBN8+7vFLf0eciTT4uV4CG4V2N0JKbh36GYE
X-Authority-Analysis: v=2.4 cv=JKw7s9Kb c=1 sm=1 tr=0 ts=6888c63d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=9hkt72pFxozsIUrbaQoA:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: _Z_TyDIHyZ3qe80NziHQ8J31dU6LJOZI
X-Proofpoint-GUID: _Z_TyDIHyZ3qe80NziHQ8J31dU6LJOZI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290101

On 7/24/25 6:54 PM, Akhil P Oommen wrote:
> On 7/24/2025 5:16 PM, Konrad Dybcio wrote:
>> On 7/23/25 11:06 PM, Akhil P Oommen wrote:
>>> On 7/22/2025 8:22 PM, Konrad Dybcio wrote:
>>>> On 7/22/25 3:39 PM, Dmitry Baryshkov wrote:
>>>>> On Sun, Jul 20, 2025 at 05:46:08PM +0530, Akhil P Oommen wrote:
>>>>>> There are some special registers which are accessible even when GX power
>>>>>> domain is collapsed during an IFPC sleep. Accessing these registers
>>>>>> wakes up GPU from power collapse and allow programming these registers
>>>>>> without additional handshake with GMU. This patch adds support for this
>>>>>> special register write sequence.
>>>>>>
>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>> ---
>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 63 ++++++++++++++++++++++++++++++-
>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 +++++-----
>>>>>>  3 files changed, 73 insertions(+), 11 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>> index 491fde0083a202bec7c6b3bca88d0e5a717a6560..8c004fc3abd2896d467a9728b34e99e4ed944dc4 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>> @@ -16,6 +16,67 @@
>>>>>>  
>>>>>>  #define GPU_PAS_ID 13
>>>>>>  
>>>>>> +static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
>>>>>> +{
>>>>>> +	/* Success if !writedropped0/1 */
>>>>>> +	if (!(status & mask))
>>>>>> +		return true;
>>>>>> +
>>>>>> +	udelay(10);
>>>>>
>>>>> Why do we need udelay() here? Why can't we use interval setting inside
>>>>> gmu_poll_timeout()?
>>>>
>>>> Similarly here:
>>>>
>>>> [...]
>>>>
>>>>>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>>>>>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>>>>>> +		return 0;
>>>>>> +
>>>>>> +	dev_err_ratelimited(gmu->dev, "delay in fenced register write (0x%x)\n",
>>>>>> +			offset);
>>>>>> +
>>>>>> +	/* Try again for another 1ms before failing */
>>>>>> +	gpu_write(gpu, offset, value);
>>>>>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>>>>>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>>>>>> +		return 0;
>>>>>> +
>>>>>> +	dev_err_ratelimited(gmu->dev, "fenced register write (0x%x) fail\n",
>>>>>> +			offset);
>>>>
>>>> We may want to combine the two, so as not to worry the user too much..
>>>>
>>>> If it's going to fail, I would assume it's going to fail both checks
>>>> (unless e.g. the bus is so congested a single write can't go through
>>>> to a sleepy GPU across 2 miliseconds, but that's another issue)
>>>
>>> In case of success, we cannot be sure if the first write went through.
>>> So we should poll separately.
>>
>> You're writing to it 2 (outside fence_status_check) + 2*1000/10 (inside)
>> == 202 times, it really better go through..
> 
> For the following sequence:
> 1. write reg1 <- suppose this is dropped
> 2. write reg2 <- and this went through
> 3. Check fence status <- This will show success

What I'm saying is that fence_status_check() does the same write you
execute inbetween the polling calls

Konrad
> 
>>
>> If it's just about the write reaching the GPU, you can write it once and
>> read back the register you've written to, this way you're sure that the
>> GPU can observe the write
> 
> This is a very unique hw behavior. We can't do posted write.
> 
> -Akhil
> 
>>
>> Konrad
> 

