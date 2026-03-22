Return-Path: <linux-arm-msm+bounces-99046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAWOAmTlv2k3/AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 13:49:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8DD2E94FF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 13:49:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF28F30086DC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 12:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A50D218A6D4;
	Sun, 22 Mar 2026 12:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fc/n6i9i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7968814AD0D
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 12:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774183623; cv=none; b=IA772fGl/643dI55NwJx6aYfGuSw9Ea8hrSwyCC9kIB8L0fBk+rfog0GxR8WdzQhVGZxPeJcui5qZAcZiP/itPp0Acfq5mRmGcfsFNUR+G1XJ+qJ5Mm/vS/EZnVeGHwzjYZuVZcYjB3bu8btESCwSk8jXHhxaoCx6h/kSFZP1XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774183623; c=relaxed/simple;
	bh=50JNzxwjge3SlQnhz2OGVSvAOejRPyUbNxE8hYK0AvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rcBYotSMUlivikw0JvGM10H1GQw759EzCaniDDSseho9x5AHgbhLr4ASxmAHI+CB28J4izKYbOyiy6GNKwd3L4H1TDj2sU3clABc3ZS5KvPqVIYiB5AzJRIeTZ+le6t01LknoloNPkERyogPXZ6Z3u8OCUOJW3olxZehS/RjkUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fc/n6i9i; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2b06c43e6a7so10194075ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 05:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774183622; x=1774788422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rhW0E6zJW/PvCvxzaxQdz9AUp9KNCHp/bbkiFagS0kE=;
        b=Fc/n6i9iSkCkIgoyEHhdQWM0KLaUz1L0ikwwv3hHYXjhMBxHBQuGvCNCVpITWRusi2
         j02UZzLmVtfxXblUbm0HBhkHHTu1Z7fR6DRkIfpIzvlWImBwG6CAsZ0Lv0g4KPRVJT3G
         O/EpeM2+1qI5ArDFkiHbbBrzKTDFWOV7sMpgXZ2YCyweZ5ua5ETTnW4LY6ymJWqmoHV+
         JLzXIo2yWVj30UibxiObCPX3SNWvIUSKcH+tTm1wpsSuLJ0MBls3qlz2nb67U+wKDzlF
         puj3YkaxA90ymRXj6Betw4XQYMQEq0c/C2XiqBzRv/HecOTlVvwn6aW6xu3d5wNZabHr
         rgBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774183622; x=1774788422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhW0E6zJW/PvCvxzaxQdz9AUp9KNCHp/bbkiFagS0kE=;
        b=COQZjF53TY6QyIgrvvt2rNBJF3/xwJJTrXjZBbNG4O5P/5u8HsmCO7HEreu2z0DIbT
         /rFKgHbqvF8ObWOlhAWFrKJifTNjv33I24zsdJx31VVjOU1ViVrAHEXFERGDf+30WwJS
         RuB/OZPyE7gqIxmDkHQjhQlLoE8m0iDMHXfabRe8lwF2I8dEJ5RoYKqeZfI4xHsGVIhd
         NNlnn1l+Wm/5NuIDTnPDzLQBNjdXWtyYwbikT+m1to85KdHF+zVjR7b56Xh+WNPv3Xh0
         mbp8vP/6JtqI0lxMGgUtr6lTe0DlsyqU8RwsRqxZ+R6yB1ReNFZcmrfkWOaAAe2idsaN
         eC5g==
X-Forwarded-Encrypted: i=1; AJvYcCUMjcAN3BIze+iUf6fgyX2c5Gzth2dBcbzxcknA5uIRaAHG7vwXIKfapw5tC4ZnVnGXJOMMFi41c9kTRuqv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2IHY+wUMBV0VGCJgmgo1omFElNl4p4vPnTENpwYMkLVOnBm97
	YAs4QEiyPX6pajGbXl03B6U7n+AFQMHShmo0Io22og8yyy57zGTFngeE
X-Gm-Gg: ATEYQzw3LSQc4895pkfOF0VD5RSoRJHSgz+fONv64YVd63USCmKRdE8doQaLHqZXr82
	ZxPqaM7jymaXSjtICKCxYcL4wHZREzJRcmJxGkmruF9GTPZ6PNVlugdk/KMgEdfSqhCyrLZZejA
	SZdIMsGox/93+L0pIpDPIlZRY/ipjNQSdjFinJQ8JI/RHvmMMDJgrVjNgF2+Rjtzd6M2jYJHHGr
	xQmYZ4erkegWaZMaENPbAdZ5bp0f3kDKbLA6H0E8yUNKmbgdlPpTOWQNVkJNu1nfo7slSiIwuBK
	sppBcFoEPfPvKqiR4s3E8+TRANq5iw8YQU2VcTQIfbdxSK9SLxax76xOhYhy/E5LVpYzmykMH1S
	QAcRGmHZd0INg1UXryH/jvU4jNgcOT2mzT7lj+OoDNPUErKxMc3YUf6KSOz3djkQzWEnqmhmpAK
	hc6BYEgb7eXbQVN18i8p5y6EWmrQ==
X-Received: by 2002:a17:902:e811:b0:2ae:6d9e:ed57 with SMTP id d9443c01a7336-2b0827393efmr86776685ad.21.1774183621741;
        Sun, 22 Mar 2026 05:47:01 -0700 (PDT)
Received: from ubuntu.. ([152.58.129.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083655474sm99107885ad.48.2026.03.22.05.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 05:47:01 -0700 (PDT)
From: Anas Iqbal <mohd.abd.6602@gmail.com>
To: srini@kernel.org
Cc: gregkh@linuxfoundation.org,
	vkoul@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anas Iqbal <mohd.abd.6602@gmail.com>
Subject: [PATCH] slimbus: qcom-ngd: fix NULL pointer dereference in qcom_slim_ngd_xfer_msg()
Date: Sun, 22 Mar 2026 12:46:47 +0000
Message-ID: <20260322124647.4246-1-mohd.abd.6602@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-99046-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[mohdabd6602@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 5C8DD2E94FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

txn->msg is dereferenced without a prior NULL check in
qcom_slim_ngd_xfer_msg(), which may lead to a NULL pointer
dereference.

Although current callers initialize txn->msg, add a defensive
check to prevent potential crashes if a NULL pointer is passed.

Fixes: 917809e2280bb ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Signed-off-by: Anas Iqbal <mohd.abd.6602@gmail.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 9aa7218b4e8d..241f5e08b582 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -805,6 +805,9 @@ static int qcom_slim_ngd_xfer_msg(struct slim_controller *sctrl,
 	if (txn->dt == SLIM_MSG_DEST_ENUMADDR)
 		return -EPROTONOSUPPORT;
 
+	if (!txn->msg)
+		return -EINVAL;
+
 	if (txn->msg->num_bytes > SLIM_MSGQ_BUF_LEN ||
 			txn->rl > SLIM_MSGQ_BUF_LEN) {
 		dev_err(ctrl->dev, "msg exceeds HW limit\n");
-- 
2.43.0


