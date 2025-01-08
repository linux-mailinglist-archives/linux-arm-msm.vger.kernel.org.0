Return-Path: <linux-arm-msm+bounces-44267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E1AA04FC3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 02:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F110818883BA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 01:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A386513D897;
	Wed,  8 Jan 2025 01:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y8G71y0e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FF114B06C;
	Wed,  8 Jan 2025 01:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736300070; cv=none; b=LGZA+0qWhtXrIwnBsOnsdyHcY2WuajYz7KdaGqrR7ojC89N8UX7HlIRGTNLHlAc9LCU70TIM9chZEdfX386a5JDfKDqVi8P49JE/SiN+8N4dsDcZX3SPcbtIKVD0E5yqgpPTMflQ86r0gTqwC0AlxQNJVNlfSFFlKTuqaRwJa7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736300070; c=relaxed/simple;
	bh=xwCEMaYjxzyj8bm4XCMptS+4oncwLrCjRql+Xv7Re78=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nyiLQ9NcNZ9jW3Yrz/MQMioWmdYhEYshG19J5999R3FgL8pWlV7WIPi8I/CMvhzx+BkYwOX6J7Hh581OD55XOhGNAgzcWbtpFhhJANIuAsb6JmvDpiOhURs3147Dlry5JiwbVNCcmmOnW1HvUYWMpEnt28DdpYgqHLyL7+I0S08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y8G71y0e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507IrjYI017696;
	Wed, 8 Jan 2025 01:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wHT9ixZI79Ftshy/iOaYNQLz/O4FR1Krr6lgA/qIRBo=; b=Y8G71y0eaG8bOVas
	ndQc5ulFZJYjMrcTflmSHKNZg6alq/RDMIpC0hldttsFmz0MlpSOliLliqhuYZnV
	Lwf62IcP/ErHV17WMJcGkwsP6IHTyzoczz6hkYlMqsgDj5adjxaBiQG1ctNbvq9m
	b8VoqXKGgf90AQEhSP4ePkoAbFGcRqhkJ7i4Y6cRWEkxJKB0GQb1j8c6D1E2SXOm
	X6Lnt1bXrjaG4AVijx2qSdQsBoi9v0Hth00Pm43s/HxWoXCgG4t8SqBadSfAtwsj
	IFakeBH6okzC6Glz0d525d7OwnoenmembxPBj++UTO2D3thkgCDzeUsCxGm9jyGa
	RK8gYQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4419xurq97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 01:34:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5081YLAU031224
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 01:34:21 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 Jan 2025
 17:34:20 -0800
Message-ID: <842c9230-d95a-43b8-83ed-0bfb286ee334@quicinc.com>
Date: Tue, 7 Jan 2025 17:34:20 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] drm/msm/dpu: rate limit snapshot capture for mmu
 faults
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241217-abhinavk-smmu-fault-handler-v2-0-451377666cad@quicinc.com>
 <20241217-abhinavk-smmu-fault-handler-v2-5-451377666cad@quicinc.com>
 <mbtwyyfryvltkeicgmrzrfas3u35ocathehswi4rme5tbs6r37@plcl6gzpl2ld>
 <dbe94c6b-e981-4f40-9261-2e44b5fb73cc@quicinc.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <dbe94c6b-e981-4f40-9261-2e44b5fb73cc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WXqXdxY5x0QJGiQ2Mmgfz4GIO1czaNLf
X-Proofpoint-GUID: WXqXdxY5x0QJGiQ2Mmgfz4GIO1czaNLf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080009



On 12/18/2024 1:33 PM, Jessica Zhang wrote:
> 
> 
> On 12/18/2024 3:20 AM, Dmitry Baryshkov wrote:
>> On Tue, Dec 17, 2024 at 04:27:57PM -0800, Jessica Zhang wrote:
>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>
>>> There is no recovery mechanism in place yet to recover from mmu
>>> faults for DPU. We can only prevent the faults by making sure there
>>> is no misconfiguration.
>>>
>>> Rate-limit the snapshot capture for mmu faults to once per
>>> msm_atomic_commit_tail() as that should be sufficient to capture
>>> the snapshot for debugging otherwise there will be a lot of DPU
>>> snapshots getting captured for the same fault which is redundant
>>> and also might affect capturing even one snapshot accurately.
>>>
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/msm_atomic.c | 2 ++
>>>   drivers/gpu/drm/msm/msm_kms.c    | 5 ++++-
>>>   drivers/gpu/drm/msm/msm_kms.h    | 3 +++
>>>   3 files changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_atomic.c 
>>> b/drivers/gpu/drm/msm/msm_atomic.c
>>> index 
>>> 9c45d641b5212c11078ab38c13a519663d85e10a..9ad7eeb14d4336abd9d8a8eb1382bdddce80508a 100644
>>> --- a/drivers/gpu/drm/msm/msm_atomic.c
>>> +++ b/drivers/gpu/drm/msm/msm_atomic.c
>>> @@ -228,6 +228,8 @@ void msm_atomic_commit_tail(struct 
>>> drm_atomic_state *state)
>>>       if (kms->funcs->prepare_commit)
>>>           kms->funcs->prepare_commit(kms, state);
>>> +    kms->fault_snapshot_capture = 0;
>>> +
>>
>> - Please move it before the prepare_commit().
>> - You are accessing the same variable from different threads / cores.
>>    There should be some kind of a sync barrier.
> 
> Hi Dmitry,
> 
> Ack, will add a lock for the snapshot capture counter.
> 
> Thanks,
> 
> Jessica Zhang
> 

We cannot have a mutex lock because msm_kms_fault_handler cannot hold a 
mutex. So we need an atomic variable in this case.

>>
>>>       /*
>>>        * Push atomic updates down to hardware:
>>>        */
>>> diff --git a/drivers/gpu/drm/msm/msm_kms.c 
>>> b/drivers/gpu/drm/msm/msm_kms.c
>>> index 
>>> 78830e446355f77154fa21a5d107635bc88ba3ed..3327caf396d4fc905dc127f09515559c12666dc8 100644
>>> --- a/drivers/gpu/drm/msm/msm_kms.c
>>> +++ b/drivers/gpu/drm/msm/msm_kms.c
>>> @@ -168,7 +168,10 @@ static int msm_kms_fault_handler(void *arg, 
>>> unsigned long iova, int flags, void
>>>   {
>>>       struct msm_kms *kms = arg;
>>> -    msm_disp_snapshot_state(kms->dev);
>>> +    if (!kms->fault_snapshot_capture) {
>>> +        msm_disp_snapshot_state(kms->dev);
>>> +        kms->fault_snapshot_capture++;
>>> +    }
>>>       return -ENOSYS;
>>>   }
>>> diff --git a/drivers/gpu/drm/msm/msm_kms.h 
>>> b/drivers/gpu/drm/msm/msm_kms.h
>>> index 
>>> e60162744c669773b6e5aef824a173647626ab4e..3ac089e26e14b824567f3cd2c62f82a1b9ea9878 100644
>>> --- a/drivers/gpu/drm/msm/msm_kms.h
>>> +++ b/drivers/gpu/drm/msm/msm_kms.h
>>> @@ -128,6 +128,9 @@ struct msm_kms {
>>>       int irq;
>>>       bool irq_requested;
>>> +    /* rate limit the snapshot capture to once per attach */
>>> +    int fault_snapshot_capture;
>>> +
>>>       /* mapper-id used to request GEM buffer mapped for scanout: */
>>>       struct msm_gem_address_space *aspace;
>>>
>>> -- 
>>> 2.34.1
>>>
>>
>> -- 
>> With best wishes
>> Dmitry
> 

