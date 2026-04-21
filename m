Return-Path: <linux-arm-msm+bounces-103952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMU6C25052lc9AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 14:58:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FB843B023
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 14:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 22F5C300B1BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BCAB3BD653;
	Tue, 21 Apr 2026 12:58:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BEE3BADA0
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 12:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776776279; cv=none; b=C8ZsM7dpr87C+UMCkyXewRjmyQw+J2jh+JW78/B8aAl6foFTnpDlWmYo2VffkJte+Z541fkYnRtg4GsXsBbV9rVWzNUcnM7KcNOGWYWuG9a/0BbcaRD1cPob5FXoUzNyfeX9kSBVVfiO/PyqvoNiW+AkF95HYZu3TIekC4w3PCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776776279; c=relaxed/simple;
	bh=SCejPuGN7YvzdZ1IbuvOnmMAX5FE10CE91k6rLkCQos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nQ+jMZX4gG6hJoYSOkzbgqTwxhYB9RvkiK53ky1KyXwXmuhvKdbuiVaxzGH3S1U4uZ0uSwQgMjcPVC9xnszRMd/aVCQ5WIreOa2KW4jimdJVvVJRYjjPrE5VGoiKrm4zEf8IuEawW7+Lc6pVkuhrhK9iGhYV6f26AAcFFnzJWyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 32E6D5BD71;
	Tue, 21 Apr 2026 12:57:42 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D0C82593B0;
	Tue, 21 Apr 2026 12:57:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SAzKMUV052labwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 21 Apr 2026 12:57:41 +0000
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
Subject: [PATCH 6/6] drm/msm: Make msm_framebuffer_init() an internal interface again
Date: Tue, 21 Apr 2026 14:51:19 +0200
Message-ID: <20260421125733.209568-7-tzimmermann@suse.de>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[suse.de : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-103952-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,suse.de:mid,suse.de:email]
X-Rspamd-Queue-Id: 06FB843B023
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The only caller of msm_framebuffer_init() is msm_framebuffer_create()
from the same source file. Declare the former as static.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/msm_drv.h | 4 ----
 drivers/gpu/drm/msm/msm_fb.c  | 8 ++++----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 00c50d7437d6..5c12bc4c810a 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -259,10 +259,6 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb);
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane);
 struct drm_gem_object *msm_framebuffer_bo(struct drm_framebuffer *fb, int plane);
 const struct msm_format *msm_framebuffer_format(struct drm_framebuffer *fb);
-struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
-					     const struct drm_format_info *info,
-					     const struct drm_mode_fb_cmd2 *mode_cmd,
-					     struct drm_gem_object **bos);
 struct drm_framebuffer *msm_framebuffer_create(struct drm_device *dev,
 		struct drm_file *file, const struct drm_format_info *info,
 		const struct drm_mode_fb_cmd2 *mode_cmd);
diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index dec550e6cf75..60c108d35d2a 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -134,10 +134,10 @@ const struct msm_format *msm_framebuffer_format(struct drm_framebuffer *fb)
 	return msm_fb->format;
 }
 
-struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
-					     const struct drm_format_info *info,
-					     const struct drm_mode_fb_cmd2 *mode_cmd,
-					     struct drm_gem_object **bos)
+static struct drm_framebuffer *
+msm_framebuffer_init(struct drm_device *dev, const struct drm_format_info *info,
+		     const struct drm_mode_fb_cmd2 *mode_cmd,
+		     struct drm_gem_object **bos)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
-- 
2.53.0


