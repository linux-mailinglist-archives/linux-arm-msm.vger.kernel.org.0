Return-Path: <linux-arm-msm+bounces-22630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE1E907A39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 19:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FA2B1F217C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 17:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CDBF144D35;
	Thu, 13 Jun 2024 17:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RkN9iBeY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5396F06A;
	Thu, 13 Jun 2024 17:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718300970; cv=none; b=OnOBH8J5oKf/ofHD7qKwnP6hmowG3IgDQyimfreBD6/A0WEyYxvcvTp9v89LAphdGvpozYy+h4MyrFzIBffgTjtnVHPhwK9pE8ULdrcOB+p3XVF9OAXLKnmweUyw4/fI8BvZvU71ECcOJfZ/Hq0RcdY8WOG1xvpm7sCpzK/Z81A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718300970; c=relaxed/simple;
	bh=BeArRVe6hS2UPvFu9qR2uJweWv2xOagJyqyCwQ9idCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ulfxvKGJnc8wfBGtPKPIDA+F8EUJsmQbhtCqzVXijpzTYGAffFMIZ9AQKVV+1dNVrhzXI8TPvmFNLXPSVLo97Y57aRNQxzeOV6+NNlXG0DxinP+ZqoQ31qWzk/xnnxRP9ozaIcWiFAxwDxH2Ca4GKCE3GO/5VTwsI2n/cFWe68I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RkN9iBeY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45D9A0Eb017338;
	Thu, 13 Jun 2024 17:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RfvI9IA+TPPBijdBvgYrJUDjhP/zY7y9Yfs1POvReWg=; b=RkN9iBeYRE8kdIh8
	GIrxIxNzhMKEVFOv9TthnoGVBwh75pSMRKgi4krzkd/pO/hF3dyq4cEcArFRbSly
	3qUwVOPiGa0iUClE4uaU+qUoKZVlaA2iF7bxnt0FVa4JblKnxbjQR56yacItiIFE
	OIH/19DwfDbjCB+4wvxmzj6N0anPZrSUCzKT2rlJOEaMZheDEVqnLJlB7dioEHzd
	hrtrnl45SpxwCbn4PseUdCyeMk9vgELtPKIJBhOn0y/TscXiQMDFdMsAvy8+r/fT
	Vp7/j/z+MWyaHIVW4WS7/odHXPV/7HpbY8grJ8KKzzh42cSX0MWwIdS3n+YkeU10
	S00BZg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yptuy6eyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 17:49:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45DHn9wx025826
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 17:49:09 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Jun
 2024 10:49:09 -0700
Message-ID: <8aa99c1d-ca6a-a26b-96b5-82fc35cea0fa@quicinc.com>
Date: Thu, 13 Jun 2024 10:49:08 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/ci: mark kms_addfb_basic@addfb25-bad-modifier as
 passing on msm
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Helen Koike <helen.koike@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240613-msm-pass-addfb25-bad-modifier-v1-1-23c556e96c8a@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240613-msm-pass-addfb25-bad-modifier-v1-1-23c556e96c8a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: E7hembqN2uvC24XtUgiRtPZ-TjxqK8og
X-Proofpoint-ORIG-GUID: E7hembqN2uvC24XtUgiRtPZ-TjxqK8og
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_11,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 phishscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406130128



On 6/13/2024 9:33 AM, Dmitry Baryshkov wrote:
> The commit b228501ff183 ("drm/msm: merge dpu format database to MDP
> formats") made get_format take modifiers into account. This makes
> kms_addfb_basic@addfb25-bad-modifier pass on MDP4 and MDP5 platforms.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt | 1 -
>   drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt | 1 -
>   2 files changed, 2 deletions(-)
> 

Would be good to also give a link to the CI for the CI maintainers.

But otherwise, LGTM

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>


> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> index 3dfbabdf905e..6e7fd1ccd1e3 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> @@ -4,7 +4,6 @@ device_reset@unbind-cold-reset-rebind,Fail
>   device_reset@unbind-reset-rebind,Fail
>   dumb_buffer@invalid-bpp,Fail
>   kms_3d,Fail
> -kms_addfb_basic@addfb25-bad-modifier,Fail
>   kms_cursor_legacy@forked-move,Fail
>   kms_cursor_legacy@single-bo,Fail
>   kms_cursor_legacy@torture-bo,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
> index 23a5f6f9097f..46ca69ce2ffe 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
> @@ -4,6 +4,5 @@ device_reset@unbind-cold-reset-rebind,Fail
>   device_reset@unbind-reset-rebind,Fail
>   dumb_buffer@invalid-bpp,Fail
>   kms_3d,Fail
> -kms_addfb_basic@addfb25-bad-modifier,Fail
>   kms_lease@lease-uevent,Fail
>   tools_test@tools_test,Fail
> 
> ---
> base-commit: 6b4468b0c6ba37a16795da567b58dc80bc7fb439
> change-id: 20240613-msm-pass-addfb25-bad-modifier-c461fd9c02bb
> 
> Best regards,

