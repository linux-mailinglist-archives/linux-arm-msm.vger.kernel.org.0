Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BAC4570956
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 19:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231655AbiGKRml (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 13:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231684AbiGKRmk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 13:42:40 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09E3A6F7C3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 10:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657561359; x=1689097359;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UMLPEIH6//nN7NZVFjr8bOKULdw0gq6WUbwlYKf3Nks=;
  b=K3+u4YeKUyXibaGmV+UtLO/ecbNV8gQ9J2/PWR+gA7Qa2op3qxtJcl1G
   DGNL11mvnnL+w2A0mbhn0ti123AkQ2unDGVpTcMvfhJdR3o+kj7ONH4DJ
   g5/ADxX6LAYOIRNMaudvNwF50idbvpVRErt02tZrl4+8qKS9ezDfHJxg0
   Q=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 11 Jul 2022 10:42:38 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2022 10:42:38 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 11 Jul 2022 10:42:37 -0700
Received: from [10.38.245.206] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 11 Jul
 2022 10:42:34 -0700
Message-ID: <fb38d3c0-6c37-a4aa-60a0-e94d144a996f@quicinc.com>
Date:   Mon, 11 Jul 2022 10:42:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 2/4] drm/msm/dsi: fetch DSC pps payload from struct
 mipi_dsi_device
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, "Vinod Koul" <vkoul@kernel.org>
References: <20220711094320.368062-1-dmitry.baryshkov@linaro.org>
 <20220711094320.368062-3-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220711094320.368062-3-dmitry.baryshkov@linaro.org>
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



On 7/11/2022 2:43 AM, Dmitry Baryshkov wrote:
> Now that struct mipi_dsi_device provides DSC data, fetch it from the
> mentioned struct rather than from the struct drm_panel itself. This
> would allow supporting MIPI DSI bridges handling DSC on their input
> side.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Would prefer to have Vinod's Tested-by on this series once we get all 
the R-bs but other than this change is,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 25 +++++++++++--------------
>   1 file changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index a34078497af1..fb5ab6c718c8 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1686,6 +1686,17 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
>   	msm_host->lanes = dsi->lanes;
>   	msm_host->format = dsi->format;
>   	msm_host->mode_flags = dsi->mode_flags;
> +	if (dsi->dsc) {
> +		struct msm_display_dsc_config *dsc = msm_host->dsc;
> +
> +		if (!dsc) {
> +			dsc = devm_kzalloc(&msm_host->pdev->dev, sizeof(*dsc), GFP_KERNEL);
> +			if (!dsc)
> +				return -ENOMEM;
> +			dsc->drm = dsi->dsc;
> +			msm_host->dsc = dsc;
> +		}
> +	}
>   
>   	/* Some gpios defined in panel DT need to be controlled by host */
>   	ret = dsi_host_init_panel_gpios(msm_host, &dsi->dev);
> @@ -2159,23 +2170,9 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
>   {
>   	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>   	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
> -	struct drm_panel *panel;
>   	int ret;
>   
>   	msm_host->dev = dev;
> -	panel = msm_dsi_host_get_panel(&msm_host->base);
> -
> -	if (!IS_ERR(panel) && panel->dsc) {
> -		struct msm_display_dsc_config *dsc = msm_host->dsc;
> -
> -		if (!dsc) {
> -			dsc = devm_kzalloc(&msm_host->pdev->dev, sizeof(*dsc), GFP_KERNEL);
> -			if (!dsc)
> -				return -ENOMEM;
> -			dsc->drm = panel->dsc;
> -			msm_host->dsc = dsc;
> -		}
> -	}
>   
>   	ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
>   	if (ret) {
