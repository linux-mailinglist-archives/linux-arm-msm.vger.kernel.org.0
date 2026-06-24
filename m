Return-Path: <linux-arm-msm+bounces-114378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Enq/NpsXPGofjwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:44:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAD16C0761
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:44:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Nb4K40yZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114378-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114378-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08E5C300229E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 17:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E81A3DD845;
	Wed, 24 Jun 2026 17:44:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA2B3DD51B
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 17:44:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782323097; cv=none; b=cqTB47Mf+x77Wk5Jnxo9dt5BHO7uFFr+GOHs3lgDj/giN13C7e/ss+P0DioFm6A33uMbu4s5EqN6VNu5Ha4dzgXAIqFG1c+r7SWpAoeeLJ3hUpJ4NebXeo+HwGwIOdqZOkQxmsnmyI7DNLmkQiW6q1IT4aNTJfzZNVktpPirlN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782323097; c=relaxed/simple;
	bh=Dgt7deH7Bjy85P0w1kCtTG+pu+9PBuXg2ium+G7Z+i0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LE2hERPjB8Ep+bSl7dmDk+shGAKjcvUXu566TConfx21Y9X4eWadUeTCgJfc7ZBI4wbwvNlkFDLiUuY8H6irUWvV3wvVzeS1hdhdkysRTxH0TkviPGWm9GfGevgqw9DiUgD3ypQUQJKYtI46CiAPcdY6iOxLMfSPvI6CZFCfuF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nb4K40yZ; arc=none smtp.client-ip=209.85.128.182
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-80a1fb0c683so1005347b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 10:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782323095; x=1782927895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hvdk8auvGr6gBDxJclEr8sSbwpLlIJ8Bx4YIOUeaALw=;
        b=Nb4K40yZMWcsC9PJtqCq6eDrqvmEqqTbgXBmzIk6XxVhoK0dXYRAH3YkP5bnZWItkG
         fwkoaAgJI3myxsVm82pKCX5lP9G1W2fRt+R7pP5y9+WcDQQwF36xryicbiOmf0TtS3JP
         mcSaETfELyU4sh3WoFOZpQxYKEXp7OAQ4ECs9VtBL+E1+Kk1iLL8Z6+Duce3z4p3e5ym
         +sB4+aeLYuxawVg/IsGVlIYmteSYKJ8a4vLTukooHNkvnDiJ6lrzNyolktWrWlJEXhWq
         D9VeOA1JvrePPvMJ+TRE2SL+LGpjpMCdR6bEPHmPIoWRK9eHC0ddhOU/NTKW/VA8lJ4x
         H+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782323095; x=1782927895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hvdk8auvGr6gBDxJclEr8sSbwpLlIJ8Bx4YIOUeaALw=;
        b=EnnXOhTEiy7U2sAA2NnDF3YvvxMSOTvmeuljYa7VRYTGFQQL1OTvfKHgLluk9acH7x
         Aj1iAieG1QQpoSdX7amuRZO+MmcQ61teAMluDv8NjIUlVbXfHblJc/RyLgzK5zdBEqpo
         mHSheh1upNzMx4gs4WvV7w691uJHWphZ+bckhKLjERkqh/umjtoBZDRDS7gRNfCaqPDV
         3nDFiH+wHiCNxpjLYIUMbdt3IESKjp9iPBMAMZcIriKUhRWe5mkjEio848zPt393VTpD
         Fr3WCt8DuwccBVzAYzGyp0382Oy+xGOPdv+DDkoxtlbs2BqST5c8FwWAhtBGFCp4ESMG
         iKdg==
X-Forwarded-Encrypted: i=1; AHgh+RrwCWdd3u/M+fzV1N7lBQC9vQmyqUqcbXFYjWiOMy650WGZh1/+awHd4XkvWobgMaeilX2PTyO9CHvjZrcW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6RrqkAMhLpBp7wCN317cotGRMSJSS31ea7lI5k+zBa4HCQelr
	afv3fnYMt39zWKjy2gz2ICBjUyul3KRUnJ3zWu5BOAEkMuXuEnbu2M0z
X-Gm-Gg: AfdE7cnkoLqpottzoNd/AnUWubmIsgwAnXqVSdUO3mVgc5f0Ni9yIzyuOUq5rTC6uMa
	62yt9tE3fYUo9JtvcIbmZIJbNRzMAP4ooKeJHrtX38Ay3wLS3j5EWOFX7Te4EcDnhVwMewEkwne
	CgHRETQZwW2tAWCW9OZwzsNx2kHUh6pxzqsLj+hFcFZEehFKVSJl8+jIIt+US0evDdFiAFqrZ1t
	WqzJUb4XbAwBZV4PPi7/3YrIWJQEgcbyk+XHraylUIfKB6xniO5beoVA6O6Ivy6fa7ScsoZ9IX/
	w3Er8EgJosFCpqVY6UfnGZ4Jzg3zWbZTcyPYBQ/J3ENnA03vJ7oQdxqpdL8F/Pxg9ViXX80lt7e
	eaelvRp7n3Kn/qihW5z/aMJ64raF3vTZnioctoGJYpOcif0YyL2IwgRTj4AESlVtHxwCQEJuQyA
	ueaAA6lWoKA/srmwh38Z6EYHXL1A==
X-Received: by 2002:a05:690c:6e0e:b0:7bd:7b2e:f079 with SMTP id 00721157ae682-80266c36fcbmr218316607b3.44.1782323095111;
        Wed, 24 Jun 2026 10:44:55 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-80984a02906sm7053847b3.49.2026.06.24.10.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 10:44:54 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] misc: fastrpc: reject overflowing invoke buffer ranges
Date: Wed, 24 Jun 2026 19:44:10 +0200
Message-ID: <20260624174410.6074-1-alhouseenyousef@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-114378-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 3AAD16C0761

fastrpc_get_buff_overlaps() builds end addresses from user ranges.

A wrapped end can understate the payload size.

It can also feed bad ranges into the invoke metadata.

Reject invoke buffers whose pointer plus length overflows.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/misc/fastrpc.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index f3a493845..ba4ade874 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of.h>
+#include <linux/overflow.h>
 #include <linux/platform_device.h>
 #include <linux/sort.h>
 #include <linux/of_platform.h>
@@ -607,14 +608,17 @@ static int olaps_cmp(const void *a, const void *b)
 	return st == 0 ? ed : st;
 }
 
-static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
+static int fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
 {
 	u64 max_end = 0;
 	int i;
 
 	for (i = 0; i < ctx->nbufs; ++i) {
 		ctx->olaps[i].start = ctx->args[i].ptr;
-		ctx->olaps[i].end = ctx->olaps[i].start + ctx->args[i].length;
+		if (check_add_overflow(ctx->olaps[i].start,
+				       ctx->args[i].length,
+				       &ctx->olaps[i].end))
+			return -EOVERFLOW;
 		ctx->olaps[i].raix = i;
 	}
 
@@ -641,6 +645,8 @@ static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
 			max_end = ctx->olaps[i].end;
 		}
 	}
+
+	return 0;
 }
 
 static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
@@ -675,7 +681,13 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 			return ERR_PTR(-ENOMEM);
 		}
 		ctx->args = args;
-		fastrpc_get_buff_overlaps(ctx);
+		ret = fastrpc_get_buff_overlaps(ctx);
+		if (ret) {
+			kfree(ctx->olaps);
+			kfree(ctx->maps);
+			kfree(ctx);
+			return ERR_PTR(ret);
+		}
 	}
 
 	/* Released in fastrpc_context_put() */
-- 
2.54.0


