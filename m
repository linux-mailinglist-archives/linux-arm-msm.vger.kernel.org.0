Return-Path: <linux-arm-msm+bounces-8496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1197383E542
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 23:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3771D1C2088B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 22:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA102263E;
	Fri, 26 Jan 2024 22:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CF26xjWF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2392A1CD34
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 22:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706307798; cv=none; b=t2i6HCWeBddQILaf2H4bLLnCiRvbc+XvPCZVaATtvxYyiUuhPP6fPBVKvH36J7g+KEICL2r6jA1xNlgoxV2LN/JflO84sXs3MhLGNNP1uA8/cMk9KalgrCaayCkYWXjh8lYT7O8c7pL3D7ASWSdJZw7FERlSuc1O0MV+F5XQajM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706307798; c=relaxed/simple;
	bh=WBB/iBnd/mJoctyviKOhO9b+S+NULfAC5bS4Cso51Z8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rviUgRTZH57rXyeAMzm+cQHY65BPqVsdCsmCyM4OtxTZuSjFF9N6HYfinQ2sINyF8RfJkZHDZkuby+ngNfF6LNg8tYEd276r00a2GCk15ro43JcR1qod9IJAqnot8fA1RR/QkldYwomyflyQ+/rvvt+u6jzYZqWnMiYVYF4HsfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CF26xjWF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40QLcYhv019021;
	Fri, 26 Jan 2024 22:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=beiHHDRgYfSCNe8rwDTZ6pBzH79kuCoMlCNyoHedrIA=; b=CF
	26xjWF4/SK8m3qx7Rpdc1+OKnoxtoHVoRqFQ6vsPAIPdXKHwDzwZh+QL3lGaYYra
	5nzZoBhq0OwVelCNnZDwX85KZJbTjNRYnBmvPae4PvuWsc2PmnJX7RItnvZ53ajn
	QpAYYjzkcXY3tVv5FigZWVCK1psDxgi0uo4JiFNCUFtkXVLzD+TezqP1szVSAbzY
	nDzOBCsa7M/aKGt9bdn591TAUqJPTVN2tzrPND3I7vh8/bNYb8vGo6U1k+9vp+Sn
	jKMTWa8zo8vh79VXWrPvSR/ktZPtWQmAp8JmEtPbNoq3w5cPEPY3aF3Uvc1LcRTm
	1G5sUsU+pyfoSHFs2trg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvjbg8bch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 22:23:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QMN616003152
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 22:23:06 GMT
Received: from [10.110.48.234] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 14:23:05 -0800
Message-ID: <83caa905-3cf7-ea12-79bf-5ebbc0ab25e3@quicinc.com>
Date: Fri, 26 Jan 2024 14:23:04 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v3 09/15] drm/msm/dp: move phy_configure_opts to
 dp_ctrl
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
 <20240126-dp-power-parser-cleanup-v3-9-098d5f581dd3@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-9-098d5f581dd3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iDs5T5e5JX2fHg_bzNSp-NX_U46llvCN
X-Proofpoint-ORIG-GUID: iDs5T5e5JX2fHg_bzNSp-NX_U46llvCN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401260164


On 1/26/2024 10:26 AM, Dmitry Baryshkov wrote:
> There is little point in sharing phy configuration structure between
> several modules. Move it to dp_ctrl, which becomes the only submodule
> re-configuring the PHY.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_catalog.c | 19 -----------------
>   drivers/gpu/drm/msm/dp/dp_catalog.h |  2 --
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 41 ++++++++++++++++++++++++-------------
>   drivers/gpu/drm/msm/dp/dp_parser.h  |  3 ---
>   4 files changed, 27 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 5142aeb705a4..e07651768805 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -765,25 +765,6 @@ void dp_catalog_ctrl_phy_reset(struct dp_catalog *dp_catalog)
>   	dp_write_ahb(catalog, REG_DP_PHY_CTRL, 0x0);
>   }
>   
> -int dp_catalog_ctrl_update_vx_px(struct dp_catalog *dp_catalog,
> -		u8 v_level, u8 p_level)
> -{
> -	struct dp_catalog_private *catalog = container_of(dp_catalog,
> -				struct dp_catalog_private, dp_catalog);
> -	struct dp_io *dp_io = catalog->io;
> -	struct phy *phy = dp_io->phy;
> -	struct phy_configure_opts_dp *opts_dp = &dp_io->phy_opts.dp;
> -
> -	/* TODO: Update for all lanes instead of just first one */
> -	opts_dp->voltage[0] = v_level;
> -	opts_dp->pre[0] = p_level;
> -	opts_dp->set_voltages = 1;
> -	phy_configure(phy, &dp_io->phy_opts);
> -	opts_dp->set_voltages = 0;
> -
> -	return 0;
> -}
> -
>   void dp_catalog_ctrl_send_phy_pattern(struct dp_catalog *dp_catalog,
>   			u32 pattern)
>   {
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 38786e855b51..ba7c62ba7ca3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -111,8 +111,6 @@ void dp_catalog_ctrl_set_psr(struct dp_catalog *dp_catalog, bool enter);
>   u32 dp_catalog_link_is_connected(struct dp_catalog *dp_catalog);
>   u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog);
>   void dp_catalog_ctrl_phy_reset(struct dp_catalog *dp_catalog);
> -int dp_catalog_ctrl_update_vx_px(struct dp_catalog *dp_catalog, u8 v_level,
> -				u8 p_level);
>   int dp_catalog_ctrl_get_interrupt(struct dp_catalog *dp_catalog);
>   u32 dp_catalog_ctrl_read_psr_interrupt_status(struct dp_catalog *dp_catalog);
>   void dp_catalog_ctrl_update_transfer_unit(struct dp_catalog *dp_catalog,
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index e367eb8e5bea..4aea72a2b8e8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -87,6 +87,8 @@ struct dp_ctrl_private {
>   
>   	struct clk *pixel_clk;
>   
> +	union phy_configure_opts phy_opts;
> +
>   	struct completion idle_comp;
>   	struct completion psr_op_comp;
>   	struct completion video_comp;
> @@ -1017,6 +1019,21 @@ static int dp_ctrl_wait4video_ready(struct dp_ctrl_private *ctrl)
>   	return ret;
>   }
>   
> +static int dp_ctrl_set_vx_px(struct dp_ctrl_private *ctrl,
> +			     u8 v_level, u8 p_level)
> +{
> +	union phy_configure_opts *phy_opts = &ctrl->phy_opts;
> +
> +	/* TODO: Update for all lanes instead of just first one */
> +	phy_opts->dp.voltage[0] = v_level;
> +	phy_opts->dp.pre[0] = p_level;
> +	phy_opts->dp.set_voltages = 1;
> +	phy_configure(ctrl->parser->io.phy, phy_opts);
> +	phy_opts->dp.set_voltages = 0;
> +
> +	return 0;
> +}
> +
>   static int dp_ctrl_update_vx_px(struct dp_ctrl_private *ctrl)
>   {
>   	struct dp_link *link = ctrl->link;
> @@ -1029,7 +1046,7 @@ static int dp_ctrl_update_vx_px(struct dp_ctrl_private *ctrl)
>   	drm_dbg_dp(ctrl->drm_dev,
>   		"voltage level: %d emphasis level: %d\n",
>   			voltage_swing_level, pre_emphasis_level);
> -	ret = dp_catalog_ctrl_update_vx_px(ctrl->catalog,
> +	ret = dp_ctrl_set_vx_px(ctrl,
>   		voltage_swing_level, pre_emphasis_level);
>   
>   	if (ret)
> @@ -1425,16 +1442,14 @@ static void dp_ctrl_link_clk_disable(struct dp_ctrl *dp_ctrl)
>   static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
>   {
>   	int ret = 0;
> -	struct dp_io *dp_io = &ctrl->parser->io;
> -	struct phy *phy = dp_io->phy;
> -	struct phy_configure_opts_dp *opts_dp = &dp_io->phy_opts.dp;
> +	struct phy *phy = ctrl->parser->io.phy;
>   	const u8 *dpcd = ctrl->panel->dpcd;
>   
> -	opts_dp->lanes = ctrl->link->link_params.num_lanes;
> -	opts_dp->link_rate = ctrl->link->link_params.rate / 100;
> -	opts_dp->ssc = drm_dp_max_downspread(dpcd);
> +	ctrl->phy_opts.dp.lanes = ctrl->link->link_params.num_lanes;
> +	ctrl->phy_opts.dp.link_rate = ctrl->link->link_params.rate / 100;
> +	ctrl->phy_opts.dp.ssc = drm_dp_max_downspread(dpcd);
>   
> -	phy_configure(phy, &dp_io->phy_opts);
> +	phy_configure(phy, &ctrl->phy_opts);
>   	phy_power_on(phy);
>   
>   	dev_pm_opp_set_rate(ctrl->dev, ctrl->link->link_params.rate * 1000);
> @@ -1572,14 +1587,12 @@ static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
>   
>   static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
>   {
> +	struct phy *phy = ctrl->parser->io.phy;
>   	int ret = 0;
> -	struct dp_io *dp_io = &ctrl->parser->io;
> -	struct phy *phy = dp_io->phy;
> -	struct phy_configure_opts_dp *opts_dp = &dp_io->phy_opts.dp;
>   
>   	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
> -	opts_dp->lanes = ctrl->link->link_params.num_lanes;
> -	phy_configure(phy, &dp_io->phy_opts);
> +	ctrl->phy_opts.dp.lanes = ctrl->link->link_params.num_lanes;
> +	phy_configure(phy, &ctrl->phy_opts);
>   	/*
>   	 * Disable and re-enable the mainlink clock since the
>   	 * link clock might have been adjusted as part of the
> @@ -1659,7 +1672,7 @@ static bool dp_ctrl_send_phy_test_pattern(struct dp_ctrl_private *ctrl)
>   
>   	drm_dbg_dp(ctrl->drm_dev, "request: 0x%x\n", pattern_requested);
>   
> -	if (dp_catalog_ctrl_update_vx_px(ctrl->catalog,
> +	if (dp_ctrl_set_vx_px(ctrl,
>   			ctrl->link->phy_params.v_level,
>   			ctrl->link->phy_params.p_level)) {
>   		DRM_ERROR("Failed to set v/p levels\n");
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index cad82c4d07da..b28052e87101 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -7,8 +7,6 @@
>   #define _DP_PARSER_H_
>   
>   #include <linux/platform_device.h>
> -#include <linux/phy/phy.h>
> -#include <linux/phy/phy-dp.h>
>   
>   #include "msm_drv.h"
>   
> @@ -37,7 +35,6 @@ struct dss_io_data {
>   struct dp_io {
>   	struct dss_io_data dp_controller;
>   	struct phy *phy;
> -	union phy_configure_opts phy_opts;
>   };
>   
>   /**
>

