Return-Path: <linux-arm-msm+bounces-114474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h6MEKpjtPGojuggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:58:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5E16C4035
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:58:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="nyBJrK/P";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114474-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114474-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB82C304C97B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 08:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0F338888C;
	Thu, 25 Jun 2026 08:57:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DF1386C1B
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 08:57:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782377845; cv=none; b=kiPkurTaqU+rtdNClgKSMA8GiDFbt0zhXwGvQgDbO5Dcznrta3eXvS44aZVdglvxZNQc1xhYMTIWdsqQcFpAjeSy5xG5JfD5fPx4E9QOQSlNolPVtmtDi0tXtB2zKOsN3JSXJgYGBLQ9jwlaIvK0FzgDR8gY1yuXTaKqOI7og6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782377845; c=relaxed/simple;
	bh=lmA4nhBvMT9tW7gbg3hSIPL7ZKk1QgJkw5SszEVlhEU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q3kdsp6uJzNrpu952RXoi0yABkQUspEbi0u3+Hc8ZOpyfguND4KdwjHoaBfnMFyjB4u/OHdySRulVdkFX6r4Az2nCp3ccsb/os7u5PSSLt1CynvSBxKjLU9FWwVnAcXWSoyTz3iNJYgOtfofwJrPxBTijWn5+BSzVkCs/W6HqZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nyBJrK/P; arc=none smtp.client-ip=74.125.224.41
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-662d484ff3bso1936705d50.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 01:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782377842; x=1782982642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B4FF8nNbzEIIdzHCql4jtvlByyo4hD6ECsylMtCq6+k=;
        b=nyBJrK/PAJzyRkC4h9pJmpFDaHqmVztYM7KOQ7RrSH6iiDoxGzzhovt1nPuWbtOIBg
         3CB596vWBVCxUkgjxumQpYhFPaY94doST4s7K3ndB8yCJHgeNt9V7SjqgEDj9qQY9Qp5
         sAJ9YtPuPygc/k80f6GypAPzJRpTIgt6+ZUYLzHtf4O7BMlCzKrU320iqbbqvyBh1tSy
         TnbstpgsWAosJXY5MINV88gKtT9vmWo/gVGz45CWggcInbAziz2bdDf2fQEjm1gxIY4b
         WqwWtA/eoHPHHUEEfjpLY8t15tr48gAs3GskSY3/rYpX93xq+HvA8ebUkHKxHqVMI+Xt
         ktHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782377842; x=1782982642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4FF8nNbzEIIdzHCql4jtvlByyo4hD6ECsylMtCq6+k=;
        b=WTPrDwb7+8HclRw/CNYoTlUHl3R3ASoAzbGD5QIKTg505U/GmHo894DJClbJabnlg0
         VZ1YMoPaKWOdeX3+y7Ach8kEJN8lJb9JoF0E2JP2oIKOJ+nUDLCJ1W5rnXyiTV7kB1Qj
         Wr+p0VvCCd89lCa4jhRmmUjBjgP9xNTi2dho13COgG6Ne9Hxlm1/ttDPNnxY+xznLZPV
         9YJC9yaveiW4OD/gN0u2MSacO2h+JDqwf4loQahXYNp0lFND2DciCt3132jrPmg7yXTp
         pb/pA8ZtOQqkJcXdNkDKZeRDalElzGx0HZEJ8zhFEWlc/vug2HFJz4KUMcMUSUNF5mpS
         th6g==
X-Forwarded-Encrypted: i=1; AHgh+Rpqz502HmDh0svazsgJXUaf3Md8lxQf8HG2PUeI+74yCny2p5gxaMM1EOaV23pmqRL3AZ+nmbxMT0ATd1RG@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyg1dnKTkee6GDGBR1zIhxvKsm/saG80ckkSzK6z39hrKY4mUA
	+9NbhvGxk/D3SA3AhZZWUeyAMki/iX405meX+RrRphIR66JukhvaDbe6
X-Gm-Gg: AfdE7cmXTIY133UDKVynTFBGHzHCDaIePeK/HJYsdZAhERMEJIFJHX0F9DCoQrr7Th2
	p3F7HVJZx2Wc+9fNYjd6UlxOT7ioDHZI2ozMp/UtJIn2Qq+D41f0o5V4ddbsDYNW0zmj/BiALjY
	YfhzOunc+MZ34hy8PbdUj0PT7Ry+2ZGe6A3EVhF5Kk6MN+7zVWNRDtxudXfS1ihIUA2DeEo5bYC
	o/3fXRq3l/Ep4VC/bAFkRSLgDvjRWU4+o9dy51wcCzfdZuL43Me4zxa1+dtyZOvzQ22w4vH6aY9
	eqIoyRezBWENE4Wp7+gjYd4+J/n38KxsvTDrRoj/g/AZsBR97B2po5ehqDSfhlG5JWilkEteVUr
	JtL/Nx+67OhB1ZFUXVIBrgO1YHcXon98ESg8apJu50NU/JQmqEZFzom+70S2N2Slgi2jNONk4BZ
	2MN5KBQcI9RvIW44GNlxQjBUmsFV8R9CgUqRGl
X-Received: by 2002:a05:690e:e8f:b0:662:e0b5:33b with SMTP id 956f58d0204a3-66487debde5mr1230262d50.8.1782377841950;
        Thu, 25 Jun 2026 01:57:21 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6647f785f6bsm1105061d50.6.2026.06.25.01.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:57:21 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH 1/3] misc: fastrpc: reject oversized DMA allocations
Date: Thu, 25 Jun 2026 10:56:57 +0200
Message-ID: <20260625085659.4469-1-alhouseenyousef@gmail.com>
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,arndb.de,linuxfoundation.org,vger.kernel.org,lists.freedesktop.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114474-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:alhouseenyousef@gmail.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A5E16C4035

FastRPC keeps invoke and mmap buffer sizes in u64 fields, but coherent
DMA allocation takes a size_t. On 32-bit builds, a size above SIZE_MAX
can be truncated before allocation while the larger value is still used
in the message sent to the DSP.

Reject sizes that cannot fit in size_t before allocating the DMA buffer.
Also make the inline payload alignment step overflow-aware so a
near-U64_MAX accumulator cannot wrap before the later bounds checks.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/misc/fastrpc.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index bfdf8ab6a..8992b5c0c 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -437,6 +437,9 @@ static int __fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
 {
 	struct fastrpc_buf *buf;
 
+	if (size > SIZE_MAX)
+		return -EOVERFLOW;
+
 	buf = kzalloc_obj(*buf);
 	if (!buf)
 		return -ENOMEM;
@@ -1035,8 +1038,14 @@ static int fastrpc_get_payload_size(struct fastrpc_invoke_ctx *ctx, int metalen,
 			u64 len = ctx->olaps[oix].mend -
 				  ctx->olaps[oix].mstart;
 
-			if (ctx->olaps[oix].offset == 0)
-				size = ALIGN(size, FASTRPC_ALIGN);
+			if (ctx->olaps[oix].offset == 0) {
+				u64 aligned;
+
+				if (check_add_overflow(size, FASTRPC_ALIGN - 1,
+						       &aligned))
+					return -EOVERFLOW;
+				size = aligned & ~(FASTRPC_ALIGN - 1);
+			}
 
 			if (check_add_overflow(size, len, &size))
 				return -EOVERFLOW;
-- 
2.54.0


