Return-Path: <linux-arm-msm+bounces-12675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0444E868F01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 12:39:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37D7FB2761D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 11:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C0C913A250;
	Tue, 27 Feb 2024 11:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N3Qh9t+x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yt3YbrmK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N3Qh9t+x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yt3YbrmK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751A313A243
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 11:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709033942; cv=none; b=hQUIXj+o2PuoEvcadjGqI5QVCGp2jk5ZyKg0UKgIUz24V1aAqToQxel8P+w3uCGnCWZdaiJWOObY1LSm+Cvm8ihwZ7UDrqaGyd40BC/TVYAbEMG/5ivJGy3xxHF1ScUdPKCqHQdQR8bXgpAevN9Uq0hEi/8jU3ABc1uPO+XPLos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709033942; c=relaxed/simple;
	bh=F0/nvQ+juRbqI8pcvNbD3g56WyXcOhHNQUgkWPEn2Ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QbMZ1/BtKP0LnNJ/odPuSC7F2xe4Dr+KxT+Y/tlMhdRJQc7i7uEFBfjEYHNdduUTgfKQvoIDEhqE6qTkSmwPoTSZjonK+wEpKNu1W7or4oO/KJeyjPuHhRlg4o+Gv4SumCiKnarbDwTiT2D7VxhIk9Bt2aP2zDLcEYaHinP2rI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N3Qh9t+x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yt3YbrmK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N3Qh9t+x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yt3YbrmK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 979AB1FB94;
	Tue, 27 Feb 2024 11:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709033938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dfzDi3LzuT0y0o9p9wBSZcCXSEHoL477SWtgnb0+42Q=;
	b=N3Qh9t+xOU//SHt117JfcqTOa8xenLWLkg+0qF9UncyK+A0js/KWEjqh1IH4WZ4hNBAemP
	a7OI+VbeoT++PXPU1xnjshy+QgCBJbQVdsoVlQvoD230u25H5qsRGrRUuBmxTQvU+ReKG2
	PtdOPYowHLINtETaJ0VkKdvZdZqz43Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709033938;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dfzDi3LzuT0y0o9p9wBSZcCXSEHoL477SWtgnb0+42Q=;
	b=yt3YbrmKB7x7chKBZ7z281K79I5dQ15dzyBfs4yKpB1HITwbSy5EZ2VjUqUL5BJBkB7jwr
	suTBAO6ZOZ4FE6DQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709033938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dfzDi3LzuT0y0o9p9wBSZcCXSEHoL477SWtgnb0+42Q=;
	b=N3Qh9t+xOU//SHt117JfcqTOa8xenLWLkg+0qF9UncyK+A0js/KWEjqh1IH4WZ4hNBAemP
	a7OI+VbeoT++PXPU1xnjshy+QgCBJbQVdsoVlQvoD230u25H5qsRGrRUuBmxTQvU+ReKG2
	PtdOPYowHLINtETaJ0VkKdvZdZqz43Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709033938;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dfzDi3LzuT0y0o9p9wBSZcCXSEHoL477SWtgnb0+42Q=;
	b=yt3YbrmKB7x7chKBZ7z281K79I5dQ15dzyBfs4yKpB1HITwbSy5EZ2VjUqUL5BJBkB7jwr
	suTBAO6ZOZ4FE6DQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id CC93113216;
	Tue, 27 Feb 2024 11:38:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id +EB9MNHJ3WVMUQAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Tue, 27 Feb 2024 11:38:57 +0000
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
Subject: [PATCH 03/13] drm/msm: Provide msm_gem_get_pages_locked()
Date: Tue, 27 Feb 2024 11:14:50 +0100
Message-ID: <20240227113853.8464-4-tzimmermann@suse.de>
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
	none
X-Spam-Level: ***
X-Spam-Score: 3.61
X-Spamd-Result: default: False [3.61 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 R_RATELIMIT(0.00)[to_ip_from(RLqs7qcp4g99ribr8z1n9xsc8a)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-0.997];
	 RCPT_COUNT_TWELVE(0.00)[30];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,amd.com,linaro.org,collabora.com,quicinc.com,poorly.run,somainline.org,loongson.cn,redhat.com,broadcom.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.09)[64.11%]
X-Spam-Flag: NO

Rename msm_gem_pin_pages_locked() to msm_gem_get_pages_locked(). The
function doesn't pin any pages, but only acquires them. Renaming the
function makes the old name available.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/msm_gem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 175ee4ab8a6f7..bb729353d3a8d 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -219,7 +219,7 @@ static void put_pages(struct drm_gem_object *obj)
 	}
 }
 
-static struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj,
+static struct page **msm_gem_get_pages_locked(struct drm_gem_object *obj,
 					      unsigned madv)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
@@ -262,7 +262,7 @@ struct page **msm_gem_pin_pages(struct drm_gem_object *obj)
 	struct page **p;
 
 	msm_gem_lock(obj);
-	p = msm_gem_pin_pages_locked(obj, MSM_MADV_WILLNEED);
+	p = msm_gem_get_pages_locked(obj, MSM_MADV_WILLNEED);
 	if (!IS_ERR(p))
 		pin_obj_locked(obj);
 	msm_gem_unlock(obj);
@@ -489,7 +489,7 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct msm_gem_vma *vma)
 
 	msm_gem_assert_locked(obj);
 
-	pages = msm_gem_pin_pages_locked(obj, MSM_MADV_WILLNEED);
+	pages = msm_gem_get_pages_locked(obj, MSM_MADV_WILLNEED);
 	if (IS_ERR(pages))
 		return PTR_ERR(pages);
 
@@ -703,7 +703,7 @@ static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
 	if (obj->import_attach)
 		return ERR_PTR(-ENODEV);
 
-	pages = msm_gem_pin_pages_locked(obj, madv);
+	pages = msm_gem_get_pages_locked(obj, madv);
 	if (IS_ERR(pages))
 		return ERR_CAST(pages);
 
-- 
2.43.2


