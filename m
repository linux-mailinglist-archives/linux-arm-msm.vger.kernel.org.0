Return-Path: <linux-arm-msm+bounces-23160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B56A90E052
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 02:01:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 919E71C20F9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 00:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E13191;
	Wed, 19 Jun 2024 00:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PXwJfJqF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F77368;
	Wed, 19 Jun 2024 00:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718755272; cv=none; b=a2XUHEm37K+l0LRQj+wxFFy4mlzexoyl3RGtQC2e43GvzRl7KabN6AGJvnVQKsCo2Ym8n2GF2QUeO0xqFJXqF4IklcMlJwaQfifti3x4CQdhUKBsP4a9nNdFJh9VEMKcEzLEayBebB+YoDhf7sP067pYo0YONjxtkuznd46v8tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718755272; c=relaxed/simple;
	bh=lT5u38AJGG6kApYcJIhxH1iC3vR6iYzo/884KF6DAto=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pOVwk/ysNycn9x7RwhFT+Qw+W9t3hyr7lc/8iV6NFwxOvsLevgdRv/JRILbQ4HnU7Z8Xgu40RVCUzEifVneSRK5UAhWvXS4b5ZEekCrlRklX0WWgSSo95iQWVBa8hxTf7//CQFss8s7cOqQuXyZwYVUQ+y9ZkaxpTm0luUSHO+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PXwJfJqF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ILaNPk001113;
	Wed, 19 Jun 2024 00:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xVD7KOpuBOvNjrz+9mgfdwPgt4x1SXqbuiYEaj4mg/E=; b=PXwJfJqFOKmFWKhY
	0yI/pXl/+lAguhsPL/im/FTeMw+UdnsbSvwKxUJSqcjxaa5DTuPrjatU+OTNryqw
	l1KbwaIWr3GbM9O8kGhQWK108xIHmzFx4fdlX4kzLRVqq03CYRYY783oOgP5CIlW
	vDJPAwCwEQBgf0lThHAcpv43/eQku0jN0XDWZuZftQ8TjNm3/G+pmN4OBw3wi6dz
	9/Ea42MW+SPe7lSbVYV8br5csaI1xAsYTzKMX7mfn4mV9D85P617IzLByuAy/rNW
	saKLboC/og6aw3Xgr8akBbotpBIv90UcMwYYLsPym/g19hDs3SBcztXMEASgGmHe
	Amzjsg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuja2875r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 00:00:57 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45J00ufS001608
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 00:00:56 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 17:00:56 -0700
Message-ID: <9ddb841c-382a-4684-92cb-3a07e72ce5da@quicinc.com>
Date: Tue, 18 Jun 2024 17:00:55 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/14] drm/msm/hdmi: switch to
 pm_runtime_resume_and_get()
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
 <20240522-fd-hdmi-hpd-v2-7-c30bdb7c5c7e@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-7-c30bdb7c5c7e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JbHUk5wEWQBDUxEURMskGSCvS708-Tom
X-Proofpoint-ORIG-GUID: JbHUk5wEWQBDUxEURMskGSCvS708-Tom
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_06,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180176



On 5/22/2024 3:50 AM, Dmitry Baryshkov wrote:
> The pm_runtime_get_sync() function is a bad choise for runtime power

[nit: s/choise/choice/]

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> management. Switch HDMI driver to pm_runtime_resume_and_get() and add
> proper error handling, while we are at it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  2 +-
>   drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 12 ++++++++++--
>   drivers/gpu/drm/msm/hdmi/hdmi_phy.c    |  6 +++++-
>   3 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> index fb99328107dd..d1b35328b6e8 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> @@ -19,7 +19,7 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
>   	const struct hdmi_platform_config *config = hdmi->config;
>   	int ret;
>   
> -	pm_runtime_get_sync(&hdmi->pdev->dev);
> +	pm_runtime_resume_and_get(&hdmi->pdev->dev);
>   
>   	ret = regulator_bulk_enable(config->pwr_reg_cnt, hdmi->pwr_regs);
>   	if (ret)
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
> index 36266aa626dc..fc21ad3b01dc 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
> @@ -85,7 +85,12 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
>   	if (hdmi->hpd_gpiod)
>   		gpiod_set_value_cansleep(hdmi->hpd_gpiod, 1);
>   
> -	pm_runtime_get_sync(dev);
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "runtime resume failed: %d\n", ret);
> +		goto fail;
> +	}
> +
>   	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
>   	if (ret)
>   		goto fail;
> @@ -178,7 +183,10 @@ static enum drm_connector_status detect_reg(struct hdmi *hdmi)
>   	uint32_t hpd_int_status = 0;
>   	int ret;
>   
> -	pm_runtime_get_sync(&hdmi->pdev->dev);
> +	ret = pm_runtime_resume_and_get(&hdmi->pdev->dev);
> +	if (ret)
> +		goto out;
> +
>   	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
>   	if (ret)
>   		goto out;
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> index 88a3423b7f24..d5acae752300 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> @@ -58,7 +58,11 @@ int msm_hdmi_phy_resource_enable(struct hdmi_phy *phy)
>   	struct device *dev = &phy->pdev->dev;
>   	int i, ret = 0;
>   
> -	pm_runtime_get_sync(dev);
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "runtime resume failed: %d\n", ret);
> +		return ret;
> +	}
>   
>   	ret = regulator_bulk_enable(cfg->num_regs, phy->regs);
>   	if (ret) {
> 
> -- 
> 2.39.2
> 

