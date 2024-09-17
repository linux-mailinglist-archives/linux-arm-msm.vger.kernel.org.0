Return-Path: <linux-arm-msm+bounces-31877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A274F97AA13
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 03:04:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4B751C220E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 01:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD7F4683;
	Tue, 17 Sep 2024 01:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U0UMIsUI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D2AA48
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2024 01:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726535061; cv=none; b=RHQJpsAXWu3p6RKqd7kCs/2r6smcgqwQZgpFtnUwhNEWDven1CeNsM54qXMJHoaoXtwagt8fZ10wUobig4SzkJyswHq+qMqBafH8E889wNsW96biiKqesO9eEWqcWnQIUPMu+ZTKwqNDCtAzXJ/GgimXB/hSD/UrvX0LW/BmOg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726535061; c=relaxed/simple;
	bh=eSU22PZ4rAW9E0ztTiI4wJmzaT5zuMtRMTeUgbG6ytQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=U5fVHfMxY9x/Ic+yeABdTGNYROOwYwTTSWwyj/9JnGRf0VZLMi7tCll0mW+lbEk7xBCVyDhI8mPZ4eDlRJcoMQKrUvQqsU3Mwv3eHuh6j2HN/0rZq5byP0WYzLv93M2rjwh0x3z8PzlROJz7pVllRlOGguogYS1N0c0af/2yWgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U0UMIsUI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48GCb4PK023049;
	Tue, 17 Sep 2024 01:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RIjcs/lkCKO0DngqrvlacQKsm5iaKs5CW6LFgqAGDkM=; b=U0UMIsUI3lzofJtD
	Yn4n+i03qDwv3xsaeM4z9/F1ugw7UU6TWXsvNmNbVCRxmdCmzxDcCMSBcQph2FuX
	qJL924CgpBt9XFWEmORMhwxsKgmAn+yDaqngFJ0TgjXCxagh3ctM7b+XOUW3LIvJ
	T4JLyZHgS6vrxkjN5TnD7lpoEs1u9+VuRcnXGeVB/aI8d04xsQx4HfZ1r19Znx7Y
	EbKmfScsPQX9pE0WjseLAcd/ACmGrP0dTx0tlOSc0JLjqhgEjZnkDJ4R+LUaJyja
	TbVBRRlNx8OEHNDRmd5zcURr2vlUCZocWWd+Epy4tK1f/+1NxinTYDqtzSgTm3+D
	1MhFXw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4jdnkkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 01:04:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48H149Ou006457
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 01:04:09 GMT
Received: from [10.110.75.131] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Sep
 2024 18:04:08 -0700
Message-ID: <013aa39c-90d3-464a-9cb2-d52be4e51f17@quicinc.com>
Date: Mon, 16 Sep 2024 18:04:08 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/15] drm/msm/dpu: move CRTC resource assignment to
 dpu_encoder_virt_atomic_check
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
References: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
 <20240903-dpu-mode-config-width-v6-2-617e1ecc4b7a@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240903-dpu-mode-config-width-v6-2-617e1ecc4b7a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Q04hhX1bzBFwzB7fRtufvctkIEArI2Qa
X-Proofpoint-GUID: Q04hhX1bzBFwzB7fRtufvctkIEArI2Qa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1015 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409170007



On 9/2/2024 8:22 PM, Dmitry Baryshkov wrote:
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

Mostly LGTM now, a couple of comments/questions below:

> Fixes: b107603b4ad0 ("drm/msm/dpu: map mixer/ctl hw blocks in encoder modeset")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  3 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 59 +++++++++++++++++++----------
>   2 files changed, 38 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 4c1be2f0555f..e81feb0d67f3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1091,9 +1091,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
>   
>   	dpu_core_perf_crtc_update(crtc, 0);
>   
> -	memset(cstate->mixers, 0, sizeof(cstate->mixers));
> -	cstate->num_mixers = 0;
> -

Note to myself: This chunk will conflict with 
https://patchwork.freedesktop.org/patch/611385/, we will need to remove 
this part in the CWB series when its rebased.

>   	/* disable clk & bw control until clk & bw properties are set */
>   	cstate->bw_control = false;
>   	cstate->bw_split_vote = false;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 949ebda2fa82..bd3698bf0cf7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -624,6 +624,40 @@ static struct msm_display_topology dpu_encoder_get_topology(
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
> +		cstate->mixers[i].hw_dspp = i < num_dspp ? to_dpu_hw_dspp(hw_dspp[i]) : NULL;
> +	}
> +
> +	cstate->num_mixers = num_lm;
> +}
> +
>   static int dpu_encoder_virt_atomic_check(
>   		struct drm_encoder *drm_enc,
>   		struct drm_crtc_state *crtc_state,
> @@ -692,6 +726,9 @@ static int dpu_encoder_virt_atomic_check(
>   		if (!crtc_state->active_changed || crtc_state->enable)
>   			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
>   					drm_enc, crtc_state, topology);
> +		if (!ret)
> +			dpu_encoder_assign_crtc_resources(dpu_kms, drm_enc,
> +							  global_state, crtc_state);
>   	}

This is now under the drm_atomic_crtc_needs_modeset() condition which is 
good, but shouldnt this also move under the same if condition as 
dpu_rm_reserve()? There cannot be any assignment without reservation right?

>   

<snip>

