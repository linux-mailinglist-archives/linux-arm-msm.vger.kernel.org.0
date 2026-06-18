Return-Path: <linux-arm-msm+bounces-113790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dq3xIv/8M2o4KQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 16:13:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 252FD6A0DAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 16:13:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=W4iDUSE+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kMsHVRIy;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=W4iDUSE+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kMsHVRIy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113790-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113790-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=suse.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05EB9301CFAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 14:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86D42EC083;
	Thu, 18 Jun 2026 14:13:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD0C3B2FC2
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 14:13:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781791992; cv=none; b=byOtMhNwaIsSNhlINdpTJYPGnUeZXdtRM7xRCELQlS5Mira08lyPwr7ybKAWhUWKKOJVXr/8kE7/tmwd2vu6kjC3z0mMHVK3zcllg0OQGFpcIu3LpDNvOMYI4/H0uApB4yXmd+E5mvTwYO5UphFGRtvnTa07E5KOo9iO/yirTTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781791992; c=relaxed/simple;
	bh=hsnvPkWe/XUFehHDNecGLFJBWgwQ+VmpHnlubltg+5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UaFOenrsY4ogeow3wpbJW/Mj6NmvsBeiXGxnNhFZRnMkosVzMEwiJjsKzygePfGcLGkDb6cJd9himqaJ+tFdP2YNHTjgLI6HbxWI3H9V+o+7aMYc6JJ5YEtveYm/9U7GjpBwFrWoFp4e9Dc2fszN0XE001/wHyx2WkSy8adtMfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W4iDUSE+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kMsHVRIy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W4iDUSE+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kMsHVRIy; arc=none smtp.client-ip=195.135.223.131
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DDB5D75F6E;
	Thu, 18 Jun 2026 14:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781791977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qnUsmQJNzFL8yHqOFdp+UjS+G/WBEj/XVx2imYlhiEA=;
	b=W4iDUSE+OwqlUo+cxFieIZCoCblJ7gYnxhjTlOho6ezacIb7Ax8RPRyp0Wj62+YwTIJnku
	DSacblxfuFMdwOQFfDcG5V1lFeirc3B67l/Vc3yKvLfGDELlcntpqVynKsyDlcSGJYyG+4
	JJ+Ga3zpx5tPD4Crgh399ARnXjcYXxQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781791977;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qnUsmQJNzFL8yHqOFdp+UjS+G/WBEj/XVx2imYlhiEA=;
	b=kMsHVRIyqf4vHQ8X2euldXgIEaDSCOp6gCTtUpJa/iCAfbQEV1HzmVDbDf5dBTeVGB459c
	ZmQrmEbu2gcyHhDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781791977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qnUsmQJNzFL8yHqOFdp+UjS+G/WBEj/XVx2imYlhiEA=;
	b=W4iDUSE+OwqlUo+cxFieIZCoCblJ7gYnxhjTlOho6ezacIb7Ax8RPRyp0Wj62+YwTIJnku
	DSacblxfuFMdwOQFfDcG5V1lFeirc3B67l/Vc3yKvLfGDELlcntpqVynKsyDlcSGJYyG+4
	JJ+Ga3zpx5tPD4Crgh399ARnXjcYXxQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781791977;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qnUsmQJNzFL8yHqOFdp+UjS+G/WBEj/XVx2imYlhiEA=;
	b=kMsHVRIyqf4vHQ8X2euldXgIEaDSCOp6gCTtUpJa/iCAfbQEV1HzmVDbDf5dBTeVGB459c
	ZmQrmEbu2gcyHhDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8716C779AB;
	Thu, 18 Jun 2026 14:12:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YFXBH+n8M2o8DQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 18 Jun 2026 14:12:57 +0000
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
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 3/6] drm/msm: fbdev: Fix error reporting
Date: Thu, 18 Jun 2026 16:11:34 +0200
Message-ID: <20260618141249.151338-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618141249.151338-1-tzimmermann@suse.de>
References: <20260618141249.151338-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-113790-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:sashiko-reviews@lists.linux.dev,m:tzimmermann@suse.de,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,linux-arm-msm@vger.kernel.org];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,suse.de:dkim,suse.de:email,suse.de:mid,suse.de:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 252FD6A0DAA

Replace deprecated error reporting in msm_fbdev_driver_fbdev_probe().
Use drm_warn() and drm_err() instead.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
2.54.0


