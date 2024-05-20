Return-Path: <linux-arm-msm+bounces-20036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0B98C982C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 05:15:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58E21B2169D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 03:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23F269457;
	Mon, 20 May 2024 03:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RneYUvMO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810686AB8;
	Mon, 20 May 2024 03:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716174941; cv=none; b=cwfOTWvMGdqxA04qHQB8y3zSvONpWnMVIcn1FECDbYLHw6gy8M8rFnloP6uO2xasYjPoJWGLht5BeEbOUkII0QkwFYCMlzk9P3nlOrultQxFjajLD19JTb0BXAtIs0gC/GQ9rYDCgsiWayElJ4buwxsYGafhaXdnJEIoCdJEiBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716174941; c=relaxed/simple;
	bh=MxRQHfUfj2r/5A+3BQ6EVcIti+tro82FG+y+bSXtfsU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GyPB/41evhWfLH+jHHmZLwOpwIIdfcwTHYcQXeMfLg4skEh4ceQOSpeLVAU1mQrS66zrgeqjCF+cGSJCKm29AEV5tIC7dey/UkxgbMeM+Seg8RdUgg47PmfD31K2/etXZgiu4RKhAhk14zcA3/xNu7tECCRoJwB/7ZSlJVVCuRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RneYUvMO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44JNmZUr023818;
	Mon, 20 May 2024 03:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=8lFeKLmxC5SwUI1TCFP0u
	1MzCDvG1yc21gbkRhCjvg4=; b=RneYUvMOqxd/3QpK/rt6R30Txxpx6ONOHN+JT
	+DaU5Jc+cFrKrzF5XiIIxYs4S6uvoS0pE/z4QWpiAJmrdBcsSwQ+jN7XfS675/Qf
	Wmgq8vb29E0O2Oy7H9RPW/JE6IYpR5Paksi+XPh6LQUlh2epBz0ucrjXiOagdBCx
	shLmxmDojs7hKk3M8WlMvpa+uKJdr92LcgFUVJDzUUXvIdby2eXssOboatu5S26K
	n82FgzCLhO9klf8PmWLZ6ZJdciiS0+i3llk7O5FTapFr1rXZOk316SQSP2CNp7GH
	p5HfF1h0v2OIasDLWvT8oDZ04K2iGVMAPzhJmvs2cHOgHV17A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n4p2jk4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 03:15:18 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44K3FHF2003157
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 03:15:17 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 19 May 2024 20:15:17 -0700
Date: Sun, 19 May 2024 20:15:15 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Rob Clark <robdclark@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
        "Nikita
 Travkin" <nikita@trvn.ru>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        "Marijn Suijten" <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        Ruan Jinjie
	<ruanjinjie@huawei.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/adreno: Check for zap node availability
Message-ID: <ZkrAQ+CLnwHTjPl6@hu-bjorande-lv.qualcomm.com>
References: <20240517195021.8873-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240517195021.8873-1-robdclark@gmail.com>
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Uq4jZktGJrI1Bgm_j1kP6QuvdqeyhNn1
X-Proofpoint-GUID: Uq4jZktGJrI1Bgm_j1kP6QuvdqeyhNn1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-20_01,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 spamscore=0
 impostorscore=0 clxscore=1011 phishscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405200025

On Fri, May 17, 2024 at 12:50:19PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This should allow disabling the zap node via an overlay, for slbounce.
> 
> Suggested-by: Nikita Travkin <nikita@trvn.ru>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index d9ea15994ae9..a00241e3373b 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -46,7 +46,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
>  	}
>  
>  	np = of_get_child_by_name(dev->of_node, "zap-shader");
> -	if (!np) {
> +	if (!np || !of_device_is_available(np)) {

	if (!of_device_is_available(np)) {

would cover both cases and be slightly cleaner imho...

But this looks reasonable either way.

Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Regards,
Bjorn

>  		zap_available = false;
>  		return -ENODEV;
>  	}
> -- 
> 2.45.1
> 

