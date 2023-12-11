Return-Path: <linux-arm-msm+bounces-4272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E57780DCCB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 22:17:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 400091C20A9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 21:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECE9A54BE9;
	Mon, 11 Dec 2023 21:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q/QzBNqP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B42D2CE
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 13:17:32 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BB7jkj6001586;
	Mon, 11 Dec 2023 21:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=2tlI++d9dj3Zg37oPIQfhuXbyaGzAy8Jod3dcN39kpA=; b=Q/
	QzBNqPJoy/YTb742+8f9UG+zTqKqbfDDa+qAXF+kT2UGGhgyBjujbZfiiWGSOI/m
	3ktjPGHAzO32lqOZ7f0MxNUTsH5wR3UGPcK9a/b+5++0YK79Z0ULhP4LgE2xrvBF
	TsHKLsCiYQ3rjNOk7eeT6diwVvpvlRVBg1lbSO9gXs2XIm4MkXRrBoJ4EvHyI806
	RDZxHDDn5survtTdIJebCp0rgF87jaBNceCeVy1eQAQZ1ovVliw5skqC2cmtXlSS
	89Ov/W/VxQ4J3zpTk2QmfEKTauaVjvxSEtqV5JgM3rNzFS1d/qYCgV4CvMjHPUqN
	F2wAwFdWLUK5lcboVHHw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uvnrg4d8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 21:17:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BBLHOK1009698
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 21:17:24 GMT
Received: from [10.110.92.163] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 11 Dec
 2023 13:17:23 -0800
Message-ID: <9d115ead-7038-12c0-d696-67fd981772c2@quicinc.com>
Date: Mon, 11 Dec 2023 13:17:22 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/msm/dp: call dp_display_get_next_bridge() during
 probe
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul
	<sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Sankeerth
 Billakanti" <quic_sbillaka@quicinc.com>
CC: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
References: <20231107004424.2112698-1-dmitry.baryshkov@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20231107004424.2112698-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xJhlD-t9R4fdq06W7qWvwCWTv-aOzOr0
X-Proofpoint-ORIG-GUID: xJhlD-t9R4fdq06W7qWvwCWTv-aOzOr0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110175


On 11/6/2023 4:43 PM, Dmitry Baryshkov wrote:
> The funcion dp_display_get_next_bridge() can return -EPROBE_DEFER if the
> next bridge is not (yet) available. However returning -EPROBE_DEFER from
> msm_dp_modeset_init() is not ideal. This leads to -EPROBE return from
> component_bind, which can easily result in -EPROBE_DEFR loops.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>
> Dependencies: https://patchwork.freedesktop.org/series/120375/
>
> ---

Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>


>   drivers/gpu/drm/msm/dp/dp_display.c | 36 +++++++++++++++++------------
>   1 file changed, 21 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d542db37763a..ddb3c84f39a2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1197,15 +1197,27 @@ static const struct msm_dp_desc *dp_display_get_desc(struct platform_device *pde
>   	return NULL;
>   }
>   
> -static int dp_auxbus_done_probe(struct drm_dp_aux *aux)
> +static int dp_display_get_next_bridge(struct msm_dp *dp);
> +
> +static int dp_display_probe_tail(struct device *dev)
>   {
> -	int rc;
> +	struct msm_dp *dp = dev_get_drvdata(dev);
> +	int ret;
>   
> -	rc = component_add(aux->dev, &dp_display_comp_ops);
> -	if (rc)
> -		DRM_ERROR("eDP component add failed, rc=%d\n", rc);
> +	ret = dp_display_get_next_bridge(dp);
> +	if (ret)
> +		return ret;
>   
> -	return rc;
> +	ret = component_add(dev, &dp_display_comp_ops);
> +	if (ret)
> +		DRM_ERROR("component add failed, rc=%d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int dp_auxbus_done_probe(struct drm_dp_aux *aux)
> +{
> +	return dp_display_probe_tail(aux->dev);
>   }
>   
>   static int dp_display_probe(struct platform_device *pdev)
> @@ -1280,11 +1292,9 @@ static int dp_display_probe(struct platform_device *pdev)
>   			goto err;
>   		}
>   	} else {
> -		rc = component_add(&pdev->dev, &dp_display_comp_ops);
> -		if (rc) {
> -			DRM_ERROR("component add failed, rc=%d\n", rc);
> +		rc = dp_display_probe_tail(&pdev->dev);
> +		if (rc)
>   			goto err;
> -		}
>   	}
>   
>   	return rc;
> @@ -1415,7 +1425,7 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
>   	 * For DisplayPort interfaces external bridges are optional, so
>   	 * silently ignore an error if one is not present (-ENODEV).
>   	 */
> -	rc = devm_dp_parser_find_next_bridge(dp->drm_dev->dev, dp_priv->parser);
> +	rc = devm_dp_parser_find_next_bridge(&dp->pdev->dev, dp_priv->parser);
>   	if (!dp->is_edp && rc == -ENODEV)
>   		return 0;
>   
> @@ -1435,10 +1445,6 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>   
>   	dp_priv = container_of(dp_display, struct dp_display_private, dp_display);
>   
> -	ret = dp_display_get_next_bridge(dp_display);
> -	if (ret)
> -		return ret;
> -
>   	ret = dp_bridge_init(dp_display, dev, encoder);
>   	if (ret) {
>   		DRM_DEV_ERROR(dev->dev,

