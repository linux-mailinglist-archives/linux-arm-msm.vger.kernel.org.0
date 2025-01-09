Return-Path: <linux-arm-msm+bounces-44514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA63A06DA5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 06:38:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AA893A6A1C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 05:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD11321421C;
	Thu,  9 Jan 2025 05:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EgpBfsU/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F23233C9;
	Thu,  9 Jan 2025 05:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736401122; cv=none; b=dk4Ik1NuNvTaVvIJhXppDIMFsEOrwJW7CulFYx+QMpjCw7FeUELfkTY8awxiivaaj7ioCmCJ4bkP9WGKbhvoWm1piqLN6kqGWSaUI/qofmObCUnM3vufNDp6bLUWudNuHMN72B5f5JwB6dZzzdb7ILlLTN96qQ5W+j6pu4UoxAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736401122; c=relaxed/simple;
	bh=sXUhneW5W2AEZ7+X3AoRxUqyQAg83YJP+Gt+iEYloTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MjI2G6aNiYAoLnZm66hdtoolMnRCYGHHS5VNCZOkBPWh6JzMYmMM+3NHUqlAy7j8yk3eia6h1JedFH2w1RfmL9t+wWlUKlerw9CRQHSXdZW/lge3U18rGij9xm5ssT0B1oi1cWCcNveQd+J0ViHCWknRRtKARDs68SK8R/BrLeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EgpBfsU/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508IhbSs009782;
	Thu, 9 Jan 2025 05:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7bcBrUGZU3oSdj+RMaXnYeauDYK8CRFSZRzCt4FDK1I=; b=EgpBfsU/C3jN/B5v
	fYppFGu5YCVrrgc9y8amuepa2B5u5ST0gJTxR9Nr2f4u9t1F+Et+xf8gWeUfPgku
	NFcDLuM2YyVQMhDvI+gR7Ipd9jZNNAh1AsSGtDwsf1H/rpA2pQULvCYyAlxC3pdo
	PJVpueiH3dGBvQeg/MsobWs7oJ9O+Af5Z5zpIYFjeTSu2guafKBhg141booOmVEY
	ed0G5ld+HnVR7ks3uFJr5vbJcic6V/dFS29E4MjQRMFqszWrOYc/dE+qs0cXA5SX
	YZT7KIoeMSvWEy/7NoYNFu0v5gkeXLYHwOm9fdcWo6La+bpa7mdfgRpptOvzLs7K
	XsTKfA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441xvns8bg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 05:37:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5095bPpn026692
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 05:37:25 GMT
Received: from [10.110.60.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 21:37:24 -0800
Message-ID: <a8159ad0-3d33-4331-899c-6728862a728a@quicinc.com>
Date: Wed, 8 Jan 2025 21:37:23 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/msm/dpu: don't use active in atomic_check()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Jordan Crouse
	<jordan@cosmicpenguin.net>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Archit
 Taneja <architt@codeaurora.org>,
        Rajesh Yadav <ryadav@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>,
        Simona
 Vetter <simona.vetter@ffwll.ch>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <20241222-drm-dirty-modeset-v1-3-0e76a53eceb9@linaro.org>
 <b4f1d7c2-c9eb-4b9a-b8b7-f335910601d8@quicinc.com>
 <vhqmcb6fu6mfmbjo3jyjdhzpowhvnxbtxg2osk42xwogrsylku@5hvs6mtizqcr>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <vhqmcb6fu6mfmbjo3jyjdhzpowhvnxbtxg2osk42xwogrsylku@5hvs6mtizqcr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: K-77J62A8fTO3UPPxfgqcT_bmKbYGZbG
X-Proofpoint-ORIG-GUID: K-77J62A8fTO3UPPxfgqcT_bmKbYGZbG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090044



On 1/8/2025 8:22 PM, Dmitry Baryshkov wrote:
> On Wed, Jan 08, 2025 at 05:19:40PM -0800, Abhinav Kumar wrote:
>>
>>
>> On 12/21/2024 9:00 PM, Dmitry Baryshkov wrote:
>>> The driver isn't supposed to consult crtc_state->active/active_check for
>>> resource allocation. Instead all resources should be allocated if
>>> crtc_state->enabled is set. Stop consulting active / active_changed in
>>> order to determine whether the hardware resources should be
>>> (re)allocated.
>>>
>>> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
>>> Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
>>> Closes: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 4 ----
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 +--
>>>    2 files changed, 1 insertion(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> index 7191b1a6d41b3a96f956d199398f12b2923e8c82..65e33eba61726929b740831c95330756b2817e28 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> @@ -1264,10 +1264,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>>>    	DRM_DEBUG_ATOMIC("%s: check\n", dpu_crtc->name);
>>> -	/* force a full mode set if active state changed */
>>> -	if (crtc_state->active_changed)
>>> -		crtc_state->mode_changed = true;
>>> -
>>>    	if (cstate->num_mixers) {
>>>    		rc = _dpu_crtc_check_and_setup_lm_bounds(crtc, crtc_state);
>>>    		if (rc)
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> index 83de7564e2c1fe14fcf8c4f82335cafc937e1b99..d1ccdca6044353f110bf5b507788efe368f223a3 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> @@ -793,12 +793,11 @@ static int dpu_encoder_virt_atomic_check(
>>>    		crtc_state->mode_changed = true;
>>>    	/*
>>>    	 * Release and Allocate resources on every modeset
>>> -	 * Dont allocate when active is false.
>>>    	 */
>>>    	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>>>    		dpu_rm_release(global_state, drm_enc);
>>> -		if (!crtc_state->active_changed || crtc_state->enable)
>>
>> I think this was leftover code.
>>
>> What happened was, we used to have dpu_rm_reserve() both in dpu_encoder's
>> atomic_check and mode_set. Hence this is checking !active_changed because
>> that case was expected to get handled in mode_set to avoid duplicate
>> dpu_rm_reserve() calls. Code has progressed since then to drop the
>> dpu_rm_reserve() from mode_set and only use atomic_check.
>>
>> So the correct fixes tag for this should be:
>>
>> Fixes: de3916c70a24 ("drm/msm/dpu: Track resources in global state")
> 
> Actually it should be:
> 
> Fixes: ccc862b957c6 ("drm/msm/dpu: Fix reservation failures in modeset")
> 

Ack.

>> With that addressed, this is
>>
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>>> +		if (crtc_state->enable)
>>>    			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
>>>    					drm_enc, crtc_state, topology);
>>>    		if (!ret)
>>>
> 

