Return-Path: <linux-arm-msm+bounces-66363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B82BB0FC46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 23:46:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C419818918E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 21:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BDDC1C1AAA;
	Wed, 23 Jul 2025 21:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IoZGisDV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CF94A2D
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 21:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753307208; cv=none; b=r1ddfWkZtsIlNN1XUU3AvLU51cjqinV+fNNtkjWwGWCZb234BnsXQE9FQ2zUJVcRJXU/YcGsgSqev8ZJXKSt6cJakGQzDuUNNrkNUh6amQXtfef/oMtANIlZEi2tEtpTxBob1oFxaVhqG3ZulavgX4jsFT26zC+j5qd2inwZvfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753307208; c=relaxed/simple;
	bh=i5RS2oswlin9WqfB1WhvdIdXj3qEanY6nAP/Uhj0hAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=boR1IXWSscmZ26xR/aNRxn/KAkVD+pFIK/Vh8iZVRl7182fa9vVmXpb30jUUzNUJ4K30JgdK27Ad4Ax/Ge/i86bMQI+HRXz81bh9bvH26OTTpzB06Z0WRSrSUW0kpKFUgxWe7xILFQlapJ3GhjI3WlfS1l9HxN+5I2jnk/sovR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IoZGisDV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NH2N3l008047
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 21:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tvauJF9+c6IKxzBGTcvA8iSaaoeAgCJyCD9Tgwx44f0=; b=IoZGisDVCuegZMFt
	/m/Q4EEsuKHnnCOd7eju/TXpfgxGb5IOhqc27QPCdVKs94ZKD8bIem3LfsZI+E52
	JotkVof08ygoTKIbTWh+vcogoJww7Gkk4LXwJaU6YwIzUYrwQ/aop30OxPWmoAx9
	aza2USyuTvfNUJtwEtTnL+Ofjbq9B5AVVQ3KZi0jMyA+YA0VQW6dbvAUnpggMjmt
	CWFlf+Rimaj5KkGhSKvr3qfGA7JTVW5IpAJmBJt09cos2ADWMDObwoDc3YSRpD2j
	86tkgt3JYPesJ9JrXH4T2Tnmw/xwKVbcOmJoU0BKcRyUcHPVV36lSSSFz/eRuF1E
	F3cqfw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qem97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 21:46:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2369dd58602so2511155ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 14:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753307204; x=1753912004;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tvauJF9+c6IKxzBGTcvA8iSaaoeAgCJyCD9Tgwx44f0=;
        b=lvVrIpXMuSpKkdCyj2E5ePskl8jqpAvWwMrezX7LgYdEDUDvec1E+K9CU+xxQqrCCd
         VPOSqxX4e/MRcTiYNBiKgpcMb8s580tsnyeNEaOkxjCWwRG0GGkgBedYA9AhzeA5FSnW
         KpoVpwHBMv0Ews3Ui639HdJRjiCbjPJZ36cgOI+PW8F9GmoRFy42fzwRJlJkkHCKVAA+
         cyqfE0XmN2+p/abvmouOrbGTEmju89SReyYwQwIUZZwQcE3h2xKUsw3cKjx8u+PZ0+gW
         gtG+6xLC38S6FbrGdGWEJ/zDl4yWd5h2tyMXz8WgWB3ZIsHM1VCCUaw0Nt2CWbppBCp2
         VAsw==
X-Forwarded-Encrypted: i=1; AJvYcCUOMVnvGljmlrrSZ9qG0eHRFFW6hmsAfV/3aPm4edyc6Hg4tiAwMkF4Gh1739msSV14eTH0pBiQMtD5Vbk1@vger.kernel.org
X-Gm-Message-State: AOJu0YwlhCpCY19RnMLG5FeVgKAYuDCqRrJQOgD3PSrTftz084vQNdlA
	xUub4Qbh+i9QeYNTWD9P9xx4VFgwRjt35/3hFdFnDsdw7tEWWAoYP0qvwXwXMmgpt9YEcngC5AU
	8Okydhuw/xucF9YJwHoEavM1bkGtKcK07iEwV6ogKBbhCZ+WMiX8lGq/ORyp0ra8lJtyg
X-Gm-Gg: ASbGncsuCRNEwzUY9wonMKidSZcNxX4JtY+FygMU3+fbQgA82ONNf9EFKwrAT/nlj/F
	9Hs/+JDyche6TMfGb6Inw2f8vzbnIAEpNYoUUCeFDMFbYojAEBYGdgx8I6cQ7a8VvUKbZ1rK9WN
	r2e29RIkNJWCMuPnK8j1yS5Dy3Ixt4HONMzDoIqXhDekTF29c9pdzrzFOzGiBcbfmD07pkewW3t
	ppivGy2KUyDU9clTvSMzzIwB9obWXz3g/l3k/XYEb/A3sWPhDuxd0tw0lxVPGIYPED+z+0xFxxD
	WO9cO7oQKRf1s51SXcAdSl+RosBus6qnlFK3Nlyz/bqgRVzaYZjemIl/aR0rcw==
X-Received: by 2002:a17:903:1b48:b0:234:a734:4ab1 with SMTP id d9443c01a7336-23f981404c6mr59177285ad.3.1753307203846;
        Wed, 23 Jul 2025 14:46:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEifem4DTzHzvzmHJWifbcs4RdVeOJnOTJq0luVnu1W3g+TYFyHU5if7/jQbz053j1WkSaKAw==
X-Received: by 2002:a17:903:1b48:b0:234:a734:4ab1 with SMTP id d9443c01a7336-23f981404c6mr59176895ad.3.1753307203346;
        Wed, 23 Jul 2025 14:46:43 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48dc18fsm198195ad.133.2025.07.23.14.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 14:46:43 -0700 (PDT)
Message-ID: <820f45f1-9494-48eb-b536-7a8124de06f0@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 03:16:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] drm/msm: Skip devfreq IDLE when possible
To: rob.clark@oss.qualcomm.com
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-12-9347aa5bcbd6@oss.qualcomm.com>
 <vng6tut4sv3zfbwogsb74omqsbqutpeskqdnezbs4ftsanqyb4@nv35r7mqmcva>
 <CACSVV01EhWWohUDQ8n=FQeDuaDcgmYnMBJDMJ8D1Gist1NR4QQ@mail.gmail.com>
 <800f8c9d-5586-46a7-aa83-dfb3b97633e0@oss.qualcomm.com>
 <CACSVV00d4rbNDOLVZJTBNRmUsGyY6Tkwzv0cHRomeYyMXWHZVA@mail.gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACSVV00d4rbNDOLVZJTBNRmUsGyY6Tkwzv0cHRomeYyMXWHZVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE4NiBTYWx0ZWRfX+uAx+5aA4vGj
 uwDaxZCIVMjENWJR1gCAT6XGdz9pJo0jc64shGouBJhMST3U+WuRyDdEatuuCo21oWg8nIXcMoQ
 zAF61seW0r23wZIqx1hNtgDKsrBR5oGYCx0d/EwI5s+OSIz2jH3qryceBbp17uuMpfc2vxk1aak
 PV8KutneP9AUXgaStu+JNGhIpAau6taqOg3NEP4s4ubbNgsSsKJ5DHTurs04cdcPTbjEbySYb0R
 kdUXmHIGQb5+YW6w1iErj4RREBqJ9vs9RkVr1UIfDypn5M7okvUvS2oS8P9n4Xg5m0qhk+4OFby
 297u69ol3hgebevkhwdq3/nbMSRbRSzmLpOHd03sqXlvqZEtBeojZiiWdmrup5u+AnWyrO1F3qy
 aUTpFjcO7V5fptc8Vb4lqjaDKug5Ab25lkjVwu6zs9d0KOqIQGTaqiAbxsE5sf+sTJPLfj2g
X-Proofpoint-ORIG-GUID: Ohb6buQT4V3umRQPWq3fECtiQ_aMY-3V
X-Proofpoint-GUID: Ohb6buQT4V3umRQPWq3fECtiQ_aMY-3V
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=68815845 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=pSIa2sKh8ADkebnh61Ypzg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=XTD9XnCZvQp0TTkZ5uwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230186

On 7/23/2025 1:43 AM, Rob Clark wrote:
> On Tue, Jul 22, 2025 at 12:23 PM Akhil P Oommen
> <akhilpo@oss.qualcomm.com> wrote:
>>
>> On 7/22/2025 9:08 PM, Rob Clark wrote:
>>> On Tue, Jul 22, 2025 at 6:50 AM Dmitry Baryshkov
>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>>
>>>> On Sun, Jul 20, 2025 at 05:46:13PM +0530, Akhil P Oommen wrote:
>>>>> When IFPC is supported, devfreq idling is redundant and adds
>>>>> unnecessary pm suspend/wake latency. So skip it when IFPC is
>>>>> supported.
>>>>
>>>> With this in place we have a dummy devfreq instance which does nothing.
>>>> Wouldn't it be better to skip registering devfreq if IFPC is supported
>>>> on the platform?
>>>
>>> devfreq is still scaling the freq.  What is being bypassed is
>>> essentially a CPU based version of IFPC (because on sc7180 we didn't
>>> have IFPC
>>>
>>> Currently only a618 and 7c3 enable gpu_clamp_to_idle.. if at some
>>> point those grew IFPC support we could remove the trickery to drop GPU
>>> to min freq when it is idle altogether.
>>
>> There are 2 functionalities here:
>> 1. Clamp-to-idle: enabled only on a618/7c3
>> 2. boost-after-idle: Enabled for all GPUs.
>>
>> With this patch, we are skipping both when IFPC is supported. In the
>> absence of latency due to clamp-to-idle, do you think a618 (relatively
>> weaker GPU) would require boost-after-idle to keep with the
>> UI/composition workload for its typical configuration (1080p@60hz)? If
>> yes, I should probably create a quirk to disable boost-after-idle for
>> premium tier GPUs, instead of tying it to IFPC feature.
> 
> Hmm, yeah.. I suppose _this_ patch should only skip clamp-to-idle.  It
> is a different topic, boost-after-idle.

I think we can just drop this patch. Also, Boost-after-idle is not super
bad as it is only doubling the gpu freq. We can try to optimize it
separately.

-Akhil.

> 
> BR,
> -R
> 
>> -Akhil.
>>
>>>
>>> BR,
>>> -R
>>>
>>>>>
>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>> ---
>>>>>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 6 ++++++
>>>>>  1 file changed, 6 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
>>>>> index 2e1d5c3432728cde15d91f69da22bb915588fe86..53ef2add5047e7d6b6371af949cab36ce8409372 100644
>>>>> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
>>>>> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
>>>>> @@ -4,6 +4,7 @@
>>>>>   * Author: Rob Clark <robdclark@gmail.com>
>>>>>   */
>>>>>
>>>>> +#include "adreno/adreno_gpu.h"
>>>>>  #include "msm_gpu.h"
>>>>>  #include "msm_gpu_trace.h"
>>>>>
>>>>> @@ -300,6 +301,8 @@ void msm_devfreq_active(struct msm_gpu *gpu)
>>>>>       if (!has_devfreq(gpu))
>>>>>               return;
>>>>>
>>>>> +     if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
>>>>> +             return;
>>>>>       /*
>>>>>        * Cancel any pending transition to idle frequency:
>>>>>        */
>>>>> @@ -370,6 +373,9 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
>>>>>       if (!has_devfreq(gpu))
>>>>>               return;
>>>>>
>>>>> +     if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
>>>>> +             return;
>>>>> +
>>>>>       msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
>>>>>                              HRTIMER_MODE_REL);
>>>>>  }
>>>>>
>>>>> --
>>>>> 2.50.1
>>>>>
>>>>
>>>> --
>>>> With best wishes
>>>> Dmitry
>>


