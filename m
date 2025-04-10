Return-Path: <linux-arm-msm+bounces-53903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9784FA84D13
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 21:31:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FAF14464AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 19:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61DB01F09BF;
	Thu, 10 Apr 2025 19:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qm97BJyT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83A228D826;
	Thu, 10 Apr 2025 19:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744313497; cv=none; b=dUGRB4VNT+nEmzs/Fn7ClwwsPWks1Pw8t2vpnW0HcU3XOuK1c5Bny+om7Pn4Yw7KaH/K9dFOmroUKQJ6KfPKh/Zg7nejAWn/9bhK3VGveRA56uny00YPZDzGqNMQ/pcWQBvbEp98+c19Ayaqu5YnKuuLVpYzLddCTPyqmWDk5Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744313497; c=relaxed/simple;
	bh=/APTbYMdqk0gUZ3tNjkjOwxZ7eeUHw1ZqS6P86GUbHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CHzgfFMqcHMRJEGpWVDAXWw2Yqja1kicTmVZzE4ojGjIqctDlAEjCBmJm3tkwkvY8wnYA3vUqXBvGLZm4mz9OqJr0CRZJUKzRoFGdREzOq7Rsvw5riXCdjvRgxoFeff6JJCFsxLrE/NN3YhoEKLSMNBIPnnUGc9m0Y3PQ40Yz2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qm97BJyT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E23E352;
	Thu, 10 Apr 2025 21:29:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744313373;
	bh=/APTbYMdqk0gUZ3tNjkjOwxZ7eeUHw1ZqS6P86GUbHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qm97BJyTD5CYGIJCa5nFthbcqbuw9s2pK7UIQjfyRxB6857pFfOpOfgWD6udYX4Bq
	 OoMGMtJ3qldwfchsCZHZMuir/ZoUfALoPyV0GBilUHCJ4kRZNQSKjNeHu9sGwru+Qr
	 J+oTiGJoOCyPQDl0aqXq/yn8Fm97ulKTscvS/kdQ=
Date: Thu, 10 Apr 2025 22:31:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 02/19] drm: Pass pixel_format+modifier directly to
 drm_get_format_info()
Message-ID: <20250410193106.GB27834@pendragon.ideasonboard.com>
References: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
 <20250410163218.15130-3-ville.syrjala@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410163218.15130-3-ville.syrjala@linux.intel.com>

Hi Ville,

Thank you for the patch.

On Thu, Apr 10, 2025 at 07:32:01PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Decouple drm_get_format_info() from struct drm_mode_fb_cmd2 and just
> pass the pixel format+modifier combo in by hand.
> 
> We may want to use drm_get_format_info() outside of the normal
> addfb paths where we won't have a struct drm_mode_fb_cmd2, and
> creating a temporary one just for this seems silly.
> 
> Done with cocci:
> @@
> identifier dev, mode_cmd;
> @@
> struct drm_format_info *
> drm_get_format_info(struct drm_device *dev,
> -		    const struct drm_mode_fb_cmd2 *mode_cmd
> +		    u32 pixel_format, u64 modifier
>      		    )
> {
> <...
> (
> - mode_cmd->pixel_format
> + pixel_format
> |
> - mode_cmd->modifier[0]
> + modifier
> )
> ...>
> }
> 
> @@
> identifier dev, mode_cmd;
> @@
> struct drm_format_info *
> drm_get_format_info(struct drm_device *dev,
> -		    const struct drm_mode_fb_cmd2 *mode_cmd
> +		    u32 pixel_format, u64 modifier
>      		    );
> 
> @@
> expression dev, mode_cmd;
> @@
> - drm_get_format_info(dev, mode_cmd)
> + drm_get_format_info(dev, mode_cmd->pixel_format, mode_cmd->modifier[0])
> 
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko Stübner" <heiko@sntech.de>
> Cc: Andy Yan <andy.yan@rock-chips.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/arm/malidp_drv.c             | 3 ++-
>  drivers/gpu/drm/armada/armada_fb.c           | 4 +++-
>  drivers/gpu/drm/drm_fourcc.c                 | 8 ++++----
>  drivers/gpu/drm/drm_framebuffer.c            | 2 +-
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 9 ++++++---
>  drivers/gpu/drm/drm_modeset_helper.c         | 3 ++-
>  drivers/gpu/drm/exynos/exynos_drm_fb.c       | 4 +++-
>  drivers/gpu/drm/gma500/framebuffer.c         | 3 ++-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c       | 4 +++-
>  drivers/gpu/drm/msm/msm_fb.c                 | 6 ++++--
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c            | 3 ++-
>  drivers/gpu/drm/nouveau/nouveau_display.c    | 3 ++-
>  drivers/gpu/drm/omapdrm/omap_fb.c            | 6 ++++--
>  drivers/gpu/drm/radeon/radeon_fbdev.c        | 3 ++-
>  drivers/gpu/drm/rockchip/rockchip_drm_fb.c   | 3 ++-
>  drivers/gpu/drm/tegra/fb.c                   | 4 +++-
>  include/drm/drm_fourcc.h                     | 2 +-
>  17 files changed, 46 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
> index e083021e9e99..558e44a7e627 100644
> --- a/drivers/gpu/drm/arm/malidp_drv.c
> +++ b/drivers/gpu/drm/arm/malidp_drv.c
> @@ -325,7 +325,8 @@ malidp_verify_afbc_framebuffer_size(struct drm_device *dev,
>  		return false;
>  	}
>  
> -	info = drm_get_format_info(dev, mode_cmd);
> +	info = drm_get_format_info(dev, mode_cmd->pixel_format,
> +				   mode_cmd->modifier[0]);
>  
>  	n_superblocks = (mode_cmd->width / afbc_superblock_width) *
>  		(mode_cmd->height / afbc_superblock_height);
> diff --git a/drivers/gpu/drm/armada/armada_fb.c b/drivers/gpu/drm/armada/armada_fb.c
> index cf2e88218dc0..85fc2cb50544 100644
> --- a/drivers/gpu/drm/armada/armada_fb.c
> +++ b/drivers/gpu/drm/armada/armada_fb.c
> @@ -86,7 +86,9 @@ struct armada_framebuffer *armada_framebuffer_create(struct drm_device *dev,
>  struct drm_framebuffer *armada_fb_create(struct drm_device *dev,
>  	struct drm_file *dfile, const struct drm_mode_fb_cmd2 *mode)
>  {
> -	const struct drm_format_info *info = drm_get_format_info(dev, mode);
> +	const struct drm_format_info *info = drm_get_format_info(dev,
> +								 mode->pixel_format,
> +								 mode->modifier[0]);
>  	struct armada_gem_object *obj;
>  	struct armada_framebuffer *dfb;
>  	int ret;
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index f79fff8209fd..3c6998b74a4f 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -390,16 +390,16 @@ EXPORT_SYMBOL(drm_format_info);
>   */
>  const struct drm_format_info *
>  drm_get_format_info(struct drm_device *dev,
> -		    const struct drm_mode_fb_cmd2 *mode_cmd)
> +		    u32 pixel_format, u64 modifier)
>  {
>  	const struct drm_format_info *info = NULL;
>  
>  	if (dev->mode_config.funcs->get_format_info)
> -		info = dev->mode_config.funcs->get_format_info(mode_cmd->pixel_format,
> -							       mode_cmd->modifier[0]);
> +		info = dev->mode_config.funcs->get_format_info(pixel_format,
> +							       modifier);
>  
>  	if (!info)
> -		info = drm_format_info(mode_cmd->pixel_format);
> +		info = drm_format_info(pixel_format);
>  
>  	return info;
>  }
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> index b781601946db..18a0267e374e 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -176,7 +176,7 @@ static int framebuffer_check(struct drm_device *dev,
>  	}
>  
>  	/* now let the driver pick its own format info */
> -	info = drm_get_format_info(dev, r);
> +	info = drm_get_format_info(dev, r->pixel_format, r->modifier[0]);
>  
>  	for (i = 0; i < info->num_planes; i++) {
>  		unsigned int width = drm_format_info_plane_width(info, r->width, i);
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index 6f72e7a0f427..8f1213ea0e16 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -159,7 +159,8 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>  	unsigned int i;
>  	int ret;
>  
> -	info = drm_get_format_info(dev, mode_cmd);
> +	info = drm_get_format_info(dev, mode_cmd->pixel_format,
> +				   mode_cmd->modifier[0]);
>  	if (!info) {
>  		drm_dbg_kms(dev, "Failed to get FB format info\n");
>  		return -EINVAL;
> @@ -501,7 +502,8 @@ static __u32 drm_gem_afbc_get_bpp(struct drm_device *dev,
>  {
>  	const struct drm_format_info *info;
>  
> -	info = drm_get_format_info(dev, mode_cmd);
> +	info = drm_get_format_info(dev, mode_cmd->pixel_format,
> +				   mode_cmd->modifier[0]);
>  
>  	switch (info->format) {
>  	case DRM_FORMAT_YUV420_8BIT:
> @@ -599,7 +601,8 @@ int drm_gem_fb_afbc_init(struct drm_device *dev,
>  	int ret;
>  
>  	objs = afbc_fb->base.obj;
> -	info = drm_get_format_info(dev, mode_cmd);
> +	info = drm_get_format_info(dev, mode_cmd->pixel_format,
> +				   mode_cmd->modifier[0]);
>  	if (!info)
>  		return -EINVAL;
>  
> diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
> index 5565464c1734..dff14af68832 100644
> --- a/drivers/gpu/drm/drm_modeset_helper.c
> +++ b/drivers/gpu/drm/drm_modeset_helper.c
> @@ -84,7 +84,8 @@ void drm_helper_mode_fill_fb_struct(struct drm_device *dev,
>  	int i;
>  
>  	fb->dev = dev;
> -	fb->format = drm_get_format_info(dev, mode_cmd);
> +	fb->format = drm_get_format_info(dev, mode_cmd->pixel_format,
> +					 mode_cmd->modifier[0]);
>  	fb->width = mode_cmd->width;
>  	fb->height = mode_cmd->height;
>  	for (i = 0; i < 4; i++) {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
> index fc1c5608db96..bcf7b534d1f7 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
> @@ -96,7 +96,9 @@ static struct drm_framebuffer *
>  exynos_user_fb_create(struct drm_device *dev, struct drm_file *file_priv,
>  		      const struct drm_mode_fb_cmd2 *mode_cmd)
>  {
> -	const struct drm_format_info *info = drm_get_format_info(dev, mode_cmd);
> +	const struct drm_format_info *info = drm_get_format_info(dev,
> +								 mode_cmd->pixel_format,
> +								 mode_cmd->modifier[0]);
>  	struct exynos_drm_gem *exynos_gem[MAX_FB_BUFFER];
>  	struct drm_framebuffer *fb;
>  	int i;
> diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
> index 1a374702b696..c82e623a2071 100644
> --- a/drivers/gpu/drm/gma500/framebuffer.c
> +++ b/drivers/gpu/drm/gma500/framebuffer.c
> @@ -39,7 +39,8 @@ static int psb_framebuffer_init(struct drm_device *dev,
>  	 * Reject unknown formats, YUV formats, and formats with more than
>  	 * 4 bytes per pixel.
>  	 */
> -	info = drm_get_format_info(dev, mode_cmd);
> +	info = drm_get_format_info(dev, mode_cmd->pixel_format,
> +				   mode_cmd->modifier[0]);
>  	if (!info || !info->depth || info->cpp[0] > 4)
>  		return -EINVAL;
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 74158b9d6503..64521577b05f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -45,7 +45,9 @@ mtk_drm_mode_fb_create(struct drm_device *dev,
>  		       struct drm_file *file,
>  		       const struct drm_mode_fb_cmd2 *cmd)
>  {
> -	const struct drm_format_info *info = drm_get_format_info(dev, cmd);
> +	const struct drm_format_info *info = drm_get_format_info(dev,
> +								 cmd->pixel_format,
> +								 cmd->modifier[0]);
>  
>  	if (info->num_planes != 1)
>  		return ERR_PTR(-EINVAL);
> diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
> index 09268e416843..df2f85c44d55 100644
> --- a/drivers/gpu/drm/msm/msm_fb.c
> +++ b/drivers/gpu/drm/msm/msm_fb.c
> @@ -137,7 +137,8 @@ struct drm_framebuffer *msm_framebuffer_create(struct drm_device *dev,
>  		struct drm_file *file, const struct drm_mode_fb_cmd2 *mode_cmd)
>  {
>  	const struct drm_format_info *info = drm_get_format_info(dev,
> -								 mode_cmd);
> +								 mode_cmd->pixel_format,
> +								 mode_cmd->modifier[0]);
>  	struct drm_gem_object *bos[4] = {0};
>  	struct drm_framebuffer *fb;
>  	int ret, i, n = info->num_planes;
> @@ -168,7 +169,8 @@ static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
>  		const struct drm_mode_fb_cmd2 *mode_cmd, struct drm_gem_object **bos)
>  {
>  	const struct drm_format_info *info = drm_get_format_info(dev,
> -								 mode_cmd);
> +								 mode_cmd->pixel_format,
> +								 mode_cmd->modifier[0]);
>  	struct msm_drm_private *priv = dev->dev_private;
>  	struct msm_kms *kms = priv->kms;
>  	struct msm_framebuffer *msm_fb = NULL;
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index c183b1112bc4..09329af9b01e 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -95,7 +95,8 @@ mxsfb_fb_create(struct drm_device *dev, struct drm_file *file_priv,
>  {
>  	const struct drm_format_info *info;
>  
> -	info = drm_get_format_info(dev, mode_cmd);
> +	info = drm_get_format_info(dev, mode_cmd->pixel_format,
> +				   mode_cmd->modifier[0]);
>  	if (!info)
>  		return ERR_PTR(-EINVAL);
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index add006fc8d81..a54c3f132c5c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -295,7 +295,8 @@ nouveau_framebuffer_new(struct drm_device *dev,
>  		kind = nvbo->kind;
>  	}
>  
> -	info = drm_get_format_info(dev, mode_cmd);
> +	info = drm_get_format_info(dev, mode_cmd->pixel_format,
> +				   mode_cmd->modifier[0]);
>  
>  	for (i = 0; i < info->num_planes; i++) {
>  		height = drm_format_info_plane_height(info,
> diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
> index 449d521c78fe..e18878068c57 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fb.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fb.c
> @@ -338,7 +338,8 @@ struct drm_framebuffer *omap_framebuffer_create(struct drm_device *dev,
>  		struct drm_file *file, const struct drm_mode_fb_cmd2 *mode_cmd)
>  {
>  	const struct drm_format_info *info = drm_get_format_info(dev,
> -								 mode_cmd);
> +								 mode_cmd->pixel_format,
> +								 mode_cmd->modifier[0]);
>  	unsigned int num_planes = info->num_planes;
>  	struct drm_gem_object *bos[4];
>  	struct drm_framebuffer *fb;
> @@ -378,7 +379,8 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
>  			dev, mode_cmd, mode_cmd->width, mode_cmd->height,
>  			(char *)&mode_cmd->pixel_format);
>  
> -	format = drm_get_format_info(dev, mode_cmd);
> +	format = drm_get_format_info(dev, mode_cmd->pixel_format,
> +				     mode_cmd->modifier[0]);
>  
>  	for (i = 0; i < ARRAY_SIZE(formats); i++) {
>  		if (formats[i] == mode_cmd->pixel_format)
> diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
> index d4a58bd679db..e3a481bbee7b 100644
> --- a/drivers/gpu/drm/radeon/radeon_fbdev.c
> +++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
> @@ -67,7 +67,8 @@ static int radeon_fbdev_create_pinned_object(struct drm_fb_helper *fb_helper,
>  	int height = mode_cmd->height;
>  	u32 cpp;
>  
> -	info = drm_get_format_info(rdev_to_drm(rdev), mode_cmd);
> +	info = drm_get_format_info(rdev_to_drm(rdev), mode_cmd->pixel_format,
> +				   mode_cmd->modifier[0]);
>  	cpp = info->cpp[0];
>  
>  	/* need to align pitch with crtc limits */
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> index dcc1f07632c3..bf25286c7665 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> @@ -36,7 +36,8 @@ rockchip_fb_create(struct drm_device *dev, struct drm_file *file,
>  	const struct drm_format_info *info;
>  	int ret;
>  
> -	info = drm_get_format_info(dev, mode_cmd);
> +	info = drm_get_format_info(dev, mode_cmd->pixel_format,
> +				   mode_cmd->modifier[0]);
>  	if (!info)
>  		return ERR_PTR(-ENOMEM);
>  
> diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
> index 46170753699d..634c6346d947 100644
> --- a/drivers/gpu/drm/tegra/fb.c
> +++ b/drivers/gpu/drm/tegra/fb.c
> @@ -134,7 +134,9 @@ struct drm_framebuffer *tegra_fb_create(struct drm_device *drm,
>  					struct drm_file *file,
>  					const struct drm_mode_fb_cmd2 *cmd)
>  {
> -	const struct drm_format_info *info = drm_get_format_info(drm, cmd);
> +	const struct drm_format_info *info = drm_get_format_info(drm,
> +								 cmd->pixel_format,
> +								 cmd->modifier[0]);
>  	struct tegra_bo *planes[4];
>  	struct drm_gem_object *gem;
>  	struct drm_framebuffer *fb;
> diff --git a/include/drm/drm_fourcc.h b/include/drm/drm_fourcc.h
> index c3f4405d6662..6fc08d884b80 100644
> --- a/include/drm/drm_fourcc.h
> +++ b/include/drm/drm_fourcc.h
> @@ -309,7 +309,7 @@ const struct drm_format_info *__drm_format_info(u32 format);
>  const struct drm_format_info *drm_format_info(u32 format);
>  const struct drm_format_info *
>  drm_get_format_info(struct drm_device *dev,
> -		    const struct drm_mode_fb_cmd2 *mode_cmd);
> +		    u32 pixel_format, u64 modifier);
>  uint32_t drm_mode_legacy_fb_format(uint32_t bpp, uint32_t depth);
>  uint32_t drm_driver_legacy_fb_format(struct drm_device *dev,
>  				     uint32_t bpp, uint32_t depth);

-- 
Regards,

Laurent Pinchart

