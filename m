Return-Path: <linux-arm-msm+bounces-8581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2E383EAC1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jan 2024 04:57:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C9141C21854
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jan 2024 03:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AFD04436;
	Sat, 27 Jan 2024 03:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j3NvFmH/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18A833C7
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jan 2024 03:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706327870; cv=none; b=jSp+JerhXFNpH1FS4rRuqWY76wysvwTJ9Azxlvf3CGZTjzKD61UA/Ndp5qRuFOpwYbIdogD+3JMWNx63PkYFSsh9gQ9tFCF5N7+NdYPUMYQACAQVeOJUQEdtrhfLBaSO+D2efSAA0ovBUncufOMKzRyS1K7PJMxvRVOoH6n4UqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706327870; c=relaxed/simple;
	bh=aeW70uJW5akJTxKQ06+Ub290N2u+lEsNyCNZn02T4Sk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WiMTZCNZ6xc6rWHqPRAc3mIqeExrQLVGfPpBHzRdZMrP+BHrVdRVhSfjyuGDtWhSkocy0+Idpgpz5mhQDJPZGTI4TP/yJw2bKFIcyZgtjQD06rItaGAGmbgvYpR4EoluzFwdtmyfQa+Q+K+i1EmMgvkbmK0b/R8pR/DG8S3Vuso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j3NvFmH/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40R3UMl3012456;
	Sat, 27 Jan 2024 03:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=fKPlJvM2VbwV0YYdzLEsg7hUXXy7nIYFQhoWIiWegZM=; b=j3
	NvFmH/Y7X1V784w1ZR6HxGo+YJRaBkJi+okwKaX2GJWBn4q3cAw7ywqXF+7t3WMi
	nyywF82y7L6/QtqoM9f/H6Pu0KUJ3ZgPxqou6Tq7tpSIGDlg5iV2yDl4+UeefAQv
	p3dmblsnnZdkJvm9p20Df53oTXvkLfG/sCfb8+xAV7ENOw4fu3nW1IMl8/wpECMX
	WDf9p8JyoGw2eWIdGbsMNRSVJVyC/OY1ofaUZe9qFNL/hLmScCVaPleOK3QUgK8R
	0w6BN3q35Ay27N0Xp+AsgKfFDK7Sd26qNvbAgE2eAbxrlQWIqzienzzN9OyXm02n
	CYPXe9H8igPIkMQyALoQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vv8e8a4y2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Jan 2024 03:57:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40R3vYFS012711
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Jan 2024 03:57:34 GMT
Received: from [10.110.98.98] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 19:57:33 -0800
Message-ID: <961d8e06-1ad1-e6af-4739-3d285a85fec7@quicinc.com>
Date: Fri, 26 Jan 2024 19:57:33 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 05/17] drm/msm/dp: add an API to indicate if sink supports
 VSC SDP
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Paloma Arellano
	<quic_parellan@quicinc.com>
CC: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-6-quic_parellan@quicinc.com>
 <e1a13e45-e87c-4c7b-a5cb-f46d51e66058@linaro.org>
 <1351d4b7-846c-f736-ac17-332291ed8609@quicinc.com>
 <CAA8EJpq7OB1=e+K16ZywPj_JU8Z7R2=LKDwrAD1ZFnurwHvC+A@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpq7OB1=e+K16ZywPj_JU8Z7R2=LKDwrAD1ZFnurwHvC+A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dTvUmkCrjJUUqs2fD8T7VQyrEdxhwvlz
X-Proofpoint-ORIG-GUID: dTvUmkCrjJUUqs2fD8T7VQyrEdxhwvlz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401270028



On 1/26/2024 6:40 PM, Dmitry Baryshkov wrote:
> On Sat, 27 Jan 2024 at 02:58, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>>
>>
>> On 1/25/2024 1:23 PM, Dmitry Baryshkov wrote:
>>> On 25/01/2024 21:38, Paloma Arellano wrote:
>>>> YUV420 format is supported only in the VSC SDP packet and not through
>>>> MSA. Hence add an API which indicates the sink support which can be used
>>>> by the rest of the DP programming.
>>>
>>> This API ideally should go to drm/display/drm_dp_helper.c
>> I'm not familiar how other vendors are checking if VSC SDP is supported.
>> So in moving this API, I'm going to let the other vendors make the
>> changes themselves.
> 
> Let me show it for you:
> 
> bool intel_dp_get_colorimetry_status(struct intel_dp *intel_dp)
> {
>          u8 dprx = 0;
> 
>          if (drm_dp_dpcd_readb(&intel_dp->aux, DP_DPRX_FEATURE_ENUMERATION_LIST,
>                                &dprx) != 1)
>                  return false;
>          return dprx & DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED;
> }
> 

Even AMD has similar logic:

6145 		stream->use_vsc_sdp_for_colorimetry = false;
6146 		if (aconnector->dc_sink->sink_signal == 
SIGNAL_TYPE_DISPLAY_PORT_MST) {
6147 			stream->use_vsc_sdp_for_colorimetry =
6148 				aconnector->dc_sink->is_vsc_sdp_colorimetry_supported;
6149 		} else {
6150 			if 
(stream->link->dpcd_caps.dprx_feature.bits.VSC_SDP_COLORIMETRY_SUPPORTED)
6151 				stream->use_vsc_sdp_for_colorimetry = true;
6152 		}

But it will be harder to untangle this compared to intel's code.

I am fine with adding an API to drm_dp_helper which indicates presence 
of VSC SDP but I would prefer leaving it to other vendors to use it in 
the way they would like and only keep msm usage in this series.



> 
>>>
>>>>
>>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>>>>    drivers/gpu/drm/msm/dp/dp_panel.c   | 35 +++++++++++++++++++++++++----
>>>>    drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
>>>>    3 files changed, 34 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> index ddac55f45a722..f6b3b6ca242f8 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> @@ -1617,7 +1617,8 @@ void dp_bridge_mode_set(struct drm_bridge
>>>> *drm_bridge,
>>>>            !!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
>>>>          dp_display->dp_mode.out_fmt_is_yuv_420 =
>>>> - drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode);
>>>> + drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode) &&
>>>> +        dp_panel_vsc_sdp_supported(dp_display->panel);
>>>>          /* populate wide_bus_support to different layers */
>>>>        dp_display->ctrl->wide_bus_en =
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c
>>>> b/drivers/gpu/drm/msm/dp/dp_panel.c
>>>> index 127f6af995cd1..af7820b6d35ec 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>>>> @@ -17,6 +17,9 @@ struct dp_panel_private {
>>>>        struct dp_link *link;
>>>>        struct dp_catalog *catalog;
>>>>        bool panel_on;
>>>> +    bool vsc_supported;
>>>> +    u8 major;
>>>> +    u8 minor;
>>>>    };
>>>>      static void dp_panel_read_psr_cap(struct dp_panel_private *panel)
>>>> @@ -43,9 +46,10 @@ static void dp_panel_read_psr_cap(struct
>>>> dp_panel_private *panel)
>>>>    static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
>>>>    {
>>>>        int rc;
>>>> +    ssize_t rlen;
>>>>        struct dp_panel_private *panel;
>>>>        struct dp_link_info *link_info;
>>>> -    u8 *dpcd, major, minor;
>>>> +    u8 *dpcd, rx_feature;
>>>>          panel = container_of(dp_panel, struct dp_panel_private,
>>>> dp_panel);
>>>>        dpcd = dp_panel->dpcd;
>>>> @@ -53,10 +57,19 @@ static int dp_panel_read_dpcd(struct dp_panel
>>>> *dp_panel)
>>>>        if (rc)
>>>>            return rc;
>>>>    +    rlen = drm_dp_dpcd_read(panel->aux,
>>>> DP_DPRX_FEATURE_ENUMERATION_LIST, &rx_feature, 1);
>>>> +    if (rlen != 1) {
>>>> +        panel->vsc_supported = false;
>>>> +        pr_debug("failed to read DP_DPRX_FEATURE_ENUMERATION_LIST\n");
>>>> +    } else {
>>>> +        panel->vsc_supported = !!(rx_feature &
>>>> DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED);
>>>> +        pr_debug("vsc=%d\n", panel->vsc_supported);
>>>> +    }
>>>> +
>>>>        link_info = &dp_panel->link_info;
>>>>        link_info->revision = dpcd[DP_DPCD_REV];
>>>> -    major = (link_info->revision >> 4) & 0x0f;
>>>> -    minor = link_info->revision & 0x0f;
>>>> +    panel->major = (link_info->revision >> 4) & 0x0f;
>>>> +    panel->minor = link_info->revision & 0x0f;
>>>>          link_info->rate = drm_dp_max_link_rate(dpcd);
>>>>        link_info->num_lanes = drm_dp_max_lane_count(dpcd);
>>>> @@ -69,7 +82,7 @@ static int dp_panel_read_dpcd(struct dp_panel
>>>> *dp_panel)
>>>>        if (link_info->rate > dp_panel->max_dp_link_rate)
>>>>            link_info->rate = dp_panel->max_dp_link_rate;
>>>>    -    drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
>>>> +    drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", panel->major,
>>>> panel->minor);
>>>>        drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);
>>>>        drm_dbg_dp(panel->drm_dev, "lane_count=%d\n",
>>>> link_info->num_lanes);
>>>>    @@ -280,6 +293,20 @@ void dp_panel_tpg_config(struct dp_panel
>>>> *dp_panel, bool enable)
>>>>        dp_catalog_panel_tpg_enable(catalog,
>>>> &panel->dp_panel.dp_mode.drm_mode);
>>>>    }
>>>>    +bool dp_panel_vsc_sdp_supported(struct dp_panel *dp_panel)
>>>> +{
>>>> +    struct dp_panel_private *panel;
>>>> +
>>>> +    if (!dp_panel) {
>>>> +        pr_err("invalid input\n");
>>>> +        return false;
>>>> +    }
>>>> +
>>>> +    panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
>>>> +
>>>> +    return panel->major >= 1 && panel->minor >= 3 &&
>>>> panel->vsc_supported;
> 
> Anyway, this check is incorrect. Please compare the whole revision
> against DP_DPCD_REV_13 instead of doing a maj/min comparison.
> 
>>>> +}
>>>> +
>>>>    void dp_panel_dump_regs(struct dp_panel *dp_panel)
>>>>    {
>>>>        struct dp_catalog *catalog;
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h
>>>> b/drivers/gpu/drm/msm/dp/dp_panel.h
>>>> index 6ec68be9f2366..590eca5ce304b 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
>>>> @@ -66,6 +66,7 @@ int dp_panel_get_modes(struct dp_panel *dp_panel,
>>>>            struct drm_connector *connector);
>>>>    void dp_panel_handle_sink_request(struct dp_panel *dp_panel);
>>>>    void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable);
>>>> +bool dp_panel_vsc_sdp_supported(struct dp_panel *dp_panel);
>>>>      /**
>>>>     * is_link_rate_valid() - validates the link rate
>>>
> 
> 
> 

