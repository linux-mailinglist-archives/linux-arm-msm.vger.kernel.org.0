Return-Path: <linux-arm-msm+bounces-114417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EHJRJeYvPGpylAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:28:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D726C10AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:28:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CKphm4A6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114417-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114417-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0709A3010207
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8096382383;
	Wed, 24 Jun 2026 19:27:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5116A38398E
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:27:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782329270; cv=none; b=PwLrexaLPwdENfrZ1fJXPvdqk8XdN18q+oDhOPjYK07An7r7rE+ZTeQOpUByV2wD93gYmf5F2dbYHv3KX0drtUL2Gj+JVfyLZM0yySq4Vs0xfJ8/wCeDDRXJIkvTQi46i3TIS5yIwQwOz8Q9my4zkwrbJgbP/I4WnOLJtNGp/Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782329270; c=relaxed/simple;
	bh=4G3Vq2EmQSdqmBgSPGmHBBAmA2KZFztTi3V66UMmoN4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JaTiTA8V3qt/9KCMzajGj+jTOhLtOLmuI0viI81WMhtoDZZYgXCgK9cdV/49l+jdcTkukZ2QFFOTilorWmb9l/cxPGFERPa+YITQHwvECsJljAPABmNpGxfLbtv3fGF5c315WH/e/GFKdVKKfvnxLmhjkio2vwU2IgES8fr9vu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CKphm4A6; arc=none smtp.client-ip=74.125.224.51
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-664346e66daso1068513d50.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782329268; x=1782934068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+BitzJFDbUPVda/ZhCxrpv+F0X4dQ/6HuYsKwRcXpws=;
        b=CKphm4A6XTMkPkkFy23Y5yF2MDNLwEiU0kl+P6aV65kZHt8yB1dwrB8CKBCR1nbVHN
         G80ix4xFv/CPdUZ5N0PnfNTDLI/ZTexMjQzXpdwIaG4xAWKgG9TehyFSIqu087sJt5Iw
         uRTlFTx78jayQKY4sJo6+zAiOl0TG4kD6Oyzr/yNWhHANWew29J5BTQgMJ6T9n3RJvO7
         58z5osc0ij9hS01kwsgadHVVDAFTGjPAiliWnReZ2ljqQzveB1JpXA4szp+eMI4zf4ev
         bHIesMg9ScB/+k0j/bL8WKSi/fzEMqsfbPUxwTJWLMD5rPxOs6HZNA/X5zSI8Bh3UjDR
         cRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782329268; x=1782934068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BitzJFDbUPVda/ZhCxrpv+F0X4dQ/6HuYsKwRcXpws=;
        b=MANboZLGPADeOcG5ozMKtSnQEIuhQXLzHoFG7daeU90oLj5YTVK0PSBKdxAYbr1jQ5
         /4aFbM2K9I4uytqlpfHmyv4ztpznSzoJM7VOn6RYC4h0Yhb02OwLuTrYigzMUcyVnJK6
         Ol03RJQ1vTwBSvrOOWr/noB6/sRtSCbHG1VJ75jmrtciApbCOIlM/kxNRoLiz+k1nPR1
         9rq+fgAYnqnHu9/8Tv1jsp8CTjXpo7qi7FqtJNp7gTY80qURQngUm6xc3iVO0B0lpdH2
         Ey2Pzi1KmURaidtuEW9bAqEWIe94xUNPiG+52IdrPF6kIH7ay+TMiU2k1FSx7LethXRE
         oQTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7GdGyzNCv5gVBiLnTlW+iUHsc3Dfn+djajhngtULz+KLAtaga5dG5DfcLjxKopWgEKKbjb72t//Yfg0sz@vger.kernel.org
X-Gm-Message-State: AOJu0YyDaIBzYZKcCJCmTKnu88+hgAwUHi6nkQkmjEXanHxhq66L5Uan
	vjRYbH3J+Q/X7r6PS73REomTvrmVDEKD3bZUrq5XLRtY6/Qw7mWR2My+g/YgW7XLNnoi0w==
X-Gm-Gg: AfdE7ckHVLPQuLeFz/1U6AxRoKYYukO5Rb4GyEP4yWYUDXVDYqXWqp8LVmnEDiHFFBh
	tLfC+oJePxKrzJJ7IjMUEMVZVu2k+MQycfTwOqdK7jPe30f+/q53sSjo9w0+7g+UzZEb4v1RfCK
	HrEPJYbGMxpBB7Ps8rxkRgMfh9M7izPCaN+ZAdQcv1eypgflOPlXU7YGG0BLCmZM46/hANu3S9i
	SbkT0oNkMptTzDqyI5JTVj6rFAxb4cyZWlvbkV4fstpfOwgyYFN906eBvUUgVkzSjCQ49qbskNx
	VOstD0a426arCnp4qBJ0znViquVZjnhEkJY5JzFAurW9oV0YsZbQ+y0VcgJKywr++ZVTh/WTpP/
	D/8ZvFAarwF1IXdifQ0MDlGpnmWmiXIIvZ6+WvFPXp5JCXes71iXNOe+q1nefqqzBilXbmmsVCz
	WSKZ+4fKQzvbR2C4pLO3KYCKFa4g==
X-Received: by 2002:a05:690e:13cf:b0:65e:a838:e9d1 with SMTP id 956f58d0204a3-6636e6711d4mr4363227d50.59.1782329268360;
        Wed, 24 Jun 2026 12:27:48 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6647f926750sm329747d50.12.2026.06.24.12.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:27:48 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] misc: fastrpc: release pending invoke refs on rpmsg removal
Date: Wed, 24 Jun 2026 21:27:00 +0200
Message-ID: <20260624192700.5388-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,linuxfoundation.org,vger.kernel.org,lists.freedesktop.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114417-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:alhouseenyousef@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alhouseenyousef@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alhouseenyousef@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 95D726C10AC

fastrpc_rpmsg_remove() wakes pending invoke waiters when the rpmsg device
is removed, but it does not release the send references taken before each
request was submitted. Those references normally disappear only when a DSP
reply arrives, which cannot be relied on after endpoint removal.

Walk the channel IDR during removal, mark in-flight contexts completed,
and schedule the send-reference put while waking waiters with -EPIPE. This
prevents disconnected channels from pinning invoke contexts indefinitely.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/misc/fastrpc.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 90281859a..bfdf8ab6a 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2580,30 +2580,31 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	return err;
 }
 
-static void fastrpc_notify_users(struct fastrpc_user *user)
+static int fastrpc_notify_context(int id, void *ptr, void *data)
 {
-	struct fastrpc_invoke_ctx *ctx;
+	struct fastrpc_invoke_ctx *ctx = ptr;
 
-	spin_lock(&user->lock);
-	list_for_each_entry(ctx, &user->pending, node) {
-		ctx->retval = -EPIPE;
-		complete(&ctx->work);
+	if (ctx->sent && !ctx->completed) {
+		ctx->completed = true;
+		schedule_work(&ctx->put_work);
 	}
-	spin_unlock(&user->lock);
+
+	ctx->retval = -EPIPE;
+	complete(&ctx->work);
+
+	return 0;
 }
 
 static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 {
 	struct fastrpc_channel_ctx *cctx = dev_get_drvdata(&rpdev->dev);
 	struct fastrpc_buf *buf, *b;
-	struct fastrpc_user *user;
 	unsigned long flags;
 
 	/* No invocations past this point */
 	spin_lock_irqsave(&cctx->lock, flags);
 	cctx->rpdev = NULL;
-	list_for_each_entry(user, &cctx->users, user)
-		fastrpc_notify_users(user);
+	idr_for_each(&cctx->ctx_idr, fastrpc_notify_context, NULL);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	if (cctx->fdevice)
-- 
2.54.0


