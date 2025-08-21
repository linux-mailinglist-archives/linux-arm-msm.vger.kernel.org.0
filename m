Return-Path: <linux-arm-msm+bounces-70096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCC4B2F21D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 10:35:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 109FD605A88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 08:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4682FDC2D;
	Thu, 21 Aug 2025 08:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LRzAb7R5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JGWPm1Fv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Rh8a0iic";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eQhNQcBl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5B02FD1B3
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 08:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755764582; cv=none; b=upl9IjMB97W8ggWMP+La1fyuP6nghyiPCTF6SsILs03qbB9tYVi/lzD1bGKqtycoqPdSLwVri17ICvFLLm3CGJoC78yyklFTfLdTlQ/zQSljwUHRL44XO17irK1hHMNxN3gw2e+DFcPzAzPL79edeWQHNQ8WEbI3kyYAu1e42ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755764582; c=relaxed/simple;
	bh=BtHtH8TNCnOKQN4SS/IbMmO5l2j5gZFILL+EG3Lc6kI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fEGd9R5NNNFWZuWAXvfQrFu6EE3JM6BWUniVS2o13P6FQctBMksetQR0xmThZBZ1tMvLisMEZxoA0ofwBjEVELnR4SlK/fncS2V85PPjGXMqnpGvpwIIu0QqjrRXkr+VjCGVIJ1+KR/nhtBz7u6nTb0cKob256ESMDKqGvv4c9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LRzAb7R5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JGWPm1Fv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Rh8a0iic; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eQhNQcBl; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C694E22649;
	Thu, 21 Aug 2025 08:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764543; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nBh8A449b9pBjsawDYVRKnwfjEEGjHJu27zIKTK/wpc=;
	b=LRzAb7R57dIPJBNXVDpuEfPJGUjHoyB4bgM2Yuu5DtIV6ctgdIIA/5X84NKzczszhZ/Au+
	FVmAUNGuUo4WhWIBbJunQssC8T5RPNNmMJ6iERFX7SDZX4vjSGnicUTNmmChh0Y+mrIjsg
	tn6YaWq9habCgIqj8RRxiewEqYlo3Vk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764543;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nBh8A449b9pBjsawDYVRKnwfjEEGjHJu27zIKTK/wpc=;
	b=JGWPm1FvFGwwdeCCIZRDlDEnSy4bftIDBSeEubb3nn19otp/RvZpIo0mtkg39koZG38iAX
	WBSwJilZ9RQp9UCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Rh8a0iic;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=eQhNQcBl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764542; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nBh8A449b9pBjsawDYVRKnwfjEEGjHJu27zIKTK/wpc=;
	b=Rh8a0iicg4WusmzRzMqJbXSRD5qO/Nt6aPBG5LEwwdhrTy6kP21RDFbM2bJ6Ko1b5mqGQu
	rKVVFeCxIfg53dzI82VkaIYmQCk2b7ZyFhnVez40mgNsyv+RY49gmyc8SjiDqzgKZ6k3N2
	ts0GTqLVOdokbHXNcBtRzr+VZfd0LnA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764542;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nBh8A449b9pBjsawDYVRKnwfjEEGjHJu27zIKTK/wpc=;
	b=eQhNQcBlgIDC9EwYXWg4r8RwMrmUn4Pd8NPToetKEgsXMvN+pAg0A/PKgqOQEgHsczB56h
	pNjH5rbofi6r0hAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4667513867;
	Thu, 21 Aug 2025 08:22:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YB7CDz7XpmhzEwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 21 Aug 2025 08:22:22 +0000
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
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v6 18/25] drm/renesas/rz-du: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Thu, 21 Aug 2025 10:17:25 +0200
Message-ID: <20250821081918.79786-19-tzimmermann@suse.de>
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,suse.de:mid,suse.de:dkim,suse.de:email];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: C694E22649
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -1.51

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch according to hardware requirements.

v5:
- include dumb-buffers header for drm_mode_size_dumb() (kernel test robot)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
index 87f171145a23..5fcade2b6054 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
@@ -11,6 +11,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -181,10 +182,11 @@ const struct rzg2l_du_format_info *rzg2l_du_format_info(u32 fourcc)
 int rzg2l_du_dumb_create(struct drm_file *file, struct drm_device *dev,
 			 struct drm_mode_create_dumb *args)
 {
-	unsigned int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
-	unsigned int align = 16 * args->bpp / 8;
+	int ret;
 
-	args->pitch = roundup(min_pitch, align);
+	ret = drm_mode_size_dumb(dev, args, 16 * args->bpp / 8, 0);
+	if (ret)
+		return ret;
 
 	return drm_gem_dma_dumb_create_internal(file, dev, args);
 }
-- 
2.50.1


