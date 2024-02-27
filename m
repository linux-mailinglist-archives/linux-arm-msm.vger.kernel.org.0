Return-Path: <linux-arm-msm+bounces-12674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BE0868EF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 12:39:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23A6C1C22581
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 11:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63F113A242;
	Tue, 27 Feb 2024 11:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YUxT1Hfe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uJQtrjdj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YUxT1Hfe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uJQtrjdj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DB313958A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 11:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709033941; cv=none; b=DM+rE3wfNvoBg2Fdd3L05RSrH3tELsvFBtDcVZkQVKQqVOa0LDlcGXwTb+mMp/XrhWKiUacWcpbSFmMC2w9qvAALNiO9ycUnki56AgbNpJW1Rg2Yw8nhBYd550IpugPkgLdNSyobT0wFgp8wMGJjvDIqueNUW6QvPYsl9jHawnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709033941; c=relaxed/simple;
	bh=rX1rSBH7JtfTauCD0GoqW/VnbM4nfhibgqKFFIzMK0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FL83n6ELC3ANWiv+YCBDWVwJyRceqxVFPFGkMA0U8TLS6qr0yyjz1FOzomsoE96XL4sti8ULJFR/owGiSylJ//xkzZ0Qo/V+X3PgvJ4asvJ2E4oM5pwRqcsKScXSrzb4HrQglLXeftRL0k2D3Q6GjcW07Cm2ObmMUpDv0nrI/aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YUxT1Hfe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uJQtrjdj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YUxT1Hfe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uJQtrjdj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F353F1FB92;
	Tue, 27 Feb 2024 11:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709033937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TO71hQgks4/Pgbc4cHdHdGcrj0klF3qxns73s6epIWU=;
	b=YUxT1Hfe+ztfUp218ZjVGn8HEvrZ7g2zVqDs1uph3Uo6V13zajBOg16zcoDD7N2K7fO+MG
	JiGZ4+k12Oheg37OrnC7mQ3UID4p/q55mTBlerU73BNmCbKLsgjE/o/ZYPI8O4C2GYKRQ0
	v+Zaav+koMdR9R6H+KS9STBK8MyDias=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709033937;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TO71hQgks4/Pgbc4cHdHdGcrj0klF3qxns73s6epIWU=;
	b=uJQtrjdj9oXf/AKrXDVT7hGI/ZDDOgXIk/L7tt+W95ivj08BwhmMKgIcFjjjvixpfvIyWj
	BqKHha515htmeRAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709033937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TO71hQgks4/Pgbc4cHdHdGcrj0klF3qxns73s6epIWU=;
	b=YUxT1Hfe+ztfUp218ZjVGn8HEvrZ7g2zVqDs1uph3Uo6V13zajBOg16zcoDD7N2K7fO+MG
	JiGZ4+k12Oheg37OrnC7mQ3UID4p/q55mTBlerU73BNmCbKLsgjE/o/ZYPI8O4C2GYKRQ0
	v+Zaav+koMdR9R6H+KS9STBK8MyDias=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709033937;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TO71hQgks4/Pgbc4cHdHdGcrj0klF3qxns73s6epIWU=;
	b=uJQtrjdj9oXf/AKrXDVT7hGI/ZDDOgXIk/L7tt+W95ivj08BwhmMKgIcFjjjvixpfvIyWj
	BqKHha515htmeRAQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 370DB13ABC;
	Tue, 27 Feb 2024 11:38:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id OOEHDNDJ3WVMUQAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Tue, 27 Feb 2024 11:38:56 +0000
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
Subject: [PATCH 01/13] drm/gem-shmem: Acquire reservation lock in GEM pin/unpin callbacks
Date: Tue, 27 Feb 2024 11:14:48 +0100
Message-ID: <20240227113853.8464-2-tzimmermann@suse.de>
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
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YUxT1Hfe;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=uJQtrjdj
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.23 / 50.00];
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
	 BAYES_HAM(-2.72)[98.78%];
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
X-Spam-Score: -1.23
X-Rspamd-Queue-Id: F353F1FB92
X-Spam-Flag: NO

Export drm_gem_shmem_pin_locked() and acquire the reservation lock
directly in GEM pin callback. Same for unpin. Prepares for further
changes.

Dma-buf locking semantics require callers to hold the buffer's
reservation lock when invoking the pin and unpin callbacks. Prepare
gem-shmem accordingly by pushing locking out of the implementation.
A follow-up patch will fix locking for all GEM code at once.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c |  6 ++++--
 include/drm/drm_gem_shmem_helper.h     | 16 ++++++++++++++--
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index e435f986cd135..0ac3dddb917f3 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -228,7 +228,7 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
 }
 EXPORT_SYMBOL(drm_gem_shmem_put_pages);
 
-static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
+int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
 {
 	int ret;
 
@@ -238,13 +238,15 @@ static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
 
 	return ret;
 }
+EXPORT_SYMBOL(drm_gem_shmem_pin_locked);
 
-static void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem)
+void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem)
 {
 	dma_resv_assert_held(shmem->base.resv);
 
 	drm_gem_shmem_put_pages(shmem);
 }
+EXPORT_SYMBOL(drm_gem_shmem_unpin_locked);
 
 /**
  * drm_gem_shmem_pin - Pin backing pages for a shmem GEM object
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index bf0c31aa8fbe4..eb12aa9a8c556 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -108,6 +108,9 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
 			  struct iosys_map *map);
 int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct *vma);
 
+int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem);
+void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem);
+
 int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv);
 
 static inline bool drm_gem_shmem_is_purgeable(struct drm_gem_shmem_object *shmem)
@@ -172,8 +175,15 @@ static inline void drm_gem_shmem_object_print_info(struct drm_printer *p, unsign
 static inline int drm_gem_shmem_object_pin(struct drm_gem_object *obj)
 {
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+	int ret;
+
+	ret = dma_resv_lock_interruptible(shmem->base.resv, NULL);
+	if (ret)
+		return ret;
+	ret = drm_gem_shmem_pin_locked(shmem);
+	dma_resv_unlock(shmem->base.resv);
 
-	return drm_gem_shmem_pin(shmem);
+	return ret;
 }
 
 /**
@@ -187,7 +197,9 @@ static inline void drm_gem_shmem_object_unpin(struct drm_gem_object *obj)
 {
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 
-	drm_gem_shmem_unpin(shmem);
+	dma_resv_lock(shmem->base.resv, NULL);
+	drm_gem_shmem_unpin_locked(shmem);
+	dma_resv_unlock(shmem->base.resv);
 }
 
 /**
-- 
2.43.2


