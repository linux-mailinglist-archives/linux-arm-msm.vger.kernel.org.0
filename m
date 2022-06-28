Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8981B55E6E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 18:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347922AbiF1PiM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 11:38:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347931AbiF1Phq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 11:37:46 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDE4B35DCA
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 08:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1656430656; x=1687966656;
  h=message-id:date:mime-version:subject:to:references:cc:
   from:in-reply-to:content-transfer-encoding;
  bh=NXj1WZe08kEUAOpbbP1dP8Pw6O6wQJTbDFXzWboZB6I=;
  b=KVMPyhUbIuTRT2zwrxBPUwsHncG06ytdBa/JSjgpX3XPbXG6Hz2u7SXt
   bwAgbKhJm7+GlKGNBAtVgVCZ0nzpKerwajHUoikyBDN9b0UAvHgbuMOPc
   nspv3lU+0y6s9mfRhHZ9gFYUBFe8vWNPeDlX0IJ/N9ztXH/50sNRwby9/
   0=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 28 Jun 2022 08:37:36 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2022 08:37:35 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 28 Jun 2022 08:37:35 -0700
Received: from [10.110.113.167] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 28 Jun
 2022 08:37:34 -0700
Message-ID: <fedce9fe-5145-ea90-9012-7e5dceef3163@quicinc.com>
Date:   Tue, 28 Jun 2022 08:37:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Fwd: [Freedreno] [PATCH v2 1/3] drm/msm/dp: remove unused stubs
Content-Language: en-US
To:     <dmitry.baryshkov@linaro.org>, <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220617232434.1139950-1-dmitry.baryshkov@linaro.org>
 <9b5b6fed-cd42-fd38-a1ff-58cb590482fe@quicinc.com>
CC:     David Airlie <airlied@linux.ie>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        <freedreno@lists.freedesktop.org>
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <9b5b6fed-cd42-fd38-a1ff-58cb590482fe@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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


On 6/24/2022 10:36 AM, Abhinav Kumar wrote:
>
>
>
> -------- Forwarded Message --------
> Subject: [Freedreno] [PATCH v2 1/3] drm/msm/dp: remove unused stubs
> Date: Sat, 18 Jun 2022 02:24:32 +0300
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
> Abhinav Kumar <quic_abhinavk@quicinc.com>
> CC: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org, 
> dri-devel@lists.freedesktop.org, Bjorn Andersson 
> <bjorn.andersson@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, Stephen 
> Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
>
> Refactoring DP code transformed several functions into empty stubs.
> Remove them.
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 35 -----------------------------
>  1 file changed, 35 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
> b/drivers/gpu/drm/msm/dp/dp_display.c
> index 08e3f0b1b395..fea610793dc4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -857,11 +857,6 @@ static int dp_display_set_mode(struct msm_dp 
> *dp_display,
>      return 0;
>  }
>  -static int dp_display_prepare(struct msm_dp *dp_display)
> -{
> -    return 0;
> -}
> -
>  static int dp_display_enable(struct dp_display_private *dp, u32 data)
>  {
>      int rc = 0;
> @@ -938,11 +933,6 @@ static int dp_display_disable(struct 
> dp_display_private *dp, u32 data)
>      return 0;
>  }
>  -static int dp_display_unprepare(struct msm_dp *dp_display)
> -{
> -    return 0;
> -}
> -
>  int dp_display_set_plugged_cb(struct msm_dp *dp_display,
>          hdmi_codec_plugged_cb fn, struct device *codec_dev)
>  {
> @@ -1458,21 +1448,9 @@ static int dp_pm_suspend(struct device *dev)
>      return 0;
>  }
>  -static int dp_pm_prepare(struct device *dev)
> -{
> -    return 0;
> -}
> -
> -static void dp_pm_complete(struct device *dev)
> -{
> -
> -}
> -
>  static const struct dev_pm_ops dp_pm_ops = {
>      .suspend = dp_pm_suspend,
>      .resume =  dp_pm_resume,
> -    .prepare = dp_pm_prepare,
> -    .complete = dp_pm_complete,
>  };
>   static struct platform_driver dp_display_driver = {
> @@ -1686,13 +1664,6 @@ void dp_bridge_enable(struct drm_bridge 
> *drm_bridge)
>          return;
>      }
>  -    rc = dp_display_prepare(dp);
> -    if (rc) {
> -        DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
> -        mutex_unlock(&dp_display->event_mutex);
> -        return;
> -    }
> -
>      state =  dp_display->hpd_state;
>       if (state == ST_DISPLAY_OFF) {
> @@ -1706,7 +1677,6 @@ void dp_bridge_enable(struct drm_bridge 
> *drm_bridge)
>      if (rc) {
>          DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
>          dp_display_disable(dp_display, 0);
> -        dp_display_unprepare(dp);
>      }
>       /* completed connection */
> @@ -1731,7 +1701,6 @@ void dp_bridge_post_disable(struct drm_bridge 
> *drm_bridge)
>  {
>      struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
>      struct msm_dp *dp = dp_bridge->dp_display;
> -    int rc = 0;
>      u32 state;
>      struct dp_display_private *dp_display;
>  @@ -1750,10 +1719,6 @@ void dp_bridge_post_disable(struct drm_bridge 
> *drm_bridge)
>       dp_display_disable(dp_display, 0);
>  -    rc = dp_display_unprepare(dp);
> -    if (rc)
> -        DRM_ERROR("DP display unprepare failed, rc=%d\n", rc);
> -
>      state =  dp_display->hpd_state;
>      if (state == ST_DISCONNECT_PENDING) {
>          /* completed disconnection */
