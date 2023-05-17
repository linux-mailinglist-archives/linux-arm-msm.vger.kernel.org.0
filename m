Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0D59705CC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 May 2023 04:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbjEQCEI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 22:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231704AbjEQCEH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 22:04:07 -0400
X-Greylist: delayed 330 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 16 May 2023 19:04:04 PDT
Received: from 189.cn (ptr.189.cn [183.61.185.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4538E4222;
        Tue, 16 May 2023 19:04:04 -0700 (PDT)
HMM_SOURCE_IP: 10.64.8.31:42626.2114773713
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
        by 189.cn (HERMES) with SMTP id 7D6F9102973;
        Wed, 17 May 2023 09:58:31 +0800 (CST)
Received: from  ([114.242.206.180])
        by gateway-151646-dep-75648544bd-2qvwx with ESMTP id 810a8ff56b7f48219248832b0e786209 for tzimmermann@suse.de;
        Wed, 17 May 2023 09:58:33 CST
X-Transaction-ID: 810a8ff56b7f48219248832b0e786209
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Sender: 15330273260@189.cn
Message-ID: <80b4b615-0a71-89e8-3a58-fbeb8a9a06e8@189.cn>
Date:   Wed, 17 May 2023 09:58:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [v2,11/12] drm/fbdev-generic: Implement dedicated fbdev I/O
 helpers
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        airlied@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, javierm@redhat.com, sam@ravnborg.org
Cc:     linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
References: <20230515094033.2133-12-tzimmermann@suse.de>
Content-Language: en-US
From:   Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230515094033.2133-12-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FROM_LOCAL_DIGITS,
        FROM_LOCAL_HEX,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi, Thomas


After apply your patch set, the kernel with 
arch/loongarch/configs/loongson3_defconfig

can not finish compile anymore.  gcc complains:


   AR      drivers/gpu/built-in.a
   AR      drivers/built-in.a
   AR      built-in.a
   AR      vmlinux.a
   LD      vmlinux.o
   OBJCOPY modules.builtin.modinfo
   GEN     modules.builtin
   GEN     .vmlinux.objs
   MODPOST Module.symvers
ERROR: modpost: "fb_sys_write" [drivers/gpu/drm/drm_kms_helper.ko] 
undefined!
ERROR: modpost: "sys_imageblit" [drivers/gpu/drm/drm_kms_helper.ko] 
undefined!
ERROR: modpost: "sys_fillrect" [drivers/gpu/drm/drm_kms_helper.ko] 
undefined!
ERROR: modpost: "sys_copyarea" [drivers/gpu/drm/drm_kms_helper.ko] 
undefined!
ERROR: modpost: "fb_sys_read" [drivers/gpu/drm/drm_kms_helper.ko] undefined!
make[1]: *** [scripts/Makefile.modpost:136: Module.symvers] Error 1
make: *** [Makefile:1978: modpost] Error 2


On 2023/5/15 17:40, Thomas Zimmermann wrote:
> Implement dedicated fbdev helpers for framebuffer I/O instead
> of using DRM's helpers. Fbdev-generic was the only caller of the
> DRM helpers, so remove them from the helper module.
>
> v2:
> 	* use FB_SYS_HELPERS_DEFERRED option
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/Kconfig             |   6 +-
>   drivers/gpu/drm/drm_fb_helper.c     | 107 ----------------------------
>   drivers/gpu/drm/drm_fbdev_generic.c |  47 ++++++++++--
>   include/drm/drm_fb_helper.h         |  41 -----------
>   4 files changed, 43 insertions(+), 158 deletions(-)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 77fb10ddd8a2..92a782827b7b 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -95,6 +95,7 @@ config DRM_KUNIT_TEST
>   config DRM_KMS_HELPER
>   	tristate
>   	depends on DRM
> +	select FB_SYS_HELPERS_DEFERRED if DRM_FBDEV_EMULATION

Here, select FB_SYS_HELPERS helps resolve the above issue mentioned.

>   	help
>   	  CRTC helpers for KMS drivers.
>   
> @@ -135,11 +136,6 @@ config DRM_FBDEV_EMULATION
>   	select FB_CFB_FILLRECT
>   	select FB_CFB_COPYAREA
>   	select FB_CFB_IMAGEBLIT
> -	select FB_DEFERRED_IO
> -	select FB_SYS_FOPS
> -	select FB_SYS_FILLRECT
> -	select FB_SYS_COPYAREA
> -	select FB_SYS_IMAGEBLIT
>   	select FRAMEBUFFER_CONSOLE if !EXPERT
>   	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
>   	default y
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 8724e08c518b..ba0a808f14ee 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -729,113 +729,6 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
>   }
>   EXPORT_SYMBOL(drm_fb_helper_deferred_io);
>   
> -/**
> - * drm_fb_helper_sys_read - Implements struct &fb_ops.fb_read for system memory
> - * @info: fb_info struct pointer
> - * @buf: userspace buffer to read from framebuffer memory
> - * @count: number of bytes to read from framebuffer memory
> - * @ppos: read offset within framebuffer memory
> - *
> - * Returns:
> - * The number of bytes read on success, or an error code otherwise.
> - */
> -ssize_t drm_fb_helper_sys_read(struct fb_info *info, char __user *buf,
> -			       size_t count, loff_t *ppos)
> -{
> -	return fb_sys_read(info, buf, count, ppos);
> -}
> -EXPORT_SYMBOL(drm_fb_helper_sys_read);
> -
> -/**
> - * drm_fb_helper_sys_write - Implements struct &fb_ops.fb_write for system memory
> - * @info: fb_info struct pointer
> - * @buf: userspace buffer to write to framebuffer memory
> - * @count: number of bytes to write to framebuffer memory
> - * @ppos: write offset within framebuffer memory
> - *
> - * Returns:
> - * The number of bytes written on success, or an error code otherwise.
> - */
> -ssize_t drm_fb_helper_sys_write(struct fb_info *info, const char __user *buf,
> -				size_t count, loff_t *ppos)
> -{
> -	struct drm_fb_helper *helper = info->par;
> -	loff_t pos = *ppos;
> -	ssize_t ret;
> -	struct drm_rect damage_area;
> -
> -	ret = fb_sys_write(info, buf, count, ppos);
> -	if (ret <= 0)
> -		return ret;
> -
> -	if (helper->funcs->fb_dirty) {
> -		drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
> -		drm_fb_helper_damage(helper, damage_area.x1, damage_area.y1,
> -				     drm_rect_width(&damage_area),
> -				     drm_rect_height(&damage_area));
> -	}
> -
> -	return ret;
> -}
> -EXPORT_SYMBOL(drm_fb_helper_sys_write);
> -
> -/**
> - * drm_fb_helper_sys_fillrect - wrapper around sys_fillrect
> - * @info: fbdev registered by the helper
> - * @rect: info about rectangle to fill
> - *
> - * A wrapper around sys_fillrect implemented by fbdev core
> - */
> -void drm_fb_helper_sys_fillrect(struct fb_info *info,
> -				const struct fb_fillrect *rect)
> -{
> -	struct drm_fb_helper *helper = info->par;
> -
> -	sys_fillrect(info, rect);
> -
> -	if (helper->funcs->fb_dirty)
> -		drm_fb_helper_damage(helper, rect->dx, rect->dy, rect->width, rect->height);
> -}
> -EXPORT_SYMBOL(drm_fb_helper_sys_fillrect);
> -
> -/**
> - * drm_fb_helper_sys_copyarea - wrapper around sys_copyarea
> - * @info: fbdev registered by the helper
> - * @area: info about area to copy
> - *
> - * A wrapper around sys_copyarea implemented by fbdev core
> - */
> -void drm_fb_helper_sys_copyarea(struct fb_info *info,
> -				const struct fb_copyarea *area)
> -{
> -	struct drm_fb_helper *helper = info->par;
> -
> -	sys_copyarea(info, area);
> -
> -	if (helper->funcs->fb_dirty)
> -		drm_fb_helper_damage(helper, area->dx, area->dy, area->width, area->height);
> -}
> -EXPORT_SYMBOL(drm_fb_helper_sys_copyarea);
> -
> -/**
> - * drm_fb_helper_sys_imageblit - wrapper around sys_imageblit
> - * @info: fbdev registered by the helper
> - * @image: info about image to blit
> - *
> - * A wrapper around sys_imageblit implemented by fbdev core
> - */
> -void drm_fb_helper_sys_imageblit(struct fb_info *info,
> -				 const struct fb_image *image)
> -{
> -	struct drm_fb_helper *helper = info->par;
> -
> -	sys_imageblit(info, image);
> -
> -	if (helper->funcs->fb_dirty)
> -		drm_fb_helper_damage(helper, image->dx, image->dy, image->width, image->height);
> -}
> -EXPORT_SYMBOL(drm_fb_helper_sys_imageblit);
> -
>   /**
>    * drm_fb_helper_cfb_read - Implements struct &fb_ops.fb_read for I/O memory
>    * @info: fb_info struct pointer
> diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
> index 8e5148bf40bb..f53fc49e34a4 100644
> --- a/drivers/gpu/drm/drm_fbdev_generic.c
> +++ b/drivers/gpu/drm/drm_fbdev_generic.c
> @@ -34,6 +34,43 @@ static int drm_fbdev_generic_fb_release(struct fb_info *info, int user)
>   	return 0;
>   }
>   
> +static ssize_t drm_fbdev_generic_fb_write(struct fb_info *info, const char __user *buf,
> +					  size_t count, loff_t *ppos)
> +{
> +	struct drm_fb_helper *helper = info->par;
> +	loff_t pos = *ppos;
> +	ssize_t ret;
> +
> +	ret = fb_sys_write(info, buf, count, ppos);
> +	if (ret > 0)
> +		drm_fb_helper_damage_range(helper, pos, ret);
> +	return ret;
> +}
> +
> +static void drm_fbdev_generic_fb_fillrect(struct fb_info *info, const struct fb_fillrect *rect)
> +{
> +	struct drm_fb_helper *helper = info->par;
> +
> +	sys_fillrect(info, rect);
> +	drm_fb_helper_damage(helper, rect->dx, rect->dy, rect->width, rect->height);
> +}
> +
> +static void drm_fbdev_generic_fb_copyarea(struct fb_info *info, const struct fb_copyarea *area)
> +{
> +	struct drm_fb_helper *helper = info->par;
> +
> +	sys_copyarea(info, area);
> +	drm_fb_helper_damage(helper, area->dx, area->dy, area->width, area->height);
> +}
> +
> +static void drm_fbdev_generic_fb_imageblit(struct fb_info *info, const struct fb_image *image)
> +{
> +	struct drm_fb_helper *helper = info->par;
> +
> +	sys_imageblit(info, image);
> +	drm_fb_helper_damage(helper, image->dx, image->dy, image->width, image->height);
> +}
> +
>   static void drm_fbdev_generic_fb_destroy(struct fb_info *info)
>   {
>   	struct drm_fb_helper *fb_helper = info->par;
> @@ -56,12 +93,12 @@ static const struct fb_ops drm_fbdev_generic_fb_ops = {
>   	.owner		= THIS_MODULE,
>   	.fb_open	= drm_fbdev_generic_fb_open,
>   	.fb_release	= drm_fbdev_generic_fb_release,
> -	.fb_read	= drm_fb_helper_sys_read,
> -	.fb_write	= drm_fb_helper_sys_write,
> +	.fb_read	= fb_sys_read,
> +	.fb_write	= drm_fbdev_generic_fb_write,
>   	DRM_FB_HELPER_DEFAULT_OPS,
> -	.fb_fillrect	= drm_fb_helper_sys_fillrect,
> -	.fb_copyarea	= drm_fb_helper_sys_copyarea,
> -	.fb_imageblit	= drm_fb_helper_sys_imageblit,
> +	.fb_fillrect	= drm_fbdev_generic_fb_fillrect,
> +	.fb_copyarea	= drm_fbdev_generic_fb_copyarea,
> +	.fb_imageblit	= drm_fbdev_generic_fb_imageblit,
>   	.fb_mmap	= fb_deferred_io_mmap,
>   	.fb_destroy	= drm_fbdev_generic_fb_destroy,
>   };
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index 80c402f4e379..e3240d749a43 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -259,18 +259,6 @@ void drm_fb_helper_damage_range(struct drm_fb_helper *helper, off_t off, size_t
>   
>   void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagereflist);
>   
> -ssize_t drm_fb_helper_sys_read(struct fb_info *info, char __user *buf,
> -			       size_t count, loff_t *ppos);
> -ssize_t drm_fb_helper_sys_write(struct fb_info *info, const char __user *buf,
> -				size_t count, loff_t *ppos);
> -
> -void drm_fb_helper_sys_fillrect(struct fb_info *info,
> -				const struct fb_fillrect *rect);
> -void drm_fb_helper_sys_copyarea(struct fb_info *info,
> -				const struct fb_copyarea *area);
> -void drm_fb_helper_sys_imageblit(struct fb_info *info,
> -				 const struct fb_image *image);
> -
>   ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
>   			       size_t count, loff_t *ppos);
>   ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
> @@ -398,35 +386,6 @@ static inline int drm_fb_helper_defio_init(struct drm_fb_helper *fb_helper)
>   	return -ENODEV;
>   }
>   
> -static inline ssize_t drm_fb_helper_sys_read(struct fb_info *info,
> -					     char __user *buf, size_t count,
> -					     loff_t *ppos)
> -{
> -	return -ENODEV;
> -}
> -
> -static inline ssize_t drm_fb_helper_sys_write(struct fb_info *info,
> -					      const char __user *buf,
> -					      size_t count, loff_t *ppos)
> -{
> -	return -ENODEV;
> -}
> -
> -static inline void drm_fb_helper_sys_fillrect(struct fb_info *info,
> -					      const struct fb_fillrect *rect)
> -{
> -}
> -
> -static inline void drm_fb_helper_sys_copyarea(struct fb_info *info,
> -					      const struct fb_copyarea *area)
> -{
> -}
> -
> -static inline void drm_fb_helper_sys_imageblit(struct fb_info *info,
> -					       const struct fb_image *image)
> -{
> -}
> -
>   static inline ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
>   					     size_t count, loff_t *ppos)
>   {
