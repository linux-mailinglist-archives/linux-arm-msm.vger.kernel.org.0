Return-Path: <linux-arm-msm+bounces-76657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 59547BC94A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 15:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C15CC4F9B15
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 13:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68DE92E8B8A;
	Thu,  9 Oct 2025 13:23:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B815A2E8B6C
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 13:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760016191; cv=none; b=UE/VL3hsWVWOuD5IZ+2HOB6uN1oxjCsNFX9JamZSTPhp+xqnaSc6n53oZmmXE2qXHl/RW9xfuEv0Bn0/z7snAPKscyZq5rFAP2tu5BpvvSIjsqcUXJ8tDIukZ7Sn1uKeRJrB5v3SBC7bVerrJQxRi0cPpUphxAc3mBygqk/1u3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760016191; c=relaxed/simple;
	bh=66jOgRHiBHtkl6xQyy4lKgcAC9jP8PXs4Y5w+ddm03w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S1MzjmeeXHY7IPjw7eAngqLyv4nK3CdI3y46dcpls3/77zepFRehfKb76GA9NYRV3vcqzm1pA7wcVB2sPDua6DjTRWKoLXNbnTs5MBugVDefcDbjRkQfIUL8MYfjNX1HPUg2lts/9FKVWYwu8cWmhUnb/13HoKUh+MGVkJ5Hvdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 731CE1F7C5;
	Thu,  9 Oct 2025 13:22:55 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1E42C13A61;
	Thu,  9 Oct 2025 13:22:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wMoyBi+352iECAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 09 Oct 2025 13:22:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/4] drm/log: Do not hold lock across drm_client_release()
Date: Thu,  9 Oct 2025 15:16:29 +0200
Message-ID: <20251009132006.45834-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009132006.45834-1-tzimmermann@suse.de>
References: <20251009132006.45834-1-tzimmermann@suse.de>
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
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 731CE1F7C5
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00

When calling drm_client_release(), the client is already quiescent.
Internal locks should therefore be dropped before the caller releases
the client.

In the case of the DRM log, concurrency originates from the console or
from client events. The console has been unregistered in the previous
line. The caller of the unregister callback, drm_log_client_unregister(),
holds clientlist_mutex from struct drm_device to protect against concurrent
client events. It is therefore safe to release the client without holding
locks.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/clients/drm_log.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
index d239f1e3c456..116e0ef9ae5d 100644
--- a/drivers/gpu/drm/clients/drm_log.c
+++ b/drivers/gpu/drm/clients/drm_log.c
@@ -302,8 +302,8 @@ static void drm_log_client_unregister(struct drm_client_dev *client)
 
 	mutex_lock(&dlog->lock);
 	drm_log_free_scanout(client);
-	drm_client_release(client);
 	mutex_unlock(&dlog->lock);
+	drm_client_release(client);
 	kfree(dlog);
 	drm_dbg(dev, "Unregistered with drm log\n");
 }
-- 
2.51.0


