Return-Path: <linux-arm-msm+bounces-69011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A356B24F82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 18:24:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C386B1C25021
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 16:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02862286D50;
	Wed, 13 Aug 2025 16:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BWkPGGwn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A3F289342
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 16:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755101787; cv=none; b=B+sjuiow6H+MiMe/iqjJwrf3fW/oRXKkqZTvnuNw3oRTEOli9axXCguEo3egL16mjdTPvJz9/MXYNIRcdMHIJTbb5tTdzvSzjdlIECQA9jhtH7DLtQBHsR7Dcvx8XDeRSMFLJlymrQWk6+Ut6t4pAWqd7huCp587ieSQh/WMfVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755101787; c=relaxed/simple;
	bh=Cuto/sBicNFTRBcJYZ/3v9jt7N97wd+orh7bjmztGdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cxH41/4xfGTcJpWiCXFxIngbh0JIMipZ5DJHeQjhhwSBqCUBE2d0JT025jOgWibVbOknX+OEKIjG5xldCPZFN4cP+LjiY75DTRjLeHNs1lSIKMPstOIEn1GDUSOk8lunztywpjlrE20BcRLrDkrFVAbHxFoachq7jqzLD0qiT/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BWkPGGwn; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ZlH+WmFVWBAX8l9DY2gcET1o1xf9OJMuQ6ilgmWbKEw=; b=BWkPGG
	wnNdDw+fQeSge8TpBHmr9WENDkQocnNb3yTlu6nKuJu/1xmp7ocYChnIbxHgAntQ
	nh9eqKVNUKOHxwBoQWAvond53B7tI/8+dxYX2ZieahX/eEGspO/0e5jkMkmhl+Ly
	UqWQnvMyeHmkxwZJF+L3rTQ/DjC+Cqm3sQnOfXQjAyRFu5DNKxvR4ugpiEDKqIL0
	DbTbkAo+GLkJuUE1g6thp3L6OVHGGFTiVs9XZsDxlVSJj9t3ZWvwDrb8lJ89D/5l
	c6ERDnutFSuiB2l1AO8rCvP5hwH2QDfcZjJ9OoQPNoRT3UJ+zMMmFoRgkRadQSgy
	yFdIHw+5AuCu/qMA==
Received: (qmail 694836 invoked from network); 13 Aug 2025 18:16:10 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 18:16:10 +0200
X-UD-Smtp-Session: l3s3148p1@5IiAeUE8CtttKLKq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 07/21] mailbox: remove unneeded 'fast_io' parameter in regmap_config
Date: Wed, 13 Aug 2025 18:14:53 +0200
Message-ID: <20250813161517.4746-8-wsa+renesas@sang-engineering.com>
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

 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 8b24ec0fa191..d3a8f6b4a03b 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -58,7 +58,6 @@ static const struct regmap_config apcs_regmap_config = {
 	.reg_stride = 4,
 	.val_bits = 32,
 	.max_register = 0x1008,
-	.fast_io = true,
 };
 
 static int qcom_apcs_ipc_send_data(struct mbox_chan *chan, void *data)
-- 
2.47.2


