Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0711C72FC6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 13:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241042AbjFNLaF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 07:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244052AbjFNL34 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 07:29:56 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1074119B5;
        Wed, 14 Jun 2023 04:29:54 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f62b552751so8371566e87.3;
        Wed, 14 Jun 2023 04:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686742192; x=1689334192;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q/7I47zyCqB6kKEoO0RSLVUlfmCOuGYcUDxHa82mWc8=;
        b=f7qA81G63kL7Kvv1mc76MrGbpAvnPJG5dDhl4IQVCOUQhqaPrE/2Jux3+5NiQITnGo
         8az+lX8hBDP2LY3NkJ8wuuKOutddg3yfLO7How1xZAkUAq4gh6lT1hyvc61Df3tZDHs3
         PkO+M5xrZ82jUmIOpHBw3ZrJ02cfz82/CD6E9fhpxlslpyEJ++1xouJxkbuBzhCTCS+Z
         XG8Boj8bIDKp7yT3PWEPnK7qB5Ti1DEDnjURd55zedsM/sSoUcB61JIc64wMIGl/PElv
         RSweyuEf38k/eZcG7lBGEY1T678aHf6mF1hh2TcobjkfCrTNnvXuufZg2UAsokIMJEN5
         nZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686742192; x=1689334192;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/7I47zyCqB6kKEoO0RSLVUlfmCOuGYcUDxHa82mWc8=;
        b=UWC9/7V7bf7PEd9sEhMGksDOkbwwWqHNh1FNiirs3pQ+l2FbmWeZRG2KDcvSb0JmBI
         dM+hoMiLBxi3wQ5gC74s4UIHyuWBQ22NEgo2zOW+IC1N3+nExz/OY6b7gl2cwDDutXik
         3FxO3SV3Wg0afAGDT91Jhi7vxVeqcA89BvRXZb02SLMLZ1AgnmaXl3XOQTIGOSr+Selh
         lpyPeA2MpP/sCgIqHkttq8t4biAdlTolR88aLrPylZFY23sJyR03nWS+7JgrMgdT4pu9
         4Wt/jB28IWiu4lC82bwf9sO+3m239CzcAz8923Zp51nVl2J2C4p2j+ABRF0pyL21ieOJ
         ZJWg==
X-Gm-Message-State: AC+VfDwmnU9+2IyZl9dgdUVFw45mH5/hmV4X46j4ojwJ+od4DTZbj+EV
        UfN6h13Srwm5YZh2PpgEK4A=
X-Google-Smtp-Source: ACHHUZ6EzDtFkY+01GLLd9j6A3HU2CY6mPIxp0m/umgreIXXTh/TmSXWLOjo+d1SdcdO9ZuMiwsqYg==
X-Received: by 2002:ac2:5a0c:0:b0:4f6:2846:b1fb with SMTP id q12-20020ac25a0c000000b004f62846b1fbmr8196019lfn.18.1686742191915;
        Wed, 14 Jun 2023 04:29:51 -0700 (PDT)
Received: from ?IPV6:2a00:e180:15e4:4200:3c54:f73b:1892:7271? ([2a00:e180:15e4:4200:3c54:f73b:1892:7271])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c22d100b003f8044b3436sm16821017wmg.23.2023.06.14.04.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 04:29:51 -0700 (PDT)
Message-ID: <fc5157cc-6f23-a74f-efcc-66bd7e093de7@gmail.com>
Date:   Wed, 14 Jun 2023 13:29:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 02/13] fbdev: Add initializer macros for struct fb_ops
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        airlied@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, javierm@redhat.com, sam@ravnborg.org,
        suijingfeng@loongson.cn
Cc:     linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
References: <20230530150253.22758-1-tzimmermann@suse.de>
 <20230530150253.22758-3-tzimmermann@suse.de>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230530150253.22758-3-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



Am 30.05.23 um 17:02 schrieb Thomas Zimmermann:
> For framebuffers in I/O and system memory, add macros that set
> struct fb_ops to the respective callback functions.
>
> For deferred I/O, add macros that generate callback functions with
> damage handling. Add initializer macros that set struct fb_ops to
> the generated callbacks.
>
> These macros can remove a lot boilerplate code from fbdev drivers.
> The drivers are supposed to use the macro that is required for its
> framebuffer. Each macro is split into smaller helpers, so that
> drivers with non-standard callbacks can pick and customize callbacks
> as needed. There are individual helper macros for read/write, mmap
> and drawing.
>
> v5:
> 	* fix whitespace errors (Jingfeng)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>   include/linux/fb.h | 112 +++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 112 insertions(+)
>
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 2cf8efcb9e32..ce6823e157e6 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -538,9 +538,31 @@ extern ssize_t fb_io_read(struct fb_info *info, char __user *buf,
>   extern ssize_t fb_io_write(struct fb_info *info, const char __user *buf,
>   			   size_t count, loff_t *ppos);
>   
> +/*
> + * Initializes struct fb_ops for framebuffers in I/O memory.
> + */
> +
> +#define __FB_DEFAULT_IO_OPS_RDWR \
> +	.fb_read	= fb_io_read, \
> +	.fb_write	= fb_io_write
> +
> +#define __FB_DEFAULT_IO_OPS_DRAW \
> +	.fb_fillrect	= cfb_fillrect, \
> +	.fb_copyarea	= cfb_copyarea, \
> +	.fb_imageblit	= cfb_imageblit
> +
> +#define __FB_DEFAULT_IO_OPS_MMAP \
> +	.fb_mmap	= NULL // default implementation

// style comment in a macro? That's usually a very bad idea.

Christian.

> +
> +#define FB_DEFAULT_IO_OPS \
> +	__FB_DEFAULT_IO_OPS_RDWR, \
> +	__FB_DEFAULT_IO_OPS_DRAW, \
> +	__FB_DEFAULT_IO_OPS_MMAP
> +
>   /*
>    * Drawing operations where framebuffer is in system RAM
>    */
> +
>   extern void sys_fillrect(struct fb_info *info, const struct fb_fillrect *rect);
>   extern void sys_copyarea(struct fb_info *info, const struct fb_copyarea *area);
>   extern void sys_imageblit(struct fb_info *info, const struct fb_image *image);
> @@ -549,6 +571,27 @@ extern ssize_t fb_sys_read(struct fb_info *info, char __user *buf,
>   extern ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
>   			    size_t count, loff_t *ppos);
>   
> +/*
> + * Initializes struct fb_ops for framebuffers in system memory.
> + */
> +
> +#define __FB_DEFAULT_SYS_OPS_RDWR \
> +	.fb_read	= fb_sys_read, \
> +	.fb_write	= fb_sys_write
> +
> +#define __FB_DEFAULT_SYS_OPS_DRAW \
> +	.fb_fillrect	= sys_fillrect, \
> +	.fb_copyarea	= sys_copyarea, \
> +	.fb_imageblit	= sys_imageblit
> +
> +#define __FB_DEFAULT_SYS_OPS_MMAP \
> +	.fb_mmap	= NULL // default implementation
> +
> +#define FB_DEFAULT_SYS_OPS \
> +	__FB_DEFAULT_SYS_OPS_RDWR, \
> +	__FB_DEFAULT_SYS_OPS_DRAW, \
> +	__FB_DEFAULT_SYS_OPS_MMAP
> +
>   /* drivers/video/fbmem.c */
>   extern int register_framebuffer(struct fb_info *fb_info);
>   extern void unregister_framebuffer(struct fb_info *fb_info);
> @@ -604,6 +647,75 @@ extern void fb_deferred_io_cleanup(struct fb_info *info);
>   extern int fb_deferred_io_fsync(struct file *file, loff_t start,
>   				loff_t end, int datasync);
>   
> +/*
> + * Generate callbacks for deferred I/O
> + */
> +
> +#define __FB_GEN_DEFAULT_DEFERRED_OPS_RDWR(__prefix, __damage_range, __mode) \
> +	static ssize_t __prefix ## _defio_read(struct fb_info *info, char __user *buf, \
> +					       size_t count, loff_t *ppos) \
> +	{ \
> +		return fb_ ## __mode ## _read(info, buf, count, ppos); \
> +	} \
> +	static ssize_t __prefix ## _defio_write(struct fb_info *info, const char __user *buf, \
> +						size_t count, loff_t *ppos) \
> +	{ \
> +		unsigned long offset = *ppos; \
> +		ssize_t ret = fb_ ## __mode ## _write(info, buf, count, ppos); \
> +		if (ret > 0) \
> +			__damage_range(info, offset, ret); \
> +		return ret; \
> +	}
> +
> +#define __FB_GEN_DEFAULT_DEFERRED_OPS_DRAW(__prefix, __damage_area, __mode) \
> +	static void __prefix ## _defio_fillrect(struct fb_info *info, \
> +						const struct fb_fillrect *rect) \
> +	{ \
> +		__mode ## _fillrect(info, rect); \
> +		__damage_area(info, rect->dx, rect->dy, rect->width, rect->height); \
> +	} \
> +	static void __prefix ## _defio_copyarea(struct fb_info *info, \
> +						const struct fb_copyarea *area) \
> +	{ \
> +		__mode ## _copyarea(info, area); \
> +		__damage_area(info, area->dx, area->dy, area->width, area->height); \
> +	} \
> +	static void __prefix ## _defio_imageblit(struct fb_info *info, \
> +						 const struct fb_image *image) \
> +	{ \
> +		__mode ## _imageblit(info, image); \
> +		__damage_area(info, image->dx, image->dy, image->width, image->height); \
> +	}
> +
> +#define FB_GEN_DEFAULT_DEFERRED_IO_OPS(__prefix, __damage_range, __damage_area) \
> +	__FB_GEN_DEFAULT_DEFERRED_OPS_RDWR(__prefix, __damage_range, io) \
> +	__FB_GEN_DEFAULT_DEFERRED_OPS_DRAW(__prefix, __damage_area, cfb)
> +
> +#define FB_GEN_DEFAULT_DEFERRED_SYS_OPS(__prefix, __damage_range, __damage_area) \
> +	__FB_GEN_DEFAULT_DEFERRED_OPS_RDWR(__prefix, __damage_range, sys) \
> +	__FB_GEN_DEFAULT_DEFERRED_OPS_DRAW(__prefix, __damage_area, sys)
> +
> +/*
> + * Initializes struct fb_ops for deferred I/O.
> + */
> +
> +#define __FB_DEFAULT_DEFERRED_OPS_RDWR(__prefix) \
> +	.fb_read	= __prefix ## _defio_read, \
> +	.fb_write	= __prefix ## _defio_write
> +
> +#define __FB_DEFAULT_DEFERRED_OPS_DRAW(__prefix) \
> +	.fb_fillrect	= __prefix ## _defio_fillrect, \
> +	.fb_copyarea	= __prefix ## _defio_copyarea, \
> +	.fb_imageblit	= __prefix ## _defio_imageblit
> +
> +#define __FB_DEFAULT_DEFERRED_OPS_MMAP(__prefix) \
> +	.fb_mmap	= fb_deferred_io_mmap
> +
> +#define FB_DEFAULT_DEFERRED_OPS(__prefix) \
> +	__FB_DEFAULT_DEFERRED_OPS_RDWR(__prefix), \
> +	__FB_DEFAULT_DEFERRED_OPS_DRAW(__prefix), \
> +	__FB_DEFAULT_DEFERRED_OPS_MMAP(__prefix)
> +
>   static inline bool fb_be_math(struct fb_info *info)
>   {
>   #ifdef CONFIG_FB_FOREIGN_ENDIAN

