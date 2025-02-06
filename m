Return-Path: <linux-arm-msm+bounces-47053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E11C6A2B2E7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 21:06:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E22AC188AC97
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 20:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 764441D61B9;
	Thu,  6 Feb 2025 20:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="JmMTwe4s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DCC1D5AD8;
	Thu,  6 Feb 2025 20:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738872365; cv=none; b=txU/yuPK82GVnp5p8JpqwdwE0w2/SjKOxTz3t0yTp25bag3O6lUwGzZvqdXFiDFY02o96cw5ZZ/nNqB/alrQqIyOQcUx8terSYOockf4QA1bNoWZAeDt+rZho4wzU1SdoEnqCKHkcM7XxaI4ULMchXJ3WxfZQY9ytIXCSXevmNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738872365; c=relaxed/simple;
	bh=s5qZPIsWTjLP53Z+ervmP5VF7KNxJznZKE2uskfwYTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AJ+UPMX35ABkhSUa1qqY63q78jn8O0AoYGBOBl38i6PfUpHu1HNAsO4cJAXLqrBNdj2rTWuNBDHOm3iCZTAYR1U8KyL3PgzMbxIBFC41rf/Gb/wJ/+1j5D+woTMYnsIYUb9cPiBs0eqSZmIkSuDW58mFScihDcb9WufPmzyc6LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=JmMTwe4s; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738871842; bh=s5qZPIsWTjLP53Z+ervmP5VF7KNxJznZKE2uskfwYTs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JmMTwe4saCPRQjT51G/AshKGU296RWxf7fQMMbCFpzP/hhmJeeoxaCM7WWzaNfb09
	 nqn197MILPjNYuFCpC7F1dhjPzFIb8G0PGd+OaWWsJGvat7CuLzwXDgnQX/sfYQQBw
	 qHhrgeHHLiNhif3agoPvvZCmCHrkl0VMsmX3BwFg=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Thu, 06 Feb 2025 20:56:48 +0100
Subject: [PATCH v2 2/2] remoteproc: qcom_wcnss: Handle platforms with only
 single power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250206-wcnss-singlepd-v2-2-9a53ee953dee@lucaweiss.eu>
References: <20250206-wcnss-singlepd-v2-0-9a53ee953dee@lucaweiss.eu>
In-Reply-To: <20250206-wcnss-singlepd-v2-0-9a53ee953dee@lucaweiss.eu>
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
 h=from:subject:message-id; bh=tnIGOs6S3OyQbm6Y5g+I6xPil/Bz8DZ6vLvYuNzSX3E=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnpRQgRILFaTTkTU3LTF5cxS5Motyv+/o+Y/hm/
 ob9ay09UPiJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ6UUIAAKCRBy2EO4nU3X
 VrL/EACiXl1UPUtsnnN4n/40gYwK/aOD3yLNYXWK09CZ7vF4M6A1pUUnw0tQmNx8nneGaIL940m
 ZCEq/HUwaOb0igiMZmy5YQROpx/ii25NdHezhkbuOULZHRSjbdDdlef0YZFee5QUz2AuhydN66A
 99U6XMLUkFG3Fi6DqpA8YyIbPEvlc49oHlEinf3pZqV6MCCww2sI3Go8pnhLNVMeolZV16Gdbnb
 Az6LKpdNA9fkToX0tfQ0lC1TrbRVaFnUcDGYird7lre4Yd0RjJFLXsDAVKZmq0CW1IqOChh8iYV
 eaIaH6J7GNN0ac+fwQ9x3r6q5bGH4NWSNgjbsF9xXuxmzxA0/xO3+kmqy4g1f+vCMe4vjgtDILq
 YwnfJBTjXQvgRAzfp6LthgA13YGWNEezYYSmkwCFqi6zHhlcHC7t1aafyhzqeOOY2pf8N6k1VG8
 kmbVAy9GdNXoCG4csRi0FL3X+VRKA9nNfWyn+bGJx/6FPmGxHBifzicA5e4cY/clD7zFdGl8k6c
 6PY8uW+qctXCBLJUQCgFgwgHYKB1Mav9s3U1nGpjim4yKN+8z6w4DD5YgZaFscyvoNU4OaRsEHq
 W81VKhqZFUDx10EjwHYH5hsGZsTvmsieZMzbdA/cgVn2g3CKHDkJdHEiYqeVrVBcb++IXYyaS/B
 1HaR1EUmEcAlXTg==
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
index 5b5664603eed293a1086a302564111d6203b17ca..143cc2fa8b65e4cf076cf29b41bb8939de5a74f0 100644
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


