Return-Path: <linux-arm-msm+bounces-18023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F948AB928
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 05:06:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCD101C20961
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 03:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7AB205E39;
	Sat, 20 Apr 2024 03:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T42SLXiI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7CF625
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Apr 2024 03:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713582362; cv=none; b=N9bHl/pIFs++byEccb/9M6DMgdH+bhR8BVegjNB71WsYHMxX2JBMDu82fMbC4xZiTEm/F41ZEm5Ye5LImGik0zzCdy+qExcrlQ5CnoIXHzEgMPCYxZfbTzJJ4RLR3M1f4g2SYY9+ZKPqpbEMXaDhmsqjJpEf6uHENHZEDSEvWJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713582362; c=relaxed/simple;
	bh=d5zHCFSmBxtP+K0ZGr18neVx4j0kS1htJJFrHYFsOdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=G1fe2Rv/0eJ9Wy+8BvlLwJgJvPQ1CSIRB2+/GNVNTWZiBwL2FFGZCgqyZ/+nL43Jgz8wKLrxzn4tSKJ3T7Pw1CCLvhY7fUiiBKHgJKYpKfyLy2p3h222N86zFrsYf2YulscPZhY/JvnamcY1Eov0x79mOHAXQuCpnEELgChNwy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T42SLXiI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43K2t6B2019809;
	Sat, 20 Apr 2024 03:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=uyUvenUyziI+goV+xvRJjnkA3ZWbKsibDWB9RcTo3e4=; b=T4
	2SLXiIjl7lgBMfCrJy2KvhnstHdPF4A9WEP6x3amIfdu5bLKaN7zoCtYGxbGQTn9
	E62JYVMC9eTPQi2vnfgdaPOVHJ0CJr3746ownjvOteMYw/DfvZ3PyYXKWGjOOjHE
	f/BEK1itpg8r58BoxC5RwvlNg2V3PC8MmRjX2zc3l3QMdVbeDHuZ3/xmBnh5/g+C
	aDna2GQiP0qp2ZRDUHcxWxs/Q8xkFuwoN0ScJsgo3bf/jEiEpPiyskmPLGwylnHU
	zUvs9Y+LmAxbhe89P/XN69jgCvxXXIdQKQYizVfqmq9aIQe1f3i5+Y48bwDFlmpO
	wZkyVT2sYakIvyrW8LlQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xm5a700g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 20 Apr 2024 03:05:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43K35nbo010604
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 20 Apr 2024 03:05:49 GMT
Received: from [10.110.104.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Apr
 2024 20:05:48 -0700
Message-ID: <7198d419-2b46-b9e6-4404-64f86b0b54bb@quicinc.com>
Date: Fri, 19 Apr 2024 20:05:47 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 9/9] drm/msm/dpu: sync mode_config limits to the FB limits
 in dpu_plane.c
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
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
 <20240319-dpu-mode-config-width-v1-9-d0fe6bf81bf1@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240319-dpu-mode-config-width-v1-9-d0fe6bf81bf1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8L6pZNlO7A-V1m9oBNVj4CVUSjJZjhh1
X-Proofpoint-ORIG-GUID: 8L6pZNlO7A-V1m9oBNVj4CVUSjJZjhh1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-20_02,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404200020



On 3/19/2024 6:22 AM, Dmitry Baryshkov wrote:
> Lift mode_config limits set by the DPU driver to the actual FB limits as
> handled by the dpu_plane.c.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 7257ac4020d8..e7dda9eca466 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1136,13 +1136,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   	dev->mode_config.min_width = 0;
>   	dev->mode_config.min_height = 0;
>   
> -	/*
> -	 * max crtc width is equal to the max mixer width * 2 and max height is
> -	 * is 4K
> -	 */
> -	dev->mode_config.max_width =
> -			dpu_kms->catalog->caps->max_mixer_width * 2;
> -	dev->mode_config.max_height = 4096;
> +	dev->mode_config.max_width = DPU_MAX_IMG_WIDTH;
> +	dev->mode_config.max_height = DPU_MAX_IMG_HEIGHT;
> 

Can you please explain a little more about why the previous limits did 
not work in the multi-monitor case?

We support at the most using 2 LMs per display today. Quad pipe support 
is not there yet. So by bounding to 2 * mixer_width should have been 
same as rejecting the mixer width in atomic_check.

>   	dev->max_vblank_count = 0xffffffff;
>   	/* Disable vblank irqs aggressively for power-saving */
> 

