Return-Path: <linux-arm-msm+bounces-51617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28ACCA650B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 14:23:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 800237A500B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 13:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B7D23CEF8;
	Mon, 17 Mar 2025 13:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ApvQoRSY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tCtccsA6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ApvQoRSY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tCtccsA6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE4423C390
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 13:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742217764; cv=none; b=fCtxFeklPflizOKUYhcYs8+9I3Yxtxyte+qvOBSuD4SHMD8RK1Bk9L/2GWEyxFXsVJWB2UPSi2zI+yDt42m5a5wbaF0PgrisQWzVh4PASmPA043GFncVaRFtsM/PnnL0rB6Tr2033fY+rrhiNnIaWzuozOjBYtFqnBWAQMTlnsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742217764; c=relaxed/simple;
	bh=nA8fHiuGAJYzRNGAUrhzA0s9BddIsXFztKY7Ls+Jzv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BrrQ7CkWhkUPjDKtIvzK4m+bfxngZ2M9Ne5x0mlCaatErqr0x+mfftXajDZv/dRJilWIYe4Avt4567rjIhJTPvtoG9zC2kr01kV9zMM0f9rFnFymICdcZI8KJRhkl9Ng2NYHgy4Z5xJGuu2aQsAPLWy4MKleZ0gtVRJnIgQ4Hrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ApvQoRSY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tCtccsA6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ApvQoRSY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tCtccsA6; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7BAC41FDF8;
	Mon, 17 Mar 2025 13:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742217760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BvjmCGnV+8VGo3L2IiQSD86BR3ahfRZ2uwyt6V6eGuo=;
	b=ApvQoRSY76Mslur9CGTSGVU0HFFlU1lDozgOP3lPymSQfR8CD28OmctZDWrXsBHBgDdW3B
	GlNTnCqCShF+HUaANFu2BElAtLw/Y3FtDCJQ2iRwz3SpwazIQgvW6uKccTRwbWwTkDKEbp
	kwDC9IGtbPYPrKjmL5HfCus7RVW5YxY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742217760;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BvjmCGnV+8VGo3L2IiQSD86BR3ahfRZ2uwyt6V6eGuo=;
	b=tCtccsA6t4WfkHbleV6UfAioCXfeXOA4kLg20sx/BgyCuNDcU03bsMCAyjQEkNj0J4ym+n
	DDgH0x9aKltCmOCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ApvQoRSY;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tCtccsA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742217760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BvjmCGnV+8VGo3L2IiQSD86BR3ahfRZ2uwyt6V6eGuo=;
	b=ApvQoRSY76Mslur9CGTSGVU0HFFlU1lDozgOP3lPymSQfR8CD28OmctZDWrXsBHBgDdW3B
	GlNTnCqCShF+HUaANFu2BElAtLw/Y3FtDCJQ2iRwz3SpwazIQgvW6uKccTRwbWwTkDKEbp
	kwDC9IGtbPYPrKjmL5HfCus7RVW5YxY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742217760;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BvjmCGnV+8VGo3L2IiQSD86BR3ahfRZ2uwyt6V6eGuo=;
	b=tCtccsA6t4WfkHbleV6UfAioCXfeXOA4kLg20sx/BgyCuNDcU03bsMCAyjQEkNj0J4ym+n
	DDgH0x9aKltCmOCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2701A139D2;
	Mon, 17 Mar 2025 13:22:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2Nc4CCAi2GdFWQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 17 Mar 2025 13:22:40 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 06/15] drm/msm: Test for imported buffers with drm_gem_is_imported()
Date: Mon, 17 Mar 2025 14:06:44 +0100
Message-ID: <20250317131923.238374-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250317131923.238374-1-tzimmermann@suse.de>
References: <20250317131923.238374-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7BAC41FDF8
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,lists.freedesktop.org:email,suse.de:email,suse.de:dkim,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,suse.de,gmail.com,quicinc.com,kernel.org,poorly.run,somainline.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Instead of testing import_attach for imported GEM buffers, invoke
drm_gem_is_imported() to do the test. The helper tests the dma_buf
itself while import_attach is just an artifact of the import. Prepares
to make import_attach optional.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/msm_drv.c       | 2 +-
 drivers/gpu/drm/msm/msm_gem.c       | 4 ++--
 drivers/gpu/drm/msm/msm_gem.h       | 2 +-
 drivers/gpu/drm/msm/msm_gem_prime.c | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index c3588dc9e537..f316e6776f67 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -671,7 +671,7 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
 		ret = msm_ioctl_gem_info_set_iova(dev, file, obj, args->value);
 		break;
 	case MSM_INFO_GET_FLAGS:
-		if (obj->import_attach) {
+		if (drm_gem_is_imported(obj)) {
 			ret = -EINVAL;
 			break;
 		}
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index ebc9ba66efb8..2995e80fec3b 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -735,7 +735,7 @@ static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
 
 	msm_gem_assert_locked(obj);
 
-	if (obj->import_attach)
+	if (drm_gem_is_imported(obj))
 		return ERR_PTR(-ENODEV);
 
 	pages = msm_gem_get_pages_locked(obj, madv);
@@ -1074,7 +1074,7 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 
 	put_iova_spaces(obj, true);
 
-	if (obj->import_attach) {
+	if (drm_gem_is_imported(obj)) {
 		GEM_WARN_ON(msm_obj->vaddr);
 
 		/* Don't drop the pages for imported dmabuf, as they are not
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 85f0257e83da..ba5c4ff76292 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -224,7 +224,7 @@ msm_gem_assert_locked(struct drm_gem_object *obj)
 /* imported/exported objects are not purgeable: */
 static inline bool is_unpurgeable(struct msm_gem_object *msm_obj)
 {
-	return msm_obj->base.import_attach || msm_obj->pin_count;
+	return drm_gem_is_imported(&msm_obj->base) || msm_obj->pin_count;
 }
 
 static inline bool is_purgeable(struct msm_gem_object *msm_obj)
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index ee267490c935..2e37913d5a6a 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -50,7 +50,7 @@ int msm_gem_prime_pin(struct drm_gem_object *obj)
 	struct page **pages;
 	int ret = 0;
 
-	if (obj->import_attach)
+	if (drm_gem_is_imported(obj))
 		return 0;
 
 	pages = msm_gem_pin_pages_locked(obj);
@@ -62,7 +62,7 @@ int msm_gem_prime_pin(struct drm_gem_object *obj)
 
 void msm_gem_prime_unpin(struct drm_gem_object *obj)
 {
-	if (obj->import_attach)
+	if (drm_gem_is_imported(obj))
 		return;
 
 	msm_gem_unpin_pages_locked(obj);
-- 
2.48.1


