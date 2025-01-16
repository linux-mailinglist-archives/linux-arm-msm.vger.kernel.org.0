Return-Path: <linux-arm-msm+bounces-45176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BABA12F9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 01:22:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F25E163975
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 00:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A79B079F2;
	Thu, 16 Jan 2025 00:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j2aQ8NAj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A872612E7F;
	Thu, 16 Jan 2025 00:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736986969; cv=none; b=XAly71Gdl+RJWF17VINbVuP+xatwdJfl6Q4XADCJUqQvrSshK+jjmyBCKU/rtecgs8Uup05mZ6iReMqjrjv9miBgVaNvbFmGLhISXPYdKZzO9DQ7EVTiU7iPOEEW/oDW3c3AYacxrkBfuDt0WKuzpsfjKEBLosFZud3U8PBLf+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736986969; c=relaxed/simple;
	bh=bWtimwkHl2oCiMWArRPdE9sF28Fjfjh2Lsvx17l3bzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AjI5YbFEmWXyesBLxff2hG+mA2ZO0qA5SlbSxGG3u6QqOEpk/e2+vgl+Y6zGXtkJDjZ4YwK22MXSPoC3r3pJ9IYp3XJIvLZK8FgbO//L+oyFd4bgcNg2R1uIdY+51KJWhngB5UPwCe6Bh0/fVjHjDSRFmAHHGgzvpPX3oWtInGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j2aQ8NAj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50FKrXE0009150;
	Thu, 16 Jan 2025 00:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zwgXD6l+RPhppBWNecC0ZH6aE0wVTyQQuP2kFS04e4k=; b=j2aQ8NAjtG0G5AnS
	kjGOTL/z3BUfyhBImvf4qzMW4RxD0A288ZMdWHgjLznWfKOg6gx662OxV5xkLQhN
	ApR1DyqHzqMkyW+jf0nCxGhoXipH62YJ9bmodllhxr6sO6jQn0vSwQZ4Yp687e2A
	X4Qj7/QMHWFft7JOrayu9CfopK8w45E32XU0dZazOBuQ8ON6TcywW9jNsyEcIEyN
	I+Lyshk1jf1KA5cHg7c8Dl13E1onHkwbOHpVW5+9EmA03nXWS0UpdJB44uhmP7Gk
	tZhhUasoq3eVeRmITIwaKLw5xukkHc5sERmja0qrrrt/eGI64FdO66YEk57DyCWz
	ZV8nUg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446mf2gbac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 00:22:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50G0Ma8W023665
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 00:22:36 GMT
Received: from [10.71.108.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 Jan
 2025 16:22:35 -0800
Message-ID: <76facac9-5db8-4dac-8aeb-099b0e4bc389@quicinc.com>
Date: Wed, 15 Jan 2025 16:22:34 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/35] drm/msm/dpu: stop passing mdss_ver to
 setup_timing_gen()
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
 <20241214-dpu-drop-features-v1-3-988f0662cb7e@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241214-dpu-drop-features-v1-3-988f0662cb7e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5z9Ym2VIgyLKWOQavaf9KJrmLQxh2oHC
X-Proofpoint-GUID: 5z9Ym2VIgyLKWOQavaf9KJrmLQxh2oHC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_10,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160001



On 12/13/2024 2:14 PM, Dmitry Baryshkov wrote:
> As a preparation to further MDSS-revision cleanups stop passing MDSS
> revision to the setup_timing_gen() callback. Instead store a pointer to
> it inside struct dpu_hw_intf and use it diretly. It's not that the MDSS
> revision can chance between dpu_hw_intf_init() and
> dpu_encoder_phys_vid_setup_timing_engine().
> 

Not seeing anything wrong with this patch OR the need to absolutely do 
this either. Will revisit after rest of the series to see where we are 
going with this as the intention is not clear.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 +--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 7 ++++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 5 +++--
>   3 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index abd6600046cb3a91bf88ca240fd9b9c306b0ea2e..3e0f1288ad17e19f6d0b7c5dcba19d3e5977a461 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -307,8 +307,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>   
>   	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
>   	phys_enc->hw_intf->ops.setup_timing_gen(phys_enc->hw_intf,
> -			&timing_params, fmt,
> -			phys_enc->dpu_kms->catalog->mdss_ver);
> +			&timing_params, fmt);
>   	phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, &intf_cfg);
>   
>   	/* setup which pp blk will connect to this intf */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index fb1d25baa518057e74fec3406faffd48969d492b..1d56c21ac79095ab515aeb485346e1eb5793c260 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -98,8 +98,7 @@
>   
>   static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
>   		const struct dpu_hw_intf_timing_params *p,
> -		const struct msm_format *fmt,
> -		const struct dpu_mdss_version *mdss_ver)
> +		const struct msm_format *fmt)
>   {
>   	struct dpu_hw_blk_reg_map *c = &intf->hw;
>   	u32 hsync_period, vsync_period;
> @@ -180,7 +179,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
>   
>   	/* TODO: handle DSC+DP case, we only handle DSC+DSI case so far */
>   	if (p->compression_en && !dp_intf &&
> -	    mdss_ver->core_major_ver >= 7)
> +	    intf->mdss_ver->core_major_ver >= 7)
>   		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
>   
>   	hsync_data_start_x = hsync_start_x;
> @@ -580,6 +579,8 @@ struct dpu_hw_intf *dpu_hw_intf_init(struct drm_device *dev,
>   	c->idx = cfg->id;
>   	c->cap = cfg;
>   
> +	c->mdss_ver = mdss_rev;
> +
>   	c->ops.setup_timing_gen = dpu_hw_intf_setup_timing_engine;
>   	c->ops.setup_prg_fetch  = dpu_hw_intf_setup_prg_fetch;
>   	c->ops.get_status = dpu_hw_intf_get_status;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index 114be272ac0ae67fe0d4dfc0c117baa4106f77c9..f31067a9aaf1d6b96c77157135122e5e8bccb7c4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -81,8 +81,7 @@ struct dpu_hw_intf_cmd_mode_cfg {
>   struct dpu_hw_intf_ops {
>   	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
>   			const struct dpu_hw_intf_timing_params *p,
> -			const struct msm_format *fmt,
> -			const struct dpu_mdss_version *mdss_ver);
> +			const struct msm_format *fmt);
>   
>   	void (*setup_prg_fetch)(struct dpu_hw_intf *intf,
>   			const struct dpu_hw_intf_prog_fetch *fetch);
> @@ -126,6 +125,8 @@ struct dpu_hw_intf {
>   	enum dpu_intf idx;
>   	const struct dpu_intf_cfg *cap;
>   
> +	const struct dpu_mdss_version *mdss_ver;
> +
>   	/* ops */
>   	struct dpu_hw_intf_ops ops;
>   };
> 

