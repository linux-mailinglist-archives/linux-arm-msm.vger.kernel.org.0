Return-Path: <linux-arm-msm+bounces-114383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cOG9M1IoPGqMkggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 20:56:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D4D6C0D0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 20:56:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BiXI4VpQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114383-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114383-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCCAE301CA5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 18:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8E232ED24;
	Wed, 24 Jun 2026 18:56:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EF426CE39
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 18:56:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782327376; cv=none; b=VLheyfer5co1vdraNgGC6kXwGsqeuX1qy+zvxZUA3dMOPRH46Rwd4nR6cgtliDbF8SfinVYSOkF4OD7LRfBOB3bhMoav+jLGI65V42ArZuSQEUQlC+lpIUe4Q8b5KYx9Vcsfm+36J1YRAkncYv+XihVbcbs1x+JM1lWCyflGQOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782327376; c=relaxed/simple;
	bh=F+IDPn5vbRW+WnI7tWD8clJGRUPf+9YUWmB4bCPjzIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fY1Wch3zPI8eAHusQ3nEvmsWXSOYmaRB+mUuLoJMNPWTJWDxa7hGU+8QCGPlLGxDmaE230PZPG42iweRKyzjdFGeCKBmaetbx2OsI0MVrVTZnVTRr3d0Qd4Nc5uyvhqSmPRt5YxHFBYYaobMPWMGKrbbjRyXcVWZOjeDj5s4xoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BiXI4VpQ; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso14204955e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 11:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782327373; x=1782932173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lhVt2J9kxRnCfR4wNcazQj8MApDZVyZIUNbf0hyt/Lw=;
        b=BiXI4VpQ//1gtJvkaFd+Z00t5QR80prBOf3fwDRPd+EQvTXDoB7yuvh2rLjf5WLzDs
         Ybaps817q/BuOjJ1A14o3YZfbvL98xiLR/UakJGFjRlaofQ6JZTvNJfvdCa1dZZ+OiyO
         9sLrP9Q/9Q5nI6Ml/I9c28YqqkEcJXlvv3uQlC31gXWsOazkMTEvYXNOdsz7WSvCum9l
         pK6RR3h1cWWgM+sPb5r1ncwEYJnW8fUVSabM7ssQIUy7VMyu1zgjvG5Z7/XkHAVWki2z
         Zg17PLHq8p4HuMLoh6e3fHxcGEs0i2M0k3x8MGV3JxDHeoIAkTWbDVN3AwGuGvEx79U+
         SYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782327373; x=1782932173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lhVt2J9kxRnCfR4wNcazQj8MApDZVyZIUNbf0hyt/Lw=;
        b=eBOJjWEWMDyTDpKFkGXjZbrUqJMua9WIElICQ67rvnUk/2ojghw2hEiOIF6/b+9bTh
         C2MbkngVMZ2cmaJkmid7UzkJglBgVPDW3f84ibMgX+KbN5MRYwGJUJz7AgsvwfDfh35/
         LnzYcuHYJ/I2xGCLcbOv7sPnmlp+CbN6R+LPzEYdBcRuLzDd34+ImRDk/KktcLlJQYT3
         L7hJrbBSfe+lefXXjcjZbSy8wLDE2q/9zU/yivNU3g+A56QfH/NELihHRKgwnQDvh9xt
         nspAfH/jEoUvhGIKSbP/XrrHq+tV4Df3/O/RD+0wYCDLrhRcYAjZ85IWINfLDIIK12UF
         0ytw==
X-Forwarded-Encrypted: i=1; AFNElJ/9h2B8SEn1SERGIfsf06pwQAMeF9voqeUAFoEJBzVq0JLPls7bI/KVTpOeTOssStCU5VWxEkChJQ3p65uj@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk8sP6r95+3X+QBGbRC6oiv/o1zTnTzbeVNu3qHmvGKQX2DjH9
	Wt86p5tSX6fBtiljEG4CNPWHh5iA4OUN8bmSvbt62Xe+covlLc+78q60
X-Gm-Gg: AfdE7ckFZNgFFxfayCLkS5K/6V1S0LJL7J2ZANtNmBUCS2R5GujYJU2PlDq4AIMwafi
	o3XH13AOFzJqnFZjNJi8VXRXBPhVsldeAsGyLdVKSpaGhK4S4RBjgbYaWsJkwNJOsOLG2BfYJSQ
	lPlHoOBovhEBOuWyyHOFQv5e2xSnGGBiJHGhEGVvIOhJc2pvtoKTjyjgn1i+LUv/NoZnva2G4J5
	mWL4/p43QOYZ1TsM2UbRf0P/oDR76NWJ4Gg4FUBXwR+sSxxVBSZsf6b5uGDSgdvleUMcUmVFcJi
	pFcJdntm7FQ/kiLqqOVunUshprIs/cN/pBqb8GXPKDwr5HT/uk78GDCOogUUT/aN5qOLLCmzvc7
	5WWzPBs1+emdVfjbQZMDRDsBT5Nnaa7aY/jtA8hIsygvjUhrC3xDf2h5Yb3nlJHfAvKUep8ODf7
	cZ6c9hJJYLSGRu/u5FXhV2s3gMrw==
X-Received: by 2002:a05:600c:5298:b0:490:bad9:de43 with SMTP id 5b1f17b1804b1-49264821ab4mr7006525e9.0.1782327373304;
        Wed, 24 Jun 2026 11:56:13 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926401a2dasm12122375e9.2.2026.06.24.11.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 11:56:12 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] misc: fastrpc: reject oversized inline invoke payloads
Date: Wed, 24 Jun 2026 20:55:49 +0200
Message-ID: <20260624185549.1669-1-alhouseenyousef@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-114383-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 26D4D6C0D0D

fastrpc_get_args() computes inline payload spans from 64-bit user
buffer ranges, but stores each span in an int before comparing it with
the remaining DMA buffer space.

A large span can truncate before the bounds check and advance the DMA
write cursor by the wrong amount. Keep the span 64-bit and fail the
invoke when the serialized payload would exceed the buffer.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/misc/fastrpc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 42fc128e1..8dd8315d5 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1079,7 +1079,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 	ctx->rpra = rpra;
 
 	for (oix = 0; oix < ctx->nbufs; ++oix) {
-		int mlen;
+		u64 mlen;
 
 		i = ctx->olaps[oix].raix;
 		len = ctx->args[i].length;
@@ -1119,8 +1119,10 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 
 			mlen = ctx->olaps[oix].mend - ctx->olaps[oix].mstart;
 
-			if (rlen < mlen)
+			if (rlen < mlen) {
+				err = -EOVERFLOW;
 				goto bail;
+			}
 
 			rpra[i].buf.pv = args - ctx->olaps[oix].offset;
 			pages[i].addr = ctx->buf->dma_addr -
-- 
2.54.0


