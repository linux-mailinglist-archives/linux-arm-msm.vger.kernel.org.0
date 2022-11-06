Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99D5D61E026
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Nov 2022 04:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbiKFDV0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Nov 2022 23:21:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiKFDVZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Nov 2022 23:21:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C20064E6;
        Sat,  5 Nov 2022 20:21:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9D19860BBD;
        Sun,  6 Nov 2022 03:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AF56C433C1;
        Sun,  6 Nov 2022 03:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667704883;
        bh=uo16t8cEGzkDl8P1XkrWm8bn7vLJjjVFWx9yFSRAmEY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QOZMCU7J+zakwMcDY0mr3lq6YDNRVoZ4U+dKWVP5TsCbmHQcMEV1Tj9JuYxVJMwph
         fEs+MsDUyZsEoI0QMT2XALe42vqPVZchOOpcdHmiH90Z+cNeT3AfPqojGTxSljzEn7
         kXfIimJ3X2Y+yZcfpe9mbVs8Hs+m/O7BDyNHhr5M9t2aIb8Ef15Mo/Cbf3GgLHHhPC
         6K3t8slaJVhPktG741mzzEoPZMvwzlCAYkRoylmJUDuA0sujxAN3ujEWMw4oDKPKiC
         lfp+x0erd+zFZVzPQYSh/aNrWqGHwkGaGdBesDWQeaP5zjsuEBCt6GVQcP2ptnJflw
         y3sDEz4g+gbFQ==
Date:   Sat, 5 Nov 2022 22:21:20 -0500
From:   Bjorn Andersson <andersson@kernel.org>
To:     Nia Espera <a5b6@riseup.net>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH v3 2/2] drivers: gpu: drm: remove support for sofef00
 driver on s6e3fc2x01 panel
Message-ID: <20221106032120.44qxxjdy57e7sqbx@builder.lan>
References: <20221008131201.540185-1-a5b6@riseup.net>
 <20221008131201.540185-3-a5b6@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221008131201.540185-3-a5b6@riseup.net>
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Oct 08, 2022 at 03:12:03PM +0200, Nia Espera wrote:

Same comment as on patch 1 regarding $subject prefix.

> Removes functionality from sofef00 panel driver which allowed it to
> drive the s6e3fc2x01 panel
> 

This states what the removed code relates to, but not why you're doing
it.

> Signed-off-by: Nia Espera <a5b6@riseup.net>
> Reviewed-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |  6 +++---
>  drivers/gpu/drm/panel/panel-samsung-sofef00.c | 18 ------------------
>  2 files changed, 3 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 0dd5e1ec5644..1addbd7e4790 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -547,16 +547,16 @@ config DRM_PANEL_SAMSUNG_S6E8AA0
>  	select VIDEOMODE_HELPERS
>  
>  config DRM_PANEL_SAMSUNG_SOFEF00
> -	tristate "Samsung sofef00/s6e3fc2x01 OnePlus 6/6T DSI cmd mode panels"
> +	tristate "Samsung sofef00 OnePlus 6 DSI cmd mode panel"
>  	depends on OF
>  	depends on DRM_MIPI_DSI
>  	depends on BACKLIGHT_CLASS_DEVICE
>  	select VIDEOMODE_HELPERS
>  	help
>  	  Say Y or M here if you want to enable support for the Samsung AMOLED
> -	  command mode panels found in the OnePlus 6/6T smartphones.
> +	  command mode panel found in the OnePlus 6 smartphone.
>  
> -	  The panels are 2280x1080@60Hz and 2340x1080@60Hz respectively
> +	  The panel is 2280x1080@60Hz
>  
>  config DRM_PANEL_SAMSUNG_S6E3FC2X01
>  	tristate "Samsung s6e3fc2x01 OnePlus 6T DSI cmd mode panel"
> diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
> index bd02af81a4fe..68e58b9b8c5c 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
> @@ -181,20 +181,6 @@ static const struct drm_display_mode enchilada_panel_mode = {
>  	.height_mm = 145,
>  };
>  
> -static const struct drm_display_mode fajita_panel_mode = {
> -	.clock = (1080 + 72 + 16 + 36) * (2340 + 32 + 4 + 18) * 60 / 1000,
> -	.hdisplay = 1080,
> -	.hsync_start = 1080 + 72,
> -	.hsync_end = 1080 + 72 + 16,
> -	.htotal = 1080 + 72 + 16 + 36,
> -	.vdisplay = 2340,
> -	.vsync_start = 2340 + 32,
> -	.vsync_end = 2340 + 32 + 4,
> -	.vtotal = 2340 + 32 + 4 + 18,
> -	.width_mm = 68,
> -	.height_mm = 145,
> -};
> -
>  static int sofef00_panel_get_modes(struct drm_panel *panel, struct drm_connector *connector)
>  {
>  	struct drm_display_mode *mode;
> @@ -327,10 +313,6 @@ static const struct of_device_id sofef00_panel_of_match[] = {
>  		.compatible = "samsung,sofef00",
>  		.data = &enchilada_panel_mode,
>  	},
> -	{ // OnePlus 6T / fajita
> -		.compatible = "samsung,s6e3fc2x01",

But keeping this in a separate patch means that for a while we have two
implementations of this compatible. I think it would be prettier to
squash the two patches - and clarify in the commit message why you're
creating an additional driver.

Regards,
Bjorn

> -		.data = &fajita_panel_mode,
> -	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, sofef00_panel_of_match);
> -- 
> 2.38.0
> 
