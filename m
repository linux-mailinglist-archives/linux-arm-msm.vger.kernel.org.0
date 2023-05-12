Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFDDD70123F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 May 2023 00:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231556AbjELWjz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 May 2023 18:39:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238625AbjELWjs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 May 2023 18:39:48 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3332149E8
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 15:39:46 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34CMP0CX003827;
        Fri, 12 May 2023 22:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=DJl2d4AbRedbl4eC3UVkQaharWGEY041mKzLtxG5+Iw=;
 b=fysXH50ujBWbgKpQdpIuw3sSE9IvEnvRk0LmLzmxxktbltv+tbpRhLoBxbtAJ8MQyK/f
 USdVxM/SnoVwklRNvJWXabAz7EspU9P84iQPYzK/vD0k9j+88zDDJy0cjF0NObbNyC8g
 lE88f4Ewh0Y2u45aux36pNE9Pumnqzv3uIKlOjcYQlFP7NCWaHkAyqK16lKwgESHVRHh
 KIFq9wzRqKBCrtTdnUz8NhqnVKyl7ko74fyiAyb/G+PRQmmkUFMRWH1a5pXqsc5bNGTU
 z0zkbao/nU80SFUexnDH6LU+A3txwaAyk72oc9phXo53vQAXzKFFUb0NLXQx85jgMMDi hw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qhj9s1tgw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 12 May 2023 22:39:39 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34CMdbBn018049
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 12 May 2023 22:39:37 GMT
Received: from [10.110.82.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 12 May
 2023 15:39:37 -0700
Message-ID: <a1ba90c2-8144-ccf3-b38e-0dbb549a7481@quicinc.com>
Date:   Fri, 12 May 2023 15:39:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH v2 05/13] drm/msm/dpu: get rid of struct
 dpu_rm_requirements
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-6-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230321011821.635977-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Na7MF5jG9ilsPpy8FF_0WPZqiJCmLk6c
X-Proofpoint-GUID: Na7MF5jG9ilsPpy8FF_0WPZqiJCmLk6c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_14,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305120190
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
> The struct dpu_rm_requirements was used to wrap display topology and
> hw resources, which meant INTF indices. As of commit ef58e0ad3436
> ("drm/msm/dpu: get INTF blocks directly rather than through RM") the hw
> resources struct was removed, leaving struct dpu_rm_requirements
> containing a single field (topology). Remove the useless wrapper.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Irrespective of where we plan to have the topology, this change doesn't 
seem incorrect as such.

The only thing I can think of is when we need more information to be 
passed to the RM to allocate the blocks in addition to the topology this 
struct could have been expanded.

So one example I can think of is lets say I want to add CDM block 
support. Then that information is outside of topology today because I 
will use CDM if my output format is yuv. It has nothing to do with 
topology but that block still needs to come from RM.

I know that usually I have lost on these type of discussions saying that 
if the code is not there yet, it should be dropped but I do have a plan 
to add that support soon probably by the next cycle. That time we will 
need some sort of wrapper to hold the topology and "extra" information 
to allocate the blocks.

One alternative ofcourse is to expand dpu_rm_reserve() to accept 
something like "needs_cdm" but this is not scalable.

Thoughts?

>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 69 +++++++--------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  2 +-
>   3 files changed, 23 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 4ee708264f3b..a2cb23dea0b8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -638,7 +638,7 @@ static int dpu_encoder_virt_atomic_check(
>   
>   		if (!crtc_state->active_changed || crtc_state->enable)
>   			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> -					drm_enc, crtc_state, topology);
> +					drm_enc, crtc_state, &topology);
>   	}
>   
>   	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index f4dda88a73f7..952e139c0234 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -24,15 +24,6 @@ static inline bool reserved_by_other(uint32_t *res_map, int idx,
>   	return res_map[idx] && res_map[idx] != enc_id;
>   }
>   
> -/**
> - * struct dpu_rm_requirements - Reservation requirements parameter bundle
> - * @topology:  selected topology for the display
> - * @hw_res:	   Hardware resources required as reported by the encoders
> - */
> -struct dpu_rm_requirements {
> -	struct msm_display_topology topology;
> -};
> -
>   int dpu_rm_destroy(struct dpu_rm *rm)
>   {
>   	int i;
> @@ -329,14 +320,13 @@ static bool _dpu_rm_check_lm_peer(struct dpu_rm *rm, int primary_idx,
>    *      mixer in rm->pingpong_blks[].
>    * @dspp_idx: output parameter, index of dspp block attached to the layer
>    *      mixer in rm->dspp_blks[].
> - * @reqs: input parameter, rm requirements for HW blocks needed in the
> - *      datapath.
> + * @topology:  selected topology for the display
>    * Return: true if lm matches all requirements, false otherwise
>    */
>   static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
>   		struct dpu_global_state *global_state,
>   		uint32_t enc_id, int lm_idx, int *pp_idx, int *dspp_idx,
> -		struct dpu_rm_requirements *reqs)
> +		struct msm_display_topology *topology)
>   {
>   	const struct dpu_lm_cfg *lm_cfg;
>   	int idx;
> @@ -361,7 +351,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
>   	}
>   	*pp_idx = idx;
>   
> -	if (!reqs->topology.num_dspp)
> +	if (!topology->num_dspp)
>   		return true;
>   
>   	idx = lm_cfg->dspp - DSPP_0;
> @@ -383,7 +373,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
>   static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>   			       struct dpu_global_state *global_state,
>   			       uint32_t enc_id,
> -			       struct dpu_rm_requirements *reqs)
> +			       struct msm_display_topology *topology)
>   
>   {
>   	int lm_idx[MAX_BLOCKS];
> @@ -391,14 +381,14 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>   	int dspp_idx[MAX_BLOCKS] = {0};
>   	int i, j, lm_count = 0;
>   
> -	if (!reqs->topology.num_lm) {
> -		DPU_ERROR("invalid number of lm: %d\n", reqs->topology.num_lm);
> +	if (!topology->num_lm) {
> +		DPU_ERROR("invalid number of lm: %d\n", topology->num_lm);
>   		return -EINVAL;
>   	}
>   
>   	/* Find a primary mixer */
>   	for (i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
> -			lm_count < reqs->topology.num_lm; i++) {
> +			lm_count < topology->num_lm; i++) {
>   		if (!rm->mixer_blks[i])
>   			continue;
>   
> @@ -407,7 +397,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>   
>   		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,
>   				enc_id, i, &pp_idx[lm_count],
> -				&dspp_idx[lm_count], reqs)) {
> +				&dspp_idx[lm_count], topology)) {
>   			continue;
>   		}
>   
> @@ -415,7 +405,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>   
>   		/* Valid primary mixer found, find matching peers */
>   		for (j = i + 1; j < ARRAY_SIZE(rm->mixer_blks) &&
> -				lm_count < reqs->topology.num_lm; j++) {
> +				lm_count < topology->num_lm; j++) {
>   			if (!rm->mixer_blks[j])
>   				continue;
>   
> @@ -428,7 +418,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>   			if (!_dpu_rm_check_lm_and_get_connected_blks(rm,
>   					global_state, enc_id, j,
>   					&pp_idx[lm_count], &dspp_idx[lm_count],
> -					reqs)) {
> +					topology)) {
>   				continue;
>   			}
>   
> @@ -437,7 +427,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>   		}
>   	}
>   
> -	if (lm_count != reqs->topology.num_lm) {
> +	if (lm_count != topology->num_lm) {
>   		DPU_DEBUG("unable to find appropriate mixers\n");
>   		return -ENAVAIL;
>   	}
> @@ -446,7 +436,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>   		global_state->mixer_to_enc_id[lm_idx[i]] = enc_id;
>   		global_state->pingpong_to_enc_id[pp_idx[i]] = enc_id;
>   		global_state->dspp_to_enc_id[dspp_idx[i]] =
> -			reqs->topology.num_dspp ? enc_id : 0;
> +			topology->num_dspp ? enc_id : 0;
>   
>   		trace_dpu_rm_reserve_lms(lm_idx[i] + LM_0, enc_id,
>   					 pp_idx[i] + PINGPONG_0);
> @@ -539,44 +529,30 @@ static int _dpu_rm_make_reservation(
>   		struct dpu_rm *rm,
>   		struct dpu_global_state *global_state,
>   		struct drm_encoder *enc,
> -		struct dpu_rm_requirements *reqs)
> +		struct msm_display_topology *topology)
>   {
>   	int ret;
>   
> -	ret = _dpu_rm_reserve_lms(rm, global_state, enc->base.id, reqs);
> +	ret = _dpu_rm_reserve_lms(rm, global_state, enc->base.id, topology);
>   	if (ret) {
>   		DPU_ERROR("unable to find appropriate mixers\n");
>   		return ret;
>   	}
>   
>   	ret = _dpu_rm_reserve_ctls(rm, global_state, enc->base.id,
> -				&reqs->topology);
> +				   topology);
>   	if (ret) {
>   		DPU_ERROR("unable to find appropriate CTL\n");
>   		return ret;
>   	}
>   
> -	ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, &reqs->topology);
> +	ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, topology);
>   	if (ret)
>   		return ret;
>   
>   	return ret;
>   }
>   
> -static int _dpu_rm_populate_requirements(
> -		struct drm_encoder *enc,
> -		struct dpu_rm_requirements *reqs,
> -		struct msm_display_topology req_topology)
> -{
> -	reqs->topology = req_topology;
> -
> -	DRM_DEBUG_KMS("num_lm: %d num_dsc: %d num_intf: %d\n",
> -		      reqs->topology.num_lm, reqs->topology.num_dsc,
> -		      reqs->topology.num_intf);
> -
> -	return 0;
> -}
> -
>   static void _dpu_rm_clear_mapping(uint32_t *res_mapping, int cnt,
>   				  uint32_t enc_id)
>   {
> @@ -608,9 +584,8 @@ int dpu_rm_reserve(
>   		struct dpu_global_state *global_state,
>   		struct drm_encoder *enc,
>   		struct drm_crtc_state *crtc_state,
> -		struct msm_display_topology topology)
> +		struct msm_display_topology *topology)
>   {
> -	struct dpu_rm_requirements reqs;
>   	int ret;
>   
>   	/* Check if this is just a page-flip */
> @@ -625,13 +600,11 @@ int dpu_rm_reserve(
>   	DRM_DEBUG_KMS("reserving hw for enc %d crtc %d\n",
>   		      enc->base.id, crtc_state->crtc->base.id);
>   
> -	ret = _dpu_rm_populate_requirements(enc, &reqs, topology);
> -	if (ret) {
> -		DPU_ERROR("failed to populate hw requirements\n");
> -		return ret;
> -	}
> +	DRM_DEBUG_KMS("num_lm: %d num_dsc: %d num_intf: %d\n",
> +		      topology->num_lm, topology->num_dsc,
> +		      topology->num_intf);
>   
> -	ret = _dpu_rm_make_reservation(rm, global_state, enc, &reqs);
> +	ret = _dpu_rm_make_reservation(rm, global_state, enc, topology);
>   	if (ret)
>   		DPU_ERROR("failed to reserve hw resources: %d\n", ret);
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> index d62c2edb2460..f05697462856 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -71,7 +71,7 @@ int dpu_rm_reserve(struct dpu_rm *rm,
>   		struct dpu_global_state *global_state,
>   		struct drm_encoder *drm_enc,
>   		struct drm_crtc_state *crtc_state,
> -		struct msm_display_topology topology);
> +		struct msm_display_topology *topology);
>   
>   /**
>    * dpu_rm_reserve - Given the encoder for the display chain, release any
