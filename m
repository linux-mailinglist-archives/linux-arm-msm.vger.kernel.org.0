Return-Path: <linux-arm-msm+bounces-78178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E14ABF6C73
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 15:30:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17ADB3B64CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 13:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8931433710B;
	Tue, 21 Oct 2025 13:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TLmFnjHZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5883019A2;
	Tue, 21 Oct 2025 13:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761053355; cv=none; b=lQQ2fOaHespF4ozIreml6nnDOEIj78q5gxvxu8CcwF//tfY5Cxh7m4ruHN5qGarAH3GH92GCc6vm5UoE+ZJ7JPxrymV3LPprt8PqNesFhFK6rLFhXLMcXanEg1Mp2Ua4NYCePtpFm4WbbIpguV2hjzeX93ugB1NWyxwHDD0qEkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761053355; c=relaxed/simple;
	bh=TdmnHYraVLXyq2KpB8KKjs8nVP++3l4uw6Cj2Qx6icU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AsGj7JTalnWk5OTjFHqU0RI3g+dIhRas5wW/pyHZdJiyqxRVBVnYxhiwKH8WPHzTJgNFJVza2q5uZiA0u7KUr66oBSzX4xn+FLg7iLZ2FuyxG6e5dVQsI7WhFx/e8X7mD6blvsf3+/agKOGlH2rPoD4LOMrgtUm7IFsndVyc7Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TLmFnjHZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6D036A6;
	Tue, 21 Oct 2025 15:27:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761053248;
	bh=TdmnHYraVLXyq2KpB8KKjs8nVP++3l4uw6Cj2Qx6icU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TLmFnjHZ7QGrJGGch1/PS5cm/SEPmEHLgfnRuKGU633tUbrafTejahnxqwDqb8WUA
	 BzvQIu/AKRvUSlGdmWCAqjQjW9PUt5VL1fWjA2Ktkz5YhQDUq8+cEhbqslGSWERmTI
	 Acn2+DbnOn3ka05kWMPm1BmHMJcyPmrIx4Z+WbUg=
Message-ID: <5ae8b52a-ff6c-4ab6-b2e6-83bd858b206a@ideasonboard.com>
Date: Tue, 21 Oct 2025 16:29:08 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/client: Add client free callback to unprepare
 fb_helper
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 javierm@redhat.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
References: <20251009132006.45834-1-tzimmermann@suse.de>
 <20251009132006.45834-2-tzimmermann@suse.de>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20251009132006.45834-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/10/2025 16:16, Thomas Zimmermann wrote:
> Add free callback to struct drm_client_funcs. Invoke function to
> free the client memory as part of the release process. Implement
> free for fbdev emulation.
> 
> Fbdev emulation allocates and prepares client memory in
> drm_fbdev_client_setup(). The release happens in fb_destroy from
> struct fb_ops. Multiple implementations of this callback exist in
> the various drivers that provide fbdev implementation. Each of them
> needs to follow the implementation details of the fbdev setup code.
> 
> Adding a free callback for the client puts the unprepare and release
> of the fbdev client in a single place.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/armada/armada_fbdev.c      |  2 --
>  drivers/gpu/drm/clients/drm_fbdev_client.c | 17 +++++++++++++++--
>  drivers/gpu/drm/drm_client.c               |  4 ++++
>  drivers/gpu/drm/drm_fbdev_dma.c            |  4 ----
>  drivers/gpu/drm/drm_fbdev_shmem.c          |  2 --
>  drivers/gpu/drm/drm_fbdev_ttm.c            |  2 --
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c  |  2 --
>  drivers/gpu/drm/gma500/fbdev.c             |  3 ---
>  drivers/gpu/drm/i915/display/intel_fbdev.c |  2 --
>  drivers/gpu/drm/msm/msm_fbdev.c            |  2 --
>  drivers/gpu/drm/omapdrm/omap_fbdev.c       |  2 --

For omapdrm:

Acked-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

 Tomi

>  drivers/gpu/drm/radeon/radeon_fbdev.c      |  2 --
>  drivers/gpu/drm/tegra/fbdev.c              |  2 --
>  include/drm/drm_client.h                   | 10 ++++++++++
>  14 files changed, 29 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
> index cb53cc91bafb..22e2081bfa04 100644
> --- a/drivers/gpu/drm/armada/armada_fbdev.c
> +++ b/drivers/gpu/drm/armada/armada_fbdev.c
> @@ -28,8 +28,6 @@ static void armada_fbdev_fb_destroy(struct fb_info *info)
>  	fbh->fb->funcs->destroy(fbh->fb);
>  
>  	drm_client_release(&fbh->client);
> -	drm_fb_helper_unprepare(fbh);
> -	kfree(fbh);
>  }
>  
>  static const struct fb_ops armada_fb_ops = {
> diff --git a/drivers/gpu/drm/clients/drm_fbdev_client.c b/drivers/gpu/drm/clients/drm_fbdev_client.c
> index f894ba52bdb5..5336accab1b6 100644
> --- a/drivers/gpu/drm/clients/drm_fbdev_client.c
> +++ b/drivers/gpu/drm/clients/drm_fbdev_client.c
> @@ -13,16 +13,28 @@
>   * struct drm_client_funcs
>   */
>  
> +static void drm_fbdev_client_free(struct drm_client_dev *client)
> +{
> +	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
> +
> +	drm_fb_helper_unprepare(fb_helper);
> +	kfree(fb_helper);
> +}
> +
>  static void drm_fbdev_client_unregister(struct drm_client_dev *client)
>  {
>  	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
>  
>  	if (fb_helper->info) {
> +		/*
> +		 * Fully probed framebuffer device
> +		 */
>  		drm_fb_helper_unregister_info(fb_helper);
>  	} else {
> +		/*
> +		 * Partially initialized client, no framebuffer device yet
> +		 */
>  		drm_client_release(&fb_helper->client);
> -		drm_fb_helper_unprepare(fb_helper);
> -		kfree(fb_helper);
>  	}
>  }
>  
> @@ -88,6 +100,7 @@ static int drm_fbdev_client_resume(struct drm_client_dev *client, bool holds_con
>  
>  static const struct drm_client_funcs drm_fbdev_client_funcs = {
>  	.owner		= THIS_MODULE,
> +	.free		= drm_fbdev_client_free,
>  	.unregister	= drm_fbdev_client_unregister,
>  	.restore	= drm_fbdev_client_restore,
>  	.hotplug	= drm_fbdev_client_hotplug,
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index 3fa38d4ac70b..fe9c6d7083ea 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -168,6 +168,10 @@ void drm_client_release(struct drm_client_dev *client)
>  
>  	drm_client_modeset_free(client);
>  	drm_client_close(client);
> +
> +	if (client->funcs && client->funcs->free)
> +		client->funcs->free(client);
> +
>  	drm_dev_put(dev);
>  }
>  EXPORT_SYMBOL(drm_client_release);
> diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
> index 8bd626ef16c7..c6196293e424 100644
> --- a/drivers/gpu/drm/drm_fbdev_dma.c
> +++ b/drivers/gpu/drm/drm_fbdev_dma.c
> @@ -57,8 +57,6 @@ static void drm_fbdev_dma_fb_destroy(struct fb_info *info)
>  	drm_client_buffer_vunmap(fb_helper->buffer);
>  	drm_client_framebuffer_delete(fb_helper->buffer);
>  	drm_client_release(&fb_helper->client);
> -	drm_fb_helper_unprepare(fb_helper);
> -	kfree(fb_helper);
>  }
>  
>  static const struct fb_ops drm_fbdev_dma_fb_ops = {
> @@ -92,8 +90,6 @@ static void drm_fbdev_dma_shadowed_fb_destroy(struct fb_info *info)
>  	drm_client_buffer_vunmap(fb_helper->buffer);
>  	drm_client_framebuffer_delete(fb_helper->buffer);
>  	drm_client_release(&fb_helper->client);
> -	drm_fb_helper_unprepare(fb_helper);
> -	kfree(fb_helper);
>  }
>  
>  static const struct fb_ops drm_fbdev_dma_shadowed_fb_ops = {
> diff --git a/drivers/gpu/drm/drm_fbdev_shmem.c b/drivers/gpu/drm/drm_fbdev_shmem.c
> index 1e827bf8b815..51573058df6f 100644
> --- a/drivers/gpu/drm/drm_fbdev_shmem.c
> +++ b/drivers/gpu/drm/drm_fbdev_shmem.c
> @@ -65,8 +65,6 @@ static void drm_fbdev_shmem_fb_destroy(struct fb_info *info)
>  	drm_client_buffer_vunmap(fb_helper->buffer);
>  	drm_client_framebuffer_delete(fb_helper->buffer);
>  	drm_client_release(&fb_helper->client);
> -	drm_fb_helper_unprepare(fb_helper);
> -	kfree(fb_helper);
>  }
>  
>  static const struct fb_ops drm_fbdev_shmem_fb_ops = {
> diff --git a/drivers/gpu/drm/drm_fbdev_ttm.c b/drivers/gpu/drm/drm_fbdev_ttm.c
> index 85feb55bba11..ccf460fbc1f0 100644
> --- a/drivers/gpu/drm/drm_fbdev_ttm.c
> +++ b/drivers/gpu/drm/drm_fbdev_ttm.c
> @@ -53,8 +53,6 @@ static void drm_fbdev_ttm_fb_destroy(struct fb_info *info)
>  	drm_client_framebuffer_delete(fb_helper->buffer);
>  
>  	drm_client_release(&fb_helper->client);
> -	drm_fb_helper_unprepare(fb_helper);
> -	kfree(fb_helper);
>  }
>  
>  static const struct fb_ops drm_fbdev_ttm_fb_ops = {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> index 93de25b77e68..a3bd21a827ad 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> @@ -42,8 +42,6 @@ static void exynos_drm_fb_destroy(struct fb_info *info)
>  	drm_framebuffer_remove(fb);
>  
>  	drm_client_release(&fb_helper->client);
> -	drm_fb_helper_unprepare(fb_helper);
> -	kfree(fb_helper);
>  }
>  
>  static const struct fb_ops exynos_drm_fb_ops = {
> diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
> index a6af21514cff..bc92fa24a1e2 100644
> --- a/drivers/gpu/drm/gma500/fbdev.c
> +++ b/drivers/gpu/drm/gma500/fbdev.c
> @@ -84,9 +84,6 @@ static void psb_fbdev_fb_destroy(struct fb_info *info)
>  	drm_gem_object_put(obj);
>  
>  	drm_client_release(&fb_helper->client);
> -
> -	drm_fb_helper_unprepare(fb_helper);
> -	kfree(fb_helper);
>  }
>  
>  static const struct fb_ops psb_fbdev_fb_ops = {
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index 3fbdf75415cc..d5f26c8bb102 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -146,8 +146,6 @@ static void intel_fbdev_fb_destroy(struct fb_info *info)
>  	drm_framebuffer_remove(fb_helper->fb);
>  
>  	drm_client_release(&fb_helper->client);
> -	drm_fb_helper_unprepare(fb_helper);
> -	kfree(fb_helper);
>  }
>  
>  __diag_push();
> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
> index b5969374d53f..aad6fb77f0de 100644
> --- a/drivers/gpu/drm/msm/msm_fbdev.c
> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
> @@ -52,8 +52,6 @@ static void msm_fbdev_fb_destroy(struct fb_info *info)
>  	drm_framebuffer_remove(fb);
>  
>  	drm_client_release(&helper->client);
> -	drm_fb_helper_unprepare(helper);
> -	kfree(helper);
>  }
>  
>  static const struct fb_ops msm_fb_ops = {
> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> index 948af7ec1130..b5df2923d2a6 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> @@ -103,8 +103,6 @@ static void omap_fbdev_fb_destroy(struct fb_info *info)
>  	drm_framebuffer_remove(fb);
>  
>  	drm_client_release(&helper->client);
> -	drm_fb_helper_unprepare(helper);
> -	kfree(helper);
>  }
>  
>  /*
> diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
> index dc81b0c2dbff..4df6c9167bf0 100644
> --- a/drivers/gpu/drm/radeon/radeon_fbdev.c
> +++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
> @@ -184,8 +184,6 @@ static void radeon_fbdev_fb_destroy(struct fb_info *info)
>  	radeon_fbdev_destroy_pinned_object(gobj);
>  
>  	drm_client_release(&fb_helper->client);
> -	drm_fb_helper_unprepare(fb_helper);
> -	kfree(fb_helper);
>  }
>  
>  static const struct fb_ops radeon_fbdev_fb_ops = {
> diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbdev.c
> index 1b70f5e164af..91aece6f34e0 100644
> --- a/drivers/gpu/drm/tegra/fbdev.c
> +++ b/drivers/gpu/drm/tegra/fbdev.c
> @@ -53,8 +53,6 @@ static void tegra_fbdev_fb_destroy(struct fb_info *info)
>  	drm_framebuffer_remove(fb);
>  
>  	drm_client_release(&helper->client);
> -	drm_fb_helper_unprepare(helper);
> -	kfree(helper);
>  }
>  
>  static const struct fb_ops tegra_fb_ops = {
> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index bdd845e383ef..eecb8d6e15c7 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -28,6 +28,16 @@ struct drm_client_funcs {
>  	 */
>  	struct module *owner;
>  
> +	/**
> +	 * @free:
> +	 *
> +	 * Called when the client gets unregistered. Implementations should
> +	 * release all client-specific data and free the memory.
> +	 *
> +	 * This callback is optional.
> +	 */
> +	void (*free)(struct drm_client_dev *client);
> +
>  	/**
>  	 * @unregister:
>  	 *


