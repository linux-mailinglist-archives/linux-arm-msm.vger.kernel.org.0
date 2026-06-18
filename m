Return-Path: <linux-arm-msm+bounces-113791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bN8fMgH9M2o5KQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 16:13:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E876A0DAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 16:13:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fnrlSBI2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="OP/FOS4u";
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fnrlSBI2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="OP/FOS4u";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113791-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113791-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=suse.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D97C7300C0F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 14:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6193D3B2FC2;
	Thu, 18 Jun 2026 14:13:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6693DD51F
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 14:13:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781792000; cv=none; b=pFyEtvq09lUxweraQwB/uMYDYNXxXYSQNwwehypjpourhu9u9fuk0ESwq0DhjQ9eY6pdqtfbSb6ivzhjU4P9eVcv4aieDTvH9Hc+SoIlEp0zX8BIEpfSSQMwWdz2bCS18CWAya0v6Qft3dmclgO5MqM2BRTbf8+/46HEBrD/8K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781792000; c=relaxed/simple;
	bh=l9+M4G4Lo17GJ8kVy78HklvcgFOgOb101+w9hj/d3XA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XOpKZv4kOslkXD2cT6qJNCIX+eGsiu/uZUXk/80QjaWs9DAZsp6IxFQj4Y3UVggY6G8S2OTgwdwwXcrhCvzIuPI1pcKBqf/OWXOHQpuBlQ5csP3lIp1VEA+Yll7Jv4cKmn9BD9iRteUG8qPznlknP+kbo1aFIicFulvcsXoO+T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fnrlSBI2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OP/FOS4u; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fnrlSBI2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OP/FOS4u; arc=none smtp.client-ip=195.135.223.131
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A4E2775F74;
	Thu, 18 Jun 2026 14:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781791978; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vpzvf9WugZGu/Vi9s7nRlfWvRZvyImnZ8YVspSaHRkM=;
	b=fnrlSBI2PjVmMKG0mp904GaZt5zXjLM2gfQKJY8UPG62EreepnZ34B314XCIIJHxaXsZD8
	ClJo5qnMbvbQ1lq6ZvMzIMs3EhRKFxq9+lvvSY4SOJ2K9/5t9IoHcjQ991XIiKA2RlFyDN
	hyLzu+BDOTwW1k20JJuVYSiZuox48iw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781791978;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vpzvf9WugZGu/Vi9s7nRlfWvRZvyImnZ8YVspSaHRkM=;
	b=OP/FOS4uiy1BD2rFdR8wugz9gHdtdYAdZW1KrvUwPGQNINm53r7FrleWHm7NxcloreH3e4
	cW5Eo4ycRAhivnCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781791978; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vpzvf9WugZGu/Vi9s7nRlfWvRZvyImnZ8YVspSaHRkM=;
	b=fnrlSBI2PjVmMKG0mp904GaZt5zXjLM2gfQKJY8UPG62EreepnZ34B314XCIIJHxaXsZD8
	ClJo5qnMbvbQ1lq6ZvMzIMs3EhRKFxq9+lvvSY4SOJ2K9/5t9IoHcjQ991XIiKA2RlFyDN
	hyLzu+BDOTwW1k20JJuVYSiZuox48iw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781791978;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vpzvf9WugZGu/Vi9s7nRlfWvRZvyImnZ8YVspSaHRkM=;
	b=OP/FOS4uiy1BD2rFdR8wugz9gHdtdYAdZW1KrvUwPGQNINm53r7FrleWHm7NxcloreH3e4
	cW5Eo4ycRAhivnCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4D5D2779AB;
	Thu, 18 Jun 2026 14:12:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MKm1Eer8M2o8DQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 18 Jun 2026 14:12:58 +0000
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
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 5/6] drm/msm: fbdev: Use a DRM client buffer
Date: Thu, 18 Jun 2026 16:11:36 +0200
Message-ID: <20260618141249.151338-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618141249.151338-1-tzimmermann@suse.de>
References: <20260618141249.151338-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-113791-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:sashiko-reviews@lists.linux.dev,m:tzimmermann@suse.de,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,linux-arm-msm@vger.kernel.org];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,suse.de:dkim,suse.de:email,suse.de:mid,suse.de:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 67E876A0DAD

Replace the internal DRM framebuffer with a DRM client buffer. The
client buffer allocates the DRM framebuffer on a file and also uses
GEM object handles via the regular ADDFB2 interfaces.

Using client-buffer interfaces unifies framebuffer allocation for
DRM clients in user space and msm's internal fbdev emulation. It
also simplifies the clean-up side of the fbdev emulation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
2.54.0


