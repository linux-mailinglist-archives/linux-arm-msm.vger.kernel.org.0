Return-Path: <linux-arm-msm+bounces-44616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8563CA07AE1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 16:04:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88311188C13E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 15:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A6A221E0A8;
	Thu,  9 Jan 2025 15:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xBYc+uS4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3qpqAq2a";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xBYc+uS4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3qpqAq2a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB7921D59F;
	Thu,  9 Jan 2025 15:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736435004; cv=none; b=QgGIWCxiqXu+OWeBQnKlNgPUlSapen+0FDqR9vRXvZE87tG4EuD7q0tHmeS/gJRWKwC4u+euYks86a86fSIjmJB4xHoJv8bhWTvhOcf2TqKOmsphTSu3u6cY0JuDGTXFtVi6/ZPSU8/aD2KnV2DnPqI1em7V5oHn8Zlc3Z/HKTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736435004; c=relaxed/simple;
	bh=iXYp+4gau6CO/npjpinuk2yLuvJEUFsFO2imjR/NWoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PSFcMizIN0SsmN2ApvMuNxyH5imGYwXkBERkMHe5bE/KzNsgAYFYxxpzC0fpXvLmy19NP58HXyD9s9vORJ0o1tyHafL6M10TWRahVTdXieInZ7gmoFEM0eI+F+kxQnNtWM7UAxkD0x0XmPJdcSRTpWSOw/X6I6roNJBfi4hDIiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xBYc+uS4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3qpqAq2a; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xBYc+uS4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3qpqAq2a; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8C5CE1F454;
	Thu,  9 Jan 2025 15:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736435000; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mnc7OxBRxae0FLX9AiypGBr9SnItREky3Nno+gmcLhE=;
	b=xBYc+uS4jXR73pI45fQ7VNP33cL3fR5iWA/8pbeq9+n0yITn3Jdkcd5FEzAl1Sfb+kHr6I
	mMGmtpte16yEU8LXgc+uzNdCXR+lqksm0qJvElsDWsaeOa55F5ykbYUxvdVYcxcVAN0PFB
	i6vF+QuNaBcvYc+Jyo0HvmYlNXaSOIQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736435000;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mnc7OxBRxae0FLX9AiypGBr9SnItREky3Nno+gmcLhE=;
	b=3qpqAq2aFy5ghC7wyhkpk1nLz0hufbE0CnbWS0jSRfKSU27z685T08ustaOdAIYISvW8xM
	AJ7xUVGLlsPuVFAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xBYc+uS4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3qpqAq2a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736435000; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mnc7OxBRxae0FLX9AiypGBr9SnItREky3Nno+gmcLhE=;
	b=xBYc+uS4jXR73pI45fQ7VNP33cL3fR5iWA/8pbeq9+n0yITn3Jdkcd5FEzAl1Sfb+kHr6I
	mMGmtpte16yEU8LXgc+uzNdCXR+lqksm0qJvElsDWsaeOa55F5ykbYUxvdVYcxcVAN0PFB
	i6vF+QuNaBcvYc+Jyo0HvmYlNXaSOIQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736435000;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mnc7OxBRxae0FLX9AiypGBr9SnItREky3Nno+gmcLhE=;
	b=3qpqAq2aFy5ghC7wyhkpk1nLz0hufbE0CnbWS0jSRfKSU27z685T08ustaOdAIYISvW8xM
	AJ7xUVGLlsPuVFAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ED5D6139AB;
	Thu,  9 Jan 2025 15:03:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iHioODflf2c1awAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 09 Jan 2025 15:03:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	xen-devel@lists.xenproject.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 10/25] drm/imx/ipuv3: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Thu,  9 Jan 2025 15:57:04 +0100
Message-ID: <20250109150310.219442-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109150310.219442-1-tzimmermann@suse.de>
References: <20250109150310.219442-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8C5CE1F454
X-Spam-Score: -1.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,suse.de,pengutronix.de,kernel.org,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. The hardware requires the framebuffer width to be a
multiple of 8. The scanline pitch has be large enough to support
this. Therefore compute the byte size of 8 pixels in the given color
mode and align the pitch accordingly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
---
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c | 31 ++++++++++++++++++------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
index e7025df7b978..465b5a6ad5bb 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
@@ -17,7 +17,9 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_fbdev_dma.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_managed.h>
@@ -141,19 +143,32 @@ static int imx_drm_dumb_create(struct drm_file *file_priv,
 			       struct drm_device *drm,
 			       struct drm_mode_create_dumb *args)
 {
-	u32 width = args->width;
+	u32 fourcc;
+	const struct drm_format_info *info;
+	u64 pitch_align;
 	int ret;
 
-	args->width = ALIGN(width, 8);
-	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
-	args->size = args->pitch * args->height;
-
-	ret = drm_gem_dma_dumb_create(file_priv, drm, args);
+	/*
+	 * Hardware requires the framebuffer width to be aligned to
+	 * multiples of 8. The mode-setting code handles this, but
+	 * the buffer pitch has to be aligned as well. Set the pitch
+	 * alignment accordingly, so that the each scanline fits into
+	 * the allocated buffer.
+	 */
+	fourcc = drm_driver_color_mode_format(drm, args->bpp);
+	if (fourcc == DRM_FORMAT_INVALID)
+		return -EINVAL;
+	info = drm_format_info(fourcc);
+	if (!info)
+		return -EINVAL;
+	pitch_align = drm_format_info_min_pitch(info, 0, SZ_8);
+	if (!pitch_align || pitch_align > U32_MAX)
+		return -EINVAL;
+	ret = drm_mode_size_dumb(drm, args, pitch_align, 0);
 	if (ret)
 		return ret;
 
-	args->width = width;
-	return ret;
+	return drm_gem_dma_dumb_create(file_priv, drm, args);
 }
 
 static const struct drm_driver imx_drm_driver = {
-- 
2.47.1


