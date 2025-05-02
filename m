Return-Path: <linux-arm-msm+bounces-56572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CFDAA78C5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 19:42:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C55B27AEF31
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 17:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A992609EC;
	Fri,  2 May 2025 17:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bus+bVfa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2E32609D1;
	Fri,  2 May 2025 17:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746207719; cv=none; b=D85kBFMo0B3f4m+dk8b4cqH0Cah9j1LzuhtfIrqvfEyVSpTWKxKF49ErQL9kUtRsKiZUN/KJcnO8tq4KgpR3LolDjA7jZ/7937TpT2nC/4d6G0VXffVd3ddKS+Q9cya9BovkIO+WQwXYjy2/OiP0OLoh+J0zfRnDWq4WiNg1Dpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746207719; c=relaxed/simple;
	bh=gjLAU0k1Inps/DJel7LWteso31CNi1KBinnEA4wC8H8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pD6krlBujfDpvijuJekcX1RZAzrcP9xQSaiVoLHOaqKNjqe41pcJ70Xpz4Q67QQuZx3JZM8YLNnyxggSBieaOo31yAPfbmNBEqA4WKJV6acx6kgI8SZXOViBu7yoYD3I9F+TA5rX4oihhK5c83N/w7LfOTunAA1cxC8BGIr2KPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bus+bVfa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542E4VOa015015;
	Fri, 2 May 2025 17:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+kUeZbROEI2gs9FNvLUbc43lNYpiMPTgqx6irTa9LjE=; b=bus+bVfaorQL3mQ/
	K+P1NCk8C74Tkh8lqub94HB2uIdZgqLSx2hKiI644B3uF7qXxazoW2s2GaWEsE29
	UMX234vwBNShqfUrtBOG5AFfcIQoOz0VhDYFBSw+zeG16QhCXbHA9IubsttLMjX/
	5auHEmOWRTiflRkmLPnGJ05sIK9Ls4nE/BtKBfAHobNXiiIaVBgbxO7jv87nzQnu
	QEam9k8fUNN5ENZNXpYwqhjmc/4wAfHoxOI6kRDP3/IL35MXz7Pm2wCs0l0ArmQx
	fgSFNL9avuIPJ0zck838wsYOZjHOIUf86E2uCGdkadk8V2SOv4MohvcS+y2B9Xew
	aXVHOQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ub0xrp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 17:41:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 542Hfg9r021502
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 May 2025 17:41:42 GMT
Received: from [10.134.71.99] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 2 May 2025
 10:41:41 -0700
Message-ID: <de448e66-01c7-498c-b5ea-d3592ac4b40f@quicinc.com>
Date: Fri, 2 May 2025 10:41:41 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] drm/msm/dp: Fix support of LTTPR initialization
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Dmitry Baryshkov
	<lumag@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <dmitry.baryshkov@oss.qualcomm.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        <laurentiu.tudor1@dell.com>, <abel.vesa@linaro.org>,
        <johan@kernel.org>, Johan Hovold
	<johan+linaro@kernel.org>
References: <20250430001330.265970-1-alex.vinarskis@gmail.com>
 <20250430001330.265970-2-alex.vinarskis@gmail.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250430001330.265970-2-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zfyk4oyKA29xzv6RSz7gZ9mIKO_264-f
X-Authority-Analysis: v=2.4 cv=KtlN2XWN c=1 sm=1 tr=0 ts=681503d7 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=uKgnwDtAFRA4Sjybt-sA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: zfyk4oyKA29xzv6RSz7gZ9mIKO_264-f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE0MSBTYWx0ZWRfX8wAJlAWBanzp FZUe5dLRwVglXu+CJbyIMTH718drMl5XJoaFRkMqezQBzytT/QbHePgPGgD4Ch2Vyf3XTy5QSyS spdC8tLo0aVOPEnpvu7tKCpvzRBH/ugyyVjDMw1OtWv1Ju3GC6upRFkBgHSOUTtbM4cIAW/vunv
 oV/jF0aHa/ec//3lyjxHMKMlFLVmkua5NSXELX6blI/wPOhP3T97oa/XHTJlRvo3YSx9hgv5jRa KH2VrALVakWKYZIis49rt5+DWgXDdICqR1WEKZmwdXay8QZjRFh+u7QuzRQQTva9aRwTKaQy1e0 NjUMSkvvixHfhU4HRTr/wv6MCqu792EXsZIJ5U+U8e2zh0jJqHQoOiejp9pQDJnfQdhjynz1Jp9
 +Hcp1bjngyL2FVH1Un6OGlYKsJRhKxtm4aRmz/f9pNlsc3GTEqFiwUGuiX80vE3q8ej43eNP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020141



On 4/29/2025 5:09 PM, Aleksandrs Vinarskis wrote:
> Initialize LTTPR before msm_dp_panel_read_sink_caps, as DPTX shall
> (re)read DPRX caps after LTTPR detection, as required by DP 2.1,
> Section 3.6.7.6.1.
> 
> Fixes: 72d0af4accd9 ("drm/msm/dp: Add support for LTTPR handling")
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Tested-by: Rob Clark <robdclark@gmail.com>

Hi Aleksandrs,

For this patch and the rest of the series:

Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # SA8775P

Thanks,

Jessica Zhang

> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index bbc47d86ae9e..fc07cce68382 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -367,12 +367,12 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
>   	return 0;
>   }
>   
> -static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp)
> +static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd)
>   {
>   	u8 lttpr_caps[DP_LTTPR_COMMON_CAP_SIZE];
>   	int rc;
>   
> -	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd, lttpr_caps))
> +	if (drm_dp_read_lttpr_common_caps(dp->aux, dpcd, lttpr_caps))
>   		return;
>   
>   	rc = drm_dp_lttpr_init(dp->aux, drm_dp_lttpr_count(lttpr_caps));
> @@ -385,12 +385,17 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>   	struct drm_connector *connector = dp->msm_dp_display.connector;
>   	const struct drm_display_info *info = &connector->display_info;
>   	int rc = 0;
> +	u8 dpcd[DP_RECEIVER_CAP_SIZE];
>   
> -	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
> +	rc = drm_dp_read_dpcd_caps(dp->aux, dpcd);
>   	if (rc)
>   		goto end;
>   
> -	msm_dp_display_lttpr_init(dp);
> +	msm_dp_display_lttpr_init(dp, dpcd);
> +
> +	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
> +	if (rc)
> +		goto end;
>   
>   	msm_dp_link_process_request(dp->link);
>   


