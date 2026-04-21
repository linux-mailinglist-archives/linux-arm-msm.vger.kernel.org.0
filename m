Return-Path: <linux-arm-msm+bounces-103946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGrJHF5052ke8AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 14:58:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5002C43AFF1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 14:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1E2DE3002B00
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DADCC3D16F9;
	Tue, 21 Apr 2026 12:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e/oEekfA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9GwQ2rBn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e/oEekfA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9GwQ2rBn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812323BADA0
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 12:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776776262; cv=none; b=Ex1t08p168rC4tafIwXCNNEf+bDT8vNqTvD/xOYb7tHo+xX0yHgvhqawmmn3I4z+PXxmGFcZMc5I7d++0nhVha3pP0c718Bw5PbpqACJ1RWPzRUkS9N1ODWyGiUK6EV90p4M1DtvDb8do4S4xeUW3A2K4rsYkghysPuAEoNXBks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776776262; c=relaxed/simple;
	bh=X/LvR3hQSXS+LV6qh3FacC4q91bcm2puZ4GKtn2R1uQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Eb1cxALBVLYNElMEWYSrx/haUy8FfhlScbyCvgkIiPXkABevk1hSeCBDYMCtjYVuZjwL1SK296WJwWg1DAu/XyPmGVM7O0g9QwRGAV23KZ+WYU6lFfmnujNc9KaAGW+LIRI8U0cfyi44hzPB1qsKVrOIeoajEFQFGSWIV4Ezfu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=e/oEekfA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9GwQ2rBn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=e/oEekfA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9GwQ2rBn; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DEB595BCD2;
	Tue, 21 Apr 2026 12:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776776259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iH5kRLztgtCWlEtoeJ/2z/IYlNkSqYYUornD/uJQ4W8=;
	b=e/oEekfAulJ8j/h8ihn3KB8imuafhYKC89oS5ym4p4lzc4lFYh73bxu+AK4uDas5hqgk7N
	GHa96o76Dq7HZGbjJQ8xuAjIEHf4N9nADQoEebT1hYs0Ls+7TC+TAne7KmuHM90sfZHZjR
	G10g4uBk8Wv9FcX3UtguJffFD5GhI8s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776776259;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iH5kRLztgtCWlEtoeJ/2z/IYlNkSqYYUornD/uJQ4W8=;
	b=9GwQ2rBnimlmeIxrn7K/OxUkHVMKLpxnJtjHBnfc/Xj+ZRf6MnfxnzyjJkbb+ix0yudHct
	e3Lm2e1KKpP0ZmCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776776259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iH5kRLztgtCWlEtoeJ/2z/IYlNkSqYYUornD/uJQ4W8=;
	b=e/oEekfAulJ8j/h8ihn3KB8imuafhYKC89oS5ym4p4lzc4lFYh73bxu+AK4uDas5hqgk7N
	GHa96o76Dq7HZGbjJQ8xuAjIEHf4N9nADQoEebT1hYs0Ls+7TC+TAne7KmuHM90sfZHZjR
	G10g4uBk8Wv9FcX3UtguJffFD5GhI8s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776776259;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iH5kRLztgtCWlEtoeJ/2z/IYlNkSqYYUornD/uJQ4W8=;
	b=9GwQ2rBnimlmeIxrn7K/OxUkHVMKLpxnJtjHBnfc/Xj+ZRf6MnfxnzyjJkbb+ix0yudHct
	e3Lm2e1KKpP0ZmCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8A9AC593AF;
	Tue, 21 Apr 2026 12:57:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ShRpIEN052labwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 21 Apr 2026 12:57:39 +0000
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
Subject: [PATCH 0/6] drm/msm: fbdev: Use client buffers
Date: Tue, 21 Apr 2026 14:51:13 +0200
Message-ID: <20260421125733.209568-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-103946-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: 5002C43AFF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

-- 
2.53.0


