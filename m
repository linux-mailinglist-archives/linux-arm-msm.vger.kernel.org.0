Return-Path: <linux-arm-msm+bounces-45757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D566CA18933
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 01:58:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7947F188AF7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 00:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DB2611CA0;
	Wed, 22 Jan 2025 00:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H7SsAFvR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716C9F9FE;
	Wed, 22 Jan 2025 00:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737507495; cv=none; b=XQQffZnEI3RE+1P0w1NNilnXbz7+eFY2pvYbWZtVg11EGJfQt173poERNwKgvz33DSn+Zl2SuScSj8ifvhA4u+Xid0tn/n44jN8Dp2SLaNpyDtomPOSOQlbBZUAjOWqEFzd9wdhHJ1c8nZfdaQMy08go5dEYagSxhJYPdlFYFnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737507495; c=relaxed/simple;
	bh=sw6DJp7M3HRFHVo8rwcT7z5nHWWlsfUzr6C7DpA2KOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jJNUkdfGYmUHS/sqIe94NfscW/DucqGYCYBuE5ps3pA+jJFMLMeBZNPuXGrv3r7O1qUPlDOVfOXDGXuhzEp7dOZcmatpZ+CJbRxjDlgD4zszw54dxfWwElceilgzzS/QoC8VTB3wDqhO2PUrkkl39WejyNiTXRz3lGs8g+kx9bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H7SsAFvR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M0QcmY020788;
	Wed, 22 Jan 2025 00:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4tAAY8xIAzeVqflXURrNU4G2pE9M1zKgMXUpzQt0eLg=; b=H7SsAFvRRSQF1WuR
	v2s1tjkVxYIYoK5qp0gELnaesVp+jLi2g7arYQh/muO9rPLSCNRDGkzvzUaMSKR6
	F5FeOJCtO5cMH4mEHkhXPcwsiBda64HMNNdG+1xPVe/gQ1qo8zQGxHUUs1FED2oE
	LGuODieyiURP7OuOOaiCyLlVfYgheVOYxghhXadyO/4Yu42EdesMdf7DYso1lnoJ
	X1pLR/Dy4TRdCbd0TlU44fmtlOw7yOiZCRUqiRGQuJWhk9sttbpeHjzynzzm//lm
	Z1ycbObMrku5hHVnMDYor0AQcfA816tj/6YlljCARCrOyv3AvZWJHxTzZTVM+ARI
	JJjtMA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ap4x01q3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 00:58:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50M0w4Kl016105
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 00:58:04 GMT
Received: from [10.110.82.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 21 Jan
 2025 16:58:04 -0800
Message-ID: <9d86517e-b05c-4cd6-925e-11c859fcb91d@quicinc.com>
Date: Tue, 21 Jan 2025 16:58:03 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/35] drm/msm/dpu: get rid of DPU_CTL_ACTIVE_CFG
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
 <20241214-dpu-drop-features-v1-11-988f0662cb7e@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241214-dpu-drop-features-v1-11-988f0662cb7e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ezb2_7zdkvTYVUNmVKg1WeN-7K_-qobl
X-Proofpoint-GUID: ezb2_7zdkvTYVUNmVKg1WeN-7K_-qobl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_10,2025-01-21_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220005



On 12/13/2024 2:14 PM, Dmitry Baryshkov wrote:
> Continue migration to the MDSS-revision based checks and replace
> DPU_CTL_ACTIVE_CFG feature bit with the core_major_ver >= 5 check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 8 ++------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 8 ++------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 8 ++------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  | 6 ------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 8 ++------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h  | 3 ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  | 4 ----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c    | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c     | 7 ++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 3 +--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c              | 2 +-
>   15 files changed, 13 insertions(+), 50 deletions(-)
> 

<snip>

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index e9bbccc44dad8b391cd51daf902307105b2598fc..e16b0a0c57da4a1aa77064ca2214e37cd9ee4baa 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -66,7 +66,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>   	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
>   
>   	/* setup which pp blk will connect to this intf */
> -	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) && phys_enc->hw_intf->ops.bind_pingpong_blk)
> +	if (phys_enc->hw_intf->ops.bind_pingpong_blk)
>   		phys_enc->hw_intf->ops.bind_pingpong_blk(
>   				phys_enc->hw_intf,
>   				phys_enc->hw_pp->idx);

Was it intentional to drop the DPU_CTL_ACTIVE_CFG here but not replace 
it with core_major_rev >= 5?

<snip>

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 5f9cd09589bb403746d48af6f8555cd224bf3195..59d25916d2d412113768d71a76a6aed4c879299a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -716,7 +716,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
>   	c->caps = cfg;
>   	c->mdss_ver = mdss_ver;
>   
> -	if (c->caps->features & BIT(DPU_CTL_ACTIVE_CFG)) {
> +	if (mdss_ver->core_major_ver >= 5) {
>   		c->ops.trigger_flush = dpu_hw_ctl_trigger_flush_v1;
>   		c->ops.setup_intf_cfg = dpu_hw_ctl_intf_cfg_v1;
>   		c->ops.reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
> 

DPU ver 5 introduced active_cfg, so this part is correct. Hence overall 
change is fine.

