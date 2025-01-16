Return-Path: <linux-arm-msm+bounces-45189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BBBA13179
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 03:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EB203A805C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 02:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6DF37082D;
	Thu, 16 Jan 2025 02:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jIB2JxmW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EA124A7C0;
	Thu, 16 Jan 2025 02:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736994795; cv=none; b=IDJKjVLOhR4poXQ0knDuKRWUSPOGuyKO6TBk2ozqB2qpXgytC0aBKS5hX88Sz/ERrysigDFxAc6aOHPjiL7XJ+9KAdpyz9+64wIXHILDShRXsJWJS2dQqm5evleuS+5QMVP/Su8eBxLvMppnrmIX3PVfhqPd85ZgEH9t+cV0gn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736994795; c=relaxed/simple;
	bh=vYTL5eouEDpTEdn8YIBwYtdtI3LySjf+wY9fAGIszhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=U+nd4B+4PwUWtfh+nn4BxzkZBIjIXKcp3krbmLbp8xOqiIbSeryU1HIEpexZl+JT4xuilcjSzmDgjaTYchOZEh9VtrcdKFHkivUpNdqObmFcbJUO4G6Fixcc27km9l7FIaKFtN69y3IlvBUbBkybQJZrP2jwYgA8SXcojBx2Qhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jIB2JxmW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50FGn6ZX028620;
	Thu, 16 Jan 2025 02:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QFeN19CdtdejQCUv1aBy294fvf8Q/jBGsyEq2hnoj98=; b=jIB2JxmW22sotYvz
	cJSVry2VzoYa8352qt3jWgMAM7SOBnErQ/KgfTTYyDHnCdW83KRdBDhGXcZjyBDP
	PDn4iCDsCoWjNLcQgivYPaDznacnNhIVVNZjhqCSWen8atAym4O3RlM4Xu7vlniJ
	5jaO8c4jb4UCY6evZ+J07BDdVZmT6VwBYLvTznVTsJQ/4IntX55h28NSf422lY57
	jvDNa5HGMKT1Q8ubJKtnR2BXcwfCiILmzqbbVSAIwWVJA3Ms76BoBbvqZZqrjW/R
	JUjJ/FZ0mBASSgy0oO7xBTH1K/kPcq1Swjqmow8b5gNEFn3k369hwU/uVEs9vJmX
	7sxvcQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446fgm1crk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 02:33:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50G2X08p032540
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 02:33:00 GMT
Received: from [10.71.108.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 Jan
 2025 18:32:59 -0800
Message-ID: <a92d4183-e139-479d-b33a-1ea603e941c4@quicinc.com>
Date: Wed, 15 Jan 2025 18:32:59 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/35] drm/msm/dpu: inline _setup_ctl_ops()
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
 <20241214-dpu-drop-features-v1-5-988f0662cb7e@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241214-dpu-drop-features-v1-5-988f0662cb7e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JhfIgyMGf6aLDnSKqAMYLhT_-sEV1I9_
X-Proofpoint-ORIG-GUID: JhfIgyMGf6aLDnSKqAMYLhT_-sEV1I9_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_11,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160015



On 12/13/2024 2:14 PM, Dmitry Baryshkov wrote:
> Inline the _setup_ctl_ops() function, it makes it easier to handle
> different conditions involving CTL configuration.
> 

Nothing really wrong with the change. Like the previous patch, would 
like to check the other changes to see where we are going with this and 
get back to this one.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 96 ++++++++++++++----------------
>   1 file changed, 46 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 4893f10d6a5832521808c0f4d8b231c356dbdc41..9a958a0c19f54c2ed2c204e314dfa8cd9e735111 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -687,55 +687,6 @@ static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,
>   	DPU_REG_WRITE(&ctx->hw, CTL_FETCH_PIPE_ACTIVE, val);
>   }
>   
> -static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
> -		unsigned long cap)
> -{
> -	if (cap & BIT(DPU_CTL_ACTIVE_CFG)) {
> -		ops->trigger_flush = dpu_hw_ctl_trigger_flush_v1;
> -		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg_v1;
> -		ops->reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
> -		ops->update_pending_flush_intf =
> -			dpu_hw_ctl_update_pending_flush_intf_v1;
> -
> -		ops->update_pending_flush_periph =
> -			dpu_hw_ctl_update_pending_flush_periph_v1;
> -
> -		ops->update_pending_flush_merge_3d =
> -			dpu_hw_ctl_update_pending_flush_merge_3d_v1;
> -		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
> -		ops->update_pending_flush_dsc =
> -			dpu_hw_ctl_update_pending_flush_dsc_v1;
> -		ops->update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm_v1;
> -	} else {
> -		ops->trigger_flush = dpu_hw_ctl_trigger_flush;
> -		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
> -		ops->update_pending_flush_intf =
> -			dpu_hw_ctl_update_pending_flush_intf;
> -		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb;
> -		ops->update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm;
> -	}
> -	ops->clear_pending_flush = dpu_hw_ctl_clear_pending_flush;
> -	ops->update_pending_flush = dpu_hw_ctl_update_pending_flush;
> -	ops->get_pending_flush = dpu_hw_ctl_get_pending_flush;
> -	ops->get_flush_register = dpu_hw_ctl_get_flush_register;
> -	ops->trigger_start = dpu_hw_ctl_trigger_start;
> -	ops->is_started = dpu_hw_ctl_is_started;
> -	ops->trigger_pending = dpu_hw_ctl_trigger_pending;
> -	ops->reset = dpu_hw_ctl_reset_control;
> -	ops->wait_reset_status = dpu_hw_ctl_wait_reset_status;
> -	ops->clear_all_blendstages = dpu_hw_ctl_clear_all_blendstages;
> -	ops->setup_blendstage = dpu_hw_ctl_setup_blendstage;
> -	ops->update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
> -	ops->update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
> -	if (cap & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
> -		ops->update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_sub_blocks;
> -	else
> -		ops->update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
> -
> -	if (cap & BIT(DPU_CTL_FETCH_ACTIVE))
> -		ops->set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
> -};
> -
>   /**
>    * dpu_hw_ctl_init() - Initializes the ctl_path hw driver object.
>    * Should be called before accessing any ctl_path register.
> @@ -761,7 +712,52 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
>   	c->hw.log_mask = DPU_DBG_MASK_CTL;
>   
>   	c->caps = cfg;
> -	_setup_ctl_ops(&c->ops, c->caps->features);
> +
> +	if (c->caps->features & BIT(DPU_CTL_ACTIVE_CFG)) {
> +		c->ops.trigger_flush = dpu_hw_ctl_trigger_flush_v1;
> +		c->ops.setup_intf_cfg = dpu_hw_ctl_intf_cfg_v1;
> +		c->ops.reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
> +		c->ops.update_pending_flush_intf =
> +			dpu_hw_ctl_update_pending_flush_intf_v1;
> +
> +		c->ops.update_pending_flush_periph =
> +			dpu_hw_ctl_update_pending_flush_periph_v1;
> +
> +		c->ops.update_pending_flush_merge_3d =
> +			dpu_hw_ctl_update_pending_flush_merge_3d_v1;
> +		c->ops.update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
> +		c->ops.update_pending_flush_dsc =
> +			dpu_hw_ctl_update_pending_flush_dsc_v1;
> +		c->ops.update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm_v1;
> +	} else {
> +		c->ops.trigger_flush = dpu_hw_ctl_trigger_flush;
> +		c->ops.setup_intf_cfg = dpu_hw_ctl_intf_cfg;
> +		c->ops.update_pending_flush_intf =
> +			dpu_hw_ctl_update_pending_flush_intf;
> +		c->ops.update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb;
> +		c->ops.update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm;
> +	}
> +	c->ops.clear_pending_flush = dpu_hw_ctl_clear_pending_flush;
> +	c->ops.update_pending_flush = dpu_hw_ctl_update_pending_flush;
> +	c->ops.get_pending_flush = dpu_hw_ctl_get_pending_flush;
> +	c->ops.get_flush_register = dpu_hw_ctl_get_flush_register;
> +	c->ops.trigger_start = dpu_hw_ctl_trigger_start;
> +	c->ops.is_started = dpu_hw_ctl_is_started;
> +	c->ops.trigger_pending = dpu_hw_ctl_trigger_pending;
> +	c->ops.reset = dpu_hw_ctl_reset_control;
> +	c->ops.wait_reset_status = dpu_hw_ctl_wait_reset_status;
> +	c->ops.clear_all_blendstages = dpu_hw_ctl_clear_all_blendstages;
> +	c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
> +	c->ops.update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
> +	c->ops.update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
> +	if (c->caps->features & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
> +		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_sub_blocks;
> +	else
> +		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
> +
> +	if (c->caps->features & BIT(DPU_CTL_FETCH_ACTIVE))
> +		c->ops.set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
> +
>   	c->idx = cfg->id;
>   	c->mixer_count = mixer_count;
>   	c->mixer_hw_caps = mixer;
> 

