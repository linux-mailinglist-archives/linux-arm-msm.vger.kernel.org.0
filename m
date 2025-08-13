Return-Path: <linux-arm-msm+bounces-69014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3322BB24F94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 18:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9518E9A31C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 16:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 177FB29C35C;
	Wed, 13 Aug 2025 16:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RIu9fjhs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139A229AB10
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 16:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755101800; cv=none; b=K2BkAq7zWk+GBkLYSpMOjLufJYuWsdmYq3OkrJD+W3R3SWFp+77WOoZNgOrwjgz6UmYPkgVlq/hLS2eD1kmgYEsD8HWasKgeGR6bbHOr1l2/3Vw1S2DiyE5Fo0OZ4cg14fsDWdWVXoiql5TQ+AUsxhAGRp9tWAOyNjfUr8DTjhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755101800; c=relaxed/simple;
	bh=yNHnQdRrQY0EJizz/F+i0VWd+t2xPQYzgWsHv04urcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PSW/wE7noFq2Nou801TPIwwMJyHoYTTht3ehkitGpt7OPK/lgI+Fgyr2v45/IolDzfK++DLLhEZf1nZ39S6t3bllo2P7Flhjs6Vf64XjJmiCXrtOWm9wDjNUITchhWdwtW1zqjVyo2GZpT8kkimEFxyG4wL4KwU3QhKcDTBLhvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RIu9fjhs; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ZIKoY28P9xyeTGnAymD0PpIblwBi/y6fshQk+4ZVNI0=; b=RIu9fj
	hs39H82sfWB3B8MOF4bq7butH2yhRKVfC6Dfm6qZx90N3Wb+PYvsFCs9rxpbX3Xl
	ItQFS6shpM1rQTZjPO83U0wjV55nj9MhxYc4J8DUd+lzIV/dUpzExbNn7uaK2Lwu
	UuS67u/JYagvVlZvB8MQ25r26CbcTyNYcH2wyr2PEdHwNVYFt5g/i8FVKjY5i9Ws
	5NyWN/96xoaiZn4IczVeEXuWiXnAGyIHWDxMWnwWAyKhHIFL/IwNrW2Tw0VmnEC1
	R1iO8h9QK3XN+/0xGlM32EEeWMHH7aqAY3E1RVEoEdQhqfSWq53vGYoCu40mMmN/
	Ra7bADsdXC725gxA==
Received: (qmail 695693 invoked from network); 13 Aug 2025 18:16:29 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 18:16:29 +0200
X-UD-Smtp-Session: l3s3148p1@DZWpekE8DL1tKLKq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 18/21] soc: remove unneeded 'fast_io' parameter in regmap_config
Date: Wed, 13 Aug 2025 18:15:04 +0200
Message-ID: <20250813161517.4746-19-wsa+renesas@sang-engineering.com>
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

 drivers/soc/qcom/llcc-qcom.c       | 1 -
 drivers/soc/qcom/ramp_controller.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 192edc3f64dc..857ead56b37d 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -4409,7 +4409,6 @@ static struct regmap *qcom_llcc_init_mmio(struct platform_device *pdev, u8 index
 		.reg_bits = 32,
 		.reg_stride = 4,
 		.val_bits = 32,
-		.fast_io = true,
 	};
 
 	base = devm_platform_ioremap_resource(pdev, index);
diff --git a/drivers/soc/qcom/ramp_controller.c b/drivers/soc/qcom/ramp_controller.c
index 349bdfbc61ef..15782bed2925 100644
--- a/drivers/soc/qcom/ramp_controller.c
+++ b/drivers/soc/qcom/ramp_controller.c
@@ -229,7 +229,6 @@ static const struct regmap_config qrc_regmap_config = {
 	.reg_stride = 4,
 	.val_bits = 32,
 	.max_register =	0x68,
-	.fast_io = true,
 };
 
 static const struct reg_sequence msm8976_cfg_dfs_sid[] = {
-- 
2.47.2


