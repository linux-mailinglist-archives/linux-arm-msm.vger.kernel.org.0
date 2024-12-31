Return-Path: <linux-arm-msm+bounces-43751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 433C49FF080
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 17:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70A5A3A2E5F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 16:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C302419D8A3;
	Tue, 31 Dec 2024 16:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="cPOydt6V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE85C18787A;
	Tue, 31 Dec 2024 16:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735661401; cv=none; b=cv0UD46DzrIxQTC+L4e6k0sYDLULud4TH4clToUgsW0kNziBK7pFi739XNMyttonMXQewRvKf5KzuFj1lgHXqRR390Zr7QsPHnvH95b3J+oszmYFB8yuKO9xSvf9vHD3EInAu+bs899JPfzlD8S4pjSQQpfw/i2Sd2KjzGdEgVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735661401; c=relaxed/simple;
	bh=Tb5xNZgfV4q7JGNfFQeVkpw+/siizt8XCXnKM1G/eyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tyXMta7KaWEg/km3bsNfPLBeRbVvE83Cymw3XJuY4N/ON8E57xR67NF2E+KnBD6hZzUpvofJhfdKpqhsuBPjmUL32CgM92HjpowRg9EWvUf4hB6ZpDQSlphCZ+CQ9VqjV9k3PdUVidhbIx2auJepqOIhxALsBsew8EftT90acxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=cPOydt6V; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.30.162] (254C25E0.nat.pool.telekom.hu [37.76.37.224])
	by mail.mainlining.org (Postfix) with ESMTPSA id 2B886E484F;
	Tue, 31 Dec 2024 16:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1735660878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/2e0rChM1U0ZS5e2rmenSOYMmW3o7RqX8ZqmpmV3JLM=;
	b=cPOydt6VBlG26PAEV+mRLVWNNqeBDT/blXuapnCyWkzA7BnYtDVmnm3zEaT96M1zJCnsDB
	aqhYDfA/sU+vzWLWUlp29KWpFlzNRslgDjKeGSLz2okUaWmw6EEE5cSZwDcWw9ReA50oIS
	O1f2B/MfuWXZGgY4+A41c5lXp6ce5OrTD2wzPD+wFf1suoN/W+Hz3ANuAsK11z+pK94KW2
	zOYQOyUrF3XpNAPHXLoIORN0IpWBJ/A1tfi7NJk8OA4FPPXIAYBbRgh2cndkkgkYElOdYb
	buQgZDw8ktn2fEMLJnIMLQLcQC099I9gg4vdYCFlLgYaDmCQdhXjvPpCixSgSA==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Tue, 31 Dec 2024 17:00:52 +0100
Subject: [PATCH 4/4] clk: qcom: smd-rpm: Add clocks for MSM8940
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241231-rpmcc-v1-4-1212df9b2042@mainlining.org>
References: <20241231-rpmcc-v1-0-1212df9b2042@mainlining.org>
In-Reply-To: <20241231-rpmcc-v1-0-1212df9b2042@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Daniil Titov <daniilt971@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735660873; l=2678;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=oCtbuZ2QCL4y+u0jLxZuuers8d8cXcJBkL/AYKhA5/M=;
 b=ylNJQRzEJcojoD+cfYlwTAsciBOTI5gaYp17oI01JIfddRSZwWB7eSWXtPa80FnRRbT8LHiou
 R48/VcDSnUoAerpDg1jPx+ptznxWY1K0JSqEXOWnOXzsZRGQoRQDJeb
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

From: Daniil Titov <daniilt971@gmail.com>

MSM8940 has mostly the same rpm clocks as MSM8953, but lacks RF_CLK3.

Signed-off-by: Daniil Titov <daniilt971@gmail.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index b2992ee20cc3109daaeda22542faec5e61de0168..7b91610f08914278173dfd2fe93b0463bf3e23eb 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -726,6 +726,34 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8937 = {
 	.num_icc_clks = ARRAY_SIZE(bimc_pcnoc_snoc_smmnoc_icc_clks),
 };
 
+static struct clk_smd_rpm *msm8940_clks[] = {
+	[RPM_SMD_XO_CLK_SRC]		= &clk_smd_rpm_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC]		= &clk_smd_rpm_branch_bi_tcxo_a,
+	[RPM_SMD_IPA_CLK]		= &clk_smd_rpm_ipa_clk,
+	[RPM_SMD_IPA_A_CLK]		= &clk_smd_rpm_ipa_a_clk,
+	[RPM_SMD_QDSS_CLK]		= &clk_smd_rpm_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK]		= &clk_smd_rpm_qdss_a_clk,
+	[RPM_SMD_BB_CLK1]		= &clk_smd_rpm_bb_clk1,
+	[RPM_SMD_BB_CLK1_A]		= &clk_smd_rpm_bb_clk1_a,
+	[RPM_SMD_BB_CLK2]		= &clk_smd_rpm_bb_clk2,
+	[RPM_SMD_BB_CLK2_A]		= &clk_smd_rpm_bb_clk2_a,
+	[RPM_SMD_RF_CLK2]		= &clk_smd_rpm_rf_clk2,
+	[RPM_SMD_RF_CLK2_A]		= &clk_smd_rpm_rf_clk2_a,
+	[RPM_SMD_DIV_CLK2]		= &clk_smd_rpm_div_clk2,
+	[RPM_SMD_DIV_A_CLK2]		= &clk_smd_rpm_div_clk2_a,
+	[RPM_SMD_BB_CLK1_PIN]		= &clk_smd_rpm_bb_clk1_pin,
+	[RPM_SMD_BB_CLK1_A_PIN]		= &clk_smd_rpm_bb_clk1_a_pin,
+	[RPM_SMD_BB_CLK2_PIN]		= &clk_smd_rpm_bb_clk2_pin,
+	[RPM_SMD_BB_CLK2_A_PIN]		= &clk_smd_rpm_bb_clk2_a_pin,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_msm8940 = {
+	.clks = msm8940_clks,
+	.num_clks = ARRAY_SIZE(msm8940_clks),
+	.icc_clks = bimc_pcnoc_snoc_smmnoc_icc_clks,
+	.num_icc_clks = ARRAY_SIZE(bimc_pcnoc_snoc_smmnoc_icc_clks),
+};
+
 static struct clk_smd_rpm *msm8974_clks[] = {
 	[RPM_SMD_XO_CLK_SRC]		= &clk_smd_rpm_branch_bi_tcxo,
 	[RPM_SMD_XO_A_CLK_SRC]		= &clk_smd_rpm_branch_bi_tcxo_a,
@@ -1243,6 +1271,7 @@ static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8917", .data = &rpm_clk_msm8917 },
 	{ .compatible = "qcom,rpmcc-msm8936", .data = &rpm_clk_msm8936 },
 	{ .compatible = "qcom,rpmcc-msm8937", .data = &rpm_clk_msm8937 },
+	{ .compatible = "qcom,rpmcc-msm8940", .data = &rpm_clk_msm8940 },
 	{ .compatible = "qcom,rpmcc-msm8953", .data = &rpm_clk_msm8953 },
 	{ .compatible = "qcom,rpmcc-msm8974", .data = &rpm_clk_msm8974 },
 	{ .compatible = "qcom,rpmcc-msm8976", .data = &rpm_clk_msm8976 },

-- 
2.47.1


