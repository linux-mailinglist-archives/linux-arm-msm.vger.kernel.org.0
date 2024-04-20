Return-Path: <linux-arm-msm+bounces-18004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 377108AB814
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 02:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E46CB281B26
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 00:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B70E17C;
	Sat, 20 Apr 2024 00:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K6NN8vvF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5286623
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Apr 2024 00:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713572203; cv=none; b=jyEagoKK7l3urZhyTTz1G1FKFBQZWvQxiLIz6P8NNyoB8w0sChw80vNn7n1ZZi2YGvRt/1whbcchTwdI4yIdp6//qZAh7DiM+MqVP9Xgphslj/tlECc1QQzs/thZ3SSdvTfa86JF3RHzAkIBVg20tULZpUGRJK+trQtMDQbBK8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713572203; c=relaxed/simple;
	bh=J9dLPlYVRLaJ+9JMGM91c61DSlzxb6CW7OA9zw/14AQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=O6b0fuSKn4DPW2b+buxSM0cIawgMWaDr3tzGpDQwjoQqWLzVylmVy3nXgt9F56oiJrcTSmI2KYdhbaHJybMaA2ZRiyDVARrTGk2TAiqFsqG8/FFnb0VGbCLaE4OfjgGlvZRAETRgVWq+gnNqi5yI+qQg0up+u9rHoy4G+YrJpFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K6NN8vvF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43JNdIrc025225;
	Sat, 20 Apr 2024 00:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=v2jkwk2Q2bfqWwAEK2Q0cws0YbSB/bnuvrYVTOyrFAs=; b=K6
	NN8vvFFiXzuHQVTSzA88KNTz6MDuNYm8BWqKvcLl3bj6mglfzctHRLe4p7Ot2iMD
	wgOWELCSalYHOEyyAUm/Jm3clhM7LK/XJpJrgfv+ebet85tkyLemugXr1wJ+8Bq2
	PAIDhjxIqCaKNxVsp4NsZ83At5GYVn/bqP8+wMtGEMj4Alps+/mfSbr/9G/bF3uP
	59q4lTLTWOJBXI31cL537CWGa95T6UaQWQAuxIDHcrYqU3BmfU0vca0Kie0SDpwg
	4rXarvxRsRw0obWtgmyNKkjwr/dvq4kao9XoNjq/eFbeJfvx4qTVNHGd+05I5bDs
	IcHsb3WzhyCGMn3Xc4jQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xkt3mh37y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 20 Apr 2024 00:16:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43K0GVIx010267
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 20 Apr 2024 00:16:31 GMT
Received: from [10.110.104.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Apr
 2024 17:16:31 -0700
Message-ID: <2d0e922f-8d68-aa5b-ebbf-b1bde3e9e2af@quicinc.com>
Date: Fri, 19 Apr 2024 17:16:30 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/9] drm/msm/dpu: check for the plane pitch overflow
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
 <20240319-dpu-mode-config-width-v1-5-d0fe6bf81bf1@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240319-dpu-mode-config-width-v1-5-d0fe6bf81bf1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: r3s7YrrP-VBWTsLs7OnyZjEwmlzesZNO
X-Proofpoint-ORIG-GUID: r3s7YrrP-VBWTsLs7OnyZjEwmlzesZNO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_16,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404190188



On 3/19/2024 6:22 AM, Dmitry Baryshkov wrote:
> Check that the plane pitch doesn't overflow the maximum pitch size
> allowed by the hardware.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 6 +++++-
>   2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index b7dc52312c39..86b1defa5d21 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -12,6 +12,8 @@
>   
>   struct dpu_hw_sspp;
>   
> +#define DPU_SSPP_MAX_PITCH_SIZE		0xffff
> +

You obtained this value from below code right?

	if (pipe->multirect_index == DPU_SSPP_RECT_0) {
487 			ystride0 = (ystride0 & 0xFFFF0000) |
488 				(layout->plane_pitch[0] & 0x0000FFFF);
489 			ystride1 = (ystride1 & 0xFFFF0000)|
490 				(layout->plane_pitch[2] & 0x0000FFFF);
491 		} else {
492 			ystride0 = (ystride0 & 0x0000FFFF) |
493 				((layout->plane_pitch[0] << 16) &
494 				 0xFFFF0000);
495 			ystride1 = (ystride1 & 0x0000FFFF) |
496 				((layout->plane_pitch[2] << 16) &
497 				 0xFFFF0000);
498 		}

Seems correct, but was just curious

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

