Return-Path: <linux-arm-msm+bounces-103949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNkSA3h052ke8AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 14:58:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7219C43B03C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 14:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6DCB130358A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF4C33D330C;
	Tue, 21 Apr 2026 12:57:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C513BD653
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 12:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776776269; cv=none; b=bPiAkuycHrBec83c9NxoOlx+ajNCN1G4A5YUScDOziWOPo1Ygk0D9y8ugYivgYVN7R8XCkKZP8gPlhRxWrDwpbf98fONNN4JtJvk1P2RaYSV7T0ZPeITgx43AfZGfzfKoohVINRA/rIer3HR8fcLJndXo1o4vnZQj6Gi/ZwMbkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776776269; c=relaxed/simple;
	bh=xC2taM8XGOEYODFz96Du8NFMP/E/mKjhQh85r3gpwe0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ot/kiqYM3zd4RMpciMHP32IHgVwiqmswj4Oh/UpsVhbzm1TXGdwzaJR51M/1m9cJn0ZJs6N7cESrwI3aoKTgV9/zud8DK6JVwsYGh0u2XyZZHVe6Q9TTRJhy+UcHICrcz54PcfhsjIwr1HBuG8wDY9WvATfUp1yfGq1HU3WQ5Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6B82B6A8EF;
	Tue, 21 Apr 2026 12:57:41 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1358C593AF;
	Tue, 21 Apr 2026 12:57:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iMdNA0V052labwAAD6G6ig
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
Subject: [PATCH 4/6] drm/msm: fbdev: Calculate buffer geometry with format helpers
Date: Tue, 21 Apr 2026 14:51:17 +0200
Message-ID: <20260421125733.209568-5-tzimmermann@suse.de>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[suse.de : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-103949-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,suse.de:mid,suse.de:email]
X-Rspamd-Queue-Id: 7219C43B03C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace the geometry and size calculation in msm's fbdev emulation
with DRM format helpers. This consists of a 4CC lookup from the fbdev
parameters, format lookup, pitch calculation and size calculation.
Then allocate the GEM buffer object for the framebuffer memory from
the calculated size.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/msm_drv.h   |  7 -------
 drivers/gpu/drm/msm/msm_fbdev.c | 26 ++++++++++++--------------
 2 files changed, 12 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index b3173fa4d222..00c50d7437d6 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -509,13 +509,6 @@ void msm_hrtimer_work_init(struct msm_hrtimer_work *work,
 #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
 #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
 
-static inline int align_pitch(int width, int bpp)
-{
-	int bytespp = (bpp + 7) / 8;
-	/* adreno needs pitch aligned to 32 pixels: */
-	return bytespp * ALIGN(width, 32);
-}
-
 /* for the generated headers: */
 #define INVALID_IDX(idx) ({BUG(); 0;})
 #define fui(x)                ({BUG(); 0;})
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index 1eb0368a6d07..5532c5779f17 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -95,23 +95,25 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 	struct fb_info *fbi = helper->info;
 	struct drm_mode_fb_cmd2 mode_cmd = { };
 	struct drm_framebuffer *fb = NULL;
+	const struct drm_format_info *format;
+	u32 fourcc, pitch;
+	u64 size;
 	struct drm_gem_object *bo;
 	uint64_t paddr;
-	uint32_t format;
-	int ret, pitch;
-	int size;
-
-	format = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
+	int ret;
 
 	DBG("create fbdev: %dx%d@%d (%dx%d)", sizes->surface_width,
 			sizes->surface_height, sizes->surface_bpp,
 			sizes->fb_width, sizes->fb_height);
 
-	pitch = align_pitch(sizes->surface_width, sizes->surface_bpp);
+	fourcc = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
+	format = drm_get_format_info(dev, fourcc, DRM_FORMAT_MOD_LINEAR);
+	/* adreno needs pitch aligned to 32 pixels: */
+	pitch = drm_format_info_min_pitch(format, 0, ALIGN(sizes->surface_width, 32));
+	size = ALIGN(pitch * sizes->surface_height, PAGE_SIZE);
 
 	/* allocate backing bo */
-	size = pitch * sizes->surface_height;
-	DBG("allocating %d bytes for fb %d", size, dev->primary->index);
+	DBG("allocating %llu bytes for fb %d", size, dev->primary->index);
 	bo = msm_gem_new(dev, size, MSM_BO_SCANOUT | MSM_BO_WC | MSM_BO_STOLEN);
 	if (IS_ERR(bo)) {
 		drm_warn(dev, "could not allocate stolen bo\n");
@@ -125,16 +127,12 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 
 	msm_gem_object_set_name(bo, "stolenfb");
 
-	mode_cmd.pixel_format = format;
+	mode_cmd.pixel_format = fourcc;
 	mode_cmd.width = sizes->surface_width;
 	mode_cmd.height = sizes->surface_height;
 	mode_cmd.pitches[0] = pitch;
-	mode_cmd.modifier[0] = DRM_FORMAT_MOD_LINEAR;
 
-	fb = msm_framebuffer_init(dev,
-				  drm_get_format_info(dev, mode_cmd.pixel_format,
-						      mode_cmd.modifier[0]),
-				  &mode_cmd, &bo);
+	fb = msm_framebuffer_init(dev, format, &mode_cmd, &bo);
 	if (IS_ERR(fb)) {
 		drm_err(dev, "failed to allocate fb\n");
 		ret = PTR_ERR(fb);
-- 
2.53.0


