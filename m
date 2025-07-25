Return-Path: <linux-arm-msm+bounces-66742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91506B126B6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 00:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A24231CC48AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 22:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7406224C07A;
	Fri, 25 Jul 2025 22:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lL6ZzHkf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B87324EF7F
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 22:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753481555; cv=none; b=Oe6qoZlgBZ+X/T8mIUdTA/jSWvNs+ed+zfn76LAFaWYs9QNIqmxogFga1j/EXkjxupTWpQC02E0n81j/rRxhSuAZbKVlW78d2YJAd7YT8Ey+1rKmNPhOcoT5ObFNqCF/8ABZZqtqOeITk2W1uEslFfjoPRL/nDvL1HvkL072qvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753481555; c=relaxed/simple;
	bh=KQWx9JR8XfPV1euZdRm6djHu/EXFmRvTLXzEqVHd7J0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pxjbz+powS++jDZr+f4RWv61mtFmrG4rz6RlZoO5Fe9Re1C+31iIKdxT00GCu00g6hBUle6s/SwxqhkOCPtcJYmAJ7FAAxZb6xaXzUr77Jya3bG5l0wjnbWxvQR3pbh5OYcplR3pE/+5giCJD+cPEwwd3kN1wzIJHlmgVUnu5+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lL6ZzHkf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PKAZRB004625
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 22:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4X1DTfh0h5zjGoQqDTegOhGV3+NK0W3zXpJbN3Ug020=; b=lL6ZzHkfdghUkzCj
	+4epTCO/EMm1dleIOvZx5/ZN1w/THYMeOJF/itwdulsmsnMaMnMUgOc51+zk4lLI
	UJePzvn8Dr7Ann5Cmy5jS/ZihRFvTagonVReUHrHwAIVjiyPN1d0ZwnHmC2OqVqA
	LX2qTlolS4vJWbTFubBkxf0tYACpjcLLIdvlEX06E/6ySGXpIBInbIEYkZ4lhVBj
	fGpzvBt48GEtiHv+T/O1lVIR/ar0ntS/0f3pI4sK2VGJPwNcZLzG3Jxz8FY9KJma
	S1DrcigPAAxik2Znv0InKVYzUPveXD4NPQPtomz0UI52r3HZCHA6Z+Kf6u1n2qn8
	RSDG9Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w53bhb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 22:12:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2c37558eccso1719184a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 15:12:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753481544; x=1754086344;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4X1DTfh0h5zjGoQqDTegOhGV3+NK0W3zXpJbN3Ug020=;
        b=gHSqDmNn2bWsZ0P7xu7Op/dvy3BSZxMEr3oPhj4tGx7fGWy1aEez73M3d7d3NApNZf
         21OMJ7LuBLYFKfF2ibjnBsd0qPAC/m2KPKrLUmHyrkqg3dXr1YL1/by/V8n/a9bfvgpC
         IBeXZE7RkXWAi/KXE8F35iiNI01z59Ga3kyEXepXLOcw8cwKEuG1zcOp6yDoyu4/s+1i
         jNZsw6rdBQewculIiBDi9Qi67jTzSdybRnAEJNIZlzcK/6YTfFnSV8N3KOowLp0ni4e2
         Q3zFDdPdEgUsrxkbn4x94SM1nLBFlv8E4FFdRI21KKYfJduLh10pOm9IDTsE7/3+VSvX
         W3BQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3hWRpamwBgDeKiqaNkFNX8L4VKGaItSAo1ch1qpaH+X5hHOIGfnuvC44CfDaey5Qr7em60eG5vaX5VTAW@vger.kernel.org
X-Gm-Message-State: AOJu0YwcYAWwmDgsBTxzjtaGOriskCQFjVIbNUCM/mbA/0lkH/pz52la
	z6BvEGK6fl1rhx8hPI/XgGrfVJFYBCqGRTv3byg0aBHkfktQz0LiYvu1Mv3wnXMo1rYvXFzVsLF
	yMt8fhQK+aBQhmqkJGRCbp4YWrUNXDyxv84QEEudftlm7/shCk/bBRxJix0c7Vfd7+0m/
X-Gm-Gg: ASbGncu8tFLPr+TelqONUqVnKBWRYOxBLXc6gVMIFQNLmbTX8Ze3fExz3GB75AqSJf7
	6Ux9eifNBb7JFvEN6II5lz6abm3+l3edaGPux7kQwibAZ33g8tjOb5dOhggx1VgiBbQMuZvuRTE
	r1uZKgZWvee4oFFYcDy6Cyio1zR5X0PMo3fspXF1RCy98iRdTkDZXvCwkTw2aEZqwX1n/Ccz83v
	F+onO66fbBY8PJevq9FGQy60qMO/oShA6QM9PTiHyMi2YsQIfyCeGspSslwOv4iq46PY85NNysk
	4GfdZV5/5dNamSSnu+r08zNcRNrJsx110Axu+5tT7PpRjP3wqybTR0SQ0ZhgNA==
X-Received: by 2002:a05:6a20:7291:b0:206:a9bd:a3a3 with SMTP id adf61e73a8af0-23d7019bfd6mr5713440637.24.1753481544390;
        Fri, 25 Jul 2025 15:12:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHX44LpEE6pjx6vDy1KFy13/JWR3bwOHq1/KIsk5FhoYPJGajvnBuxDCj/wdjizthdytBpexg==
X-Received: by 2002:a05:6a20:7291:b0:206:a9bd:a3a3 with SMTP id adf61e73a8af0-23d7019bfd6mr5713405637.24.1753481543909;
        Fri, 25 Jul 2025 15:12:23 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640b2ddf63sm436237b3a.102.2025.07.25.15.12.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 15:12:22 -0700 (PDT)
Message-ID: <8656b48d-2f27-4dd9-b29a-72ee1129d18a@oss.qualcomm.com>
Date: Sat, 26 Jul 2025 03:42:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Wait for MMU devcoredump when waiting for GMU
To: Connor Abbott <cwabbott0@gmail.com>
Cc: rob.clark@oss.qualcomm.com, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20250718-msm-gmu-fault-wait-v1-1-4dcadd3b0eb6@gmail.com>
 <CACSVV023+6939fWvObBKg-rcoqP7TvxjQ2a8mY5+69dBh6cakA@mail.gmail.com>
 <6cca1521-a806-4c43-a003-36a045cf007c@oss.qualcomm.com>
 <CACu1E7EApr6Ne3XxFv4cUa2JuwNW2kfo1c5wSsAUN78iWyQ2sg@mail.gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACu1E7EApr6Ne3XxFv4cUa2JuwNW2kfo1c5wSsAUN78iWyQ2sg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AfKxH2XG c=1 sm=1 tr=0 ts=68840149 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=pSIa2sKh8ADkebnh61Ypzg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=rrUdA_u0f1kXpUkxPP8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDE5MiBTYWx0ZWRfXz4x4AoXeb5x3
 RXWkM1GRFPM4WxhkFPqjPctZSdZYN7UwfT5eqqN4VHWK4CCiQbbT5CPAaWiUrJX9Pp7AXkvNSpr
 /6YtMrwqidEBSNbEEzaAS7GfiypDzBbrKF0ueb/ko6OFHrnroujHLjkP9ABO5LuLImTmwTVEee+
 0X57LgeKpMbW6wTD4pOyxBY1MeCDTePTpjsZqPoa5JiCFEhYpbAGrXOvrXP0nDvg1nQz0ujpi+1
 /u56AuaPE3puARKMRRZbUEx2pJQM3uHBdcQ/E7PEaKxp11GEu9M43hBTxjOJcUCeSrErWtHHttv
 IQCAD9F4626GcOL+RNpP3kJJPgKPjLYsf5R5BTlYRrlNlAF4G3Obi4XLsg2zOf4xOK25nWMUQeT
 inl7cq4ldmkwteiKc/HY+Fb6EHPj8VAFpl/jU5ksjRdpF+On86v/hkvkqyjcfCEhF59Q04ez
X-Proofpoint-GUID: PQF7qklDl6AMw9LcxVCaJVOIiJuPLNHE
X-Proofpoint-ORIG-GUID: PQF7qklDl6AMw9LcxVCaJVOIiJuPLNHE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_06,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 mlxlogscore=774 suspectscore=0 spamscore=0
 impostorscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250192

On 7/25/2025 1:31 AM, Connor Abbott wrote:
> On Thu, Jul 24, 2025 at 3:48 PM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>> On 7/21/2025 9:02 PM, Rob Clark wrote:
>>> On Fri, Jul 18, 2025 at 6:50 AM Connor Abbott <cwabbott0@gmail.com> wrote:
>>>>
>>>> If there is a flood of faults then the MMU can become saturated while it
>>>> waits for the kernel to process the first fault and resume it, so that
>>>> the GMU becomes blocked. This is mainly a problem when the kernel reads
>>>> the state of the GPU for a devcoredump, because this takes a while. If
>>>> we timeout waiting for the GMU, check if this has happened and retry
>>>> after we're finished.
>>>>
>>>> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
>>>> ---
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 21 ++++++++++++++++++---
>>>>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c   | 21 ++++++++++++++++++---
>>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 +++++++++++
>>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 ++
>>>>  4 files changed, 49 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> index 28e6705c6da682c7b41c748e375dda59a6551898..6ec396fab22d194481a76d30b2d36ea5fb662241 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> @@ -340,6 +340,7 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>>>>         int ret;
>>>>         u32 val;
>>>>         int request, ack;
>>>> +       struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>>>>
>>>>         WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
>>>>
>>>> @@ -363,9 +364,23 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>>>>         /* Trigger the equested OOB operation */
>>>>         gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET, 1 << request);
>>>>
>>>> -       /* Wait for the acknowledge interrupt */
>>>> -       ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, val,
>>>> -               val & (1 << ack), 100, 10000);
>>>> +       do {
>>>> +               /* Wait for the acknowledge interrupt */
>>>> +               ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, val,
>>>> +                       val & (1 << ack), 100, 10000);
>>>> +
>>>> +               if (!ret)
>>>> +                       break;
>>>> +
>>>> +               if (completion_done(&a6xx_gpu->base.fault_coredump_done))
>>
>> I didn't get why this is required. Could you please add a comment?
> 
> Without this, if the GMU timed out for some other reason not related
> to SMMU then we'd loop infinitely. This gives up if there isn't
> currently a crashstate pending.

Ah! That api doc somehow confused me.

> 
>>
>>>> +                       break;
>>>> +
>>>> +               /* We may timeout because the GMU is temporarily wedged from
>>>> +                * pending faults from the GPU and we are taking a devcoredump.
>>>> +                * Wait until the MMU is resumed and try again.
>>>> +                */
>>>> +               wait_for_completion(&a6xx_gpu->base.fault_coredump_done);

use the interruptible version? we may reach here from a process context.

>>>> +       } while (true);
>>>
>>> It is a bit sad to duplicate this nearly identical code twice.  And I
>>> wonder if other gmu_poll_timeout()'s need similar treatment?  Maybe
>>> Akhil has an opinion about whether we should just build this into
>>> gmu_poll_timeout() instead?
>>
>> Yeah. That make sense. A potential issue I see is that we might be
>> holding both gpu and gmu locks here and the crashstate capture in the pf
>> handler tries to lock gpu, which can result in a dead lock.
> 
> I think there would already be a deadlock, or at least timeout in that
> situation now. Any task waiting for the GMU to complete while holding
> the GPU lock would block the crashstate capture from completing and
> allowing the GMU to continue.

Timeout is fine as there is progress eventually. But deadlock is not
acceptable. Also, userspace can easily trigger this deadlock which makes
it a security issue.

I agree, we need to improve the gmu error handling situation overall. I
thought about this a few years ago actually. At that time, I thought it
would be simpler if we always did coredump/recovery from a single
thread. Not sure if that idea still makes sense.

On a related topic, stall-on-fault cannot be used in production. GMU is
very critical as it interacts directly with SoC power management
subsystems and also every year, there is an additional responsibility on
GMU to do a very time critical mitigation like CLX, thermal, BCL etc.
And these mitigations should be handled within a few microseconds. So
GMU should never be blocked, even for microseconds. Apart from that,
even GPU's internal bus can get locked up in rare cases which can lead
to a fatal system bus/NoC error when KMD access a register in the GPU space.

But stall-on-fault is useful while debugging. So any improvements in
this area is useful.

-Akhil.


