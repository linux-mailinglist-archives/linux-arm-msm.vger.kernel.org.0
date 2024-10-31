Return-Path: <linux-arm-msm+bounces-36602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4C79B838A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 20:37:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A4301C20506
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 19:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64EA91C9DFC;
	Thu, 31 Oct 2024 19:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dGGYCdjW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E11E347C7;
	Thu, 31 Oct 2024 19:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730403457; cv=none; b=GyFpD11pmEwUoiKtaJonVU8r6jUWu1u6h8vIvB/l3P2Mmzy18D1ic74VvjRf2qEjFBCiPdDez4QBdDUx1pEUNFyG3GyU6DU/RzJrtTr0O7fSZcyaiVLM5Awq2KSqOSapAD788arG16qD3zx1oOqFRR1kOc4uhJc1hNFv+T/9qKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730403457; c=relaxed/simple;
	bh=z0230OK8mFw6jmh6fs6sRpWPhIUJrHNiAOkTxa104mY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BoLc9/B8TCYECcK1dFxww2j0lB4/dmb72t27pEt8+1qXNiWBvNojKMi6YUIOCjAGDVpCfEwr9SrP6iBsIFUllPWTwK6PLnohV9dTj+QYeP2gC2Yc020y17boaGsU4vGA6RNQt06x2BX4yTfdSYE4zgmWR2APAlhOQ4w9sBIQDjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dGGYCdjW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49V8OqWF012768;
	Thu, 31 Oct 2024 19:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bIxwLsSg+CYH3T0ktKQwywNRP1Ozo2e29WPTyMrAnfE=; b=dGGYCdjWX4TlRuFo
	3BaN779XFxkcwhwzyZicrqtXZnRsxv7OrvQp+et9St8ZGpR9ShyoBm3s8oD5A6sM
	/xzFPC7Nwuct/1iM600XcBN7jejwaDrhYvCepB/VBQY/8AY/5vfmUByr0C526pq3
	gmAQj1/j2Tiatuv9Pk7RgfP5qr/E+5FqL7rf96Wu7HkIRkh/gxHuGEtTLzgeu0cf
	+b8B7PYoytE16S3BG27b8r70b7qEbId2i5+uqzUU5rEhUFarfBoDoJAYFZYUvvJR
	Hke7jeabwGWIzTyR5k99IIQIH05cmpDKSNBS0ngP7m7IpXZQf1KLPePe9lx3rH2l
	pg51Tw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42k6rpq113-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 19:37:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49VJb7sQ020699
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 19:37:07 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 31 Oct
 2024 12:37:04 -0700
Message-ID: <3afded46-7aef-4444-9b61-b97f71d0e5fc@quicinc.com>
Date: Thu, 31 Oct 2024 12:37:03 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/23] drm/msm/dpu: move resource allocation to CRTC
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
        Rob Clark
	<robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Sean
 Paul" <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David Airlie" <airlied@gmail.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Simona Vetter <simona@ffwll.ch>,
        Simona Vetter <simona.vetter@ffwll.ch>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20241016-concurrent-wb-v3-0-a33cf9b93835@quicinc.com>
 <20241016-concurrent-wb-v3-5-a33cf9b93835@quicinc.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241016-concurrent-wb-v3-5-a33cf9b93835@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: cg68pWYdBUYYZT7pKzCXxlv2bltUcJXi
X-Proofpoint-GUID: cg68pWYdBUYYZT7pKzCXxlv2bltUcJXi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410310148



On 10/16/2024 6:21 PM, Jessica Zhang wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> All resource allocation is centered around the LMs. Then other blocks
> (except DSCs) are allocated basing on the LMs that was selected, and LM
> powers up the CRTC rather than the encoder.
> 
> Moreover if at some point the driver supports encoder cloning,
> allocating resources from the encoder will be incorrect, as all clones
> will have different encoder IDs, while LMs are to be shared by these
> encoders.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> [quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> [quic_jesszhan@quicinc.com: Changed to grabbing exising global state]
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  86 ++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 201 +++++++++++-----------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  19 +++
>   3 files changed, 183 insertions(+), 123 deletions(-)
> 

<Snip>

> -	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
> +	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
>   	if (dpu_enc->dsc)
> -		num_dsc = 2;
> +		topology->num_dsc += 2;
>   
> -	return (num_dsc > 0) && (num_dsc > intf_count);
> -}

I dont recall the context of replacing num_dsc = 2 with num_dsc += 2
and its not documented.

<Snip>

> +	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
> +	if (dpu_enc->dsc)
> +		num_dsc += 2;
>   
> -	return topology;
> +	return (num_dsc > 0) && (num_dsc > num_intf);
>   }
>   

Same here

This should not break anything with current code. We could land it the 
way it is as this was the version which was last tested and post a 
follow up if this was not right. Something to be documented though, hope 
this note serves that purpose. Rest of the change LGTM,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

