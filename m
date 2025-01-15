Return-Path: <linux-arm-msm+bounces-45168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AE3A12E04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 23:01:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D6D51643BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 22:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD9C14B959;
	Wed, 15 Jan 2025 22:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PVJ67QqE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED42132C38;
	Wed, 15 Jan 2025 22:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736978486; cv=none; b=kf3KfZ3EWRKzBim960c6ZFBIphgxXEkfraJ1CNb/WDjefQKnDuudnbUih2EXKyxYbGnsqAAFGcOLwyuJMC6CTZKvAOwvf2iBzVBINJKoFS6DBgjpxcvsIWqBqULdynFTj6rFQ/XldJXkHFT0Q9S4qPW8KUWqRpgjGjZFRRAmkWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736978486; c=relaxed/simple;
	bh=ccZDXx68/xHiJ62ao9FObBZW2y6tUFBDL0pD1p2pg/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=I2tXg6pFlq8woxFiCjSWYe6YiOYmYsyxaoUcqttFYyg4c36o/5pqmAH6YxYnhNzcO7nYwuhUNAy9Af65uKj36kBmd97k8+RyBEqbIBQJ0SUSdZwA66gQbJLWqIydHqu56WpwzKDMb89t1ekOYRXRv6mrU/rKpJlxY9Htxrh8aM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PVJ67QqE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50FGn7Tb014015;
	Wed, 15 Jan 2025 22:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L1ePOnVq75Z40ohb+hqhXuwBLTL/7HuyM4mXKJfQo7o=; b=PVJ67QqEoZzFy0VW
	XbNflQdvzXM/EXr7fATODu3fhSUAlUVx8EglZSkChtxD+JlOV18wzr7RHyAROa6t
	l7K76jtEwNcqxuRRYUZwYADpWrcnhb54kpzZHvvebjSUKwan6pSSDVhkoRiFbLp8
	Bh4Lz8kHZlJEHkKA0n2rBOEhsSnBVbwSv5UGDlSOHUEcAhYyGmcveykdxJEcItTY
	YU5YS0U3n0zhlP5zflnWQXrVX+XFWut3wys4LF1efWocZoPSoygpxHemW5PDDFHi
	tqToo8hBrctR4i7xf3m8AyzVv7HYkeGFxceGmFC/w83H0nXh8+6VhySNgZruB8SF
	qwXFzQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446fh20wey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 22:01:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50FM1BDM027653
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 22:01:11 GMT
Received: from [10.71.108.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 Jan
 2025 14:01:10 -0800
Message-ID: <a34de60c-f410-4d16-b521-2665d86c2a64@quicinc.com>
Date: Wed, 15 Jan 2025 14:01:10 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/35] drm/msm/dpu: skip watchdog timer programming
 through TOP on >= SM8450
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
 <20241214-dpu-drop-features-v1-1-988f0662cb7e@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241214-dpu-drop-features-v1-1-988f0662cb7e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ffAy3NO9ClGfGyFEZsl2zmshw-KHy7Fx
X-Proofpoint-GUID: ffAy3NO9ClGfGyFEZsl2zmshw-KHy7Fx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_09,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501150157



On 12/13/2024 2:14 PM, Dmitry Baryshkov wrote:
> The SM8450 and later chips have DPU_MDP_PERIPH_0_REMOVED feature bit
> set, which means that those platforms have dropped some of the
> registers, including the WD TIMER-related ones. Stop providing the
> callback to program WD timer on those platforms.
> 
> Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> index ad19330de61abd66762671cf253276695b303b32..562a3f4c5238a3ad6c8c1fa4d285b9165ada3cfd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> @@ -272,7 +272,7 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
>   
>   	if (cap & BIT(DPU_MDP_VSYNC_SEL))
>   		ops->setup_vsync_source = dpu_hw_setup_vsync_sel;
> -	else
> +	else if (!(cap & BIT(DPU_MDP_PERIPH_0_REMOVED)))
>   		ops->setup_vsync_source = dpu_hw_setup_wd_timer;
>   
>   	ops->get_safe_status = dpu_hw_get_safe_status;


Yes, this has also moved to INTF starting sm8450.

Note : wd timer programming in interface is missing, so that support 
needs to be added as well

For this change,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

