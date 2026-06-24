Return-Path: <linux-arm-msm+bounces-114414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xv/wE9UuPGpQlAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:24:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E3A6C1027
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:24:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kqtXj1nY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114414-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114414-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6094F3038C42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8103328FA;
	Wed, 24 Jun 2026 19:23:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9B4199EAD
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:23:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782329038; cv=none; b=lhzsBlGN/wcAKYfriKaEaik+V4cGnZhx3l7x1HQsV1nnvDeS1zEvU3pD8qY9jlzsd2su4n8CqjO3ciRVJi7r8aIAlHACZvglWSajKcSoEQ2EEbl0nsw6uhLpvmYLv6rq2/5GmRoIm6nPxNpqNeFVw3o6YG7Av97Y+wunBbh4YAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782329038; c=relaxed/simple;
	bh=6TyCeadAr5R+pPHv+peh3LcM4Dx1Of92LoVAz5G/JyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n0fHGIojbdfZLwrlDfPxCjSxgW1bTgQFteX0OFB8uYx8s5EH6kxxwvttDhuCWw33ZDR6CTmB52WjKNJMs+xxPFX8kCSGrTce9GT16dttddUlLLrJM5eRX0qQABO/ZCLO9nIMBqNXI6lfDhoezdxVjO3HpVA4MwBAa+471yrjXfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kqtXj1nY; arc=none smtp.client-ip=209.85.128.176
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7dfceeaf168so17349487b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782329035; x=1782933835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8tvwDj6aqG0ZCD9M1UH4HlCqt1P2RleXDyWTPKlWmro=;
        b=kqtXj1nYJzDTyhpHEft14oUVQkbfsZrxyA3oLbkh5RDHlcYofPjW2EBif1bNKOrdXh
         OeIx3sCPQ3+z8GL5sGXjBbUudfoI+zhFKmY4nBjWajh3OKg2TPD1jsXBOkLP1WA+nZH9
         DpVR+oziskPanjSvfEWGOQ7eD49U2VKL5Gwgxgzp7QvJC06Gc0AtCjh9INJ+bUJ8OM4+
         vLonmU6V+doD7TV3Q8xDAX/YiMCFPqf3dlfrssG1JFwvKk9wCr7gMlwWoPP9GCXfbekn
         XID0savNnZP7EuEYYI2P2jWjdo2GQWkVSiY1L0w2VEvOnjI6w8IywAJNg204u1veizhJ
         thXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782329035; x=1782933835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8tvwDj6aqG0ZCD9M1UH4HlCqt1P2RleXDyWTPKlWmro=;
        b=F1FE4t5hU1R4Rfu2J6TzDtrY5AYXHZRJsfcsIXBBx1X5jvX5F4PmRrNPdAxKggLkKy
         r6UUV09d5govOhYjy+Mhd5yYoFMe45MjoQjqUyVV1CfvGcmoPrkDAnd/TmcRiAbKZiS8
         na8aa0Sp18xJiE6xPHUtSvwR4ctfmLGb5R3QbvqhR4baCLyoUKPre3cBs67Ttg6YFXzW
         RK+LZoKhlJdqMX4TfZgbGRXzVUgNJplSqsTj2NRp3zAJ+XY4yc5Fwg44KQYuy7TK08NR
         LU4PVCe+xgriSgklPc/ewIrslIWSr0PLc5X8rvzHwvOwxCB9KUg1yrfy+IXto3/btpZx
         nMuw==
X-Forwarded-Encrypted: i=1; AHgh+Rrs4Admim5LqseGUr9zGE7+cqdgcwLge0ddIZwhUyjg3CxJnCavgZJJJlSZ6GpX81r/sRZFFYGhI9P72rQk@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh1oQgMtq73xpI1lmoNCZMrMUKmuI92+A4y5wWIiHA5kETmPG8
	y1lPOJWVI7gyK8yL5uSt48ItTXVqn76huWinwdXFCk3GvpEzEoqbHrvTihADrNfWDK0BgA==
X-Gm-Gg: AfdE7clgPXMXUhvHQcTHJmr2htnvBGIEfo5qSsI7jmfqK5B+gX821zjjxdcJxByx1sz
	I85x2918IKthLkOcDglBD6Tb3d43RfwVIZY1AD9d6CKNgxUND5bcniGGLGwYDBZ2r8gaEzWAJuJ
	uKRwFK3VfHikaVGkQ1q+uU5sNK2I/xjasO+s9BLwKTmtW2uFotkdMAxq66k84IcQ8FchxJ+AxoM
	AFU36WoJoKNX+Zl6EA8h4KOW91yo4Mdx93W2yznQkUE2dJZul1zd3M996JPcLYBemkPdJF8oefh
	jG9CrG7ODNKjf7CbZFfAiLhkc96i4BsJg6NP1ToKSWMIQ75BiCzTT7wz0IogTm3xSwssc1C9egt
	Rdsmssp70bv1Om0mFDhfTzmlm+jd+tyb6FvAUMXrkbUBtWiSFH1JIJjUQL5psvm21moAeOT3AVE
	s+T7KAgGncSBDqm1Lr6KlB4NrDzw==
X-Received: by 2002:a05:690c:9b0a:b0:7e8:769:8094 with SMTP id 00721157ae682-806c2667950mr87507277b3.23.1782329035177;
        Wed, 24 Jun 2026 12:23:55 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8025ffc2730sm61928587b3.34.2026.06.24.12.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:23:54 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] misc: fastrpc: exclude mapped buffers from inline overlaps
Date: Wed, 24 Jun 2026 21:23:09 +0200
Message-ID: <20260624192309.4723-1-alhouseenyousef@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-114414-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E4E3A6C1027

fastrpc_get_buff_overlaps() computes overlap offsets for every invoke
buffer, but only buffers without an fd are serialized into the inline DMA
payload. A mapped buffer can therefore advance max_end without reserving
inline payload space.

If a following inline buffer overlaps that mapped range, the serializer
uses the mapped range to derive a negative offset into the inline buffer
and then copies user data there. Ignore mapped buffers when building the
inline overlap state so inline payload pointers always refer to memory
that was actually reserved in the invoke buffer.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/misc/fastrpc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index ed0041076..1b70acc10 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -630,6 +630,15 @@ static int fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
 	sort(ctx->olaps, ctx->nbufs, sizeof(*ctx->olaps), olaps_cmp, NULL);
 
 	for (i = 0; i < ctx->nbufs; ++i) {
+		int raix = ctx->olaps[i].raix;
+
+		if (ctx->args[raix].fd != 0 && ctx->args[raix].fd != -1) {
+			ctx->olaps[i].mstart = 0;
+			ctx->olaps[i].mend = 0;
+			ctx->olaps[i].offset = 0;
+			continue;
+		}
+
 		/* Falling inside previous range */
 		if (ctx->olaps[i].start < max_end) {
 			ctx->olaps[i].mstart = max_end;
-- 
2.54.0


