Return-Path: <linux-arm-msm+bounces-114384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0DahMb0oPGqqkggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 20:58:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EADB6C0D38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 20:58:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=c8Mvuyy+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114384-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114384-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2556304D7F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 18:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4134332918;
	Wed, 24 Jun 2026 18:57:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3964C242D67
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 18:57:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782327474; cv=none; b=AMWX7tMiDVZW0Eq1Zou+r88v6l2RvQtoE+qjVKrg88WnAF3KRdg/XZk5Bcwy15vCYvelyNGZOJyd8rpP/v2C+B3/hUARnbxa4hqjevllmU+aCM809Gf3M2SnPedsNnPzYNSQ1W/I4m+X3yRIll0C31MeyP4hSaKMSdVHJZgUHdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782327474; c=relaxed/simple;
	bh=LaFgItg3x3HQL290a05VmHIjaBI0n9mIfyj5nUedZg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PUmd9Sk3kCNKnQDGH3ynXAu3XzeJ0ClNwoWTJWSCnf7edQlRDl217SC6Y6YiwifhkfJ50gFohDlH4YKlt4tYcR9FYehQRHmTYsHwezPM+7gj8AwR7ZvlRCeSyljeZAgiBfSq6w8VREPIjLmVNJM/Lb/EK8osVjdVh/9vbU2kJOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8Mvuyy+; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-463b2f6fc9dso1559303f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 11:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782327471; x=1782932271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3VY6GA4WYKqb1EhYh1Yd6EboXP9XWbFpfvj/dUpSvhc=;
        b=c8Mvuyy+32//BmkS/hj6WFIiXlvCKTZeoQE3OXt5xhVkx2h1VU+R2I7DnbRmQfMgnZ
         ZzSz6l4sq85ezqY+9tQ1vuhFlj45+XvaD+xj3V4IKjN4Wn1D2+7w7G5Jscgquq44LxAd
         OFBTBZIpOY2ayNjzmu1BfkOt5nKXFCqIb8UFRYtssNi+1bUkCkDpnI72+CF0bsgOe2V1
         ntXDuy11VQpKsKO1BB6+YBtVP0HULKyfjM4OWzQH8YoOWXt/kcPueafV4Wx2Dffkev8K
         gXwg/Iso8h/pTowHcCmCtJKdQTH5TtLE7AwDmeLJTlxYRMuMVAT482yzaEIvozwJMUXn
         87MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782327471; x=1782932271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VY6GA4WYKqb1EhYh1Yd6EboXP9XWbFpfvj/dUpSvhc=;
        b=HUQkuRMZXt4CoFXYbvXkYbfFiT4dEeEnphbf1kHPXrbVPk30yt8dbryzKZ2wBw8ayD
         gDdgxjgTBX5NqGvWP7DcrHgpAVS4UJ5rJeiGRvu1I0RUOCkLl3KQAOQ65RhutFnuDmTw
         pg2aHILYar3u383krpncKcE4gG01/n1rznXYyF6vQu83+rxhIHvYXNv/c9iKxbsM7Y83
         KGOX2He3IVpN098RgQBo/h4l4XeX506nS1aK1ASt3I1LWpO7jlcsYW9Gc4tEUdV0D/5/
         xxoJh262mTQxv3uk6fnC82Z6iKk8m5idEeILJT5I2AVwAD5XaebTJwr96FLXttLZ3hdK
         Hr9w==
X-Forwarded-Encrypted: i=1; AHgh+Ro67u+KTXkti11wh8eHmetqvrs6Kzran2xjBfluMtXAmQDcu1zKyV9PtFQ5S/s3c5+ndhZkTLb0KwMlPJ7i@vger.kernel.org
X-Gm-Message-State: AOJu0YxbaJF1nisNs29+h3qPwhN3C1jTtmLZCqZec8b/9ymI3QXW2pai
	WWdWKQ0EeLunXUAnw5WJBjjHeUE+GSgffegIuAg6YdyhvIcthO91EA8X
X-Gm-Gg: AfdE7clhhZyVmMQprInvjNwaMnxUxrHgNQ6BCabzSaTdMYzCnN54zqm8PeAAVVyfm25
	2cPF644Y3xEdE5aaO/Vt31yTVrM138g4hYPp9Ku3W3KJvkw4uHWbLzhBIkQJCuAuo/IsWMO1rxL
	nMZ0dgz4FrEGf26puoK/I1/VjJbG9axu+n1xTeDigrSJoowuSatLQukW9R6FlCh7xTUljTnXegX
	JKGNj7IqBvAoaHDoDPo6DliIhP4vvXxViwDtPECEdp3n0ax6SeC65EliqEQIR4WXBeLyVCQzdHq
	Ud27mw6AhzUarvlGhDn6UE44EZ7J+kuSUCJMshCkaOQFZAy3HuL6FjCK4ToFcw90ebJfd9zEn14
	PtNV1xTYrIi5y6sZukb1lC+kSmSVXYjjapJyXBbgSfeYs8NbNNL0zCapiY5NwNRKG7vqp/LjkGc
	ATNorTarHYBhXgUcZI6PdkDdWGUw==
X-Received: by 2002:a05:6000:41fb:b0:46a:6474:83a8 with SMTP id ffacd0b85a97d-46c0c05ce9emr6829286f8f.40.1782327470602;
        Wed, 24 Jun 2026 11:57:50 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c2279bc77sm8063181f8f.32.2026.06.24.11.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 11:57:49 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] misc: fastrpc: keep invoke copyout state private
Date: Wed, 24 Jun 2026 20:57:33 +0200
Message-ID: <20260624185733.1885-1-alhouseenyousef@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-114384-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2EADB6C0D38

fastrpc_put_args() copies output buffers from the DSP-shared metadata
area using the pointer and length stored in rpra[]. The DSP can update
that coherent buffer before the CPU reads it back.

Keep the kernel-owned inline buffer address and original userspace
length in the invoke context, and use that state for output copies. This
prevents remote updates to the metadata from steering kernel reads or
expanding the copyout length.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/misc/fastrpc.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 8dd8315d5..c91d5da42 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -247,6 +247,7 @@ struct fastrpc_invoke_ctx {
 	struct fastrpc_map **maps;
 	struct fastrpc_buf *buf;
 	struct fastrpc_invoke_args *args;
+	uintptr_t *buf_pv;
 	struct fastrpc_buf_overlap *olaps;
 	struct fastrpc_channel_ctx *cctx;
 };
@@ -570,6 +571,7 @@ static void fastrpc_context_free(struct kref *ref)
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kfree(ctx->maps);
+	kfree(ctx->buf_pv);
 	kfree(ctx->olaps);
 	kfree(ctx);
 
@@ -681,9 +683,17 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 			kfree(ctx);
 			return ERR_PTR(-ENOMEM);
 		}
+		ctx->buf_pv = kzalloc_objs(*ctx->buf_pv, ctx->nscalars);
+		if (!ctx->buf_pv) {
+			kfree(ctx->olaps);
+			kfree(ctx->maps);
+			kfree(ctx);
+			return ERR_PTR(-ENOMEM);
+		}
 		ctx->args = args;
 		ret = fastrpc_get_buff_overlaps(ctx);
 		if (ret) {
+			kfree(ctx->buf_pv);
 			kfree(ctx->olaps);
 			kfree(ctx->maps);
 			kfree(ctx);
@@ -727,6 +737,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 	fastrpc_user_put(user);
 	fastrpc_channel_ctx_put(cctx);
 	kfree(ctx->maps);
+	kfree(ctx->buf_pv);
 	kfree(ctx->olaps);
 	kfree(ctx);
 
@@ -1136,6 +1147,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 			args = args + mlen;
 			rlen -= mlen;
 		}
+		ctx->buf_pv[i] = (uintptr_t)rpra[i].buf.pv;
 
 		if (i < inbufs && !ctx->maps[i]) {
 			void *dst = (void *)(uintptr_t)rpra[i].buf.pv;
@@ -1193,9 +1205,9 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 
 	for (i = inbufs; i < ctx->nbufs; ++i) {
 		if (!ctx->maps[i]) {
-			void *src = (void *)(uintptr_t)rpra[i].buf.pv;
+			void *src = (void *)ctx->buf_pv[i];
 			void *dst = (void *)(uintptr_t)ctx->args[i].ptr;
-			u64 len = rpra[i].buf.len;
+			u64 len = ctx->args[i].length;
 
 			if (!kernel) {
 				if (copy_to_user((void __user *)dst, src, len)) {
-- 
2.54.0


