Return-Path: <linux-arm-msm+bounces-103951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMXbJWp052lb9AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 14:58:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE1843B014
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 14:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EEE35300E2BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043833CF685;
	Tue, 21 Apr 2026 12:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O9RWdFUj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iTDmtsJS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O9RWdFUj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iTDmtsJS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8483C457D
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 12:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776776275; cv=none; b=oNcuFbmizepZcQCPUFssksrawEoR3RawYwGVhasMFjZACK5SoucCk6vzJaORVPBtQPtcZ3Z2ypH6nIeIPkAC6wN/re4ZWetUw2HsoGRwYUKIpdl/3q2/pRQtVIPalPm5sHRavxTfJrGiyCPUOxkX83xgoIKEiZRZGMdIRCwjO20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776776275; c=relaxed/simple;
	bh=5/tWpKJybJDQOmjIrHvDrS0XSBS3LJ5uQV7UGIvSkmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pc8WsxMLF48Y+X7TE3FA2RtaDmL3LmtiCdcWD6/JmbA7iVnPTRShA3O7I68PqPFdU7dUhTIhSQle39EGSwdh2Kng1v82K7LkxrKNaH5k7tYBl10GfFw2fG9DNnI8KjAFtW74AyMLMk6CAKoZlUQi3HcSE/AokgZ7JRjPhqV4MaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O9RWdFUj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iTDmtsJS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O9RWdFUj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iTDmtsJS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C99C96A8F0;
	Tue, 21 Apr 2026 12:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776776261; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kZt0ydHttYtd0M1sWWj1Zg9jRiEQBNIJ16JlYRlATYM=;
	b=O9RWdFUjG7yZlEVJrWc+2Zz4OBJC+str5VWuHWw01HXyVxyvVgJHWs8hdx1vEGYwg5+EA+
	vAP3jPA7loggWw78qdTsfkR9JA1Mto6a7xOJft2CfKOiSuXhnXc04HQOTKiZ1RSMw9rAGB
	vdAb/6dDhB00/NN3I8qt+CwWubbUEx4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776776261;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kZt0ydHttYtd0M1sWWj1Zg9jRiEQBNIJ16JlYRlATYM=;
	b=iTDmtsJSMWL5iu6bHri1vhqrCUAbgMpcmUjLk/IJoqD4DfryPbutpIeewj5n6vUYBKLSC/
	AX6sBUxJ2RQ0jHBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776776261; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kZt0ydHttYtd0M1sWWj1Zg9jRiEQBNIJ16JlYRlATYM=;
	b=O9RWdFUjG7yZlEVJrWc+2Zz4OBJC+str5VWuHWw01HXyVxyvVgJHWs8hdx1vEGYwg5+EA+
	vAP3jPA7loggWw78qdTsfkR9JA1Mto6a7xOJft2CfKOiSuXhnXc04HQOTKiZ1RSMw9rAGB
	vdAb/6dDhB00/NN3I8qt+CwWubbUEx4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776776261;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kZt0ydHttYtd0M1sWWj1Zg9jRiEQBNIJ16JlYRlATYM=;
	b=iTDmtsJSMWL5iu6bHri1vhqrCUAbgMpcmUjLk/IJoqD4DfryPbutpIeewj5n6vUYBKLSC/
	AX6sBUxJ2RQ0jHBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 73187593AF;
	Tue, 21 Apr 2026 12:57:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GC6pGkV052labwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 21 Apr 2026 12:57:41 +0000
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
Subject: [PATCH 5/6] drm/msm: fbdev: Use a DRM client buffer
Date: Tue, 21 Apr 2026 14:51:18 +0200
Message-ID: <20260421125733.209568-6-tzimmermann@suse.de>
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
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-103951-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: 6EE1843B014
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace the internal DRM framebuffer with a DRM client buffer. The
client buffer allocates the DRM framebuffer on a file and also uses
GEM object handles via the regular ADDFB2 interfaces.

Using client-buffer interfaces unifies framebuffer allocation for
DRM clients in user space and msm's internal fbdev emulation. It
also simplifies the clean-up side of the fbdev emulation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/msm_fbdev.c | 55 +++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index 5532c5779f17..f14db46aa51e 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -41,17 +41,15 @@ static int msm_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
 static void msm_fbdev_fb_destroy(struct fb_info *info)
 {
 	struct drm_fb_helper *helper = (struct drm_fb_helper *)info->par;
-	struct drm_framebuffer *fb = helper->fb;
-	struct drm_gem_object *bo = msm_framebuffer_bo(fb, 0);
+	struct drm_gem_object *bo = msm_framebuffer_bo(helper->fb, 0);
 
 	DBG();
 
 	drm_fb_helper_fini(helper);
 
-	/* this will free the backing object */
 	msm_gem_put_vaddr(bo);
-	drm_framebuffer_remove(fb);
 
+	drm_client_buffer_delete(helper->buffer);
 	drm_client_release(&helper->client);
 }
 
@@ -90,15 +88,16 @@ static const struct drm_fb_helper_funcs msm_fbdev_helper_funcs = {
 int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 				 struct drm_fb_helper_surface_size *sizes)
 {
-	struct drm_device *dev = helper->dev;
+	struct drm_client_dev *client = &helper->client;
+	struct drm_device *dev = client->dev;
+	struct drm_file *file = client->file;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct fb_info *fbi = helper->info;
-	struct drm_mode_fb_cmd2 mode_cmd = { };
-	struct drm_framebuffer *fb = NULL;
 	const struct drm_format_info *format;
-	u32 fourcc, pitch;
+	u32 fourcc, pitch, handle;
 	u64 size;
 	struct drm_gem_object *bo;
+	struct drm_client_buffer *buffer;
 	uint64_t paddr;
 	int ret;
 
@@ -127,16 +126,15 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 
 	msm_gem_object_set_name(bo, "stolenfb");
 
-	mode_cmd.pixel_format = fourcc;
-	mode_cmd.width = sizes->surface_width;
-	mode_cmd.height = sizes->surface_height;
-	mode_cmd.pitches[0] = pitch;
-
-	fb = msm_framebuffer_init(dev, format, &mode_cmd, &bo);
-	if (IS_ERR(fb)) {
-		drm_err(dev, "failed to allocate fb\n");
-		ret = PTR_ERR(fb);
+	ret = drm_gem_handle_create(file, bo, &handle);
+	if (ret)
 		goto err_drm_gem_object_put;
+
+	buffer = drm_client_buffer_create(client, sizes->surface_width, sizes->surface_height,
+					  fourcc, handle, pitch);
+	if (IS_ERR(buffer)) {
+		ret = PTR_ERR(buffer);
+		goto err_drm_gem_handle_delete;
 	}
 
 	/*
@@ -147,13 +145,14 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 	ret = msm_gem_get_and_pin_iova(bo, priv->kms->vm, &paddr);
 	if (ret) {
 		drm_err(dev, "failed to get buffer obj iova: %d\n", ret);
-		goto err_drm_framebuffer_remove;
+		goto err_drm_client_buffer_delete;
 	}
 
 	DBG("fbi=%p, dev=%p", fbi, dev);
 
 	helper->funcs = &msm_fbdev_helper_funcs;
-	helper->fb = fb;
+	helper->buffer = buffer;
+	helper->fb = buffer->fb;
 
 	fbi->fbops = &msm_fb_ops;
 
@@ -162,19 +161,29 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 	fbi->screen_buffer = msm_gem_get_vaddr(bo);
 	if (IS_ERR(fbi->screen_buffer)) {
 		ret = PTR_ERR(fbi->screen_buffer);
-		goto err_drm_framebuffer_remove;
+		goto err_msm_gem_put_vaddr;
 	}
 	fbi->screen_size = bo->size;
 	fbi->fix.smem_start = paddr;
 	fbi->fix.smem_len = bo->size;
 
 	DBG("par=%p, %dx%d", fbi->par, fbi->var.xres, fbi->var.yres);
-	DBG("allocated %dx%d fb", fb->width, fb->height);
+	DBG("allocated %dx%d fb", buffer->fb->width, buffer->fb->height);
+
+	/* The handle is only needed for creating the framebuffer. */
+	drm_gem_handle_delete(file, handle);
+
+	/* The framebuffer still holds a reference on the GEM object. */
+	drm_gem_object_put(bo);
 
 	return 0;
 
-err_drm_framebuffer_remove:
-	drm_framebuffer_remove(fb);
+err_msm_gem_put_vaddr:
+	msm_gem_put_vaddr(bo);
+err_drm_client_buffer_delete:
+	drm_client_buffer_delete(buffer);
+err_drm_gem_handle_delete:
+	drm_gem_handle_delete(file, handle);
 err_drm_gem_object_put:
 	drm_gem_object_put(bo);
 	return ret;
-- 
2.53.0


