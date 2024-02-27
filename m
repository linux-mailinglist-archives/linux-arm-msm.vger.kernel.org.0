Return-Path: <linux-arm-msm+bounces-12680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4452868F22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 12:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D80CB1C227BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 11:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1023313A890;
	Tue, 27 Feb 2024 11:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OnsJRYqv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tBwVcm6E";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OnsJRYqv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tBwVcm6E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6660913A87E
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 11:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709033946; cv=none; b=W1Ko2gATICet0Mj8UqiwMzJhDKe8ERKaOrXxZDavVK63sHfg5Nf5qUlHB1jpAQIwmTopzYYM5sldtoPUSqEwN8PTtzmWQsKs1rbvfCc0W51E+BIKUCW2io4UI0mk68D4MS3VjMettejnhd8hQSJBF8HbMRduuwEuDAwykcNpJ/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709033946; c=relaxed/simple;
	bh=PcepStq5sKHcrKNBowcM2/rrFyWCaa7Fsv25boX5J84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZfOj3/Nay5MaKp2cJ9JwurTP3XMCxfNbZOkP678nXFm3lCCtvOxcWWrahFSJv9s2kmAK58MCTOJP9fTlak8HjyXbUbJIwGm8tIybAttR7AsU+r0CbtpZzK8i2H6tSrIBD25y4vlF1AwCYsjPBVzIPfmZGto4DrJsgmyx2VW5lTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OnsJRYqv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tBwVcm6E; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OnsJRYqv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tBwVcm6E; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A3C0022671;
	Tue, 27 Feb 2024 11:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709033942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+me0BDLw67ndsbsjeM1XkKYm0ToICqKPaX9sSOSx+bE=;
	b=OnsJRYqvj23X0jkN1i0Mvlz6s6rrCkV3HIevgSZQFSpJQfiYs6DR8ikA+WOzeMKOopIgSk
	hiFR/5zwIbdp3VQic53MdFbUW7SCtzd71xd7da0afPOCkAe16ihF38Kz3IDAkl3R80nIuS
	gTl9lBNEqnzKz6HaIBSpBdb/EK2Xvg8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709033942;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+me0BDLw67ndsbsjeM1XkKYm0ToICqKPaX9sSOSx+bE=;
	b=tBwVcm6EFquLqtUbc9X5EZZjk7oPTfe5B0PGee5ukqEUAoxfz/qMwisrz2Ho4xe7Honu8m
	oLbhP1lqUGvKFdCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709033942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+me0BDLw67ndsbsjeM1XkKYm0ToICqKPaX9sSOSx+bE=;
	b=OnsJRYqvj23X0jkN1i0Mvlz6s6rrCkV3HIevgSZQFSpJQfiYs6DR8ikA+WOzeMKOopIgSk
	hiFR/5zwIbdp3VQic53MdFbUW7SCtzd71xd7da0afPOCkAe16ihF38Kz3IDAkl3R80nIuS
	gTl9lBNEqnzKz6HaIBSpBdb/EK2Xvg8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709033942;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+me0BDLw67ndsbsjeM1XkKYm0ToICqKPaX9sSOSx+bE=;
	b=tBwVcm6EFquLqtUbc9X5EZZjk7oPTfe5B0PGee5ukqEUAoxfz/qMwisrz2Ho4xe7Honu8m
	oLbhP1lqUGvKFdCw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id DCFF113ABC;
	Tue, 27 Feb 2024 11:39:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id 8OCQNNXJ3WVMUQAAn2gu4w
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
Subject: [PATCH 08/13] drm/qxl: Acquire reservation lock in GEM pin/unpin callbacks
Date: Tue, 27 Feb 2024 11:14:55 +0100
Message-ID: <20240227113853.8464-9-tzimmermann@suse.de>
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
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OnsJRYqv;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tBwVcm6E
X-Spamd-Result: default: False [1.69 / 50.00];
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
	 BAYES_HAM(-1.00)[87.14%];
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
X-Spam-Score: 1.69
X-Rspamd-Queue-Id: A3C0022671
X-Spam-Level: *
X-Spam-Flag: NO
X-Spamd-Bar: +

Acquire the reservation lock directly in GEM pin callback. Same for
unpin. Prepares for further changes.

Dma-buf locking semantics require callers to hold the buffer's
reservation lock when invoking the pin and unpin callbacks. Prepare
qxl accordingly by pushing locking out of the implementation. A
follow-up patch will fix locking for all GEM code at once.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/qxl/qxl_prime.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_prime.c b/drivers/gpu/drm/qxl/qxl_prime.c
index 9169c26357d36..f2646603e12eb 100644
--- a/drivers/gpu/drm/qxl/qxl_prime.c
+++ b/drivers/gpu/drm/qxl/qxl_prime.c
@@ -31,15 +31,27 @@
 int qxl_gem_prime_pin(struct drm_gem_object *obj)
 {
 	struct qxl_bo *bo = gem_to_qxl_bo(obj);
+	int r;
 
-	return qxl_bo_pin(bo);
+	r = qxl_bo_reserve(bo);
+	if (r)
+		return r;
+	r = qxl_bo_pin_locked(bo);
+	qxl_bo_unreserve(bo);
+
+	return r;
 }
 
 void qxl_gem_prime_unpin(struct drm_gem_object *obj)
 {
 	struct qxl_bo *bo = gem_to_qxl_bo(obj);
+	int r;
 
-	qxl_bo_unpin(bo);
+	r = qxl_bo_reserve(bo);
+	if (r)
+		return;
+	qxl_bo_unpin_locked(bo);
+	qxl_bo_unreserve(bo);
 }
 
 struct sg_table *qxl_gem_prime_get_sg_table(struct drm_gem_object *obj)
-- 
2.43.2


