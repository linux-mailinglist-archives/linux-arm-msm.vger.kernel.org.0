Return-Path: <linux-arm-msm+bounces-36797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC249B998C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 21:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD73C1C212F0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 20:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB2F01D9588;
	Fri,  1 Nov 2024 20:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iJEEvJgV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EE9155330;
	Fri,  1 Nov 2024 20:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730493444; cv=none; b=Xi0EqiuVG0iwMphJggg4JqszhHQnxizmPqmnFCQKUPeE/kTf77Qv5d1DMWSIOAP0X+OduoPHAETAAC+YgI19wrSY0dOIkC7tBzA0RETCKXls+uGIo5hN8oVnjQBoWAAQE1morXEfy2IL0SPSPQrOxf70vK/NkQQfLF5KBKEPj/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730493444; c=relaxed/simple;
	bh=HRZPoL3QR267JNkcrcPBmZYHjeZtcK8cZKkeJst3zgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dwzdhz01Wrm+dUL26IEMbCe0DA9aVkgk2mapv069xCn4aCBmd7w5BGTS7AxjXLsC9QKbHZ7Qx7twwOYBwVFpaPtiotH1uBrlzJ6bh2bVg6E4bQd+WRWvkYz94UmZelOLX+SA2VqJnW2i3+L7XW+SL67IH2CLmUt8P7XaF+PiLSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iJEEvJgV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1HbXhX027426;
	Fri, 1 Nov 2024 20:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	55okU0PUjDqw29lBKiBFuxkMJAQ5ai0FhMhRCUfr558=; b=iJEEvJgVEMh6dHi9
	PT1pa6ukM4XGoTM+PwDWZRjxkPMS2aXB6Y0sBNcwu8HaD66Bz1YiDLfOqldL4kKL
	10MuctyuKsWqLFtngXh4BI9w63eb1i5n9KIm1g9ubzcVV5cRBVKvTdS3IGUJG7vD
	d9GDGaPBLoUWYZhutceTaqQPxKwF7kxJNCNuGR2uT0rCJtUshb5rtKlIdNKNSryS
	XoSpG7nR6Y+UbU4DaTouBswIov5RrkeO6RZ54QWnOp8cMRdl3I5GjTGN00xIimrO
	rA06HfQC3q1oYqWjJ/bjvQdDSsmGWlo2mCfamxOG8TBxTg7/6udkBabut5XdD0zR
	NAYdQw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42mu7ca3pv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 20:37:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A1Kb789004039
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Nov 2024 20:37:07 GMT
Received: from [10.110.96.174] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 1 Nov 2024
 13:37:05 -0700
Message-ID: <0afc409e-63af-4106-8af1-9d21f7ca62dd@quicinc.com>
Date: Fri, 1 Nov 2024 13:37:03 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/9] drm/msm/dpu: add support for virtual planes
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn
 Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
 <20241025-dpu-virtual-wide-v6-7-0310fd519765@linaro.org>
 <e0f84f35-6d98-45c3-857c-c273820fab69@quicinc.com>
 <xxxedwb2t6xhfzmhpom6dirs2ur2qvmruimdxgvdkh7gmey5tr@qotm7xvbsg5a>
 <14531af0-29c3-40eb-bf52-8202ba155d0b@quicinc.com>
 <CAA8EJppCppQ_jJu4o62prW-Yp2E3WBfqdYgdJs-KB8kgghj0fg@mail.gmail.com>
 <0550a9d0-dfb6-472d-a0c2-68fab78c3afb@quicinc.com>
 <hjymywkecsbccjq4gzcdwfqp2tss7i7jtbmsg2q4nvy7uapsn4@t5orck7ion7w>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <hjymywkecsbccjq4gzcdwfqp2tss7i7jtbmsg2q4nvy7uapsn4@t5orck7ion7w>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: h2pae3rdki5o_LeS13JSZz55_B7AOlv8
X-Proofpoint-ORIG-GUID: h2pae3rdki5o_LeS13JSZz55_B7AOlv8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 adultscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411010147



On 10/31/2024 2:03 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 31, 2024 at 01:06:34PM -0700, Abhinav Kumar wrote:
>>
>>
>> On 10/31/2024 8:11 AM, Dmitry Baryshkov wrote:
>>> Hi Abhinav,
>>>
>>> On Wed, 30 Oct 2024 at 21:26, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 10/30/2024 3:48 AM, Dmitry Baryshkov wrote:
>>>>> On Tue, Oct 29, 2024 at 02:30:12PM -0700, Abhinav Kumar wrote:
>>>>>>
>>>>>>
>>>>>> On 10/24/2024 5:20 PM, Dmitry Baryshkov wrote:
>>>>>>> Only several SSPP blocks support such features as YUV output or scaling,
>>>>>>> thus different DRM planes have different features.  Properly utilizing
>>>>>>> all planes requires the attention of the compositor, who should
>>>>>>> prefer simpler planes to YUV-supporting ones. Otherwise it is very easy
>>>>>>> to end up in a situation when all featureful planes are already
>>>>>>> allocated for simple windows, leaving no spare plane for YUV playback.
>>>>>>>
>>>>>>> To solve this problem make all planes virtual. Each plane is registered
>>>>>>> as if it supports all possible features, but then at the runtime during
>>>>>>> the atomic_check phase the driver selects backing SSPP block for each
>>>>>>> plane.
>>>>>>>
>>>>>>> As the planes are attached to the CRTC and not the encoder, the SSPP
>>>>>>> blocks are also allocated per CRTC ID (all other resources are currently
>>>>>>> allocated per encoder ID). This also matches the hardware requirement,
>>>>>>> where both rectangles of a single SSPP can only be used with the LM
>>>>>>> pair.
>>>>>>>
>>>>>>> Note, this does not provide support for using two different SSPP blocks
>>>>>>> for a single plane or using two rectangles of an SSPP to drive two
>>>>>>> planes. Each plane still gets its own SSPP and can utilize either a solo
>>>>>>> rectangle or both multirect rectangles depending on the resolution.
>>>>>>>
>>>>>>> Note #2: By default support for virtual planes is turned off and the
>>>>>>> driver still uses old code path with preallocated SSPP block for each
>>>>>>> plane. To enable virtual planes, pass 'msm.dpu_use_virtual_planes=1'
>>>>>>> kernel parameter.
>>>>>>>
>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  50 +++++++
>>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  10 +-
>>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h   |   4 +
>>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 237 ++++++++++++++++++++++++++----
>>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  16 ++
>>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c    |  68 +++++++++
>>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h    |  27 ++++
>>>>>>>      7 files changed, 383 insertions(+), 29 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>>>> index 58595dcc3889..a7eea094aa14 100644
>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>>>> @@ -1166,6 +1166,49 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
>>>>>>>       return false;
>>>>>>>      }
>>>>>>> +static int dpu_crtc_reassign_planes(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
>>>>>>> +{
>>>>>>> +   int total_planes = crtc->dev->mode_config.num_total_plane;
>>>>>>> +   struct drm_atomic_state *state = crtc_state->state;
>>>>>>> +   struct dpu_global_state *global_state;
>>>>>>> +   struct drm_plane_state **states;
>>>>>>> +   struct drm_plane *plane;
>>>>>>> +   int ret;
>>>>>>> +
>>>>>>> +   global_state = dpu_kms_get_global_state(crtc_state->state);
>>>>>>> +   if (IS_ERR(global_state))
>>>>>>> +           return PTR_ERR(global_state);
>>>>>>> +
>>>>>>> +   dpu_rm_release_all_sspp(global_state, crtc);
>>>>>>> +
>>>>>>> +   if (!crtc_state->enable)
>>>>>>> +           return 0;
>>>>>>> +
>>>>>>> +   states = kcalloc(total_planes, sizeof(*states), GFP_KERNEL);
>>>>>>> +   if (!states)
>>>>>>> +           return -ENOMEM;
>>>>>>> +
>>>>>>> +   drm_atomic_crtc_state_for_each_plane(plane, crtc_state) {
>>>>>>> +           struct drm_plane_state *plane_state =
>>>>>>> +                   drm_atomic_get_plane_state(state, plane);
>>>>>>> +
>>>>>>> +           if (IS_ERR(plane_state)) {
>>>>>>> +                   ret = PTR_ERR(plane_state);
>>>>>>> +                   goto done;
>>>>>>> +           }
>>>>>>> +
>>>>>>> +           states[plane_state->normalized_zpos] = plane_state;
>>>>>>> +   }
>>>>>>> +
>>>>>>> +   ret = dpu_assign_plane_resources(global_state, state, crtc, states, total_planes);
>>>>>>> +
>>>>>>> +done:
>>>>>>> +   kfree(states);
>>>>>>> +   return ret;
>>>>>>> +
>>>>>>> +   return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>>      static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>>>>>>>               struct drm_atomic_state *state)
>>>>>>>      {
>>>>>>> @@ -1181,6 +1224,13 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>>>>>>>       bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
>>>>>>> +   if (dpu_use_virtual_planes &&
>>>>>>> +       (crtc_state->planes_changed || crtc_state->zpos_changed)) {
>>>>>>> +           rc = dpu_crtc_reassign_planes(crtc, crtc_state);
>>>>>>> +           if (rc < 0)
>>>>>>> +                   return rc;
>>>>>>> +   }
>>>>>>
>>>>>> planes_changed is set only for format changes . Will it cover all
>>>>>> needs_modeset cases?
>>>>>>
>>>>>> OR do we also need to set planes_changed when
>>>>>> drm_atomic_crtc_needs_modeset()?
>>>>>>
>>>>>> Unless I am missing something, I think we have to otherwise sspp
>>>>>> reallocation wont happen in modeset cases.
>>>>>
>>>>> I was depending on the planes being included in the state by the client.
>>>>> I don't think we really care about the modeset per se. We care about
>>>>> plane size changes. And changing the size means that the plane is
>>>>> included into the commit.
>>>>>
>>>>
>>>> The global state mapping for SSPPs has to be cleared across modesets
>>>> IMO. This is no different from us calling dpu_rm_release() today in
>>>> dpu_encoder_virt_atomic_check(). I just am not sure whether
>>>> planes_changed will cover all modeset conditions.
>>>
>>> We clear other resources, because they depend on the CRTC resolution.
>>> Planes do not. Well, not until the quadpipe is in play.
>>> SSPPs (currently) should be reallocated only if the _plane_'s
>>> resolution change. If we have a modeset which involves CRTC resolution
>>> change, but not the plane's size change, there is no need to
>>> reallocate SSPPs.
>>>
>>
>> In dpu_encoder_helper_phys_cleanup(), the SSPPs attached to all LMs are
>> removed so clearing all the hardware. If the global state is still going to
>> retain the older configuration not reflecting this clear, it seems incorrect
>> to me. Thats why I was thinking of clearing all the SSPP mapping in
>> disable() or in the modeset prior to the disable as technically thats being
>> done in HW today anyway.
>>
>> During the next atomic check, the planes in the crtc's current state will
>> get re-attached and programmed to the blend stages. So this clearing of
>> global state is reflecting the current state of the corresponding hardware.
> 
> The global state tracks resource allocation. If we clear the resources
> in the disable() path, we have no way to know which SSPP blocks were
> assigned to us in the corresponding enable() call path. There is no
> guarantee that there will be an atomic_check() between disable() and
> enable().
> 

So I had suggested clearing in disable() because we did not come to an 
agreement to doing it in atomic_check() just a few comments earlier.

Doing it in disable() is not right. I agree with that part now as we 
should not be touching the state after atomic_check() phase.

That brings me back to my original question. With the planes_changed 
check in atomic_check how can we guarantee that global state SSPP 
allocation is freed and allocated again across a disable() / enable() 
cycle? Can you pls confirm whether this is happening or not across a 
hotplug and suspend/resume cycle?


>>
>>>>
>>>> Were you able to confirm whether the mapping gets cleared across
>>>> hotplugs or suspend/resumes? If so, it would confirm whether
>>>> planes_changed covers these aspects. Although, I think clearing should
>>>> be more explicit.
>>>
>>> I will check that tomorrow.
>>>
>>>> Another option could be for you to call dpu_rm_release_all_sspp() in
>>>> dpu_crtc_disable(). So that across a disable and enable we have a clear
>>>> mapping table. WDYT?
>>>
>>> Absolutely no. The RM state should only be changed when other object's
>>> state change - in atomic_check(). After that it is mostly r/o.
>>> enabling/disabling the resource shouldn't change resource assignment
>>> at all.
>>>

Ack but please check above.

>>>>
>>>>>>
>>>>>> Overall, mainly we want to make sure SSPPs are re-assigned when:
>>>>>>
>>>>>
>>>>> 0) plane size changes
>>>>>>> 1) format changes (RGB to YUV and vice-versa)
>>>>>> 2) Any modesets
>>>>>
>>>>> No
>>>>
>>>> I am not able to follow why this is different from any global state
>>>> mapping of other HW blocks that we do across modesets.
>>>
>>> DIfferent lifecycle requirements, I'd say.
>>>
>>>>
>>>>>
>>>>>> 3) Any disable/enable without modeset like connectors changed as SSPPs are
>>>>>> changing outputs there.
>>>>>
>>>>> Absolutely no, the logic should be the same as active vs enabled for
>>>>> CRTCs. Realloc resources only if the plane itself gets disabled or
>>>>> enabled. In all other cases the set of SSPP blocks should stay
>>>>> untouched.
>>>>>
>>>>
>>>> I am going to re-visit this later perhaps but if we incorporate my above
>>>> suggestion of clearing the mapping in disable() I will be partially
>>>> satisfied.
>>>
>>> No, resource mapping can not be cleaned in disable(). We do not do
>>> that for any other resource kind.
>>>
>>
>> That gets handled with the needs_modeset part today which is calling the
>> dpu_rm_release().
> 
> In atomic_check() path, not in the disable() path.
> 
>>
>>>>
>>>>>>
>>>>>> If we are covered for all these, let me know.
>>>>>>
>>>>>>> +
>>>>>>>       if (!crtc_state->enable || !drm_atomic_crtc_effectively_active(crtc_state)) {
>>>>>>>               DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip atomic_check\n",
>>>>>>>                               crtc->base.id, crtc_state->enable,
>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>>>>> index 15679dd50c66..70757d876cc3 100644
>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>>>>> @@ -51,6 +51,9 @@
>>>>>>>      #define DPU_DEBUGFS_DIR "msm_dpu"
>>>>>>>      #define DPU_DEBUGFS_HWMASKNAME "hw_log_mask"
>>>>>>> +bool dpu_use_virtual_planes;
>>>>>>> +module_param(dpu_use_virtual_planes, bool, 0);
>>>>>>> +
>>>>>>>      static int dpu_kms_hw_init(struct msm_kms *kms);
>>>>>>>      static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms);
>>>>>>> @@ -814,8 +817,11 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>>>>>>>                         type, catalog->sspp[i].features,
>>>>>>>                         catalog->sspp[i].features & BIT(DPU_SSPP_CURSOR));
>>>>>>> -           plane = dpu_plane_init(dev, catalog->sspp[i].id, type,
>>>>>>> -                                  (1UL << max_crtc_count) - 1);
>>>>>>> +           if (dpu_use_virtual_planes)
>>>>>>> +                   plane = dpu_plane_init_virtual(dev, type, (1UL << max_crtc_count) - 1);
>>>>>>> +           else
>>>>>>> +                   plane = dpu_plane_init(dev, catalog->sspp[i].id, type,
>>>>>>> +                                          (1UL << max_crtc_count) - 1);
>>>>>>>               if (IS_ERR(plane)) {
>>>>>>>                       DPU_ERROR("dpu_plane_init failed\n");
>>>>>>>                       ret = PTR_ERR(plane);
>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>>>>>> index 935ff6fd172c..479d4c172290 100644
>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>>>>>> @@ -54,6 +54,8 @@
>>>>>>>      #define ktime_compare_safe(A, B) \
>>>>>>>       ktime_compare(ktime_sub((A), (B)), ktime_set(0, 0))
>>>>>>> +extern bool dpu_use_virtual_planes;
>>>>>>> +
>>>>>>>      struct dpu_kms {
>>>>>>>       struct msm_kms base;
>>>>>>>       struct drm_device *dev;
>>>>>>> @@ -128,6 +130,8 @@ struct dpu_global_state {
>>>>>>>       uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
>>>>>>>       uint32_t dsc_to_enc_id[DSC_MAX - DSC_0];
>>>>>>>       uint32_t cdm_to_enc_id;
>>>>>>> +
>>>>>>> +   uint32_t sspp_to_crtc_id[SSPP_MAX - SSPP_NONE];
>>>>>>>      };
>>>>>>
>>>>>> This is the part which now looks odd and can be managed with rebase I guess.
>>>>>>
>>>>>> Are you planning to pull in the move resource allocation to crtc_id changes
>>>>>> first before this part? IOW, rebase this change on top of that?
>>>>>
>>>>> No. I do not. If you remember, several revisions ago the enc_id ->
>>>>> crtc_id was a part of the series, but we both agreed to drop it since it
>>>>> was not required for virtual planes. As such, I plan to land this one
>>>>> first (yes, having some of the resources tracked basing on enc_id and
>>>>> SSPP is tracked basing on crtc_id).
>>>>>
>>>>
>>>> Yes, I am not asking whether you will be absorbing those changes into
>>>> this series. Even I would not suggest doing that.
>>>>
>>>> I was asking whether you will merge the crtc_id based tracking first and
>>>> then apply this on top of that and not the other way around.
>>>>
>>>> Because with this specific line I am certain it will conflict as both
>>>> the series touch struct dpu_global_state.
>>>
>>> They touch different parts of it. So I'd prefer to land this one first
>>> and then land using crtc_id for mapping.
>>>
>>
>> I am okay to fixup any other issues which arise later on because we have the
>> modparam protection anyway but I think validating suspend/resume and hotplug
>> to ensure no black screens is required. If those two cases work fine on your
>> end, we can proceed.
> 
> I have been validating these changes with hotplug events, yes. I wasn't
> checking the suspend/resume, but that's broken anyway, until we land
> https://patchwork.freedesktop.org/patch/606931/?series=135908&rev=2
> 

Can you pls confirm once whether the global state mapping gets freed 
across crtc disable/enable cycle with the planes_changed check? I think 
it has to.

Other items are closed so snipping out below.

