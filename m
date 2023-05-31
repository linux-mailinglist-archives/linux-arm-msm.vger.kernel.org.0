Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06DC07179E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 10:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234855AbjEaIUd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 04:20:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234310AbjEaIUc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 04:20:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8204793;
        Wed, 31 May 2023 01:20:30 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB62D7FC;
        Wed, 31 May 2023 10:20:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685521207;
        bh=EL3RWdaIqfPKhp0EXpVPxPCT9ntFr8tTKWXlYphupWI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=MvSXDrHk7T4BnPJqHjbFiTX+4V0oyXpM4JlCJJT+bzOMxSOycyjTIr/UAfnt1xezv
         qzMGM+1MWvguHV2odb3hKaYoA6dxUihmMViSPeeHPMA04EyWI4cWEcnv/H7riWMXBY
         LXCYZwLPo9seo/aN3CtoiK5GheRzH+ZTTqCtxMHI=
Message-ID: <c4146861-3e8c-7410-4fec-27e7bce7e2de@ideasonboard.com>
Date:   Wed, 31 May 2023 11:20:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 08/13] drm/omapdrm: Use regular fbdev I/O helpers
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        airlied@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, javierm@redhat.com, sam@ravnborg.org,
        suijingfeng@loongson.cn
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20230530150253.22758-1-tzimmermann@suse.de>
 <20230530150253.22758-9-tzimmermann@suse.de>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230530150253.22758-9-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/05/2023 18:02, Thomas Zimmermann wrote:
> Use the regular fbdev helpers for framebuffer I/O instead of DRM's
> helpers. Omapdrm does not use damage handling, so DRM's fbdev helpers
> are mere wrappers around the fbdev code.
> 
> By using fbdev helpers directly within each DRM fbdev emulation,
> we can eventually remove DRM's wrapper functions entirely.
> 
> v4:
> 	* use initializer macros for struct fb_ops
> v2:
> 	* use FB_SYS_HELPERS option
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Tomi Valkeinen <tomba@kernel.org>
> ---
>   drivers/gpu/drm/omapdrm/Kconfig      |  1 +
>   drivers/gpu/drm/omapdrm/omap_fbdev.c | 11 +++--------
>   2 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
> index 76ded1568bd0..b4ac76c9f31b 100644
> --- a/drivers/gpu/drm/omapdrm/Kconfig
> +++ b/drivers/gpu/drm/omapdrm/Kconfig
> @@ -4,6 +4,7 @@ config DRM_OMAP
>   	depends on DRM && OF
>   	depends on ARCH_OMAP2PLUS
>   	select DRM_KMS_HELPER
> +	select FB_SYS_HELPERS if DRM_FBDEV_EMULATION
>   	select VIDEOMODE_HELPERS
>   	select HDMI
>   	default n
> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> index b950e93b3846..b7ccce0704a3 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> @@ -4,6 +4,8 @@
>    * Author: Rob Clark <rob@ti.com>
>    */
>   
> +#include <linux/fb.h>
> +
>   #include <drm/drm_drv.h>
>   #include <drm/drm_crtc_helper.h>
>   #include <drm/drm_fb_helper.h>
> @@ -95,20 +97,13 @@ static void omap_fbdev_fb_destroy(struct fb_info *info)
>   
>   static const struct fb_ops omap_fb_ops = {
>   	.owner = THIS_MODULE,
> -
> +	FB_DEFAULT_SYS_OPS,
>   	.fb_check_var	= drm_fb_helper_check_var,
>   	.fb_set_par	= drm_fb_helper_set_par,
>   	.fb_setcmap	= drm_fb_helper_setcmap,
>   	.fb_blank	= drm_fb_helper_blank,
>   	.fb_pan_display = omap_fbdev_pan_display,
>   	.fb_ioctl	= drm_fb_helper_ioctl,
> -
> -	.fb_read = drm_fb_helper_sys_read,
> -	.fb_write = drm_fb_helper_sys_write,
> -	.fb_fillrect = drm_fb_helper_sys_fillrect,
> -	.fb_copyarea = drm_fb_helper_sys_copyarea,
> -	.fb_imageblit = drm_fb_helper_sys_imageblit,
> -
>   	.fb_destroy = omap_fbdev_fb_destroy,
>   };
>   

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

