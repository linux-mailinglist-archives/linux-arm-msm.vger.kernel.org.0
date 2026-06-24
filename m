Return-Path: <linux-arm-msm+bounces-114415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2K9CIDUvPGpZlAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:25:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB6F6C1049
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:25:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=TYIkTz4m;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114415-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114415-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 963E3303799F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525011F03DE;
	Wed, 24 Jun 2026 19:25:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0150632570D
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:25:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782329108; cv=none; b=iCbPlz2Ixoh5Lc94b0SIeTCi6cZ5unD3y2tBkm9DxwIeyw2LzcalhfTkH8s/q1vbkPthMWE307PE6Q25LMgnHNiCH4Y54KZJ1HSiHvQ0hhfMPXZp64mFiUzNHU9h7ArBTHC348iTvlNtSTp4HeEVzBbMEqt1In8kL5EvjhNQXyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782329108; c=relaxed/simple;
	bh=tDEIZvfq3ccwECO7/FTIJpXPU9L95A/b27CVeP2Gyxg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NbNC4GsN/ZMzhjoMobWCcSu8ZHhpRNdduiY7xsfTVUkF+2U8S7LCu0dpBKTwheQAPbUHl4+K35CtZzXv83o6aJ+jkFI1vN/W1PPxnmtDops7IbhgGI1nSlcMKK7PRuDSp39chzTscgA6Pqf2jtBWZj0dEeN/QYHuUZtaMG9Q+x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYIkTz4m; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso11041225e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782329104; x=1782933904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eTNgkQdTW5rge9w2rIY/43V8cY+8H+JG9cF1K9K10rg=;
        b=TYIkTz4mk5ook8KrJvjQIek3cPhssXpVLp6ezKCcuZKf6lxdK63hx9nPvrQQwtXHBz
         jmV9CLQlZOmj9OCMeWNYolYRk+HGKNrPmoLc5znlaXARnQut08IyhTV2ur6HxHiY2Inm
         tOCgBkGFKAtmVGsvAMqibWwaoBdTFxUU9Gpn1QZENTjCE5EJG1f2ru5PGtl08UjSJVBa
         4S6XApJv4zzLKAbAAdLgUsclZyS45y1eeNIx340P0lHp6EcdN6kmKEnl7NMpiYEeGNxp
         Hyv4ZdT1X8ZdFYMqkc00Do3diEpuC/ZXA8aMIKq/+HRIrhmnoC1Xq/mdI5/EsQyPdo+a
         y1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782329104; x=1782933904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTNgkQdTW5rge9w2rIY/43V8cY+8H+JG9cF1K9K10rg=;
        b=OASy+3m+/JLSxvReyPOZQyyNJ5V4x2KFvpirT2dSNyUppNLKxqJqZHJ+oCEUNo1AxP
         k4XNuD8WyClVFvqCqOWKUN6VZzlmEtqAdLILYFcRkMhU1hQvpjWQd+5ZIiMYFh5ahYlN
         W79vkKmpIveg+rHUgp6KPlItLoLuU/VOGEaAzNVvVtaKqDvNoPCgHVWS5VD2Zsjgjj9w
         fyta/FDDo1FagkYcnXqZS8HMNt85yWFd49UinIOkYO2t8aCuzdtnh7RKU5PdjR8fIPdu
         KqM4HiaY7GiSlmBb33pE4NPjiVjHjV1oqccIY6kTRBZzfCENf3gotytDBzlRhwb9qrPq
         RuyA==
X-Forwarded-Encrypted: i=1; AFNElJ99w2Mjn8/To6tSF0IVjCXBN74TqApBB2Tq51jKILuBWGiikihSI3bdc6Obj5bQzV5Gb2V1XAEmzmSUKITi@vger.kernel.org
X-Gm-Message-State: AOJu0YyvcsOnwfnhxHXu5dU6IGQTWfoBPK9mpSYx/4hp60ISxuVfIPER
	GYu6kCfi5vSZMJm/K+R+yv2wM+jeOM7sFyL/fUXAatVjPp6cfnysnqrxJQEyokkNTRFIYw==
X-Gm-Gg: AfdE7clvo2mss3WWpwFrNALsKgksUuZI2zq/LhzMoXHH9gyJAxElEAhhe9U4hmMA1hs
	orQL3TQbz3wJgoACpitC8AYaSIU66HSVVCK7Jr73L6GfJQF9kqZ3iFjPHnZE8I5D4ntuSohI0IR
	TQjUofMra4cxZe6ILLiv0xD8ZPj+Exw5XutWnmCuSrdY0d0K05z6Cs0giijlJ76H+17pqT8hrYW
	S30pkd3BvUkKnxTZJcE22pLOCUOektEWtb7GRtp89kqP5OpwjJv8aWK3EF9g7z0Ev3iDx0F4ONE
	fcl6aA1kZvavMo2Bc/Dxh9wmNP7Ael9DTmPJUBy1nLCTc86ZqpQ5T367vm4qcqdBtsvm9fWPaR3
	oD/ATs/99VGFoebhX6rIJmZ2HlhZ/uNxE3oawUc4QGZeCiGVAkrX0ivd2UT+x5zmUuKG6jD7+rI
	8Ew5aa1BPn48hmx66r+Nk5lSmMVA==
X-Received: by 2002:a05:600c:4443:b0:491:8043:5c4a with SMTP id 5b1f17b1804b1-49260879105mr68640375e9.31.1782329104364;
        Wed, 24 Jun 2026 12:25:04 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c9787dddbsm6955406f8f.3.2026.06.24.12.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:25:03 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] misc: fastrpc: hold rpmsg device while using endpoint
Date: Wed, 24 Jun 2026 21:24:52 +0200
Message-ID: <20260624192452.4949-1-alhouseenyousef@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,linuxfoundation.org,vger.kernel.org,lists.freedesktop.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114415-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:alhouseenyousef@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alhouseenyousef@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1EB6F6C1049

Invoke and remote heap setup paths dereference cctx->rpdev after only a
lockless NULL check. fastrpc_rpmsg_remove() can clear that pointer while
an ioctl is preparing an invoke, leaving the send path to dereference a
NULL or stale rpmsg device pointer.

Take a device reference while holding the channel lock before using the
rpmsg device. Return -EPIPE if the rpmsg endpoint has already gone away.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/misc/fastrpc.c | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 1b70acc10..4b258dbcd 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -486,9 +486,24 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
 static int fastrpc_remote_heap_alloc(struct fastrpc_user *fl, struct device *dev,
 				     u64 size, struct fastrpc_buf **obuf)
 {
-	struct device *rdev = &fl->cctx->rpdev->dev;
+	struct fastrpc_channel_ctx *cctx = fl->cctx;
+	struct rpmsg_device *rpdev;
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&cctx->lock, flags);
+	rpdev = cctx->rpdev;
+	if (rpdev)
+		get_device(&rpdev->dev);
+	spin_unlock_irqrestore(&cctx->lock, flags);
+
+	if (!rpdev)
+		return -EPIPE;
 
-	return  __fastrpc_buf_alloc(fl, rdev, size, obuf);
+	ret = __fastrpc_buf_alloc(fl, &rpdev->dev, size, obuf);
+	put_device(&rpdev->dev);
+
+	return ret;
 }
 
 static void fastrpc_channel_ctx_free(struct kref *ref)
@@ -1260,6 +1275,7 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
 	struct fastrpc_channel_ctx *cctx;
 	struct fastrpc_user *fl = ctx->fl;
 	struct fastrpc_msg *msg = &ctx->msg;
+	struct rpmsg_device *rpdev;
 	unsigned long flags;
 	bool put_ref = true;
 	int ret;
@@ -1279,10 +1295,18 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
 	fastrpc_context_get(ctx);
 
 	spin_lock_irqsave(&cctx->lock, flags);
+	rpdev = cctx->rpdev;
+	if (!rpdev) {
+		spin_unlock_irqrestore(&cctx->lock, flags);
+		fastrpc_context_put(ctx);
+		return -EPIPE;
+	}
+	get_device(&rpdev->dev);
 	ctx->sent = true;
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
-	ret = rpmsg_send(cctx->rpdev->ept, (void *)msg, sizeof(*msg));
+	ret = rpmsg_send(rpdev->ept, (void *)msg, sizeof(*msg));
+	put_device(&rpdev->dev);
 
 	if (ret) {
 		spin_lock_irqsave(&cctx->lock, flags);
@@ -1312,9 +1336,6 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 	if (!fl->sctx)
 		return -EINVAL;
 
-	if (!fl->cctx->rpdev)
-		return -EPIPE;
-
 	if (handle == FASTRPC_INIT_HANDLE && !kernel) {
 		dev_warn_ratelimited(fl->sctx->dev, "user app trying to send a kernel RPC message (%d)\n",  handle);
 		return -EPERM;
-- 
2.54.0


