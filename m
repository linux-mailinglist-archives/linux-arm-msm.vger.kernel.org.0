Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B358535643
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 May 2022 00:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbiEZW7q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 May 2022 18:59:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiEZW7p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 May 2022 18:59:45 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCC53AE279
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 May 2022 15:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1653605983; x=1685141983;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EjlOLw6oLAfXK2hKbCs9hYy6HvUERt+vUOVFrzi8Lkk=;
  b=WJnv/iBWGDqqn+Q1WEW1u2eFM1x8q29zkuuo1Af4j48LU53NNMXgtHTb
   66FOp5MNzM0jiGUTi3o0FHhrYLwNLAXw95yiCTFuQvdMMfuabYSUNwC1F
   axOOWc9HSMH+ahe4NRFDeaHl460TC7B84RlzbbjB4LWxHAf0GvavMd2wW
   M=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 26 May 2022 15:59:43 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2022 15:59:42 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 26 May 2022 15:59:42 -0700
Received: from [10.111.172.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 26 May
 2022 15:59:40 -0700
Message-ID: <bebe59d7-cb8d-5e34-919d-703d2b477d25@quicinc.com>
Date:   Thu, 26 May 2022 15:59:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 17/25] drm/msm/dpu: drop src_split and multirect check
 from dpu_crtc_atomic_check
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
 <20220209172520.3719906-18-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220209172520.3719906-18-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/9/2022 9:25 AM, Dmitry Baryshkov wrote:
> Neither source split nor multirect are properly supported at this
> moment. Both of these checks depend on normalized_zpos being equal for
> several planes (which is never the case for normalized zpos).
> Drop these checks to simplify dpu_crtc_atomic_check(). The actual
> support for either of these features is not removed from the backend
> code (sspp, ctl, etc).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

This is true that current implementation of these features is not really 
compatible with any of the existing opensource compositors.

Till we have a better way to utilize this, I am okay to drop this code.

When we do re-visit this implementation especially for src split, 
atleast we have a reference of this PW link of what has been removed and 
can take it from there.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 166 ++---------------------
>   1 file changed, 12 insertions(+), 154 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 751c64012058..cbd0e50c2bd3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1046,13 +1046,6 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
>   	drm_crtc_vblank_on(crtc);
>   }
>   
> -struct plane_state {
> -	struct dpu_plane_state *dpu_pstate;
> -	const struct drm_plane_state *drm_pstate;
> -	int stage;
> -	u32 pipe_id;
> -};
> -
>   static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>   		struct drm_atomic_state *state)
>   {
> @@ -1060,28 +1053,21 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>   									  crtc);
>   	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
>   	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
> -	struct plane_state *pstates;
>   
>   	const struct drm_plane_state *pstate;
>   	struct drm_plane *plane;
>   	struct drm_display_mode *mode;
>   
> -	int cnt = 0, rc = 0, mixer_width = 0, i, z_pos;
> +	int rc = 0;
>   
> -	struct dpu_multirect_plane_states multirect_plane[DPU_STAGE_MAX * 2];
> -	int multirect_count = 0;
> -	const struct drm_plane_state *pipe_staged[SSPP_MAX];
> -	int left_zpos_cnt = 0, right_zpos_cnt = 0;
>   	struct drm_rect crtc_rect = { 0 };
>   
> -	pstates = kzalloc(sizeof(*pstates) * DPU_STAGE_MAX * 4, GFP_KERNEL);
> -
>   	if (!crtc_state->enable || !crtc_state->active) {
>   		DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip atomic_check\n",
>   				crtc->base.id, crtc_state->enable,
>   				crtc_state->active);
>   		memset(&cstate->new_perf, 0, sizeof(cstate->new_perf));
> -		goto end;
> +		return 0;
>   	}
>   
>   	mode = &crtc_state->adjusted_mode;
> @@ -1091,13 +1077,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>   	if (crtc_state->active_changed)
>   		crtc_state->mode_changed = true;
>   
> -	memset(pipe_staged, 0, sizeof(pipe_staged));
> -
> -	if (cstate->num_mixers) {
> -		mixer_width = mode->hdisplay / cstate->num_mixers;
> -
> +	if (cstate->num_mixers)
>   		_dpu_crtc_setup_lm_bounds(crtc, crtc_state);
> -	}
>   
>   	crtc_rect.x2 = mode->hdisplay;
>   	crtc_rect.y2 = mode->vdisplay;
> @@ -1105,33 +1086,16 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>   	 /* get plane state for all drm planes associated with crtc state */
>   	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
>   		struct drm_rect dst, clip = crtc_rect;
> +		int z_pos;
>   
>   		if (IS_ERR_OR_NULL(pstate)) {
>   			rc = PTR_ERR(pstate);
>   			DPU_ERROR("%s: failed to get plane%d state, %d\n",
>   					dpu_crtc->name, plane->base.id, rc);
> -			goto end;
> -		}
> -		if (cnt >= DPU_STAGE_MAX * 4)
> -			continue;
> -
> -		pstates[cnt].dpu_pstate = to_dpu_plane_state(pstate);
> -		pstates[cnt].drm_pstate = pstate;
> -		pstates[cnt].stage = pstate->normalized_zpos;
> -		pstates[cnt].pipe_id = to_dpu_plane_state(pstate)->pipe.sspp->idx;
> -
> -		if (pipe_staged[pstates[cnt].pipe_id]) {
> -			multirect_plane[multirect_count].r0 =
> -				pipe_staged[pstates[cnt].pipe_id];
> -			multirect_plane[multirect_count].r1 = pstate;
> -			multirect_count++;
> -
> -			pipe_staged[pstates[cnt].pipe_id] = NULL;
> -		} else {
> -			pipe_staged[pstates[cnt].pipe_id] = pstate;
> +			return rc;
>   		}
>   
> -		cnt++;
> +		dpu_plane_clear_multirect(pstate);
>   
>   		dst = drm_plane_state_dest(pstate);
>   		if (!drm_rect_intersect(&clip, &dst)) {
> @@ -1139,63 +1103,21 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>   			DPU_ERROR("display: " DRM_RECT_FMT " plane: "
>   				  DRM_RECT_FMT "\n", DRM_RECT_ARG(&crtc_rect),
>   				  DRM_RECT_ARG(&dst));
> -			rc = -E2BIG;
> -			goto end;
> +			return -E2BIG;
>   		}
> -	}
> -
> -	for (i = 1; i < SSPP_MAX; i++) {
> -		if (pipe_staged[i])
> -			dpu_plane_clear_multirect(pipe_staged[i]);
> -	}
>   
> -	z_pos = -1;
> -	for (i = 0; i < cnt; i++) {
> -		/* reset counts at every new blend stage */
> -		if (pstates[i].stage != z_pos) {
> -			left_zpos_cnt = 0;
> -			right_zpos_cnt = 0;
> -			z_pos = pstates[i].stage;
> -		}
> +		z_pos = pstate->normalized_zpos;
>   
>   		/* verify z_pos setting before using it */
>   		if (z_pos >= DPU_STAGE_MAX - DPU_STAGE_0) {
>   			DPU_ERROR("> %d plane stages assigned\n",
>   					DPU_STAGE_MAX - DPU_STAGE_0);
> -			rc = -EINVAL;
> -			goto end;
> -		} else if (pstates[i].drm_pstate->crtc_x < mixer_width) {
> -			if (left_zpos_cnt == 2) {
> -				DPU_ERROR("> 2 planes @ stage %d on left\n",
> -					z_pos);
> -				rc = -EINVAL;
> -				goto end;
> -			}
> -			left_zpos_cnt++;
> -
> -		} else {
> -			if (right_zpos_cnt == 2) {
> -				DPU_ERROR("> 2 planes @ stage %d on right\n",
> -					z_pos);
> -				rc = -EINVAL;
> -				goto end;
> -			}
> -			right_zpos_cnt++;
> +			return -EINVAL;
>   		}
>   
> -		pstates[i].dpu_pstate->stage = z_pos + DPU_STAGE_0;
> +		to_dpu_plane_state(pstate)->stage = z_pos + DPU_STAGE_0;
>   		DRM_DEBUG_ATOMIC("%s: zpos %d\n", dpu_crtc->name, z_pos);
> -	}
>   
> -	for (i = 0; i < multirect_count; i++) {
> -		if (dpu_plane_validate_multirect_v2(&multirect_plane[i])) {
> -			DPU_ERROR(
> -			"multirect validation failed for planes (%d - %d)\n",
> -					multirect_plane[i].r0->plane->base.id,
> -					multirect_plane[i].r1->plane->base.id);
> -			rc = -EINVAL;
> -			goto end;
> -		}
>   	}
>   
>   	atomic_inc(&_dpu_crtc_get_kms(crtc)->bandwidth_ref);
> @@ -1204,74 +1126,10 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>   	if (rc) {
>   		DPU_ERROR("crtc%d failed performance check %d\n",
>   				crtc->base.id, rc);
> -		goto end;
> -	}
> -
> -	/* validate source split:
> -	 * use pstates sorted by stage to check planes on same stage
> -	 * we assume that all pipes are in source split so its valid to compare
> -	 * without taking into account left/right mixer placement
> -	 */
> -	for (i = 1; i < cnt; i++) {
> -		struct plane_state *prv_pstate, *cur_pstate;
> -		struct drm_rect left_rect, right_rect;
> -		int32_t left_pid, right_pid;
> -		int32_t stage;
> -
> -		prv_pstate = &pstates[i - 1];
> -		cur_pstate = &pstates[i];
> -		if (prv_pstate->stage != cur_pstate->stage)
> -			continue;
> -
> -		stage = cur_pstate->stage;
> -
> -		left_pid = prv_pstate->dpu_pstate->base.plane->base.id;
> -		left_rect = drm_plane_state_dest(prv_pstate->drm_pstate);
> -
> -		right_pid = cur_pstate->dpu_pstate->base.plane->base.id;
> -		right_rect = drm_plane_state_dest(cur_pstate->drm_pstate);
> -
> -		if (right_rect.x1 < left_rect.x1) {
> -			swap(left_pid, right_pid);
> -			swap(left_rect, right_rect);
> -		}
> -
> -		/**
> -		 * - planes are enumerated in pipe-priority order such that
> -		 *   planes with lower drm_id must be left-most in a shared
> -		 *   blend-stage when using source split.
> -		 * - planes in source split must be contiguous in width
> -		 * - planes in source split must have same dest yoff and height
> -		 */
> -		if (right_pid < left_pid) {
> -			DPU_ERROR(
> -				"invalid src split cfg. priority mismatch. stage: %d left: %d right: %d\n",
> -				stage, left_pid, right_pid);
> -			rc = -EINVAL;
> -			goto end;
> -		} else if (right_rect.x1 != drm_rect_width(&left_rect)) {
> -			DPU_ERROR("non-contiguous coordinates for src split. "
> -				  "stage: %d left: " DRM_RECT_FMT " right: "
> -				  DRM_RECT_FMT "\n", stage,
> -				  DRM_RECT_ARG(&left_rect),
> -				  DRM_RECT_ARG(&right_rect));
> -			rc = -EINVAL;
> -			goto end;
> -		} else if (left_rect.y1 != right_rect.y1 ||
> -			   drm_rect_height(&left_rect) != drm_rect_height(&right_rect)) {
> -			DPU_ERROR("source split at stage: %d. invalid "
> -				  "yoff/height: left: " DRM_RECT_FMT " right: "
> -				  DRM_RECT_FMT "\n", stage,
> -				  DRM_RECT_ARG(&left_rect),
> -				  DRM_RECT_ARG(&right_rect));
> -			rc = -EINVAL;
> -			goto end;
> -		}
> +		return rc;
>   	}
>   
> -end:
> -	kfree(pstates);
> -	return rc;
> +	return 0;
>   }
>   
>   int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
