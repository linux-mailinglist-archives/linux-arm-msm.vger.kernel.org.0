Return-Path: <linux-arm-msm+bounces-12685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72699868F47
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 12:39:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE2201F27A94
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 11:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32DD13AA2A;
	Tue, 27 Feb 2024 11:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OGYB/TFI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eeoPV/N2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OGYB/TFI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eeoPV/N2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590A413A86C
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 11:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709033949; cv=none; b=dCUMPZwfBcjWf2SNVHggiSSi+EC27wmufnXoxsHUxtsShNw3+rc8jC4SJ7StVsOUwys+j2mw8+kRbDI/ZZ9JiCHFRt14yM4ZC2XtTuwRxqfyCf9W5eleRI2o1vaNZHsevG/0CmW54uGPplVysjYYVLVhxIXzj0mfu+gm4UjNdOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709033949; c=relaxed/simple;
	bh=bDCk6aaVja4tIJ7Q8QjayXJLzGTsyOGfF51Ls8U7eMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pQ1Uq+EXLlRlTdC0q4rvHddXCSa2q1RkR/QPhQtpiemXwh4DP6vuBBQv8k33lGeqLpT57IbSUrXRszvpPYg8qXOwOQqoUhgntps54ClIe4nC0ow5fOPBXP/9HKnCMBPXQ4QIHWp3MFLi/pRn2FsyJBIhuwp7jXaEuaP5ra2pKLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OGYB/TFI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eeoPV/N2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OGYB/TFI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eeoPV/N2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AEB5D22758;
	Tue, 27 Feb 2024 11:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709033946; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eAl6IL4nDxzJ3Bsr51G5/lRG9ArSaV55PQQnGIZK2fk=;
	b=OGYB/TFID+1od+563ApTybS4aqZdMPpYo7wYXesoGjHAe1FtgzgmpRph4xVvPwFzNORFrU
	8Hi/alaJ5oLGpxn0LaA7GXT2ZgWQv0UGKH28z9cYc00Rx45W7D8efa5MBS9/vtOgZOZ7XR
	y6p/QUDjfrnogPtOgKtbONmBBJLtX68=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709033946;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eAl6IL4nDxzJ3Bsr51G5/lRG9ArSaV55PQQnGIZK2fk=;
	b=eeoPV/N2wEQwzdVtVPmJ/33be/IhdaRvAtJdCDpgAFPTCxXXSUiI54ICLcugmnH4xu+dJs
	CyKQoOjL0uCMZAAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709033946; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eAl6IL4nDxzJ3Bsr51G5/lRG9ArSaV55PQQnGIZK2fk=;
	b=OGYB/TFID+1od+563ApTybS4aqZdMPpYo7wYXesoGjHAe1FtgzgmpRph4xVvPwFzNORFrU
	8Hi/alaJ5oLGpxn0LaA7GXT2ZgWQv0UGKH28z9cYc00Rx45W7D8efa5MBS9/vtOgZOZ7XR
	y6p/QUDjfrnogPtOgKtbONmBBJLtX68=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709033946;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eAl6IL4nDxzJ3Bsr51G5/lRG9ArSaV55PQQnGIZK2fk=;
	b=eeoPV/N2wEQwzdVtVPmJ/33be/IhdaRvAtJdCDpgAFPTCxXXSUiI54ICLcugmnH4xu+dJs
	CyKQoOjL0uCMZAAg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id E864313216;
	Tue, 27 Feb 2024 11:39:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id KD9SN9nJ3WVMUQAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Tue, 27 Feb 2024 11:39:05 +0000
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
Subject: [PATCH 13/13] drm/qxl: Do not pin buffer objects for vmap
Date: Tue, 27 Feb 2024 11:15:00 +0100
Message-ID: <20240227113853.8464-14-tzimmermann@suse.de>
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
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="OGYB/TFI";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="eeoPV/N2"
X-Spamd-Result: default: False [0.45 / 50.00];
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
	 BAYES_HAM(-2.24)[96.39%];
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
X-Spam-Score: 0.45
X-Rspamd-Queue-Id: AEB5D22758
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Bar: /

Pin and vmap are distinct operations. Do not perform a pin as part
of the vmap call. This used to be necessary to keep the fbdev buffer
in place while it is being updated. Fbdev emulation has meanwhile
been fixed to lock the buffer correctly. Same for vunmap.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/qxl/qxl_object.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index 39218e979a807..5893e27a7ae50 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -164,10 +164,6 @@ int qxl_bo_vmap_locked(struct qxl_bo *bo, struct iosys_map *map)
 		goto out;
 	}
 
-	r = qxl_bo_pin_locked(bo);
-	if (r)
-		return r;
-
 	r = ttm_bo_vmap(&bo->tbo, &bo->map);
 	if (r) {
 		qxl_bo_unpin_locked(bo);
@@ -243,7 +239,6 @@ void qxl_bo_vunmap_locked(struct qxl_bo *bo)
 		return;
 	bo->kptr = NULL;
 	ttm_bo_vunmap(&bo->tbo, &bo->map);
-	qxl_bo_unpin_locked(bo);
 }
 
 int qxl_bo_vunmap(struct qxl_bo *bo)
-- 
2.43.2


