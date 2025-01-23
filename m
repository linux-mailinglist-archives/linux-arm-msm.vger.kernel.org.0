Return-Path: <linux-arm-msm+bounces-46013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC47A1ABE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 22:32:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01A093AC343
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 21:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91701C9EAA;
	Thu, 23 Jan 2025 21:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K8fF+vAn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEEB1C5D57;
	Thu, 23 Jan 2025 21:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737667935; cv=none; b=g2/N3b9XokZjGkrbxytF6yfB8jw3As3U0419HxN9OtlNqhi/GiSrNQ86J3QVczTZanoWA2TAXzZ6yItZichiiJa4UbFAbaSs+tkB7Hn7jShKg/6WfsGwxnna1qkegbY15CWKc5NefPsctbO3f8ceg/rcgimu4P7jt9UkO7L/QvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737667935; c=relaxed/simple;
	bh=N525FZhm0/HCZcpqJFykB9tnfKWvLu5H21lWTaq5ECY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hwoDYC7Qg36aDd0IBgKzKr9TfHLeM3ikvKn/yD9uV4TlEkm48GmUzQb8+mOy45eyw3UE69ItM27yOwxXOYlU05Z/XYddRmzzMDsWqghkQllLzs4Va0oLLxO7j0l9Jpt+rHXGN5mF/WZk0i2MSm/iexMT+grooCjtmyHiF3IGWpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K8fF+vAn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NF3WPp012055;
	Thu, 23 Jan 2025 21:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dqLqP0iFaTZOwxUPxT+OtGn2d4PPxLRfgSPbFemhKIo=; b=K8fF+vAnZPP6gCGS
	slEgNjiG8qph1bcbXbmDZdy+hYIQCnZnvg5mTPjkgdCe63s2UfGHiEN3Xft6oB72
	c7ZMPvRN2e+9OfRCq0arVKb28a/WsxCD1SLrMADZu9jBLCs3gpXqZkmrL4T/m3Dq
	FWnFgq/rY65RU2b3kC3xBNMl98LXxJkC8wETe/8zHYK9GbUmZ6xoiA0V8l7hAPF0
	FFwpTyfgZ76062jQKhG9kLgZy4QyRR3xNUhl7MNS8zKAPNt7iqPxcVeIta4U7mcg
	4byAnLtvIrI4hQXhZGNDr9VKuZ7R88hZpgjGJ7BKiV3hxga64C34PR6In1HChgAC
	cVA2FA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44br308unk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 21:32:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50NLW32e001485
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 21:32:03 GMT
Received: from [10.110.95.241] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 23 Jan
 2025 13:32:03 -0800
Message-ID: <1b429f3f-2fff-45bb-86dd-48b1d164ccc8@quicinc.com>
Date: Thu, 23 Jan 2025 13:32:02 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/35] drm/msm/dpu: get rid of DPU_PINGPONG_DSC
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
 <20241214-dpu-drop-features-v1-18-988f0662cb7e@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241214-dpu-drop-features-v1-18-988f0662cb7e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KvIfi-9qKNkBUJtuA6rLf0wWNX-6O2pE
X-Proofpoint-GUID: KvIfi-9qKNkBUJtuA6rLf0wWNX-6O2pE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_09,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 spamscore=0 impostorscore=0 clxscore=1015 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230155



On 12/13/2024 2:14 PM, Dmitry Baryshkov wrote:
> Continue migration to the MDSS-revision based checks and replace
> DPU_PINGPONG_DSC feature bit with the core_major_ver < 7 check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h |  2 --
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h |  1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h |  2 --
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  |  6 ++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 10 ++--------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           |  2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c          |  2 +-
>   7 files changed, 5 insertions(+), 20 deletions(-)
> 

<snip>

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 36c0ec775b92036eaab26e1fa5331579651ac27c..49e03ecee9e8b567a3f809b977deb83731006ac0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -319,7 +319,7 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(struct drm_device *dev,
>   		c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
>   	}
>   
> -	if (test_bit(DPU_PINGPONG_DSC, &cfg->features)) {
> +	if (mdss_rev->core_major_ver < 7) {
>   		c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
>   		c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
>   		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> 

So far in this series, we replaced the feature bits with >= checks of 
core_revisions. That kind of works as usually feature bits get added 
after a specific version.

With this patch and later, whenever we use < checks it gets a bit tricky 
as we might also need an upper bound. Feature bits gave individual 
control of chipsets but generalizing that all chipsets < 7 have PP DSC 
is also not correct. I have to really cross-check but there could be 
some old chipsets which do not have DSC at all.

