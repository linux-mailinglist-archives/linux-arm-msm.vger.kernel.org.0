Return-Path: <linux-arm-msm+bounces-41573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BE99ED912
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 22:52:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1063282BC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 21:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380661D8DFE;
	Wed, 11 Dec 2024 21:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WCT3vo2b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820DC1A2872;
	Wed, 11 Dec 2024 21:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733953923; cv=none; b=MfL2t+SZUCrmz8R3pPFP8vi5QFEm4EYlcAfq1AM4AOiRKJHhKyMdIhIpKvbwLMt+S0qu5FslaMWgeU1FCBh7smbWXEJFIVoQ/nidkTaXb4OcNJohXhpZ8mQKt7d4gajsG9HJboUeDvVx2wHdbAlQ9jDUPPG2Cf/wJ/abLQEuekA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733953923; c=relaxed/simple;
	bh=jST+O+9o/5FRRR82ATmweq4wYrTx0FLfWEVC0PAtqH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bv31XF5T9vSoBY8mxsU/o5UiHvWEqE9qmyJ88e6Cu+BFNZ0sHnEmlnSgNkmI9yAIMjSq/CgQPFSmxaDv05bOkgG3tIq69a/H8pPNcxRKMGhF1+SenlLeMlRHnYNxwPV1YZLZwFhOXdSgYoE3i6OhLRW3mSnaZWvehDbEw/B4ItI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WCT3vo2b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBHD9cs027271;
	Wed, 11 Dec 2024 21:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hx0XbeKHJIhsBiQlF2pZwcJEuMUwppaz4DkvWC559cE=; b=WCT3vo2bZSyzvSn2
	qZ1U+6IHFgc27qD45kPm7fEMzvSSdXEYh0QZJaWv4verIlMcThFPZXoD2NDKW+sL
	5rzIDyF6AesDvoIiGRZwSKPyK8HbyfhZ0rYKXD4NzUvfc2EoUm5UjmdU3uR6Ikj7
	IwgVTHSb2ie0R2Qzp8qhNFpZCoqw8kkgX3gYiPgcyRQbeS/TX9sg5NSUFnzjHRJ0
	PS2C2yJ520ySwO6blaKVbYUprDsPr/krmlDg2r8iSZJC9LiCXzk/suge4OMInlk0
	HaR/Wo8eZJqR6VUmWWKrPFlujnnbsxxzRaSePpx0X7jqskmvHQMGH55UvrhEFos7
	gq7ayg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43etn8v78k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 21:51:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BBLpreU023451
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 21:51:53 GMT
Received: from [10.110.5.240] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Dec
 2024 13:51:52 -0800
Message-ID: <160151f0-9cc6-40f6-9f53-466185835e4d@quicinc.com>
Date: Wed, 11 Dec 2024 13:51:51 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] drm/msm/dpu: allow using two SSPP blocks for a
 single plane
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241130-dpu-virtual-wide-v7-0-991053fcf63c@linaro.org>
 <20241130-dpu-virtual-wide-v7-2-991053fcf63c@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241130-dpu-virtual-wide-v7-2-991053fcf63c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ys6wWVq4tkxF35kp0TcqkApYOPrm3zv_
X-Proofpoint-GUID: ys6wWVq4tkxF35kp0TcqkApYOPrm3zv_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 mlxscore=0
 mlxlogscore=960 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110153



On 11/29/2024 5:55 PM, Dmitry Baryshkov wrote:
> Virtual wide planes give high amount of flexibility, but it is not
> always enough:
> 
> In parallel multirect case only the half of the usual width is supported
> for tiled formats. Thus the whole width of two tiled multirect
> rectangles can not be greater than max_linewidth, which is not enough
> for some platforms/compositors.
> 
> Another example is as simple as wide YUV plane. YUV planes can not use
> multirect, so currently they are limited to max_linewidth too.
> 
> Now that the planes are fully virtualized, add support for allocating
> two SSPP blocks to drive a single DRM plane. This fixes both mentioned
> cases and allows all planes to go up to 2*max_linewidth (at the cost of
> making some of the planes unavailable to the user).
> 

Overall looks so much cleaner after unification!

One small nit below,


You can still have,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Note: we have started testing this series with sc7180 CrOS, and will 
report our findings/ give tested-by this week.


<snip>

> +static bool dpu_plane_try_multirect_parallel(struct dpu_sw_pipe *pipe, struct dpu_sw_pipe_cfg *pipe_cfg,
> +					     struct dpu_sw_pipe *r_pipe, struct dpu_sw_pipe_cfg *r_pipe_cfg,
> +					     struct dpu_hw_sspp *sspp, const struct msm_format *fmt,
> +					     uint32_t max_linewidth)
> +{
> +	r_pipe->sspp = NULL;
> +
> +	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +
> +	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +


There are two places where the multirect_index and multirect_mode are 
reset. Would it be better to just have a small api 
dpu_plane_reset_multirect() and do this there?

