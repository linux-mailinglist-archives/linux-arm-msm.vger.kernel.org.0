Return-Path: <linux-arm-msm+bounces-113785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Me4+KvL8M2ojKQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 16:13:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 189D56A0D71
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 16:13:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=El387rzx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=penUGzap;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=El387rzx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=penUGzap;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113785-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113785-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=suse.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 52DE63013A4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 14:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B84563B4EAD;
	Thu, 18 Jun 2026 14:13:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D183ECBDA
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 14:12:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781791980; cv=none; b=tNeGT9u7m3Ho2ylAK3DXpC/V3ploKLnUb64QyZnFKLjukHzLdjCsHe9AjkXWkdvlJu149lVeJuC/hMcNl8o0y1ReDBqthM02Cg1b1yQYYaeOb184IO+n6yfIjpO2nu0mjWG72TRGfCwl/FI6EMje3vg3+lk50EAPYFOAMMhJ+6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781791980; c=relaxed/simple;
	bh=yfFd58+Iqkf8pTl2u9f/b9iA3W7asJBRrTXxed9on0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Swqwky8ERAUh+HKpATAjmIsmMYSesqQMfhReUKCOy1LydzcCGdIxARQD8AFY8w6cxHIIFxuExlg5P2zi2YK+fZDPfc5t8YZIkT9W7+4+gJwz86xrrqUvfNJ8GjNycyhZZFHUH2/WwKl1A6Dvnzu1MKDaUJ/h00xil4v3lYPh6gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=El387rzx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=penUGzap; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=El387rzx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=penUGzap; arc=none smtp.client-ip=195.135.223.130
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 207FC6D2A8;
	Thu, 18 Jun 2026 14:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781791977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qZIfui3gGR3fHLdXAWNaVoCwDDDZ3yTFHyLYSq1yEXo=;
	b=El387rzxm0zrkISTvrzimIhHsV4+VPH5wRJzd4b3iOwxKEV//jAjz/8M0fuOxmH9OkYXjK
	R2HaNBHw/Y82q/qOGZAqpPCz6WNX6ilsDYka8BAw4f9VsVzFbLls+w5a4t4vCyDu9bJQQ+
	K2nWowfpVN1Be/J9boDwZmkgQxAEo5w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781791977;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qZIfui3gGR3fHLdXAWNaVoCwDDDZ3yTFHyLYSq1yEXo=;
	b=penUGzap8TW05NJWvxOR/JPKazdSDnDVdPy0CU84cGotxrzmrmW/Zz8xTWl6f2WO6l6muR
	/OAgdapc9uNa+VAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781791977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qZIfui3gGR3fHLdXAWNaVoCwDDDZ3yTFHyLYSq1yEXo=;
	b=El387rzxm0zrkISTvrzimIhHsV4+VPH5wRJzd4b3iOwxKEV//jAjz/8M0fuOxmH9OkYXjK
	R2HaNBHw/Y82q/qOGZAqpPCz6WNX6ilsDYka8BAw4f9VsVzFbLls+w5a4t4vCyDu9bJQQ+
	K2nWowfpVN1Be/J9boDwZmkgQxAEo5w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781791977;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qZIfui3gGR3fHLdXAWNaVoCwDDDZ3yTFHyLYSq1yEXo=;
	b=penUGzap8TW05NJWvxOR/JPKazdSDnDVdPy0CU84cGotxrzmrmW/Zz8xTWl6f2WO6l6muR
	/OAgdapc9uNa+VAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BDBD3779AB;
	Thu, 18 Jun 2026 14:12:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OKcbLej8M2o8DQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 18 Jun 2026 14:12:56 +0000
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
Subject: [PATCH v2 1/6] drm/msm: Do not declare msm_framebuffer_init() as static
Date: Thu, 18 Jun 2026 16:11:32 +0200
Message-ID: <20260618141249.151338-2-tzimmermann@suse.de>
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
X-Spam-Level: 
X-Spam-Score: -2.80
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-113785-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:sashiko-reviews@lists.linux.dev,m:tzimmermann@suse.de,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,linux-arm-msm@vger.kernel.org];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,suse.de:from_mime,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 189D56A0D71

Declare msm_framebuffer_init() in msm_drv.h and remove the static
qualifier. The function will be required in msm_fbdev.c after inlining
msm_alloc_stolen_fb().

Also move msm_framebuffer_init() before msm_framebuffer_create(), so
that it can later be made static again. Prepares msm's fbdev emulation
for using client buffers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.h |  4 ++
 drivers/gpu/drm/msm/msm_fb.c  | 72 +++++++++++++++++------------------
 2 files changed, 39 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 3787db8770ad..7dccf0713b02 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -258,6 +258,10 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb);
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
2.54.0


