Return-Path: <linux-arm-msm+bounces-48101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E344A369FC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2025 01:29:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 352CA16AE96
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2025 00:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9CD9C2C6;
	Sat, 15 Feb 2025 00:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jMRCGHR1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA41125DF;
	Sat, 15 Feb 2025 00:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739579373; cv=none; b=Yi9Q4wfULD7JHf4nmndqQmrklPIiI7/+tkDxnP8qnBPraco5sE06Upe0kzgLnwSyvQ9dPV3dysEun7jp52rdFNoVIymIfoss7hG2gURleeBeszlJUl6LCtp8pxeg7k/5njmxF/r0/63akiVHBhtV1+kHbeNd2xEsYGsu8BGOQ/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739579373; c=relaxed/simple;
	bh=GuNx2Z3uJBQtv6Qev+gXMMSuIMi/Fco3czHQilJGxa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lpgCTSh3LV/4xcjuIgJjbus5VeCrAEkxUa3CNNbeWLgpRvwreatJaDbDudPRpf6j8CmO7xB2aRQy3bNtEWXjOahyH8wDKYes8GptaHkXiRwCcm5DSNzZS12imEW45kXY0Twri4AC06dfdkEnhPigAcxKjJ/qP8q9+qrBoNxHYBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jMRCGHR1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51EFc958032643;
	Sat, 15 Feb 2025 00:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zE58FpoFfDod10NyrKWj8KdGYm7rT2zy62HSSJ0iwFM=; b=jMRCGHR1K9UPZRq+
	gmwUAd3N3Pyc/pAY5eeQaO47mRBVZzKrfj21s3ljpvthx/ikNBB3iApWpjl2kzGH
	6GdUQG27oHAfPxXENIJJEYj4WBkdNRdmmeIAcCPPVHLmJkOAYQB537aD+7ItIYon
	QtVAOkXNYsCukKwIXGBk7EBxGWxBumdPhri/DF403/hWmloPswBsI1KCjFM97+ld
	eYNgltcZvc8OKn1MbkgFa+0zJxDJMo2f0t7rjP9yMjUlAOD8Y2YR9C5hlHG0dzqa
	gMkCaLjlce3u0QqMpmhz9Xn9g3NEvRj29IeZnDQEgJcAFPUzhB487ZRah4THM4Hp
	+hctZw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sc7bdk06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 00:29:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51F0TPSM028360
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 00:29:25 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 14 Feb
 2025 16:29:24 -0800
Message-ID: <a7480f8b-9f56-4f1d-a4d2-0760a516fe9a@quicinc.com>
Date: Fri, 14 Feb 2025 16:29:24 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/15] drm/msm/dpu: decide right side per last bit
Content-Language: en-US
To: Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>,
        "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
 <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-5-9701a16340da@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-5-9701a16340da@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _RsY9CC0vj4yEI0teLxAF5HLY0rqmG94
X-Proofpoint-GUID: _RsY9CC0vj4yEI0teLxAF5HLY0rqmG94
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_10,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 phishscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502150002



On 1/17/2025 8:00 AM, Jun Nie wrote:
> Currently, only one pair of mixers is supported, so a non-zero counter
> value is sufficient to identify the correct mixer within that pair.
> However, future implementations may involve multiple mixer pairs. With
> the current implementation, all mixers within the second pair would be
> incorrectly selected as right mixer. To correctly select the mixer
> within a pair, test the least significant bit of the counter. If the
> least significant bit is not set, select the mixer as left one;
> otherwise, select the mixer as right one for all pairs.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 7191b1a6d41b3..41c9d3e3e3c7c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -369,11 +369,10 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
>   static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
>   {
>   	struct dpu_crtc_state *crtc_state;
> -	int lm_idx, lm_horiz_position;
> +	int lm_idx;
>   
>   	crtc_state = to_dpu_crtc_state(crtc->state);
>   
> -	lm_horiz_position = 0;
>   	for (lm_idx = 0; lm_idx < crtc_state->num_mixers; lm_idx++) {
>   		const struct drm_rect *lm_roi = &crtc_state->lm_bounds[lm_idx];
>   		struct dpu_hw_mixer *hw_lm = crtc_state->mixers[lm_idx].hw_lm;
> @@ -384,7 +383,7 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
>   
>   		cfg.out_width = drm_rect_width(lm_roi);
>   		cfg.out_height = drm_rect_height(lm_roi);
> -		cfg.right_mixer = lm_horiz_position++;
> +		cfg.right_mixer = lm_idx & 0x1;
>   		cfg.flags = 0;
>   		hw_lm->ops.setup_mixer_out(hw_lm, &cfg);
>   	}
> 
> -- 
> 2.34.1
> 


