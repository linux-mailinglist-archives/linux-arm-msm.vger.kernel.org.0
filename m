Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D91568A64B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 23:44:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbjBCWoc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 17:44:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232375AbjBCWoc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 17:44:32 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67A4B233CA
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Feb 2023 14:44:30 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 313M9eBb002573;
        Fri, 3 Feb 2023 22:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0s3+EUE+Q0YZOdnYPqNqV45W77C9FxDc6IDUmxZktn4=;
 b=esy8KeBOS8qUHTjuImyMK7ZGkQF6qF8GTDRiYU+mbJzEiCi263O8k3E9THOvjlQSPvY7
 x8Q47OacPkSbRatKCtfcY0ybDpcV/4jMXoT7FjlqAQ4l8aU/qFkQTAYMURi77LD/PA+E
 HvFgQ0GW4ulHyO3L6Ql2WEZZFyJaHkhTYC0zcFaopQvOxLalkGCQ52c7JNqVWh7r+mA4
 16NTb63m8SVthQFEb91VkKw00XW2+fstaUfrZi9TyYV8fpux1wWX5Pr96e+QWpFuD4rj
 2CoFrvd/VR35Z63GujtQebkKvLVOXijW4pGx0NsomBxFHPnRLfCawK2ZClBo3QQ+LuhY rw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nh7mhgcda-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 03 Feb 2023 22:44:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 313MiMfO021489
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 3 Feb 2023 22:44:22 GMT
Received: from [10.110.99.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 3 Feb 2023
 14:44:21 -0800
Message-ID: <121827e3-3ec4-c0fd-d3fb-771150e79717@quicinc.com>
Date:   Fri, 3 Feb 2023 14:44:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 15/27] drm/msm/dpu: move the rest of plane checks to
 dpu_plane_atomic_check()
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-16-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230203182132.1307834-16-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qoGhOSDoX3WUUoLLhnZLTSSW2L-ilXKB
X-Proofpoint-ORIG-GUID: qoGhOSDoX3WUUoLLhnZLTSSW2L-ilXKB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_19,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302030203
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
> Move plane state updates from dpu_crtc_atomic_check() to the function
> where they belong: to dpu_plane_atomic_check().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 18 +-----------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 18 ++++++++++--------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  6 ------
>   3 files changed, 11 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index b485234eefb2..bd09bb319a58 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1129,7 +1129,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>   									  crtc);
>   	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
>   	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
> -	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
>   
>   	const struct drm_plane_state *pstate;
>   	struct drm_plane *plane;
> @@ -1161,11 +1160,10 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>   	crtc_rect.x2 = mode->hdisplay;
>   	crtc_rect.y2 = mode->vdisplay;
>   
> -	 /* get plane state for all drm planes associated with crtc state */
> +	/* FIXME: move this to dpu_plane_atomic_check? */
>   	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
>   		struct dpu_plane_state *dpu_pstate = to_dpu_plane_state(pstate);
>   		struct drm_rect dst, clip = crtc_rect;
> -		int stage;
>   
>   		if (IS_ERR_OR_NULL(pstate)) {
>   			rc = PTR_ERR(pstate);
> @@ -1179,8 +1177,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>   
>   		dpu_pstate->needs_dirtyfb = needs_dirtyfb;
>   
> -		dpu_plane_clear_multirect(pstate);
> -
>   		dst = drm_plane_state_dest(pstate);
>   		if (!drm_rect_intersect(&clip, &dst)) {
>   			DPU_ERROR("invalid vertical/horizontal destination\n");
> @@ -1189,18 +1185,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>   				  DRM_RECT_ARG(&dst));
>   			return -E2BIG;
>   		}
> -
> -		/* verify stage setting before using it */
> -		stage = DPU_STAGE_0 + pstate->normalized_zpos;
> -		if (stage >= dpu_kms->catalog->caps->max_mixer_blendstages) {
> -			DPU_ERROR("> %d plane stages assigned\n",
> -					dpu_kms->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
> -			return -EINVAL;
> -		}
> -
> -		to_dpu_plane_state(pstate)->stage = stage;
> -		DRM_DEBUG_ATOMIC("%s: stage %d\n", dpu_crtc->name, stage);
> -
>   	}
>   
>   	atomic_inc(&_dpu_crtc_get_kms(crtc)->bandwidth_ref);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 1b3033b15bfa..5aabf9694a53 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -733,14 +733,6 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
>   	return 0;
>   }
>   
> -void dpu_plane_clear_multirect(const struct drm_plane_state *drm_state)
> -{
> -	struct dpu_plane_state *pstate = to_dpu_plane_state(drm_state);
> -
> -	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
> -	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -}
> -
>   int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
>   {
>   	struct dpu_plane_state *pstate[R_MAX];
> @@ -994,6 +986,16 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   	if (!new_plane_state->visible)
>   		return 0;
>   
> +	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
> +	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +

But I am not sure if clearing the multirect belongs here and now I want 
to clarify one thing about 
https://patchwork.freedesktop.org/patch/521354/?series=99909&rev=4 which 
was R-bed in the v1 and carried fwd since then.

So prior to that change, we were only clearing the multirects of the 
planes that were staged to the crtc and we were getting those from the 
crtc state. But now we are clearing the multirect of all the planes.

Dont we have to keep that in the crtc_atomic_check() since we do that on 
all the planes attached to a certain CRTC.

In that case shouldnt we keep this in the crtc_atomic_check() and bring 
back pipe_staged[] without the multirect and source split cases ofcourse.

> +	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
> +	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
> +		DPU_ERROR("> %d plane stages assigned\n",
> +				pdpu->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
> +		return -EINVAL;
> +	}
> +

I agree that this check belongs to the plane_atomic_check().

>   	src.x1 = new_plane_state->src_x >> 16;
>   	src.y1 = new_plane_state->src_y >> 16;
>   	src.x2 = src.x1 + (new_plane_state->src_w >> 16);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> index 228db401e905..a08b0539513b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> @@ -88,12 +88,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>    */
>   int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane);
>   
> -/**
> - * dpu_plane_clear_multirect - clear multirect bits for the given pipe
> - * @drm_state: Pointer to DRM plane state
> - */
> -void dpu_plane_clear_multirect(const struct drm_plane_state *drm_state);
> -
>   /**
>    * dpu_plane_color_fill - enables color fill on plane
>    * @plane:  Pointer to DRM plane object
