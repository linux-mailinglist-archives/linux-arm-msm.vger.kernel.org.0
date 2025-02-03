Return-Path: <linux-arm-msm+bounces-46821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F73A263D0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 20:34:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C54B162F27
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 19:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA2C225D6;
	Mon,  3 Feb 2025 19:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H3EZQJHA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD35F25A656;
	Mon,  3 Feb 2025 19:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738611265; cv=none; b=YpxO8VoK8ogq/ExSHE5L4s5ZvJiNtj0RqwogxrJ6mQEwZSIGuwA3aTCbopPM47xn5HwJe+Snd4lJ42L2h9KaM7czY4oJsJ6PFbKLi1+bv737FUCjWLro8OEL4Q38cCXupYUi6uFaDT2QZlnNxbfKS5n7BX/SZ5IeHYsUXvwMSkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738611265; c=relaxed/simple;
	bh=l1Knp85VPmP85x/G2xju+FFaJDf6ir91vvJbrjZv3D8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hSqVNooYM6R3hfaTfkZqN120Ib4ThD75R5a2HKn3d4Rh8mDoPPNcDhw/PC//4snwl3uJ8YrFHMn0ozQ25Ccpaok+H07gzC5gS6cvujZbYJXaKpuJDAVmHxXQf94NRYK8/1xrDqHu1Z8mPY2rv+dm1Z69DWLvL4HECR0puiyIc0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H3EZQJHA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513GVl0p001743;
	Mon, 3 Feb 2025 19:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EEx1faHtWayURSJMhcfwlWtkv7eTjWe2BOmxHtVYkNg=; b=H3EZQJHAb68TjwMZ
	Rr5oBxuv/V9DAhYn1OuHL/K5UMrVSjQM0TOje6XO2aWJTu/iZPzxfkhke/gWWCWz
	68ScONt1wxzRVTcKiisLWdz+rcC9lmWqdGQWfb0ZElnaiDdAvzhgguQt8SuYQ5VI
	0JQlRH649SOSRNKDcTlEasRlRO5Gn04NGForPw9eztrxj3k6tsSbV2j+MgCSw/+i
	oVdtYY+pu0Esa2AXpVINQPy0OBm4RV7YF2sHwVbYIzeZnamSOx2maLyrIabpxk1p
	TwlE1oN94FM2wyETxbuAYwd971CYb3qJ7wafKYimzAV4GLd1odloVbWlwFOK/tj9
	6Yarkg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k1d9gd8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 19:34:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 513JY2jw013028
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Feb 2025 19:34:02 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Feb 2025
 11:34:01 -0800
Message-ID: <7fbfc7d5-f6bb-4f99-914a-f91bb7d153fd@quicinc.com>
Date: Mon, 3 Feb 2025 11:34:00 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] drm/msm/hdmi: program HDMI timings during
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
References: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
 <20250124-bridge-hdmi-connector-v6-2-1592632327f7@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250124-bridge-hdmi-connector-v6-2-1592632327f7@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yys7UUhnR4DnPBn10Ydjh1R3aFEpRAA-
X-Proofpoint-ORIG-GUID: yys7UUhnR4DnPBn10Ydjh1R3aFEpRAA-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_08,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030142



On 1/24/2025 1:47 PM, Dmitry Baryshkov wrote:
> The mode_set callback is deprecated, it doesn't get the
> drm_bridge_state, just mode-related argumetns. Also Abhinav pointed out
> that HDMI timings should be programmed after setting up HDMI PHY and
> PLL. Rework the code to program HDMI timings at the end of
> atomic_pre_enable().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 23 +++++++++++++++--------
>   1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> index d839c71091dcdc3b020fcbba8d698d58ee7fc749..d5ab1f74c0e6f47dc59872c016104e9a84d85e9e 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> @@ -126,15 +126,26 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
>   	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
>   }
>   
> +static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
> +					       const struct drm_display_mode *mode);
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
>   	if (!hdmi->power_on) {
>   		msm_hdmi_phy_resource_enable(phy);
>   		msm_hdmi_power_on(bridge);
> @@ -151,6 +162,8 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>   
>   	if (hdmi->hdcp_ctrl)
>   		msm_hdmi_hdcp_on(hdmi->hdcp_ctrl);
> +
> +	msm_hdmi_bridge_atomic_set_timings(hdmi, &crtc_state->adjusted_mode);
>   }
>   

This addresses my comment about setting up the HDMI timing registers 
before setting up the timing engine registers.

But prior to this change, mode_set was doing the same thing as 
msm_hdmi_bridge_atomic_set_timings() which means 
msm_hdmi_bridge_atomic_set_timings() should be called at the beginning 
of pre_enable()?

The controller is enabled in msm_hdmi_set_mode(). So this should be done 
before that.

>   static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> @@ -177,17 +190,12 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
>   	}
>   }
>   
> -static void msm_hdmi_bridge_mode_set(struct drm_bridge *bridge,
> -		 const struct drm_display_mode *mode,
> -		 const struct drm_display_mode *adjusted_mode)
> +static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
> +					       const struct drm_display_mode *mode)
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
> @@ -306,7 +314,6 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
>   	.atomic_reset = drm_atomic_helper_bridge_reset,
>   	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
>   	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
> -	.mode_set = msm_hdmi_bridge_mode_set,
>   	.mode_valid = msm_hdmi_bridge_mode_valid,
>   	.edid_read = msm_hdmi_bridge_edid_read,
>   	.detect = msm_hdmi_bridge_detect,
> 

