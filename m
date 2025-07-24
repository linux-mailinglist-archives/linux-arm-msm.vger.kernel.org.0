Return-Path: <linux-arm-msm+bounces-66623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A951B111E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 21:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 861827B50E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 19:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05FA0186E2E;
	Thu, 24 Jul 2025 19:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VGEGXUNL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B389443
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 19:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753386526; cv=none; b=cJRcHKHVGbQSF0ix2acbBgcoJu3djnFODLT0+I0L2amXMqXFAqypTH+Y6cvqhEh8wWOXSjfjQq4yaypg/ifzjajzdEl7acU3yr/Vdz5UfUPBIEZlv/yW8WsbrQEntGPNH5/AVDhVoE7IeNSXeUsZTmgnleEXAYkxpr8+anKEr0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753386526; c=relaxed/simple;
	bh=w80Yi4BnalZlHOrVme32nQYyIUcb3pMqhMpXFJqonQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qeih+d75FkGNGNk9hcEzjsycMn2gnoAw2AgQi7ZiWNkffTxqLFG+YHhWbH0LS+RHzDsHCYlrnj42zVrOJX+Gr2WZnb9zUJ278not/2OO/kxi6yuN7nqCRyxNhk0uB+dgVHOliMBMfobbw3NnYUktLiXAggzVySVATB9g3UJdq3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VGEGXUNL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9OpfT022161
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 19:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Zk31FwHDyecwqZluw7Q4yVbVUdBUD1ySIUTZM3t/+4=; b=VGEGXUNLCcnzxox7
	cTtrUHI9JgtZSZXmvIuz+hJuDJlt/MuibF3N1cZUuDKd2wssjc3FxqPoKNAIy7n3
	U+9BSHIn44d0dgPlhTQbJ8xDiw688Z1BMjHGOn+2g3dlg80WAQjSX+0EZZJvRtdq
	s5duzZPvWxy/iYcsfCOFB+JqfGFie33PmaL1kj5z23c1oXXM/p7E/4eDrrP0ZowN
	0PgFWUYc4Pr8VY+kbIzEchgl2nGxgYC0L59vQWHrvN7nDAmrC7UQhstCb7jwClrm
	io3aOJGrPcQ9Acatr/LcAGJof82bKB71MV4fEMCjynzWUDPc1XIh59cMZJ6wBZQF
	1VY0aA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dsq22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 19:48:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-313d346dc8dso2251596a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 12:48:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753386521; x=1753991321;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Zk31FwHDyecwqZluw7Q4yVbVUdBUD1ySIUTZM3t/+4=;
        b=cfOo8GenHuUr2Z+mtg6JU1kyfwXOeh8Q6+2ih8jR0GkrwsQriibLKWz9H1WCfANQ6Z
         vgeb8ad78ZDJtsfp1LQclDbgwkiQllOhYvH/JJ8JFwDCtj3R5H1Z6o0amCRqCFXDNfhv
         7ajganA22AcdWETr75aq1qHoAxOHivVaxukSBQZgaugTjwDwHpkJE/6YkdamT7fTSiRg
         Qtp4iii1axzkwwVa619kKBO9mSGDbafzRNC3SKwGxxKNsb1VrzBW8jV95ZQHmddMdhl+
         AsZRZAl1KfwJUkGCAE9wgHRC3VTc3teuCq0l1ZTi2O3+VZYlaBWS8ItJBBynGu2l0KOx
         69rA==
X-Forwarded-Encrypted: i=1; AJvYcCVsRztjCq1qvphX0NFW9B9njuOKvlCZSz7CeisHFbBRVLIkHDGyHB1wxrsNTmVrvrC79MXPlVPeWJ418uhS@vger.kernel.org
X-Gm-Message-State: AOJu0YzV6VyTMDpk3k5fAbwVDZVzKeh7OEtELnS4PIhAHnoWzr2WqpZ0
	E3xWad9zlI5pI2PWSFrtEqpLdCZnAfkSoWUWawYTjsx2dIzDoPwu9BNn8bVvtZR2AOwtPZUmZwJ
	tyeOOMqfm6yWQ/zq/vjv1m63KoIRGigIDUr35eJVZqVj6sGysShlALvQH+lBQMZpH8rwI
X-Gm-Gg: ASbGncvyqjmD3KLXLTvUOX5ka4Io28hl1s8w8FKKAdrpQFXoBVylW/xVDBImrcq6keQ
	ZtTL0aZhAKJPK3AxXz3T+rjtq4DSySo/qfqiQODJDmH6cOlRtxnfV4UfOVdAcjEZCtlB9R+nSgr
	mDFAwKxefIIrHUmhzBg8sjG+MwZSm5LDyGe32wiLKD5L6hVC2AbDcD2Q4Urin1GpeXXHZtI9+4+
	j8KFZ3oi5rNrYOfoMFKzDIT2gTlZF9ZxCTdLT8+O7fhgBWKap2B4R5a5zELhCptLBxdxxD8cdE/
	rXQzCSe1sHIraqxQjTjF9eemuieAYufIspe52yi3h+scAFll+cr6meX5PFXqvA==
X-Received: by 2002:a17:90b:224a:b0:313:1e60:584d with SMTP id 98e67ed59e1d1-31e507a8515mr13390658a91.11.1753386520531;
        Thu, 24 Jul 2025 12:48:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjWGyY20qpt+3zh7h0gbJzfKfTTUx1DtPOxe3O5W+CSBwlXZVQXdRE5miOVJMgWqqdhQrVSQ==
X-Received: by 2002:a17:90b:224a:b0:313:1e60:584d with SMTP id 98e67ed59e1d1-31e507a8515mr13390630a91.11.1753386520031;
        Thu, 24 Jul 2025 12:48:40 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e662937c5sm1957547a91.18.2025.07.24.12.48.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 12:48:39 -0700 (PDT)
Message-ID: <6cca1521-a806-4c43-a003-36a045cf007c@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 01:18:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Wait for MMU devcoredump when waiting for GMU
To: rob.clark@oss.qualcomm.com, Connor Abbott <cwabbott0@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20250718-msm-gmu-fault-wait-v1-1-4dcadd3b0eb6@gmail.com>
 <CACSVV023+6939fWvObBKg-rcoqP7TvxjQ2a8mY5+69dBh6cakA@mail.gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACSVV023+6939fWvObBKg-rcoqP7TvxjQ2a8mY5+69dBh6cakA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=68828e1a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=pSIa2sKh8ADkebnh61Ypzg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=9UHMFBqk8C1J7Xn5E5YA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: -R0PvLkZDiWDZ9T1N1szvc5XS5ijo45Y
X-Proofpoint-ORIG-GUID: -R0PvLkZDiWDZ9T1N1szvc5XS5ijo45Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDE1NCBTYWx0ZWRfX1H9yWm4um/II
 MlYZnsBYElqWpKG/gR08oe0aoOy6SoQydxWiUiU+F8Tuopno1gwlghK1Sikw8k+rUZoYwYs7yH8
 NiYfy6JFmpO6FLOmyovqtC0KQEWk3AA5eiboVG1e+pdZ5mAWgglXbkMAREmFAxR9CGsN4VJ2FkZ
 xsOsnnsrc8yQMi1Z3ReeAD/+1ZplNSpr2oCgM5CiKPFCeZOzd1W8w4rMPnN63zpYfslA0NpqQFw
 011ZDp08n4du4O0Iw3DQ//r+UEQIl4NHcpj0A13plrbfHSeTyvtLH8ewr9lTiszLIiWNCgNjD5/
 SCuzillIUzFeEKhoQh72rGUeL8YvIl70FVUCymbmvgZ4ubNQv9MsXVzWXjtKVDbiVt7eOjAUNZc
 hWTZ1p9vLrR1+1c7SQ5nTPfVz/HgWNvTjIqwSSVaRS6Qwm8OsUHtVN5n2fNkuyHGGNgtHHMg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240154

On 7/21/2025 9:02 PM, Rob Clark wrote:
> On Fri, Jul 18, 2025 at 6:50 AM Connor Abbott <cwabbott0@gmail.com> wrote:
>>
>> If there is a flood of faults then the MMU can become saturated while it
>> waits for the kernel to process the first fault and resume it, so that
>> the GMU becomes blocked. This is mainly a problem when the kernel reads
>> the state of the GPU for a devcoredump, because this takes a while. If
>> we timeout waiting for the GMU, check if this has happened and retry
>> after we're finished.
>>
>> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 21 ++++++++++++++++++---
>>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c   | 21 ++++++++++++++++++---
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 +++++++++++
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 ++
>>  4 files changed, 49 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 28e6705c6da682c7b41c748e375dda59a6551898..6ec396fab22d194481a76d30b2d36ea5fb662241 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -340,6 +340,7 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>>         int ret;
>>         u32 val;
>>         int request, ack;
>> +       struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>>
>>         WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
>>
>> @@ -363,9 +364,23 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>>         /* Trigger the equested OOB operation */
>>         gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET, 1 << request);
>>
>> -       /* Wait for the acknowledge interrupt */
>> -       ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, val,
>> -               val & (1 << ack), 100, 10000);
>> +       do {
>> +               /* Wait for the acknowledge interrupt */
>> +               ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, val,
>> +                       val & (1 << ack), 100, 10000);
>> +
>> +               if (!ret)
>> +                       break;
>> +
>> +               if (completion_done(&a6xx_gpu->base.fault_coredump_done))

I didn't get why this is required. Could you please add a comment?

>> +                       break;
>> +
>> +               /* We may timeout because the GMU is temporarily wedged from
>> +                * pending faults from the GPU and we are taking a devcoredump.
>> +                * Wait until the MMU is resumed and try again.
>> +                */
>> +               wait_for_completion(&a6xx_gpu->base.fault_coredump_done);
>> +       } while (true);
> 
> It is a bit sad to duplicate this nearly identical code twice.  And I
> wonder if other gmu_poll_timeout()'s need similar treatment?  Maybe
> Akhil has an opinion about whether we should just build this into
> gmu_poll_timeout() instead?

Yeah. That make sense. A potential issue I see is that we might be
holding both gpu and gmu locks here and the crashstate capture in the pf
handler tries to lock gpu, which can result in a dead lock.

-Akhil.

> 
> BR,
> -R
> 
>>
>>         if (ret)
>>                 DRM_DEV_ERROR(gmu->dev,
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> index 8e69b1e8465711837151725c8f70e7b4b16a368e..4e775ca757ce3649ac238d25cebfd7eb693fda61 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> @@ -104,10 +104,25 @@ static int a6xx_hfi_wait_for_msg_interrupt(struct a6xx_gmu *gmu, u32 id, u32 seq
>>  {
>>         int ret;
>>         u32 val;
>> +       struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>> +
>> +       do {
>> +               /* Wait for a response */
>> +               ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, val,
>> +                       val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 1000000);
>> +
>> +               if (!ret)
>> +                       break;
>>
>> -       /* Wait for a response */
>> -       ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, val,
>> -               val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 1000000);
>> +               if (completion_done(&a6xx_gpu->base.fault_coredump_done))
>> +                       break;
>> +
>> +               /* We may timeout because the GMU is temporarily wedged from
>> +                * pending faults from the GPU and we are taking a devcoredump.
>> +                * Wait until the MMU is resumed and try again.
>> +                */
>> +               wait_for_completion(&a6xx_gpu->base.fault_coredump_done);
>> +       } while (true);
>>
>>         if (ret) {
>>                 DRM_DEV_ERROR(gmu->dev,
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> index f1230465bf0d0840274a6eb03a10c4df3a7a68d3..19181b6fddfd518e2f60324da1a7087458115e40 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> @@ -293,6 +293,7 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
>>                          struct adreno_smmu_fault_info *info, const char *block,
>>                          u32 scratch[4])
>>  {
>> +       struct adreno_gpu *adreno_gpu = container_of(gpu, struct adreno_gpu, base);
>>         struct msm_drm_private *priv = gpu->dev->dev_private;
>>         struct msm_mmu *mmu = to_msm_vm(gpu->vm)->mmu;
>>         const char *type = "UNKNOWN";
>> @@ -345,6 +346,11 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
>>                 /* Turn off the hangcheck timer to keep it from bothering us */
>>                 timer_delete(&gpu->hangcheck_timer);
>>
>> +               /* Let any concurrent GMU transactions know that the MMU may be
>> +                * blocked for a while and they should wait on us.
>> +                */
>> +               reinit_completion(&adreno_gpu->fault_coredump_done);
>> +
>>                 fault_info.ttbr0 = info->ttbr0;
>>                 fault_info.iova  = iova;
>>                 fault_info.flags = flags;
>> @@ -352,6 +358,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
>>                 fault_info.block = block;
>>
>>                 msm_gpu_fault_crashstate_capture(gpu, &fault_info);
>> +
>> +               complete_all(&adreno_gpu->fault_coredump_done);
>>         }
>>
>>         return 0;
>> @@ -1238,6 +1246,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>         if (ret)
>>                 return ret;
>>
>> +       init_completion(&adreno_gpu->fault_coredump_done);
>> +       complete_all(&adreno_gpu->fault_coredump_done);
>> +
>>         pm_runtime_set_autosuspend_delay(dev,
>>                 adreno_gpu->info->inactive_period);
>>         pm_runtime_use_autosuspend(dev);
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> index 9dc93c247196d5b8b3659157f7aeea81809d4056..f16556c6f2921708e740ecd47f5b4668e87700aa 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> @@ -179,6 +179,8 @@ struct adreno_gpu {
>>         uint16_t speedbin;
>>         const struct adreno_gpu_funcs *funcs;
>>
>> +       struct completion fault_coredump_done;
>> +
>>         /* interesting register offsets to dump: */
>>         const unsigned int *registers;
>>
>>
>> ---
>> base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
>> change-id: 20250718-msm-gmu-fault-wait-465543a718fa
>>
>> Best regards,
>> --
>> Connor Abbott <cwabbott0@gmail.com>
>>


