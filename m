Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B62E65B207
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jun 2019 23:17:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbfF3VRs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Jun 2019 17:17:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50104 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726811AbfF3VRs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Jun 2019 17:17:48 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C26D255;
        Sun, 30 Jun 2019 23:17:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1561929465;
        bh=qhQR3O5AsGUf/DlkqR0aLfys56Lbc2SRqyc65RdPD1w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q1hoRxI+AArRf6NPjZ0SH5dBwLIj+BUVSB/Qx9IsGPdZjDtqaIErraVoxKLClT5jS
         Mqyuowa1m9tcV7t5KT3FoyywDZ0GvUS9unghvIbocO/3n8tFW4+WKWM1N5sakBRHUf
         l1OTO/TFESLE3cy6OkfyDCEuL3VYaVdtCO4YkO3g=
Date:   Mon, 1 Jul 2019 00:17:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, aarch64-laptops@lists.linaro.org,
        Rob Clark <robdclark@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] drm/bridge: ti-sn65dsi86: use helper to lookup
 panel-id
Message-ID: <20190630211726.GJ7043@pendragon.ideasonboard.com>
References: <20190630203614.5290-1-robdclark@gmail.com>
 <20190630203614.5290-5-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190630203614.5290-5-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

Thank you for the patch.

On Sun, Jun 30, 2019 at 01:36:08PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Use the drm_of_find_panel_id() helper to decide which endpoint to use
> when looking up panel.  This way we can support devices that have
> multiple possible panels, such as the aarch64 laptops.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 2719d9c0864b..56c66a43f1a6 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -790,7 +790,7 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
>  			      const struct i2c_device_id *id)
>  {
>  	struct ti_sn_bridge *pdata;
> -	int ret;
> +	int ret, panel_id;
>  
>  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
>  		DRM_ERROR("device doesn't support I2C\n");
> @@ -811,7 +811,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
>  
>  	pdata->dev = &client->dev;
>  
> -	ret = drm_of_find_panel_or_bridge(pdata->dev->of_node, 1, 0,
> +	panel_id = drm_of_find_panel_id();
> +	ret = drm_of_find_panel_or_bridge(pdata->dev->of_node, 1, panel_id,
>  					  &pdata->panel, NULL);
>  	if (ret) {
>  		DRM_ERROR("could not find any panel node\n");

No, I'm sorry, but that's a no-go. We can't patch every single bridge
driver to support this hack. We need a solution implemented at another
level that will not spread throughout the whole subsystem.

-- 
Regards,

Laurent Pinchart
