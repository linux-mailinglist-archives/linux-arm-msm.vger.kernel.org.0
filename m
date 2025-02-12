Return-Path: <linux-arm-msm+bounces-47790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C338A32CCA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 18:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9DD11621C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 17:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF402580CF;
	Wed, 12 Feb 2025 17:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Wh+nIwYr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58141253F09;
	Wed, 12 Feb 2025 17:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739379857; cv=none; b=uvod2HbXDW861B8L5xSxoyYq6VzmXiiSL9z7n1QVmrJpBeyhfeI1k/SNH4FQTvi4r7f4mH56LL5IcF4n8HiW0YU+1x9YJj96/frL4he7lziBzkWk047OKDDE78hkIsxc88TyXaT5rvNMjI+ldZ/ukVz5cW9xtwnrqYNBf5yAZi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739379857; c=relaxed/simple;
	bh=KtCtiu3HdxGB+elt6zIdrSwpsiFCDhpc2RS0AWHPdFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZqzRPaj6M5azJwXfZtaUMp/ejQBZm8fJSwgoOT6efj0iGt2kjn9g0D/pdY6n2ZYZQ4WGycsS7ymCsn3DqmU6UYpkRUUgzKDWt0gdsYN0WckzkgpZbsId8pzlWwo7/yKEhclibfIvqrwbRpxp78mL0E/Z/keiykLOhRl2vjNTfXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Wh+nIwYr; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.244.162] (254C23D7.nat.pool.telekom.hu [37.76.35.215])
	by mail.mainlining.org (Postfix) with ESMTPSA id BA7E6BB83A;
	Wed, 12 Feb 2025 17:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1739379853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qSkfr6mNx85SD3B+tK98X+gwaurO564E0jqWeUP4rL8=;
	b=Wh+nIwYrFM6tNM6qZ04n4yTdAJyNi80HGi8guNn/76DkKUgIUtHZDsGZvhlUtLw7iCrIda
	eVRHf4w0u1BZbFAqRO0s07eMFJqbP4TUTkLNZOkKHt25d89oXRVxgeu3yf22Ntdcjtd0SS
	LBaYu25U2jPBDBAcpIPVvZ4dmCOUyGmxA07UEajL85nwsGJPN2cHoab2s+8ddKABCIsNGY
	eUkGd5TUV21o5OHBpYe+yvPQHY2Xu/fl0XruLCEyXisy92ZAhVoTc/8Jw5usYzFqFswWiT
	d6A4tWpbN+5364BPzdTvsGtZbF/Q7DaqEq1J8HMDumWJ34IiuHTkZVW8CjlmIQ==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 12 Feb 2025 18:04:10 +0100
Subject: [PATCH 2/2] clk: qcom: smd-rpm: Add clocks for SDM429
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250212-sdm429-rpm-v1-2-0a24ac19a478@mainlining.org>
References: <20250212-sdm429-rpm-v1-0-0a24ac19a478@mainlining.org>
In-Reply-To: <20250212-sdm429-rpm-v1-0-0a24ac19a478@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739379850; l=3273;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=fyggwXhk9oUXnNEQR7/yS+FGPmSxOG/fD7VIcXM5TRw=;
 b=+S6GYw5dJCjDduaMBbGNCl+5KorNoSqzFoc7zIOjILn2T4U4CHuAnP87bu9slQco6NyM89B3y
 p1CUAAMhSVlBWS/2YgbiZ5r76UdrN5S5KjqUHsoU+ONWvY0wZ0+THFV
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

From: Daniil Titov <daniilt971@gmail.com>

SDM429 has mostly the same rpm clocks as MSM8953, but lacks RF_CLK3 and
IPA_CLK and additionally has the BB_CLK3.

Signed-off-by: Daniil Titov <daniilt971@gmail.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 29ef08a9d50b47fb71ac253c6f50f4c28f4d6519..3fbaa646286f284da12b902873b079863a2c0d77 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -486,6 +486,7 @@ DEFINE_CLK_SMD_RPM(qup, QCOM_SMD_RPM_QUP_CLK, 0);
 
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(bb_clk1, 1, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(bb_clk2, 2, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(bb_clk3, 3, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(ln_bb_clk1, 1, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(ln_bb_clk2, 2, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(ln_bb_clk3, 3, 19200000);
@@ -1046,6 +1047,36 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8998 = {
 	.num_icc_clks = ARRAY_SIZE(msm8998_icc_clks),
 };
 
+static struct clk_smd_rpm *sdm429_clks[] = {
+	[RPM_SMD_XO_CLK_SRC]		= &clk_smd_rpm_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC]		= &clk_smd_rpm_branch_bi_tcxo_a,
+	[RPM_SMD_QDSS_CLK]		= &clk_smd_rpm_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK]		= &clk_smd_rpm_qdss_a_clk,
+	[RPM_SMD_BB_CLK1]		= &clk_smd_rpm_bb_clk1,
+	[RPM_SMD_BB_CLK1_A]		= &clk_smd_rpm_bb_clk1_a,
+	[RPM_SMD_BB_CLK2]		= &clk_smd_rpm_bb_clk2,
+	[RPM_SMD_BB_CLK2_A]		= &clk_smd_rpm_bb_clk2_a,
+	[RPM_SMD_BB_CLK3]		= &clk_smd_rpm_bb_clk3,
+	[RPM_SMD_BB_CLK3_A]		= &clk_smd_rpm_bb_clk3_a,
+	[RPM_SMD_RF_CLK2]		= &clk_smd_rpm_rf_clk2,
+	[RPM_SMD_RF_CLK2_A]		= &clk_smd_rpm_rf_clk2_a,
+	[RPM_SMD_DIV_CLK2]		= &clk_smd_rpm_div_clk2,
+	[RPM_SMD_DIV_A_CLK2]		= &clk_smd_rpm_div_clk2_a,
+	[RPM_SMD_BB_CLK1_PIN]		= &clk_smd_rpm_bb_clk1_pin,
+	[RPM_SMD_BB_CLK1_A_PIN]		= &clk_smd_rpm_bb_clk1_a_pin,
+	[RPM_SMD_BB_CLK2_PIN]		= &clk_smd_rpm_bb_clk2_pin,
+	[RPM_SMD_BB_CLK2_A_PIN]		= &clk_smd_rpm_bb_clk2_a_pin,
+	[RPM_SMD_BB_CLK3_PIN]		= &clk_smd_rpm_bb_clk3_pin,
+	[RPM_SMD_BB_CLK3_A_PIN]		= &clk_smd_rpm_bb_clk3_a_pin,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_sdm429 = {
+	.clks = sdm429_clks,
+	.num_clks = ARRAY_SIZE(sdm429_clks),
+	.icc_clks = bimc_pcnoc_snoc_smmnoc_icc_clks,
+	.num_icc_clks = ARRAY_SIZE(bimc_pcnoc_snoc_smmnoc_icc_clks),
+};
+
 static struct clk_smd_rpm *sdm660_clks[] = {
 	[RPM_SMD_XO_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo,
 	[RPM_SMD_XO_A_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo_a,
@@ -1276,6 +1307,7 @@ static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8998", .data = &rpm_clk_msm8998 },
 	{ .compatible = "qcom,rpmcc-qcm2290", .data = &rpm_clk_qcm2290 },
 	{ .compatible = "qcom,rpmcc-qcs404",  .data = &rpm_clk_qcs404  },
+	{ .compatible = "qcom,rpmcc-sdm429",  .data = &rpm_clk_sdm429  },
 	{ .compatible = "qcom,rpmcc-sdm660",  .data = &rpm_clk_sdm660  },
 	{ .compatible = "qcom,rpmcc-sm6115",  .data = &rpm_clk_sm6115  },
 	{ .compatible = "qcom,rpmcc-sm6125",  .data = &rpm_clk_sm6125  },

-- 
2.48.1


