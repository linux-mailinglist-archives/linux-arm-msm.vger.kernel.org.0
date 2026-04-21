Return-Path: <linux-arm-msm+bounces-103950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNQ6DGh052ke8AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 14:58:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 102F643B00D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 14:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2F9FE300A310
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1053BADA0;
	Tue, 21 Apr 2026 12:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="osfXnAlq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ucDb/2sa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="osfXnAlq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ucDb/2sa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995A33C457D
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 12:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776776273; cv=none; b=mzKWYDmLyEWELpCSD6USHHGfxZ1PKHsd+LT8vbLdvrwiGiMB2vjPv14AkKZ4asDIPnlgGX+Kgfbd5kwsD9J3fq9R/B2JZCgivNvuB64VZH0asSCFtkAfu9aomNvgkEwAKZbR8PQQ89fR6rUGwh+m5Qfx69kNvCrDOnNlFWPsTtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776776273; c=relaxed/simple;
	bh=ESEhu0/x8jObvQLQOHZ5Zsfd15ljSMU588FUTN5G3ZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PYY+A/qRGBzM0qBMQ1gdjvtd0V6H0H7eTHhoYIxPCijNSBiwGMXvFFhcU/Aj4xrR1FxOESm6dUEshENgjvbs2hAUUiwRATVqQc/+Az2nVt8OVlN3iHkS18mxhZK0jEWBrHtFeNSeoDUkUaUpSnk1Z55hG831uvb4m+ziwI3v3ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=osfXnAlq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ucDb/2sa; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=osfXnAlq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ucDb/2sa; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0C7275BD6B;
	Tue, 21 Apr 2026 12:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776776261; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S77ksX4WmkngeoY2UGla+vj75j/hAQc/8wcHa+T3Mz8=;
	b=osfXnAlqMORm4NSH+TczTg3w0evAjzx7ZXRB0DhC994246RdsKoFiv1Irug27nkvMmOSsJ
	7DqNFjI9n3UmksRYPfNxnLRhj5/5I21ZWuR+mg2twdQ/fzzjx5LpMFhJr+hrBk4cAOEGZT
	T4iJuW+ru8yCXJ3IXa3s9rZc+vaITOo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776776261;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S77ksX4WmkngeoY2UGla+vj75j/hAQc/8wcHa+T3Mz8=;
	b=ucDb/2sau0VXDgxn8T+4J9hJIUMYljdHLWZHVi7OrC3G1PTfw3wLNpds+UhRJx6+aBaJbw
	j005Xrjw99leIfDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776776261; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S77ksX4WmkngeoY2UGla+vj75j/hAQc/8wcHa+T3Mz8=;
	b=osfXnAlqMORm4NSH+TczTg3w0evAjzx7ZXRB0DhC994246RdsKoFiv1Irug27nkvMmOSsJ
	7DqNFjI9n3UmksRYPfNxnLRhj5/5I21ZWuR+mg2twdQ/fzzjx5LpMFhJr+hrBk4cAOEGZT
	T4iJuW+ru8yCXJ3IXa3s9rZc+vaITOo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776776261;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S77ksX4WmkngeoY2UGla+vj75j/hAQc/8wcHa+T3Mz8=;
	b=ucDb/2sau0VXDgxn8T+4J9hJIUMYljdHLWZHVi7OrC3G1PTfw3wLNpds+UhRJx6+aBaJbw
	j005Xrjw99leIfDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A8DA8593B0;
	Tue, 21 Apr 2026 12:57:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WB7LJ0R052labwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 21 Apr 2026 12:57:40 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/6] drm/msm: fbdev: Fix error reporting
Date: Tue, 21 Apr 2026 14:51:16 +0200
Message-ID: <20260421125733.209568-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421125733.209568-1-tzimmermann@suse.de>
References: <20260421125733.209568-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-103950-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: 102F643B00D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace deprecated error reporting in msm_fbdev_driver_fbdev_probe().
Use drm_warn() and drm_err() instead.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/msm_fbdev.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index a507f1de0c5d..1eb0368a6d07 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -114,11 +114,11 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 	DBG("allocating %d bytes for fb %d", size, dev->primary->index);
 	bo = msm_gem_new(dev, size, MSM_BO_SCANOUT | MSM_BO_WC | MSM_BO_STOLEN);
 	if (IS_ERR(bo)) {
-		dev_warn(dev->dev, "could not allocate stolen bo\n");
+		drm_warn(dev, "could not allocate stolen bo\n");
 		/* try regular bo: */
 		bo = msm_gem_new(dev, size, MSM_BO_SCANOUT | MSM_BO_WC);
 		if (IS_ERR(bo)) {
-			DRM_DEV_ERROR(dev->dev, "failed to allocate buffer object\n");
+			drm_err(dev, "failed to allocate buffer object\n");
 			return PTR_ERR(bo);
 		}
 	}
@@ -136,7 +136,7 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 						      mode_cmd.modifier[0]),
 				  &mode_cmd, &bo);
 	if (IS_ERR(fb)) {
-		DRM_DEV_ERROR(dev->dev, "failed to allocate fb\n");
+		drm_err(dev, "failed to allocate fb\n");
 		ret = PTR_ERR(fb);
 		goto err_drm_gem_object_put;
 	}
@@ -148,7 +148,7 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 	 */
 	ret = msm_gem_get_and_pin_iova(bo, priv->kms->vm, &paddr);
 	if (ret) {
-		DRM_DEV_ERROR(dev->dev, "failed to get buffer obj iova: %d\n", ret);
+		drm_err(dev, "failed to get buffer obj iova: %d\n", ret);
 		goto err_drm_framebuffer_remove;
 	}
 
-- 
2.53.0


