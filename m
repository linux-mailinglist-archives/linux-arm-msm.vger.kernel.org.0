Return-Path: <linux-arm-msm+bounces-70099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38793B2F21C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 10:35:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEB07605EB2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 08:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A17DC2FF158;
	Thu, 21 Aug 2025 08:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Spc54SMX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Kk54utJ3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Spc54SMX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Kk54utJ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD94E2FF151
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 08:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755764591; cv=none; b=ZJTBJPNHWTKxVy7Giee05rM7g/l8PH/m4R3iOHv0qBrGybrQZ+Ch2c2EXfT/7bMi1q6hR7cN4+aBaugRo7JyV1TuxIwUtzjCgz4mDy4Wh5eyyLYroB7alF82YS9Ci9g/aAaRsyTQUiV+l4QiOFO2jxkdYCFQS1F3xstalEtRIgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755764591; c=relaxed/simple;
	bh=iGKHDpzH3ZnAjbFzlEC1kWra3/MzCtIyokfZbrnLBDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ws+FR3VBtVxiLpquSzGdCTjGUfUPSqmhxgzIIkzYrSe0zh1X9t0cby1L6JKyyI/YtyV0zjazO9GdQ7RmEVfUtbC8Pp/xQfBbkYnGk41jZmxMrkOhBLbJBQIKnGZML1uoo4K9xYnW3nSwBDlRKpYOsqWJzMRSAH9HjmTEnnWYsXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Spc54SMX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Kk54utJ3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Spc54SMX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Kk54utJ3; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F3BC71F846;
	Thu, 21 Aug 2025 08:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GLGhV+XaUo5vIwcaERE5vtMc0qiqKVdW6Sd6WsUuyCY=;
	b=Spc54SMXqWsCRPExIv8+LK+ZaQrTbQddcIU9iPXKJ0Wvj1DWyBCpOs+dV3qR8bh3daPbuZ
	bkqsSHIY0D4e8P1TRqoOkKh1P+TCKqTglc1UvzsQ29n3DGukYtkfZwD+8Is0OmvW9S8u9m
	7lfACwke8TyoV7TiPIzDXmPlAif+y+4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764541;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GLGhV+XaUo5vIwcaERE5vtMc0qiqKVdW6Sd6WsUuyCY=;
	b=Kk54utJ3p+S/vf5VwVIjNq0tKVEOsmXLYGFM+7foWe1Wl5UAXUJuBdbVRN/i8u/LYDaFye
	R9sWNs1EoG2NF/AQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GLGhV+XaUo5vIwcaERE5vtMc0qiqKVdW6Sd6WsUuyCY=;
	b=Spc54SMXqWsCRPExIv8+LK+ZaQrTbQddcIU9iPXKJ0Wvj1DWyBCpOs+dV3qR8bh3daPbuZ
	bkqsSHIY0D4e8P1TRqoOkKh1P+TCKqTglc1UvzsQ29n3DGukYtkfZwD+8Is0OmvW9S8u9m
	7lfACwke8TyoV7TiPIzDXmPlAif+y+4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764541;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GLGhV+XaUo5vIwcaERE5vtMc0qiqKVdW6Sd6WsUuyCY=;
	b=Kk54utJ3p+S/vf5VwVIjNq0tKVEOsmXLYGFM+7foWe1Wl5UAXUJuBdbVRN/i8u/LYDaFye
	R9sWNs1EoG2NF/AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 79266139A8;
	Thu, 21 Aug 2025 08:22:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OGFjHDzXpmhzEwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 21 Aug 2025 08:22:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch,
	airlied@gmail.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	geert@linux-m68k.org,
	tomi.valkeinen@ideasonboard.com
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
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v6 15/25] drm/omapdrm: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Thu, 21 Aug 2025 10:17:22 +0200
Message-ID: <20250821081918.79786-16-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821081918.79786-1-tzimmermann@suse.de>
References: <20250821081918.79786-1-tzimmermann@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6),to(RLbwen1niosrcqbxsafh1)];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -1.30

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch to a multiple of 8.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/omap_gem.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index 381552bfb409..78563a8d8732 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -10,6 +10,7 @@
 #include <linux/spinlock.h>
 #include <linux/vmalloc.h>
 
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_prime.h>
 #include <drm/drm_vma_manager.h>
 
@@ -580,15 +581,13 @@ static int omap_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struc
 int omap_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 		struct drm_mode_create_dumb *args)
 {
-	union omap_gem_size gsize;
-
-	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
-
-	args->size = PAGE_ALIGN(args->pitch * args->height);
+	union omap_gem_size gsize = { };
+	int ret;
 
-	gsize = (union omap_gem_size){
-		.bytes = args->size,
-	};
+	ret = drm_mode_size_dumb(dev, args, SZ_8, 0);
+	if (ret)
+		return ret;
+	gsize.bytes = args->size;
 
 	return omap_gem_new_handle(dev, file, gsize,
 			OMAP_BO_SCANOUT | OMAP_BO_WC, &args->handle);
-- 
2.50.1


