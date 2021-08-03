Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72BB23DF3D4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Aug 2021 19:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237957AbhHCRUx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Aug 2021 13:20:53 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:38390 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237904AbhHCRUw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Aug 2021 13:20:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628011241; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=6YH7f75Vb/8NA25/v2Dq53cOr2mRNK5ZyjGEWQjX8Dk=;
 b=wjY2h03fB2RmYT9Rt+9EfHTOo6EpTQrS6RIjtd6cyZGLDS5aJYZvyxFDBEhzJ/ae182QuM/K
 l8OAcpwYTnfexgab3TZ9Ad+wXvnql30u17QLd0ubfRQst2mcMM4GSDpgqfzczugnSuQgk3jK
 KrVzT1EmaTPbLUiRbtTao+b8ya0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 61097adc1175e6c4173ef6a3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Aug 2021 17:20:28
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ACFAAC43146; Tue,  3 Aug 2021 17:20:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 26FABC433D3;
        Tue,  3 Aug 2021 17:20:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 03 Aug 2021 10:20:25 -0700
From:   abhinavk@codeaurora.org
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
        christian.koenig@amd.com, liviu.dudau@arm.com,
        brian.starkey@arm.com, sam@ravnborg.org, bbrezillon@kernel.org,
        nicolas.ferre@microchip.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, stefan@agner.ch, alison.wang@nxp.com,
        patrik.r.jakobsson@gmail.com, anitha.chrisanthus@intel.com,
        robdclark@gmail.com, edmund.j.dea@intel.com, sean@poorly.run,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        jyri.sarha@iki.fi, tomba@kernel.org, Dan.Sneddon@microchip.com,
        tomi.valkeinen@ideasonboard.com, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH v2 07/14] drm/msm: Convert to Linux IRQ
 interfaces
In-Reply-To: <20210803090704.32152-8-tzimmermann@suse.de>
References: <20210803090704.32152-1-tzimmermann@suse.de>
 <20210803090704.32152-8-tzimmermann@suse.de>
Message-ID: <f3649718c0c1093ed31a64bf4621ae3d@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-03 02:06, Thomas Zimmermann wrote:
> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
> don't benefit from using it.
> 
> DRM IRQ callbacks are now being called directly or inlined.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 113 ++++++++++++++++++++--------------
>  drivers/gpu/drm/msm/msm_kms.h |   2 +-
>  2 files changed, 69 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c 
> b/drivers/gpu/drm/msm/msm_drv.c
> index 1594ae39d54f..a332b09a5a11 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -14,7 +14,6 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_ioctl.h>
> -#include <drm/drm_irq.h>
>  #include <drm/drm_prime.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_vblank.h>
> @@ -201,6 +200,71 @@ void msm_rmw(void __iomem *addr, u32 mask, u32 or)
>  	msm_writel(val | or, addr);
>  }
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
>  struct msm_vblank_work {
>  	struct work_struct work;
>  	int crtc_id;
> @@ -265,7 +329,7 @@ static int msm_drm_uninit(struct device *dev)
>  	}
> 
>  	/* We must cancel and cleanup any pending vblank enable/disable
> -	 * work before drm_irq_uninstall() to avoid work re-enabling an
> +	 * work before msm_irq_uninstall() to avoid work re-enabling an
>  	 * irq after uninstall has disabled it.
>  	 */
> 
> @@ -294,7 +358,7 @@ static int msm_drm_uninit(struct device *dev)
>  	drm_mode_config_cleanup(ddev);
> 
>  	pm_runtime_get_sync(dev);
> -	drm_irq_uninstall(ddev);
> +	msm_irq_uninstall(ddev);
>  	pm_runtime_put_sync(dev);
> 
>  	if (kms && kms->funcs)
> @@ -553,7 +617,7 @@ static int msm_drm_init(struct device *dev, const
> struct drm_driver *drv)
> 
>  	if (kms) {
>  		pm_runtime_get_sync(dev);
> -		ret = drm_irq_install(ddev, kms->irq);
> +		ret = msm_irq_install(ddev, kms->irq);
>  		pm_runtime_put_sync(dev);
>  		if (ret < 0) {
>  			DRM_DEV_ERROR(dev, "failed to install IRQ handler\n");
> @@ -662,43 +726,6 @@ static void msm_postclose(struct drm_device *dev,
> struct drm_file *file)
>  	context_close(ctx);
>  }
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
>  int msm_crtc_enable_vblank(struct drm_crtc *crtc)
>  {
>  	struct drm_device *dev = crtc->dev;
> @@ -1051,10 +1078,6 @@ static const struct drm_driver msm_driver = {
>  	.open               = msm_open,
>  	.postclose           = msm_postclose,
>  	.lastclose          = drm_fb_helper_lastclose,
> -	.irq_handler        = msm_irq,
> -	.irq_preinstall     = msm_irq_preinstall,
> -	.irq_postinstall    = msm_irq_postinstall,
> -	.irq_uninstall      = msm_irq_uninstall,
>  	.dumb_create        = msm_gem_dumb_create,
>  	.dumb_map_offset    = msm_gem_dumb_map_offset,
>  	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
> diff --git a/drivers/gpu/drm/msm/msm_kms.h 
> b/drivers/gpu/drm/msm/msm_kms.h
> index 086a2d59b8c8..9de7c42e1071 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -150,7 +150,7 @@ struct msm_kms {
>  	const struct msm_kms_funcs *funcs;
>  	struct drm_device *dev;
> 
> -	/* irq number to be passed on to drm_irq_install */
> +	/* irq number to be passed on to msm_irq_install */
>  	int irq;
> 
>  	/* mapper-id used to request GEM buffer mapped for scanout: */
