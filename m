Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B48FE55CD90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238225AbiF0T04 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 15:26:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238100AbiF0T0z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 15:26:55 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F328563F5
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 12:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1656358015; x=1687894015;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=p7RGYzYkoXiA7n4CTkYXOO66QGVDnCk+6bMDg4xrcKs=;
  b=ApoZK+CuDpla+MY379PtWLLN+64wh5dSl46qLCv1IVfsidDmwyG7LpnH
   QGoVufYl8qQ6lY6CL+H6WvrlbYVkGezeRwSNittJKsS9I72MP+EwcURYc
   DhzA4orYMQmO8RAamdvAIkMNvV1HgYuJpK22hAT9Fy5bCWOsn8e05VEwz
   c=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 27 Jun 2022 12:26:54 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 12:26:54 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 27 Jun 2022 12:26:53 -0700
Received: from [10.110.113.167] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 27 Jun
 2022 12:26:52 -0700
Message-ID: <9f82dd3f-5ecc-4e1d-6cce-0749b8316d49@quicinc.com>
Date:   Mon, 27 Jun 2022 12:26:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/msm/dp: use ARRAY_SIZE for calculating num_descs
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20220627165413.657142-1-dmitry.baryshkov@linaro.org>
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20220627165413.657142-1-dmitry.baryshkov@linaro.org>
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


On 6/27/2022 9:54 AM, Dmitry Baryshkov wrote:
> If for some reason the msm_dp_config::descs array starts from non-zero
> index or contains the hole, setting the msm_dp_config::num_descs might
> be not that obvious and error-prone. Use ARRAY_SIZE to set this field
> rather than encoding the value manually.
>
> Reported-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 46 +++++++++++++++++------------
>   1 file changed, 27 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index f87fa3ba1e25..6fed738a9467 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -131,35 +131,43 @@ struct msm_dp_config {
>   	size_t num_descs;
>   };
>   
> +static const struct msm_dp_desc sc7180_dp_descs[] = {
> +	[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +};
> +
>   static const struct msm_dp_config sc7180_dp_cfg = {
> -	.descs = (const struct msm_dp_desc[]) {
> -		[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> -	},
> -	.num_descs = 1,
> +	.descs = sc7180_dp_descs,
> +	.num_descs = ARRAY_SIZE(sc7180_dp_descs),
> +};
> +

why you want to do that?

It is very clear only one entry, why you want to make it 2 entry here?

can you just embedded MSM_DP_COTROLLER_x into struct msm_dp_config?

> +static const struct msm_dp_desc sc7280_dp_descs[] = {
> +	[MSM_DP_CONTROLLER_0] =	{ .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
> +	[MSM_DP_CONTROLLER_1] =	{ .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
>   };
>   
>   static const struct msm_dp_config sc7280_dp_cfg = {
> -	.descs = (const struct msm_dp_desc[]) {
> -		[MSM_DP_CONTROLLER_0] =	{ .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
> -		[MSM_DP_CONTROLLER_1] =	{ .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
> -	},
> -	.num_descs = 2,
> +	.descs = sc7280_dp_descs,
> +	.num_descs = ARRAY_SIZE(sc7280_dp_descs),
> +};
> +
> +static const struct msm_dp_desc sc8180x_dp_descs[] = {
> +	[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +	[MSM_DP_CONTROLLER_1] = { .io_start = 0x0ae98000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +	[MSM_DP_CONTROLLER_2] = { .io_start = 0x0ae9a000, .connector_type = DRM_MODE_CONNECTOR_eDP },
>   };
>   
>   static const struct msm_dp_config sc8180x_dp_cfg = {
> -	.descs = (const struct msm_dp_desc[]) {
> -		[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> -		[MSM_DP_CONTROLLER_1] = { .io_start = 0x0ae98000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> -		[MSM_DP_CONTROLLER_2] = { .io_start = 0x0ae9a000, .connector_type = DRM_MODE_CONNECTOR_eDP },
> -	},
> -	.num_descs = 3,
> +	.descs = sc8180x_dp_descs,
> +	.num_descs = ARRAY_SIZE(sc8180x_dp_descs),
> +};
> +
> +static const struct msm_dp_desc sm8350_dp_descs[] = {
> +	[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
>   };
>   
>   static const struct msm_dp_config sm8350_dp_cfg = {
> -	.descs = (const struct msm_dp_desc[]) {
> -		[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> -	},
> -	.num_descs = 1,
> +	.descs = sm8350_dp_descs,
> +	.num_descs = ARRAY_SIZE(sm8350_dp_descs),
>   };
>   
>   static const struct of_device_id dp_dt_match[] = {
