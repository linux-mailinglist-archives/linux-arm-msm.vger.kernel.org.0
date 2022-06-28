Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77BC455E805
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 18:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231835AbiF1Pjq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 11:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346985AbiF1Pjp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 11:39:45 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7877EBD6
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 08:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1656430782; x=1687966782;
  h=message-id:date:mime-version:subject:to:references:cc:
   from:in-reply-to:content-transfer-encoding;
  bh=/qonCNsytz4hwgdhglQD2xakJA85YDY3SfoM4l2DDeY=;
  b=jhWZqw49cdous4uLNUfZSEUkXUxpUI0e4UQr/Jo92KzKu6ifPx/qduQw
   Ra1US5Oy1hfmvyDDMhQ1rn+uTvbueKqJf3l11aRVJs6Wbous5Fpnc7lll
   UkrLXC08vxHrgq5VTIUs3Nwg8PyqJOmCwpYtIQpFKKKNLtGY4ykuRUcbg
   A=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Jun 2022 08:39:42 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2022 08:39:41 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 28 Jun 2022 08:39:41 -0700
Received: from [10.110.113.167] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 28 Jun
 2022 08:39:40 -0700
Message-ID: <fdba8976-1bae-9bb2-60a3-bd206bf03a52@quicinc.com>
Date:   Tue, 28 Jun 2022 08:39:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Fwd: [PATCH v2 2/3] drm/msm/dp: rename second
 dp_display_enable()'s argument
Content-Language: en-US
To:     <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220617232434.1139950-2-dmitry.baryshkov@linaro.org>
 <b88142b5-2614-23e6-75fd-46f864716fd7@quicinc.com>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <b88142b5-2614-23e6-75fd-46f864716fd7@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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


On 6/24/2022 10:36 AM, Abhinav Kumar wrote:
>
>
>
> -------- Forwarded Message --------
> Subject: [PATCH v2 2/3] drm/msm/dp: rename second 
> dp_display_enable()'s argument
> Date: Sat, 18 Jun 2022 02:24:33 +0300
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
> Abhinav Kumar <quic_abhinavk@quicinc.com>
> CC: Stephen Boyd <swboyd@chromium.org>, David Airlie 
> <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson 
> <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, 
> dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
>
> To follow up recent changes, rename (and change type of) second
> dp_display_enable()'s argument from generic u32 data to bool
> force_link_train, which is later passed to dp_ctrl_on_stream().
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

> ---
> Changes since v1:
>  - Added patch
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
> b/drivers/gpu/drm/msm/dp/dp_display.c
> index fea610793dc4..96defacc92dc 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -608,7 +608,7 @@ static int dp_hpd_plug_handle(struct 
> dp_display_private *dp, u32 data)
>      return 0;
>  };
>  -static int dp_display_enable(struct dp_display_private *dp, u32 data);
> +static int dp_display_enable(struct dp_display_private *dp, bool 
> force_link_train);
>  static int dp_display_disable(struct dp_display_private *dp, u32 data);
>   static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
> @@ -857,7 +857,7 @@ static int dp_display_set_mode(struct msm_dp 
> *dp_display,
>      return 0;
>  }
>  -static int dp_display_enable(struct dp_display_private *dp, u32 data)
> +static int dp_display_enable(struct dp_display_private *dp, bool 
> force_link_train)
>  {
>      int rc = 0;
>      struct msm_dp *dp_display = &dp->dp_display;
> @@ -868,7 +868,7 @@ static int dp_display_enable(struct 
> dp_display_private *dp, u32 data)
>          return 0;
>      }
>  -    rc = dp_ctrl_on_stream(dp->ctrl, data);
> +    rc = dp_ctrl_on_stream(dp->ctrl, force_link_train);
>      if (!rc)
>          dp_display->power_on = true;
>  -- 2.35.1
>
