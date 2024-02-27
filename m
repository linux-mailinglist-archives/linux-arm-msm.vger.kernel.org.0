Return-Path: <linux-arm-msm+bounces-12679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAB0868F1D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 12:39:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 732E0282D1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 11:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75FCB13A88C;
	Tue, 27 Feb 2024 11:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EIip1was";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/r213L71";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EIip1was";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/r213L71"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C080513A251
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 11:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709033945; cv=none; b=ocg1Deb8gHOkz/WxYpIWZhAnE8qTubHL4bS3FlRgTqEInqvy9xnmchH2i2rnbzq7vcrRybwd3+IufqbDcimxOsFzeLb/wdeMGHoAx46Gz1I+z2S9h0mVtQyogOPYk/eRb0oYqLXqHVHDgwpW0peeDbOtUBc+Nmp0gRv5VRym4JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709033945; c=relaxed/simple;
	bh=CNWGHgwuSoJ2lcUkHbC6UUVnihw7+RfFDQvUYrX2RO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kRmUGDwnA8dtQgR+UfOeYpWrdrrAfwE8UyoXifALssw822ZS8dp9eNa1bdLuPQlT4b3beGFW/nbU5XWuwfoNGATBI+cky7SzoL/VWeDFFraIK5HhQtdi/QMQlygUy+0UjjbfnkWi52yIs2XSYhAAHCSwRmV0kB705gor6kUGAfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EIip1was; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/r213L71; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EIip1was; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/r213L71; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D648A2274F;
	Tue, 27 Feb 2024 11:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709033941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8CSK/N04eUehs4wa6IhRI10IV4iGyTth6Lhzd5f6Dd8=;
	b=EIip1wasq42dh5HLOR8rCl5/x8NVUdfyWV0Lksbk739jy+1S5LaVApsO+tfSPtr2jqmC3J
	mWwayLjxqEsEGwd603nR6nCxLnDJJKOJqd2ZxhAcJtckDqJqX51qpFNhyXzoq21HgSMU+O
	PZ6qtgCT/wuB33guHwKDKSSmDVnn6mw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709033941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8CSK/N04eUehs4wa6IhRI10IV4iGyTth6Lhzd5f6Dd8=;
	b=/r213L712WtrNOv//INF5QDNWmL+6in4afs/kADW6Lu2xm1gzW4tkzSHYK6alop6to4Rs2
	YyX0hwJPKSa+/xCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709033941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8CSK/N04eUehs4wa6IhRI10IV4iGyTth6Lhzd5f6Dd8=;
	b=EIip1wasq42dh5HLOR8rCl5/x8NVUdfyWV0Lksbk739jy+1S5LaVApsO+tfSPtr2jqmC3J
	mWwayLjxqEsEGwd603nR6nCxLnDJJKOJqd2ZxhAcJtckDqJqX51qpFNhyXzoq21HgSMU+O
	PZ6qtgCT/wuB33guHwKDKSSmDVnn6mw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709033941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8CSK/N04eUehs4wa6IhRI10IV4iGyTth6Lhzd5f6Dd8=;
	b=/r213L712WtrNOv//INF5QDNWmL+6in4afs/kADW6Lu2xm1gzW4tkzSHYK6alop6to4Rs2
	YyX0hwJPKSa+/xCA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 181A313216;
	Tue, 27 Feb 2024 11:39:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id sKZ8BNXJ3WVMUQAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Tue, 27 Feb 2024 11:39:01 +0000
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
Subject: [PATCH 07/13] drm/qxl: Provide qxl_bo_{pin,unpin}_locked()
Date: Tue, 27 Feb 2024 11:14:54 +0100
Message-ID: <20240227113853.8464-8-tzimmermann@suse.de>
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
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EIip1was;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/r213L71"
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [1.46 / 50.00];
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
	 BAYES_HAM(-0.03)[56.18%];
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
X-Spam-Score: 1.46
X-Rspamd-Queue-Id: D648A2274F
X-Spam-Flag: NO

Rename __qxl_bo_pin() to qxl_bo_pin_locked() and update all callers.
The function will be helpful for implementing the GEM pin callback
with correct semantics. Same for __qxl_bo_unpin().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/qxl/qxl_object.c | 25 +++++++++++++------------
 drivers/gpu/drm/qxl/qxl_object.h |  2 ++
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index 1e46b0a6e4787..39218e979a807 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -29,9 +29,6 @@
 #include "qxl_drv.h"
 #include "qxl_object.h"
 
-static int __qxl_bo_pin(struct qxl_bo *bo);
-static void __qxl_bo_unpin(struct qxl_bo *bo);
-
 static void qxl_ttm_bo_destroy(struct ttm_buffer_object *tbo)
 {
 	struct qxl_bo *bo;
@@ -167,13 +164,13 @@ int qxl_bo_vmap_locked(struct qxl_bo *bo, struct iosys_map *map)
 		goto out;
 	}
 
-	r = __qxl_bo_pin(bo);
+	r = qxl_bo_pin_locked(bo);
 	if (r)
 		return r;
 
 	r = ttm_bo_vmap(&bo->tbo, &bo->map);
 	if (r) {
-		__qxl_bo_unpin(bo);
+		qxl_bo_unpin_locked(bo);
 		return r;
 	}
 	bo->map_count = 1;
@@ -246,7 +243,7 @@ void qxl_bo_vunmap_locked(struct qxl_bo *bo)
 		return;
 	bo->kptr = NULL;
 	ttm_bo_vunmap(&bo->tbo, &bo->map);
-	__qxl_bo_unpin(bo);
+	qxl_bo_unpin_locked(bo);
 }
 
 int qxl_bo_vunmap(struct qxl_bo *bo)
@@ -290,12 +287,14 @@ struct qxl_bo *qxl_bo_ref(struct qxl_bo *bo)
 	return bo;
 }
 
-static int __qxl_bo_pin(struct qxl_bo *bo)
+int qxl_bo_pin_locked(struct qxl_bo *bo)
 {
 	struct ttm_operation_ctx ctx = { false, false };
 	struct drm_device *ddev = bo->tbo.base.dev;
 	int r;
 
+	dma_resv_assert_held(bo->tbo.base.resv);
+
 	if (bo->tbo.pin_count) {
 		ttm_bo_pin(&bo->tbo);
 		return 0;
@@ -309,14 +308,16 @@ static int __qxl_bo_pin(struct qxl_bo *bo)
 	return r;
 }
 
-static void __qxl_bo_unpin(struct qxl_bo *bo)
+void qxl_bo_unpin_locked(struct qxl_bo *bo)
 {
+	dma_resv_assert_held(bo->tbo.base.resv);
+
 	ttm_bo_unpin(&bo->tbo);
 }
 
 /*
  * Reserve the BO before pinning the object.  If the BO was reserved
- * beforehand, use the internal version directly __qxl_bo_pin.
+ * beforehand, use the internal version directly qxl_bo_pin_locked.
  *
  */
 int qxl_bo_pin(struct qxl_bo *bo)
@@ -327,14 +328,14 @@ int qxl_bo_pin(struct qxl_bo *bo)
 	if (r)
 		return r;
 
-	r = __qxl_bo_pin(bo);
+	r = qxl_bo_pin_locked(bo);
 	qxl_bo_unreserve(bo);
 	return r;
 }
 
 /*
  * Reserve the BO before pinning the object.  If the BO was reserved
- * beforehand, use the internal version directly __qxl_bo_unpin.
+ * beforehand, use the internal version directly qxl_bo_unpin_locked.
  *
  */
 int qxl_bo_unpin(struct qxl_bo *bo)
@@ -345,7 +346,7 @@ int qxl_bo_unpin(struct qxl_bo *bo)
 	if (r)
 		return r;
 
-	__qxl_bo_unpin(bo);
+	qxl_bo_unpin_locked(bo);
 	qxl_bo_unreserve(bo);
 	return 0;
 }
diff --git a/drivers/gpu/drm/qxl/qxl_object.h b/drivers/gpu/drm/qxl/qxl_object.h
index 53392cb90eecf..1cf5bc7591016 100644
--- a/drivers/gpu/drm/qxl/qxl_object.h
+++ b/drivers/gpu/drm/qxl/qxl_object.h
@@ -67,6 +67,8 @@ void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev, struct qxl_bo *bo, int pa
 void qxl_bo_kunmap_atomic_page(struct qxl_device *qdev, struct qxl_bo *bo, void *map);
 extern struct qxl_bo *qxl_bo_ref(struct qxl_bo *bo);
 extern void qxl_bo_unref(struct qxl_bo **bo);
+extern int qxl_bo_pin_locked(struct qxl_bo *bo);
+extern void qxl_bo_unpin_locked(struct qxl_bo *bo);
 extern int qxl_bo_pin(struct qxl_bo *bo);
 extern int qxl_bo_unpin(struct qxl_bo *bo);
 extern void qxl_ttm_placement_from_domain(struct qxl_bo *qbo, u32 domain);
-- 
2.43.2


