Return-Path: <linux-arm-msm+bounces-8493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9F383E52E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 23:21:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E4CA1F23DF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 22:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0CE324215;
	Fri, 26 Jan 2024 22:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eimeEQnh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065E61869
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 22:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706307678; cv=none; b=LAFXF3ikvPB/wzvBGaNLkadrA79TggXjc4mPRbhFQhsXuHrkAYIC9kDISGRwijICDhyUQ+Q3M2n4KgYQkuMTVxNPYMWbNgI2dq9Lxydq+9199cnsjh7kyIyHUDPbADWbbOyCZcugbq9bdxeopb8kd9W4yMLnoHXTXbBBSOwqLTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706307678; c=relaxed/simple;
	bh=DaJO+YR4O+tda8pJ3Avm+4cE5rn5Py0wgTPxfXQFwdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=W1Q7vgQwVMHkSe58a2SaXgco9H1iDF+tuaG/n8BHc3t9zHZmd+o54JcptJNsmCa9EjeJJNmGlnNgNNqGfrq22Oa6E7YA+ypXFPe3XwxAjuGk+FqzNclnP1R2GwpbztKrsk6EsF3s4wHUB7JNya1B70EuKPEccfr4TwL8VKj9MSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eimeEQnh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40QKDkED032651;
	Fri, 26 Jan 2024 22:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=6oMvxhm/3a6o7mRdxDYASaAH1caViRiwfcqIeCm2qAc=; b=ei
	meEQnhOsGiO43aGciZSks/7Xjn1PRMF8XPqlb86TR5B7qX8Q5U+bUMU4YKe9xLhA
	JFK8W44MpfvSIIorhVnzZ99DfDXUkGvxCJioIrgSqfEbrUOBRZY0govqaCGBKlh0
	6/dY/X+BnYP3SHswavxYIaBf1WaWnyjbf3xnSl7Xi6rsYT1TnnIvofCrt2fNAGEh
	qR2M1ajigTIbWWlAylXxzAzUaTFVbVg4PBwuEmeoE4Rcv8OIkB4W6rctiwDYuYE1
	Qhu3L2pcLCUP4/J2R244suyiWey7V5gygQolegzYjJ08LRAqQ9feCw2XayOpLEyO
	EBl56FlGilIsVL1cMbIQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vv8e89q0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 22:21:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QML6lA001294
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 22:21:06 GMT
Received: from [10.110.48.234] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 14:21:05 -0800
Message-ID: <125278e3-785f-bbaf-a42a-af26a7c35f06@quicinc.com>
Date: Fri, 26 Jan 2024 14:21:04 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v3 06/15] drm/msm/dp: simplify stream clocks
 handling
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd
	<swboyd@chromium.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
 <20240126-dp-power-parser-cleanup-v3-6-098d5f581dd3@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-6-098d5f581dd3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aXnLMgLvPJHEykP2LJ5wGZ3QJXD2wB23
X-Proofpoint-ORIG-GUID: aXnLMgLvPJHEykP2LJ5wGZ3QJXD2wB23
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401260163


On 1/26/2024 10:26 AM, Dmitry Baryshkov wrote:
> There is only a single DP_STREAM_PM clock, stream_pixel. Instead of
> using a separate dss_module_power instance for this single clock, handle
> this clock directly. This allows us to drop several wrapping functions.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_ctrl.c   | 91 ++++++++++++++++----------------------
>   drivers/gpu/drm/msm/dp/dp_parser.c | 41 ++++-------------
>   drivers/gpu/drm/msm/dp/dp_parser.h |  2 -
>   3 files changed, 47 insertions(+), 87 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index da29281c575b..56a424a82a1b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -79,6 +79,8 @@ struct dp_ctrl_private {
>   	struct dp_parser *parser;
>   	struct dp_catalog *catalog;
>   
> +	struct clk *pixel_clk;
> +
>   	struct completion idle_comp;
>   	struct completion psr_op_comp;
>   	struct completion video_comp;
> @@ -1320,27 +1322,6 @@ static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl,
>   	return ret;
>   }
>   
> -static void dp_ctrl_set_clock_rate(struct dp_ctrl_private *ctrl,
> -			enum dp_pm_type module, char *name, unsigned long rate)
> -{
> -	u32 num = ctrl->parser->mp[module].num_clk;
> -	struct clk_bulk_data *cfg = ctrl->parser->mp[module].clocks;
> -
> -	while (num && strcmp(cfg->id, name)) {
> -		num--;
> -		cfg++;
> -	}
> -
> -	drm_dbg_dp(ctrl->drm_dev, "setting rate=%lu on clk=%s\n",
> -						rate, name);
> -
> -	if (num)
> -		clk_set_rate(cfg->clk, rate);
> -	else
> -		DRM_ERROR("%s clock doesn't exit to set rate %lu\n",
> -				name, rate);
> -}
> -
>   int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
>   		       enum dp_pm_type pm_type, bool enable)
>   {
> @@ -1351,8 +1332,7 @@ int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
>   	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>   
>   	if (pm_type != DP_CORE_PM &&
> -	    pm_type != DP_CTRL_PM &&
> -	    pm_type != DP_STREAM_PM) {
> +	    pm_type != DP_CTRL_PM) {
>   		DRM_ERROR("unsupported ctrl module: %s\n",
>   			  dp_parser_pm_name(pm_type));
>   		return -EINVAL;
> @@ -1371,12 +1351,6 @@ int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
>   			return 0;
>   		}
>   
> -		if (pm_type == DP_STREAM_PM && ctrl->stream_clks_on) {
> -			drm_dbg_dp(ctrl->drm_dev,
> -				   "pixel clks already enabled\n");
> -			return 0;
> -		}
> -
>   		if ((pm_type == DP_CTRL_PM) && (!ctrl->core_clks_on)) {
>   			drm_dbg_dp(ctrl->drm_dev,
>   				   "Enable core clks before link clks\n");
> @@ -1401,8 +1375,6 @@ int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
>   
>   	if (pm_type == DP_CORE_PM)
>   		ctrl->core_clks_on = enable;
> -	else if (pm_type == DP_STREAM_PM)
> -		ctrl->stream_clks_on = enable;
>   	else
>   		ctrl->link_clks_on = enable;
>   
> @@ -1734,14 +1706,23 @@ static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
>   	}
>   
>   	pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
> -	dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel", pixel_rate * 1000);
> -
> -	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_STREAM_PM, true);
> +	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
>   	if (ret) {
> -		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> +		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
>   		return ret;
>   	}
>   
> +	if (ctrl->stream_clks_on) {
> +		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
> +	} else {
> +		ret = clk_prepare_enable(ctrl->pixel_clk);
> +		if (ret) {
> +			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> +			return ret;
> +		}
> +		ctrl->stream_clks_on = true;
> +	}
> +
>   	dp_ctrl_send_phy_test_pattern(ctrl);
>   
>   	return 0;
> @@ -1977,14 +1958,23 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
>   		}
>   	}
>   
> -	dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel", pixel_rate * 1000);
> -
> -	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_STREAM_PM, true);
> +	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
>   	if (ret) {
> -		DRM_ERROR("Unable to start pixel clocks. ret=%d\n", ret);
> +		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
>   		goto end;
>   	}
>   
> +	if (ctrl->stream_clks_on) {
> +		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
> +	} else {
> +		ret = clk_prepare_enable(ctrl->pixel_clk);
> +		if (ret) {
> +			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> +			goto end;
> +		}
> +		ctrl->stream_clks_on = true;
> +	}
> +
>   	if (force_link_train || !dp_ctrl_channel_eq_ok(ctrl))
>   		dp_ctrl_link_retrain(ctrl);
>   
> @@ -2036,11 +2026,8 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>   	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
>   
>   	if (ctrl->stream_clks_on) {
> -		ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_STREAM_PM, false);
> -		if (ret) {
> -			DRM_ERROR("Failed to disable pclk. ret=%d\n", ret);
> -			return ret;
> -		}
> +		clk_disable_unprepare(ctrl->pixel_clk);
> +		ctrl->stream_clks_on = false;
>   	}
>   
>   	dev_pm_opp_set_rate(ctrl->dev, 0);
> @@ -2108,9 +2095,10 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>   
>   	dp_catalog_ctrl_reset(ctrl->catalog);
>   
> -	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_STREAM_PM, false);
> -	if (ret)
> -		DRM_ERROR("Failed to disable pixel clocks. ret=%d\n", ret);
> +	if (ctrl->stream_clks_on) {
> +		clk_disable_unprepare(ctrl->pixel_clk);
> +		ctrl->stream_clks_on = false;
> +	}
>   
>   	dev_pm_opp_set_rate(ctrl->dev, 0);
>   	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
> @@ -2174,7 +2162,7 @@ static int dp_ctrl_clk_init(struct dp_ctrl *dp_ctrl)
>   {
>   	struct dp_ctrl_private *ctrl_private;
>   	int rc = 0;
> -	struct dss_module_power *core, *ctrl, *stream;
> +	struct dss_module_power *core, *ctrl;
>   	struct device *dev;
>   
>   	ctrl_private = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> @@ -2182,7 +2170,6 @@ static int dp_ctrl_clk_init(struct dp_ctrl *dp_ctrl)
>   
>   	core = &ctrl_private->parser->mp[DP_CORE_PM];
>   	ctrl = &ctrl_private->parser->mp[DP_CTRL_PM];
> -	stream = &ctrl_private->parser->mp[DP_STREAM_PM];
>   
>   	rc = devm_clk_bulk_get(dev, core->num_clk, core->clocks);
>   	if (rc)
> @@ -2192,9 +2179,9 @@ static int dp_ctrl_clk_init(struct dp_ctrl *dp_ctrl)
>   	if (rc)
>   		return -ENODEV;
>   
> -	rc = devm_clk_bulk_get(dev, stream->num_clk, stream->clocks);
> -	if (rc)
> -		return -ENODEV;
> +	ctrl_private->pixel_clk = devm_clk_get(dev, "stream_pixel");
> +	if (IS_ERR(ctrl_private->pixel_clk))
> +		return PTR_ERR(ctrl_private->pixel_clk);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index 2d9d126c119b..fe2b75f7555a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -150,12 +150,11 @@ static inline bool dp_parser_check_prefix(const char *clk_prefix,
>   static int dp_parser_init_clk_data(struct dp_parser *parser)
>   {
>   	int num_clk, i, rc;
> -	int core_clk_count = 0, ctrl_clk_count = 0, stream_clk_count = 0;
> +	int core_clk_count = 0, ctrl_clk_count = 0;
>   	const char *clk_name;
>   	struct device *dev = &parser->pdev->dev;
>   	struct dss_module_power *core_power = &parser->mp[DP_CORE_PM];
>   	struct dss_module_power *ctrl_power = &parser->mp[DP_CTRL_PM];
> -	struct dss_module_power *stream_power = &parser->mp[DP_STREAM_PM];
>   
>   	num_clk = of_property_count_strings(dev->of_node, "clock-names");
>   	if (num_clk <= 0) {
> @@ -174,9 +173,6 @@ static int dp_parser_init_clk_data(struct dp_parser *parser)
>   
>   		if (dp_parser_check_prefix("ctrl", clk_name))
>   			ctrl_clk_count++;
> -
> -		if (dp_parser_check_prefix("stream", clk_name))
> -			stream_clk_count++;
>   	}
>   
>   	/* Initialize the CORE power module */
> @@ -207,47 +203,30 @@ static int dp_parser_init_clk_data(struct dp_parser *parser)
>   		return -ENOMEM;
>   	}
>   
> -	/* Initialize the STREAM power module */
> -	if (stream_clk_count == 0) {
> -		DRM_ERROR("no stream (pixel) clocks are defined\n");
> -		return -EINVAL;
> -	}
> -
> -	stream_power->num_clk = stream_clk_count;
> -	stream_power->clocks = devm_kcalloc(dev,
> -			stream_power->num_clk, sizeof(struct clk_bulk_data),
> -			GFP_KERNEL);
> -	if (!stream_power->clocks) {
> -		stream_power->num_clk = 0;
> -		return -ENOMEM;
> -	}
> -
> -	return 0;
> +	return num_clk;
>   }
>   
>   static int dp_parser_clock(struct dp_parser *parser)
>   {
>   	int rc = 0, i = 0;
>   	int num_clk = 0;
> -	int core_clk_index = 0, ctrl_clk_index = 0, stream_clk_index = 0;
> -	int core_clk_count = 0, ctrl_clk_count = 0, stream_clk_count = 0;
> +	int core_clk_index = 0, ctrl_clk_index = 0;
> +	int core_clk_count = 0, ctrl_clk_count = 0;
>   	const char *clk_name;
>   	struct device *dev = &parser->pdev->dev;
>   	struct dss_module_power *core_power = &parser->mp[DP_CORE_PM];
>   	struct dss_module_power *ctrl_power = &parser->mp[DP_CTRL_PM];
> -	struct dss_module_power *stream_power = &parser->mp[DP_STREAM_PM];
>   
>   	rc =  dp_parser_init_clk_data(parser);
> -	if (rc) {
> +	if (rc < 0) {
>   		DRM_ERROR("failed to initialize power data %d\n", rc);
> -		return -EINVAL;
> +		return rc;
>   	}
>   
> +	num_clk = rc;
> +
>   	core_clk_count = core_power->num_clk;
>   	ctrl_clk_count = ctrl_power->num_clk;
> -	stream_clk_count = stream_power->num_clk;
> -
> -	num_clk = core_clk_count + ctrl_clk_count + stream_clk_count;
>   
>   	for (i = 0; i < num_clk; i++) {
>   		rc = of_property_read_string_index(dev->of_node, "clock-names",
> @@ -260,10 +239,6 @@ static int dp_parser_clock(struct dp_parser *parser)
>   				core_clk_index < core_clk_count) {
>   			core_power->clocks[core_clk_index].id = devm_kstrdup(dev, clk_name, GFP_KERNEL);
>   			core_clk_index++;
> -		} else if (dp_parser_check_prefix("stream", clk_name) &&
> -				stream_clk_index < stream_clk_count) {
> -			stream_power->clocks[stream_clk_index].id = devm_kstrdup(dev, clk_name, GFP_KERNEL);
> -			stream_clk_index++;
>   		} else if (dp_parser_check_prefix("ctrl", clk_name) &&
>   			   ctrl_clk_index < ctrl_clk_count) {
>   			ctrl_power->clocks[ctrl_clk_index].id = devm_kstrdup(dev, clk_name, GFP_KERNEL);
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index 4ccc432b4142..c6fe26602e07 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -19,7 +19,6 @@
>   enum dp_pm_type {
>   	DP_CORE_PM,
>   	DP_CTRL_PM,
> -	DP_STREAM_PM,
>   	DP_MAX_PM
>   };
>   
> @@ -40,7 +39,6 @@ static inline const char *dp_parser_pm_name(enum dp_pm_type module)
>   	switch (module) {
>   	case DP_CORE_PM:	return "DP_CORE_PM";
>   	case DP_CTRL_PM:	return "DP_CTRL_PM";
> -	case DP_STREAM_PM:	return "DP_STREAM_PM";
>   	default:		return "???";
>   	}
>   }
>

