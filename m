Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 636035256C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 May 2022 22:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358560AbiELU7G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 May 2022 16:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358554AbiELU7F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 May 2022 16:59:05 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99A1027BC56
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 13:59:03 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id d15so11213011lfk.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 13:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+QzGJTvCvX/Tp+rKIYyLc9ObXbm26PwN+ZPeeu5sbv8=;
        b=F/PZNisIZWAXwRg66sgt2TnzUNMrHlKMf9QBjNVbNSzou/e3RFLvySuHID2qefJ8Kx
         Mc1faerfTJpyTNYejLm4Q3gdMcKl0wKSfdVprabvrsTDVqOmGZVfGUAFNwGMmb1NJ0fG
         nr/EbgkzTuabVCRO/9mF6//63TjJtddzo/f6dbNrIsVU0x6zIwyFlXGWSEIL1fJerpwf
         V0sUqCsdJhNdaktWHgm+/dNrRxssTS8YqROM/eMi77Ifmg57o4iX8bkg6D6ymAP2smK5
         HJ+yVF/N2dwdGhVjxSloraxEPfX/Z+URDEaahNJFtPjmQXixzc3rOFffDOkudIESCLV3
         FeIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+QzGJTvCvX/Tp+rKIYyLc9ObXbm26PwN+ZPeeu5sbv8=;
        b=mwoirjDSGf8uzVAHMW0z5i0iwifjfvtppzosCMP5Lc/+dNHtgrse5sdXKfrAN/LBNp
         preOYGhZABvkMWgoWs08UJSba+t9we/clP0dcaabLy1fvBoYTGw17kXc5H6MEm730ZX1
         HISk9c1iHKYx1hhqcX1QD7lrhANvzvOeGeJTRJAyzSgIk18fZQk0c9EeIkWccAS4khxA
         +NwV+8Zj22gvrd6YU5BFLdcEOlILwcp7aXBPjHf0LCgd6tJxZZuNbOTIuRW+d00xwz//
         261MNGj8WBK/RX8RIq84nT3Bs90VGaGo1f3Yr6Qz8bSSrdLOQHxiuXR2crOt+apeJl4F
         O4gg==
X-Gm-Message-State: AOAM531uMaqWD2CcdsKO+r+tk5t/Wgr802fl6oE9dCnr6sJqx5VDVYK9
        OBD1bbPibQ04+eEjfQzmVdDqkw==
X-Google-Smtp-Source: ABdhPJxY3vfl5CmuGdfluIk7eDh4d454OFIFjElvC9u6pF71RXntAwwzhyEQi/MvSrdXhDzrB0duwQ==
X-Received: by 2002:a05:6512:321c:b0:46b:b7fd:1eca with SMTP id d28-20020a056512321c00b0046bb7fd1ecamr1123052lfe.481.1652389141810;
        Thu, 12 May 2022 13:59:01 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c13-20020a2ebf0d000000b0025052e35be2sm85333ljr.130.2022.05.12.13.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 13:59:01 -0700 (PDT)
Message-ID: <e8d75148-22ee-5809-fc65-d0fb38ad4876@linaro.org>
Date:   Thu, 12 May 2022 23:58:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3] drm/msm/dsi: only powerup at modeset time if
 "early_poweron" modparam
Content-Language: en-GB
To:     Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220512135134.v3.1.Ia196e35ad985059e77b038a41662faae9e26f411@changeid>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220512135134.v3.1.Ia196e35ad985059e77b038a41662faae9e26f411@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/05/2022 23:52, Douglas Anderson wrote:
> Commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
> time") caused sc7180 Chromebooks that use the parade-ps8640 bridge
> chip to fail to turn the display back on after it turns off.
> 
> Unfortunately, it doesn't look easy to fix the parade-ps8640 driver to
> handle the new power sequence. The Linux driver has almost nothing in
> it and most of the logic for this bridge chip is in black-box firmware
> that the bridge chip uses.
> 
> Also unfortunately, reverting the patch will break "tc358762".
> 
> The long term solution here is probably Dave Stevenson's series [1]
> that would give more flexibility. However, that is likely not a quick
> fix.
> 
> For the short term, let's introduce a module parameter that selects
> between the two behaviors. This is a short term hack but at least can
> keep both users working. We'll default the value of the module
> parameter to the old behavior. Given that the old behavior has existed
> for longer it's probably a safer default.
> 
> [1] https://lore.kernel.org/r/cover.1646406653.git.dave.stevenson@raspberrypi.com
> 
> Fixes: 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset time")
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Two minor issues below.

> ---
> 
> Changes in v3:
> - No longer a revert; now a module parameter.
> 
> Changes in v2:
> - Remove the mud from my face.
> 
>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 50b987658b1f..2bf4123ef5df 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -34,6 +34,10 @@ static struct msm_dsi_manager msm_dsim_glb;
>   #define IS_SYNC_NEEDED()	(msm_dsim_glb.is_sync_needed)
>   #define IS_MASTER_DSI_LINK(id)	(msm_dsim_glb.master_dsi_link_id == id)
>   
> +bool early_poweron;
> +MODULE_PARM_DESC(early_poweron, "Power DSI controller early");
> +module_param(early_poweron, bool, 0600);

Nit: dsi_early_poweron (to be clear that it related to DSI only).

I thought about suggesting 'dsi_no_early_poweron' instead to catch 
possible issues with other bridges. But... I think with Dave's series 
will have to enable bridges one by one, so it doesn't make real sense.

> +
>   static inline struct msm_dsi *dsi_mgr_get_dsi(int id)
>   {
>   	return msm_dsim_glb.dsi[id];
> @@ -389,6 +393,9 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>   	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
>   		return;
>   
> +	if (!early_poweron)
> +		dsi_mgr_bridge_power_on(bridge);
> +
>   	/* Always call panel functions once, because even for dual panels,
>   	 * there is only one drm_panel instance.
>   	 */
> @@ -570,7 +577,8 @@ static void dsi_mgr_bridge_mode_set(struct drm_bridge *bridge,
>   	if (is_bonded_dsi && other_dsi)
>   		msm_dsi_host_set_display_mode(other_dsi->host, adjusted_mode);
>   
> -	dsi_mgr_bridge_power_on(bridge);
> +	if (early_poweron)
> +		dsi_mgr_bridge_power_on(bridge);
>   }
>   
>   static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,


-- 
With best wishes
Dmitry
