Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC6956D15B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Jul 2022 23:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbiGJVYP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Jul 2022 17:24:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiGJVYO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Jul 2022 17:24:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1F5A638B
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 14:24:12 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2B9924F7;
        Sun, 10 Jul 2022 23:24:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657488250;
        bh=TzVKvIMA7E2NoY6B3hNoUQMONOMEeLEAj+rjS7UPfSc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=v8uew0eaokfqgyh15ODJYKomfImlIHDo9cD11UEL0VPj9rzm2vCzvd4vcFlKIurjb
         gutvH7x4N9qzgmkPwiWE94xx1uJFvVxnelQ5SjFspwiVyK+kgdmB5XD3sdD1+yaEVO
         XxHJ6bwK+7oGNFglmG/dhZTVpn+z06iNNjmo9Pqw=
Date:   Mon, 11 Jul 2022 00:23:43 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [RFC PATCH 3/3] drm/bridge: ti-sn65dsi86: support
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Message-ID: <YstDX/7Xguzxrp21@pendragon.ideasonboard.com>
References: <20220710184536.172705-1-dmitry.baryshkov@linaro.org>
 <20220710184536.172705-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220710184536.172705-4-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

Thank you for the patch.

On Sun, Jul 10, 2022 at 09:45:36PM +0300, Dmitry Baryshkov wrote:
> Now as the driver does not depend on pdata->connector, add support for
> attaching the bridge with DRM_BRIDGE_ATTACH_NO_CONNECTOR.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index df08207d6223..9bca4615f71b 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -698,11 +698,6 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>  	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>  	int ret;
>  
> -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> -		DRM_ERROR("Fix bridge driver to make connector optional!");
> -		return -EINVAL;
> -	}
> -
>  	pdata->aux.drm_dev = bridge->dev;
>  	ret = drm_dp_aux_register(&pdata->aux);
>  	if (ret < 0) {
> @@ -710,15 +705,15 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>  		return ret;
>  	}
>  
> -	/* We never want the next bridge to *also* create a connector: */
> -	flags |= DRM_BRIDGE_ATTACH_NO_CONNECTOR;
> -
> -	/* Attach the next bridge */
> +	/* Attach the next bridge, We never want the next bridge to *also* create a connector. */

s/bridge,/bridge./

I also would have wrapped this line.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	ret = drm_bridge_attach(bridge->encoder, pdata->next_bridge,
> -				&pdata->bridge, flags);
> +				&pdata->bridge, flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>  	if (ret < 0)
>  		goto err_initted_aux;
>  
> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> +		return 0;
> +
>  	pdata->connector = drm_bridge_connector_init(pdata->bridge.dev,
>  						     pdata->bridge.encoder);
>  	if (IS_ERR(pdata->connector)) {

-- 
Regards,

Laurent Pinchart
