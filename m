Return-Path: <linux-arm-msm+bounces-26396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A18D693344B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 00:40:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 229581F22C31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 22:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F1CD7346D;
	Tue, 16 Jul 2024 22:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RMCQaAPU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E9755885
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 22:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721169609; cv=none; b=ezIImQue7hklbSBb9PQMJUz2zirPyuB6mhQNd9F25WHEY0eyBv/x1frrGKoklsEI6dYkDnBADpWGHOy+drpJQhRHpLaAOmtCX4RkkUddfWuFlE7y3XhMR6A2TyxXe43j6aGbiFrh4HaMIbyd29BR1Sk6KGcyK0PdNmqRkktzxr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721169609; c=relaxed/simple;
	bh=LNMEh0QRsCddmNXba8i14idOUSAQaR6VXq0l9gt4UBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SlR5gAg7tLV+DbjXZ3UDpSPBrp3AeFN7bXWomWFfYlZilklvq3wuJ12Lz4Py+5X9Ft7UYLW1HoAVRRFtrsL57WKfGqlIlNLXqEizMwaLYjg0gOlRt//zW9giVXXdUqZ+s2yBGywClmlbXfDGgEkpFNtYOuZvuyFLRbFMdVH4ZSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RMCQaAPU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46GHfI7l024108;
	Tue, 16 Jul 2024 22:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YUeWnfYukI/qUolZSqFm46A7D57ayOEzLUIbBGxr2hY=; b=RMCQaAPULTjB5OR1
	eqW4oikhVP0GN6zQgqdjCxDsW18v9D+iAvmmgZmFmUkX2+Txg7OakC2iu3/ADozX
	3IR7Rfe6Lwb2oraRtCk2+lJXMcUI/EWAZzgRHlUPs2KHaPvotBIoWEwXVmxeqtr5
	SDVelSPvsNARZ7s7SjmPJg3YQF0fmGJyNAy2gXqaUihd4JzK0jTjen5/u02xde4f
	4w/0wVMsxonohe5nUT8BdKsXQ2iq6zXAyBlBy6BNswyQ+cKXLYRCd0zLNw+ub5NJ
	Th7TuD2t7jdmClyRLfYfLmbr3NhT++EpCKunoeebLuagMB5xEz/5ri7Hanwfhif4
	e+tb2Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfngha4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 22:39:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46GMdsbh015425
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 22:39:54 GMT
Received: from [10.71.110.34] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 16 Jul
 2024 15:39:54 -0700
Message-ID: <cd60db7e-4ff2-445e-a8f8-b22d73d0f2b3@quicinc.com>
Date: Tue, 16 Jul 2024 15:39:53 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/16] drm/msm/dpu: move CRTC resource assignment to
 dpu_encoder_virt_atomic_mode_set
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
 <20240625-dpu-mode-config-width-v5-3-501d984d634f@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240625-dpu-mode-config-width-v5-3-501d984d634f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Hhfr_2LJv-Ackefr5toNJFlxI5dZji25
X-Proofpoint-ORIG-GUID: Hhfr_2LJv-Ackefr5toNJFlxI5dZji25
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-16_02,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407160166



On 6/24/2024 2:13 PM, Dmitry Baryshkov wrote:
> Historically CRTC resources (LMs and CTLs) were assigned in
> dpu_crtc_atomic_begin(). The commit 9222cdd27e82 ("drm/msm/dpu: move hw
> resource tracking to crtc state") simply moved resources to
> struct dpu_crtc_state, without changing the code sequence. Later on the
> commit b107603b4ad0 ("drm/msm/dpu: map mixer/ctl hw blocks in encoder
> modeset") rearanged the code, but still kept the cstate->num_mixers
> assignment to happen during commit phase. This makes dpu_crtc_state
> inconsistent between consequent atomic_check() calls.
> 
> Move CRTC resource assignment to happen at the end of
> dpu_encoder_virt_atomic_check().
> 
> Fixes: b107603b4ad0 ("drm/msm/dpu: map mixer/ctl hw blocks in encoder modeset")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  3 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 60 +++++++++++++++++++----------
>   2 files changed, 39 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 9f2164782844..7399794d75eb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1094,9 +1094,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
>   	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
>   		dpu_encoder_register_frame_event_callback(encoder, NULL, NULL);
>   
> -	memset(cstate->mixers, 0, sizeof(cstate->mixers));
> -	cstate->num_mixers = 0;
> -

Any reason this part was removed?

I think we still need this part.

In dpu_encoder_get_topology(), we do not assign topology.num_lm based on 
state parameters, its based on catalog and intf_count which are decided 
at init time itself.

Which means cstate->num_mixers will remain at a non-zero value even if 
we have NO_MODE which is what happens when we are disabling the CRTC 
during suspend or hotplug.

>   	/* disable clk & bw control until clk & bw properties are set */
>   	cstate->bw_control = false;
>   	cstate->bw_split_vote = false;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 7613005fbfea..98f3a8d84300 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -628,6 +628,41 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   	return topology;
>   }
>   
> +static void dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
> +					      struct drm_encoder *drm_enc,
> +					      struct dpu_global_state *global_state,
> +					      struct drm_crtc_state *crtc_state)
> +{
> +	struct dpu_crtc_state *cstate;
> +	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> +	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> +	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC];
> +	int num_lm, num_ctl, num_dspp, i;
> +
> +	cstate = to_dpu_crtc_state(crtc_state);
> +
> +	memset(cstate->mixers, 0, sizeof(cstate->mixers));
> +
> +	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +		drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> +	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +		drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> +	num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +		drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
> +		ARRAY_SIZE(hw_dspp));
> +
> +	for (i = 0; i < num_lm; i++) {
> +		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
> +
> +		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
> +		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
> +		if (i < num_dspp)

Will there be a case where num_lm != num_dspp?

> +			cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
> +	}
> +
> +	cstate->num_mixers = num_lm;
> +}
> +
>   static int dpu_encoder_virt_atomic_check(
>   		struct drm_encoder *drm_enc,
>   		struct drm_crtc_state *crtc_state,
> @@ -698,6 +733,9 @@ static int dpu_encoder_virt_atomic_check(
>   					drm_enc, crtc_state, topology);
>   	}
>   
> +	if (!ret)
> +		dpu_encoder_assign_crtc_resources(dpu_kms, drm_enc, global_state, crtc_state);
> +
>   	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
>   
>   	return ret;
> @@ -1097,14 +1135,11 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   	struct dpu_encoder_virt *dpu_enc;
>   	struct msm_drm_private *priv;
>   	struct dpu_kms *dpu_kms;
> -	struct dpu_crtc_state *cstate;
>   	struct dpu_global_state *global_state;
>   	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
>   	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> -	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> -	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
>   	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> -	int num_lm, num_ctl, num_pp, num_dsc;
> +	int num_ctl, num_pp, num_dsc;
>   	unsigned int dsc_mask = 0;
>   	int i;
>   
> @@ -1133,11 +1168,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   		ARRAY_SIZE(hw_pp));
>   	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>   		drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> -	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> -		drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> -	dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> -		drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
> -		ARRAY_SIZE(hw_dspp));
>   
>   	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
>   		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
> @@ -1163,18 +1193,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
>   	}
>   
> -	cstate = to_dpu_crtc_state(crtc_state);
> -
> -	for (i = 0; i < num_lm; i++) {
> -		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
> -
> -		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
> -		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
> -		cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
> -	}
> -
> -	cstate->num_mixers = num_lm;
> -
>   	dpu_enc->connector = conn_state->connector;
>   
>   	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> 

