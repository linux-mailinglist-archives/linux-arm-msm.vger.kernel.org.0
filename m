Return-Path: <linux-arm-msm+bounces-26385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F57093338A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 23:26:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 327351C220BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 21:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1694A770F5;
	Tue, 16 Jul 2024 21:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Jw3Bpk4r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C762AE6A;
	Tue, 16 Jul 2024 21:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721165168; cv=none; b=Cmbfr4cii794I+x60KSmiiIwA7Bt9nEpPBKWxQTSyZuR09mxjCNYYTZuCUuitDsOXxdnCGbvHJnXmqlJczLfm13+Vi4C5CrZGOuFlESYD9tz0eipNmE0yhim3tG2UR0Q+DM4dset5OrzqVWWDw2njYouPd+fFMotIrs1CYBsPXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721165168; c=relaxed/simple;
	bh=qSXKDj/E6KXWYc7coY4nH6LtAza9l3lpYuhCB3RxndU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=H35yFDDfTXEJ/UWcbI2NptiluviGBF7FSyhkuv4qDwKDuWakEx5mMulmTEnPDG0B/EQHNMKX85Je8sr1naL/egve9zkHm540WRdpcFkTL5dJkUcKOAFfNpzwrAIzxovr5shRWv/LOX/2N5ZI4lvafZ37dY1vllsnRWxvgGha+uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Jw3Bpk4r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46GHeu7Q025081;
	Tue, 16 Jul 2024 21:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	leQBczBp6BDwomra/9IMX++GEiqamSE1x+UX2ngRveg=; b=Jw3Bpk4rpbkKA3Mr
	HVeeHu/hIn18qPGSj9ckUUfr8+SJIzl4Vu/dgLKqPMzuR2WFOBPm6h0+3wGFjxL9
	ilxlPy+BbiD0HlKYm5PLb9xsuZyfFmT8eIdygbJ/DA/tqnD7Y9NN/fnzScTfa/Tm
	w9oC846WH35mqJE7B7I1cuMRr0Ucned1FkEv23+Asz+nJPRDPoHLcsddJAmY6x7h
	5Nww9UYJvan48gWGpQ55OyLv2EVnSsDgzC3X6JX/3FIu+25jU0RTk72vUECjOkm9
	mcjkqI+yGUhNZvJ0h0F0w0q6VQaPumTVoPCzjmcykioClntEXOjlTj5kN8L7we6x
	5RgG9w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfpge1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 21:25:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46GLPtWB016846
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 21:25:55 GMT
Received: from [10.71.110.34] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 16 Jul
 2024 14:25:54 -0700
Message-ID: <96d26519-5879-4ae7-a8f3-ebdc4f3ade3e@quicinc.com>
Date: Tue, 16 Jul 2024 14:25:54 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/msm/dpu: rate limit snapshot capture for mmu
 faults
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        "Sean
 Paul" <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
        <swboyd@chromium.org>, <dianders@chromium.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240628214848.4075651-1-quic_abhinavk@quicinc.com>
 <20240628214848.4075651-6-quic_abhinavk@quicinc.com>
 <5isw7c5kkef4kql4qcous3gmwhvgwc53ntgjm4staymqr67ktm@iw3cr2gr2iko>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <5isw7c5kkef4kql4qcous3gmwhvgwc53ntgjm4staymqr67ktm@iw3cr2gr2iko>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4-fjC3Wps4it5BJvRwkdzkbAJkrkM6IJ
X-Proofpoint-GUID: 4-fjC3Wps4it5BJvRwkdzkbAJkrkM6IJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-16_01,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407160157



On 7/1/2024 12:43 PM, Dmitry Baryshkov wrote:
> On Fri, Jun 28, 2024 at 02:48:47PM GMT, Abhinav Kumar wrote:
>> There is no recovery mechanism in place yet to recover from mmu
>> faults for DPU. We can only prevent the faults by making sure there
>> is no misconfiguration.
>>
>> Rate-limit the snapshot capture for mmu faults to once per
>> msm_kms_init_aspace() as that should be sufficient to capture
>> the snapshot for debugging otherwise there will be a lot of
>> dpu snapshots getting captured for the same fault which is
>> redundant and also might affect capturing even one snapshot
>> accurately.
> 
> Please squash this into the first patch. There is no need to add code
> with a known defficiency.
> 

Sure, will squash it.

> Also, is there a reason why you haven't used <linux/ratelimit.h> ?
> 

There is really no interval I can conclude on which is safe here. In 
fact rate-limit is probably not the right terminology here.

I should probably just rename this to once per init_aspace() which is 
essentially once per bootup.

I couldnt come up with a better limiter because ideally if we had a 
recovery we should reset the counter there.

Similar to other DPU errors like underrun and ping-pong timeouts (which 
capture the snapshot once per suspend/resume) , I just kept it to once 
per init_aspace().

smmu faults happen at a pretty rapid rate and capturing the full DPU 
snapshot each time was redundant. So I thought atleast once should be 
enough.

>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/msm_kms.c | 6 +++++-
>>   drivers/gpu/drm/msm/msm_kms.h | 3 +++
>>   2 files changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
>> index d5d3117259cf..90a333920c01 100644
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
> 
> When is it decremented?
> 

It is not because it will only increment once in a bootup, I can switch 
this to a bool since it will happen only once unless we conclude on a 
better way.

>> +	}
>>   
>>   	return -ENOSYS;
>>   }
>> @@ -208,6 +211,7 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
>>   		mmu->funcs->destroy(mmu);
>>   	}
>>   
>> +	kms->fault_snapshot_capture = 0;
>>   	msm_mmu_set_fault_handler(aspace->mmu, kms, msm_kms_fault_handler);
>>   
>>   	return aspace;
>> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
>> index 1e0c54de3716..240b39e60828 100644
>> --- a/drivers/gpu/drm/msm/msm_kms.h
>> +++ b/drivers/gpu/drm/msm/msm_kms.h
>> @@ -134,6 +134,9 @@ struct msm_kms {
>>   	int irq;
>>   	bool irq_requested;
>>   
>> +	/* rate limit the snapshot capture to once per attach */
>> +	int fault_snapshot_capture;
>> +
>>   	/* mapper-id used to request GEM buffer mapped for scanout: */
>>   	struct msm_gem_address_space *aspace;
>>   
>> -- 
>> 2.44.0
>>
> 

