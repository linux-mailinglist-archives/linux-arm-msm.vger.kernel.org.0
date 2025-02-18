Return-Path: <linux-arm-msm+bounces-48363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D81EFA39F8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 15:29:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 442C43A56AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 14:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F6126A1A5;
	Tue, 18 Feb 2025 14:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BDcTg0cH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Not8bb/r";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BDcTg0cH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Not8bb/r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFE126A0E8
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 14:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739888790; cv=none; b=Z0FxcMh+4uol8DYH4CywSDnCbLs96Q036QcVBTHgLMsfDe0afhUokytYBomelcnrNdE6epFCek+kwC64RxlTEnDMl4xGD6/8q1pw5zrtEoWhTWAbZ3GmNJYfrD6NNjHN42GvM8K9K+ejS60JFWjtsyAmj0qb1iheaP8sSDRcU2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739888790; c=relaxed/simple;
	bh=IfQMCtBmnVELYJCiviV3/hBLyj2YQpw+EYdbWyZnLvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IFvinbzyr13bTcIJ9N8LqAIEt5Viksfj2P7iogCf7la/7uWQhzsyAK9OqZgOpXbfZ+LdbUi3VbSMQGToAv7OvMqcvTkpB1jYi91H6CppPlryoTCzhRZsjPcidu99HVRT4fnoSymIwpeaGVDUkdFCVmtLnoUM8EnrOh/lGT1n+8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=fail smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BDcTg0cH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Not8bb/r; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BDcTg0cH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Not8bb/r; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B79C71F449;
	Tue, 18 Feb 2025 14:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739888755; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tbf57XV86Tm6EvbxFqN8dNXgcVQxv+oJqp/TEZsU4UA=;
	b=BDcTg0cHVizXX78YYwxYcAVtQjVmjoJMdeFQpJFYTajpspZcIR2lbhuYdMjTQsCh2VdlRp
	y4j5prmifIXwFmVUC2ZvFZ0giFUyJ63SOI151Ti1RAoV6/VXxcUWZR9ya5Pp5PWHCpFn3v
	jc7RSUfDBASqK/5SoJZJPOWjvVrNmLE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739888755;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tbf57XV86Tm6EvbxFqN8dNXgcVQxv+oJqp/TEZsU4UA=;
	b=Not8bb/ryhqDxIY+iTi29fEmqzZvsRguwroSydLgomhMjYaA7BfVac0rPuzTZmGMyAvgbM
	20di2VXBP7ZrFfDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BDcTg0cH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="Not8bb/r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739888755; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tbf57XV86Tm6EvbxFqN8dNXgcVQxv+oJqp/TEZsU4UA=;
	b=BDcTg0cHVizXX78YYwxYcAVtQjVmjoJMdeFQpJFYTajpspZcIR2lbhuYdMjTQsCh2VdlRp
	y4j5prmifIXwFmVUC2ZvFZ0giFUyJ63SOI151Ti1RAoV6/VXxcUWZR9ya5Pp5PWHCpFn3v
	jc7RSUfDBASqK/5SoJZJPOWjvVrNmLE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739888755;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tbf57XV86Tm6EvbxFqN8dNXgcVQxv+oJqp/TEZsU4UA=;
	b=Not8bb/ryhqDxIY+iTi29fEmqzZvsRguwroSydLgomhMjYaA7BfVac0rPuzTZmGMyAvgbM
	20di2VXBP7ZrFfDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 37A7113A82;
	Tue, 18 Feb 2025 14:25:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gAMqDHOYtGdXYQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 18 Feb 2025 14:25:55 +0000
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
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 15/25] drm/omapdrm: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Tue, 18 Feb 2025 15:23:38 +0100
Message-ID: <20250218142542.438557-16-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: B79C71F449
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
	RCPT_COUNT_TWELVE(0.00)[20];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	R_RATELIMIT(0.00)[to(RLbwen1niosrcqbxsafh1),to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch to a multiple of 8.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/omap_gem.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index b9c67e4ca360..b8413a2dcdeb 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -11,6 +11,7 @@
 #include <linux/pfn_t.h>
 #include <linux/vmalloc.h>
 
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_prime.h>
 #include <drm/drm_vma_manager.h>
 
@@ -583,15 +584,13 @@ static int omap_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struc
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
2.48.1


