Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD9548C9FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jan 2022 18:41:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244311AbiALRlN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jan 2022 12:41:13 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:6571 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244308AbiALRlF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jan 2022 12:41:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1642009265; x=1673545265;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9wwX9W3Y2aINXITJTwNgPpfrXjM13u7PMM/QdJMZF6M=;
  b=etwbaCG2fvusM61PBl2ObZuIwCWrdz4sI5ly5AUjnvr1cv4NNq3VwcBk
   P7KumnN/K9cTldA7XK94HscrowdOJlELES+sfHyFWGHYT2Y5LRGNw3fbW
   O81UGPmS4NV0AJ8KhEf8YoKHh2xTYUcTy/7g2WGmJLEAVUYkbQXqtY9nR
   s=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 12 Jan 2022 09:41:03 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 09:41:03 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 12 Jan 2022 09:41:03 -0800
Received: from [10.110.25.55] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Wed, 12 Jan
 2022 09:41:02 -0800
Message-ID: <383271c1-d815-e26c-02f1-2a8d722166d3@quicinc.com>
Date:   Wed, 12 Jan 2022 09:41:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH 1/7] drm/msm/dp: fix panel bridge attachment
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
 <20220107020132.587811-2-dmitry.baryshkov@linaro.org>
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20220107020132.587811-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 1/6/2022 6:01 PM, Dmitry Baryshkov wrote:
> In commit 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
> enable and disable") the DP driver received a drm_bridge instance, which
> is always attached to the encoder as a root bridge. However it conflicts
> with the panel_bridge support for eDP panels. Change panel_bridge
> attachment to come after dp_bridge attachment.
>
> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_drm.c | 21 +++++++++++----------
>   1 file changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index d4d360d19eba..26ef41a4c1b6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -169,16 +169,6 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
>   
>   	drm_connector_attach_encoder(connector, dp_display->encoder);
>   
> -	if (dp_display->panel_bridge) {
> -		ret = drm_bridge_attach(dp_display->encoder,
> -					dp_display->panel_bridge, NULL,
> -					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> -		if (ret < 0) {
> -			DRM_ERROR("failed to attach panel bridge: %d\n", ret);
> -			return ERR_PTR(ret);
> -		}
> -	}
> -
>   	return connector;
>   }
>   
> @@ -246,5 +236,16 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
>   		return ERR_PTR(rc);
>   	}
>   

can check connector_type here and if connector_type == 
DRM_MODE_CONNECTOR_eDP then no drm_bridge  add to eDP?  So that eDP only 
has panel_bridge and DP only has drm_bridge?

is this fix all your concerns?


> +	if (dp_display->panel_bridge) {
> +		rc = drm_bridge_attach(dp_display->encoder,
> +					dp_display->panel_bridge, bridge,
> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +		if (rc < 0) {
> +			DRM_ERROR("failed to attach panel bridge: %d\n", rc);
> +			drm_bridge_remove(bridge);
> +			return ERR_PTR(rc);
> +		}
> +	}
> +
>   	return bridge;
>   }
