Return-Path: <linux-arm-msm+bounces-27580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEAB943685
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 21:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47DB4281DE4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 19:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F39C0149C51;
	Wed, 31 Jul 2024 19:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WV+3aTGy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645B31401B;
	Wed, 31 Jul 2024 19:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722454568; cv=none; b=dLXcqHe8ElEDKqIQnbJVbwqSR2Sm0rc3XJqFGeWmYp57UrjaIbObYkazTSuMj8EaTyLsXaXxOY7Kd/OjglTCIvpF5d6C1RN8QJqy4nQCpQVXl/opdYhO1wikSPkxdSQyjucyRmbNIenh0vSzZJHkEF8xCjYUArWOXUWC+gCDtrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722454568; c=relaxed/simple;
	bh=8ojbeoanxn0CIvSxRftV+pYw2YCTgebLo46YNrzP7RY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hWmQEkvOJjuMiP/DsDOmWvP5xYkvUSip8scU334GFp92oMtkNdaGJ69bQicfvoQAI/XUBVqcGYQIttx3OuJNIME+H1TmIl1D+ctBdW5A+iSaSMrQyPSXE4fb/oC2ac578mT569xq8W+wqTRQfF23GJRzQh7+o81DyWbSc/cq+CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WV+3aTGy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VDiXQ0030426;
	Wed, 31 Jul 2024 19:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NT7UQKnSzFK33S9HAkOJuDPnUO8RYziYTLbY6ku6Rxs=; b=WV+3aTGyS1swsakX
	0YtC7LtRnTVS7AYTInOSYX4+h5FIwa1AJXW8U5OT6aKN6F0F9OBAGTeWE360Nu/I
	TY2Z7Zc04+Sc7FDREs3ahAW9TPl25vBJ3KkHpof/UjTwQB+SklKIJQUDAJ81Trj7
	UVYp9EUhXbOy504FpaX4/yyGGQck2uSP5I6duUh1Kpj80aQWm8AnxJcbA8vLf1Lk
	eYrWhopzyZGQW8CPKHmksZ/ViNZi3vrqSp4Y33s4lPyIuFLi9vCr8mpS83AsECqF
	3LIi7plzbk9GeU+jdiZpO//IAjKL6qlQ+yRwjdiug6+LARdvLokrlyp3UuVKLOlx
	ujSvnA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40pw445qgx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 19:36:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46VJZxs5030852
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 19:35:59 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 31 Jul
 2024 12:35:58 -0700
Message-ID: <b2cceeb8-fe81-4212-9b07-b70cad8d3b9b@quicinc.com>
Date: Wed, 31 Jul 2024 12:35:58 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/12] drm/msm/dpu: relax YUV requirements
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
 <20240627-dpu-virtual-wide-v5-2-5efb90cbb8be@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240627-dpu-virtual-wide-v5-2-5efb90cbb8be@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Wn5JybqfBLeFCkNXswGN0uEFo1zBsTfu
X-Proofpoint-ORIG-GUID: Wn5JybqfBLeFCkNXswGN0uEFo1zBsTfu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_10,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310138



On 6/26/2024 2:45 PM, Dmitry Baryshkov wrote:
> YUV formats require only CSC to be enabled. Even decimated formats
> should not require scaler. Relax the requirement and don't check for the
> scaler block while checking if YUV format can be enabled.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 1c3a2657450c..148bd79bdcef 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -743,10 +743,9 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
>   	min_src_size = MSM_FORMAT_IS_YUV(fmt) ? 2 : 1;
>   
>   	if (MSM_FORMAT_IS_YUV(fmt) &&
> -	    (!pipe->sspp->cap->sblk->scaler_blk.len ||
> -	     !pipe->sspp->cap->sblk->csc_blk.len)) {
> +	    !pipe->sspp->cap->sblk->csc_blk.len) {
>   		DPU_DEBUG_PLANE(pdpu,
> -				"plane doesn't have scaler/csc for yuv\n");
> +				"plane doesn't have csc for yuv\n");
>   		return -EINVAL;
>   	}
> 

Change seems fine, but one question, is there a chipset in the catalog 
with a Vig SSPP which has only csc but not scaler? Even qcm2290 has 
neither scaler nor csc

So was this just a code-walkthrough fix or was there any issue hit due 
to this?

> 

