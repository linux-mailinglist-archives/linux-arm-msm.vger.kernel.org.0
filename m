Return-Path: <linux-arm-msm+bounces-70098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4433AB2F1EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 10:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A426C3A8893
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 08:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223E12FE596;
	Thu, 21 Aug 2025 08:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GgC4MU4N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ENmftYPK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GgC4MU4N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ENmftYPK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524422FDC58
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 08:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755764589; cv=none; b=QSCfdPc6yqBvhVNSKpHfPehcHT3hyaWVa3I2Jl4ejNi3koKbovjPK2+29xnWvT0f+X3+30obAkT0kNgn3IasxEglSRGF0eJcdqM1vaCNC0OAqWexPFfKKOIRiTK5QqQBwy5EOR436CEeke21PJJdxCW5t5gGtScRZInfzsPgNcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755764589; c=relaxed/simple;
	bh=ucPJqaVx6pZrSDNEt+XZH6axW8RgZSZxNpPhNAqE6Bo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z5AqVAyLvVgWmFjSE2i8XqVfhiTr2XOCgiTGtwQaOhN23jfmIPv0uTeVCY57ONqgGEeu4XG9XF6QhQWjR3eGp1ZH+gWRaddlO7KJ+dAQHMne1TBXEozy/obgQz4Zo7+fut1te3LSqrcfFpiqAGPDNDskyaW5hxZsJSKRjvZfM90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GgC4MU4N; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ENmftYPK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GgC4MU4N; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ENmftYPK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0861D2264F;
	Thu, 21 Aug 2025 08:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764544; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N0hUhOL8OEDGTSoY8dJmhtx0oObts8atje33DKIE3YE=;
	b=GgC4MU4NSTmK080keMkPXFD7iNPeWocWyXIkOUsAPDLhPUFgiCurPSPDPnS71UNlbgNov2
	E7BYD1WlsiieeNU08qzSp0xYMBTZzlRST/lL02qlNhoTKDUmOD1HUPT9SOy5GI+ls5Ho5g
	Dxl2lsDaJE9Yxl8ClTmAAG7+e3khh8I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764544;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N0hUhOL8OEDGTSoY8dJmhtx0oObts8atje33DKIE3YE=;
	b=ENmftYPKsykS+zfJX2g3eGwG8Avol3XHVncn3y2rJ7HnkTtSleYDrtXgBN5aczupmPGyKq
	66LRLlWWnWFVr/Cw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764544; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N0hUhOL8OEDGTSoY8dJmhtx0oObts8atje33DKIE3YE=;
	b=GgC4MU4NSTmK080keMkPXFD7iNPeWocWyXIkOUsAPDLhPUFgiCurPSPDPnS71UNlbgNov2
	E7BYD1WlsiieeNU08qzSp0xYMBTZzlRST/lL02qlNhoTKDUmOD1HUPT9SOy5GI+ls5Ho5g
	Dxl2lsDaJE9Yxl8ClTmAAG7+e3khh8I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764544;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N0hUhOL8OEDGTSoY8dJmhtx0oObts8atje33DKIE3YE=;
	b=ENmftYPKsykS+zfJX2g3eGwG8Avol3XHVncn3y2rJ7HnkTtSleYDrtXgBN5aczupmPGyKq
	66LRLlWWnWFVr/Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E90613AB7;
	Thu, 21 Aug 2025 08:22:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QM3EGT/XpmhzEwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 21 Aug 2025 08:22:23 +0000
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
	Thomas Zimmermann <tzimmermann@suse.de>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v6 20/25] drm/tegra: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Thu, 21 Aug 2025 10:17:27 +0200
Message-ID: <20250821081918.79786-21-tzimmermann@suse.de>
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
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,suse.de,nvidia.com,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6),to(RLbwen1niosrcqbxsafh1)];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -1.30

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch according to hardware requirements.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Thierry Reding <treding@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/gem.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 41a285ec889f..84719c9d8720 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -16,6 +16,7 @@
 #include <linux/vmalloc.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_prime.h>
 
 #include "drm.h"
@@ -542,12 +543,13 @@ void tegra_bo_free_object(struct drm_gem_object *gem)
 int tegra_bo_dumb_create(struct drm_file *file, struct drm_device *drm,
 			 struct drm_mode_create_dumb *args)
 {
-	unsigned int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
 	struct tegra_drm *tegra = drm->dev_private;
 	struct tegra_bo *bo;
+	int ret;
 
-	args->pitch = round_up(min_pitch, tegra->pitch_align);
-	args->size = args->pitch * args->height;
+	ret = drm_mode_size_dumb(drm, args, tegra->pitch_align, 0);
+	if (ret)
+		return ret;
 
 	bo = tegra_bo_create_with_handle(file, drm, args->size, 0,
 					 &args->handle);
-- 
2.50.1


