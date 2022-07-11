Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B23056FFA9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 13:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbiGKLEA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 07:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229833AbiGKLDe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 07:03:34 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81B248D5F8
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 03:10:44 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id e28so4278012lfj.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 03:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=SHiA2zoxhmxH5O4HA7IkJ4SShTmEKVvUYuQnX9sbxgQ=;
        b=UVpseBylGa0hITXDZB040rsiqxom8ASeH+ECgCf7mpMwjK4WsVJB8+gDiLY/4x+J0V
         MjFezs6PbKJtCVQYVRYPQglt4ixfAjGLp+8x2Hdos5M6BwyYyVy5tRbKfOan0KcYi9kf
         0VlqRfko1lKwYEGI+XIhAT2uTuKDEpllWiU/vSsdWV9wecGgEMFxCsaJwtk4mTGsQN4M
         RWTCjYoEy/WLsY8/aYPb1uWmFBDtS2EFYnCU6Bwicao1H4vlae8gucD5V22dDGY/FFfc
         dx6kXHN4COn3HA488pJSsQyvZjsXk4rHfIknupVl2Q7+3aXeqyZW5E9YEwwLQAjv4fct
         ttvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SHiA2zoxhmxH5O4HA7IkJ4SShTmEKVvUYuQnX9sbxgQ=;
        b=Bh+HOIcrmC0jAU+47DRE8VjFPa6u1sUOC9/CjIv8ZBWuUrTXek3Plt76RTzBNlEk6Y
         scmZi9c9lR25UTXuk9NMsgVzPz2uDX3jAcWNstN+Ad/kUGWFxJs4zZXwDCSswtYmOpFx
         CUa620Zoe5dCmPYANIb2RJrvsiFsyrGv3TSGuaAw5FX71dqVRIGYDPRLnRnAMvJI+nUG
         8ubi3DLwiAN0XwFeb5/aPiAzC8ijRQYVmcuXL1ooxDh96MUCuVlQ7uQ6BLNNLD2pJYkS
         5RovS2wUprPoFYcR4HG0ZM615UUkL5TqIlNuCYi+jCZkX7h5Ee3RnksJ5qjDF/Wd2yzV
         kpBQ==
X-Gm-Message-State: AJIora97kAPjDLEaqSef2agVCskOwYtczafJg3J0bNAXNu1lhKTUV1n8
        e9q5xaDsncDcVVICeRr+RrFcjQ==
X-Google-Smtp-Source: AGRyM1sMIZrBCfuR2GgVaiokY29EPmxjq8AEeJPvueXNdz57OF52ijRyoaPnnaz4w4NoN30xVsg4PA==
X-Received: by 2002:ac2:4c50:0:b0:489:da2c:ba2c with SMTP id o16-20020ac24c50000000b00489da2cba2cmr4084907lfk.505.1657534242274;
        Mon, 11 Jul 2022 03:10:42 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l26-20020a2e909a000000b0025d4d4b4edbsm1650138ljg.34.2022.07.11.03.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 03:10:41 -0700 (PDT)
Message-ID: <f5025278-884a-273b-15fd-624e571026bb@linaro.org>
Date:   Mon, 11 Jul 2022 13:10:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 03/10] drm/msm/dp: use atomic callbacks for DP bridge
 ops
Content-Language: en-GB
To:     Vinod Polimera <quic_vpolimer@quicinc.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, swboyd@chromium.org,
        quic_kalyant@quicinc.com, quic_khsieh@quicinc.com,
        quic_vproddut@quicinc.com, bjorn.andersson@linaro.org,
        quic_aravindh@quicinc.com, quic_abhinavk@quicinc.com,
        quic_sbillaka@quicinc.com
References: <1657532880-12897-1-git-send-email-quic_vpolimer@quicinc.com>
 <1657532880-12897-4-git-send-email-quic_vpolimer@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1657532880-12897-4-git-send-email-quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/07/2022 12:47, Vinod Polimera wrote:
> Use atomic variants for DP bridge callback functions so that
> the atomic state can be accessed in the interface drivers.
> The atomic state will help the driver find out if the display
> is in self refresh state.
> 
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c |  9 ++++++---
>   drivers/gpu/drm/msm/dp/dp_drm.c     | 18 +++++++++++-------
>   2 files changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index bce7793..5bd6677 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1652,7 +1652,8 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>   	return 0;
>   }
>   
> -void dp_bridge_enable(struct drm_bridge *drm_bridge)
> +void dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
> +			     struct drm_bridge_state *old_bridge_state)
>   {
>   	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
>   	struct msm_dp *dp = dp_bridge->dp_display;
> @@ -1716,7 +1717,8 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
>   	mutex_unlock(&dp_display->event_mutex);
>   }
>   
> -void dp_bridge_disable(struct drm_bridge *drm_bridge)
> +void dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
> +			      struct drm_bridge_state *old_bridge_state)
>   {
>   	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
>   	struct msm_dp *dp = dp_bridge->dp_display;
> @@ -1727,7 +1729,8 @@ void dp_bridge_disable(struct drm_bridge *drm_bridge)
>   	dp_ctrl_push_idle(dp_display->ctrl);
>   }
>   
> -void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
> +void dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
> +				   struct drm_bridge_state *old_bridge_state)
>   {
>   	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
>   	struct msm_dp *dp = dp_bridge->dp_display;
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 62d58b9..9d0fc74 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -61,13 +61,17 @@ static int dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *
>   }
>   
>   static const struct drm_bridge_funcs dp_bridge_ops = {
> -	.enable       = dp_bridge_enable,
> -	.disable      = dp_bridge_disable,
> -	.post_disable = dp_bridge_post_disable,
> -	.mode_set     = dp_bridge_mode_set,
> -	.mode_valid   = dp_bridge_mode_valid,
> -	.get_modes    = dp_bridge_get_modes,
> -	.detect       = dp_bridge_detect,
> +	.atomic_enable = dp_bridge_atomic_enable,
> +	.atomic_disable = dp_bridge_atomic_disable,
> +	.atomic_post_disable = dp_bridge_atomic_post_disable,
> +	.mode_set = dp_bridge_mode_set,
> +	.mode_valid = dp_bridge_mode_valid,
> +	.get_modes = dp_bridge_get_modes,
> +	.detect = dp_bridge_detect,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_check = edp_bridge_atomic_check,

This function does not exist (yet). Please move this line to the 
corresponding patch.

>   };
>   
>   struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,


-- 
With best wishes
Dmitry
