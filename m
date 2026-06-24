Return-Path: <linux-arm-msm+bounces-114413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wvC8GIMuPGpDlAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:22:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3686C1015
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:22:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BmXKpF0k;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114413-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114413-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3F05B300E149
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6563B32570D;
	Wed, 24 Jun 2026 19:22:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58D226E71E
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:22:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328959; cv=none; b=NMfcsANifU+ZtvRdMNZ3qY+UV16enf1qVvbX0AohJ+muuAuiClw6dWWsWa67B3Y2v6E7QI4/hogPaVe62cgbrwJv/ivpDc7TV4LvrLddXMFjtG8wvfTt7FD175la1XQ96n+iW66wLg24eX3gh/2iRTmxMVWQJoBu4jcf4O3fO4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328959; c=relaxed/simple;
	bh=mLcqDysyvTZZAFjeAJTToWbdlYFZOaevmyXnNRQx1I0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H3uWCwFNEQGbSY17rR5aadSkp8+5e2RXuJ7gEsRbKnsu9nnb+eOv1NPLYZAWDcaobkzQi18FSmW+NXlQa/eGLnGrxeZXsuiyKaYHj87ylqYnHZAkXuYvn6+W57fv2DX8thhgjAjDK5lHTjQuVE2IB0uX9RDU2FMgIuDh/Igx4dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BmXKpF0k; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49249707788so7512675e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782328956; x=1782933756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uaPww1pWXi5Q4D8htcYS+X1youQrkpsB4ZWwVylX53E=;
        b=BmXKpF0kt1AH0mGK36M5OolSvXnVnG0SkSU9hTInu+6QuKGnjC7bw99fdD0opWubFE
         8Vq9sO2SRSy5elWEoHk/MXQV3wzeHKG29TbsZ+HawqAuqt9dZQfFG4e/ako+FKoTuaCj
         eVMA/lJGh/MKPeKP9AjoTZjIXHA1chCqVdZf+aj1Bt5IHO9ZY9bGz996AH9hVmMzETIq
         5ylSZCJFcucmaRJ6qYHnQ6oAjSa8A5g18ZcXTNfB/MwhxJMd9Sw4r+bpsfj3Z933GJcq
         Euk+FmqqDn5AMAwZDv+rWw8jzN1M9jcJuUsWzaB33rqRCsWUKU2N1Xyj4K3tVWOVwNLd
         LFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328956; x=1782933756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uaPww1pWXi5Q4D8htcYS+X1youQrkpsB4ZWwVylX53E=;
        b=N0wlFzGSnWO2HBIcYbWMpe5K/sKbe4v83PcssDPXI1Faj7MFzPvovmdNetBoOvf58c
         1w4VuMscVnu7FG42f7irE00alH2P9D+XSG52KfW2ojs0UdAw8mgk5vno7LF05Q8dvliJ
         c0Q+J90WH7xbUmJeN18fS08aqjcjXHRmjMKYTNZsmklYBYjP+I2ID8EAF1o6rHhuqfbE
         176E0OaurVdeXnSIT0NirN/Pz3QBaBHPMrfvFN2meywsw76SN3nJO5dgMq7gvL4oPqqv
         6hexmT36h8MUbg2x81T0ZOP+hTvc0XKJacrexlV5j80TgImuqw5sqAi/AA8xzMH7RwQW
         XFFQ==
X-Forwarded-Encrypted: i=1; AFNElJ8SGr2tvp6GyCdxlqxpa9Y4FqfPOiVhQr2kcRpBVvKOmGmltcUVNyDGVLBvrW54J9UJhAIqXrSOH+qUc9HJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxlZrYiRNeimZnrmPfwaELGa6AdKTDBNiwLyizqNc+Yww2jvLVE
	ba89vTrQnL43nugtyuQjdsS/YX+PQKn6o2TlxdiRgiw3Nmnu0QgqgWNK
X-Gm-Gg: AfdE7cnZNmBUngNp8aPCgjKsr27c2gHRd++lcmOWnk4JtlAELzUbKOgfwgM/VmC1PPU
	XK2v50g6u6AId+/NBseFoFmY+J+bzsBmjpm1uDNccc48B3T8yqjxkn8OxEREFt+bN72qr9R14p5
	5Ken+SNxMiIJ+mkbROc2TDVLN2VVbr7oHYlv+8Do4qfPK7Py3jxPWKglclL52gL3lXuMZdVtIme
	nvdIn1R7T9+A7OVs9KvZxJ86RMn92D1cFHgF2lykROAE713XLW+nnL7crhfQcQ/hmct6arvsYTx
	PfArnLT0I+etbz8mYJWrUT8dz9JB+rHqdI7GrsnoRAlTPTdoKzNZUe06DHSyEtZYysl/hhfs7t0
	QhAVOPqe+KH5FZbGvtIVUGs93Pi/FWsoCgpiNszp+nimHzpqxWEf/XUmjCuJvTF5mlEhMQe9WYr
	VYXnZYC2lmw4nLv3rjFcsSDrNJbw==
X-Received: by 2002:a05:600c:3f14:b0:490:b446:fb8 with SMTP id 5b1f17b1804b1-4924908ac6cmr296967175e9.11.1782328956186;
        Wed, 24 Jun 2026 12:22:36 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c221d93d8sm15740889f8f.23.2026.06.24.12.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:22:35 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] misc: fastrpc: reject overflowing invoke payload sizes
Date: Wed, 24 Jun 2026 21:22:25 +0200
Message-ID: <20260624192225.4508-1-alhouseenyousef@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,linuxfoundation.org,vger.kernel.org,lists.freedesktop.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114413-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:alhouseenyousef@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alhouseenyousef@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB3686C1015

fastrpc_get_payload_size() accumulates the metadata and inline argument
payload sizes before allocating the coherent invoke buffer. User-provided
argument ranges can make this accumulator wrap, leaving a buffer smaller
than the later serialization expects.

Return an error when the payload size arithmetic overflows or cannot be
represented as an allocation size. This prevents an undersized DMA buffer
from being used for invoke argument serialization.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/misc/fastrpc.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 4eaecee1b..ed0041076 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -997,7 +997,8 @@ static int fastrpc_get_meta_size(struct fastrpc_invoke_ctx *ctx)
 	return size;
 }
 
-static u64 fastrpc_get_payload_size(struct fastrpc_invoke_ctx *ctx, int metalen)
+static int fastrpc_get_payload_size(struct fastrpc_invoke_ctx *ctx, int metalen,
+				    u64 *out_size)
 {
 	u64 size = 0;
 	int oix;
@@ -1007,15 +1008,22 @@ static u64 fastrpc_get_payload_size(struct fastrpc_invoke_ctx *ctx, int metalen)
 		int i = ctx->olaps[oix].raix;
 
 		if (ctx->args[i].fd == 0 || ctx->args[i].fd == -1) {
+			u64 len = ctx->olaps[oix].mend -
+				  ctx->olaps[oix].mstart;
 
 			if (ctx->olaps[oix].offset == 0)
 				size = ALIGN(size, FASTRPC_ALIGN);
 
-			size += (ctx->olaps[oix].mend - ctx->olaps[oix].mstart);
+			if (check_add_overflow(size, len, &size))
+				return -EOVERFLOW;
 		}
 	}
 
-	return size;
+	if (size > SIZE_MAX)
+		return -EOVERFLOW;
+
+	*out_size = size;
+	return 0;
 }
 
 static int fastrpc_create_maps(struct fastrpc_invoke_ctx *ctx)
@@ -1068,7 +1076,9 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 
 	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
 	metalen = fastrpc_get_meta_size(ctx);
-	pkt_size = fastrpc_get_payload_size(ctx, metalen);
+	err = fastrpc_get_payload_size(ctx, metalen, &pkt_size);
+	if (err)
+		return err;
 
 	err = fastrpc_create_maps(ctx);
 	if (err)
-- 
2.54.0


