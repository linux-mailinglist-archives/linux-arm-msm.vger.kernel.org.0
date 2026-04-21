Return-Path: <linux-arm-msm+bounces-103947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uL4YOWJ052ke8AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 14:58:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD7443AFFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 14:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2850C3004926
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E863C457D;
	Tue, 21 Apr 2026 12:57:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623F03CF685
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 12:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776776264; cv=none; b=g5OPwY7y0x2f0PzY7fkesEx2d6jjIaQRVnT8IpgujMTJ59GWmhSAYFZoX9ONoEQczoTrs3NCnUAFniaPLpMT24Bz7oFTt2TTE5wyFbkdKEUBRaUM9lKlNYG4dcAapaAQk9KIMrheCq82tHgJ1AYUdZ03aDn8uEvbZEfEFRXlRWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776776264; c=relaxed/simple;
	bh=cUXHddhOyCrN51AONjXNFQ/BKu2nB0dSkmadGGOVKww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CvLPOvzNuVrI7qitJX51RMu2AjsNncMfKrzQqBqej//eVLiiDzcU1YfpgtmhAxUxH3iaqooHcpRi6qE3Brb2RQEit/NqaOj3v2IWw4107yzrDcxXFsQdner7tqyUbAOEQWenxdB8475KdCrEB6FcHg+XPaSsEFyedjDK19pLNho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A1F436A896;
	Tue, 21 Apr 2026 12:57:40 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4A0A4593AF;
	Tue, 21 Apr 2026 12:57:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8ISnEER052labwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 21 Apr 2026 12:57:40 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/6] drm/msm: fbdev: Inline msm_alloc_stolen_fb()
Date: Tue, 21 Apr 2026 14:51:15 +0200
Message-ID: <20260421125733.209568-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421125733.209568-1-tzimmermann@suse.de>
References: <20260421125733.209568-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[suse.de : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-103947-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,suse.de:mid,suse.de:email]
X-Rspamd-Queue-Id: 8FD7443AFFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Inline msm_alloc_stolen_fb() into its only caller. This is necessary
for converting fbdev emulation to use client buffers.

There are some minor changes:

- Handle errors for the non-stolen BO in the respective branch.

- Fill mode_cmd right before using it with msm_framebuffer_init(). Both
will later be replaced with client-buffer interfaces.

- Set the modifier[0] to DRM_FORMAT_MOD_LINEAR. No functional change.

- Integrate the error handling with the existing clean-up.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/msm_drv.h   |  2 --
 drivers/gpu/drm/msm/msm_fb.c    | 46 ---------------------------------
 drivers/gpu/drm/msm/msm_fbdev.c | 44 +++++++++++++++++++++++++------
 3 files changed, 36 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index efc901c9d8c2..b3173fa4d222 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -266,8 +266,6 @@ struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
 struct drm_framebuffer *msm_framebuffer_create(struct drm_device *dev,
 		struct drm_file *file, const struct drm_format_info *info,
 		const struct drm_mode_fb_cmd2 *mode_cmd);
-struct drm_framebuffer * msm_alloc_stolen_fb(struct drm_device *dev,
-		int w, int h, int p, uint32_t format);
 
 #ifdef CONFIG_DRM_MSM_KMS_FBDEV
 int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index d7523a0a866a..dec550e6cf75 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -6,7 +6,6 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_damage_helper.h>
-#include <drm/drm_file.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -248,48 +247,3 @@ struct drm_framebuffer *msm_framebuffer_create(struct drm_device *dev,
 		drm_gem_object_put(bos[i]);
 	return ERR_PTR(ret);
 }
-
-struct drm_framebuffer *
-msm_alloc_stolen_fb(struct drm_device *dev, int w, int h, int p, uint32_t format)
-{
-	struct drm_mode_fb_cmd2 mode_cmd = {
-		.pixel_format = format,
-		.width = w,
-		.height = h,
-		.pitches = { p },
-	};
-	struct drm_gem_object *bo;
-	struct drm_framebuffer *fb;
-	int size;
-
-	/* allocate backing bo */
-	size = mode_cmd.pitches[0] * mode_cmd.height;
-	DBG("allocating %d bytes for fb %d", size, dev->primary->index);
-	bo = msm_gem_new(dev, size, MSM_BO_SCANOUT | MSM_BO_WC | MSM_BO_STOLEN);
-	if (IS_ERR(bo)) {
-		dev_warn(dev->dev, "could not allocate stolen bo\n");
-		/* try regular bo: */
-		bo = msm_gem_new(dev, size, MSM_BO_SCANOUT | MSM_BO_WC);
-	}
-	if (IS_ERR(bo)) {
-		DRM_DEV_ERROR(dev->dev, "failed to allocate buffer object\n");
-		return ERR_CAST(bo);
-	}
-
-	msm_gem_object_set_name(bo, "stolenfb");
-
-	fb = msm_framebuffer_init(dev,
-				  drm_get_format_info(dev, mode_cmd.pixel_format,
-						      mode_cmd.modifier[0]),
-				  &mode_cmd, &bo);
-	if (IS_ERR(fb)) {
-		DRM_DEV_ERROR(dev->dev, "failed to allocate fb\n");
-		/* note: if fb creation failed, we can't rely on fb destroy
-		 * to unref the bo:
-		 */
-		drm_gem_object_put(bo);
-		return ERR_CAST(fb);
-	}
-
-	return fb;
-}
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index fd19995b12b5..a507f1de0c5d 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -9,6 +9,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_helper.h>
+#include <drm/drm_file.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_prime.h>
@@ -92,11 +93,13 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 	struct drm_device *dev = helper->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct fb_info *fbi = helper->info;
+	struct drm_mode_fb_cmd2 mode_cmd = { };
 	struct drm_framebuffer *fb = NULL;
 	struct drm_gem_object *bo;
 	uint64_t paddr;
 	uint32_t format;
 	int ret, pitch;
+	int size;
 
 	format = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
 
@@ -105,16 +108,39 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 			sizes->fb_width, sizes->fb_height);
 
 	pitch = align_pitch(sizes->surface_width, sizes->surface_bpp);
-	fb = msm_alloc_stolen_fb(dev, sizes->surface_width,
-			sizes->surface_height, pitch, format);
 
+	/* allocate backing bo */
+	size = pitch * sizes->surface_height;
+	DBG("allocating %d bytes for fb %d", size, dev->primary->index);
+	bo = msm_gem_new(dev, size, MSM_BO_SCANOUT | MSM_BO_WC | MSM_BO_STOLEN);
+	if (IS_ERR(bo)) {
+		dev_warn(dev->dev, "could not allocate stolen bo\n");
+		/* try regular bo: */
+		bo = msm_gem_new(dev, size, MSM_BO_SCANOUT | MSM_BO_WC);
+		if (IS_ERR(bo)) {
+			DRM_DEV_ERROR(dev->dev, "failed to allocate buffer object\n");
+			return PTR_ERR(bo);
+		}
+	}
+
+	msm_gem_object_set_name(bo, "stolenfb");
+
+	mode_cmd.pixel_format = format;
+	mode_cmd.width = sizes->surface_width;
+	mode_cmd.height = sizes->surface_height;
+	mode_cmd.pitches[0] = pitch;
+	mode_cmd.modifier[0] = DRM_FORMAT_MOD_LINEAR;
+
+	fb = msm_framebuffer_init(dev,
+				  drm_get_format_info(dev, mode_cmd.pixel_format,
+						      mode_cmd.modifier[0]),
+				  &mode_cmd, &bo);
 	if (IS_ERR(fb)) {
 		DRM_DEV_ERROR(dev->dev, "failed to allocate fb\n");
-		return PTR_ERR(fb);
+		ret = PTR_ERR(fb);
+		goto err_drm_gem_object_put;
 	}
 
-	bo = msm_framebuffer_bo(fb, 0);
-
 	/*
 	 * NOTE: if we can be guaranteed to be able to map buffer
 	 * in panic (ie. lock-safe, etc) we could avoid pinning the
@@ -123,7 +149,7 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 	ret = msm_gem_get_and_pin_iova(bo, priv->kms->vm, &paddr);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "failed to get buffer obj iova: %d\n", ret);
-		goto fail;
+		goto err_drm_framebuffer_remove;
 	}
 
 	DBG("fbi=%p, dev=%p", fbi, dev);
@@ -138,7 +164,7 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 	fbi->screen_buffer = msm_gem_get_vaddr(bo);
 	if (IS_ERR(fbi->screen_buffer)) {
 		ret = PTR_ERR(fbi->screen_buffer);
-		goto fail;
+		goto err_drm_framebuffer_remove;
 	}
 	fbi->screen_size = bo->size;
 	fbi->fix.smem_start = paddr;
@@ -149,7 +175,9 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 
 	return 0;
 
-fail:
+err_drm_framebuffer_remove:
 	drm_framebuffer_remove(fb);
+err_drm_gem_object_put:
+	drm_gem_object_put(bo);
 	return ret;
 }
-- 
2.53.0


