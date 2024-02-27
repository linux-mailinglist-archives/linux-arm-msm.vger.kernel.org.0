Return-Path: <linux-arm-msm+bounces-12676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC835868EFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 12:39:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9403E2825F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 11:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C0813A86E;
	Tue, 27 Feb 2024 11:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sZNlKF4L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bDunXNTd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sZNlKF4L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bDunXNTd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CE913A279
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 11:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709033943; cv=none; b=Ipo4KmhWgn2IUAPaAaS+9AzU9XkJklinnUC5mh0eesLQoKiKbDzAgRzcNRtZFPHQNvzH0zGyRH8HFSHAiJy7kFHyHMaKsrkPFwYxhlyuwudWmZ59yldf/9ceO3m3hI+wZASm61pFxR7GZGQoGOH0kAz7Ae44b+kjtlIvKWcpY2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709033943; c=relaxed/simple;
	bh=S8B3K0xY34HSEpw3uEPIAbRt0ysQ+NqPCa3BbSWXe4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m0trWZ9JNT5K+oT0C74jc1OMCsRlPlcJD7L87hnr/rCcSx0S8Tq9ai2IPfcVTnQtahlFPbfx5OtYSod/WpEo/NMlg/goXJdSk1l/sotqgzrqzBV1yIwDSKwBJM6bspkE1c69qqAuWR5gWK+HKjkm4vXSDc5Z825VrPaAHEuIqSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sZNlKF4L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bDunXNTd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sZNlKF4L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bDunXNTd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6A3B61FB97;
	Tue, 27 Feb 2024 11:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709033939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ErN/bOKhdh0jY//ty+7plhgl8OH6UHX57uMXJXKhk8o=;
	b=sZNlKF4LKg9R7fKgESviDYGJcgGQqAjASKpis9DK54YbuoRGmhla2/GR8hmALyJ9v1OCof
	81dfrHFeGl2JdvoTTWDsFAMV/mvtHELUPa+Oumva0gebAVhML76VElhJN28TEGCbHCkreA
	dMRVUuUJfyED4WUq9Rzwcpby0MBQohA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709033939;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ErN/bOKhdh0jY//ty+7plhgl8OH6UHX57uMXJXKhk8o=;
	b=bDunXNTdfOjWSjmfO5ytcReQfZM6ntCvrakJeXh90TWjYxLLluQb1NgfzFPbOhlbBaX/7J
	pNe9dEtBOqMAGeDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709033939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ErN/bOKhdh0jY//ty+7plhgl8OH6UHX57uMXJXKhk8o=;
	b=sZNlKF4LKg9R7fKgESviDYGJcgGQqAjASKpis9DK54YbuoRGmhla2/GR8hmALyJ9v1OCof
	81dfrHFeGl2JdvoTTWDsFAMV/mvtHELUPa+Oumva0gebAVhML76VElhJN28TEGCbHCkreA
	dMRVUuUJfyED4WUq9Rzwcpby0MBQohA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709033939;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ErN/bOKhdh0jY//ty+7plhgl8OH6UHX57uMXJXKhk8o=;
	b=bDunXNTdfOjWSjmfO5ytcReQfZM6ntCvrakJeXh90TWjYxLLluQb1NgfzFPbOhlbBaX/7J
	pNe9dEtBOqMAGeDg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 9E06613ABC;
	Tue, 27 Feb 2024 11:38:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id EHM5JdLJ3WVMUQAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Tue, 27 Feb 2024 11:38:58 +0000
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
Subject: [PATCH 04/13] drm/msm: Acquire reservation lock in GEM pin/unpin callback
Date: Tue, 27 Feb 2024 11:14:51 +0100
Message-ID: <20240227113853.8464-5-tzimmermann@suse.de>
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
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sZNlKF4L;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bDunXNTd
X-Spamd-Result: default: False [-0.31 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 R_RATELIMIT(0.00)[to_ip_from(RLo3wgn6xaqcdyw4c639zmwwtu)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,amd.com,linaro.org,collabora.com,quicinc.com,poorly.run,somainline.org,loongson.cn,redhat.com,broadcom.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[30];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -0.31
X-Rspamd-Queue-Id: 6A3B61FB97
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Bar: /

Export msm_gem_pin_pages_locked() and acquire the reservation lock
directly in GEM pin callback. Same for unpin. Prepares for further
changes.

Dma-buf locking semantics require callers to hold the buffer's
reservation lock when invoking the pin and unpin callbacks. Prepare
msm accordingly by pushing locking out of the implementation. A
follow-up patch will fix locking for all GEM code at once.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/msm_gem.c       | 12 ++++++------
 drivers/gpu/drm/msm/msm_gem.h       |  4 ++--
 drivers/gpu/drm/msm/msm_gem_prime.c | 24 +++++++++++++++++++-----
 3 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index bb729353d3a8d..a5c6498a43f06 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -257,24 +257,24 @@ static void pin_obj_locked(struct drm_gem_object *obj)
 	mutex_unlock(&priv->lru.lock);
 }
 
-struct page **msm_gem_pin_pages(struct drm_gem_object *obj)
+struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj)
 {
 	struct page **p;
 
-	msm_gem_lock(obj);
+	msm_gem_assert_locked(obj);
+
 	p = msm_gem_get_pages_locked(obj, MSM_MADV_WILLNEED);
 	if (!IS_ERR(p))
 		pin_obj_locked(obj);
-	msm_gem_unlock(obj);
 
 	return p;
 }
 
-void msm_gem_unpin_pages(struct drm_gem_object *obj)
+void msm_gem_unpin_pages_locked(struct drm_gem_object *obj)
 {
-	msm_gem_lock(obj);
+	msm_gem_assert_locked(obj);
+
 	msm_gem_unpin_locked(obj);
-	msm_gem_unlock(obj);
 }
 
 static pgprot_t msm_gem_pgprot(struct msm_gem_object *msm_obj, pgprot_t prot)
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 8d414b072c29d..85f0257e83dab 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -140,8 +140,8 @@ int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
 void msm_gem_unpin_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace);
 void msm_gem_pin_obj_locked(struct drm_gem_object *obj);
-struct page **msm_gem_pin_pages(struct drm_gem_object *obj);
-void msm_gem_unpin_pages(struct drm_gem_object *obj);
+struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj);
+void msm_gem_unpin_pages_locked(struct drm_gem_object *obj);
 int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 		struct drm_mode_create_dumb *args);
 int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index 0915f3b68752e..0d22df53ab98a 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -47,13 +47,27 @@ struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 
 int msm_gem_prime_pin(struct drm_gem_object *obj)
 {
-	if (!obj->import_attach)
-		msm_gem_pin_pages(obj);
-	return 0;
+	struct page **pages;
+	int ret = 0;
+
+	if (obj->import_attach)
+		return 0;
+
+	msm_gem_lock(obj);
+	pages = msm_gem_pin_pages_locked(obj);
+	if (IS_ERR(pages))
+		ret = PTR_ERR(pages);
+	msm_gem_unlock(obj);
+
+	return ret;
 }
 
 void msm_gem_prime_unpin(struct drm_gem_object *obj)
 {
-	if (!obj->import_attach)
-		msm_gem_unpin_pages(obj);
+	if (obj->import_attach)
+		return;
+
+	msm_gem_lock(obj);
+	msm_gem_unpin_pages_locked(obj);
+	msm_gem_unlock(obj);
 }
-- 
2.43.2


