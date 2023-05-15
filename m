Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01BC1703B1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 19:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244242AbjEOR7g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 13:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244964AbjEOR7A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 13:59:00 -0400
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com (mailrelay3-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:402::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAE4F189BE
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 10:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=kijHQtgxttKSzIe63Sc9ubU86PvOZObb1Y8eH8l4uL8=;
        b=PpeGelvP188K5le4qUEGfdhPvO3yuoJINwJQq7YwU35iPD2OZ2HP5inYrZlu1Ip4nK3uwMdCOcuRK
         HHF6eBV+up8OsVaWWfkceAGpRoUdWxtZZQLDkJOBSpPVGHOfUVs8Mq4yfGzFs3H+jtmAYdPDProQs6
         A8jTiSe+sXpvJvckRNGla1ooORRL1t0dObCWUx2b2AdurQZV0SNIfOXmx8MW7yNFgquGDm5wdGRf24
         UFCS7gc0c47vcS+QrXmqPjSphyVxTm4NnfSDMbOS+g037cjuKr57Vr1TYj2JrEDMwL7M6FrQt8vB8y
         SoqjjqyYr0XQYP5hAaqzUJGD1cB3oaQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=kijHQtgxttKSzIe63Sc9ubU86PvOZObb1Y8eH8l4uL8=;
        b=CEZapi9dJhYo7KuWSzbXL6YvLMoYg8ucSqleLN5Nl2lpxX058eR97ZyOBg1pcBWxDaD8vTJWBfFUb
         MgoQ75eAQ==
X-HalOne-ID: b606303c-f349-11ed-93aa-b90637070a9d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay3 (Halon) with ESMTPSA
        id b606303c-f349-11ed-93aa-b90637070a9d;
        Mon, 15 May 2023 17:55:45 +0000 (UTC)
Date:   Mon, 15 May 2023 19:55:44 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com, linux-samsung-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        Russell King <linux@armlinux.org.uk>,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 02/12] drm/armada: Use regular fbdev I/O helpers
Message-ID: <20230515175544.GB1745913@ravnborg.org>
References: <20230515094033.2133-1-tzimmermann@suse.de>
 <20230515094033.2133-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230515094033.2133-3-tzimmermann@suse.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Thomas,

On Mon, May 15, 2023 at 11:40:23AM +0200, Thomas Zimmermann wrote:
> Use the regular fbdev helpers for framebuffer I/O instead of DRM's
> helpers. Armada does not use damage handling, so DRM's fbdev helpers
> are mere wrappers around the fbdev code.
> 
> By using fbdev helpers directly within each DRM fbdev emulation,
> we can eventually remove DRM's wrapper functions entirely.
> 
> v2:
> 	* use FB_IO_HELPERS option
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Russell King <linux@armlinux.org.uk>
> ---
>  drivers/gpu/drm/armada/Kconfig        | 1 +
>  drivers/gpu/drm/armada/armada_fbdev.c | 9 ++++-----
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/armada/Kconfig b/drivers/gpu/drm/armada/Kconfig
> index f5c66d89ba99..5afade25e217 100644
> --- a/drivers/gpu/drm/armada/Kconfig
> +++ b/drivers/gpu/drm/armada/Kconfig
> @@ -3,6 +3,7 @@ config DRM_ARMADA
>  	tristate "DRM support for Marvell Armada SoCs"
>  	depends on DRM && HAVE_CLK && ARM && MMU
>  	select DRM_KMS_HELPER
> +	select FB_IO_HELPERS if DRM_FBDEV_EMULATION
>  	help
>  	  Support the "LCD" controllers found on the Marvell Armada 510
>  	  devices.  There are two controllers on the device, each controller
> diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
> index 0a5fd1aa86eb..6c3bbaf53569 100644
> --- a/drivers/gpu/drm/armada/armada_fbdev.c
> +++ b/drivers/gpu/drm/armada/armada_fbdev.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <linux/errno.h>
> +#include <linux/fb.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  
> @@ -34,11 +35,9 @@ static void armada_fbdev_fb_destroy(struct fb_info *info)
>  static const struct fb_ops armada_fb_ops = {
>  	.owner		= THIS_MODULE,
>  	DRM_FB_HELPER_DEFAULT_OPS,
> -	.fb_read	= drm_fb_helper_cfb_read,
> -	.fb_write	= drm_fb_helper_cfb_write,
I had expected to see
.fb_read = fb_io_read,

But maybe this only used when using damage handling?

Likewise for drm_fb_helper_cfb_write.

??

> -	.fb_fillrect	= drm_fb_helper_cfb_fillrect,
> -	.fb_copyarea	= drm_fb_helper_cfb_copyarea,
> -	.fb_imageblit	= drm_fb_helper_cfb_imageblit,
> +	.fb_fillrect	= cfb_fillrect,
> +	.fb_copyarea	= cfb_copyarea,
> +	.fb_imageblit	= cfb_imageblit,

This part is as expected.

	Sam

>  	.fb_destroy	= armada_fbdev_fb_destroy,
>  };
>  
> -- 
> 2.40.1
