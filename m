Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE66A56D0EE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Jul 2022 21:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbiGJTEj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Jul 2022 15:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiGJTEi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Jul 2022 15:04:38 -0400
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AB6BDFB8
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 12:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=W3z8QjY2NDvbGYjUALmDzkecOhbyZDY04ZL/YMcdLsQ=;
        b=SfJNs4yOIV6v/7RLmTLmgPMMpH42DIp+oCh6B7Gro2ynvRWo8cKoqJoFh3o1Ak3DiVeQ5iETK2stn
         16+8Y8GA8el0OKJJR/etDnwNX/NbUqgYyAiWXpL+BqgwWVvcAmzIefNIXnB7oITEn04LYd+5SXBEZt
         KrQukCLoO36Q51eRkf10Ono1G1ih7mnIT3K/D2pIWh/j4zBdw4mwQl77zqmcZhovkPlQ43q6kwzQ1H
         NxTvuxr/0yB1dTc7H0zs3YQkfD6VmG8YrhaX1bETiF/EwlUms5FDKFNX0NYvgDhcD/wdpy3mhPkSFr
         gt4zONdiLdgNFTSKhxV0yOFULyjwZJA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=W3z8QjY2NDvbGYjUALmDzkecOhbyZDY04ZL/YMcdLsQ=;
        b=2Yaowkg52oe7UuWCqGUIf2aI+XxHRdYatqobOzQiTqvQyUVKmzjc1eTn3wJSEQW7R75/+dnn0stgS
         Yjy9pnnAg==
X-HalOne-Cookie: bd4b5f6c7dae9ce210b009c869a79a2c6528271d
X-HalOne-ID: 217c681d-0083-11ed-be7e-d0431ea8bb03
Received: from mailproxy4.cst.dirpod3-cph3.one.com (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
        id 217c681d-0083-11ed-be7e-d0431ea8bb03;
        Sun, 10 Jul 2022 19:04:32 +0000 (UTC)
Date:   Sun, 10 Jul 2022 21:04:30 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>
Subject: Re: [RFC PATCH 1/3] drm/bridge: ti-sn65dsi86: switch to atomic ops
Message-ID: <YssivkHHpKFhw3cr@ravnborg.org>
References: <20220710184536.172705-1-dmitry.baryshkov@linaro.org>
 <20220710184536.172705-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710184536.172705-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLACK autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

On Sun, Jul 10, 2022 at 09:45:34PM +0300, Dmitry Baryshkov wrote:
> Make ti-sn65dsi86 use atomic_enable / atomic_disable / atomic_pre_enable
> / atomic_post_disable rather than their non-atomic versions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

a more or less identical patch was applied to drm-misc-next
the other day.
See d8b599bf625d1d818fdbb322a272fd2a5ea32e38.

	Sam

> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 8cad662de9bb..01171547f638 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -752,7 +752,8 @@ ti_sn_bridge_mode_valid(struct drm_bridge *bridge,
>  	return MODE_OK;
>  }
>  
> -static void ti_sn_bridge_disable(struct drm_bridge *bridge)
> +static void ti_sn_bridge_atomic_disable(struct drm_bridge *bridge,
> +					struct drm_bridge_state *old_bridge_state)
>  {
>  	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>  
> @@ -1011,7 +1012,8 @@ static int ti_sn_link_training(struct ti_sn65dsi86 *pdata, int dp_rate_idx,
>  	return ret;
>  }
>  
> -static void ti_sn_bridge_enable(struct drm_bridge *bridge)
> +static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
> +				       struct drm_bridge_state *old_bridge_state)
>  {
>  	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>  	const char *last_err_str = "No supported DP rate";
> @@ -1080,7 +1082,8 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>  			   VSTREAM_ENABLE);
>  }
>  
> -static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
> +static void ti_sn_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> +					   struct drm_bridge_state *old_bridge_state)
>  {
>  	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>  
> @@ -1093,7 +1096,8 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
>  	usleep_range(100, 110);
>  }
>  
> -static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
> +static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
> +					     struct drm_bridge_state *old_bridge_state)
>  {
>  	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>  
> @@ -1114,10 +1118,10 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>  	.attach = ti_sn_bridge_attach,
>  	.detach = ti_sn_bridge_detach,
>  	.mode_valid = ti_sn_bridge_mode_valid,
> -	.pre_enable = ti_sn_bridge_pre_enable,
> -	.enable = ti_sn_bridge_enable,
> -	.disable = ti_sn_bridge_disable,
> -	.post_disable = ti_sn_bridge_post_disable,
> +	.atomic_pre_enable = ti_sn_bridge_atomic_pre_enable,
> +	.atomic_enable = ti_sn_bridge_atomic_enable,
> +	.atomic_disable = ti_sn_bridge_atomic_disable,
> +	.atomic_post_disable = ti_sn_bridge_atomic_post_disable,
>  };
>  
>  static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
> -- 
> 2.35.1
