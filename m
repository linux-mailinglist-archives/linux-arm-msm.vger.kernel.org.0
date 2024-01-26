Return-Path: <linux-arm-msm+bounces-8488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF28E83E51F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 23:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D46AA1C24A35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 22:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA2133CF7;
	Fri, 26 Jan 2024 22:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I0ddWUXv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6548833CF3
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 22:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706307542; cv=none; b=hugP5eo+BegSXZXoeMJ1oe0qJrEoK9QgLmhl9seshy6csKoyTzCrGo6LVKYSeaXf0CZLspqfEPiym+IJgMYMQ2/yBybKX0MaejOxwQmBM6LpelArVdOtiLNwXcNcHV3n8f/N5KOfqhD6g/axXhirO+43keh6rGr0zirBSNe2U6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706307542; c=relaxed/simple;
	bh=E2faZH6NxjxRb7Z9N8c0X+VACgZLKoBorm8y/H36NKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=F/TD7Abrwiell+6vUP7kEzUXh+h68Ye0zyyrka6JrT5LYsuZyjj0b0KvPozvOpIFl/Ph8S0yvYNM6LVwg0B+JDnam8kFVCGk+Mr7uKgeVT4EdT8B7CUz73m4SG1c7hyCkt8E7hR0ouBoKShT8soWAPBL8V6zq4nO7CG0cicLNO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I0ddWUXv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40QLicUV026566;
	Fri, 26 Jan 2024 22:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=qACICpLrScnj337RfxBowEeoDX9Wq61cCRnjzzLWeM8=; b=I0
	ddWUXvaZ7J24XJbRS4mN+HsJ+gRCVy2Ex3jQfdnsvUbdmgdveOEvQO7ToVxf5lyG
	7aKBMC28YNbKVjji1W2zsHxnWwaNdZR4fUdsey8uDIRp49I0cywNTdSgg087M/vw
	0p22lQlpd1TcqM1eXVsuK8/8naWQ3teBYO43BvSPGJtr3PiybpVyassuwlJ4CqnJ
	d89tq+8PWa3PXnvqg6fDXIGmtn1LtVd9mfCeTaIgHIAyz+XkXiDMSy8TdRzEnllt
	SCYjvJdKRqKiSgDURllv98VvQNgLbLj015rbllHDYSJXyX/8dDOY4bkhUBP34Zv9
	0FcKrh2pw3KH0R79yzpg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vv4nra83r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 22:18:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QMIhUU030862
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 22:18:43 GMT
Received: from [10.110.48.234] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 14:18:42 -0800
Message-ID: <54f95014-27a1-13a7-b32c-d4cd1a461ad9@quicinc.com>
Date: Fri, 26 Jan 2024 14:18:41 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v3 01/15] drm/msm/dp: drop unused parser
 definitions
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
 <20240126-dp-power-parser-cleanup-v3-1-098d5f581dd3@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-1-098d5f581dd3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tqwNFw4De17KlPN4-pMm-jHUdkepgbqg
X-Proofpoint-GUID: tqwNFw4De17KlPN4-pMm-jHUdkepgbqg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401260163


On 1/26/2024 10:26 AM, Dmitry Baryshkov wrote:
> Drop several unused and obsolete definitions from the dp_parser module.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_parser.h | 46 --------------------------------------
>   1 file changed, 46 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index 1f068626d445..90a2cdbbe344 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -12,7 +12,6 @@
>   
>   #include "msm_drv.h"
>   
> -#define DP_LABEL "MDSS DP DISPLAY"
>   #define DP_MAX_PIXEL_CLK_KHZ	675000
>   #define DP_MAX_NUM_DP_LANES	4
>   #define DP_LINK_RATE_HBR2	540000 /* kbytes */
> @@ -21,7 +20,6 @@ enum dp_pm_type {
>   	DP_CORE_PM,
>   	DP_CTRL_PM,
>   	DP_STREAM_PM,
> -	DP_PHY_PM,
>   	DP_MAX_PM
>   };
>   
> @@ -43,28 +41,10 @@ static inline const char *dp_parser_pm_name(enum dp_pm_type module)
>   	case DP_CORE_PM:	return "DP_CORE_PM";
>   	case DP_CTRL_PM:	return "DP_CTRL_PM";
>   	case DP_STREAM_PM:	return "DP_STREAM_PM";
> -	case DP_PHY_PM:		return "DP_PHY_PM";
>   	default:		return "???";
>   	}
>   }
>   
> -/**
> - * struct dp_display_data  - display related device tree data.
> - *
> - * @ctrl_node: referece to controller device
> - * @phy_node:  reference to phy device
> - * @is_active: is the controller currently active
> - * @name: name of the display
> - * @display_type: type of the display
> - */
> -struct dp_display_data {
> -	struct device_node *ctrl_node;
> -	struct device_node *phy_node;
> -	bool is_active;
> -	const char *name;
> -	const char *display_type;
> -};
> -
>   /**
>    * struct dp_ctrl_resource - controller's IO related data
>    *
> @@ -77,28 +57,6 @@ struct dp_io {
>   	union phy_configure_opts phy_opts;
>   };
>   
> -/**
> - * struct dp_pinctrl - DP's pin control
> - *
> - * @pin: pin-controller's instance
> - * @state_active: active state pin control
> - * @state_hpd_active: hpd active state pin control
> - * @state_suspend: suspend state pin control
> - */
> -struct dp_pinctrl {
> -	struct pinctrl *pin;
> -	struct pinctrl_state *state_active;
> -	struct pinctrl_state *state_hpd_active;
> -	struct pinctrl_state *state_suspend;
> -};
> -
> -/* Regulators for DP devices */
> -struct dp_reg_entry {
> -	char name[32];
> -	int enable_load;
> -	int disable_load;
> -};
> -
>   struct dss_module_power {
>   	unsigned int num_clk;
>   	struct clk_bulk_data *clocks;
> @@ -109,16 +67,12 @@ struct dss_module_power {
>    *
>    * @pdev: platform data of the client
>    * @mp: gpio, regulator and clock related data
> - * @pinctrl: pin-control related data
> - * @disp_data: controller's display related data
>    * @parse: function to be called by client to parse device tree.
>    */
>   struct dp_parser {
>   	struct platform_device *pdev;
>   	struct dss_module_power mp[DP_MAX_PM];
> -	struct dp_pinctrl pinctrl;
>   	struct dp_io io;
> -	struct dp_display_data disp_data;
>   	u32 max_dp_lanes;
>   	u32 max_dp_link_rate;
>   	struct drm_bridge *next_bridge;
>

