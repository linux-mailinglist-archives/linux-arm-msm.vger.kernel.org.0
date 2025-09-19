Return-Path: <linux-arm-msm+bounces-74186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A71B897B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 14:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D31D81C88133
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 12:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D3941F5821;
	Fri, 19 Sep 2025 12:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="s18pz+XA";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="nGqUFa5j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80F11F12E9;
	Fri, 19 Sep 2025 12:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758285558; cv=none; b=W+p6qOFBQkZS5Jmbj5F5227YoU7EeHfUl1o10+KjNW2bkMzICz2RC+sqf9KU+uxNCcO0UzE1M8fk7xGtWPAimTZyifv57kph1aqFWZfJ7xWs1w1Zy0718u5DccPkel3ADoYu4mvM0FeFRXvZD+CmToY5tAKXH3ZAvLXnEShBs+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758285558; c=relaxed/simple;
	bh=rTjFDRcZkzHV1+pjQ+w1jZB9waexazcpxBbnJnVaZ/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N6Al1wEmhTeA4cCLseUwmBUvASZ/aN4q/GVDoeLMsnJEEoc2HBJB/NoCMS1jKB1PZYmOSkWeMaEny8S2fj+dpkTdDAtbDTwrwTJvtaH4Jg5jL2Q/aiEcq+nA/2sQCqX6mtxGJlbOhXKXEX6dHB1Fa805LN/PVvSMJNYZABMt4NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=s18pz+XA; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=nGqUFa5j; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758285282; bh=PkrRRc9uyNCki1ghAUSjxt3
	/iQSx1tdx5I5omEv/bOc=; b=s18pz+XA+4+q+T/eg6hqz/PyDiU6Xda/6a/MSBkWeq86V57eBh
	wQXATg7PwbzLNzj60Wp+WWZ+XyQxm4qnRc5PKq9l8NBbZH37hvyRtpQBVYaEopD/lYZUk1BtUkG
	ymX/2gaJaZp/eLCouk5lRIhn/S5ifPrsi/X6NWYYlRCktuNwhZGtsFxO9yaIsXY+9o4Cd6WcmdA
	BLmxxlM8ULmahjuiVvZXExalFC/d+jvof0GbA3tfdYGqZB/+BBsz9JKFURT6yCPv8QaniB7Wb4h
	XAKFQnojA/Vk1arGcJjjqXS+dMvWEyGdyVJpykaNparwzsD2h3tUNO3QRASXt/s0ljg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758285282; bh=PkrRRc9uyNCki1ghAUSjxt3
	/iQSx1tdx5I5omEv/bOc=; b=nGqUFa5jDz8uFDinRR9c1edtigdMOwfv/xbcDUpLgnQctoYdhx
	PJHeypufnDu36+3R5YRdybVvZSldoL4uu9Dg==;
From: Jens Reidel <adrian@mainlining.org>
Date: Fri, 19 Sep 2025 14:34:31 +0200
Subject: [PATCH 2/3] clk: qcom: dispcc-sm7150: Add MDSS_CORE reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-sm7150-dispcc-fixes-v1-2-308ad47c5fce@mainlining.org>
References: <20250919-sm7150-dispcc-fixes-v1-0-308ad47c5fce@mainlining.org>
In-Reply-To: <20250919-sm7150-dispcc-fixes-v1-0-308ad47c5fce@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Danila Tikhonov <danila@jiaxyga.com>, 
 David Wronek <david@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, linux@mainlining.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Jens Reidel <adrian@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1314; i=adrian@mainlining.org;
 h=from:subject:message-id; bh=rTjFDRcZkzHV1+pjQ+w1jZB9waexazcpxBbnJnVaZ/4=;
 b=owGbwMvMwCWmfPDpV6GDysyMp9WSGDLO+j64utbm2a5zKz4aSdROmrzH+uTdTK7+pG2rz3qKz
 HjE5SCs0lHKwiDGxSArpshSfyPB5Kr1t0Pz821Ww8xhZQIZwsDFKQATudzC8M+K4+sriYrU2IY/
 TCpVjzWSdMXuyh7IVjqS/yZkr3+aVAEjQ9tnHw2zG+m7WtKfPb0589QhiRnBGw1+xss+4c3c2Hk
 rhgUA
X-Developer-Key: i=adrian@mainlining.org; a=openpgp;
 fpr=7FD86034D53BF6C29F6F3CAB23C1E5F512C12303

Add the offsets for a reset inside the dispcc on SM7150 SoC.

Signed-off-by: Jens Reidel <adrian@mainlining.org>
---
 drivers/clk/qcom/dispcc-sm7150.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sm7150.c b/drivers/clk/qcom/dispcc-sm7150.c
index bdfff246ed3fe08dea3647da9582e166cfbb96f4..0a7f6ec7a2a737c6f6f0484c71dd80f3dbf758b6 100644
--- a/drivers/clk/qcom/dispcc-sm7150.c
+++ b/drivers/clk/qcom/dispcc-sm7150.c
@@ -20,6 +20,7 @@
 #include "clk-regmap-divider.h"
 #include "common.h"
 #include "gdsc.h"
+#include "reset.h"
 
 enum {
 	DT_BI_TCXO,
@@ -951,6 +952,10 @@ static struct gdsc *dispcc_sm7150_gdscs[] = {
 	[MDSS_GDSC] = &mdss_gdsc,
 };
 
+static const struct qcom_reset_map dispcc_sm7150_resets[] = {
+	[DISPCC_MDSS_CORE_BCR] = { 0x2000 },
+};
+
 static const struct regmap_config dispcc_sm7150_regmap_config = {
 	.reg_bits	= 32,
 	.reg_stride	= 4,
@@ -965,6 +970,8 @@ static const struct qcom_cc_desc dispcc_sm7150_desc = {
 	.num_clks = ARRAY_SIZE(dispcc_sm7150_clocks),
 	.gdscs = dispcc_sm7150_gdscs,
 	.num_gdscs = ARRAY_SIZE(dispcc_sm7150_gdscs),
+	.resets = dispcc_sm7150_resets,
+	.num_resets = ARRAY_SIZE(dispcc_sm7150_resets),
 };
 
 static const struct of_device_id dispcc_sm7150_match_table[] = {

-- 
2.51.0


