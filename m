Return-Path: <linux-arm-msm+bounces-48355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCC8A39F6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 15:28:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3DB8169906
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 14:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8925726A1AB;
	Tue, 18 Feb 2025 14:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YuLlGFM1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NH5Ewfcu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qj6c93qy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4TBv+xj8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7D526A0CF
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 14:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739888765; cv=none; b=IaRfwqNh8ln79uzu4hf8S1R2pWEBArT9DQICQgJNKjweSFSQBWhJz0F+nTfoLtMpBR1cuG2FqrW3R/0kJYatfq9hTLDlcettDnGGl9Mxj2jhjEH31bcbeL9LlSDDeP1bPqH7pHMpMFrWXbELeJ5hMPPrW7cEPoEOOOtnRGMMjss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739888765; c=relaxed/simple;
	bh=cE7uHxWfxqJjISr6A9hDBRf1EpV6RpGUkIpLEj6oG6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cgVejeGajAqKVWK0u0Im0NDkErgUS5icfg/Uz+pWK5ZpVBTDaNZblkRTyGsCTE3HBkDHv0niZ+3q3eFLiP1uhuUWKFNhN/LrRctLtzfcE2OdL43FZ5S0IhylDxzrYyPzK4zArIHekKFbwoVh7OrtkVK3VU1IuY10n9jeuyf7eSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=fail smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YuLlGFM1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NH5Ewfcu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qj6c93qy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4TBv+xj8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EEDEC1F443;
	Tue, 18 Feb 2025 14:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739888751; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jozy/v8NT0GN5TxtUOTLrsyJUrXwxRJ95fyMlLjn2VI=;
	b=YuLlGFM1T0ErmrzJgXey/dhk9qiFkCmdZpSro58oxouGudhaKIiI+auj245rtNQdcIW8DY
	GE/q6QmWBVQUX+IIA5aPozSe3foNPE/AJPwLPBWlXuGxguMKEiAMSypUHrAhv+BIgFwFfp
	SP93C6+JzWf+vpk1rkCqUCRUbCg0Wt8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739888751;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jozy/v8NT0GN5TxtUOTLrsyJUrXwxRJ95fyMlLjn2VI=;
	b=NH5EwfcuzV0SJgdpVP7DLsm1+v39wCnMkxWL91z0+Rv/XhhzgI2mmiVIMj29lC1NqZh4JS
	fDXOlRDE1i1/hzCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qj6c93qy;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4TBv+xj8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739888750; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jozy/v8NT0GN5TxtUOTLrsyJUrXwxRJ95fyMlLjn2VI=;
	b=qj6c93qybNJPUerz1UOVBjGoYjV2/hgqh08Ovo+fI1TI+mdowjPL103DL+sIMzmtc43HaY
	sjDHpl17nwDnHdILIlCLOKLIH148pmM3SuSutVL/uPxA7XHejiUkpCLEJ58bHc6tnFoMO/
	+DN3TkD7ho/NRlwmvwvAcNZTsb5nXg0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739888750;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jozy/v8NT0GN5TxtUOTLrsyJUrXwxRJ95fyMlLjn2VI=;
	b=4TBv+xj8+qA094ZTxIPf7aSg3TIUlwq/sypsHGgq/7DoY5iDatkwZnkNU7qZP1KTYEhtDU
	TPPdGs82vB/pEnBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5748313A82;
	Tue, 18 Feb 2025 14:25:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SCT9E26YtGdXYQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 18 Feb 2025 14:25:50 +0000
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
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v3 07/25] drm/exynos: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Tue, 18 Feb 2025 15:23:30 +0100
Message-ID: <20250218142542.438557-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218142542.438557-1-tzimmermann@suse.de>
References: <20250218142542.438557-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EEDEC1F443
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[24];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. No alignment required.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 4787fee4696f..ffa1c02b4b1e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -11,6 +11,7 @@
 #include <linux/shmem_fs.h>
 #include <linux/module.h>
 
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_prime.h>
 #include <drm/drm_vma_manager.h>
 #include <drm/exynos_drm.h>
@@ -330,15 +331,16 @@ int exynos_drm_gem_dumb_create(struct drm_file *file_priv,
 	unsigned int flags;
 	int ret;
 
+	ret = drm_mode_size_dumb(dev, args, 0, 0);
+	if (ret)
+		return ret;
+
 	/*
 	 * allocate memory to be used for framebuffer.
 	 * - this callback would be called by user application
 	 *	with DRM_IOCTL_MODE_CREATE_DUMB command.
 	 */
 
-	args->pitch = args->width * ((args->bpp + 7) / 8);
-	args->size = args->pitch * args->height;
-
 	if (is_drm_iommu_supported(dev))
 		flags = EXYNOS_BO_NONCONTIG | EXYNOS_BO_WC;
 	else
-- 
2.48.1


