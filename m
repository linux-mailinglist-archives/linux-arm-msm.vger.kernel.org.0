Return-Path: <linux-arm-msm+bounces-44620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40649A07AD3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 16:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84BAC3A86A5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 15:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9802206AD;
	Thu,  9 Jan 2025 15:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Fe1uDndM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IS3is//a";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mPNZxbxW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qWKUwcnl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9238220682;
	Thu,  9 Jan 2025 15:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736435006; cv=none; b=gFD1LMG8PgJnOSl32g0WktQaVcXR9LFzcvN2TpKA3wOIz8LemSp33rbVi8AiGxkazJC2Jk30sFpluyrBrRycB0AAnhhSuTDmccjPafVY5ApbDc3XupQeMDTsf/biDw9PInbeBU0V7WduNjFUzzl7Dli17nqi4/LRrcmWCl1Si8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736435006; c=relaxed/simple;
	bh=w7p/wLDEu4Njua7a17vnAXUNsj2BjjDnhndyCVvLLGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nLhizLclls4IzQ4S+DdtBB8gMNHlx8UAoc1c88Mn72B3GLC53RaKw740tymMiYPWlKRsDTpZEHkpl84hhW2ZOA0SwB2yJtVERXnAeQ/G72Hvo79nHEzcIsr0i+iiKjvy2cBdbaO3RpTiEZLyeCE33FAYFWlApIRG+HiaN6UeYxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Fe1uDndM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IS3is//a; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mPNZxbxW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qWKUwcnl; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BAFFA21174;
	Thu,  9 Jan 2025 15:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736435003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AgJ1Uel3fQ0OFlYjfDZNvHPH7R5FmE1kSGP9lTwtvrY=;
	b=Fe1uDndM2y7P0uvzje0g0g0qeEJEDI2lgge0X0K7TDScfle35Lic5QYsPGtXFgdeCyWQdL
	VMicoZh4aAaZwRfbqOKlvSwqw5ySex6R7/MKzIzoy90Tx6gqa1M6Vb6IN11C4GJfAdqYfc
	pyKW9qvmiGnLL9SPCKK2Ir0/oXgAcRg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736435003;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AgJ1Uel3fQ0OFlYjfDZNvHPH7R5FmE1kSGP9lTwtvrY=;
	b=IS3is//aQ5D9PkvNXBl60gAhz0vI3nonfLEkLctfTgBtfLjh+vfRDyMpjnA/VB0R2wA546
	iIFWZJE0QInDgWCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736435001; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AgJ1Uel3fQ0OFlYjfDZNvHPH7R5FmE1kSGP9lTwtvrY=;
	b=mPNZxbxW1B1UdWkIay1zim9xbTFMuUyhV6RrZjYXa6GyM341tf4FDtC0KM0NuOfato3TbO
	Z7lIEA5yaCEwzUMTHDiFMGQz+IQEfiDTNR7+jGp4vXxmTKrXt8/i2SXdxm6xzmGA7L79Mb
	vYiB2Coam5Ct8oCetk3uJUWnOp127Ag=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736435001;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AgJ1Uel3fQ0OFlYjfDZNvHPH7R5FmE1kSGP9lTwtvrY=;
	b=qWKUwcnlINfcVzk4Fogtu8Rng/AVTI8qT4RTm+Em8OX+dIsxho6s2JLThdC3oHgt48Mlu3
	NinqtG50OUGTZmBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 24BE1139AB;
	Thu,  9 Jan 2025 15:03:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8J+aBznlf2c1awAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 09 Jan 2025 15:03:21 +0000
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
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 12/25] drm/mediatek: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Thu,  9 Jan 2025 15:57:06 +0100
Message-ID: <20250109150310.219442-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109150310.219442-1-tzimmermann@suse.de>
References: <20250109150310.219442-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,suse.de,kernel.org,pengutronix.de,gmail.com,collabora.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch to a multiple of 8.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_gem.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_gem.c b/drivers/gpu/drm/mediatek/mtk_gem.c
index a172456d1d7b..21e08fabfd7f 100644
--- a/drivers/gpu/drm/mediatek/mtk_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_gem.c
@@ -8,6 +8,7 @@
 
 #include <drm/drm.h>
 #include <drm/drm_device.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_prime.h>
@@ -124,15 +125,9 @@ int mtk_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
 	struct mtk_gem_obj *mtk_gem;
 	int ret;
 
-	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
-
-	/*
-	 * Multiply 2 variables of different types,
-	 * for example: args->size = args->spacing * args->height;
-	 * may cause coverity issue with unintentional overflow.
-	 */
-	args->size = args->pitch;
-	args->size *= args->height;
+	ret = drm_mode_size_dumb(dev, args, SZ_8, 0);
+	if (ret)
+		return ret;
 
 	mtk_gem = mtk_gem_create(dev, args->size, false);
 	if (IS_ERR(mtk_gem))
-- 
2.47.1


