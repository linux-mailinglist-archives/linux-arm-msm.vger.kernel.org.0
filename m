Return-Path: <linux-arm-msm+bounces-21337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBE28D6811
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 19:18:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D10161F285D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 17:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C79E176AA4;
	Fri, 31 May 2024 17:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n4P59IhM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDE9176AAE;
	Fri, 31 May 2024 17:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717175880; cv=none; b=bfL8BXQjDs/UkEAEVzQBumPqUfZKrHeY2YR581Lqylrzls43/tpe72MEtpguT7GbJWCZOh6t1yI8olTDEaZlCt8B1GpNyfPMlnRBAFLhmLl0ALTYF1WF4Frt8hJ7gcQwMnuu/b47FbuiCEslgk1kfBsjsK9/AS6YiY5x2bdBt6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717175880; c=relaxed/simple;
	bh=7e0GOFdaAz4w7RhFyaN+0Pdb+JMcepp6j/U93Lin27M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TsyZo9mnvHVfLuG4uW6fIs5sJY9VDQre1vpyy7hEFJRJ8+v4Yk+Rh/bL6IiaPQYBbZgFizKIpUk1L/KRkTbwN1KiCq3ine7GkmWWHM9YP/ReZV2og+NXDyS/yAgE880dfy86h1XQGnl3/j8YzU11sgDhMwbr4M5a3gzAeiXp5m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n4P59IhM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V8rvuo027031;
	Fri, 31 May 2024 17:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SGYwVXLuJsO0EuoHM+Hb27z+fptn96KmO30dpEai5aU=; b=n4P59IhMe+BZsxKi
	L76zu1H4Zgpv4pIYHs/X9wR9p9ejD9W+VAYRfDrRWgmjW9xaWbnFoZatecc+KsQa
	1FYsE8oWaOmnza9+QhSf/3v7R3lv2xLG/Er7xWIMW3UQM4M/ZG8ERFQLku9WaYZe
	VQS87xGLKbC0Q5VEOVjBlQ9/DB0RMtTe3FrMB9Nv8OzyHCou5iOp5MeQ2Sdkw2X5
	DHvCo+ipgxHErvJfP9EfWWNh2RJyh+RaH5PB2n5BRMjlL+Zbxd8M5yLWS00ObKaP
	fk7+SLMhxMJv9lxC5MZiYtbicQcu58BZ0ezKmiAdIV3T8T/qKrHiPsjP7ZeWgS9i
	W3hLUQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2hfgd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 17:17:40 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44VHHeiE021373
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 17:17:40 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 May
 2024 10:17:39 -0700
Message-ID: <fdd2a53c-d7a1-45aa-b169-776fe0b016cf@quicinc.com>
Date: Fri, 31 May 2024 10:17:38 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] drm/msm/dpu: enable compression bit in cfg2 for
 DSC
Content-Language: en-US
To: Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>,
        "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        "Neil
 Armstrong" <neil.armstrong@linaro.org>
References: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-0-2ab1d334c657@linaro.org>
 <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-3-2ab1d334c657@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-3-2ab1d334c657@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CPr-yzlPCDGI4ohCXAJedTBR_mI58iC7
X-Proofpoint-ORIG-GUID: CPr-yzlPCDGI4ohCXAJedTBR_mI58iC7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 phishscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310131



On 5/29/2024 10:56 PM, Jun Nie wrote:
> Enable compression bit in cfg2 register for DSC in the DSI case
> per hardware version.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Hi Jun,

LGTM

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 8 +++++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 3 ++-
>   3 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 925ec6ada0e1..f2aab3e7c783 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -307,7 +307,8 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>   
>   	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
>   	phys_enc->hw_intf->ops.setup_timing_gen(phys_enc->hw_intf,
> -			&timing_params, fmt);
> +			&timing_params, fmt,
> +			phys_enc->dpu_kms->catalog->mdss_ver);
>   	phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, &intf_cfg);
>   
>   	/* setup which pp blk will connect to this intf */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index f97221423249..fa6debda0774 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -98,7 +98,8 @@
>   
>   static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
>   		const struct dpu_hw_intf_timing_params *p,
> -		const struct msm_format *fmt)
> +		const struct msm_format *fmt,
> +		const struct dpu_mdss_version *mdss_ver)
>   {
>   	struct dpu_hw_blk_reg_map *c = &intf->hw;
>   	u32 hsync_period, vsync_period;
> @@ -177,6 +178,11 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
>   	if (p->wide_bus_en && !dp_intf)
>   		data_width = p->width >> 1;
>   
> +	/* TODO: handle DSC+DP case, we only handle DSC+DSI case so far */
> +	if (p->compression_en && !dp_intf &&
> +	    mdss_ver->core_major_ver >= 7)
> +		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
> +
>   	hsync_data_start_x = hsync_start_x;
>   	hsync_data_end_x =  hsync_start_x + data_width - 1;
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index f9015c67a574..ef947bf77693 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -81,7 +81,8 @@ struct dpu_hw_intf_cmd_mode_cfg {
>   struct dpu_hw_intf_ops {
>   	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
>   			const struct dpu_hw_intf_timing_params *p,
> -			const struct msm_format *fmt);
> +			const struct msm_format *fmt,
> +			const struct dpu_mdss_version *mdss_ver);
>   
>   	void (*setup_prg_fetch)(struct dpu_hw_intf *intf,
>   			const struct dpu_hw_intf_prog_fetch *fetch);
> 
> -- 
> 2.34.1
> 

