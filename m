Return-Path: <linux-arm-msm+bounces-29312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9EE95BF9F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 22:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FAED1C222B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 20:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568161CF287;
	Thu, 22 Aug 2024 20:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YEP1Qrfj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7961CDFD5
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Aug 2024 20:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724359059; cv=none; b=eAl5i9MxqHnnb5QwuS26skL0I7M6Ff22RunR/RSWR1jx9cGaDyhnTqOf64c2WPAgXzvnJZSrtFasR92lcP7L226k2UpUn0bY0BtUHyWDUIpRAv2G2y88YghSm4RU9oxNdF8OfGrzgPrpAfEOAzZRK/+1BA4Ywui2mfPTDAAVaJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724359059; c=relaxed/simple;
	bh=rLEVRtPRYhHp9g8w9q/fKtdpuIQ5ogXFjT4dzLebuEQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRWBO2zZ9d55Na80BJcJwe4QfLaPL7OplLkTRauzwshy2VOBf0bqhiQCR9txHzNmZVLSkyDDjlmfa/8t2Oz/1kbuwf7NIdg0YcBZgXVq0U8LhqIEAUzmLlnwXJSMJMq7/jta1OxOcjBUkuy/Er+wdI4xJ73puYha+S5KqpzZUEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YEP1Qrfj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47MA6Ivu027879;
	Thu, 22 Aug 2024 20:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JKl+arsPd7Vxoos92K3LpOUY
	y3KZg5MRl/g6iN3vzoI=; b=YEP1Qrfj7a0mxVuivZ0Q1G5az12sU+6nyEwOcSqF
	MZkyi8hWByTJiyWKEmgLaHd7ZcHgYuM43fUvE+jfeF859mrIzyXoE85OoXyZ7csa
	c3utNj+W7XXz0UqpWn7Lk9Q/kyYtuUSqziCKXcfrxq2ndPWG9M30GCnmWfPw/ASN
	KZmcPcoOLukyCrNzLvv1ilcwIhpy48tjje1mm6dUM2t/CTxntoDpQHAdrBAZzznK
	sU0bxduhiz4EG1OKL+ydB6MIAU7zyn+BHa3zXMAPV2s2fQKNvRPwLWaTz5VonDub
	vwdfNOgb9B0LzZT06DR0F86doZHfKFH7TXMcH1syBUgusw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414v5cg0kw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 20:37:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47MKbMZN011524
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 20:37:22 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 22 Aug 2024 13:37:18 -0700
Date: Fri, 23 Aug 2024 02:07:14 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Li Zetao <lizetao1@huawei.com>
CC: <robdclark@gmail.com>, <sean@poorly.run>, <konrad.dybcio@linaro.org>,
        <quic_abhinavk@quicinc.com>, <dmitry.baryshkov@linaro.org>,
        <marijn.suijten@somainline.org>, <airlied@gmail.com>,
        <daniel@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH -next] drm/msm/adreno: Use kvmemdup to simplify the code
Message-ID: <20240822203714.brki6blotqzoutpu@hu-akhilpo-hyd.qualcomm.com>
References: <20240821012134.1947547-1-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240821012134.1947547-1-lizetao1@huawei.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DlkV6GGKzqRSxaAGK8DEN547z8zHgZ4q
X-Proofpoint-ORIG-GUID: DlkV6GGKzqRSxaAGK8DEN547z8zHgZ4q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_14,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 clxscore=1011 malwarescore=0
 mlxlogscore=817 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408220154

On Wed, Aug 21, 2024 at 09:21:34AM +0800, Li Zetao wrote:
> Use kvmemdup instead of kvmalloc() + memcpy() to simplify the code.
> 
> No functional change intended.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 1c6626747b98..ef473ac88159 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -688,11 +688,9 @@ int adreno_gpu_state_get(struct msm_gpu *gpu, struct msm_gpu_state *state)
>  				size = j + 1;
>  
>  		if (size) {
> -			state->ring[i].data = kvmalloc(size << 2, GFP_KERNEL);
> -			if (state->ring[i].data) {
> -				memcpy(state->ring[i].data, gpu->rb[i]->start, size << 2);
> +			state->ring[i].data = kvmemdup(gpu->rb[i]->start, size << 2, GFP_KERNEL);
> +			if (state->ring[i].data)
>  				state->ring[i].data_size = size << 2;
> -			}
>  		}
>  	}
>  
> -- 
> 2.34.1
> 
> 

