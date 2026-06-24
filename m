Return-Path: <linux-arm-msm+bounces-114408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ruT9DZYtPGodlAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:18:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E0F6C0FBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:18:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cq8wPxqG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114408-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114408-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF66F302A530
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B237A37475D;
	Wed, 24 Jun 2026 19:15:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4763749FB
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:15:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328503; cv=none; b=OvIoyyCj0BvTafGzT83IPvx/0rPLT0/SWFg2ZpcVdMRajelIu1pA0dTzciV7CKc4YGpXtBmRGOn/VVgNoqR4JU9N5p5Ivr9gCLW4EM1QgsGwPL4QUNyY3MFEb4coKu76jtwnSkmo1PjKjhW7yZcJ/jDib+GruQwIPHNsTGQjsos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328503; c=relaxed/simple;
	bh=8MYFF2zlb6LuwYfyVCrnVmdPuC01XndXgwyPfsA37ZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UKhxA7VXGAh0ietAmA3dz0IY2Hg6yg9aFBRe8p3cA0Tz+U/NKbqrdxPqo+l921L0pSUPUxC2N74xVrssDHKwXSZi6Ekb2uforocnWQnC7SAD+5baE8BBqsZVcwInxXXXkq4Hv03W1TAmEnUY7jqbKF5WXiWXrNVwLa4/2lyHm5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cq8wPxqG; arc=none smtp.client-ip=209.85.128.175
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-80a322a33d6so259207b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782328500; x=1782933300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7sROD5HlkA+LmTbleM4dPRK+UQLEfjLcyo66jmPeZ7M=;
        b=cq8wPxqGgSwgC7B8Kq/QujONgctdzygRyC02rIR6+9g9dwjv+aB2ueEdmeL/zY9qeB
         yIUPAqC3CvsSCGmXtLAKYgsMSklhKdr4nMEbUXcjIUPReXpSnSBF1tbOVD4oYWZzHuh2
         cpNw1hnj+j6kt/VczALIpxeQu2pbKk7Dsw+JdkNhCwl0P5cG5Ev558eDG9T2WtPHKnBc
         xCvE9KbHRqCGe8mQDXu4Ga5alG1QQ5JJIW7QWpV0W5jQDxJ1qpX47SC54VNN9+u+bNle
         dccdE85x78HKh+TQjjqzxHXiksi1s9Y8SRkPsLR+6L/e2QYLpLqkMMTjyJSm9gwcZaWB
         n4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328500; x=1782933300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sROD5HlkA+LmTbleM4dPRK+UQLEfjLcyo66jmPeZ7M=;
        b=UPACK6KN6ctyRMUoabOAp7Z/YjQirb2Mp+sEOqNIzRpVZPOgkAk5hhPlA8WOBuUwq6
         sCDaXPj0gxe05e9iHTHYyqkWZ93rW14Uc5yznbwSiz0iwOoFC3LI/jzWVK7tp0nsGPMs
         kWr9IdPEYTEjsZkHnfoCwkVoVgxWtUVlJqg3xM+n6DQVubvpx+Pi1V4yeJkhkRalxIRH
         hiw9scHlFzQd+Cyn4EoZnaZ9E8JgXtjpMbcOa4XhGobFT/QprK3mkaViV7YhY6LxTreg
         OxZ43TAVtOH5Bg9ce82qFk57PwnaOPyRArueY5NBaW3cuD7+oqmjUEvn0+tR0ifFLVuy
         p2yg==
X-Forwarded-Encrypted: i=1; AHgh+RptRY9wc04SFTtqFlX1+88oG+a6bJSGtUtuIT1nJ6M/tyxAYF6kyFMItpfCpRLme1XfoEyMhDLwGxHFluL1@vger.kernel.org
X-Gm-Message-State: AOJu0YypkTWsiDaS9rxDzvQS1fyZsEolMrFXSlswQ+Nkf7MJGsTkES4W
	poUc1k69E9M+9MmeniueKB78k4M2ILfXKCZ6/C9G8XASnRu8nQRPhi0/VQTX0kBsDkn3ww==
X-Gm-Gg: AfdE7cm2C0uI02kqdDgO7vPjtupcohkwCbZPhyyxcHgrSQ3LwhQGt+kveND46zE/jB0
	V4V/bYdwuuMn0zB5//3SEOSH48iBcCrP9tRcDub5bEJPwyD6b0wuvHytx+ykp2MLp00VahmTPqP
	QYGEgT72oIPD+2OXIjOiLqUIzoyi6qWGhEO4suPQVSOSaFmHgt5p7nloWDSZFrDUuOBsvz3HdBf
	Y21QTBY+YOPeVNEuHCxBH1H+w5Vfk7XvKDKNbbm13Aay/0b0WTkb/kv2c0fFAOVpUAmD+DYKu7Q
	KBgx3ETZQPrh1ffaQSFeFMt0g8uFoW8Q3etLwV89VDEJEtCELdsb9YXu8yIw5erMpzTn00IW7DV
	oj4fpTR8AOpfOR6YGBPFJbjSOaAOJOzcvS3HNqt/amAp8iXvfNBOaDPzNNpQGZnzDLjv6Yw3l+H
	+vnLU4n6PGPW97pHYc9e2JRQeZiQ==
X-Received: by 2002:a05:690c:b14:b0:7d4:3090:f39 with SMTP id 00721157ae682-806c43f58f3mr92422577b3.42.1782328500344;
        Wed, 24 Jun 2026 12:15:00 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8025cf63680sm62743047b3.19.2026.06.24.12.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:14:59 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] misc: fastrpc: ignore unsent and duplicate invoke replies
Date: Wed, 24 Jun 2026 21:14:15 +0200
Message-ID: <20260624191415.4034-1-alhouseenyousef@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,linuxfoundation.org,vger.kernel.org,lists.freedesktop.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114408-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:alhouseenyousef@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alhouseenyousef@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 97E0F6C0FBA

fastrpc_rpmsg_callback() drops the invoke reference taken before sending
the request. The callback can currently consume a reference for a guessed
context ID before the request has been sent, and duplicate replies can
schedule multiple puts for the same send reference.

Track whether an invoke has been sent and whether a reply has already
been accepted while holding the channel IDR lock. Reject unsent and
duplicate replies so only the first valid response consumes the send
reference.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/misc/fastrpc.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index c91d5da42..4eaecee1b 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -250,6 +250,8 @@ struct fastrpc_invoke_ctx {
 	uintptr_t *buf_pv;
 	struct fastrpc_buf_overlap *olaps;
 	struct fastrpc_channel_ctx *cctx;
+	bool sent;
+	bool completed;
 };
 
 struct fastrpc_session_ctx {
@@ -1239,6 +1241,8 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
 	struct fastrpc_channel_ctx *cctx;
 	struct fastrpc_user *fl = ctx->fl;
 	struct fastrpc_msg *msg = &ctx->msg;
+	unsigned long flags;
+	bool put_ref = true;
 	int ret;
 
 	cctx = fl->cctx;
@@ -1255,10 +1259,23 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
 	msg->size = roundup(ctx->msg_sz, PAGE_SIZE);
 	fastrpc_context_get(ctx);
 
+	spin_lock_irqsave(&cctx->lock, flags);
+	ctx->sent = true;
+	spin_unlock_irqrestore(&cctx->lock, flags);
+
 	ret = rpmsg_send(cctx->rpdev->ept, (void *)msg, sizeof(*msg));
 
-	if (ret)
-		fastrpc_context_put(ctx);
+	if (ret) {
+		spin_lock_irqsave(&cctx->lock, flags);
+		if (ctx->completed)
+			put_ref = false;
+		else
+			ctx->sent = false;
+		spin_unlock_irqrestore(&cctx->lock, flags);
+
+		if (put_ref)
+			fastrpc_context_put(ctx);
+	}
 
 	return ret;
 
@@ -2586,6 +2603,10 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 
 	spin_lock_irqsave(&cctx->lock, flags);
 	ctx = idr_find(&cctx->ctx_idr, ctxid);
+	if (ctx && (!ctx->sent || ctx->completed))
+		ctx = NULL;
+	if (ctx)
+		ctx->completed = true;
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	if (!ctx) {
-- 
2.54.0


