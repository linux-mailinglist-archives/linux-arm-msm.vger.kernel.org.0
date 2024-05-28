Return-Path: <linux-arm-msm+bounces-20842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA048D26F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 23:17:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F27AB220F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 21:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 251B317BB1B;
	Tue, 28 May 2024 21:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YygSffBF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF4B17B4F0;
	Tue, 28 May 2024 21:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716931013; cv=none; b=qR4mXdk0XitdNTQLkp2CnqvPN/PRYmkGtEw2Q+0/zaEKqndLsJzaAEubEdfGnBdBnCyCIDrP1A0bbwqBdPnbSB3ZEoXcg7M+s4dV6RxgBq2W37spCXu5GlIQR26C++AF9De+CILjIi5oNo2Dz84qZQtfHLe3sedzwKpOYKIprKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716931013; c=relaxed/simple;
	bh=ozPdZGWyJWdl4U2qdefcS/T8GjDcoCTXAMNSlFsbue4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UfYj3EQOWMxSry8/6L7/TmdU60awfL2E27ULcjBVW+uVtvi0277EW7Z2gh4ye7deopUQINT8I8xGKyRGBQCOMey6Nr9+4cWVPJC6g36+oIxdnKWJGkvdcavfOBWslx1QtA7G2c0tHyHuSSLHME3wfJNSPeNyMViV0h2MovjxFOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YygSffBF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SAjM5G016985;
	Tue, 28 May 2024 21:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l6lpryTJS+q85/sL/NdSWxe4EZqCUoiAFgyL5ZBhAWc=; b=YygSffBFWEcXo/nr
	JyPFemnnMFU3haOjXitbBQ5J8sbqanRcV3pPIgVjOdNt7arDLQ+UoOiUWqqMlWDU
	POh7Bn5ff4xvKyHN9e2W9i3HYCmk+ksHCQUpGMJ2DM0RFCbe4LfXrsX8fzjjEao2
	wk5s9+pRCwSASlbossskJLq4lTp1YILKtpl/qbk6bZLlxlGmEdlXNwl0/M0urbEN
	QMQDoVz7V/FbNSsJZGKhnmy6Njj3rtN90Y79Khajvcrl37tnMz7uRfl1oLiRSzbq
	kVioMu5aCVfci5yFh4k1JPoIIfKfxBiK/eUfP5aypNEWkFQs/7JE+P5cNcUnlywO
	jAoHrA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yb9yj7bjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 21:16:39 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44SLGcJ4022652
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 21:16:38 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 28 May
 2024 14:16:37 -0700
Message-ID: <70e03cd2-369e-4537-986d-50e517099b5b@quicinc.com>
Date: Tue, 28 May 2024 14:16:37 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] drm/msm/dpu: fix video mode DSC for DSI
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
        "Jonathan
 Marek" <jonathan@marek.ca>
References: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
 <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-1-f797ffba4682@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-1-f797ffba4682@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fwRQlZwFGcnADb390U-_EubohxWBkNUj
X-Proofpoint-ORIG-GUID: fwRQlZwFGcnADb390U-_EubohxWBkNUj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 clxscore=1011 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405280159



On 5/27/2024 7:21 AM, Jun Nie wrote:
> From: Jonathan Marek <jonathan@marek.ca>
> 
> Add width change in DPU timing for DSC compression case to work with
> DSI video mode.

Hi Jun,

LGTM

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     |  8 ++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 18 ++++++++++++++++++
>   3 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 119f3ea50a7c..48cef6e79c70 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -564,7 +564,7 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>   	return (num_dsc > 0) && (num_dsc > intf_count);
>   }
>   
> -static struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
> +struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
>   {
>   	struct msm_drm_private *priv = drm_enc->dev->dev_private;
>   	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 002e89cc1705..2167c46c1a45 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -334,6 +334,14 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
>    */
>   unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc);
>   
> +/**
> + * dpu_encoder_get_dsc_config - get DSC config for the DPU encoder
> + *   This helper function is used by physical encoder to get DSC config
> + *   used for this encoder.
> + * @drm_enc: Pointer to encoder structure
> + */
> +struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc);
> +
>   /**
>    * dpu_encoder_get_drm_fmt - return DRM fourcc format
>    * @phys_enc: Pointer to physical encoder structure
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index ef69c2f408c3..925ec6ada0e1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -11,6 +11,7 @@
>   #include "dpu_trace.h"
>   #include "disp/msm_disp_snapshot.h"
>   
> +#include <drm/display/drm_dsc_helper.h>
>   #include <drm/drm_managed.h>
>   
>   #define DPU_DEBUG_VIDENC(e, fmt, ...) DPU_DEBUG("enc%d intf%d " fmt, \
> @@ -115,6 +116,23 @@ static void drm_mode_to_intf_timing_params(
>   		timing->h_front_porch = timing->h_front_porch >> 1;
>   		timing->hsync_pulse_width = timing->hsync_pulse_width >> 1;
>   	}
> +
> +	/*
> +	 * for DSI, if compression is enabled, then divide the horizonal active
> +	 * timing parameters by compression ratio. bits of 3 components(R/G/B)
> +	 * is compressed into bits of 1 pixel.
> +	 */
> +	if (phys_enc->hw_intf->cap->type != INTF_DP && timing->compression_en) {
> +		struct drm_dsc_config *dsc =
> +		       dpu_encoder_get_dsc_config(phys_enc->parent);
> +		/*
> +		 * TODO: replace drm_dsc_get_bpp_int with logic to handle
> +		 * fractional part if there is fraction
> +		 */
> +		timing->width = timing->width * drm_dsc_get_bpp_int(dsc) /
> +				(dsc->bits_per_component * 3);
> +		timing->xres = timing->width;
> +	}
>   }
>   
>   static u32 get_horizontal_total(const struct dpu_hw_intf_timing_params *timing)
> 
> -- 
> 2.34.1
> 

