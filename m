Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A54444E5A4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Mar 2022 22:02:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240829AbiCWVEG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Mar 2022 17:04:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238959AbiCWVEF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Mar 2022 17:04:05 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E26F7580FA
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 14:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1648069355; x=1679605355;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wYy+UKVRUiZUUpyNwqERacFeo/23Mh9A/vuoVECNjdc=;
  b=TvD9pcSexWRhRUpplhq/BCKV128vJA6OFzefH+fR34dPs0sVIKgpSn4J
   TrmLbNgSZko8bQkTEApbAvRhT13/RudA8GC2fUM+5yE6YkBjomT9zxnsZ
   ZN/DTbA5GDOWonqv2HRsY/sXg5Di7xn/BpwiJBnT1zDQ8yDtcJCv8ACgx
   Y=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 23 Mar 2022 14:02:35 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2022 14:02:35 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 23 Mar 2022 14:02:34 -0700
Received: from [10.110.28.235] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 23 Mar
 2022 14:02:33 -0700
Message-ID: <b19ea2c3-9283-3dd0-98d0-d00d59dacacc@quicinc.com>
Date:   Wed, 23 Mar 2022 14:02:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] drm/msm/dp: drop dp_mode argument from
 dp_panel_get_modes()
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
 <20220323103546.1772673-2-dmitry.baryshkov@linaro.org>
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20220323103546.1772673-2-dmitry.baryshkov@linaro.org>
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
> Since the commit ab205927592b ("drm/msm/dp: remove mode hard-coding in
> case of DP CTS") the function dp_panel_get_modes() doesn't use (or fill)
> the dp_mode argument. Drop it completely.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>   drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>   drivers/gpu/drm/msm/dp/dp_panel.c   | 2 +-
>   drivers/gpu/drm/msm/dp/dp_panel.h   | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 178b774a5fbd..3dd790083cf7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1013,7 +1013,7 @@ int dp_display_get_modes(struct msm_dp *dp,
>   	dp_display = container_of(dp, struct dp_display_private, dp_display);
>   
>   	ret = dp_panel_get_modes(dp_display->panel,
> -		dp->connector, dp_mode);
> +		dp->connector);
>   	if (dp_mode->drm_mode.clock)
>   		dp->max_pclk_khz = dp_mode->drm_mode.clock;
>   	return ret;
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index f1418722c549..8d7662028f30 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -259,7 +259,7 @@ u32 dp_panel_get_mode_bpp(struct dp_panel *dp_panel,
>   }
>   
>   int dp_panel_get_modes(struct dp_panel *dp_panel,
> -	struct drm_connector *connector, struct dp_display_mode *mode)
> +	struct drm_connector *connector)
>   {
>   	if (!dp_panel) {
>   		DRM_ERROR("invalid input\n");
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 9023e5bb4b8b..9fa6e524832c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -64,7 +64,7 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>   u32 dp_panel_get_mode_bpp(struct dp_panel *dp_panel, u32 mode_max_bpp,
>   			u32 mode_pclk_khz);
>   int dp_panel_get_modes(struct dp_panel *dp_panel,
> -		struct drm_connector *connector, struct dp_display_mode *mode);
> +		struct drm_connector *connector);
>   void dp_panel_handle_sink_request(struct dp_panel *dp_panel);
>   void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable);
>   
