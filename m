Return-Path: <linux-arm-msm+bounces-22334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24090904364
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 20:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 361731C21C99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 18:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FBA140858;
	Tue, 11 Jun 2024 18:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C+svuxMk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B64249E5;
	Tue, 11 Jun 2024 18:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718129873; cv=none; b=Qd0TEVJ7tDJ2zLmIIbIbGR6Ak+YbWXy4RSf1fwkaOy1oq2MnISKUjOHZ10Rl/bMpDI5rO8V6nBUBfPGWx2EQx3J7Mmaq/LmvIWll+njbMvirBM6V4uB4aBfi3QtHPMJh6WaAabFQMfLNp5sAJTgx+eNg4UCNbVSuHjGsnCDYbAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718129873; c=relaxed/simple;
	bh=V5fJccGY35et0mUYl+GhicFanbbKht8a+d+z4VF4jDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=P2mlIiH7YKdCwWm0uRchtD9AiYKoN5VA9IwlLiYBFD2EbJFZ8TYiiII0h58pLwINeiBTp7B6R/8P5BP5DVM8MzRKfGMAOUqJ6MHgq11cfYIfpHm/6vwsqLOVAy3DR4J1/p00y9vrBVlo+/jAdc0hluIvmbQAFITsiBp7V4BZw00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C+svuxMk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BHHro0001180;
	Tue, 11 Jun 2024 18:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4YJ8Lhmst0xeBjIowrNmTmfZV+TnLyVmo1as+S8SgFY=; b=C+svuxMkIqhB8zZ3
	183Rlp9fuUZ6I7kdtURu6bfJS4WEfNOw/Hu1Rl//5uzHFBH5bUpvfgdCMUZFTzOm
	yMSLO+X0r12z4mTnk3zk9y9Yul7uqlyVMIGWLr0QCr2SJFoS0HBLDIyn/YNQhRpr
	czS23QHR/5ykEiA4iVCq6F9ET7bHMJwbJAg9B2jip6pK26pu6zdXmOdVB/XtoddF
	hRl8v0WCAOu+lL2ImHHj+fnDMfBTYBER4gcEK/7BMGmwC8rthNUmEoIb7EEBjmx5
	BTJMNTMvzgMwv/IO9QY/kKGdddNiM3vlhy2G3e4/BH30Yyz1mQ7CCjjfgtXRbDQQ
	zJdVKQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yptuy04dn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 18:17:41 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45BIHe84007704
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 18:17:40 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Jun
 2024 11:17:39 -0700
Message-ID: <c47cbab1-a971-4562-a603-d612ec533730@quicinc.com>
Date: Tue, 11 Jun 2024 11:17:39 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/14] drm/msm/hdmi: switch to
 atomic_pre_enable/post_disable
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
 <20240522-fd-hdmi-hpd-v2-3-c30bdb7c5c7e@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-3-c30bdb7c5c7e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VPH_2qNgrISS_e7enANlTEWbXDd9PAbD
X-Proofpoint-ORIG-GUID: VPH_2qNgrISS_e7enANlTEWbXDd9PAbD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_09,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 phishscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110125



On 5/22/2024 3:50 AM, Dmitry Baryshkov wrote:
> In preparation of reworking the HDMI mode setting, switch pre_enable and
> post_disable callbacks to their atomic variants.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> index 9eb4d06bdc0e..3c6121c57b01 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> @@ -120,7 +120,8 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
>   	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
>   }
>   
> -static void msm_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
> +static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> +					      struct drm_bridge_state *old_bridge_state)
>   {
>   	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
>   	struct hdmi *hdmi = hdmi_bridge->hdmi;
> @@ -146,7 +147,8 @@ static void msm_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
>   		msm_hdmi_hdcp_on(hdmi->hdcp_ctrl);
>   }
>   
> -static void msm_hdmi_bridge_post_disable(struct drm_bridge *bridge)
> +static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> +						struct drm_bridge_state *old_bridge_state)
>   {
>   	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
>   	struct hdmi *hdmi = hdmi_bridge->hdmi;
> @@ -292,8 +294,13 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
>   }
>   
>   static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
> -	.pre_enable = msm_hdmi_bridge_pre_enable,
> -	.post_disable = msm_hdmi_bridge_post_disable,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +
> +	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
> +	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
> +
>   	.mode_set = msm_hdmi_bridge_mode_set,
>   	.mode_valid = msm_hdmi_bridge_mode_valid,
>   	.edid_read = msm_hdmi_bridge_edid_read,
> 
> -- 
> 2.39.2
> 

