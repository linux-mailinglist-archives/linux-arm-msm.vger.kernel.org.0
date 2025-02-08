Return-Path: <linux-arm-msm+bounces-47218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3FBA2D258
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 01:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91C38162E82
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 00:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28FF93D68;
	Sat,  8 Feb 2025 00:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OffX088E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBCB2CA6;
	Sat,  8 Feb 2025 00:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738975394; cv=none; b=DbVbXBt4+onQKF5Sp/GPS3Wv269LVD5eNf0PGxKZ//SzRwOSPAGK+r4I0vN0fKK5XFJoLrCxkak5t3m3vRu1r8gXnfsWUUg0WV4WJ2vRroh17aYWIHhcJ+Qm3xmhsb5MP6G0YxYbXyxXJmmsijFY74T7rG/4GbdfXgSZkx58cdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738975394; c=relaxed/simple;
	bh=hmOk+kVgEY0Gm3FuBx7MCIpGtTuGb1YVT7o392Sr0FE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YFpkVkD1/Sx4658cW/CI+ghso4gbDvnEPi8pWTy5OFsA78iuHRrcrJSyDyNry2uFz+iFW9DayWCrDO919HZAOZOrMy6TQKv1ZNICTjRkBMc+CnwmcHmhp3RgEWfHgDK8ZHdMSyLkn1Juik9Az/befJYy6J02X1Wl8l8XViPfduY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OffX088E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517FrckV002495;
	Sat, 8 Feb 2025 00:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KCEiIoHCtst/NhjzeQGoVC0FR2YSA7BYdxQis/rSROM=; b=OffX088EVJC02fFn
	ZoEivQTAiOTd7WGjxECmfAPqYCqVE8ytKduJtGgmDUwNIUs0ho7iObz7/j5fvgxA
	Sp7jhTSTfIUaiD62QIjo8z1gGtSkmOjtJRtSoLc8dFl1Na6kzwclaFhq3MIaKy3T
	GvUTrj+xfpvsmcfnLwiE67sD4lPjxXcJ3yWAwimYtd8SF0QrDXNDGct3H/ZsVJBm
	tjeMqX69yio2oRfRaKMg+MlwIZlusUZE5xHJt+5VKWLsJkTfJw3uO7043T00yFAe
	LYy5x3YJKey0Lz43RhM9r8K8fVXb1hRezKsfmULWZHPQ8zYGYhe4O9yka19SWN5w
	06a1mw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nn7fs3pm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Feb 2025 00:42:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5180gmHl008244
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 8 Feb 2025 00:42:48 GMT
Received: from [10.110.94.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Feb 2025
 16:42:47 -0800
Message-ID: <cdfa5cfd-6cdf-45cf-ac18-c2c217d4211a@quicinc.com>
Date: Fri, 7 Feb 2025 16:42:46 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/7] drm/msm/hdmi: program HDMI timings during
 atomic_pre_enable
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andrzej Hajda
	<andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert
 Foss <rfoss@kernel.org>,
        Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej
 Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Simona Vetter <simona@ffwll.ch>,
        Simona
 Vetter <simona.vetter@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
 <20250208-bridge-hdmi-connector-v7-2-0c3837f00258@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250208-bridge-hdmi-connector-v7-2-0c3837f00258@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RHTzmRBfGq36tSuCNDeI_LPDsup84izJ
X-Proofpoint-ORIG-GUID: RHTzmRBfGq36tSuCNDeI_LPDsup84izJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_11,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502080002



On 2/7/2025 4:27 PM, Dmitry Baryshkov wrote:
> The mode_set callback is deprecated, it doesn't get the
> drm_bridge_state, just mode-related argumetns. Also Abhinav pointed out
> that HDMI timings should be programmed after setting up HDMI PHY and
> PLL. Rework the code to program HDMI timings at the end of
> atomic_pre_enable().
> 

I think now this needs to be changed that, program the HDMI timings at 
the beginning of atomic_pre_enable() to match the location of mode_set()

With that fixed,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 24 ++++++++++++++++--------
>   1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> index d839c71091dcdc3b020fcbba8d698d58ee7fc749..bd94b3a70f0e5e457a88f089b491103a8c09567b 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> @@ -126,15 +126,29 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
>   	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
>   }
>   
> +static void msm_hdmi_set_timings(struct hdmi *hdmi,
> +				 const struct drm_display_mode *mode);
> +
>   static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>   					      struct drm_bridge_state *old_bridge_state)
>   {
> +	struct drm_atomic_state *state = old_bridge_state->base.state;
>   	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
>   	struct hdmi *hdmi = hdmi_bridge->hdmi;
>   	struct hdmi_phy *phy = hdmi->phy;
> +	struct drm_encoder *encoder = bridge->encoder;
> +	struct drm_connector *connector;
> +	struct drm_connector_state *conn_state;
> +	struct drm_crtc_state *crtc_state;
>   
>   	DBG("power up");
>   
> +	connector = drm_atomic_get_new_connector_for_encoder(state, encoder);
> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> +	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> +
> +	msm_hdmi_set_timings(hdmi, &crtc_state->adjusted_mode);
> +
>   	if (!hdmi->power_on) {
>   		msm_hdmi_phy_resource_enable(phy);
>   		msm_hdmi_power_on(bridge);
> @@ -177,17 +191,12 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
>   	}
>   }
>   
> -static void msm_hdmi_bridge_mode_set(struct drm_bridge *bridge,
> -		 const struct drm_display_mode *mode,
> -		 const struct drm_display_mode *adjusted_mode)
> +static void msm_hdmi_set_timings(struct hdmi *hdmi,
> +				 const struct drm_display_mode *mode)
>   {
> -	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> -	struct hdmi *hdmi = hdmi_bridge->hdmi;
>   	int hstart, hend, vstart, vend;
>   	uint32_t frame_ctrl;
>   
> -	mode = adjusted_mode;
> -
>   	hdmi->pixclock = mode->clock * 1000;
>   
>   	hstart = mode->htotal - mode->hsync_start;
> @@ -306,7 +315,6 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
>   	.atomic_reset = drm_atomic_helper_bridge_reset,
>   	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
>   	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
> -	.mode_set = msm_hdmi_bridge_mode_set,
>   	.mode_valid = msm_hdmi_bridge_mode_valid,
>   	.edid_read = msm_hdmi_bridge_edid_read,
>   	.detect = msm_hdmi_bridge_detect,
> 


