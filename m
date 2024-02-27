Return-Path: <linux-arm-msm+bounces-12678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ACC868F0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 12:39:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18D621C2269E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 11:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F5B13A882;
	Tue, 27 Feb 2024 11:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Iap4Gcqc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+jgviNOO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Iap4Gcqc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+jgviNOO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06B913A86C
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 11:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709033944; cv=none; b=b4AQ1tc9+z+VdSgnpS5eibN0KKtE+VepQU17rBZLgdeI3OjQSGL8D9OnuTWVdRyLTgWV29bRZehXIojFmHSVgu/CnYntgznhCqn/+5mCLVfg64Zks4Ppo9Iy1HHTJcP/qjSCpfAA5PaL5ZuhcnAQKwfY5V0x+/lhYRolzfGwjuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709033944; c=relaxed/simple;
	bh=Nfo2faO4ZTIcVUZ8No2SuYiCMLorKgN4P0HScthnwYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rOs43qXlE0W4UpjesHtXxEhhw86RRui/Sqi5AxhrGOAswGKVzq8uqbwRJHjqp0hBSLdeB9hkr3ldcsU4fANOHZd/QX4aF0UNkplwvIzztiv/ZjdLZ+/zDRBYx2o6qB5eLlR9liipIu5P9n/BL1kXYwfLtfa3pvyAupW330vJzrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Iap4Gcqc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+jgviNOO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Iap4Gcqc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+jgviNOO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 10EFD1FB99;
	Tue, 27 Feb 2024 11:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709033941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZV4CkeoE17AOm8bSqkPxWkJQ8aQ/V+vccV/TuSAVGrs=;
	b=Iap4Gcqc0rjD2TRN2kykn26mW0SUEjzZuDmdkxZDC+WAqpPdKIqy0VLB7V5XDy/dFDyzMe
	xvH4RGdNis4x9HIccKV5omHXtmAgMJBTWurCxFkic6auyfXfXgx9YZ+GtM4GLshuoWqR6k
	znWTDmGP4NvEBQko8mDeuDwpmlo/YZc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709033941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZV4CkeoE17AOm8bSqkPxWkJQ8aQ/V+vccV/TuSAVGrs=;
	b=+jgviNOO7hbJ5BGlv+ZA2LWA4AyIZMqac9Mb3L87ltFgdGkEWE/f9yRKoiWOOri4ITG6+i
	Q1W5kalkmzziP3Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709033941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZV4CkeoE17AOm8bSqkPxWkJQ8aQ/V+vccV/TuSAVGrs=;
	b=Iap4Gcqc0rjD2TRN2kykn26mW0SUEjzZuDmdkxZDC+WAqpPdKIqy0VLB7V5XDy/dFDyzMe
	xvH4RGdNis4x9HIccKV5omHXtmAgMJBTWurCxFkic6auyfXfXgx9YZ+GtM4GLshuoWqR6k
	znWTDmGP4NvEBQko8mDeuDwpmlo/YZc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709033941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZV4CkeoE17AOm8bSqkPxWkJQ8aQ/V+vccV/TuSAVGrs=;
	b=+jgviNOO7hbJ5BGlv+ZA2LWA4AyIZMqac9Mb3L87ltFgdGkEWE/f9yRKoiWOOri4ITG6+i
	Q1W5kalkmzziP3Dg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 439FE13ABC;
	Tue, 27 Feb 2024 11:39:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id MFEpD9TJ3WVMUQAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Tue, 27 Feb 2024 11:39:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	christian.koenig@amd.com,
	sumit.semwal@linaro.org,
	dmitry.osipenko@collabora.com,
	robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	suijingfeng@loongson.cn,
	kherbst@redhat.com,
	lyude@redhat.com,
	dakr@redhat.com,
	airlied@redhat.com,
	kraxel@redhat.com,
	alexander.deucher@amd.com,
	Xinhui.Pan@amd.com,
	zack.rusin@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 06/13] drm/nouveau: Acquire reservation lock in GEM pin/unpin callbacks
Date: Tue, 27 Feb 2024 11:14:53 +0100
Message-ID: <20240227113853.8464-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240227113853.8464-1-tzimmermann@suse.de>
References: <20240227113853.8464-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: *
X-Spamd-Bar: +
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Iap4Gcqc;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+jgviNOO
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [1.40 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 R_RATELIMIT(0.00)[to_ip_from(RLo3wgn6xaqcdyw4c639zmwwtu)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,amd.com,linaro.org,collabora.com,quicinc.com,poorly.run,somainline.org,loongson.cn,redhat.com,broadcom.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-0.09)[64.43%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[30];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 1.40
X-Rspamd-Queue-Id: 10EFD1FB99
X-Spam-Flag: NO

Acquire the reservation lock directly in GEM pin callback. Same for
unpin. Prepares for further changes.

Dma-buf locking semantics require callers to hold the buffer's
reservation lock when invoking the pin and unpin callbacks. Prepare
nouveau accordingly by pushing locking out of the implementation. A
follow-up patch will fix locking for all GEM code at once.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/nouveau/nouveau_prime.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
index 1b2ff0c40fc1c..774f9bd031102 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -86,21 +86,32 @@ struct drm_gem_object *nouveau_gem_prime_import_sg_table(struct drm_device *dev,
 int nouveau_gem_prime_pin(struct drm_gem_object *obj)
 {
 	struct nouveau_bo *nvbo = nouveau_gem_object(obj);
+	struct ttm_buffer_object *bo = &nvbo->bo;
 	int ret;
 
-	/* pin buffer into GTT */
-	ret = nouveau_bo_pin(nvbo, NOUVEAU_GEM_DOMAIN_GART, false);
+	ret = ttm_bo_reserve(bo, false, false, NULL);
 	if (ret)
 		return -EINVAL;
+	/* pin buffer into GTT */
+	ret = nouveau_bo_pin_locked(nvbo, NOUVEAU_GEM_DOMAIN_GART, false);
+	if (ret)
+		ret = -EINVAL;
+	ttm_bo_unreserve(bo);
 
-	return 0;
+	return ret;
 }
 
 void nouveau_gem_prime_unpin(struct drm_gem_object *obj)
 {
 	struct nouveau_bo *nvbo = nouveau_gem_object(obj);
+	struct ttm_buffer_object *bo = &nvbo->bo;
+	int ret;
 
-	nouveau_bo_unpin(nvbo);
+	ret = ttm_bo_reserve(bo, false, false, NULL);
+	if (ret)
+		return;
+	nouveau_bo_unpin_locked(nvbo);
+	ttm_bo_unreserve(bo);
 }
 
 struct dma_buf *nouveau_gem_prime_export(struct drm_gem_object *gobj,
-- 
2.43.2


