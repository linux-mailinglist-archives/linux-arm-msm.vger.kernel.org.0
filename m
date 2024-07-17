Return-Path: <linux-arm-msm+bounces-26504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CEE934421
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 23:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A0831F21B4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 21:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E628EB64C;
	Wed, 17 Jul 2024 21:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UTmErWgp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDA44688
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 21:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721252797; cv=none; b=E3JoLA/pmBBPVOwVswQaDIbQcUf8kJO9xkfun+r+WsMQr8yoMoWUMHuEzidyaSqY/Z10SU1qjvNirKGRcOkY4ooWvPi7nGieiD4hWO9d+pbXk2vCEXc3blB2lYYX9RvuF7fyew/jnerKxpW9zmlQ6mCLwcpw9giQbMP4EA89DN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721252797; c=relaxed/simple;
	bh=dSQ01SHtvrBBey7XrCO7RdANLy/CS0iIkdlOJdLJKEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dzqRevomGZdtEP0pKu2n1Gxfj0NAmkHZ4sLbmACMo/91ZkV5e9pxcm56XTMqihCg3gTrmSx4gry37olr2zf3MNbCpNaIJlc4gYS13rZu4pv6lu2W92Gt9OI8oTw97aGZqv1ZtSVbcccDfv4emzZtYKXilJ3YaerhKPJqlesvqj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UTmErWgp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46HEtlUP007015;
	Wed, 17 Jul 2024 21:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ZNUkm6p5NhYW+TgeqNhztIqxQii33ik6kOl/p8whqs=; b=UTmErWgpCFD6NF4G
	kZTPWInSplFpJ/NyLpyz194eRnZ2qMpy97Nuho5Sex1iOjr9PRvFh+KuIJQkwTZx
	gHjKclNt82S/Pm/Ks57oPJeHU+dk7fwSeVR9tyq01bXvTnxN2sqdjG8bokBvTQfK
	L7EIXnSARpz/FRE1+f5M0r7nQ09PFStYeyvC8zsZ6LXPv+grxu82Vn0tplOumszX
	pDNd8kn/+Fs1wrsxzkpJFxWNd75ikp6ohqFymB1HNPhDPMI4TJm8LB/21987NWl1
	eCstSFbhz2BAH95GiWNUDlJt4dl9t06/kVdU15x3Pz+2HYyixOvJPewanSt4renr
	W85iuw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfxbq2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 21:46:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46HLkIV5022109
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 21:46:18 GMT
Received: from [10.110.63.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 17 Jul
 2024 14:46:16 -0700
Message-ID: <187f8e81-cee4-447e-90ba-62fc0c1430c9@quicinc.com>
Date: Wed, 17 Jul 2024 14:46:16 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/16] drm/msm/dpu: pass drm_framebuffer to
 _dpu_format_get_plane_sizes()
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
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
 <20240625-dpu-mode-config-width-v5-9-501d984d634f@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240625-dpu-mode-config-width-v5-9-501d984d634f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rVmCcMBV0Jpdd60M0AE2DwsMKUal7_24
X-Proofpoint-GUID: rVmCcMBV0Jpdd60M0AE2DwsMKUal7_24
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_17,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=916 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 mlxscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407170165



On 6/24/2024 2:13 PM, Dmitry Baryshkov wrote:
> Instead of passing width / height / pitches, pass drm_framebuffer
> directly. This allows us to drop the useless check for !pitches, since
> an array can not be NULL.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 73 ++++++++++++++---------------
>   1 file changed, 34 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> index 46237a1ca6a5..df046bc88715 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> @@ -95,8 +95,7 @@ static int _dpu_format_get_media_color_ubwc(const struct msm_format *fmt)
>   

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

