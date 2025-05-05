Return-Path: <linux-arm-msm+bounces-56851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF59AAAAEF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 03:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 028255A1804
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 01:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009A22EDB1F;
	Mon,  5 May 2025 23:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZMkdAe0Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ABB381EB9;
	Mon,  5 May 2025 23:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486026; cv=none; b=r0a6OV6Wr1uYeyLPjoUlLMOs5XW+IsyW7wZh1brQm0gY7KpkFIOARX3F9Z2Wg8jPRI+CHGE1gFTlljmSR9xBSIf1sXCl4NgDoFzBwYu0XGvfEAKR2wYtDfTm5M64JcWnMvdjlIlqFTK8TpX2zUep5iCtnqGaMaYvOPD07xdBBTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486026; c=relaxed/simple;
	bh=iVcHR6MNU2Ms51/2agHFm39aFyCxn2z/dB4SZocitH4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HIHDLY78EgcF4bsRIK9ALCe9IOdRt3K9RCNqYbNel6Xhq5iTB6wdL4I+6Ys9V2XFJoC1g2XnUC384Jj2ezQCEtfAE75YpuYqtlEw/K55TRGq9oCy08K/lmgiREU/hb2c/JzS/EeRdRPnIRNOdOcGFiXXoFI4RhMn3XIjG9jmAL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZMkdAe0Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3BEC4CEED;
	Mon,  5 May 2025 23:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486025;
	bh=iVcHR6MNU2Ms51/2agHFm39aFyCxn2z/dB4SZocitH4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZMkdAe0QyhLA+NadSVdrVr6Gl9FTRi/TQTuQb8/ZGP5lrNS85ahAWCBE3IyoTjidR
	 cwRRMhPnRG2/mqRbcAPjCcBQargrzJTULHQLwUmZtB4KOzXznrc7EzFTvSsfZ9FaUF
	 YeVVh01cgtDczSuxqmypzx+4NRjfRWiKXYNvOmZ8ZPu9zuqy0dCdcJ2kvr544OZMis
	 NHjSWAa+9yU/Qgx8rf5SHHI5F9N6WQDEHqG1sYV6FpfjsJ7uiru70vEg6r+lOuPBeJ
	 /DmIVL52Q1C/dVgwGrzIwzt913CqE6m3M6V9Py+bNAUjfV7H+AX5VrjWNnwGmyZFdX
	 c7KCXh+qA+wqA==
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
Subject: [PATCH AUTOSEL 6.6 117/294] remoteproc: qcom_wcnss: Handle platforms with only single power domain
Date: Mon,  5 May 2025 18:53:37 -0400
Message-Id: <20250505225634.2688578-117-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
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
index 90de22c81da97..153260b4e2eb4 100644
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


