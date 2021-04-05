Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2703353A69
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Apr 2021 02:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231728AbhDEAug (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Apr 2021 20:50:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231539AbhDEAuf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Apr 2021 20:50:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEDF7C061756;
        Sun,  4 Apr 2021 17:50:28 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9351D40;
        Mon,  5 Apr 2021 02:50:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1617583825;
        bh=gBtmkYGClgERNSI4TslDSDr4bEyMle1yAbKvhAur19s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c4TsRYkjVzzNCstpAvd/2HQnB4iqOyeVvzQRymPS/eRcpxs1kqAkp7WKxS9FWUh37
         f8Ybh1IbYAaS6S9hExP5kCQDa/4Atde89dfhGNTZ3Iep18DxzhUPUSxovZiwoqZxdF
         YHGkEFxDxGqn2EQRbm+g8+UKmSzeg0OO8nHn97tg=
Date:   Mon, 5 Apr 2021 03:49:39 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linus W <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        robdclark@chromium.org, Stephen Boyd <swboyd@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-arm-msm@vger.kernel.org,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/12] drm/bridge: Fix the stop condition of
 drm_bridge_chain_pre_enable()
Message-ID: <YGpeo9LV4uAh1B7u@pendragon.ideasonboard.com>
References: <20210402222846.2461042-1-dianders@chromium.org>
 <20210402152701.v3.1.If62a003f76a2bc4ccc6c53565becc05d2aad4430@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210402152701.v3.1.If62a003f76a2bc4ccc6c53565becc05d2aad4430@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

Thank you for the patch.

On Fri, Apr 02, 2021 at 03:28:35PM -0700, Douglas Anderson wrote:
> The drm_bridge_chain_pre_enable() is not the proper opposite of
> drm_bridge_chain_post_disable(). It continues along the chain to
> _before_ the starting bridge. Let's fix that.
> 
> Fixes: 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked list")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/drm_bridge.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 64f0effb52ac..044acd07c153 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -522,6 +522,9 @@ void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
>  	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
>  		if (iter->funcs->pre_enable)
>  			iter->funcs->pre_enable(iter);
> +
> +		if (iter == bridge)
> +			break;

This looks good as it matches drm_atomic_bridge_chain_disable().

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I'm curious though, given that the bridge passed to the function should
be the one closest to the encoder, does this make a difference ?

>  	}
>  }
>  EXPORT_SYMBOL(drm_bridge_chain_pre_enable);

-- 
Regards,

Laurent Pinchart
