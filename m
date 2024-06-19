Return-Path: <linux-arm-msm+bounces-23267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF35E90F678
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 20:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7294B1F2524E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 18:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9689E158DB2;
	Wed, 19 Jun 2024 18:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Hiv6LYVe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF371586F2;
	Wed, 19 Jun 2024 18:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718822837; cv=none; b=M24W63mxJfxze/x7OO612vHAxD6Gavbm/znkRTmo2sjgReK+yIRtPHnMGshH3gq21Vm77t3LOYOrAf1xa2G2/9BNqHAaHP5Yl8Ir4/eylssgIC3onEYpwwB3g3bzXhL015qNVsR2dgEgJoMvhZllhvQxOwclFzxKDuMmJsBLuZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718822837; c=relaxed/simple;
	bh=Hw6TekGHv8dcanQgqMiX5Df+Wj1gG1c+b1EO1JvElYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oKy/hpWvkPQmLCZHusA7eFS7pULCRwGlMbzVGNwCsHyQy1wLP81A0pImiBhaxHFvcr0tcFJuJkdS+r7jgFgMUFvWxi/rv6K4aW4tnT5jc4QiV+6cMitayshIG9nSH0cWSAXMihK1xzw/yOsyCbGyoSiov2/ZSPfW0bAqplhqGGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Hiv6LYVe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45JA255K006449;
	Wed, 19 Jun 2024 18:47:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9+8ww9UBmkK+tSL+a3Cn0Y5mzIcOuu632V2sXl+vpZE=; b=Hiv6LYVeM53u27Td
	N8yeaizjsvhyoxjui9lzen8TulagqyVXNpeLjQraHQpXI1IN9ZrOkMl4WqysF44x
	CY9dtKZgtdOYznGaDXmwq5Vc2pgrIEmexMEbWBQNMbDLWZFgEwG8+3SX+01AweP5
	XbT8NJTKh1bNaS8DLO50xLskN0gMqsHKgkPMRqANWCCcePO6X/2HcILrRGBstEuK
	fgph8Qbrji5fj6mxGq4LW7Xiy5cIGSpTgCzWIBv+ua4PW1GmAMAEV1UmrAUDNByA
	/eEhN5MvH0NZDt1W92E9SCW8dKB1jl142eQVdWLr66dJqoQto7o+j2o/B4PscCqG
	tJExwQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuj9u2jkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 18:47:08 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45JIl7kp031202
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 18:47:07 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Jun
 2024 11:47:06 -0700
Message-ID: <92b6cc8e-4e16-4b5c-a0b7-b14fd6a8627c@quicinc.com>
Date: Wed, 19 Jun 2024 11:47:05 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/14] drm/msm/hdmi: drop hpd-gpios support
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
 <20240522-fd-hdmi-hpd-v2-12-c30bdb7c5c7e@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-12-c30bdb7c5c7e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xg2zPiFqpIBo8IgcSJyQypXEdEiwIYG4
X-Proofpoint-ORIG-GUID: xg2zPiFqpIBo8IgcSJyQypXEdEiwIYG4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406190141



On 5/22/2024 3:51 AM, Dmitry Baryshkov wrote:
> Supporting simultaneous check of native HPD and the external GPIO proved
> to be less stable than just native HPD. Drop the hpd-gpios support,
> leaving just the native HPD support. In case the native HPD doesn't work
> the user is urged to switch to specifying the HPD property to the
> hdmi-connector device.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/hdmi/hdmi.c     | 14 +++-------
>   drivers/gpu/drm/msm/hdmi/hdmi.h     |  2 --
>   drivers/gpu/drm/msm/hdmi/hdmi_hpd.c | 53 +++----------------------------------
>   3 files changed, 7 insertions(+), 62 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index e160a23e962e..a9437054c015 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -468,17 +468,9 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
>   		return dev_err_probe(dev, PTR_ERR(hdmi->extp_clk),
>   				     "failed to get extp clock\n");
>   
> -	hdmi->hpd_gpiod = devm_gpiod_get_optional(&pdev->dev, "hpd", GPIOD_IN);
> -	/* This will catch e.g. -EPROBE_DEFER */
> -	if (IS_ERR(hdmi->hpd_gpiod))
> -		return dev_err_probe(dev, PTR_ERR(hdmi->hpd_gpiod),
> -				     "failed to get hpd gpio\n");
> -
> -	if (!hdmi->hpd_gpiod)
> -		DBG("failed to get HPD gpio");
> -
> -	if (hdmi->hpd_gpiod)
> -		gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
> +	if (of_find_property(dev->of_node, "hpd-gpios", NULL) ||
> +	    of_find_property(dev->of_node, "hpd-gpio", NULL))
> +		dev_warn(dev, "hpd-gpios is not supported anymore, please migrate to the hdmi-connector\n");
>   
>   	ret = msm_hdmi_get_phy(hdmi);
>   	if (ret) {
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
> index 2a98efa8b6bd..268ff8604423 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.h
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
> @@ -52,8 +52,6 @@ struct hdmi {
>   	struct clk_bulk_data *pwr_clks;
>   	struct clk *extp_clk;
>   
> -	struct gpio_desc *hpd_gpiod;
> -
>   	struct hdmi_phy *phy;
>   	struct device *phy_dev;
>   
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
> index 32e447267e3b..d3353c6148ed 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
> @@ -69,9 +69,6 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
>   	int ret;
>   	unsigned long flags;
>   
> -	if (hdmi->hpd_gpiod)
> -		gpiod_set_value_cansleep(hdmi->hpd_gpiod, 1);
> -
>   	ret = pm_runtime_resume_and_get(dev);
>   	if (ret)
>   		return ret;
> @@ -144,8 +141,11 @@ void msm_hdmi_hpd_irq(struct drm_bridge *bridge)
>   	}
>   }
>   
> -static enum drm_connector_status detect_reg(struct hdmi *hdmi)
> +enum drm_connector_status msm_hdmi_bridge_detect(
> +		struct drm_bridge *bridge)
>   {
> +	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> +	struct hdmi *hdmi = hdmi_bridge->hdmi;
>   	uint32_t hpd_int_status = 0;
>   	int ret;
>   
> @@ -161,48 +161,3 @@ static enum drm_connector_status detect_reg(struct hdmi *hdmi)
>   	return (hpd_int_status & HDMI_HPD_INT_STATUS_CABLE_DETECTED) ?
>   			connector_status_connected : connector_status_disconnected;
>   }
> -
> -#define HPD_GPIO_INDEX	2
> -static enum drm_connector_status detect_gpio(struct hdmi *hdmi)
> -{
> -	return gpiod_get_value(hdmi->hpd_gpiod) ?
> -			connector_status_connected :
> -			connector_status_disconnected;
> -}
> -
> -enum drm_connector_status msm_hdmi_bridge_detect(
> -		struct drm_bridge *bridge)
> -{
> -	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> -	struct hdmi *hdmi = hdmi_bridge->hdmi;
> -	enum drm_connector_status stat_gpio, stat_reg;
> -	int retry = 20;
> -
> -	/*
> -	 * some platforms may not have hpd gpio. Rely only on the status
> -	 * provided by REG_HDMI_HPD_INT_STATUS in this case.
> -	 */
> -	if (!hdmi->hpd_gpiod)
> -		return detect_reg(hdmi);
> -
> -	do {
> -		stat_gpio = detect_gpio(hdmi);
> -		stat_reg  = detect_reg(hdmi);
> -
> -		if (stat_gpio == stat_reg)
> -			break;
> -
> -		mdelay(10);
> -	} while (--retry);
> -
> -	/* the status we get from reading gpio seems to be more reliable,
> -	 * so trust that one the most if we didn't manage to get hdmi and
> -	 * gpio status to agree:
> -	 */
> -	if (stat_gpio != stat_reg) {
> -		DBG("HDMI_HPD_INT_STATUS tells us: %d", stat_reg);
> -		DBG("hpd gpio tells us: %d", stat_gpio);
> -	}
> -
> -	return stat_gpio;
> -}
> 
> -- 
> 2.39.2
> 

