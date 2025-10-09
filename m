Return-Path: <linux-arm-msm+bounces-76659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D60BC949E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 15:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0E763E0BF5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 13:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8292E88B7;
	Thu,  9 Oct 2025 13:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aLgyG/QF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZJKWu9TK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aLgyG/QF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZJKWu9TK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098082C9D
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 13:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760016203; cv=none; b=ApI/RvK6qFcNxZE4l1mrI6YyRYswiqNcyDTQTOA+I2NKSweN2dFslVm7TcMW68l198EemTbcU7ZV0ROP3bQ3HOCIf+k+p3rPGCvosSzCkxNixfyioOl58kyg7ecUHShLz2MgJVSAEGQUdewgtGOiN5Q7PfO9Sugwt5s9KP4WUDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760016203; c=relaxed/simple;
	bh=ePEY06Si2JO87LEXMrHddcY3YjreONO/ek5qx6BvAi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eLlr0Cj71a6kcrw1bhTE8YPp6RiCVR3xj8FTVlFcFcZFu/9DyI4O7yAtB104CvtCI4tTRkpLZ3w9x+g78tGTzurD4m13WbauBcc/IaL7rsb0WudaGRX1GTs+YGJh5IX9GVtJkXP4jJQGDWzHmyY6iEGyNvmZedX08keoiyJqtTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aLgyG/QF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZJKWu9TK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aLgyG/QF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZJKWu9TK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 395571F7E7;
	Thu,  9 Oct 2025 13:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760016176; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xwzQ0SKlizCCwXOt8RJTik21J0MBmxveRLtKN2upYpQ=;
	b=aLgyG/QFZTllg109Vm7VYEXNsyhv/4/6db2+Yc/scE/lBP7dkA7VheD4vgMfd4ebuV6UtZ
	gdrBxdO03lTc2iw+FOcSR0eQgywhO+GCDcuDmJMiFUI2NyHseUxVNWhDgz7CdJ2Zk0uDnc
	1WtPrFd6/xffZi5zxM6j/9nKyATDR2o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760016176;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xwzQ0SKlizCCwXOt8RJTik21J0MBmxveRLtKN2upYpQ=;
	b=ZJKWu9TKYBlRfwE9H8hwUUeHlO2+k2aGaCU+DESSMtFvC6Ds+YbxdeA0bLnYRTibKr3TUq
	ZGAabxf9mdeK12Cg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760016176; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xwzQ0SKlizCCwXOt8RJTik21J0MBmxveRLtKN2upYpQ=;
	b=aLgyG/QFZTllg109Vm7VYEXNsyhv/4/6db2+Yc/scE/lBP7dkA7VheD4vgMfd4ebuV6UtZ
	gdrBxdO03lTc2iw+FOcSR0eQgywhO+GCDcuDmJMiFUI2NyHseUxVNWhDgz7CdJ2Zk0uDnc
	1WtPrFd6/xffZi5zxM6j/9nKyATDR2o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760016176;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xwzQ0SKlizCCwXOt8RJTik21J0MBmxveRLtKN2upYpQ=;
	b=ZJKWu9TKYBlRfwE9H8hwUUeHlO2+k2aGaCU+DESSMtFvC6Ds+YbxdeA0bLnYRTibKr3TUq
	ZGAabxf9mdeK12Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D7D1813A61;
	Thu,  9 Oct 2025 13:22:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wHh/My+352iECAAAD6G6ig
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
Subject: [PATCH 4/4] drm/client: Do not free client memory by default
Date: Thu,  9 Oct 2025 15:16:31 +0200
Message-ID: <20251009132006.45834-5-tzimmermann@suse.de>
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
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	R_RATELIMIT(0.00)[to_ip_from(RLb7ziy8p3fscxnwi7udzruu4s)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 

Make no assumption on the allocation of the client's memory. For
example, amdgpu stores a client within another data structures,
where it cannot be freed by itself.

The correct place to free the client's memory is the client's free
callback. All existing clients implement this.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_client_event.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_event.c b/drivers/gpu/drm/drm_client_event.c
index c83196ad8b59..f36fe0392ce6 100644
--- a/drivers/gpu/drm/drm_client_event.c
+++ b/drivers/gpu/drm/drm_client_event.c
@@ -39,12 +39,13 @@ void drm_client_dev_unregister(struct drm_device *dev)
 	mutex_lock(&dev->clientlist_mutex);
 	list_for_each_entry_safe(client, tmp, &dev->clientlist, list) {
 		list_del(&client->list);
-		if (client->funcs && client->funcs->unregister) {
+		/*
+		 * Unregistering consumes and frees the client.
+		 */
+		if (client->funcs && client->funcs->unregister)
 			client->funcs->unregister(client);
-		} else {
+		else
 			drm_client_release(client);
-			kfree(client);
-		}
 	}
 	mutex_unlock(&dev->clientlist_mutex);
 }
-- 
2.51.0


