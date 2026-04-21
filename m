Return-Path: <linux-arm-msm+bounces-103948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLuxE2R052lc9AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 14:58:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E27C43B006
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 14:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1B7A030058EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04FA13D091D;
	Tue, 21 Apr 2026 12:57:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B593CF685
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 12:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776776267; cv=none; b=eNB0AeTAx+oM4IitcC2zkidxZjbWO6Ad3hli+Z+u86AgY8/8VvD24sivHrdmRdJSH4giYqIpvFFlyeRjMj1QYKak26aJSop5/+Yf57zY/SB3KaqRJ7WlKD5P2m9sego0sOmI4V0hmxRxw9OUSTGJFVHTVQnYTChqXSHKGmYXLak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776776267; c=relaxed/simple;
	bh=5l8GCXcG7iL6ryBOtPAE1gN+0Omqp9qhIILiWWG2vyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nd9DM9SeCut+8Ei8yG+6iMI8RRkWAiX3HD8dp9RGuZ1N1V8bAa1BenSq5xeTnPzuMcOtLA81ad7TjfXHtrMaTo08ma9EfDXPDD+ISXwxHmDcJuq+yazM9tisgOgj/TZbFdzTG9tQf+wLf4UOEv7LXTWtiI9s/ohxGtyQjo4GjEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 42E645BCEE;
	Tue, 21 Apr 2026 12:57:40 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E54B4593B0;
	Tue, 21 Apr 2026 12:57:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8K3LNkN052labwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 21 Apr 2026 12:57:39 +0000
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
Subject: [PATCH 1/6] drm/msm: Do not declare msm_framebuffer_init() as static
Date: Tue, 21 Apr 2026 14:51:14 +0200
Message-ID: <20260421125733.209568-2-tzimmermann@suse.de>
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
X-Spam-Score: -4.00
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[suse.de : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-103948-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,suse.de:mid,suse.de:email]
X-Rspamd-Queue-Id: 2E27C43B006
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Declare msm_framebuffer_init() in msm_drv.h and remove the static
qualifier. The function will be required in msm_fbdev.c after inlining
msm_alloc_stolen_fb().

Also move msm_framebuffer_init() before msm_framebuffer_create(), so
that it can later be made static again. Prepares msm's fbdev emulation
for using client buffers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/msm_drv.h |  4 ++
 drivers/gpu/drm/msm/msm_fb.c  | 72 +++++++++++++++++------------------
 2 files changed, 39 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 6d847d593f1a..efc901c9d8c2 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -259,6 +259,10 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb);
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane);
 struct drm_gem_object *msm_framebuffer_bo(struct drm_framebuffer *fb, int plane);
 const struct msm_format *msm_framebuffer_format(struct drm_framebuffer *fb);
+struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
+					     const struct drm_format_info *info,
+					     const struct drm_mode_fb_cmd2 *mode_cmd,
+					     struct drm_gem_object **bos);
 struct drm_framebuffer *msm_framebuffer_create(struct drm_device *dev,
 		struct drm_file *file, const struct drm_format_info *info,
 		const struct drm_mode_fb_cmd2 *mode_cmd);
diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 9b681e144c07..d7523a0a866a 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -29,10 +29,6 @@ struct msm_framebuffer {
 };
 #define to_msm_framebuffer(x) container_of(x, struct msm_framebuffer, base)
 
-static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
-		const struct drm_format_info *info,
-		const struct drm_mode_fb_cmd2 *mode_cmd, struct drm_gem_object **bos);
-
 static int msm_framebuffer_dirtyfb(struct drm_framebuffer *fb,
 				   struct drm_file *file_priv, unsigned int flags,
 				   unsigned int color, struct drm_clip_rect *clips,
@@ -139,39 +135,10 @@ const struct msm_format *msm_framebuffer_format(struct drm_framebuffer *fb)
 	return msm_fb->format;
 }
 
-struct drm_framebuffer *msm_framebuffer_create(struct drm_device *dev,
-		struct drm_file *file, const struct drm_format_info *info,
-		const struct drm_mode_fb_cmd2 *mode_cmd)
-{
-	struct drm_gem_object *bos[4] = {0};
-	struct drm_framebuffer *fb;
-	int ret, i, n = info->num_planes;
-
-	for (i = 0; i < n; i++) {
-		bos[i] = drm_gem_object_lookup(file, mode_cmd->handles[i]);
-		if (!bos[i]) {
-			ret = -ENXIO;
-			goto out_unref;
-		}
-	}
-
-	fb = msm_framebuffer_init(dev, info, mode_cmd, bos);
-	if (IS_ERR(fb)) {
-		ret = PTR_ERR(fb);
-		goto out_unref;
-	}
-
-	return fb;
-
-out_unref:
-	for (i = 0; i < n; i++)
-		drm_gem_object_put(bos[i]);
-	return ERR_PTR(ret);
-}
-
-static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
-		const struct drm_format_info *info,
-		const struct drm_mode_fb_cmd2 *mode_cmd, struct drm_gem_object **bos)
+struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
+					     const struct drm_format_info *info,
+					     const struct drm_mode_fb_cmd2 *mode_cmd,
+					     struct drm_gem_object **bos)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
@@ -251,6 +218,37 @@ static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
 	return ERR_PTR(ret);
 }
 
+struct drm_framebuffer *msm_framebuffer_create(struct drm_device *dev,
+					       struct drm_file *file,
+					       const struct drm_format_info *info,
+					       const struct drm_mode_fb_cmd2 *mode_cmd)
+{
+	struct drm_gem_object *bos[4] = {0};
+	struct drm_framebuffer *fb;
+	int ret, i, n = info->num_planes;
+
+	for (i = 0; i < n; i++) {
+		bos[i] = drm_gem_object_lookup(file, mode_cmd->handles[i]);
+		if (!bos[i]) {
+			ret = -ENXIO;
+			goto out_unref;
+		}
+	}
+
+	fb = msm_framebuffer_init(dev, info, mode_cmd, bos);
+	if (IS_ERR(fb)) {
+		ret = PTR_ERR(fb);
+		goto out_unref;
+	}
+
+	return fb;
+
+out_unref:
+	for (i = 0; i < n; i++)
+		drm_gem_object_put(bos[i]);
+	return ERR_PTR(ret);
+}
+
 struct drm_framebuffer *
 msm_alloc_stolen_fb(struct drm_device *dev, int w, int h, int p, uint32_t format)
 {
-- 
2.53.0


