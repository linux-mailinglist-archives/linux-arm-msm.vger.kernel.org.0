Return-Path: <linux-arm-msm+bounces-46429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE65A2150B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 00:36:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7A341887E1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 23:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F261F2C53;
	Tue, 28 Jan 2025 23:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="rej4FMa9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56532199939;
	Tue, 28 Jan 2025 23:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738107388; cv=none; b=rEdeUsh7zYPEPvkNiOXso9JZcj1y2AHSFCeGr5BiMRGb2v5f5CmPSx8BNWpRXGc1w/ByDRKBzuGTKuw8c0y1YQ737GD8RWpxWWEGU8rMowzW5mhfnT5ltF/vPXtMLCA7oXvcOKFXur3JZ036hFWUfQeRrCdOXuJd3ybX2y5ZNYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738107388; c=relaxed/simple;
	bh=nD2pzDV8BppoM+IKRng7alJagSMAro8jZUFi3iMEfnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F3CaP7pbuOO8yyTuq9SIHzjCGtPIwnnu+uQ7NQsrE0Emm1QJbDeKKe59Vru/8pl5WfrO+4n9A6DvPqEuSsRgHQGSDfkvsb9HsfMlzRNdAOSiK8kzS4VeCQoZUtWpJTIpXk9NLbNxhfaWgF0os9zPsoU7+vKRAvP4zcAXR/g1FE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=rej4FMa9; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738107379; bh=nD2pzDV8BppoM+IKRng7alJagSMAro8jZUFi3iMEfnc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=rej4FMa90sahffmep5gpMszv9fmw+jSgntm1M+lWhX/OOa/A1R2eqBlyIfKXTn7hn
	 DczikGXyusOhSstt6xvAzPLOTejT8d26gl/q5J4iE5QeklQguI42vz8TYbZV/bgeBN
	 Jyncyjtyxdpp+lXYkBz8Q8MB08ZVEs4N44EFJkqs=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 29 Jan 2025 00:35:36 +0100
Subject: [PATCH v4 04/13] remoteproc: qcom_q6v5_mss: Handle platforms with
 one power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250129-msm8226-modem-v4-4-2b02ed7b7f1c@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2347; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=nD2pzDV8BppoM+IKRng7alJagSMAro8jZUFi3iMEfnc=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmWno8meIkXHrI7bWQH3wq8YDGZ7PHCACEAYiq
 nbt5AkkYAiJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5lp6AAKCRBy2EO4nU3X
 VmoWEACyQzDbFHqEtM4UkNqR/RsSfj56MEihkhtnvymIPEuAi672On0Q8hye5tzVQEsaZyyrnvJ
 AH69g3ypMamXrZdafbe+KFSMb/YkUsYhcl87IH+40FJzGrzy7X+2Izi30rlRuslV1/FaGb/AfGi
 zHpZgKFvG/WSVtDHydm/mGMS3PHHzD1g42ajCkS6+ycQgThiVSOImK76gpkRJc3vNfmuR7ftu2T
 Zmw3/dNEoB4MZAe0RIjnt6pAFvK5KihluOkTPIBwJlM2nU94XgRLoTxlXdy6otIvK2KikvfG/3f
 3rgkMeBw9OuH14pXVb0epZ0owvMxXjpQvbewhIAfpN31YqJXu7CUoBoUYQc0cZFiwnP8ZxS13LF
 sRaRJithxRCeE7CbuGBGiTDMCa2LZsUVVTi496KOZz52/IvO4yqWET4z1ZbytlUwkYSHKH4xJxu
 rmfdG0xI+jQ8RYiO/hxv4BFHqsE22RQLIFPTCsUtKeJpxV1gHB5NlpwVGTBhRI3GUM2jNch8AmO
 cN3mWszB4GrKnb68iqlPko1ucNKoJxQtEySfblL/sZDU9wB67IDlDe/4pBVNU6L1Q+u+rTxlmv/
 X/krtMcp/WytpEaRZ+dSMkFRdrfwHJw96QIPVPhYCL6z73ZtWD9nIblQyGAcYSDCicP+5varciZ
 h5Fz8l2239yU3iA==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

For example MSM8974 has mx voltage rail exposed as regulator and only cx
voltage rail is exposed as power domain. This power domain (cx) is
attached internally in power domain and cannot be attached in this driver.

Fixes: 8750cf392394 ("remoteproc: qcom_q6v5_mss: Allow replacing regulators with power domains")
Co-developed-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index e78bd986dc3f256effce4470222c0a5faeea86ec..2c80d7fe39f8e308eb12e79415a551b5009b3fe4 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1831,6 +1831,13 @@ static int q6v5_pds_attach(struct device *dev, struct device **devs,
 	while (pd_names[num_pds])
 		num_pds++;
 
+	/* Handle single power domain */
+	if (num_pds == 1 && dev->pm_domain) {
+		devs[0] = dev;
+		pm_runtime_enable(dev);
+		return 1;
+	}
+
 	for (i = 0; i < num_pds; i++) {
 		devs[i] = dev_pm_domain_attach_by_name(dev, pd_names[i]);
 		if (IS_ERR_OR_NULL(devs[i])) {
@@ -1851,8 +1858,15 @@ static int q6v5_pds_attach(struct device *dev, struct device **devs,
 static void q6v5_pds_detach(struct q6v5 *qproc, struct device **pds,
 			    size_t pd_count)
 {
+	struct device *dev = qproc->dev;
 	int i;
 
+	/* Handle single power domain */
+	if (pd_count == 1 && dev->pm_domain) {
+		pm_runtime_disable(dev);
+		return;
+	}
+
 	for (i = 0; i < pd_count; i++)
 		dev_pm_domain_detach(pds[i], false);
 }
@@ -2449,13 +2463,13 @@ static const struct rproc_hexagon_res msm8974_mss = {
 			.supply = "pll",
 			.uA = 100000,
 		},
-		{}
-	},
-	.fallback_proxy_supply = (struct qcom_mss_reg_res[]) {
 		{
 			.supply = "mx",
 			.uV = 1050000,
 		},
+		{}
+	},
+	.fallback_proxy_supply = (struct qcom_mss_reg_res[]) {
 		{
 			.supply = "cx",
 			.uA = 100000,
@@ -2481,7 +2495,6 @@ static const struct rproc_hexagon_res msm8974_mss = {
 		NULL
 	},
 	.proxy_pd_names = (char*[]){
-		"mx",
 		"cx",
 		NULL
 	},

-- 
2.48.1


