Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 681965108C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 21:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347169AbiDZTUC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 15:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345128AbiDZTUB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 15:20:01 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC8B45675F;
        Tue, 26 Apr 2022 12:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1651000613; x=1682536613;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=p2S48UJ81kg1tmJHs4pMqo36+aoLLTEsyi1TLGaToGo=;
  b=X483dY8Pt3+KB4ZFLwYMlgxyO5KuMFTcjuH/H3CDxP8lTRo0/BrCYAa2
   G2poOeKSGGDqng8vn8z2habrBpnKSN/b1eVvLingXB/uezva7vrLCwYqF
   wVv00mI43ewxEaaNyeT+f9OS1SfzUqGb0+4sd4Sxge4lc8jVF5fEFT98g
   M=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 26 Apr 2022 12:16:52 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2022 12:16:51 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 12:16:51 -0700
Received: from [10.111.160.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 26 Apr
 2022 12:16:47 -0700
Message-ID: <fa49384c-76a5-6686-7d4d-cf11f3e98c75@quicinc.com>
Date:   Tue, 26 Apr 2022 12:16:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 2/2] drm/probe-helper: For DP, add 640x480 if all other
 modes are bad
Content-Language: en-US
To:     Douglas Anderson <dianders@chromium.org>,
        <dri-devel@lists.freedesktop.org>
CC:     <dmitry.baryshkov@linaro.org>, <swboyd@chromium.org>,
        <quic_aravindh@quicinc.com>, <robdclark@gmail.com>,
        <quic_khsieh@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <quic_sbillaka@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        <linux-kernel@vger.kernel.org>
References: <20220426114627.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
 <20220426114627.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220426114627.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug

One minor comment below.

But otherwise, looking at this change this should work for us acc to me.

We will test this out with our equipment and then provide R-b.

Thanks

Abhinav
On 4/26/2022 11:46 AM, Douglas Anderson wrote:
> As per Displayport spec section 5.2.1.2 ("Video Timing Format") says
> that all detachable sinks shall support 640x480 @60Hz as a fail safe
> mode.
> 
> A DP compliance test expected us to utilize the above fact when all
> modes it presented to the DP source were not achievable. It presented
> only modes that would be achievable with more lanes and/or higher
> speeds than we had available and expected that when we couldn't do
> that then we'd fall back to 640x480 even though it didn't advertise
> this size.
> 
> In order to pass the compliance test (and also support any users who
> might fall into a similar situation with their display), we need to
> add 640x480 into the list of modes. However, we don't want to add
> 640x480 all the time. Despite the fact that the DP spec says all sinks
> _shall support_ 640x480, they're not guaranteed to support it
> _well_. Continuing to read the spec you can see that the display is
> not required to really treat 640x480 equal to all the other modes. It
> doesn't need to scale or anything--just display the pixels somehow for
> failsafe purposes. It should also be noted that it's not hard to find
> a display hooked up via DisplayPort that _doesn't_ support 640x480 at
> all. The HP ZR30w screen I'm sitting in front of has a native DP port
> and doesn't work at 640x480. I also plugged in a tiny 800x480 HDMI
> display via a DP to HDMI adapter and that screen definitely doesn't
> support 640x480.
> 
> As a compromise solution, let's only add the 640x480 mode if:
> * We're on DP.
> * All other modes have been pruned.
> 
> This acknowledges that 640x480 might not be the best mode to use but,
> since sinks are _supposed_ to support it, we will at least fall back
> to it if there's nothing else.
> 
> Note that we _don't_ add higher resolution modes like 1024x768 in this
> case. We only add those modes for a failed EDID read where we have no
> idea what's going on. In the case where we've pruned all modes then
> instead we only want 640x480 which is the only defined "Fail Safe"
> resolution.
> 
> This patch originated in response to Kuogee Hsieh's patch [1].
> 
> [1] https://lore.kernel.org/r/1650671124-14030-1-git-send-email-quic_khsieh@quicinc.com
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>   drivers/gpu/drm/drm_probe_helper.c | 26 +++++++++++++++++++++-----
>   1 file changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 819225629010..90cd46cbfec1 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -476,7 +476,6 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>   	const struct drm_connector_helper_funcs *connector_funcs =
>   		connector->helper_private;
>   	int count = 0, ret;
> -	bool verbose_prune = true;
>   	enum drm_connector_status old_status;
>   	struct drm_modeset_acquire_ctx ctx;
>   
> @@ -556,8 +555,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>   		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] disconnected\n",
>   			connector->base.id, connector->name);
>   		drm_connector_update_edid_property(connector, NULL);
> -		verbose_prune = false;
> -		goto prune;
> +		drm_mode_prune_invalid(dev, &connector->modes, false);
> +		goto exit;
>   	}
>   
>   	count = (*connector_funcs->get_modes)(connector);
> @@ -580,9 +579,26 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>   		}
>   	}
>   
> -prune:
> -	drm_mode_prune_invalid(dev, &connector->modes, verbose_prune);
> +	drm_mode_prune_invalid(dev, &connector->modes, true);
>   
> +	/*
> +	 * Displayport spec section 5.2.1.2 ("Video Timing Format") says that
> +	 * all detachable sinks shall support 640x480 @60Hz as a fail safe
> +	 * mode. If all modes were pruned, perhaps because they need more
> +	 * lanes or a higher pixel clock than available, at least try to add
> +	 * in 640x480.
> +	 */
> +	if (list_empty(&connector->modes) &&
> +	    connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
> +		count = drm_add_modes_noedid(connector, 640, 480);
> +		if (_drm_helper_update_and_validate(connector, maxX, maxY, &ctx)) {
> +			drm_modeset_backoff(&ctx);
> +			goto retry;

Do we need another retry here? This will again repeat everything from
get_modes().
The fact that we are hitting this code is because we have already tried 
that and this is already a second-pass. So I think another retry isnt 
needed?

> +		}
> +		drm_mode_prune_invalid(dev, &connector->modes, true);
> +	}
> +
> +exit:
>   	drm_modeset_drop_locks(&ctx);
>   	drm_modeset_acquire_fini(&ctx);
>   
