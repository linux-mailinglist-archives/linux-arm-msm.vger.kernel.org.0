Return-Path: <linux-arm-msm+bounces-20797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF068D232A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 20:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5FA41F211CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 18:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC3D328A0;
	Tue, 28 May 2024 18:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kGqkzwuL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112E1175AB;
	Tue, 28 May 2024 18:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716920140; cv=none; b=tvaYg3ZCaaj2Pvpa+j/UNT2GlWW01jwEY2IPsDKw2NTAfgb9GfV7Y8LxG5LtAR4AFaADjagOsef3zukMDb9Q0HT/DHf1B9uOMB6cHfPieIVawAIaIoayjBIlzL2Q5lWrqrTsumnTh3ToGK/SAXI7b3VVvb03MRutS/BsocNXqs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716920140; c=relaxed/simple;
	bh=4W5FCBBXvrTUdKPbuVNMMVHRss0A84zoHMEgZSbaSd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=naoJa0XPDh2XyOl5U/Rz0gjY0cEHDEHibuXr/qRhqCkE3m9cuhOaW4hVEIV+7zmTtlLZAa6pOMEAUUv7c4vEEYtCeKhh352uPkiWTnnnZYY5RDsq0k4VNJ+OWn3a6Q0EC504oxzfy0WkbXLEfO2JJDf/tvuKnTf7ttyT+Dp1eZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kGqkzwuL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SB0CUe018067;
	Tue, 28 May 2024 18:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NSohPjO+aHSrdO1H9ukl+Zfhzj2AbJc55gRsHXpRQeI=; b=kGqkzwuLTMG8wl9B
	sBcqBi7dfyUDzgOPIEOwU8QwbttsOIy75cF0z4K8mRNImwO3fEJKjfqxJEaMGkj8
	XIxI7nL/8jxPBLGAYD/9jtoPHkNsBQ+cmmaRO6BQpt+2TXDDB9tkU2+QTPPHr/S3
	TShJL1KA1V9tpv7RIPWof842OQdCYEHn9fc6lquJNPrzfSIyIDPto4ydum8Se977
	I1X8aJyYpTtFjZGoEm/DnjnTvVYhXdgdU/bRIb+dUP7Lxf/HS1hh/KH8wtqvlNg5
	H8FtvlUCsyh/1wig2inooJJYE0OGCR84XQXqNlH40QmKx6mdIh1OuophXapJhi/i
	4uNADw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2neyv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 18:14:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44SIEpjp031733
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 18:14:51 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 28 May
 2024 11:14:50 -0700
Message-ID: <5324b1d0-5aee-420c-a6a6-edf5262772b8@quicinc.com>
Date: Tue, 28 May 2024 11:14:49 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/display: split DSC helpers from DP helpers
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal
	<sumit.semwal@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        "Alex
 Deucher" <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi
	<rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Rob Clark
	<robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Vinod Koul
	<vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>
References: <20240522-panel-sw43408-fix-v3-0-6902285adcc0@linaro.org>
 <20240522-panel-sw43408-fix-v3-1-6902285adcc0@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240522-panel-sw43408-fix-v3-1-6902285adcc0@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KJj3kZhDHKb5JVjOHiO3rB0-tT27BD6_
X-Proofpoint-GUID: KJj3kZhDHKb5JVjOHiO3rB0-tT27BD6_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_12,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2405280136



On 5/21/2024 11:25 PM, Dmitry Baryshkov wrote:
> Currently the DRM DSC functions are selected by the
> DRM_DISPLAY_DP_HELPER Kconfig symbol. This is not optimal, since the DSI
> code (both panel and host drivers) end up selecting the seemingly
> irrelevant DP helpers. Split the DSC code to be guarded by the separate
> DRM_DISPLAY_DSC_HELPER Kconfig symbol.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Hi Dmitry,

LGTM

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> ---
>   drivers/gpu/drm/amd/amdgpu/Kconfig | 1 +
>   drivers/gpu/drm/display/Kconfig    | 6 ++++++
>   drivers/gpu/drm/display/Makefile   | 3 ++-
>   drivers/gpu/drm/i915/Kconfig       | 1 +
>   drivers/gpu/drm/msm/Kconfig        | 1 +
>   drivers/gpu/drm/panel/Kconfig      | 4 ++--
>   6 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
> index 22d88f8ef527..b69d5c4a5367 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
> @@ -6,6 +6,7 @@ config DRM_AMDGPU
>   	depends on !UML
>   	select FW_LOADER
>   	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_DSC_HELPER
>   	select DRM_DISPLAY_HDMI_HELPER
>   	select DRM_DISPLAY_HDCP_HELPER
>   	select DRM_DISPLAY_HELPER
> diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
> index 864a6488bfdf..f524cf95dec3 100644
> --- a/drivers/gpu/drm/display/Kconfig
> +++ b/drivers/gpu/drm/display/Kconfig
> @@ -59,6 +59,12 @@ config DRM_DISPLAY_DP_TUNNEL_STATE_DEBUG
>   
>   	  If in doubt, say "N".
>   
> +config DRM_DISPLAY_DSC_HELPER
> +	bool
> +	depends on DRM_DISPLAY_HELPER
> +	help
> +	  DRM display helpers for VESA DSC (used by DSI and DisplayPort).
> +
>   config DRM_DISPLAY_HDCP_HELPER
>   	bool
>   	depends on DRM_DISPLAY_HELPER
> diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
> index 17d2cc73ff56..2ec71e15c3cb 100644
> --- a/drivers/gpu/drm/display/Makefile
> +++ b/drivers/gpu/drm/display/Makefile
> @@ -6,7 +6,8 @@ drm_display_helper-y := drm_display_helper_mod.o
>   drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_HELPER) += \
>   	drm_dp_dual_mode_helper.o \
>   	drm_dp_helper.o \
> -	drm_dp_mst_topology.o \
> +	drm_dp_mst_topology.o
> +drm_display_helper-$(CONFIG_DRM_DISPLAY_DSC_HELPER) += \
>   	drm_dsc_helper.o
>   drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_TUNNEL) += \
>   	drm_dp_tunnel.o
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index 5932024f8f95..117b84260b1c 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -11,6 +11,7 @@ config DRM_I915
>   	select SHMEM
>   	select TMPFS
>   	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_DSC_HELPER
>   	select DRM_DISPLAY_HDCP_HELPER
>   	select DRM_DISPLAY_HDMI_HELPER
>   	select DRM_DISPLAY_HELPER
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 1931ecf73e32..6dcd26180611 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -111,6 +111,7 @@ config DRM_MSM_DSI
>   	depends on DRM_MSM
>   	select DRM_PANEL
>   	select DRM_MIPI_DSI
> +	select DRM_DISPLAY_DSC_HELPER
>   	default y
>   	help
>   	  Choose this option if you have a need for MIPI DSI connector
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 982324ef5a41..4a2f621433ef 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -547,7 +547,7 @@ config DRM_PANEL_RAYDIUM_RM692E5
>   	depends on OF
>   	depends on DRM_MIPI_DSI
>   	depends on BACKLIGHT_CLASS_DEVICE
> -	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_DSC_HELPER
>   	select DRM_DISPLAY_HELPER
>   	help
>   	  Say Y here if you want to enable support for Raydium RM692E5-based
> @@ -905,7 +905,7 @@ config DRM_PANEL_VISIONOX_R66451
>   	depends on OF
>   	depends on DRM_MIPI_DSI
>   	depends on BACKLIGHT_CLASS_DEVICE
> -	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_DSC_HELPER
>   	select DRM_DISPLAY_HELPER
>   	help
>   	  Say Y here if you want to enable support for Visionox
> 
> -- 
> 2.39.2
> 

