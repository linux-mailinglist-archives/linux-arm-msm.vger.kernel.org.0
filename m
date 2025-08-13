Return-Path: <linux-arm-msm+bounces-69012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9704B24FB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 18:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29E7A5C6D67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 16:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9127299AA4;
	Wed, 13 Aug 2025 16:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UOOwF5vw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6895A2980C2
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 16:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755101796; cv=none; b=JvcZdosDNUNHIb90+PdKQ4FZg/VarBCY5bieT7VU+PbCIHmViI8F/HXXBxnI9nlV3ZrSoWrH9io0O1Wn9ULHhvF7168YtjV8QFQ2/CqXQSK+deZo+y716r0rh8GOm0079xvf6ijyFE1Kf+ISgolIvFB9i/N9aqwWVAUMACKXj3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755101796; c=relaxed/simple;
	bh=7wRYty4ofIFIlja1JDwgrHbUsHF9OizHXhXzc/wOQrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lFaNm5NXpAzDTuKcMjfP6B3z1tjPOXMDgvMKpldsvb1dd9jjoCT04TxykNKq3XwiKTk7IyMUGQ80wJQFSCsB2Vfd58ZeEMrqtCIwCymE7lW1e7RKVN3QT975f5GO/utxyR5P2UGTE5eKV9VKlAIu7pNPOVtdgtr1XtZjs996IVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UOOwF5vw; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=GLQ1UVfd+Q4kbWxltR3cfD9lmUjZnwV0aB4ldIYb7ps=; b=UOOwF5
	vwBa6pP54mKdSVbL6smOqvkf07YBpRJsvIHHyYn34caxT1cZbXlXOq2hcLo6NmQX
	SMLD/9D/a4+PKxnre5aznAb95SfyGiCOzCuZgAnStrn4DwvjJ0C/nobdm1lEIr4o
	Qvw2u6OXfuBcpLl5t/SgSQB+XSB1IrBUSoInWPzCuDppqjhfm6+mRlSzTEoUjk7X
	qu/CkZ6ualJdIVuVh506JOv62hsnKXB5aWOFeEe7EhgSvVFZe8MzVez4LnQX3IY1
	b66ZWzB5J2z9yPdI2gGrO+Z1WBJWVMPr7qnvchRYjBgTA91cJlto4oxOF8ii7k9n
	jEwFRNEoqXleNEjg==
Received: (qmail 695441 invoked from network); 13 Aug 2025 18:16:23 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 18:16:23 +0200
X-UD-Smtp-Session: l3s3148p1@YwVUekE8tpFtKLKq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 15/21] regulator: remove unneeded 'fast_io' parameter in regmap_config
Date: Wed, 13 Aug 2025 18:15:01 +0200
Message-ID: <20250813161517.4746-16-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using MMIO with regmap, fast_io is implied. No need to set it
again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
No dependencies, can be applied directly to the subsystem tree. Buildbot is
happy, too.

 drivers/regulator/qcom-refgen-regulator.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/qcom-refgen-regulator.c b/drivers/regulator/qcom-refgen-regulator.c
index cfa72ce85bc8..299ac3c8c3bc 100644
--- a/drivers/regulator/qcom-refgen-regulator.c
+++ b/drivers/regulator/qcom-refgen-regulator.c
@@ -94,7 +94,6 @@ static const struct regmap_config qcom_refgen_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 };
 
 static int qcom_refgen_probe(struct platform_device *pdev)
-- 
2.47.2


