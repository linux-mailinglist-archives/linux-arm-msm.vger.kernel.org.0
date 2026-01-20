Return-Path: <linux-arm-msm+bounces-89891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCkuEe76b2mUUgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:00:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7114CA64
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:00:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EDC45A6DAB6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 21:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039CA44BC80;
	Tue, 20 Jan 2026 21:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rfHLZZfC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B891B44A718;
	Tue, 20 Jan 2026 21:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768945265; cv=none; b=s4JrpeM5qCOew/X84xLqYaiJHBbXv7WKIWy+7vIGnlLmQjLBaDYwUnt/l+EQtbGKnfB8+3sG43BcKUb+IBvzpv5hFa1jAzCvd9w9FJOwLKHv8wVy8cAnLCftz9NWthpSZyOGvtRnx8LDkleImu0f1ls+65WXHOP1wiDXvqKyHFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768945265; c=relaxed/simple;
	bh=+4fd9yQ9/KUUlc1kbAxqg83L2EiSBV6K7m69iKVHkyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kcDEdNy+UBdDIJIboO+DAITJ66LzbAauGYHkzG5+QatUVNnMog4B56t2cJBxfw+6Pj8ACS0ueviy/FJWsqEfvwXCZa2qY3Z4engRU4DfseqHab59iOEaV10L7uPEZYZASFvQOBS0f/Jbbze8HIFR55C5sJ0IZrdPGSugwYQSg9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rfHLZZfC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C852C19422;
	Tue, 20 Jan 2026 21:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768945264;
	bh=+4fd9yQ9/KUUlc1kbAxqg83L2EiSBV6K7m69iKVHkyQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rfHLZZfCUheg7zBnVHJR4vzT7xN/sy7c8LCFG28WWLhBDTj1SCrB4hNXKyiAN0PQi
	 0yT8DvyzhDfP/FS1PajiJebdKUfszmP8pYiI/5kCBmfizGbgX3z3To4AHimRIFSjUY
	 YDn6kGtdx5ACvnPyfV8g7q1JPCSz8ehHjKuHLtBJ/jTgwcn2qJCC/UMWy/1gYKvbZQ
	 wd5aYKy5nmdajBi+NnaR2bYIlsWqi8NPaybtVUJ+ka9P+2Y6BjlkIERx/+8mQfrwuH
	 jLIWODE7HemA6cdBHDW5unmrLC5mZERfCRXKX0GWa1O89vE12Echl9fLROYbDyYGF6
	 skz4laNSezoMw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09226D262AB;
	Tue, 20 Jan 2026 21:41:04 +0000 (UTC)
From: Yedaya Katsman via B4 Relay <devnull+yedaya.ka.gmail.com@kernel.org>
Date: Tue, 20 Jan 2026 23:40:55 +0200
Subject: [PATCH v4 2/3] drivers: input: touchscreen: edt-ft5x06: Add
 FocalTech FT3518
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-touchscreen-patches-v4-2-30145da9d6d3@gmail.com>
References: <20260120-touchscreen-patches-v4-0-30145da9d6d3@gmail.com>
In-Reply-To: <20260120-touchscreen-patches-v4-0-30145da9d6d3@gmail.com>
To: =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Yedaya Katsman <yedaya.ka@gmail.com>, SzczurekYT <szczurek@szczurek.yt>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768945262; l=2061;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=JnmTIk3Utyw1IEV6j9HoQE20ccGFIPQTbMPlc8S8rg0=;
 b=sEhf2uiCFUFoXmNev24sziRW7EihOsXcEtvY3LQcZRZRcvnq9nDLqaVcJd7I9aVTBVNq0IcAo
 INuaI7VgI6RCZXymO/JvtaBNQysLyxBkz2Kz+W2fFjbU02ClByQbIpB
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=
X-Endpoint-Received: by B4 Relay for yedaya.ka@gmail.com/20260113 with
 auth_id=601
X-Original-From: Yedaya Katsman <yedaya.ka@gmail.com>
Reply-To: yedaya.ka@gmail.com
X-Spamd-Result: default: False [1.54 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89891-lists,linux-arm-msm=lfdr.de,yedaya.ka.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[protonmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[yedaya.ka@gmail.com];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,szczurek.yt];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: AD7114CA64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Yedaya Katsman <yedaya.ka@gmail.com>

The driver also works with FT3518, which supports up to 10 touch points.
 Add compatible data for it.

Co-developed-by: SzczurekYT <szczurek@szczurek.yt>
Signed-off-by: SzczurekYT <szczurek@szczurek.yt>
Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index bf498bd4dea9651ac939fe137b1c0f05e8557962..d0ab644be0069b5ab29ed037fa090a4279870193 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -1475,6 +1475,10 @@ static const struct edt_i2c_chip_data edt_ft5x06_data = {
 	.max_support_points = 5,
 };
 
+static const struct edt_i2c_chip_data edt_ft3518_data = {
+	.max_support_points = 10,
+};
+
 static const struct edt_i2c_chip_data edt_ft5452_data = {
 	.max_support_points = 5,
 };
@@ -1503,6 +1507,7 @@ static const struct i2c_device_id edt_ft5x06_ts_id[] = {
 	{ .name = "edt-ft5x06", .driver_data = (long)&edt_ft5x06_data },
 	{ .name = "edt-ft5506", .driver_data = (long)&edt_ft5506_data },
 	{ .name = "ev-ft5726", .driver_data = (long)&edt_ft5506_data },
+	{ .name = "ft3518", .driver_data = (long)&edt_ft3518_data },
 	{ .name = "ft5452", .driver_data = (long)&edt_ft5452_data },
 	/* Note no edt- prefix for compatibility with the ft6236.c driver */
 	{ .name = "ft6236", .driver_data = (long)&edt_ft6236_data },
@@ -1519,6 +1524,7 @@ static const struct of_device_id edt_ft5x06_of_match[] = {
 	{ .compatible = "edt,edt-ft5406", .data = &edt_ft5x06_data },
 	{ .compatible = "edt,edt-ft5506", .data = &edt_ft5506_data },
 	{ .compatible = "evervision,ev-ft5726", .data = &edt_ft5506_data },
+	{ .compatible = "focaltech,ft3518", .data = &edt_ft3518_data },
 	{ .compatible = "focaltech,ft5426", .data = &edt_ft5506_data },
 	{ .compatible = "focaltech,ft5452", .data = &edt_ft5452_data },
 	/* Note focaltech vendor prefix for compatibility with ft6236.c */

-- 
2.52.0



