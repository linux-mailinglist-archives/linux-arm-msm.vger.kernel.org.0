Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EABC4E5A1C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Mar 2022 21:47:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235974AbiCWUtL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Mar 2022 16:49:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbiCWUtL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Mar 2022 16:49:11 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B338C7FC
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 13:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1648068461; x=1679604461;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=if2AkYTpflURygMrvNBiLZ1rVVRPetQsC8hRMLObOvM=;
  b=XygSN0gZf/fYxSJlATvAx8YA7uMv2eWePrx7O2iPNBrOLIBRZ6gMAFYt
   8eHlaZUVYauNAGxriCvAmy6FnRxD+6cQj361qyvs3AmbJJOYh73JS/6Lo
   0HD7TRtiIcvOF2QXwTj8USu3qxMkNnlwBohZK+r5e63BTNwQ8wHQ6oI2u
   k=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 23 Mar 2022 13:47:41 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2022 13:47:41 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 23 Mar 2022 13:47:20 -0700
Received: from [10.110.28.235] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 23 Mar
 2022 13:47:19 -0700
Message-ID: <77d402e7-23ae-430e-0e2b-0c00950917be@quicinc.com>
Date:   Wed, 23 Mar 2022 13:47:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/3] drm/msm/dp: remove max_pclk_khz field from
 dp_panel/dp_display
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Sankeerth Billakanti" <quic_sbillaka@quicinc.com>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20220323103546.1772673-1-dmitry.baryshkov@linaro.org>
 <20220323103546.1772673-4-dmitry.baryshkov@linaro.org>
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20220323103546.1772673-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/23/2022 3:35 AM, Dmitry Baryshkov wrote:
> Since the last commit, the max_pclk_khz became constant, it's set to
> DP_MAX_PIXEL_CLK_KHZ and never changed afterwards. Remove it completely
> and use DP_MAX_PIXEL_CLK_KHZ directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>   drivers/gpu/drm/msm/dp/dp_debug.c   | 2 --
>   drivers/gpu/drm/msm/dp/dp_display.c | 1 -
>   drivers/gpu/drm/msm/dp/dp_display.h | 2 --
>   drivers/gpu/drm/msm/dp/dp_drm.c     | 4 +---
>   drivers/gpu/drm/msm/dp/dp_panel.h   | 1 -
>   5 files changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
> index 2f9c943f12d5..5e35033ba3e4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> @@ -44,8 +44,6 @@ static int dp_debug_show(struct seq_file *seq, void *p)
>   	drm_mode = &debug->panel->dp_mode.drm_mode;
>   
>   	seq_printf(seq, "\tname = %s\n", DEBUG_NAME);
> -	seq_printf(seq, "\tdp_panel\n\t\tmax_pclk_khz = %d\n",
> -			debug->panel->max_pclk_khz);
>   	seq_printf(seq, "\tdrm_dp_link\n\t\trate = %u\n",
>   			debug->panel->link_info.rate);
>   	seq_printf(seq, "\t\tnum_lanes = %u\n",
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index be1e9c558fda..aeb08416b309 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -370,7 +370,6 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
>   	dp->audio_supported = drm_detect_monitor_audio(edid);
>   	dp_panel_handle_sink_request(dp->panel);
>   
> -	dp->dp_display.max_pclk_khz = DP_MAX_PIXEL_CLK_KHZ;
>   	dp->dp_display.max_dp_lanes = dp->parser->max_dp_lanes;
>   
>   	/*
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 6efb5c853c89..f3a9d7449a1c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -24,8 +24,6 @@ struct msm_dp {
>   
>   	hdmi_codec_plugged_cb plugged_cb;
>   
> -	u32 max_pclk_khz;
> -
>   	u32 max_dp_lanes;
>   	struct dp_audio *dp_audio;
>   };
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index af5f1b001192..a94c9b34f397 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -88,9 +88,7 @@ static enum drm_mode_status dp_connector_mode_valid(
>   
>   	dp_disp = to_dp_connector(connector)->dp_display;
>   
> -	if ((dp_disp->max_pclk_khz <= 0) ||
> -			(dp_disp->max_pclk_khz > DP_MAX_PIXEL_CLK_KHZ) ||
> -			(mode->clock > dp_disp->max_pclk_khz))
> +	if (mode->clock > DP_MAX_PIXEL_CLK_KHZ)
>   		return MODE_BAD;
>   
>   	return dp_display_validate_mode(dp_disp, mode->clock);
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 9fa6e524832c..d861197ac1c8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -49,7 +49,6 @@ struct dp_panel {
>   	bool video_test;
>   
>   	u32 vic;
> -	u32 max_pclk_khz;
>   	u32 max_dp_lanes;
>   
>   	u32 max_bw_code;
