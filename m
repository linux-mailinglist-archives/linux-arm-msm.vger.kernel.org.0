Return-Path: <linux-arm-msm+bounces-53878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F387A84A43
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 18:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D66C9C5F2A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 16:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5072857E5;
	Thu, 10 Apr 2025 16:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iv7BHVoX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CA41EE035;
	Thu, 10 Apr 2025 16:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302789; cv=none; b=uXXoUbEZXkS8b8jbjr8lqn/gQ6IImXPeMOr79s3/qSya8r8t2582CL1d//whQl1AyfbU3hgrKbSLHpkbab3aIv42zENU87WM3oxzWrc8fhYYoTc26VZTnIkfBASZ09gGMaje7W96gjp2zEml7zrtIMiEnXHaDy6XrZps6+16jv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302789; c=relaxed/simple;
	bh=KEtVERBt+nI8vErUQUIvjRgQs96IBMo6IKVvmG4EZQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cptEHZfUwJsyZRlIyxa3nEzYmLAvm3jLLXcwIq37+iv+UCnUwpEINaxIWmBwYyZx6cdu3hueTolv5zxCk3KpCHn/bg1n8knkx4KeWeBF2ZQPPr0iLQL5ejHHS5UNz5+4W7I5mHGlr0rpCBtD4t2mjDGDcaARGCsl2MaPIMkolI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iv7BHVoX; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744302787; x=1775838787;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KEtVERBt+nI8vErUQUIvjRgQs96IBMo6IKVvmG4EZQQ=;
  b=Iv7BHVoX92dIo4oAK98s9DBe6V7OeXuqBP62nwE2YWeMyj5ntpgqqPs6
   gbFPNJ92/SGLScJGnoSnz7+dQUw8ieqt6cooR96VaKc+2lfc5VhiMx/z1
   nnIUyq+0s4f+tyNIzQk3Taw0W1s4i3FlTcrKq4ZIaGKAy/cz8ux/lPO/S
   10kGH78e2UEnm5jStyR6xgJ8khdhvjjZ3WYGlP65K0UhaAraVsUxMSPIq
   jhlRrAiqxY++PC0hNOiUanSN6ivfVlsxKk6wO2FjTqmdOOlHvr8+AKoR2
   SFHa6shlrY7HVVOOWxmZ+H+fncDfECpVoYKV/acG9heZg4upsomVZ+OId
   w==;
X-CSE-ConnectionGUID: BqwWdPzWShmkvAEyuvtrzw==
X-CSE-MsgGUID: +hOXOIV/Styj8MbpElNAMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57220060"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="57220060"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 09:33:06 -0700
X-CSE-ConnectionGUID: +Tw3flT9TwKu8w0oF0M5Rw==
X-CSE-MsgGUID: +rnfbK95TFCqNPLQUrPJQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="134129071"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by orviesa005.jf.intel.com with SMTP; 10 Apr 2025 09:32:57 -0700
Received: by stinkbox (sSMTP sendmail emulation); Thu, 10 Apr 2025 19:32:56 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	virtualization@lists.linux.dev
Subject: [PATCH 05/19] drm: Allow the caller to pass in the format info to drm_helper_mode_fill_fb_struct()
Date: Thu, 10 Apr 2025 19:32:04 +0300
Message-ID: <20250410163218.15130-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
References: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Soon all drivers should have the format info already available in the
places where they call drm_helper_mode_fill_fb_struct(). Allow it to
be passed along into drm_helper_mode_fill_fb_struct() instead of doing
yet another redundant lookup.

Start by always passing in NULL and still doing the extra lookup.
The actual changes to avoid the lookup will follow.

Done with cocci (with some manual fixups):
@@
identifier dev, fb, mode_cmd;
expression get_format_info;
@@
void drm_helper_mode_fill_fb_struct(struct drm_device *dev,
                                    struct drm_framebuffer *fb,
+                                    const struct drm_format_info *info,
                                    const struct drm_mode_fb_cmd2 *mode_cmd)
{
...
- fb->format = get_format_info;
+ fb->format = info ?: get_format_info;
...
}

@@
identifier dev, fb, mode_cmd;
@@
void drm_helper_mode_fill_fb_struct(struct drm_device *dev,
                                    struct drm_framebuffer *fb,
+                                    const struct drm_format_info *info,
                                    const struct drm_mode_fb_cmd2 *mode_cmd);

@@
expression dev, fb, mode_cmd;
@@
drm_helper_mode_fill_fb_struct(dev, fb
+	       ,NULL
	       ,mode_cmd);

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Chia-I Wu <olvaffe@gmail.com>
Cc: Zack Rusin <zack.rusin@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
Cc: virtualization@lists.linux.dev
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c             | 2 +-
 drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c | 2 +-
 drivers/gpu/drm/armada/armada_fb.c                      | 2 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c            | 2 +-
 drivers/gpu/drm/drm_modeset_helper.c                    | 6 ++++--
 drivers/gpu/drm/exynos/exynos_drm_fb.c                  | 2 +-
 drivers/gpu/drm/gma500/framebuffer.c                    | 2 +-
 drivers/gpu/drm/i915/display/intel_fb.c                 | 2 +-
 drivers/gpu/drm/msm/msm_fb.c                            | 2 +-
 drivers/gpu/drm/nouveau/nouveau_display.c               | 2 +-
 drivers/gpu/drm/omapdrm/omap_fb.c                       | 2 +-
 drivers/gpu/drm/radeon/radeon_display.c                 | 2 +-
 drivers/gpu/drm/tegra/fb.c                              | 2 +-
 drivers/gpu/drm/virtio/virtgpu_display.c                | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                     | 4 ++--
 include/drm/drm_modeset_helper.h                        | 2 ++
 16 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 10c57ded0e3e..4cbbae543e34 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1202,7 +1202,7 @@ static int amdgpu_display_gem_fb_verify_and_init(struct drm_device *dev,
 	int ret;
 
 	rfb->base.obj[0] = obj;
-	drm_helper_mode_fill_fb_struct(dev, &rfb->base, mode_cmd);
+	drm_helper_mode_fill_fb_struct(dev, &rfb->base, NULL, mode_cmd);
 	/* Verify that the modifier is supported. */
 	if (!drm_any_plane_has_format(dev, mode_cmd->pixel_format,
 				      mode_cmd->modifier[0])) {
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index 29b05482f713..acd8e505ebc7 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -178,7 +178,7 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 		return ERR_PTR(-EINVAL);
 	}
 
-	drm_helper_mode_fill_fb_struct(dev, &kfb->base, mode_cmd);
+	drm_helper_mode_fill_fb_struct(dev, &kfb->base, NULL, mode_cmd);
 
 	if (kfb->base.modifier)
 		ret = komeda_fb_afbc_size_check(kfb, file, mode_cmd);
diff --git a/drivers/gpu/drm/armada/armada_fb.c b/drivers/gpu/drm/armada/armada_fb.c
index 597720e229c2..7e94ec5bd4f4 100644
--- a/drivers/gpu/drm/armada/armada_fb.c
+++ b/drivers/gpu/drm/armada/armada_fb.c
@@ -64,7 +64,7 @@ struct armada_framebuffer *armada_framebuffer_create(struct drm_device *dev,
 	dfb->mod = config;
 	dfb->fb.obj[0] = &obj->obj;
 
-	drm_helper_mode_fill_fb_struct(dev, &dfb->fb, mode);
+	drm_helper_mode_fill_fb_struct(dev, &dfb->fb, NULL, mode);
 
 	ret = drm_framebuffer_init(dev, &dfb->fb, &armada_fb_funcs);
 	if (ret) {
diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 1b58823e14b1..dc9cb6cdcfd6 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -74,7 +74,7 @@ drm_gem_fb_init(struct drm_device *dev,
 	unsigned int i;
 	int ret;
 
-	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
+	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
 
 	for (i = 0; i < num_planes; i++)
 		fb->obj[i] = obj[i];
diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
index dff14af68832..ae2a83ecb1cf 100644
--- a/drivers/gpu/drm/drm_modeset_helper.c
+++ b/drivers/gpu/drm/drm_modeset_helper.c
@@ -72,6 +72,7 @@ EXPORT_SYMBOL(drm_helper_move_panel_connectors_to_head);
  * drm_helper_mode_fill_fb_struct - fill out framebuffer metadata
  * @dev: DRM device
  * @fb: drm_framebuffer object to fill out
+ * @info: pixel format information
  * @mode_cmd: metadata from the userspace fb creation request
  *
  * This helper can be used in a drivers fb_create callback to pre-fill the fb's
@@ -79,13 +80,14 @@ EXPORT_SYMBOL(drm_helper_move_panel_connectors_to_head);
  */
 void drm_helper_mode_fill_fb_struct(struct drm_device *dev,
 				    struct drm_framebuffer *fb,
+				    const struct drm_format_info *info,
 				    const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	int i;
 
 	fb->dev = dev;
-	fb->format = drm_get_format_info(dev, mode_cmd->pixel_format,
-					 mode_cmd->modifier[0]);
+	fb->format = info ? : drm_get_format_info(dev, mode_cmd->pixel_format,
+						  mode_cmd->modifier[0]);
 	fb->width = mode_cmd->width;
 	fb->height = mode_cmd->height;
 	for (i = 0; i < 4; i++) {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index 9ae526825726..7091d31835ec 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -76,7 +76,7 @@ exynos_drm_framebuffer_init(struct drm_device *dev,
 		fb->obj[i] = &exynos_gem[i]->base;
 	}
 
-	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
+	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
 
 	ret = drm_framebuffer_init(dev, fb, &exynos_drm_fb_funcs);
 	if (ret < 0) {
diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index a4a18ec2dd56..f9ade8361354 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -47,7 +47,7 @@ static int psb_framebuffer_init(struct drm_device *dev,
 	if (mode_cmd->pitches[0] & 63)
 		return -EINVAL;
 
-	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
+	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
 	fb->obj[0] = obj;
 	ret = drm_framebuffer_init(dev, fb, &psb_fb_funcs);
 	if (ret) {
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index dd1d5c00395e..80a90bf1c75c 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -2253,7 +2253,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 		goto err_frontbuffer_put;
 	}
 
-	drm_helper_mode_fill_fb_struct(display->drm, fb, mode_cmd);
+	drm_helper_mode_fill_fb_struct(display->drm, fb, NULL, mode_cmd);
 
 	for (i = 0; i < fb->format->num_planes; i++) {
 		unsigned int stride_alignment;
diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 4aef51cef3d5..0615427e85ce 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -222,7 +222,7 @@ static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
 		msm_fb->base.obj[i] = bos[i];
 	}
 
-	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
+	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
 
 	ret = drm_framebuffer_init(dev, fb, &msm_framebuffer_funcs);
 	if (ret) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 3df388784bd3..dd069aaac9f4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -321,7 +321,7 @@ nouveau_framebuffer_new(struct drm_device *dev,
 	if (!(fb = *pfb = kzalloc(sizeof(*fb), GFP_KERNEL)))
 		return -ENOMEM;
 
-	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
+	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
 	fb->obj[0] = gem;
 
 	ret = drm_framebuffer_init(dev, fb, &nouveau_framebuffer_funcs);
diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
index 36afcd1c1fd7..30c81e2e5d6b 100644
--- a/drivers/gpu/drm/omapdrm/omap_fb.c
+++ b/drivers/gpu/drm/omapdrm/omap_fb.c
@@ -440,7 +440,7 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
 		plane->dma_addr  = 0;
 	}
 
-	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
+	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
 
 	ret = drm_framebuffer_init(dev, fb, &omap_framebuffer_funcs);
 	if (ret) {
diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 85b714ac9882..b4bf5dfeea2d 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -1302,7 +1302,7 @@ radeon_framebuffer_init(struct drm_device *dev,
 {
 	int ret;
 	fb->obj[0] = obj;
-	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
+	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
 	ret = drm_framebuffer_init(dev, fb, &radeon_fb_funcs);
 	if (ret) {
 		fb->obj[0] = NULL;
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index 24907573e758..d359683f5ce6 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -114,7 +114,7 @@ struct drm_framebuffer *tegra_fb_alloc(struct drm_device *drm,
 	if (!fb)
 		return ERR_PTR(-ENOMEM);
 
-	drm_helper_mode_fill_fb_struct(drm, fb, mode_cmd);
+	drm_helper_mode_fill_fb_struct(drm, fb, NULL, mode_cmd);
 
 	for (i = 0; i < fb->format->num_planes; i++)
 		fb->obj[i] = &planes[i]->gem;
diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index f9a98fbbabd1..93763b91bab5 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -73,7 +73,7 @@ virtio_gpu_framebuffer_init(struct drm_device *dev,
 
 	vgfb->base.obj[0] = obj;
 
-	drm_helper_mode_fill_fb_struct(dev, &vgfb->base, mode_cmd);
+	drm_helper_mode_fill_fb_struct(dev, &vgfb->base, NULL, mode_cmd);
 
 	ret = drm_framebuffer_init(dev, &vgfb->base, &virtio_gpu_fb_funcs);
 	if (ret) {
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 2d48a28cda9c..35965e29e408 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -548,7 +548,7 @@ static int vmw_kms_new_framebuffer_surface(struct vmw_private *dev_priv,
 		goto out_err1;
 	}
 
-	drm_helper_mode_fill_fb_struct(dev, &vfbs->base.base, mode_cmd);
+	drm_helper_mode_fill_fb_struct(dev, &vfbs->base.base, NULL, mode_cmd);
 	memcpy(&vfbs->uo, uo, sizeof(vfbs->uo));
 	vmw_user_object_ref(&vfbs->uo);
 
@@ -634,7 +634,7 @@ static int vmw_kms_new_framebuffer_bo(struct vmw_private *dev_priv,
 	}
 
 	vfbd->base.base.obj[0] = &bo->tbo.base;
-	drm_helper_mode_fill_fb_struct(dev, &vfbd->base.base, mode_cmd);
+	drm_helper_mode_fill_fb_struct(dev, &vfbd->base.base, NULL, mode_cmd);
 	vfbd->base.bo = true;
 	vfbd->buffer = vmw_bo_reference(bo);
 	*out = &vfbd->base;
diff --git a/include/drm/drm_modeset_helper.h b/include/drm/drm_modeset_helper.h
index 995fd981cab0..7e3d4c5a7f66 100644
--- a/include/drm/drm_modeset_helper.h
+++ b/include/drm/drm_modeset_helper.h
@@ -26,6 +26,7 @@
 struct drm_crtc;
 struct drm_crtc_funcs;
 struct drm_device;
+struct drm_format_info;
 struct drm_framebuffer;
 struct drm_mode_fb_cmd2;
 
@@ -33,6 +34,7 @@ void drm_helper_move_panel_connectors_to_head(struct drm_device *);
 
 void drm_helper_mode_fill_fb_struct(struct drm_device *dev,
 				    struct drm_framebuffer *fb,
+				    const struct drm_format_info *info,
 				    const struct drm_mode_fb_cmd2 *mode_cmd);
 
 int drm_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
-- 
2.49.0


