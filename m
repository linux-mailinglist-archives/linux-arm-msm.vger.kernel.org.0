Return-Path: <linux-arm-msm+bounces-44614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AEDA07ACE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 16:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE2631888C37
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 15:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD54921D5AD;
	Thu,  9 Jan 2025 15:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DlIcOme8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GpT1dA+4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DlIcOme8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GpT1dA+4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB5B21CA1F;
	Thu,  9 Jan 2025 15:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736435002; cv=none; b=K3hjt9r0GVPgTFlEf2ZcpuSno5hvawnAumqjbsdxdnhp6G/chIALlF7Od2EuO5HKtFWqUvilVbEGJi6kBDIa1E1Qoe4Izzl4y3PU2rxEGKchFa4fO4jJiDKoKxvL9pmIeL7hBie+WpiXIqD3kFmLscczW0HJBHZFMvbb6uWydMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736435002; c=relaxed/simple;
	bh=JNzhAv9hMuPlwvgqGLbxLpBWL3RFFDNa1HABFRXMuJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ucHu2Ya3XhCP3VLx/s2bw7XZ6JGOvByNep6QxqHtkTJnhyyF7Litgcbaq5T9xT0D6BAxBujgQXGOS9MyAMmakJcMPhFHJsmLLa5Vbq8mZxGFIuBhTtdLNNkLBAc6vEcuqTFNMJxv0kbm48vm5wMOkE/cQK2xPgoPJ2zgSR+4A1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DlIcOme8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GpT1dA+4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DlIcOme8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GpT1dA+4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 496952116F;
	Thu,  9 Jan 2025 15:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736434999; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jIlkzGmf9+JQi5hKq1VLUT7OJlJM4iSRa4SFYEhnTFA=;
	b=DlIcOme8qn1BahiaO0eSzJ5NBh9N5kCSwK2Vf2IDFPa7VIdrVIV3F18xXAFrhnUTvqGgQp
	ZaVQjCx98nFRpqYFSOOQ+K1hGThmFSSlpqOXO0H2U1tzoeEbwAxU/ujANUqyB5JcZK3hHs
	ry9ittFREiV6Btr+/Px4sj62e2qtlVg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736434999;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jIlkzGmf9+JQi5hKq1VLUT7OJlJM4iSRa4SFYEhnTFA=;
	b=GpT1dA+4sBPb3xdvmoq+mgzStdotRyRrrD3S/uv2r/b1T8A0kd1pmiIfC1rhRqZPCE+Sks
	DQMhDqqRMlqhNlBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736434999; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jIlkzGmf9+JQi5hKq1VLUT7OJlJM4iSRa4SFYEhnTFA=;
	b=DlIcOme8qn1BahiaO0eSzJ5NBh9N5kCSwK2Vf2IDFPa7VIdrVIV3F18xXAFrhnUTvqGgQp
	ZaVQjCx98nFRpqYFSOOQ+K1hGThmFSSlpqOXO0H2U1tzoeEbwAxU/ujANUqyB5JcZK3hHs
	ry9ittFREiV6Btr+/Px4sj62e2qtlVg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736434999;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jIlkzGmf9+JQi5hKq1VLUT7OJlJM4iSRa4SFYEhnTFA=;
	b=GpT1dA+4sBPb3xdvmoq+mgzStdotRyRrrD3S/uv2r/b1T8A0kd1pmiIfC1rhRqZPCE+Sks
	DQMhDqqRMlqhNlBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C40B8139AB;
	Thu,  9 Jan 2025 15:03:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WPWSLjblf2c1awAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 09 Jan 2025 15:03:18 +0000
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
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: [PATCH v2 08/25] drm/gma500: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Thu,  9 Jan 2025 15:57:02 +0100
Message-ID: <20250109150310.219442-9-tzimmermann@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,suse.de,gmail.com];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -1.30
X-Spam-Flag: NO

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch to a multiple of 64.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/gem.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
index 4b7627a72637..fc337db0a948 100644
--- a/drivers/gpu/drm/gma500/gem.c
+++ b/drivers/gpu/drm/gma500/gem.c
@@ -16,6 +16,7 @@
 #include <asm/set_memory.h>
 
 #include <drm/drm.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_vma_manager.h>
 
 #include "gem.h"
@@ -199,35 +200,25 @@ psb_gem_create(struct drm_device *dev, u64 size, const char *name, bool stolen,
 int psb_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 			struct drm_mode_create_dumb *args)
 {
-	size_t pitch, size;
 	struct psb_gem_object *pobj;
 	struct drm_gem_object *obj;
-	u32 handle;
 	int ret;
 
-	pitch = args->width * DIV_ROUND_UP(args->bpp, 8);
-	pitch = ALIGN(pitch, 64);
-
-	size = pitch * args->height;
-	size = roundup(size, PAGE_SIZE);
-	if (!size)
-		return -EINVAL;
+	ret = drm_mode_size_dumb(dev, args, SZ_64, 0);
+	if (ret)
+		return ret;
 
-	pobj = psb_gem_create(dev, size, "gem", false, PAGE_SIZE);
+	pobj = psb_gem_create(dev, args->size, "gem", false, PAGE_SIZE);
 	if (IS_ERR(pobj))
 		return PTR_ERR(pobj);
 	obj = &pobj->base;
 
-	ret = drm_gem_handle_create(file, obj, &handle);
+	ret = drm_gem_handle_create(file, obj, &args->handle);
 	if (ret)
 		goto err_drm_gem_object_put;
 
 	drm_gem_object_put(obj);
 
-	args->pitch = pitch;
-	args->size = size;
-	args->handle = handle;
-
 	return 0;
 
 err_drm_gem_object_put:
-- 
2.47.1


