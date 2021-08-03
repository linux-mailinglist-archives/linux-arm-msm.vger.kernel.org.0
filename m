Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43FD63DE9CC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Aug 2021 11:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234973AbhHCJjG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Aug 2021 05:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235026AbhHCJi5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Aug 2021 05:38:57 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92F31C0617A0
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Aug 2021 02:37:32 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id h9so27416082ljq.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Aug 2021 02:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SK6Ob07YJlX0nTWImG5cDSOjubg9maW6J2sNRF3yaOY=;
        b=FBF9KtmjCa4uE0h2AteVPxiHyctdT6XJKIMbXtjO/tEd2nTSV/YeGyPiRGpkuIvk4D
         MIsUvmdLlN3oN6mclWG7afHoXK1c0LZjelfP0qDlPGcdSNdDBmBndm2Wjg2EFLjBi1sQ
         NW8SX1btq/CrnfYYRiGJRs/IQHazS4i8tNYH1NJBnBtQGSHrv5cZJkHSdmCXPVZmenua
         ikIpDlNesEvw+jbsMZ/kYJWaEh1Oxgu4eltNTq+dQAVMq3x+D5m1idjwyeQjL4/mqJ8Q
         XpT0GMgKd7iBnpTACGTS/qZReSNt1jD/grlVuRsommifNHDzZgq1Co7tOou7ch99y/6v
         HiYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SK6Ob07YJlX0nTWImG5cDSOjubg9maW6J2sNRF3yaOY=;
        b=Erk9BqNLNdIEAKeyZC6Ww1pza2JOLqcppNcgLRWNAfhEErm3V6Mmh8iEnGVKYqjUo8
         CyeT6wR+LXVLQK2buMDMiHmNEN/T3eNG1cumCakv8UtvqT0AHWPNrw+T57rXDj7E00hU
         gsKHnUHWVspFC9MYMufNjn0jxdfV+eXhBUkZ8xPB3iZjSRTDyvpz8Uf6vlyRj8luKfjD
         s02an3gdkaZ9YJ5KqAt3JBZkTOP2eslPNbfZmP5U8EIh3yrwaMJ3XVYaMy+2Q1hhWOTC
         Gix6lcD30hDh0rzOJ8orbDkFI/OsSqsVLA3kC9fixK9wGTfLhPs25gLw3wn46SpbBlyu
         ic4A==
X-Gm-Message-State: AOAM533jWPDAle0hq8j+CaW5bzHA62kj+B9rUZ22gzBgjWrGO8jX97mb
        2tnZzLN5OtLQMJrQB8DQc0Fk+A==
X-Google-Smtp-Source: ABdhPJwfzeu1HZdLhzyas+uFWAQ6XGdYcgkubYxUqCC4cyCTAVYruEGRSEc4hbVySR5Fttx49rvpQw==
X-Received: by 2002:a05:651c:2051:: with SMTP id t17mr13734385ljo.118.1627983450529;
        Tue, 03 Aug 2021 02:37:30 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g17sm748572lfv.210.2021.08.03.02.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Aug 2021 02:37:30 -0700 (PDT)
Subject: Re: [PATCH v2 07/14] drm/msm: Convert to Linux IRQ interfaces
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        airlied@linux.ie, alexander.deucher@amd.com,
        christian.koenig@amd.com, liviu.dudau@arm.com,
        brian.starkey@arm.com, sam@ravnborg.org, bbrezillon@kernel.org,
        nicolas.ferre@microchip.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, stefan@agner.ch, alison.wang@nxp.com,
        patrik.r.jakobsson@gmail.com, anitha.chrisanthus@intel.com,
        robdclark@gmail.com, edmund.j.dea@intel.com, sean@poorly.run,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        jyri.sarha@iki.fi, tomba@kernel.org, Dan.Sneddon@microchip.com,
        tomi.valkeinen@ideasonboard.com
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20210803090704.32152-1-tzimmermann@suse.de>
 <20210803090704.32152-8-tzimmermann@suse.de>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <1f5f285a-b923-16ff-2ca1-6f92e22ffcab@linaro.org>
Date:   Tue, 3 Aug 2021 12:37:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210803090704.32152-8-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/08/2021 12:06, Thomas Zimmermann wrote:
> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
> don't benefit from using it.
> 
> DRM IRQ callbacks are now being called directly or inlined.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Rob should probably also give his blessing on this patch though.

> ---
>   drivers/gpu/drm/msm/msm_drv.c | 113 ++++++++++++++++++++--------------
>   drivers/gpu/drm/msm/msm_kms.h |   2 +-
>   2 files changed, 69 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 1594ae39d54f..a332b09a5a11 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -14,7 +14,6 @@
>   #include <drm/drm_drv.h>
>   #include <drm/drm_file.h>
>   #include <drm/drm_ioctl.h>
> -#include <drm/drm_irq.h>
>   #include <drm/drm_prime.h>
>   #include <drm/drm_of.h>
>   #include <drm/drm_vblank.h>
> @@ -201,6 +200,71 @@ void msm_rmw(void __iomem *addr, u32 mask, u32 or)
>   	msm_writel(val | or, addr);
>   }
>   
> +static irqreturn_t msm_irq(int irq, void *arg)
> +{
> +	struct drm_device *dev = arg;
> +	struct msm_drm_private *priv = dev->dev_private;
> +	struct msm_kms *kms = priv->kms;
> +
> +	BUG_ON(!kms);
> +
> +	return kms->funcs->irq(kms);
> +}
> +
> +static void msm_irq_preinstall(struct drm_device *dev)
> +{
> +	struct msm_drm_private *priv = dev->dev_private;
> +	struct msm_kms *kms = priv->kms;
> +
> +	BUG_ON(!kms);
> +
> +	kms->funcs->irq_preinstall(kms);
> +}
> +
> +static int msm_irq_postinstall(struct drm_device *dev)
> +{
> +	struct msm_drm_private *priv = dev->dev_private;
> +	struct msm_kms *kms = priv->kms;
> +
> +	BUG_ON(!kms);
> +
> +	if (kms->funcs->irq_postinstall)
> +		return kms->funcs->irq_postinstall(kms);
> +
> +	return 0;
> +}
> +
> +static int msm_irq_install(struct drm_device *dev, unsigned int irq)
> +{
> +	int ret;
> +
> +	if (irq == IRQ_NOTCONNECTED)
> +		return -ENOTCONN;
> +
> +	msm_irq_preinstall(dev);
> +
> +	ret = request_irq(irq, msm_irq, 0, dev->driver->name, dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = msm_irq_postinstall(dev);
> +	if (ret) {
> +		free_irq(irq, dev);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void msm_irq_uninstall(struct drm_device *dev)
> +{
> +	struct msm_drm_private *priv = dev->dev_private;
> +	struct msm_kms *kms = priv->kms;
> +
> +	kms->funcs->irq_uninstall(kms);
> +	free_irq(kms->irq, dev);
> +}
> +
>   struct msm_vblank_work {
>   	struct work_struct work;
>   	int crtc_id;
> @@ -265,7 +329,7 @@ static int msm_drm_uninit(struct device *dev)
>   	}
>   
>   	/* We must cancel and cleanup any pending vblank enable/disable
> -	 * work before drm_irq_uninstall() to avoid work re-enabling an
> +	 * work before msm_irq_uninstall() to avoid work re-enabling an
>   	 * irq after uninstall has disabled it.
>   	 */
>   
> @@ -294,7 +358,7 @@ static int msm_drm_uninit(struct device *dev)
>   	drm_mode_config_cleanup(ddev);
>   
>   	pm_runtime_get_sync(dev);
> -	drm_irq_uninstall(ddev);
> +	msm_irq_uninstall(ddev);
>   	pm_runtime_put_sync(dev);
>   
>   	if (kms && kms->funcs)
> @@ -553,7 +617,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   
>   	if (kms) {
>   		pm_runtime_get_sync(dev);
> -		ret = drm_irq_install(ddev, kms->irq);
> +		ret = msm_irq_install(ddev, kms->irq);
>   		pm_runtime_put_sync(dev);
>   		if (ret < 0) {
>   			DRM_DEV_ERROR(dev, "failed to install IRQ handler\n");
> @@ -662,43 +726,6 @@ static void msm_postclose(struct drm_device *dev, struct drm_file *file)
>   	context_close(ctx);
>   }
>   
> -static irqreturn_t msm_irq(int irq, void *arg)
> -{
> -	struct drm_device *dev = arg;
> -	struct msm_drm_private *priv = dev->dev_private;
> -	struct msm_kms *kms = priv->kms;
> -	BUG_ON(!kms);
> -	return kms->funcs->irq(kms);
> -}
> -
> -static void msm_irq_preinstall(struct drm_device *dev)
> -{
> -	struct msm_drm_private *priv = dev->dev_private;
> -	struct msm_kms *kms = priv->kms;
> -	BUG_ON(!kms);
> -	kms->funcs->irq_preinstall(kms);
> -}
> -
> -static int msm_irq_postinstall(struct drm_device *dev)
> -{
> -	struct msm_drm_private *priv = dev->dev_private;
> -	struct msm_kms *kms = priv->kms;
> -	BUG_ON(!kms);
> -
> -	if (kms->funcs->irq_postinstall)
> -		return kms->funcs->irq_postinstall(kms);
> -
> -	return 0;
> -}
> -
> -static void msm_irq_uninstall(struct drm_device *dev)
> -{
> -	struct msm_drm_private *priv = dev->dev_private;
> -	struct msm_kms *kms = priv->kms;
> -	BUG_ON(!kms);
> -	kms->funcs->irq_uninstall(kms);
> -}
> -
>   int msm_crtc_enable_vblank(struct drm_crtc *crtc)
>   {
>   	struct drm_device *dev = crtc->dev;
> @@ -1051,10 +1078,6 @@ static const struct drm_driver msm_driver = {
>   	.open               = msm_open,
>   	.postclose           = msm_postclose,
>   	.lastclose          = drm_fb_helper_lastclose,
> -	.irq_handler        = msm_irq,
> -	.irq_preinstall     = msm_irq_preinstall,
> -	.irq_postinstall    = msm_irq_postinstall,
> -	.irq_uninstall      = msm_irq_uninstall,
>   	.dumb_create        = msm_gem_dumb_create,
>   	.dumb_map_offset    = msm_gem_dumb_map_offset,
>   	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index 086a2d59b8c8..9de7c42e1071 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -150,7 +150,7 @@ struct msm_kms {
>   	const struct msm_kms_funcs *funcs;
>   	struct drm_device *dev;
>   
> -	/* irq number to be passed on to drm_irq_install */
> +	/* irq number to be passed on to msm_irq_install */
>   	int irq;
>   
>   	/* mapper-id used to request GEM buffer mapped for scanout: */
> 


-- 
With best wishes
Dmitry
