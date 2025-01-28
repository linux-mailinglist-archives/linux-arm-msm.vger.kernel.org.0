Return-Path: <linux-arm-msm+bounces-46432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 328C4A21518
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 00:37:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 853641884DC0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 23:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFCEF1F7066;
	Tue, 28 Jan 2025 23:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="oEISVVXS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81311F541A;
	Tue, 28 Jan 2025 23:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738107391; cv=none; b=oFTpwAquUhaOhTSCpo4rlGZHo3mbPpTZPceYF3pI8PsJB1Ao8lH5wr5db6xhu1UZFg4nOKZu0wWc8POk77o2OdQF3fRvPvCvaZVPPLdK35qLTCeNnyCgNtz65ImDpkUMysg9SNun4enZYr6+yJtGGHaYDFbubgQuTbBEivKzigQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738107391; c=relaxed/simple;
	bh=WQpAU91b0ofgV9N95YLIs+rsidLddutzsiejwyRckP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l6kMgICC36VvVhbO532ZOPzRCqWYJIBjt40ZEnufzyhkzv3TkhmBpFCccz1o+vLke7apS2g6dHxu7ps2Eijsup3P0oXZxvUmcEgugk1C/l128UJ3uJT7/LtqbB14gKv3YLaYt73+7n4aW+SC/zetF6wrl5FgN+m5og4pFUpmQeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=oEISVVXS; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738107380; bh=WQpAU91b0ofgV9N95YLIs+rsidLddutzsiejwyRckP8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oEISVVXSd9QrCmI3n0taQv97dEkubbptoHY4RjrqcFXKQTZSUoZPFGg7c57V3cSEm
	 d1MmsyFL5cuNgUOB1fcIaGVX8Ng0fbJxOhummi3JGc4d9Vl+WhlcCX4Y/tp0Pr/X4x
	 TQL/9k8HmZwT/CC4tUWi7LFbEK942+ZWKeHc2L34=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 29 Jan 2025 00:35:38 +0100
Subject: [PATCH v4 06/13] remoteproc: qcom_q6v5_mss: Add modem support on
 MSM8926
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250129-msm8226-modem-v4-6-2b02ed7b7f1c@lucaweiss.eu>
References: <20250129-msm8226-modem-v4-0-2b02ed7b7f1c@lucaweiss.eu>
In-Reply-To: <20250129-msm8226-modem-v4-0-2b02ed7b7f1c@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2428; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=WQpAU91b0ofgV9N95YLIs+rsidLddutzsiejwyRckP8=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmWnqT4fjyJmLnfUCYCkv3qoxOJ7ZB68TDvHUB
 37GUfr+BymJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5lp6gAKCRBy2EO4nU3X
 VqbND/4l1jYBPrAsDl45uxdEYGI81IDPJ9jbUkUkBahmjO8lBHhrj0tVWG0aCIpqPrx+PzUtxp4
 THj6V54/bzPPDu+FGCCZAAUJNAjHhtczQZrwLLABr29b3RNMq8TBZPibDJgU6CWSJ5edTI3exvL
 8PPbi7i/s20/MLO76S/j2+IOnfiQ6RUcBYTfoOBd6ROqLcgIPVt6aKc2OdTEwpRZv5rNXFN0Qsq
 17mIUN6NFjrWhj4cgYlQZBrnr8NIMPkiqEcT2IeODFZ/TsghJqyFYh/onbmtalt5QeLM8NPIxVN
 YS2FRep925E9ZPeBcfhzD8XbmfutYdmHBSPGkbKrIVO1jsJFyEZZaQMvm/rwQ8Ro6hdRO0PgC9P
 nFBbDlBtcredWxfos7IkEgba5WDY41K1tT8JhuilyOivDsC6pRsUwUl5t7F+w4OPmIf9jlctDWU
 ekESeKipZvEp0rCStQc8X1obr95a3ZtB/zmJVJoyHIK8dPGXL3p4+zwi0JRDboKxWlwBE2AJISE
 3XaQYGaKtviI1UY8xdwdaXUVnCL+Dkop/Yl6Kr2bxWHPdGWXNd39I8TTO5lxze3Fgir8hX1ds3q
 DMAmoeEnZWrM0WHbvk8Y6WWtR43MnkmA2tqAV7MxHKYKg8b0BqZpYEeMltrGG80jt/5qNpX5tfb
 P4haD23mwHQeKqw==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

While MSM8926 being 'just' an LTE-capable variant of MSM8226 it appears
the modem setup has changed significantly, by requiring mss-supply and
not using the ext-bhs-reg.

Add a new compatible and new struct to support that.

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 48 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 6f590f9128409b4aa427ab6bde1a9c4a966b3d15..0c0199fb0e68d6286f1e238d110539554d1d5f14 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -257,6 +257,7 @@ enum {
 	MSS_MSM8226,
 	MSS_MSM8909,
 	MSS_MSM8916,
+	MSS_MSM8926,
 	MSS_MSM8953,
 	MSS_MSM8974,
 	MSS_MSM8996,
@@ -2622,11 +2623,58 @@ static const struct rproc_hexagon_res msm8226_mss = {
 	.version = MSS_MSM8226,
 };
 
+static const struct rproc_hexagon_res msm8926_mss = {
+	.hexagon_mba_image = "mba.b00",
+	.proxy_supply = (struct qcom_mss_reg_res[]) {
+		{
+			.supply = "pll",
+			.uA = 100000,
+		},
+		{
+			.supply = "mx",
+			.uV = 1050000,
+		},
+		{}
+	},
+	.active_supply = (struct qcom_mss_reg_res[]) {
+		{
+			.supply = "mss",
+			.uV = 1050000,
+			.uA = 100000,
+		},
+		{}
+	},
+	.proxy_clk_names = (char*[]){
+		"xo",
+		NULL
+	},
+	.active_clk_names = (char*[]){
+		"iface",
+		"bus",
+		"mem",
+		NULL
+	},
+	.proxy_pd_names = (char*[]){
+		"cx",
+		NULL
+	},
+	.need_mem_protection = false,
+	.has_alt_reset = false,
+	.has_mba_logs = false,
+	.has_spare_reg = false,
+	.has_qaccept_regs = false,
+	.has_ext_bhs_reg = false,
+	.has_ext_cntl_regs = false,
+	.has_vq6 = false,
+	.version = MSS_MSM8926,
+};
+
 static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,q6v5-pil", .data = &msm8916_mss},
 	{ .compatible = "qcom,msm8226-mss-pil", .data = &msm8226_mss},
 	{ .compatible = "qcom,msm8909-mss-pil", .data = &msm8909_mss},
 	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},
+	{ .compatible = "qcom,msm8926-mss-pil", .data = &msm8926_mss},
 	{ .compatible = "qcom,msm8953-mss-pil", .data = &msm8953_mss},
 	{ .compatible = "qcom,msm8974-mss-pil", .data = &msm8974_mss},
 	{ .compatible = "qcom,msm8996-mss-pil", .data = &msm8996_mss},

-- 
2.48.1


