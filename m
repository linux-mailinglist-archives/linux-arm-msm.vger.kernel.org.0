Return-Path: <linux-arm-msm+bounces-12684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC29B868F43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 12:39:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BEBC1C22679
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 11:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B89B313A89B;
	Tue, 27 Feb 2024 11:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NClLbxew";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UMlrp6wx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NClLbxew";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UMlrp6wx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE7213A259
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 11:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709033949; cv=none; b=cyAx/rt04HA71oZ3/y2Ug4Mx5tkZjH6zhPlXXo5YZgMjWVWflGV1K6d+ZqipjuRZnTkcKPqR7heOaQMJBl8qXwcHSITHE7YL6izZ9qo43Tt8Olvl3A6vWHmlalrdTSuVNi2riLhr9XjaO/zfaR8u7OfYrUGX3Kpev7UFjZ3Uudo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709033949; c=relaxed/simple;
	bh=UoQTr9W0psE+CrFmnHWFv70VzJDipBzdpsjGllWhZBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sz8jDwXVBADKbVQt31igUpWvS9fpow4PFT3cNg3ox+8psUjf1g06Ml6mZDGb/FbldFH8GG3AelvGnLaJR9D9i8qTtde99dF/kPApAeA7MHTJqfZ8xKfuFekBhOAuseg9sD9fRcGGS2PNRtGziuq+R9i595vZrQzXeEU48682y6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NClLbxew; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UMlrp6wx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NClLbxew; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UMlrp6wx; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E12A52272E;
	Tue, 27 Feb 2024 11:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709033945; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zL+yqb29+3ssshZjdkLTC/VTnqfbvpkenOncCGrQF88=;
	b=NClLbxewVkMQXBqyzB4fc3YvQhfmZIkzIZ1vWhsBp2KO2Gg+dL3+rdBKXb/dQ3NrVTRukw
	cO4xEHpMsCK5v30IyEGSA0jo2ixmzLpRw8Rw1CyVQDwcj3r/OoCQVpWeI3aFV4P184fVSO
	jdLvWebid2+W40tkRg/lBPQv5+7dgPk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709033945;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zL+yqb29+3ssshZjdkLTC/VTnqfbvpkenOncCGrQF88=;
	b=UMlrp6wxdvkLkh2GBGRABfR++b7UyEgbcC8pUmjqmDVYfEtMqejgH0SmtahVWBbuF/EWyo
	lI9mN/PqfGBHTfAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709033945; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zL+yqb29+3ssshZjdkLTC/VTnqfbvpkenOncCGrQF88=;
	b=NClLbxewVkMQXBqyzB4fc3YvQhfmZIkzIZ1vWhsBp2KO2Gg+dL3+rdBKXb/dQ3NrVTRukw
	cO4xEHpMsCK5v30IyEGSA0jo2ixmzLpRw8Rw1CyVQDwcj3r/OoCQVpWeI3aFV4P184fVSO
	jdLvWebid2+W40tkRg/lBPQv5+7dgPk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709033945;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zL+yqb29+3ssshZjdkLTC/VTnqfbvpkenOncCGrQF88=;
	b=UMlrp6wxdvkLkh2GBGRABfR++b7UyEgbcC8pUmjqmDVYfEtMqejgH0SmtahVWBbuF/EWyo
	lI9mN/PqfGBHTfAg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 210DA13ABC;
	Tue, 27 Feb 2024 11:39:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id GCmQBtnJ3WVMUQAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Tue, 27 Feb 2024 11:39:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	christian.koenig@amd.com,
	sumit.semwal@linaro.org,
	dmitry.osipenko@collabora.com,
	robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	suijingfeng@loongson.cn,
	kherbst@redhat.com,
	lyude@redhat.com,
	dakr@redhat.com,
	airlied@redhat.com,
	kraxel@redhat.com,
	alexander.deucher@amd.com,
	Xinhui.Pan@amd.com,
	zack.rusin@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 12/13] drm/gem-vram: Do not pin buffer objects for vmap
Date: Tue, 27 Feb 2024 11:14:59 +0100
Message-ID: <20240227113853.8464-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240227113853.8464-1-tzimmermann@suse.de>
References: <20240227113853.8464-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.70
X-Spamd-Result: default: False [0.70 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 R_RATELIMIT(0.00)[to_ip_from(RLqs7qcp4g99ribr8z1n9xsc8a)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-0.997];
	 RCPT_COUNT_TWELVE(0.00)[30];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,amd.com,linaro.org,collabora.com,quicinc.com,poorly.run,somainline.org,loongson.cn,redhat.com,broadcom.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

Pin and vmap are distinct operations. Do not perform a pin as part
of the vmap call. This used to be necessary to keep the fbdev buffer
in place while it is being updated. Fbdev emulation has meanwhile
been fixed to lock the buffer correctly. Same for vunmap.

For refactoring the code, remove the pin calls from the helper's
vmap implementation in drm_gem_vram_vmap() and inline the call to
drm_gem_vram_kmap_locked(). This gives a vmap helper that only
maps the buffer object's memory pages without pinning or locking.
Do a similar refactoring for vunmap.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 90 ++++++++++-----------------
 1 file changed, 32 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 5a16b3e0a4134..45650b9b3de91 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -368,11 +368,28 @@ int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
 }
 EXPORT_SYMBOL(drm_gem_vram_unpin);
 
-static int drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
-				    struct iosys_map *map)
+/**
+ * drm_gem_vram_vmap() - Pins and maps a GEM VRAM object into kernel address
+ *                       space
+ * @gbo: The GEM VRAM object to map
+ * @map: Returns the kernel virtual address of the VRAM GEM object's backing
+ *       store.
+ *
+ * The vmap function pins a GEM VRAM object to its current location, either
+ * system or video memory, and maps its buffer into kernel address space.
+ * As pinned object cannot be relocated, you should avoid pinning objects
+ * permanently. Call drm_gem_vram_vunmap() with the returned address to
+ * unmap and unpin the GEM VRAM object.
+ *
+ * Returns:
+ * 0 on success, or a negative error code otherwise.
+ */
+int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct iosys_map *map)
 {
 	int ret;
 
+	dma_resv_assert_held(gbo->bo.base.resv);
+
 	if (gbo->vmap_use_count > 0)
 		goto out;
 
@@ -393,12 +410,23 @@ static int drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
 
 	return 0;
 }
+EXPORT_SYMBOL(drm_gem_vram_vmap);
 
-static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo,
-				       struct iosys_map *map)
+/**
+ * drm_gem_vram_vunmap() - Unmaps and unpins a GEM VRAM object
+ * @gbo: The GEM VRAM object to unmap
+ * @map: Kernel virtual address where the VRAM GEM object was mapped
+ *
+ * A call to drm_gem_vram_vunmap() unmaps and unpins a GEM VRAM buffer. See
+ * the documentation for drm_gem_vram_vmap() for more information.
+ */
+void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo,
+			 struct iosys_map *map)
 {
 	struct drm_device *dev = gbo->bo.base.dev;
 
+	dma_resv_assert_held(gbo->bo.base.resv);
+
 	if (drm_WARN_ON_ONCE(dev, !gbo->vmap_use_count))
 		return;
 
@@ -415,60 +443,6 @@ static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo,
 	 * from memory. See drm_gem_vram_bo_driver_move_notify().
 	 */
 }
-
-/**
- * drm_gem_vram_vmap() - Pins and maps a GEM VRAM object into kernel address
- *                       space
- * @gbo: The GEM VRAM object to map
- * @map: Returns the kernel virtual address of the VRAM GEM object's backing
- *       store.
- *
- * The vmap function pins a GEM VRAM object to its current location, either
- * system or video memory, and maps its buffer into kernel address space.
- * As pinned object cannot be relocated, you should avoid pinning objects
- * permanently. Call drm_gem_vram_vunmap() with the returned address to
- * unmap and unpin the GEM VRAM object.
- *
- * Returns:
- * 0 on success, or a negative error code otherwise.
- */
-int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct iosys_map *map)
-{
-	int ret;
-
-	dma_resv_assert_held(gbo->bo.base.resv);
-
-	ret = drm_gem_vram_pin_locked(gbo, 0);
-	if (ret)
-		return ret;
-	ret = drm_gem_vram_kmap_locked(gbo, map);
-	if (ret)
-		goto err_drm_gem_vram_unpin_locked;
-
-	return 0;
-
-err_drm_gem_vram_unpin_locked:
-	drm_gem_vram_unpin_locked(gbo);
-	return ret;
-}
-EXPORT_SYMBOL(drm_gem_vram_vmap);
-
-/**
- * drm_gem_vram_vunmap() - Unmaps and unpins a GEM VRAM object
- * @gbo: The GEM VRAM object to unmap
- * @map: Kernel virtual address where the VRAM GEM object was mapped
- *
- * A call to drm_gem_vram_vunmap() unmaps and unpins a GEM VRAM buffer. See
- * the documentation for drm_gem_vram_vmap() for more information.
- */
-void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo,
-			 struct iosys_map *map)
-{
-	dma_resv_assert_held(gbo->bo.base.resv);
-
-	drm_gem_vram_kunmap_locked(gbo, map);
-	drm_gem_vram_unpin_locked(gbo);
-}
 EXPORT_SYMBOL(drm_gem_vram_vunmap);
 
 /**
-- 
2.43.2


