Return-Path: <linux-arm-msm+bounces-32384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE7E984F7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 02:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 135F6284F60
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 00:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA75B4A35;
	Wed, 25 Sep 2024 00:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hjx96HaY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1AE522A;
	Wed, 25 Sep 2024 00:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727224668; cv=none; b=qaXyeWdb4ZkLnn8pTGGhD5wWCfBPIcMCj707ZT8FTojJt12uYrtm5S34aq8D2wiUffvBUYg5WR+CvSx2gGxiwexvHLracwl774uTdr98EDYMdkgcJ4e9JCzhnCJniKS2IJz9senLiI8b8WrYlEb56D7869QnIvxSSmuEe1zWypU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727224668; c=relaxed/simple;
	bh=MGKJFqSgRfm1LhNQtQpW+cwNuejuqjlyVAK/N+9HpiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=a1Qn6sus/6Vjy7survMbyot3/Jw6ZJKly0H1ep+PBiq2uIijKkM3CLAMiz3Le2HQN/Mpb0If6XfT6tTAYYDqQipJtO51ZO/OosihG8Tn6cFNNjYqZPBgW7MmKdfU96FokTeLXJ1VN7nmW4zNhfJV6/9cev8MXBKNO9T3tVKX1SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hjx96HaY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OHdoXN022456;
	Wed, 25 Sep 2024 00:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uNOf3COHn0bIsLWrIadnW2A3V8HXRfc81kvgsrrZB4o=; b=hjx96HaYaeFIA+KV
	MaM8dwfMuHRQDamle5jCmMd0ATXteIeHF55rk8ATIQmQNj+lWHHmiDIKIvJh5hmt
	GjEvsnwCICbSumyiqa5HdYrxD2xaUubo0QRAeRqiHfi04lguYe/qib/miOFK46sA
	SQQPbptShe499CQK4S7bhHwyPV8OB3bo8Y1rABnFH8C1ASGqyFDpoXyB7ehfKluM
	JtQG4/yvnUEmuQdhSaMpYn2fvQl8VBZ/xCUEztsnYK+Ck3cKc/BFEaTr/ssklyR8
	fsMykd24HHbT5Xir8JUtoLcYUJmX0XS+/v35LhGaSid+2n4bhkQt9PB1EP81boTJ
	eoHAdQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sn5btfym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 00:37:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48P0bVY9027775
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 00:37:31 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Sep
 2024 17:37:31 -0700
Message-ID: <b66264a9-2ff9-482a-96e0-453d55bc651c@quicinc.com>
Date: Tue, 24 Sep 2024 17:37:30 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/22] drm/msm/dpu: fill CRTC resources in dpu_crtc.c
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>,
        Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, <quic_ebharadw@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-6-7849f900e863@quicinc.com>
 <4c7spborzltmvjlbd2o4uwknraitjtf34mqt7r3x2ospnaidyn@abvn5zdumvwt>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <4c7spborzltmvjlbd2o4uwknraitjtf34mqt7r3x2ospnaidyn@abvn5zdumvwt>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: eGsEoOCcY7dzNRywb8eBCU-fOIwFykQO
X-Proofpoint-GUID: eGsEoOCcY7dzNRywb8eBCU-fOIwFykQO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250002



On 9/24/2024 4:16 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 24, 2024 at 03:59:22PM GMT, Jessica Zhang wrote:
>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> Stop poking into CRTC state from dpu_encoder.c, fill CRTC HW resources
>> from dpu_crtc_assign_resources().
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> [quic_abhinavk@quicinc.com: cleaned up formatting]
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> [quic_jesszhan@quicinc.com: dropped clearing num_mixers in CRTC disable
>> path]
> 
> Same comment as before: the code is still there.

Hi Dmitry,

I thought the original comment was to move the dropping `num_mixers = 0` 
chunk from the previous patch to this one?

Sorry if I misunderstood.

Thanks,

Jessica Zhang

> 
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 32 ++++++++++++++++++++++++++---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 24 ++--------------------
>>   2 files changed, 31 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index b918c80d30b3..d53e986eee54 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -1091,9 +1091,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
>>   
>>   	dpu_core_perf_crtc_update(crtc, 0);
>>   
>> -	memset(cstate->mixers, 0, sizeof(cstate->mixers));
>> -	cstate->num_mixers = 0;
>> -
>>   	/* disable clk & bw control until clk & bw properties are set */
>>   	cstate->bw_control = false;
>>   	cstate->bw_split_vote = false;
>> @@ -1164,6 +1161,7 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
>>   }
>>   
>>   #define MAX_HDISPLAY_SPLIT 1080
>> +#define MAX_CHANNELS_PER_CRTC 2
>>   
>>   static struct msm_display_topology dpu_crtc_get_topology(
>>   		struct drm_crtc *crtc,
>> @@ -1208,9 +1206,14 @@ static struct msm_display_topology dpu_crtc_get_topology(
>>   
>>   static int dpu_crtc_assign_resources(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
>>   {
>> +	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_CRTC];
>> +	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_CRTC];
>> +	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_CRTC];
>> +	int i, num_lm, num_ctl, num_dspp;
>>   	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
>>   	struct dpu_global_state *global_state;
>>   	struct msm_display_topology topology;
>> +	struct dpu_crtc_state *cstate;
>>   	int ret;
>>   
>>   	/*
>> @@ -1232,6 +1235,29 @@ static int dpu_crtc_assign_resources(struct drm_crtc *crtc, struct drm_crtc_stat
>>   	if (ret)
>>   		return ret;
>>   
>> +	cstate = to_dpu_crtc_state(crtc_state);
>> +
>> +	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>> +						crtc, DPU_HW_BLK_CTL, hw_ctl,
>> +						ARRAY_SIZE(hw_ctl));
>> +	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>> +					       crtc, DPU_HW_BLK_LM, hw_lm,
>> +					       ARRAY_SIZE(hw_lm));
>> +	num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>> +						 crtc, DPU_HW_BLK_DSPP, hw_dspp,
>> +						 ARRAY_SIZE(hw_dspp));
>> +
>> +	for (i = 0; i < num_lm; i++) {
>> +		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
>> +
>> +		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
>> +		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
>> +		if (i < num_dspp)
>> +			cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
>> +	}
>> +
>> +	cstate->num_mixers = num_lm;
>> +
>>   	return 0;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index ada9119326ca..36b677cf9c7a 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -1049,14 +1049,11 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>   	struct dpu_encoder_virt *dpu_enc;
>>   	struct msm_drm_private *priv;
>>   	struct dpu_kms *dpu_kms;
>> -	struct dpu_crtc_state *cstate;
>>   	struct dpu_global_state *global_state;
>>   	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
>>   	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
>> -	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
>> -	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
>>   	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
>> -	int num_lm, num_ctl, num_pp, num_dsc;
>> +	int num_pp, num_dsc;
>>   	unsigned int dsc_mask = 0;
>>   	int i;
>>   
>> @@ -1083,13 +1080,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>   	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>>   		drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
>>   		ARRAY_SIZE(hw_pp));
>> -	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>> -		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
>> -	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>> -		drm_enc->crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
>>   	dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>> -		drm_enc->crtc, DPU_HW_BLK_DSPP, hw_dspp,
>> -		ARRAY_SIZE(hw_dspp));
>> +			drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> 
> Please don't mix reindentation with the actual changes. It makes it
> harder to read.
> 
>>   
>>   	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
>>   		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
>> @@ -1115,18 +1107,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>   		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
>>   	}
>>   
>> -	cstate = to_dpu_crtc_state(crtc_state);
>> -
>> -	for (i = 0; i < num_lm; i++) {
>> -		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
>> -
>> -		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
>> -		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
>> -		cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
>> -	}
>> -
>> -	cstate->num_mixers = num_lm;
>> -
>>   	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>>   		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>>   
>>
>> -- 
>> 2.34.1
>>
> 
> -- 
> With best wishes
> Dmitry


