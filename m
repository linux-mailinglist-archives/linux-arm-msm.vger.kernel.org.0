Return-Path: <linux-arm-msm+bounces-34234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8B999BE1F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 05:21:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DCC4282B8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 03:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7966C231C98;
	Mon, 14 Oct 2024 03:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bc6rfAxf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D835336D
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 03:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728876102; cv=none; b=c/MviTNDWkYCCys9hrO0+b9BN+EuTLoxNS/zXRM+h2ymslfTKJS6WN1+IkIMIyRignCnlZK7h4PcKerlOZPU7Pyn78qNWqpf2xtlbxPR2eqM9q4iNuRe9iSYrw1HO/Wf6xqr3hv1C6zyeIfNiE6ItLDLtzYHTun6uW4eosCGbk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728876102; c=relaxed/simple;
	bh=m1EkoyoJlJpOp8MeeF5llszSc2GQq7u0IJn6t+UdD/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RsVNeKkp+nGI8LDsEG13HrXtWrwoff53VK+zxWc0BGvDDum6kmR9m8wbVMbzajlFf848i+TMwHE6xHMeVMusLDW1MXgSh4zK1URZTTEuFVLrD+FSNG5ku+g3fjUfMntoxNuVUI9BRrg3Hk/oRG2nSJ1efK3MOnVkzzJfiio8WPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bc6rfAxf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49DNMHTi031245;
	Mon, 14 Oct 2024 03:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q4gvL2zUBPGGrg+PzCvZiCS8riItarr19uLMZrH5LGA=; b=bc6rfAxfLE2SrKSa
	k2jTYCyjJxUq+0fce3Wwr1RUQ2c06g/S3Y4+BUGEtno6zuO/RRidLRdEekNq6R1j
	lSonbVIro++RfDUfmzhP+4bINNNUsUwELGmhehWpP/+BwWxYDEJB32XUxWpSFPWi
	qCU0fkFvODFasIiyRdZXi0y62ru+80AFp9bDyoLlNW6h/3dve42DuHgwTR51Mzr8
	wO3U3RWmT9IcmLnRJiD/TdTSnItgPeYwDls+XrR8CssLUwjKzf7hs/0p6Qpf5EX/
	B68gg5qfV4r9cldsxCzybC7t7iH9DN6prcGpXNnssphe1gi5QUqOaJ654SCEm26/
	/LvEYw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427jd8u2a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 03:21:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49E3LUoX028643
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 03:21:30 GMT
Received: from [10.110.109.95] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 13 Oct
 2024 20:21:29 -0700
Message-ID: <c7c22066-41de-485a-bb5f-767cfda358ef@quicinc.com>
Date: Sun, 13 Oct 2024 20:21:28 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/15] drm/msm/dpu: move CRTC resource assignment to
 dpu_encoder_virt_atomic_check
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn
 Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Abel Vesa <abel.vesa@linaro.org>,
        Johan
 Hovold <johan+linaro@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
 <20240903-dpu-mode-config-width-v6-2-617e1ecc4b7a@linaro.org>
 <013aa39c-90d3-464a-9cb2-d52be4e51f17@quicinc.com>
 <rpmp4pvv2fcg3iprcesco4a73vd457cdvlqtjtl6tzrmxkdlw6@jczni6cbi226>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <rpmp4pvv2fcg3iprcesco4a73vd457cdvlqtjtl6tzrmxkdlw6@jczni6cbi226>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6QVd3FivYl6KN5G2bLlbROMnaCFLCKcv
X-Proofpoint-ORIG-GUID: 6QVd3FivYl6KN5G2bLlbROMnaCFLCKcv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140023



On 9/16/2024 11:13 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 16, 2024 at 06:04:08PM GMT, Abhinav Kumar wrote:
>>
>>
>> On 9/2/2024 8:22 PM, Dmitry Baryshkov wrote:
>>> Historically CRTC resources (LMs and CTLs) were assigned in
>>> dpu_crtc_atomic_begin(). The commit 9222cdd27e82 ("drm/msm/dpu: move hw
>>> resource tracking to crtc state") simply moved resources to
>>> struct dpu_crtc_state, without changing the code sequence. Later on the
>>> commit b107603b4ad0 ("drm/msm/dpu: map mixer/ctl hw blocks in encoder
>>> modeset") rearanged the code, but still kept the cstate->num_mixers
>>> assignment to happen during commit phase. This makes dpu_crtc_state
>>> inconsistent between consequent atomic_check() calls.
>>>
>>> Move CRTC resource assignment to happen at the end of
>>> dpu_encoder_virt_atomic_check().
>>>
>>
>> Mostly LGTM now, a couple of comments/questions below:
>>
>>> Fixes: b107603b4ad0 ("drm/msm/dpu: map mixer/ctl hw blocks in encoder modeset")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  3 --
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 59 +++++++++++++++++++----------
>>>    2 files changed, 38 insertions(+), 24 deletions(-)
>>>
> 
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> index 949ebda2fa82..bd3698bf0cf7 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> @@ -624,6 +624,40 @@ static struct msm_display_topology dpu_encoder_get_topology(
>>>    	return topology;
>>>    }
>>> +static void dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
>>> +					      struct drm_encoder *drm_enc,
>>> +					      struct dpu_global_state *global_state,
>>> +					      struct drm_crtc_state *crtc_state)
>>> +{
>>> +	struct dpu_crtc_state *cstate;
>>> +	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
>>> +	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
>>> +	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC];
>>> +	int num_lm, num_ctl, num_dspp, i;
>>> +
>>> +	cstate = to_dpu_crtc_state(crtc_state);
>>> +
>>> +	memset(cstate->mixers, 0, sizeof(cstate->mixers));
>>> +
>>> +	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>>> +		drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
>>> +	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>>> +		drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
>>> +	num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>>> +		drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
>>> +		ARRAY_SIZE(hw_dspp));
>>> +
>>> +	for (i = 0; i < num_lm; i++) {
>>> +		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
>>> +
>>> +		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
>>> +		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
>>> +		cstate->mixers[i].hw_dspp = i < num_dspp ? to_dpu_hw_dspp(hw_dspp[i]) : NULL;
>>> +	}
>>> +
>>> +	cstate->num_mixers = num_lm;
>>> +}
>>> +
>>>    static int dpu_encoder_virt_atomic_check(
>>>    		struct drm_encoder *drm_enc,
>>>    		struct drm_crtc_state *crtc_state,
>>> @@ -692,6 +726,9 @@ static int dpu_encoder_virt_atomic_check(
>>>    		if (!crtc_state->active_changed || crtc_state->enable)
>>>    			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
>>>    					drm_enc, crtc_state, topology);
>>> +		if (!ret)
>>> +			dpu_encoder_assign_crtc_resources(dpu_kms, drm_enc,
>>> +							  global_state, crtc_state);
>>>    	}
>>
>> This is now under the drm_atomic_crtc_needs_modeset() condition which is
>> good, but shouldnt this also move under the same if condition as
>> dpu_rm_reserve()? There cannot be any assignment without reservation right?
> 
> Maybe it's not that obvious from the function name, but it will also
> clear previously assigned resources. So, I think it is correct to be
> called even if the resources were released without further assignment.
> 

Ack, yes I missed the dpu_rm_release() line just before it, hence

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

>>
>>
>> <snip>
> 

