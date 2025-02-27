Return-Path: <linux-arm-msm+bounces-49737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2C2A484B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 17:21:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 304567A23E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 16:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAFF11AF0C7;
	Thu, 27 Feb 2025 16:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L6+pfIqZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5143B1A8403;
	Thu, 27 Feb 2025 16:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740673260; cv=none; b=ZuDOUwO5Tutt0dCEKqmIbdEValp21sTimmf9PTNI3iC/3RAb3/M1Lk1zUJX7OVMKt+aRO1JH71FgcEB9BAmSb6kAdyRuvanNZV786vYqpFPCSmAbw2g4ilkfL5I2Xfw6tW4qGoL1AI45deOa8ofCrsx44MxBIrG2BBL18v51ZPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740673260; c=relaxed/simple;
	bh=K1/f+5bSpgnIKewQa355SN47I9oWVnJc0of3x1OOESk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hJplEdpXD4CR6azK+lRngm/ntmEbiDl2iJMMdbbgAjQpjRPXGLRVQ3/kB72WVS9dGsEHnBR2CsMHfQPuP6HrDcZlkiyO1nbWtHNyHDai48X5cirh7ul8lDRfaD4nC2LsfVs4hyrHycxjc3Cfzt/RfWHj8ku8kc2BoonxRRcMydQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L6+pfIqZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RAmGk5003262;
	Thu, 27 Feb 2025 16:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6p5blYPJsZAiEhh55r9csMNpRcOSlR/cP4vpwD7S4WA=; b=L6+pfIqZnAsF/Rpc
	gyvtcjFXcy7iNM5easSCGeR8oTEHpi14X4YtAd9kmQWaplVyxBEccRdlQCt/C7A2
	wTVVMl3ytdRv6AeR/IPCX4F77zK/c5M1wl85z2zoE2WWE26WFpwlC8n9qyUBVNMW
	D8Sfb1cbmRLgFenTA1ITHXasxpyAHviFJIaIEVAtaiybJLCkjJgWDPxSmQ+PVllM
	SYRNIIXxbc0IIJSrSpz8Bp3Sp3eR3JukdlH9COEqbgegmTxq1B5sISeQciFJ2EYq
	u+z232tvV0wH9bY13jneI9uoJEfx1LbW0NONM6XFcCKPsEhvM8waoIo7nQeV2xsB
	dOdqJw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 452pm7h0d0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 16:20:50 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51RGKnhe024130
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 16:20:49 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Feb
 2025 08:20:49 -0800
Message-ID: <1ef68d83-b78a-4281-9554-19c112057548@quicinc.com>
Date: Thu, 27 Feb 2025 08:20:48 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 13/15] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Content-Language: en-US
To: Jun Nie <jun.nie@linaro.org>
CC: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
 <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-13-8d5f5f426eb2@linaro.org>
 <ca42d2b4-4b0c-48a8-abd5-d34486e62d8e@quicinc.com>
 <CABymUCMLH7Sk4fcyAXFXiYN=egfNvEjtJgrUWgeN2+dMpHPdBw@mail.gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <CABymUCMLH7Sk4fcyAXFXiYN=egfNvEjtJgrUWgeN2+dMpHPdBw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yH63wF6kgOtU97MUplEUAcbnVBG7YADx
X-Proofpoint-GUID: yH63wF6kgOtU97MUplEUAcbnVBG7YADx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_06,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270123



On 2/26/2025 6:28 PM, Jun Nie wrote:
> Jessica Zhang <quic_jesszhan@quicinc.com> 于2025年2月27日周四 02:10写道：
>>
>>
>>
>> On 2/26/2025 4:31 AM, Jun Nie wrote:
>>> Currently, SSPPs are assigned to a maximum of two pipes. However,
>>> quad-pipe usage scenarios require four pipes and involve configuring
>>> two stages. In quad-pipe case, the first two pipes share a set of
>>> mixer configurations and enable multi-rect mode when certain
>>> conditions are met. The same applies to the subsequent two pipes.
>>>
>>> Assign SSPPs to the pipes in each stage using a unified method and
>>> to loop the stages accordingly.
>>>
>>> Signed-off-by: Jun Nie <jun.nie@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 11 +++++
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |  2 +
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 71 ++++++++++++++++++++-----------
>>>    3 files changed, 58 insertions(+), 26 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> index 0a053c5888262d863a1e549e14e3aa40a80c3f06..9405453cbf5d852e72a5f954cd8c6aed3a222723 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> @@ -1366,6 +1366,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
>>>        return 0;
>>>    }
>>>
>>> +/**
>>> + * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
>>> + * @state: Pointer to drm crtc state object
>>> + */
>>> +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)
>>> +{
>>> +     struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
>>> +
>>> +     return cstate->num_mixers;
>>> +}
>>> +
>>>    #ifdef CONFIG_DEBUG_FS
>>>    static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
>>>    {
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
>>> index 0b148f3ce0d7af80ec4ffcd31d8632a5815b16f1..b14bab2754635953da402d09e11a43b9b4cf4153 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
>>> @@ -264,4 +264,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
>>>
>>>    void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
>>>
>>> +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state);
>>> +
>>>    #endif /* _DPU_CRTC_H_ */
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> index d67f2ad20b4754ca4bcb759a65a39628b7236b0f..d1d6c91ed0f8e1c62b757ca42546fbc421609f72 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> @@ -1112,11 +1112,10 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>>>        struct dpu_rm_sspp_requirements reqs;
>>>        struct dpu_plane_state *pstate;
>>>        struct dpu_sw_pipe *pipe;
>>> -     struct dpu_sw_pipe *r_pipe;
>>>        struct dpu_sw_pipe_cfg *pipe_cfg;
>>> -     struct dpu_sw_pipe_cfg *r_pipe_cfg;
>>> +     struct dpu_plane *pdpu = to_dpu_plane(plane);
>>>        const struct msm_format *fmt;
>>> -     int i;
>>> +     int i, num_lm, stage_id, num_stages;
>>>
>>>        if (plane_state->crtc)
>>>                crtc_state = drm_atomic_get_new_crtc_state(state,
>>> @@ -1124,11 +1123,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>>>
>>>        pstate = to_dpu_plane_state(plane_state);
>>>
>>> -     pipe = &pstate->pipe[0];
>>> -     r_pipe = &pstate->pipe[1];
>>> -     pipe_cfg = &pstate->pipe_cfg[0];
>>> -     r_pipe_cfg = &pstate->pipe_cfg[1];
>>> -
>>>        for (i = 0; i < PIPES_PER_PLANE; i++)
>>>                pstate->pipe[i].sspp = NULL;
>>>
>>> @@ -1142,24 +1136,49 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>>>
>>>        reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
>>>
>>> -     pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
>>> -     if (!pipe->sspp)
>>> -             return -ENODEV;
>>> -
>>> -     if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
>>> -                                           pipe->sspp,
>>> -                                           msm_framebuffer_format(plane_state->fb),
>>> -                                           dpu_kms->catalog->caps->max_linewidth)) {
>>> -             /* multirect is not possible, use two SSPP blocks */
>>> -             r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
>>> -             if (!r_pipe->sspp)
>>> -                     return -ENODEV;
>>> -
>>> -             pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>>> -             pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>> -
>>> -             r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>>> -             r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>> +     num_lm = dpu_crtc_get_num_lm(crtc_state);
>>
>> Hi Jun,
>>
>> Just wondering, why not use dpu_rm_get_assigned_resources() here instead
>> of adding a new *_get_num_lm() API?
>>
>> Thanks,
>>
>> Jessica Zhang
>>
> It is overkill to loop over allocated resource to just get the number.
> That's comments
> from Dmitry if I am not wrong.

Ah got it. I must have missed this when checking past comments.

In that case:

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> 
> Regards,
> Jun


