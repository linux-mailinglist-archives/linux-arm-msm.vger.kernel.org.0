Return-Path: <linux-arm-msm+bounces-44494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BBFA06ADA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 03:22:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A448162FBA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 02:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF9CBE5E;
	Thu,  9 Jan 2025 02:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ngV9TcfZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991B3291E;
	Thu,  9 Jan 2025 02:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736389340; cv=none; b=b8a4f/FJuQx5OOk7HELnqZNCMdvtYQXI8sSvnAGygOJuvVBJ8KSFXStPT7fl7Ykn6g5ztdIJNXxc1sikqZ0J4CpdcCxeVLpiw9qAXYn1W7wP1aXS9gqCpiFGTK3C2pvW+zcVavGs+rKYWHEWOaj9fpp8N6LAOjWHkOe15XwErwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736389340; c=relaxed/simple;
	bh=6mg/Cxyq1CAce8eIFoMGBeZnVgR2Q7EKooq9Huy2iGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cgK0Esu7iG8Sd0oWCwUCRIx+7FijrTpXX6e53HqpU0OZNogQlBvhEHJUwtOUnXlzggWdP3OH8XYUq4I13wVPGCBp3o6WWd2oxpnu6Ub3wsUPeU5Y2uWW27DrUfsIzCbKIKqS1RlDM0HJOuGYuIzxlii+x65C9e0sQin+T3ffzqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ngV9TcfZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509030pJ013366;
	Thu, 9 Jan 2025 02:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4zCck2ggZzYNdrCUC/XqgundnyfsHgGB5zVqD103ikU=; b=ngV9TcfZwjg4WpSf
	9WO61JFZ7oUSbKWB/rXuXeKFxUDgGIl9rBeN8hlfUUhKsG3DeBOLs4Q9nL2+T+Vp
	qzQk5eRV9Gs/vB7LZ9vaj69I09c8WqnUCwdsv+R5M85tEJIuMcVLFo2IvXwcTpMY
	/8uQgrP/C5Wvy+z2JmhIInx0jciEusj3EI9yjOdGP1MkCCu0w7Y9kyOCelQ4Ua7V
	k58+94IkD+SGDkTkBlLLWvtWAHcPNUVLBdOA20+bNKBJHZ9mI58dDRIVVG+YCza8
	XK8yB4Gn5MCzVe06aN2ti98IUt7Tzx4eBEG3FHOeqIXgqV8XRHFLbi40CTUMacBB
	5LRo1Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4423jsr81x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 02:22:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5092M9T5027302
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 02:22:09 GMT
Received: from [10.71.108.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 18:22:09 -0800
Message-ID: <58d9c139-c811-47aa-a527-4b1af110337c@quicinc.com>
Date: Wed, 8 Jan 2025 18:22:08 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Force disabling commits to take non-async
 path
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>
CC: Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark
	<robdclark@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
References: <20250108-async-disable-fix-v1-1-3f93eb600a3a@quicinc.com>
 <CAF6AEGtksLq5jpizGMj4t248rbNScgDvrxpxv09==b3DmpkLuQ@mail.gmail.com>
 <CAA8EJpqPZc7DNOb6WcRVtH0cFs9mUziL-dPgyakEJGO73=B6gA@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpqPZc7DNOb6WcRVtH0cFs9mUziL-dPgyakEJGO73=B6gA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uRPTSqgVl8mARDEfbqLUREtnvc1PKzFN
X-Proofpoint-ORIG-GUID: uRPTSqgVl8mARDEfbqLUREtnvc1PKzFN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090016



On 1/8/2025 6:14 PM, Dmitry Baryshkov wrote:
> On Thu, 9 Jan 2025 at 03:45, Rob Clark <robdclark@gmail.com> wrote:
>>
>> On Wed, Jan 8, 2025 at 2:58 PM Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>>
>>> Force commit that are disabling a plane in the async_crtc to take the
>>> non-async commit tail path.
>>>
>>> In cases where there are two consecutive async cursor updates (one
>>> regular non-NULL update followed by a disabling NULL FB update), it is
>>> possible for the second NULL update to not be queued (due to the
>>> pending_crtc_mask check) or otherwise not be run before the cursor FB is
>>> deallocated by drm_atomic_helper_cleanup_planes(). This would cause a
>>> context fault since the hardware would try to fetch the old plane state
>>> with the stale FB address.
>>>
>>> Avoid this issue by forcing cursor updates that will disable the cursor
>>> plane to be blocking commits. This will ensure that hardware clears and
>>> stops fetching the FB source address before the driver deallocates the FB
>>>
>>> Fixes: 2d99ced787e3 ("drm/msm: async commit support")
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/msm_atomic.c | 13 +++++++++++++
>>>   1 file changed, 13 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
>>> index 9c45d641b5212c11078ab38c13a519663d85e10a..ddc74c68148c643d34ca631dd28d4cdc2b8c7dc0 100644
>>> --- a/drivers/gpu/drm/msm/msm_atomic.c
>>> +++ b/drivers/gpu/drm/msm/msm_atomic.c
>>> @@ -142,6 +142,7 @@ static bool can_do_async(struct drm_atomic_state *state,
>>>          struct drm_connector_state *connector_state;
>>>          struct drm_connector *connector;
>>>          struct drm_crtc_state *crtc_state;
>>> +       struct drm_plane_state *plane_state;
>>>          struct drm_crtc *crtc;
>>>          int i, num_crtcs = 0;
>>>
>>> @@ -162,6 +163,18 @@ static bool can_do_async(struct drm_atomic_state *state,
>>>                  *async_crtc = crtc;
>>>          }
>>>
>>> +       /*
>>> +        * Force a blocking commit if the cursor is being disabled. This is to
>>> +        * ensure that the registers are cleared and hardware doesn't try to
>>> +        * fetch from a stale address.
>>> +        */
>>> +       if (*async_crtc) {
>>> +               plane_state = drm_atomic_get_new_plane_state(state,
>>> +                                                            (*async_crtc)->cursor);
>>> +               if (plane_state && !plane_state->fb)
>>> +                       return false;
>>
>> hmm, I suppose we want the same even if the fb changes?  Or
>> alternatively somewhere hold an extra ref to the backing obj until hw
>> has finished scanout?
>

Hi Rob

Do you mean we need to also check if old_plane_state->fb != 
new_plane_state->fb, then use blocking commit?

We can try that out.

holding extra ref gets tricky IMO. In this way, the calls are balanced 
in places we know.

> I think a more correct approach would be to run a worker, waiting for
> the commit to happen and then freeing the FBs.
> 

Hi Dmitry

This option was tried . It gets very messy to handle it this way. Then 
we realized that, the worker is going to try to do the same thing a 
blocking commit does which is to wait for hw to finish scanout and then 
cleanup planes. Hence this was preferred and is better IMO.

>>
>> BR,
>> -R
>>
>>> +       }
>>> +
>>>          return true;
>>>   }
>>>
>>>
>>> ---
>>> base-commit: 866e43b945bf98f8e807dfa45eca92f931f3a032
>>> change-id: 20250108-async-disable-fix-cc1b9a1d5b19
>>>
>>> Best regards,
>>> --
>>> Jessica Zhang <quic_jesszhan@quicinc.com>
>>>
> 
> 
> 

