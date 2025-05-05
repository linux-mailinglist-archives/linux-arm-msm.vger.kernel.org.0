Return-Path: <linux-arm-msm+bounces-56833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF0DAAA3DF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 01:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7AD0D7AFFCF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 23:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273692ECE27;
	Mon,  5 May 2025 22:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YzxB+NUF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1A2283FCD;
	Mon,  5 May 2025 22:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746483837; cv=none; b=hpOx2HbGCOcCryRcQcwmr0J/7lZWEWWkTCezPWkZE4Y2SDgRDrMR+fcJyRCbeJZtPvCsqxuRU/DNJlv2/ptXAGFuvSucxzggPXgaE6AlDbi6oEqmmqAVe/uR66t99CDviqoFZXeS7qL4J4yNyRKxkhuyFkrXNVMfKHafwm0gp6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746483837; c=relaxed/simple;
	bh=c58zCj1Jw5t2SLdzSuRB+h/HS1nTWOPS0tuQejpsig8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jLJw+mSiPL9OP1qhmUOZ+WX62jzmQSWVAXAN5QAFHqWl9Sgm+a5Ak/4HdjsJp+mm8iDYtX/99sctTQnCgSjfVRBHxp9kqxdUY/TbGIAgY0YyjM3x2EaEg8pdfC1HkcF7b7rmF5rksmde7tJ3aGooSfPaVvRNIGe1OiB45V6+OQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YzxB+NUF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8776C4CEF1;
	Mon,  5 May 2025 22:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483836;
	bh=c58zCj1Jw5t2SLdzSuRB+h/HS1nTWOPS0tuQejpsig8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YzxB+NUFvqDNn77WMWqL/w8rQe/WofDJoMzvgkMT7nOba9jF3BtGv9D9v4b9Jm+Bs
	 cU5b6/BVPXn6DICrMcffOBMSZrSfHsEgTgEjiDO+AsVmu3qvv0Wcx71Cu6sPIp4rSS
	 Dd4CuNXDOMNk1shQmK3Bq+ijgOj6P2Bf8egJVmeEdWy2PoPS0f0zTgDX57OAUFbBjJ
	 knJrMM8Kx0pd+cvGiVGge5eSdrBnqHc7q+M8FMbZ9CYey4RFXpVkLwnmFOb+/JCAm0
	 jblw4o5Otk/oGbwLmau3m3FXRJAKVn5i50+QqJXG+xRcalZl+bwi0IKTfUxm5ZWSfk
	 vgTvDGq9neItw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mathieu.poirier@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 244/642] remoteproc: qcom_wcnss: Handle platforms with only single power domain
Date: Mon,  5 May 2025 18:07:40 -0400
Message-Id: <20250505221419.2672473-244-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Matti Lehtimäki <matti.lehtimaki@gmail.com>

[ Upstream commit 65991ea8a6d1e68effdc01d95ebe39f1653f7b71 ]

Both MSM8974 and MSM8226 have only CX as power domain with MX & PX being
handled as regulators. Handle this case by reodering pd_names to have CX
first, and handling that the driver core will already attach a single
power domain internally.

Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
[luca: minor changes]
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
Link: https://lore.kernel.org/r/20250206-wcnss-singlepd-v2-2-9a53ee953dee@lucaweiss.eu
[bjorn: Added missing braces to else after multi-statement if]
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/remoteproc/qcom_wcnss.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 5b5664603eed2..775b056d795a8 100644
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
@@ -437,10 +453,13 @@ static int wcnss_init_regulators(struct qcom_wcnss *wcnss,
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
+	} else {
 		num_vregs += num_pd_vregs;
+	}
 
 	bulk = devm_kcalloc(wcnss->dev,
 			    num_vregs, sizeof(struct regulator_bulk_data),
-- 
2.39.5


