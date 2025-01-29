Return-Path: <linux-arm-msm+bounces-46547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2939CA22369
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 18:53:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57F8B3A48FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 17:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E6D1E0DE6;
	Wed, 29 Jan 2025 17:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="lZdWbKAN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982B21DF728;
	Wed, 29 Jan 2025 17:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738173122; cv=none; b=BqqlnWvVMxXbF9usC5Fvx0yZktZvcyUm61SS6OIwbrsCGyrLwFVpWx7utN6NaQLM4qhW/tB4iDIylCIgKiAnEogpgpq359SkMutq/42pY2vmnLzR4nhZaPoZaYMPyyHThdcm3yRrObJDdMQLvjssUbgBQK5A9rWHcAxzcoc23LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738173122; c=relaxed/simple;
	bh=zpiAXyILf067I4whMC+frV0pjFcZkvxHyV76lqWCAAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hIQHdpWMiUpPDggQU+UAgmHMh5KtgroayVuZnlOq7INIBHjJjjOHGE9hFFWk8XRAxl3kJDL+//t5sSdLKqhR3qB90tb0QGsgTI2t9C8OLJlt6DUCSaGhCV8zpv7KdjnzQgR5QRhmMvMY1Oca3Kjf9mwYaX6k8yiW8PV/tAcPZGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=lZdWbKAN; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738173118; bh=zpiAXyILf067I4whMC+frV0pjFcZkvxHyV76lqWCAAQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lZdWbKANpvXf7F9MTh9ki/AIGtlVy6tvWjhMYDDnubh/v3qC78u3kbwLZjlXLzCpd
	 pLdLwQx2pBy2GaTs0YhVExXanhpHwLsKdRkMe3BE21rStjJTXOd3omGonc556qkHcN
	 PKrGdHCg+NbZyoIKuwtjpCrYkgb/9AtoyQWAZvn8=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 29 Jan 2025 18:51:44 +0100
Subject: [PATCH 2/2] remoteproc: qcom_wcnss: Handle platforms with only
 single power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250129-wcnss-singlepd-v1-2-b01a6ba0b1bd@lucaweiss.eu>
References: <20250129-wcnss-singlepd-v1-0-b01a6ba0b1bd@lucaweiss.eu>
In-Reply-To: <20250129-wcnss-singlepd-v1-0-b01a6ba0b1bd@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3011; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=bnl2z9mRN3zuirTMKAM0nt9n9bUo3DVXiWm61cywUqU=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmmq963npVto5IWdNrks/vO79yDWF0IEzgZsN0
 un9f3kXMR2JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5pqvQAKCRBy2EO4nU3X
 VgHREACCeSC4+NNiSlMIcNwGj+V4Mix4ymuRw6MMmKehV4n9qLEgUB75xXdvL0T3uUVZiDPqeaF
 SJKGjkhNEpZS5cGd4vBf+bLmfCRvS9GhZYnShRPaD3GT3b8YR4V5sThRnRnlTembM+hdRzGXghG
 zKVjffM7fmnXBq30QOObvNViUy+rNfOZAr5j1War3vWAUw6PvpLUUMwk0WcbIgDj5hJNWmz4GPt
 fWZPbrSDBBeD/0lk9GD72mGeDKSvVRBrQiKNDf2gii2YqjBMbxMqC8Tjzq4XlPvC8/YsqKN585F
 j+wTSdctMjzpTC+TVuE7AAnUbU08Lb6TJDonH/Y+45e10D/3IHVsq2AiBxQ1fOaq/QsICZr2gvZ
 Yc/LuTrpUxo8dODLlrG/dmGBNQNEtpWdV89fDhMbwWn3FtFQzrlkbb6Sxy4fUGvLybzQcYTKQyO
 Kh+18SxiFETNm5Qe0RUSpRjoCCJwCL3oW2ZnpffmySZsjqM0Pb+TIdD1+yeVh7C5I7cluEQrVEI
 hNPWr6M02NUslffY0WHFr+U8L/E8G3VK85tmZhk0w0tB0t9L71nZNyRt7mmSn77CZxQOTtUK7nU
 hvSuIFZSFlO62OCcajeFOsitnUyb/VRE9JTSdRzQzBLB3nR2XsOiMKwHW4WfumwhH47TLEbHtdD
 ZZi8lH7Srr2U6Vg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Matti Lehtimäki <matti.lehtimaki@gmail.com>

Both MSM8974 and MSM8226 have only CX as power domain with MX & PX being
handled as regulators. Handle this case by reodering pd_names to have CX
first, and handling that the driver core will already attach a single
power domain internally.

Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
[luca: minor changes]
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 drivers/remoteproc/qcom_wcnss.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index a7bb9da27029db23f3759b19e423fab11b8430e4..4658ffb9bb13dfd52ecb23e85e0ad2d36af0cc80 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -117,10 +117,10 @@ static const struct wcnss_data pronto_v1_data = {
 	.pmu_offset = 0x1004,
 	.spare_offset = 0x1088,
 
-	.pd_names = { "mx", "cx" },
+	.pd_names = { "cx", "mx" },
 	.vregs = (struct wcnss_vreg_info[]) {
-		{ "vddmx", 950000, 1150000, 0 },
 		{ "vddcx", .super_turbo = true},
+		{ "vddmx", 950000, 1150000, 0 },
 		{ "vddpx", 1800000, 1800000, 0 },
 	},
 	.num_pd_vregs = 2,
@@ -131,10 +131,10 @@ static const struct wcnss_data pronto_v2_data = {
 	.pmu_offset = 0x1004,
 	.spare_offset = 0x1088,
 
-	.pd_names = { "mx", "cx" },
+	.pd_names = { "cx", "mx" },
 	.vregs = (struct wcnss_vreg_info[]) {
-		{ "vddmx", 1287500, 1287500, 0 },
 		{ "vddcx", .super_turbo = true },
+		{ "vddmx", 1287500, 1287500, 0 },
 		{ "vddpx", 1800000, 1800000, 0 },
 	},
 	.num_pd_vregs = 2,
@@ -397,8 +397,17 @@ static irqreturn_t wcnss_stop_ack_interrupt(int irq, void *dev)
 static int wcnss_init_pds(struct qcom_wcnss *wcnss,
 			  const char * const pd_names[WCNSS_MAX_PDS])
 {
+	struct device *dev = wcnss->dev;
 	int i, ret;
 
+	/* Handle single power domain */
+	if (dev->pm_domain) {
+		wcnss->pds[0] = dev;
+		wcnss->num_pds = 1;
+		pm_runtime_enable(dev);
+		return 0;
+	}
+
 	for (i = 0; i < WCNSS_MAX_PDS; i++) {
 		if (!pd_names[i])
 			break;
@@ -418,8 +427,15 @@ static int wcnss_init_pds(struct qcom_wcnss *wcnss,
 
 static void wcnss_release_pds(struct qcom_wcnss *wcnss)
 {
+	struct device *dev = wcnss->dev;
 	int i;
 
+	/* Handle single power domain */
+	if (wcnss->num_pds == 1 && dev->pm_domain) {
+		pm_runtime_disable(dev);
+		return;
+	}
+
 	for (i = 0; i < wcnss->num_pds; i++)
 		dev_pm_domain_detach(wcnss->pds[i], false);
 }
@@ -437,9 +453,11 @@ static int wcnss_init_regulators(struct qcom_wcnss *wcnss,
 	 * the regulators for the power domains. For old device trees we need to
 	 * reserve extra space to manage them through the regulator interface.
 	 */
-	if (wcnss->num_pds)
-		info += num_pd_vregs;
-	else
+	if (wcnss->num_pds) {
+		info += wcnss->num_pds;
+		/* Handle single power domain case */
+		num_vregs += num_pd_vregs - wcnss->num_pds;
+	} else
 		num_vregs += num_pd_vregs;
 
 	bulk = devm_kcalloc(wcnss->dev,

-- 
2.48.1


