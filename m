Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51E5F710303
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 May 2023 04:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbjEYCqp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 22:46:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjEYCqo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 22:46:44 -0400
Received: from 189.cn (ptr.189.cn [183.61.185.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 55204119;
        Wed, 24 May 2023 19:46:42 -0700 (PDT)
HMM_SOURCE_IP: 10.64.8.43:46928.396511249
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
        by 189.cn (HERMES) with SMTP id 8581D10019D;
        Thu, 25 May 2023 10:46:38 +0800 (CST)
Received: from  ([114.242.206.180])
        by gateway-151646-dep-75648544bd-7vx9t with ESMTP id 9709e195ba63476a998a9e94ccfb8749 for tzimmermann@suse.de;
        Thu, 25 May 2023 10:46:40 CST
X-Transaction-ID: 9709e195ba63476a998a9e94ccfb8749
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Sender: 15330273260@189.cn
Message-ID: <b07609eb-8093-47c8-2368-8dd9ad7a71cd@189.cn>
Date:   Thu, 25 May 2023 10:46:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [v4,12/13] drm/fbdev-generic: Implement dedicated fbdev I/O
 helpers
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        airlied@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, javierm@redhat.com, sam@ravnborg.org
Cc:     linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
References: <20230524092150.11776-13-tzimmermann@suse.de>
Content-Language: en-US
From:   Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230524092150.11776-13-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FROM_LOCAL_DIGITS,
        FROM_LOCAL_HEX,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>


On 2023/5/24 17:21, Thomas Zimmermann wrote:
> Implement dedicated fbdev helpers for framebuffer I/O instead
> of using DRM's helpers. Use an fbdev generator macro for
> deferred I/O to create the callbacks. Fbdev-generic was the
> only caller of the DRM helpers, so remove them from the helper
> module.
>
> v4:
> 	* generate deferred-I/O helpers
> 	* use initializer macros for fb_ops
> v2:
> 	* use FB_SYS_HELPERS_DEFERRED option
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/Kconfig             |   6 +-
>   drivers/gpu/drm/drm_fb_helper.c     | 107 ----------------------------
>   drivers/gpu/drm/drm_fbdev_generic.c |  11 ++-
>   include/drm/drm_fb_helper.h         |  41 -----------
>   4 files changed, 6 insertions(+), 159 deletions(-)
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
> index cb03099fd2e3..bab6b252f02a 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -736,113 +736,6 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
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
> index 8e5148bf40bb..98ae703848a0 100644
> --- a/drivers/gpu/drm/drm_fbdev_generic.c
> +++ b/drivers/gpu/drm/drm_fbdev_generic.c
> @@ -34,6 +34,10 @@ static int drm_fbdev_generic_fb_release(struct fb_info *info, int user)
>   	return 0;
>   }
>   
> +FB_GEN_DEFAULT_DEFERRED_SYS_OPS(drm_fbdev_generic,
> +				drm_fb_helper_damage_range,
> +				drm_fb_helper_damage_area);
> +
>   static void drm_fbdev_generic_fb_destroy(struct fb_info *info)
>   {
>   	struct drm_fb_helper *fb_helper = info->par;
> @@ -56,13 +60,8 @@ static const struct fb_ops drm_fbdev_generic_fb_ops = {
>   	.owner		= THIS_MODULE,
>   	.fb_open	= drm_fbdev_generic_fb_open,
>   	.fb_release	= drm_fbdev_generic_fb_release,
> -	.fb_read	= drm_fb_helper_sys_read,
> -	.fb_write	= drm_fb_helper_sys_write,
> +	FB_DEFAULT_DEFERRED_OPS(drm_fbdev_generic),
>   	DRM_FB_HELPER_DEFAULT_OPS,
> -	.fb_fillrect	= drm_fb_helper_sys_fillrect,
> -	.fb_copyarea	= drm_fb_helper_sys_copyarea,
> -	.fb_imageblit	= drm_fb_helper_sys_imageblit,
> -	.fb_mmap	= fb_deferred_io_mmap,
>   	.fb_destroy	= drm_fbdev_generic_fb_destroy,
>   };
>   
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index 7d5804882be7..b50fd0c0b713 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -258,18 +258,6 @@ void drm_fb_helper_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u3
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
> @@ -397,35 +385,6 @@ static inline int drm_fb_helper_defio_init(struct drm_fb_helper *fb_helper)
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
