Return-Path: <linux-arm-msm+bounces-21512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3CB8D8B1C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 22:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F18C1C2105E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 20:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95AE11386D0;
	Mon,  3 Jun 2024 20:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UfP4IDxF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2C546436
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jun 2024 20:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717448246; cv=none; b=jWJh+tF0aq8oTuq7VR3z5L5kAJBUfW6m1VNMyeEUx6D7nRVyiOBUFMDGk/O355W3WDh/ougBpCUb37Vy9hsWTiM32n2A9EeIlJgfdeWKsND4BRDgdXqkPGj4aGt7W4Re4WYdTlACyutVYSEbujgCjpJXFW+LG92Ey/PAUsZR/uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717448246; c=relaxed/simple;
	bh=CylYCpkwn1CFE3OviiFzvgdwER3KidxQ24kMUu1WG4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YCvd7JXs5wQPh1B5eQcJNoBiZveYk84hTWvAsTPF5lkjdXLAWl8cPqeyJw3sGymdzaKP/JcbgFeJiKFeUzWNyPVH0sHN1ddFGpDKfy2eGm+dPOm4rXywKjrBBUe9wgGa2TjHeWGHhBzXrZ8ahQT09R1JbuuGv9O5NUu1fITqQMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UfP4IDxF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453BYMvG013088;
	Mon, 3 Jun 2024 20:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pl0vB4COwHKnjA6ZmsmMssilcx+pThwANLfiRS86IgE=; b=UfP4IDxFqzAF9UAD
	bvXwnWldXuxVsTvnQCfVpX93IFj2kMaTvwgXkOXMlcrjHkqPVWlV+G3d0/o2M5Rf
	nWxS4EzJ/DQlczqSgfQotnbL8HWNVtm16a1KZMiBD6U6KPSAl9ea5AXpC8JAp+OL
	Zc1BvQDzmdzGJQdVCPenTTZsOcQZw1VcEchKp+cTbzDrSXTE5gpf54YG4yRCMtQf
	sX41DdOAGGInkJ6KwLmogorpfYg6Gz3O7oMi1uLAJA5vyLIBEdFBL+2qDTSm30Px
	v8u8z825HRCIKZ+YY6idmxwT2lOtYK3tQPQKqlAB8aUJMcSh1eJuNTXT5tAsA1OL
	2dUmAw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw4d55a1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 20:57:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 453KvCoX024844
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 20:57:12 GMT
Received: from [10.110.31.89] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 13:57:08 -0700
Message-ID: <64c6e6a5-7ab2-cdf7-131a-7a1f79c48e0c@quicinc.com>
Date: Mon, 3 Jun 2024 13:57:06 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 7/9] drm/msm/dpu: check for overflow in
 _dpu_crtc_setup_lm_bounds()
Content-Language: en-US
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
References: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
 <20240603-dpu-mode-config-width-v2-7-16af520575a6@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240603-dpu-mode-config-width-v2-7-16af520575a6@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ylRLMhHsTVsR04KqndAvEqxlORUYuJGo
X-Proofpoint-GUID: ylRLMhHsTVsR04KqndAvEqxlORUYuJGo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_17,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxscore=0 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030169



On 6/2/2024 2:39 PM, Dmitry Baryshkov wrote:
> Check in _dpu_crtc_setup_lm_bounds() that CRTC width is not overflowing
> LM requirements.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index e3b1e5f55a92..c5e874a3656a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -711,12 +711,13 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc)
>   	_dpu_crtc_complete_flip(crtc);
>   }
>   
> -static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
> +static int _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
>   		struct drm_crtc_state *state)

Perhaps now we need to rename this to _dpu_crtc_setup_and_check_lm_bounds()?

Also, prior to this change, we never had a bounds check for each LM 
which we should have had . Does this qualify for a Fixes tag?

With those two questions addressed,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

>   {
>   	struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
>   	struct drm_display_mode *adj_mode = &state->adjusted_mode;
>   	u32 crtc_split_width = adj_mode->hdisplay / cstate->num_mixers;
> +	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
>   	int i;
>   
>   	for (i = 0; i < cstate->num_mixers; i++) {
> @@ -727,7 +728,12 @@ static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
>   		r->y2 = adj_mode->vdisplay;
>   
>   		trace_dpu_crtc_setup_lm_bounds(DRMID(crtc), i, r);
> +
> +		if (drm_rect_width(r) > dpu_kms->catalog->caps->max_mixer_width)
> +			return -E2BIG;
>   	}

> +
> +	return 0;
>   }
>   
>   static void _dpu_crtc_get_pcc_coeff(struct drm_crtc_state *state,
> @@ -1195,8 +1201,11 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>   	if (crtc_state->active_changed)
>   		crtc_state->mode_changed = true;
>   
> -	if (cstate->num_mixers)
> -		_dpu_crtc_setup_lm_bounds(crtc, crtc_state);
> +	if (cstate->num_mixers) {
> +		rc = _dpu_crtc_setup_lm_bounds(crtc, crtc_state);
> +		if (rc)
> +			return rc;
> +	}
>   
>   	/* FIXME: move this to dpu_plane_atomic_check? */
>   	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
> 

