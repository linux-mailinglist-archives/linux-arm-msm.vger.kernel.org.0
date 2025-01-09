Return-Path: <linux-arm-msm+bounces-44498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB56A06BED
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 04:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E578F166AEB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 03:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5EF713C9C4;
	Thu,  9 Jan 2025 03:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lz7ThIw5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F126513C809;
	Thu,  9 Jan 2025 03:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736392502; cv=none; b=SHs4pwnHd9drzKPbWQm+9FuHPyXpaP2Kcvy/sIjXeiJCaSN9yCOuH2KmPB4j4MpRinQUFXdg1pKTxtCO5sbIuYygdIDR75JAunqoqVzlmVrHwUMqopndt5PhBnWf28R9oVCX7fykvgXQFP6OdiC4Q+vHYsyOLaSPn4UOGfRiCZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736392502; c=relaxed/simple;
	bh=l/yI/iYTq4gHNsqwnxBpKClAQkzGRQU1SpOFx/6WQu4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=T0ZEHx3G/hQ3LxhMzKVUGW/BPN9OQmXTRueuXefXiBZ+8a02xs/7t9HcGzd8vsy3k3TM9a6o57n1Sx2bBCl+qqU+PmzR06/R7b7IwL7kZlSQMxWElwS2DJ66BOxhpmi4seMSeWB/2dTyZZOJAimlQsw05LzdZ8JzyZ4cpvDFOP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lz7ThIw5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508HMX9t014713;
	Thu, 9 Jan 2025 03:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YDF8yC5Gz8JMSRbuouAB/ciFth/iDl56jlffkxqQYu4=; b=lz7ThIw5QitpAz/7
	TIEEueEKeMKZ79rP+6QiXH4E8jTddJJucJHyz/IN4k98PSlhLHN/stXtxWCfAGrn
	zzmOhDxEalyJdwBOhTl9zw1DWeL3sv0ddO44IiQ11iQKXW68KvHeRxFgY1x/Kk0p
	YuhaBwgpJm6IApqX6aK9WgK+3UwcYN5QDL5nI7u3q9SDORB0P/mYMC0PErlqFudn
	WxhjBWS/qxCeBTsD47O+pZRLcRlta1TYNOxP8oBZVb+ve620PBAGEgyWKGwFcQMC
	PU0nN6rT9HeXQRXuo40be2vLmf7yxYnYH7+iMjzSQclJgahwMk3/OW4Ygi8/aZaH
	PvdeVw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441wq516sg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 03:14:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5093ErNI022120
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 03:14:53 GMT
Received: from [10.71.108.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 19:14:52 -0800
Message-ID: <f9863c54-ca35-476b-b6aa-0eb1c18ec29e@quicinc.com>
Date: Wed, 8 Jan 2025 19:14:51 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Force disabling commits to take non-async
 path
To: Rob Clark <robdclark@gmail.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jessica Zhang
	<quic_jesszhan@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
References: <20250108-async-disable-fix-v1-1-3f93eb600a3a@quicinc.com>
 <CAF6AEGtksLq5jpizGMj4t248rbNScgDvrxpxv09==b3DmpkLuQ@mail.gmail.com>
 <CAA8EJpqPZc7DNOb6WcRVtH0cFs9mUziL-dPgyakEJGO73=B6gA@mail.gmail.com>
 <58d9c139-c811-47aa-a527-4b1af110337c@quicinc.com>
 <CAF6AEGuFTW4hVursv-EKQ7GfVuUDJ4C0qWS0F+j1jPi+mP_xnA@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAF6AEGuFTW4hVursv-EKQ7GfVuUDJ4C0qWS0F+j1jPi+mP_xnA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YvBEMB-Dr7KUtfOies26vyrDkBUR19-E
X-Proofpoint-ORIG-GUID: YvBEMB-Dr7KUtfOies26vyrDkBUR19-E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501090023



On 1/8/2025 7:04 PM, Rob Clark wrote:
> On Wed, Jan 8, 2025 at 6:22 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 1/8/2025 6:14 PM, Dmitry Baryshkov wrote:
>>> On Thu, 9 Jan 2025 at 03:45, Rob Clark <robdclark@gmail.com> wrote:
>>>>
>>>> On Wed, Jan 8, 2025 at 2:58 PM Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>>>>
>>>>> Force commit that are disabling a plane in the async_crtc to take the
>>>>> non-async commit tail path.
>>>>>
>>>>> In cases where there are two consecutive async cursor updates (one
>>>>> regular non-NULL update followed by a disabling NULL FB update), it is
>>>>> possible for the second NULL update to not be queued (due to the
>>>>> pending_crtc_mask check) or otherwise not be run before the cursor FB is
>>>>> deallocated by drm_atomic_helper_cleanup_planes(). This would cause a
>>>>> context fault since the hardware would try to fetch the old plane state
>>>>> with the stale FB address.
>>>>>
>>>>> Avoid this issue by forcing cursor updates that will disable the cursor
>>>>> plane to be blocking commits. This will ensure that hardware clears and
>>>>> stops fetching the FB source address before the driver deallocates the FB
>>>>>
>>>>> Fixes: 2d99ced787e3 ("drm/msm: async commit support")
>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>> ---
>>>>>    drivers/gpu/drm/msm/msm_atomic.c | 13 +++++++++++++
>>>>>    1 file changed, 13 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
>>>>> index 9c45d641b5212c11078ab38c13a519663d85e10a..ddc74c68148c643d34ca631dd28d4cdc2b8c7dc0 100644
>>>>> --- a/drivers/gpu/drm/msm/msm_atomic.c
>>>>> +++ b/drivers/gpu/drm/msm/msm_atomic.c
>>>>> @@ -142,6 +142,7 @@ static bool can_do_async(struct drm_atomic_state *state,
>>>>>           struct drm_connector_state *connector_state;
>>>>>           struct drm_connector *connector;
>>>>>           struct drm_crtc_state *crtc_state;
>>>>> +       struct drm_plane_state *plane_state;
>>>>>           struct drm_crtc *crtc;
>>>>>           int i, num_crtcs = 0;
>>>>>
>>>>> @@ -162,6 +163,18 @@ static bool can_do_async(struct drm_atomic_state *state,
>>>>>                   *async_crtc = crtc;
>>>>>           }
>>>>>
>>>>> +       /*
>>>>> +        * Force a blocking commit if the cursor is being disabled. This is to
>>>>> +        * ensure that the registers are cleared and hardware doesn't try to
>>>>> +        * fetch from a stale address.
>>>>> +        */
>>>>> +       if (*async_crtc) {
>>>>> +               plane_state = drm_atomic_get_new_plane_state(state,
>>>>> +                                                            (*async_crtc)->cursor);
>>>>> +               if (plane_state && !plane_state->fb)
>>>>> +                       return false;
>>>>
>>>> hmm, I suppose we want the same even if the fb changes?  Or
>>>> alternatively somewhere hold an extra ref to the backing obj until hw
>>>> has finished scanout?
>>>
>>
>> Hi Rob
>>
>> Do you mean we need to also check if old_plane_state->fb !=
>> new_plane_state->fb, then use blocking commit?
> 
> yeah, basically.. if we release any outgoing fb the backing bo could
> be potentially freed+unmapped leading to the same problem.
> 

Yeah true, this case also we can hit this. Will add it and check.

> idk if this more conservative approach would cause fps issues..
> holding an extra ref would avoid potential issues, but offhand I'm not
> sure if it would be a perf problem in practice.  Maybe with animated
> cursors?
> 

hmmm.... we did not see any significant lags or drops when we tested 
this (that was also our major concern to make sure we dont)

If we do have to hold an extra ref, we will have to do something like below:

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 098abc2c0003..97d9e056038c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -649,8 +649,10 @@ static int dpu_plane_prepare_fb(struct drm_plane 
*plane,
         struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
         int ret;

-       if (!new_state->fb)
+       if (!new_state->fb) {
+               refcount_inc(&msm_fb->dirtyfb);
                 return 0;
+       }

         DPU_DEBUG_PLANE(pdpu, "FB[%u]\n", fb->base.id);

@@ -682,8 +684,10 @@ static void dpu_plane_cleanup_fb(struct drm_plane 
*plane,
         struct dpu_plane *pdpu = to_dpu_plane(plane);
         struct dpu_plane_state *old_pstate;

-       if (!old_state || !old_state->fb)
+       if (!old_state || !old_state->fb) {
+               refcount_dec(&msm_fb->dirtyfb);
                 return;
+       }

         old_pstate = to_dpu_plane_state(old_state);

I dont know if this is clean though. WDYT?


> BR,
> -R
> 
>> We can try that out.
>>
>> holding extra ref gets tricky IMO. In this way, the calls are balanced
>> in places we know.
>>
>>> I think a more correct approach would be to run a worker, waiting for
>>> the commit to happen and then freeing the FBs.
>>>
>>
>> Hi Dmitry
>>
>> This option was tried . It gets very messy to handle it this way. Then
>> we realized that, the worker is going to try to do the same thing a
>> blocking commit does which is to wait for hw to finish scanout and then
>> cleanup planes. Hence this was preferred and is better IMO.
>>
>>>>
>>>> BR,
>>>> -R
>>>>
>>>>> +       }
>>>>> +
>>>>>           return true;
>>>>>    }
>>>>>
>>>>>
>>>>> ---
>>>>> base-commit: 866e43b945bf98f8e807dfa45eca92f931f3a032
>>>>> change-id: 20250108-async-disable-fix-cc1b9a1d5b19
>>>>>
>>>>> Best regards,
>>>>> --
>>>>> Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>>
>>>
>>>
>>>

