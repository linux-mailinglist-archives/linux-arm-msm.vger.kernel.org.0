Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4990A256A3C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Aug 2020 23:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728445AbgH2VEz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Aug 2020 17:04:55 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:51378 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728273AbgH2VEy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Aug 2020 17:04:54 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 0DF9180487;
        Sat, 29 Aug 2020 23:04:46 +0200 (CEST)
Date:   Sat, 29 Aug 2020 23:04:45 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/bridge: Fix the dsi remote end-points
Message-ID: <20200829210445.GA796939@ravnborg.org>
References: <20200828074251.3788165-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200828074251.3788165-1-vkoul@kernel.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=A5ZCwZeG c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
        a=EgokR_zQcP2_nzH7EWcA:9 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22
        a=AjGcO6oz07-iQ99wixmX:22
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 28, 2020 at 01:12:50PM +0530, Vinod Koul wrote:
> DSI end-points are supposed to be at node 0 and node 1 as per binding.
> So fix this and use node 0 and node 1 for dsi.
> 
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Thanks, applied to drm-misc-next.

	Sam
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index 1009fc4ed4ed..d734d9402c35 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -960,13 +960,13 @@ static const struct drm_bridge_funcs lt9611_bridge_funcs = {
>  static int lt9611_parse_dt(struct device *dev,
>  			   struct lt9611 *lt9611)
>  {
> -	lt9611->dsi0_node = of_graph_get_remote_node(dev->of_node, 1, -1);
> +	lt9611->dsi0_node = of_graph_get_remote_node(dev->of_node, 0, -1);
>  	if (!lt9611->dsi0_node) {
>  		dev_err(lt9611->dev, "failed to get remote node for primary dsi\n");
>  		return -ENODEV;
>  	}
>  
> -	lt9611->dsi1_node = of_graph_get_remote_node(dev->of_node, 2, -1);
> +	lt9611->dsi1_node = of_graph_get_remote_node(dev->of_node, 1, -1);
>  
>  	lt9611->ac_mode = of_property_read_bool(dev->of_node, "lt,ac-mode");
>  
> -- 
> 2.26.2
