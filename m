Return-Path: <linux-arm-msm+bounces-42701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EE49F6F80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 22:34:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19F4B18938E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 21:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220A21ACEA9;
	Wed, 18 Dec 2024 21:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FdBRP8h+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BFE15C120;
	Wed, 18 Dec 2024 21:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734557664; cv=none; b=DtHulJk+wDI+4httGn1+amaWlgdH3AivDveKKJgLOMqkFbipPz2feQLfJKKZBN7Yw62JO3I9jUxACqKj//dSQGNRJ7DxzVcYVVB7i8HQDStP/kfZe7YDbi5TIDEdeTnyk2N7y3MCKkwg9GQ5MVCq8lDQNLWNreMe/uFZSzAsu4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734557664; c=relaxed/simple;
	bh=j8WE3iJ6pi6J0zMsKPpVVPgpIDw9zFrhtXjKQbBU9qs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LnYVFBmSerX12oJ0c7OuZN7cHWlRJzEsG79oCFis0mcLiMjX0RP1TwI6Y/KDAVQnL2SbjXaUdPLCUMY5sb308MjQZK70I/l3R6J70XDr02y2LQai2O3dsYUQycT7JecZDkLV2m/TYGLl9AD31ox1I0DorZflK9/APsQKVZEk4C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FdBRP8h+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIGQtKv023946;
	Wed, 18 Dec 2024 21:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x7h51NnDJyUD/OUOZyQAzkX/KpLa4aFP230owX2e5Uw=; b=FdBRP8h+9GccklAZ
	4CbHZsI+vBsxceOM5Kw1Tr5nuUz+gcgqRjiK/L/om9OeqoQniVopXa0kZBcNe2Pf
	Haw7lqxncLhyNpHfqh7xSVHfoiTTM51VNNhtGwQ+X++vXTdQef6KFPy2zD+6HGn8
	bA7VeYuA01rG39wGzVIIzizgv8bT8D4M4TYooDFhoJPGXWnVH7tGth41Wh0v882A
	gRe5szdGNBp/jypuyfChjz9lzLuNHlxSHUnqztMXyxOaeQqv8ZRnzgPPfMZyMI/3
	zXB6EZH6SA6Lmq22azJLK9vZANA1uZErhi1gcca3i7h+lHrUQ0Q95hHM1szRwI8x
	FctTGQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43m01gh21d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 21:34:14 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BILYDKi006323
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 21:34:13 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Dec
 2024 13:34:13 -0800
Message-ID: <dbe94c6b-e981-4f40-9261-2e44b5fb73cc@quicinc.com>
Date: Wed, 18 Dec 2024 13:33:59 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] drm/msm/dpu: rate limit snapshot capture for mmu
 faults
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
References: <20241217-abhinavk-smmu-fault-handler-v2-0-451377666cad@quicinc.com>
 <20241217-abhinavk-smmu-fault-handler-v2-5-451377666cad@quicinc.com>
 <mbtwyyfryvltkeicgmrzrfas3u35ocathehswi4rme5tbs6r37@plcl6gzpl2ld>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <mbtwyyfryvltkeicgmrzrfas3u35ocathehswi4rme5tbs6r37@plcl6gzpl2ld>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7y6KQiIizqm9XtIm61CgaacJPrY4NkYX
X-Proofpoint-ORIG-GUID: 7y6KQiIizqm9XtIm61CgaacJPrY4NkYX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180168



On 12/18/2024 3:20 AM, Dmitry Baryshkov wrote:
> On Tue, Dec 17, 2024 at 04:27:57PM -0800, Jessica Zhang wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> There is no recovery mechanism in place yet to recover from mmu
>> faults for DPU. We can only prevent the faults by making sure there
>> is no misconfiguration.
>>
>> Rate-limit the snapshot capture for mmu faults to once per
>> msm_atomic_commit_tail() as that should be sufficient to capture
>> the snapshot for debugging otherwise there will be a lot of DPU
>> snapshots getting captured for the same fault which is redundant
>> and also might affect capturing even one snapshot accurately.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/msm_atomic.c | 2 ++
>>   drivers/gpu/drm/msm/msm_kms.c    | 5 ++++-
>>   drivers/gpu/drm/msm/msm_kms.h    | 3 +++
>>   3 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
>> index 9c45d641b5212c11078ab38c13a519663d85e10a..9ad7eeb14d4336abd9d8a8eb1382bdddce80508a 100644
>> --- a/drivers/gpu/drm/msm/msm_atomic.c
>> +++ b/drivers/gpu/drm/msm/msm_atomic.c
>> @@ -228,6 +228,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>>   	if (kms->funcs->prepare_commit)
>>   		kms->funcs->prepare_commit(kms, state);
>>   
>> +	kms->fault_snapshot_capture = 0;
>> +
> 
> - Please move it before the prepare_commit().
> - You are accessing the same variable from different threads / cores.
>    There should be some kind of a sync barrier.

Hi Dmitry,

Ack, will add a lock for the snapshot capture counter.

Thanks,

Jessica Zhang

> 
>>   	/*
>>   	 * Push atomic updates down to hardware:
>>   	 */
>> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
>> index 78830e446355f77154fa21a5d107635bc88ba3ed..3327caf396d4fc905dc127f09515559c12666dc8 100644
>> --- a/drivers/gpu/drm/msm/msm_kms.c
>> +++ b/drivers/gpu/drm/msm/msm_kms.c
>> @@ -168,7 +168,10 @@ static int msm_kms_fault_handler(void *arg, unsigned long iova, int flags, void
>>   {
>>   	struct msm_kms *kms = arg;
>>   
>> -	msm_disp_snapshot_state(kms->dev);
>> +	if (!kms->fault_snapshot_capture) {
>> +		msm_disp_snapshot_state(kms->dev);
>> +		kms->fault_snapshot_capture++;
>> +	}
>>   
>>   	return -ENOSYS;
>>   }
>> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
>> index e60162744c669773b6e5aef824a173647626ab4e..3ac089e26e14b824567f3cd2c62f82a1b9ea9878 100644
>> --- a/drivers/gpu/drm/msm/msm_kms.h
>> +++ b/drivers/gpu/drm/msm/msm_kms.h
>> @@ -128,6 +128,9 @@ struct msm_kms {
>>   	int irq;
>>   	bool irq_requested;
>>   
>> +	/* rate limit the snapshot capture to once per attach */
>> +	int fault_snapshot_capture;
>> +
>>   	/* mapper-id used to request GEM buffer mapped for scanout: */
>>   	struct msm_gem_address_space *aspace;
>>   
>>
>> -- 
>> 2.34.1
>>
> 
> -- 
> With best wishes
> Dmitry


