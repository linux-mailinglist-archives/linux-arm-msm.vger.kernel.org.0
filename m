Return-Path: <linux-arm-msm+bounces-66153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5778EB0E410
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 21:23:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C7BCAA1063
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 19:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA51D284B4F;
	Tue, 22 Jul 2025 19:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P7LkkL52"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A1D283FDE
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 19:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753212200; cv=none; b=rEWpogcBNKMGAzy9eNpJnLSNgSOQFzLPYq0rNLl4z7Wx3mS2o/XB60ELbJmS1fjnDLd0OCY8XzK2gcHi8d29zAkrun/R4f4/AU4COTkQrPWAf+nRuG2Tnif54t57tTBDYlkvxp6DlkWDaxCKE+cPDaHqIQKmL2x8/4RvPEtOKNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753212200; c=relaxed/simple;
	bh=Pc+h1H+E8xxMtQSsFjUW0wc/6IGU/hjboocuEOxYosM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IbBXGU0/huaTaDtWztO6GpOZOZ4Nd7Ccx8k9C2BzvZlLtBVn4h8L5Ijs1AwryjW7ninqmINRYyVXxGkNYpjOxTo05vbn8goIItu0WJfWLE/WOxHcESI5Jx97CUQOwIbmMC1jRvdAGVjlmODbSy9BgZcB1E0yv+ZBKB1U27C9D44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P7LkkL52; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MFDfh9031374
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 19:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y6OxZtp9vvZax/Q2qqYgpUgRGF5sEqL1kmgDnxhJH5c=; b=P7LkkL52ERTbjHsM
	LLHB4s9DlE2TsSs+B4PA8dwpR6Yx4ivpDYflwu+p+Wk/49kTHe+bGho87QCGVty9
	8pmGkd8M3cx1kpOOQ9wHWb5ODpfmKg3DvTcuiyArX1fxU44wmQ4JuO/IKsnQm1fS
	RtSBvCpxvI5OvR1g/AWZvbTPpnOiKof6eaOg8FdXCDdb3PgPu367Sr6BytaTJkN/
	YpVannprLo7ORZ8TvRuOAlP0qgZfMUUMxTDc4Musv3kpV9oGcbgwpy0QOqKFqLex
	z762B31vkHmx03C3wN+HsXAkZtDbtuYxMGUCsDcTCgkW3+KAHH9atn7757kvhYk1
	40j9Vg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3hrq4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 19:23:17 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74927be2ec0so7295457b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 12:23:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753212196; x=1753816996;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y6OxZtp9vvZax/Q2qqYgpUgRGF5sEqL1kmgDnxhJH5c=;
        b=gXuNR2ltb08Wu1pkrkt5dz7Mm90YNKff5sJtBalF5NJgGZ/3b+iHwBa9fBV/stoBZ5
         PEvj20P2Wwjw1mHnlJJTXRjilTy/Pe5tdHj55MXtygYp224788HSZPUsXi65vrYbxbbM
         8IcZYb346k5MO39U2bLR4w9rzjd12dGnusm2z1b5nX9NoAKS+vnBHkuYJhMy4vlWYoP1
         /Jn+MI22YlXPGhRREGUE4QHwHfSXltC+b1jRng19jiBU4l4wJSoukNm2lOFy9RdK+XcG
         J+ErXHH8nM34PkcEaOs9qrDhfPsQEoKrQVXii1IZ9vjb3I0oUGKvTY3x37tOv/nQhOSJ
         nwqg==
X-Forwarded-Encrypted: i=1; AJvYcCXuQTLmE/09bt9CR3LU5RHpQEuWw7PgUxmiiZ/gjRVaTQIRIrB2EOnzJCfR2Z1uVAkk6ev2qMLYc8xBr7Iy@vger.kernel.org
X-Gm-Message-State: AOJu0YzjW/9oOcnF+SeL6Rqh7LJQkv0XbzfmKNHMNG406CUrP9UN8Ae4
	aLID/bHH9AP5p3lhL+u2goLFM0dggMSMpzgDWmleE0L6D6+Ps6WnZsEjh/WUQH0ONHLcZ1/Kf2/
	zaSr+OUHJvPWbr+hx/TqwnrmeYNUjf3oWx7GeAxY4v9pAIRk1wUoXRBv7WmZqXxUIY7G3
X-Gm-Gg: ASbGncuWEF2NusMqguMVuY5n5AxPIdE9Wj3cyq5fCg8Te2yu66SlCdcf+6wPAuU7mv0
	dnDAV2HYWE0zysQfWymo/AverN+rUvrGLuainbPVYGW9cX53OFrU+8yKAvnz5qSMoR3mnkm0Gdh
	+iWOAl2K2zFHPVjl3ifAUKuMWzrR9dDKbbxh5NVA49Y21zvWXkPlLiiDEqZ0YuVFLyzsjbLWsOe
	7YZmDF1HSeyp5PDgDL9v3pLHXNqP5ZoE4YT13kpQ0mieNDP0Cdb/gUJmddyKkkfCfVFAlycnyjc
	DdZaRqHBWlJzqrOx9PV3l3FDA1+Z+FGufrnJLXhKHvsCu4POABivSQII3gxuAzJ6
X-Received: by 2002:a05:6a00:1909:b0:736:5b85:a911 with SMTP id d2e1a72fcca58-76034c4da07mr691859b3a.8.1753212196498;
        Tue, 22 Jul 2025 12:23:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZto37mgHShkAsmIcFVd1Yhzk4xGY6Lskz4Tb57kthENKf/xIJ68iAYMK1aJLYGAgBaOdIuA==
X-Received: by 2002:a05:6a00:1909:b0:736:5b85:a911 with SMTP id d2e1a72fcca58-76034c4da07mr691818b3a.8.1753212195961;
        Tue, 22 Jul 2025 12:23:15 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb1569f5sm8187912b3a.80.2025.07.22.12.23.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 12:23:15 -0700 (PDT)
Message-ID: <800f8c9d-5586-46a7-aa83-dfb3b97633e0@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 00:53:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] drm/msm: Skip devfreq IDLE when possible
To: rob.clark@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
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
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACSVV01EhWWohUDQ8n=FQeDuaDcgmYnMBJDMJ8D1Gist1NR4QQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=687fe525 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=blXxefCSwbONkpe3GJMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE2NiBTYWx0ZWRfXzPrufet/JM48
 YCeBjfnczhK62VtV53tCbBt1OPuQkT5yJDBbE1RkyUKmWG+8JLAq1685Yrix06mhzvHs3yV+u5T
 vlo9ZXrAa/wmlhUlioGqwiPFO3if+VOK85LyxLmGbONFLaM098ZkOaAz+8rktpo2bb6sC72Eawb
 y4B4bMklCSzXEjBKTMDZ8F95htZUBNjSN96R+83XZ0sxEY7UJlD6dQZ7ZiaHVEbNXvwMmtmd8fi
 RUZ17k/Q1JU+zUTigpGYfehziKYmgL0mpa3Lsr53xRxieUAlQWBIIUGzRJtn34sstgONVw3/gmp
 9zuoQ1hMUNdbY7ls5RblwHaVZYL0M7bE0KVpiInF0nmF/vY8YW31aEK7vhyyXhx3tIErxHNf/64
 MXJ3pFZHYtbsHhFlhaUVHkifBTZuatozsG5QGpHQrgDxNB+LWb+SGdQRT0yUKJ5iB1MT1x49
X-Proofpoint-GUID: __fibJ_9K8jo1uuz9eHZ5SNPVvllDj2n
X-Proofpoint-ORIG-GUID: __fibJ_9K8jo1uuz9eHZ5SNPVvllDj2n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220166

On 7/22/2025 9:08 PM, Rob Clark wrote:
> On Tue, Jul 22, 2025 at 6:50 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Sun, Jul 20, 2025 at 05:46:13PM +0530, Akhil P Oommen wrote:
>>> When IFPC is supported, devfreq idling is redundant and adds
>>> unnecessary pm suspend/wake latency. So skip it when IFPC is
>>> supported.
>>
>> With this in place we have a dummy devfreq instance which does nothing.
>> Wouldn't it be better to skip registering devfreq if IFPC is supported
>> on the platform?
> 
> devfreq is still scaling the freq.  What is being bypassed is
> essentially a CPU based version of IFPC (because on sc7180 we didn't
> have IFPC
> 
> Currently only a618 and 7c3 enable gpu_clamp_to_idle.. if at some
> point those grew IFPC support we could remove the trickery to drop GPU
> to min freq when it is idle altogether.

There are 2 functionalities here:
1. Clamp-to-idle: enabled only on a618/7c3
2. boost-after-idle: Enabled for all GPUs.

With this patch, we are skipping both when IFPC is supported. In the
absence of latency due to clamp-to-idle, do you think a618 (relatively
weaker GPU) would require boost-after-idle to keep with the
UI/composition workload for its typical configuration (1080p@60hz)? If
yes, I should probably create a quirk to disable boost-after-idle for
premium tier GPUs, instead of tying it to IFPC feature.

-Akhil.

> 
> BR,
> -R
> 
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
>>> index 2e1d5c3432728cde15d91f69da22bb915588fe86..53ef2add5047e7d6b6371af949cab36ce8409372 100644
>>> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
>>> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
>>> @@ -4,6 +4,7 @@
>>>   * Author: Rob Clark <robdclark@gmail.com>
>>>   */
>>>
>>> +#include "adreno/adreno_gpu.h"
>>>  #include "msm_gpu.h"
>>>  #include "msm_gpu_trace.h"
>>>
>>> @@ -300,6 +301,8 @@ void msm_devfreq_active(struct msm_gpu *gpu)
>>>       if (!has_devfreq(gpu))
>>>               return;
>>>
>>> +     if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
>>> +             return;
>>>       /*
>>>        * Cancel any pending transition to idle frequency:
>>>        */
>>> @@ -370,6 +373,9 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
>>>       if (!has_devfreq(gpu))
>>>               return;
>>>
>>> +     if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
>>> +             return;
>>> +
>>>       msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
>>>                              HRTIMER_MODE_REL);
>>>  }
>>>
>>> --
>>> 2.50.1
>>>
>>
>> --
>> With best wishes
>> Dmitry


