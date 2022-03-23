Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 607514E5A19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Mar 2022 21:47:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236025AbiCWUs1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Mar 2022 16:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235974AbiCWUs1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Mar 2022 16:48:27 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5E618CCC3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 13:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1648068416; x=1679604416;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=AxGelGzu1bTctS6PiTzNznlLWIWY7xFgvOsi7zpXH2o=;
  b=CHJTxz9ROlbkbXWnJwCQqWQMLFp8/ew54BdG15T6BEzibeucFJA+hfT7
   igI664RBROGg0EE4kSkL7vgHzCO9Ccjnsm5Qwzg/y9XynlNjYErgLcfKK
   4QWzNhxgJmfShxM4mY990rk/6o1iItdwZwg870Eq5v4m7eeLwEjhnYdug
   A=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 23 Mar 2022 13:46:56 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2022 13:46:56 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 23 Mar 2022 13:46:55 -0700
Received: from [10.110.28.235] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 23 Mar
 2022 13:46:54 -0700
Message-ID: <813b8db3-dfe5-0a79-f625-2b96fede9385@quicinc.com>
Date:   Wed, 23 Mar 2022 13:46:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/3] drm/msm/dp: simplify dp_connector_get_modes()
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
 <20220323103546.1772673-3-dmitry.baryshkov@linaro.org>
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20220323103546.1772673-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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
> Since dp_panel_get_modes() handling for dp_mode was removed,
> dp_display_get_modes also doesn't change the passed dp_mode, drop the
> unused dp_mode variable being allocated unused and then freed.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>   drivers/gpu/drm/msm/dp/dp_display.c |  8 ++------
>   drivers/gpu/drm/msm/dp/dp_display.h |  3 +--
>   drivers/gpu/drm/msm/dp/dp_drm.c     | 29 +----------------------------
>   3 files changed, 4 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 3dd790083cf7..be1e9c558fda 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -999,8 +999,7 @@ int dp_display_validate_mode(struct msm_dp *dp, u32 mode_pclk_khz)
>   	return MODE_OK;
>   }
>   
> -int dp_display_get_modes(struct msm_dp *dp,
> -				struct dp_display_mode *dp_mode)
> +int dp_display_get_modes(struct msm_dp *dp)
>   {
>   	struct dp_display_private *dp_display;
>   	int ret = 0;
> @@ -1012,11 +1011,8 @@ int dp_display_get_modes(struct msm_dp *dp,
>   
>   	dp_display = container_of(dp, struct dp_display_private, dp_display);
>   
> -	ret = dp_panel_get_modes(dp_display->panel,
> +	return dp_panel_get_modes(dp_display->panel,
>   		dp->connector);
> -	if (dp_mode->drm_mode.clock)
> -		dp->max_pclk_khz = dp_mode->drm_mode.clock;
> -	return ret;
>   }
>   
>   bool dp_display_check_video_test(struct msm_dp *dp)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 7af2b186d2d9..6efb5c853c89 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -33,8 +33,7 @@ struct msm_dp {
>   int dp_display_set_plugged_cb(struct msm_dp *dp_display,
>   		hdmi_codec_plugged_cb fn, struct device *codec_dev);
>   int dp_display_validate_mode(struct msm_dp *dp_display, u32 mode_pclk_khz);
> -int dp_display_get_modes(struct msm_dp *dp_display,
> -		struct dp_display_mode *dp_mode);
> +int dp_display_get_modes(struct msm_dp *dp_display);
>   int dp_display_request_irq(struct msm_dp *dp_display);
>   bool dp_display_check_video_test(struct msm_dp *dp_display);
>   int dp_display_get_test_bpp(struct msm_dp *dp_display);
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 80f59cf99089..af5f1b001192 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -55,49 +55,22 @@ static int dp_connector_get_modes(struct drm_connector *connector)
>   {
>   	int rc = 0;
>   	struct msm_dp *dp;
> -	struct dp_display_mode *dp_mode = NULL;
> -	struct drm_display_mode *m, drm_mode;
>   
>   	if (!connector)
>   		return 0;
>   
>   	dp = to_dp_connector(connector)->dp_display;
>   
> -	dp_mode = kzalloc(sizeof(*dp_mode),  GFP_KERNEL);
> -	if (!dp_mode)
> -		return 0;
> -
>   	/* pluggable case assumes EDID is read when HPD */
>   	if (dp->is_connected) {
> -		/*
> -		 *The get_modes() function might return one mode that is stored
> -		 * in dp_mode when compliance test is in progress. If not, the
> -		 * return value is equal to the total number of modes supported
> -		 * by the sink
> -		 */
> -		rc = dp_display_get_modes(dp, dp_mode);
> +		rc = dp_display_get_modes(dp);
>   		if (rc <= 0) {
>   			DRM_ERROR("failed to get DP sink modes, rc=%d\n", rc);
> -			kfree(dp_mode);
>   			return rc;
>   		}
> -		if (dp_mode->drm_mode.clock) { /* valid DP mode */
> -			memset(&drm_mode, 0x0, sizeof(drm_mode));
> -			drm_mode_copy(&drm_mode, &dp_mode->drm_mode);
> -			m = drm_mode_duplicate(connector->dev, &drm_mode);
> -			if (!m) {
> -				DRM_ERROR("failed to add mode %ux%u\n",
> -				       drm_mode.hdisplay,
> -				       drm_mode.vdisplay);
> -				kfree(dp_mode);
> -				return 0;
> -			}
> -			drm_mode_probed_add(connector, m);
> -		}
>   	} else {
>   		DRM_DEBUG_DP("No sink connected\n");
>   	}
> -	kfree(dp_mode);
>   	return rc;
>   }
>   
