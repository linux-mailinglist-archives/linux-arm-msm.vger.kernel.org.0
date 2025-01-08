Return-Path: <linux-arm-msm+bounces-44480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E57C5A0690D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 23:58:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D835A166693
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 22:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F05C2040B9;
	Wed,  8 Jan 2025 22:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BLeO7cJS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C181F0E35;
	Wed,  8 Jan 2025 22:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736377088; cv=none; b=uosTU26676osrimBM70YGdB9Z506dtD0WtXolgrgm1LoHV+3ySE29LFeflCY/oBLaN02aDoJeAHw1R5+2W/WPkcEtRvINIaf03epqNXfwGtK1P9TwI4bOoc5h+96NrcgnEJJ8D0jA9wPizEbLOCeSqsw9/eHbtKv7T6wWunjuqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736377088; c=relaxed/simple;
	bh=Cshohvgtz5AjbQlWF3D44jajiUeYw+KDRDL04T5VaAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=a6QLTbbw3fFyBnTz/85ZpNJerjQWwFcefRCJiPgDNft6DgPagIdDqC/yzHd234Aj6GZaf/gA4/UrnsQ1+KjcdCY5GbtmsHB0lYB5vd/d9fW+mzBb8UQZyghZCzl1yF+qTrFoM9s8LainvQGB1934dfH98ka+mKlD1MmpSnyJQBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BLeO7cJS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508HbYAi011058;
	Wed, 8 Jan 2025 22:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p98cCh83eXBRhgvDaok/nnFwHA9Icwt64miGgMekXZM=; b=BLeO7cJSOg6gTFX4
	SfunO55HcspLg9W3HCK5BW8SSXTrQB8L3Kqo9Gcqj1kyJBs233d9cKeyJdZKc6Da
	NFqCk0oeI2xrEoUk39YBUdrYYkGj+d21ttG9SrO14OkizfnDGEBJfL02TDhb2id4
	vbfLCfUF59H6RvJmkufpXADvWivAiz4KP6AAYD8O0hWsLAOHD2t3/inKA66rXbl3
	pzzAPiC21GgWuScqs/SJrtHvGmZsm5ynSg7SOcuxF5jdwPUkvk3SXanJBL1ubTSS
	YNQIPM8Dm5gOotKcmbAmesGMq3BB2/DobqSgdgETI2yZta/P7b0mkCcdVaBHrpMm
	EnE+Kg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441wx60p1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 22:57:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508MvgS5001751
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 22:57:42 GMT
Received: from [10.71.108.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 14:57:41 -0800
Message-ID: <feb4f780-8fe6-426b-9ba4-ab1fb102ac27@quicinc.com>
Date: Wed, 8 Jan 2025 14:57:41 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/msm/dp: Add support for LTTPR handling
To: Abel Vesa <abel.vesa@linaro.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Karol Herbst <kherbst@redhat.com>, Lyude
 Paul <lyude@redhat.com>,
        Danilo Krummrich <dakr@redhat.com>,
        Jani Nikula
	<jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin
	<tursulin@ursulin.net>,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Johan Hovold <johan@kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
        <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
        Johan Hovold <johan+linaro@kernel.org>
References: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-0-918949bc2e3a@linaro.org>
 <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-4-918949bc2e3a@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-4-918949bc2e3a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tnfjmy_HVMVoRj9bM5AAf9LrVJSbltAO
X-Proofpoint-ORIG-GUID: tnfjmy_HVMVoRj9bM5AAf9LrVJSbltAO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 mlxscore=0 spamscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=999 phishscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501080186



On 1/8/2025 6:31 AM, Abel Vesa wrote:
> Link Training Tunable PHY Repeaters (LTTPRs) are defined in DisplayPort
> 1.4a specification. As the name suggests, these PHY repeaters are
> capable of adjusting their output for link training purposes.
> 
> According to the DisplayPort standard, LTTPRs have two operating
> modes:
>   - non-transparent - it replies to DPCD LTTPR field specific AUX
>     requests, while passes through all other AUX requests
>   - transparent - it passes through all AUX requests.
> 
> Switching between this two modes is done by the DPTX by issuing
> an AUX write to the DPCD PHY_REPEATER_MODE register.
> 
> The msm DP driver is currently lacking any handling of LTTPRs.
> This means that if at least one LTTPR is found between DPTX and DPRX,
> the link training would fail if that LTTPR was not already configured
> in transparent mode.
> 
> The section 3.6.6.1 from the DisplayPort v2.0 specification mandates
> that before link training with the LTTPR is started, the DPTX may place
> the LTTPR in non-transparent mode by first switching to transparent mode
> and then to non-transparent mode. This operation seems to be needed only
> on first link training and doesn't need to be done again until device is
> unplugged.
> 
> It has been observed on a few X Elite-based platforms which have
> such LTTPRs in their board design that the DPTX needs to follow the
> procedure described above in order for the link training to be successful.
> 
> So add support for reading the LTTPR DPCD caps to figure out the number
> of such LTTPRs first. Then, for platforms (or Type-C dongles) that have
> at least one such an LTTPR, set its operation mode to transparent mode
> first and then to non-transparent, just like the mentioned section of
> the specification mandates.
> 
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 24dd37f1682bf5016bb0efbeb44489061deff060..ad09daa4c8ab5c0eb67890509b94e72820bab870 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -107,6 +107,8 @@ struct msm_dp_display_private {
>   	struct msm_dp_event event_list[DP_EVENT_Q_MAX];
>   	spinlock_t event_lock;
>   
> +	u8 lttpr_caps[DP_LTTPR_COMMON_CAP_SIZE];
> +

The reason downstream stored it panel is to read it first in dp_panel's 
read_sink_caps and call lttpr_init if drm_dp_lttpr_count() is non-zero.

But here it looks like  msm_dp_display_lttpr_init() internally handles 
this for us. So no need to store this?

>   	bool wide_bus_supported;
>   
>   	struct msm_dp_audio *audio;
> @@ -367,12 +369,27 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
>   	return 0;
>   }
>   
> +static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp)
> +{
> +	int rc;
> +
> +	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd,
> +					  dp->lttpr_caps))
> +		return;
> +
> +	rc = drm_dp_lttpr_init(dp->aux, drm_dp_lttpr_count(dp->lttpr_caps));
> +	if (rc)
> +		DRM_ERROR("failed to set LTTPRs transparency mode, rc=%d\n", rc);
> +}
> +
>   static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>   {
>   	struct drm_connector *connector = dp->msm_dp_display.connector;
>   	const struct drm_display_info *info = &connector->display_info;
>   	int rc = 0;
>   
> +	msm_dp_display_lttpr_init(dp);
> +

Can you pls move this call after msm_dp_panel_read_sink_caps()?

If msm_dp_panel_read_sink_caps() fails there is no need to call 
msm_dp_display_lttpr_init().


>   	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
>   	if (rc)
>   		goto end;
> 

