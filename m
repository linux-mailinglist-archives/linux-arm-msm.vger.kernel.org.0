Return-Path: <linux-arm-msm+bounces-113786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sAfKC/L8M2oiKQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 16:13:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E68866A0D6E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 16:13:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TXuvAm+A;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=N7z0xaf2;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TXuvAm+A;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=N7z0xaf2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113786-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113786-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=suse.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0B601300FC8C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 14:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106513F54BD;
	Thu, 18 Jun 2026 14:13:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839693DDDC4
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 14:12:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781791981; cv=none; b=rbQ2+H0AOUtGCdbO4z5HmbfYNAnnN/zuBxQIsnheL3vLcFtq3+h9tZYfAunr4zpvP4l8ePF7FY8b/6pTpGMhxbMO18QA0naT8aDgQQz4FgMb3xxG5NK191p29YsYIMAVAf7Pdxlm34AfQlyhxw1HdSlJ1W20mzE2nP1dwAToIa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781791981; c=relaxed/simple;
	bh=iJzU/5FMZ+cjb1ffSFgbxX5/4hbwxEHjblMkGIUqZ+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hviFy1jsUB3rUk8mNjArqbvQEwEvZe5xgtt0xgYQoygt6oIBgHSRvD887T4Kc8KodcDltW/+hOO0RqaSu/JFRl3zu5VE17JKQ0Pdis92GeI37V3vWOnx8zclkWIZvC44TgFPJAj52bp15GO9BqVI1qn7K1x8Y1rUZHHWsgzLnv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TXuvAm+A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=N7z0xaf2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TXuvAm+A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=N7z0xaf2; arc=none smtp.client-ip=195.135.223.131
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B780275C38;
	Thu, 18 Jun 2026 14:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781791976; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=XHS9rpHO2emFyRayn0+qlw2fZtQR1qQZlQIg7aPOj34=;
	b=TXuvAm+AUDHTT00aBB0N7g9k1mc9TNkMOZ8oJDqp8ppLEb94+4l8vlipIPh12p4ZOGp87N
	8LKeI400hzYwZgjFCkVKUlY3lNHSJHfkpVK9AW+SrXfCqC9uf8KgYBWB6xIsx7NH1EwPUo
	AIblNHMBzR6ZcSFvwRSyGlAwQnvIOUc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781791976;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=XHS9rpHO2emFyRayn0+qlw2fZtQR1qQZlQIg7aPOj34=;
	b=N7z0xaf2gpZp27mwKlmMj48n9bF9nsG7vOnpgBbz3OFscKs5XHPjNb4S87YvUVN9lzJZk9
	0tZVLXsTx9PAwOAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781791976; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=XHS9rpHO2emFyRayn0+qlw2fZtQR1qQZlQIg7aPOj34=;
	b=TXuvAm+AUDHTT00aBB0N7g9k1mc9TNkMOZ8oJDqp8ppLEb94+4l8vlipIPh12p4ZOGp87N
	8LKeI400hzYwZgjFCkVKUlY3lNHSJHfkpVK9AW+SrXfCqC9uf8KgYBWB6xIsx7NH1EwPUo
	AIblNHMBzR6ZcSFvwRSyGlAwQnvIOUc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781791976;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=XHS9rpHO2emFyRayn0+qlw2fZtQR1qQZlQIg7aPOj34=;
	b=N7z0xaf2gpZp27mwKlmMj48n9bF9nsG7vOnpgBbz3OFscKs5XHPjNb4S87YvUVN9lzJZk9
	0tZVLXsTx9PAwOAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C3BF779A8;
	Thu, 18 Jun 2026 14:12:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ogYRFej8M2o8DQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 18 Jun 2026 14:12:56 +0000
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
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/6] drm/msm: fbdev: Use client buffers
Date: Thu, 18 Jun 2026 16:11:31 +0200
Message-ID: <20260618141249.151338-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-113786-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:sashiko-reviews@lists.linux.dev,m:tzimmermann@suse.de,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,linux-arm-msm@vger.kernel.org];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E68866A0D6E

A client buffer holds the DRM framebuffer for an in-kernel DRM
client. Until now, msm created an internal ad-hoc framebuffer for
its fbdev emulation, while by-passing the regular interfaces used by
user-space compositors.

Convert msm's fbdev emulation to use client buffers. Replacing the
existing code with a client buffer allows for stream-lining msm code
and later also the fbdev helpers. The new framebuffer will be registered
against the client's file and will support handles for GEM objects. It
is then just another framebuffer within the DRM ecosystem.

Patches 1 and 6 change visibility of msm_framebuffer_init() during the
refactoring. It is the easiest way to refactor the fbdev probe helper.

Patch 2 and 3 inline the fb allocation code into the fbdev-probe helper
and fix it up a bit.

From there patches 4 and 5 convert fbdev buffer allocation to common
DRM helpes and client buffers.

If all fbdev emulation helpers can be converted to client buffers, the
emulation's whole framebuffer handling could possibly be moved into
shared helpers.

v2:
- clarify on the page alignment of the framebuffer size (Dmitry)

Thomas Zimmermann (6):
  drm/msm: Do not declare msm_framebuffer_init() as static
  drm/msm: fbdev: Inline msm_alloc_stolen_fb()
  drm/msm: fbdev: Fix error reporting
  drm/msm: fbdev: Calculate buffer geometry with format helpers
  drm/msm: fbdev: Use a DRM client buffer
  drm/msm: Make msm_framebuffer_init() an internal interface again

 drivers/gpu/drm/msm/msm_drv.h   |  9 ---
 drivers/gpu/drm/msm/msm_fb.c    | 98 +++++++++------------------------
 drivers/gpu/drm/msm/msm_fbdev.c | 85 +++++++++++++++++++---------
 3 files changed, 85 insertions(+), 107 deletions(-)


base-commit: fc59f76558703febba8056be87d1c97d14f7485e
-- 
2.54.0


