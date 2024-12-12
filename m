Return-Path: <linux-arm-msm+bounces-41638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD8C9EDDEA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 04:27:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60A31164F8B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 03:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD1A13D531;
	Thu, 12 Dec 2024 03:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a0pD2XvE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8732F44;
	Thu, 12 Dec 2024 03:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733974022; cv=none; b=Us3wpOcpXJKdbU4WbCdyXRzGRtLWHcVJR+TL/JTuR7VvqYi558fjOnJWPrBdw/oZkkU50JLfRxGaVLccEs8JU03ayNhPmWTuBnrjx5aTSBNiw2mJWs7TCMUH1WqRzFuZY/eAGjgYFaQ5JWS2YlR97+ZCGGHCNiVbqWeOd9dqGgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733974022; c=relaxed/simple;
	bh=G3sUsNmgOOwDmlRvG6Hg3ac+UMB2usBrG6qmnm3JQ64=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HmJb8Tx3yrpweYr0iKIZtmSDbnTYkq3Inf3nh2QQBG7EUnXBCgJk+H5F7RwQq4uF/g8djnqtgi7ziNLpNOSHpeO6meSwW6ocGXeLczD2aEHPF4Nvi5p9SH3YhfDDjwGHz6aTalFQMxZOOmVeTonApqFGoHdKeFeSqJ78NuYz4z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a0pD2XvE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC2sMHe001661;
	Thu, 12 Dec 2024 03:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MW3p45C1aVFnAUrnHtHhzTdvN3PeBB9KcL6/WYRsWpo=; b=a0pD2XvEP8x8GSlB
	uGsqORd1yoqomrpOzQm+hZlKmCUml6Pck02wLJsTgYf7AAfX9suyQmG4wng97za6
	t8IsUE7F5JwN2uVQ3xPrnEePKbcVgcDk/7xRlBI4C4Lx7lhA/kWYhQnJ3sQpdvhw
	tsbrtWGN37kf6rFL89cVeTIW9UBzEiNQTmUSjoK1jkX4w6NHfPeALtVihrRRLK1w
	G2p7GnBRL48TB83MXJWfUWWie0+H2vVGRf7FuaqmwT3bw0lJ/wW+zr/eSrBCp8M0
	K+dT+kvYNFm27C0F/f03IXYDLXg4NPW1ZYpkNqNEHlxPKCXIkeKWHimkaX6W86XS
	NxFZlg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fqes0293-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 03:26:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BC3QpIK003880
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 03:26:51 GMT
Received: from [10.110.5.240] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Dec
 2024 19:26:48 -0800
Message-ID: <3346b2fb-1366-476b-bb52-e42a2170d719@quicinc.com>
Date: Wed, 11 Dec 2024 19:26:47 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/14] drm/msm/dp: drop struct msm_dp_panel_in
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Paloma Arellano <quic_parellan@quicinc.com>
CC: Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd
	<swboyd@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
 <20241212-fd-dp-audio-fixup-v3-13-0b1c65e7dba3@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241212-fd-dp-audio-fixup-v3-13-0b1c65e7dba3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qYW9_2wf1htsXJ7FB596U-RpzFEXhYH0
X-Proofpoint-ORIG-GUID: qYW9_2wf1htsXJ7FB596U-RpzFEXhYH0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=807 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120023



On 12/11/2024 3:41 PM, Dmitry Baryshkov wrote:
> All other submodules pass arguments directly. Drop struct
> msm_dp_panel_in that is used to wrap dp_panel's submodule args and pass
> all data to msm_dp_panel_get() directly.
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c |  9 +--------
>   drivers/gpu/drm/msm/dp/dp_panel.c   | 15 ++++++++-------
>   drivers/gpu/drm/msm/dp/dp_panel.h   | 10 ++--------
>   3 files changed, 11 insertions(+), 23 deletions(-)
> 

Change not necessarily tied to catalog cleanup, and can be sent 
independently IMO.

> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index cb02d5d5b404925707c737ed75e9e83fbec34f83..a2cdcdac042d63a59ff71aefcecb7f8b22f01167 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -722,9 +722,6 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
>   {
>   	int rc = 0;
>   	struct device *dev = &dp->msm_dp_display.pdev->dev;
> -	struct msm_dp_panel_in panel_in = {
> -		.dev = dev,
> -	};
>   	struct phy *phy;
>   
>   	phy = devm_phy_get(dev, "dp");
> @@ -765,11 +762,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
>   		goto error_link;
>   	}
>   
> -	panel_in.aux = dp->aux;
> -	panel_in.catalog = dp->catalog;
> -	panel_in.link = dp->link;
> -
> -	dp->panel = msm_dp_panel_get(&panel_in);
> +	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->catalog);
>   	if (IS_ERR(dp->panel)) {
>   		rc = PTR_ERR(dp->panel);
>   		DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 25869e2ac93aba0bffeddae9f95917d81870d8cb..49bbcde8cf60ac1b297310a50191135d79b092fb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -659,25 +659,26 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
>   	return 0;
>   }
>   
> -struct msm_dp_panel *msm_dp_panel_get(struct msm_dp_panel_in *in)
> +struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
> +			      struct msm_dp_link *link, struct msm_dp_catalog *catalog)
>   {

so this API, takes a filled input panel, makes a msm_dp_panel out of it 
by filling out more information on top of what was already passed in and 
returns a msm_dp_panel.

So IOW, converts a msm_dp_panel_in to msm_dp_panel.

What is the gain by passing individual params rather than passing them 
as a struct instead? Isnt it better to have it within that struct to 
show the conversion and moreover we dont have to pass in 4 arguments 
instead of 1.


>   	struct msm_dp_panel_private *panel;
>   	struct msm_dp_panel *msm_dp_panel;
>   	int ret;
>   
> -	if (!in->dev || !in->catalog || !in->aux || !in->link) {
> +	if (!dev || !catalog || !aux || !link) {
>   		DRM_ERROR("invalid input\n");
>   		return ERR_PTR(-EINVAL);
>   	}
>   
> -	panel = devm_kzalloc(in->dev, sizeof(*panel), GFP_KERNEL);
> +	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
>   	if (!panel)
>   		return ERR_PTR(-ENOMEM);
>   
> -	panel->dev = in->dev;
> -	panel->aux = in->aux;
> -	panel->catalog = in->catalog;
> -	panel->link = in->link;
> +	panel->dev = dev;
> +	panel->aux = aux;
> +	panel->catalog = catalog;
> +	panel->link = link;
>   
>   	msm_dp_panel = &panel->msm_dp_panel;
>   	msm_dp_panel->max_bw_code = DP_LINK_BW_8_1;
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index f305b1151118b53762368905b70d951a366ba1a8..a4719a3bbbddd18304227a006e82a5ce9ad7bbf3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -21,13 +21,6 @@ struct msm_dp_display_mode {
>   	bool out_fmt_is_yuv_420;
>   };
>   
> -struct msm_dp_panel_in {
> -	struct device *dev;
> -	struct drm_dp_aux *aux;
> -	struct msm_dp_link *link;
> -	struct msm_dp_catalog *catalog;
> -};
> -
>   struct msm_dp_panel_psr {
>   	u8 version;
>   	u8 capabilities;
> @@ -94,6 +87,7 @@ static inline bool is_lane_count_valid(u32 lane_count)
>   		lane_count == 4);
>   }
>   
> -struct msm_dp_panel *msm_dp_panel_get(struct msm_dp_panel_in *in);
> +struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
> +			      struct msm_dp_link *link, struct msm_dp_catalog *catalog);
>   void msm_dp_panel_put(struct msm_dp_panel *msm_dp_panel);
>   #endif /* _DP_PANEL_H_ */
> 

