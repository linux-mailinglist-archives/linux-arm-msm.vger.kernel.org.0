Return-Path: <linux-arm-msm+bounces-48103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7D6A36A13
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2025 01:49:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E13597A22C7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2025 00:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A4926AFC;
	Sat, 15 Feb 2025 00:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hVB9BsLv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B006CEACE;
	Sat, 15 Feb 2025 00:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739580537; cv=none; b=IHoRqVTmMli5xLRWRr5yJT0RGCaugCi5Li2oNgerMe7KnNvanJxBCFqDv4nHPw1/JCzso0aUrvmxlWNN713Tm98ZO5DkNacz0jKqttlLagzStB6ubM85arD9OK5Vkese9heX7yFDs1DvoGIJwa+ua8oRVdGEaWL1y7wohJkaiGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739580537; c=relaxed/simple;
	bh=oF7epFmsstYIbvKZGuVYY4+F0Wb6tLz0FT60SUrhj0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KRRqLLaCNwwV1BofEabQlJ8zg+ockSP4PY2uo2kk8s6cp0m9risn57BlMyBWshlQXXASb9yDJWrp8nIe5q7SIyMJ0NDiBuQNcmqFSNkgZPp7LhuzjhQNCYnbMzpLZT8VXEq0CX3SxBZ7xd2MwHlCtTlOOCNzPSV6pxlug7Ma9mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hVB9BsLv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51EEDtsJ022230;
	Sat, 15 Feb 2025 00:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7lwpThfECIvAZjnVcZ1dcc9HeoXUXItIFQ6CI74TL78=; b=hVB9BsLvuVPlgnxn
	1JvhaNfAA1HfKOV7LorOaTyGhUTpdjb0bKmCdHhiMpoZJ9RlxdPpyhTR+5UUJb8O
	6zGdPvX7YC5QgCJ16wHWfZtJquE+ScBrpLjj/N4yJZhXpEEHb2UJRXNEgFiUBWXt
	e+gLeLOupawBnaOIGFGmFMFcIvHHYu+IfQCxXU3evOY19qhvn0wRdQt1dwsNaO8+
	BF4q0IkO8v1XXplonlYYGXozVhzD+RVdDc8T6yoEH428s/jSndLMZDGyAM5BjMu/
	BD9yMw3vucl3fMdxB6i5UflM9NVx3rK16kPN41YwFJGmo6tiARPZMQZblJUeIkgt
	h/FEog==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44t7d899v5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 00:48:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51F0mmql006478
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 00:48:48 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 14 Feb
 2025 16:48:48 -0800
Message-ID: <18840118-243c-40e2-9b74-226e515ae111@quicinc.com>
Date: Fri, 14 Feb 2025 16:48:47 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/15] drm/msm/dpu: fix mixer number counter on
 allocation
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
 <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-6-9701a16340da@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-6-9701a16340da@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2sMJ_qwPjn0YgeNhaTKkW8V_hKteTUhg
X-Proofpoint-ORIG-GUID: 2sMJ_qwPjn0YgeNhaTKkW8V_hKteTUhg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_10,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502150004



On 1/17/2025 8:00 AM, Jun Nie wrote:
> Current code only supports usage cases with one pair of mixers at
> most. To support quad-pipe usage case, two pairs of mixers need to
> be reserved. The lm_count for all pairs is cleared if a peer
> allocation fails in current implementation. Reset the current lm_count
> to an even number instead of completely clearing it. This prevents all
> pairs from being cleared in cases where multiple LM pairs are needed.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 24e085437039e..3b3660d0b166d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -321,7 +321,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>   		if (!rm->mixer_blks[i])
>   			continue;
>   
> -		lm_count = 0;
> +		/*
> +		 * Reset lm_count to an even index. This will drop the previous
> +		 * primary mixer if failed to find its peer.
> +		 */
> +		lm_count &= ~1;
>   		lm_idx[lm_count] = i;
>   
>   		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,
> 
> -- 
> 2.34.1
> 


