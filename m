Return-Path: <linux-arm-msm+bounces-111947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sjHEGj8FJ2qaqAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:09:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3606598DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:09:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dM0pK3e5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111947-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111947-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73A6E31F8543
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 18:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E1DD384CFA;
	Mon,  8 Jun 2026 18:01:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E54379C2B;
	Mon,  8 Jun 2026 18:01:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780941690; cv=none; b=Z9LaP0jtuoO4xqVd4D/f8S99Y0lvmyf2htMjfHf3thcETvV0mFiOrckHYpzSw0KKyDpdDMjagr4Eawnh1QOzc8O2TZm3G8zwwaKLcUSWHz9pMbkBWbzwYfH1ohdFlUf9w1Fo0HL5a5F5lIFUPWFTWEdnFauDzezTbICFUAkfkZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780941690; c=relaxed/simple;
	bh=rKK1QDlJtkjoBkCpIfUcA/UrERGzRielsg+lSvVJRg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HtAT1TVazhuIp6/u3ZJ/bBoc+pONdNjRQZQVWsbnpwJS2OSOiqxGP4XFaoRR+Vx2/NrkSACu/y2tSD8UJNR/pEuUJMxX58z5HMtrPkjHN0KnSyZ9kr67U0uEnQlSJ3HGUeB2l1LBrsHP7ZkKUuL2wzESBi3ERtjsMW0Q7Fni70U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dM0pK3e5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6517F1F0089A;
	Mon,  8 Jun 2026 18:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780941688;
	bh=W1F2w5wk3UoqQBfN2ZV6Pq1AQgxfcbrVN6NocwwiZGU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dM0pK3e5qDzrBubUv7G2PzPG1dQY7Po5nNTXfuQL3yriJ07eDJIUC1femdM542Ye8
	 6bEZXbkCqjWHLMnCo+vT03HTXGE/OenedjUyvyn8psqsPR1RaHYhTKBWERRQwVyuQK
	 5Kvk5F5Z9jCOVdrZD1ABHCEcKbtsqBuvZGZieKOHIBBDS/2LlHbd5mEyBSYe23E6H1
	 aX2SjmyP2HW4ZxVN/5EFEuPfBdSttyQAPMYredUovtelo7zGs1jNohu/owysloC6lE
	 d2l6568Y6vCcGU/afDnzXKFPQRV9LJM/b0Q6Q8mhOlWq17y74tFiKXEgt5yi6Uo5/x
	 IHN4mWMHmK2yA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Om Prakash Singh <quic_omprsing@quicinc.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Olivia Mackall <olivia@selenic.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 3/4] crypto: qcom-rng - Remove crypto_rng interface
Date: Mon,  8 Jun 2026 17:58:47 +0000
Message-ID: <20260608175848.2045229-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.54.0.1064.gd145956f57-goog
In-Reply-To: <20260608175848.2045229-1-ebiggers@kernel.org>
References: <20260608175848.2045229-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-111947-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ebiggers@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-crypto@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:quic_omprsing@quicinc.com,m:quic_bjorande@quicinc.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:olivia@selenic.com,m:ebiggers@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D3606598DE

qcom-rng.c exposes the same hardware through two completely separate
interfaces, crypto_rng and hwrng.  However, the implementation of this
is buggy because it permits generation operations from these interfaces
to run concurrently with each other, accessing the same registers.  That
is, qcom_rng_generate() synchronizes with itself but not with
qcom_hwrng_read().  This results in potential repetition of output from
the RNG, output of non-random values, etc.

Fortunately, there's actually no point in hardware RNG drivers
implementing the crypto_rng interface.  It's not actually used by
anything besides the "rng" algorithm type of AF_ALG, which in turn is
not actually used in practice.  Other crypto_rng hardware drivers are
likewise being phased out, leaving just the hwrng support.

Thus, remove it to simplify the code and avoid conflict (and confusion)
with the hwrng interface which is the one that actually matters.

Fixes: f29cd5bb64c2 ("crypto: qcom-rng - Add hw_random interface support")
Cc: stable@vger.kernel.org
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/crypto/Kconfig    |   1 -
 drivers/crypto/qcom-rng.c | 158 +++++---------------------------------
 2 files changed, 19 insertions(+), 140 deletions(-)

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 3449b3c9c6ad..a12cd677467b 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -658,11 +658,10 @@ config CRYPTO_DEV_QCE_SW_MAX_LEN
 
 config CRYPTO_DEV_QCOM_RNG
 	tristate "Qualcomm Random Number Generator Driver"
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on HW_RANDOM
-	select CRYPTO_RNG
 	help
 	  This driver provides support for the Random Number
 	  Generator hardware found on Qualcomm SoCs.
 
 	  To compile this driver as a module, choose M here. The
diff --git a/drivers/crypto/qcom-rng.c b/drivers/crypto/qcom-rng.c
index 7058bd98f9e9..4d046caafe5b 100644
--- a/drivers/crypto/qcom-rng.c
+++ b/drivers/crypto/qcom-rng.c
@@ -1,14 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2017-18 Linaro Limited
 //
 // Based on msm-rng.c and downstream driver
 
-#include <crypto/internal/rng.h>
 #include <linux/acpi.h>
 #include <linux/clk.h>
-#include <linux/crypto.h>
 #include <linux/hw_random.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -30,28 +28,19 @@
 #define WORD_SZ			4
 
 #define QCOM_TRNG_QUALITY	1024
 
 struct qcom_rng {
-	struct mutex lock;
 	void __iomem *base;
 	struct clk *clk;
 	struct hwrng hwrng;
-	struct qcom_rng_match_data *match_data;
-};
-
-struct qcom_rng_ctx {
-	struct qcom_rng *rng;
 };
 
 struct qcom_rng_match_data {
-	bool skip_init;
 	bool hwrng_support;
 };
 
-static struct qcom_rng *qcom_rng_dev;
-
 static int qcom_rng_read(struct qcom_rng *rng, u8 *data, unsigned int max)
 {
 	unsigned int currsize = 0;
 	u32 val;
 	int ret;
@@ -78,41 +67,10 @@ static int qcom_rng_read(struct qcom_rng *rng, u8 *data, unsigned int max)
 	} while (currsize < max);
 
 	return currsize;
 }
 
-static int qcom_rng_generate(struct crypto_rng *tfm,
-			     const u8 *src, unsigned int slen,
-			     u8 *dstn, unsigned int dlen)
-{
-	struct qcom_rng_ctx *ctx = crypto_rng_ctx(tfm);
-	struct qcom_rng *rng = ctx->rng;
-	int ret;
-
-	ret = clk_prepare_enable(rng->clk);
-	if (ret)
-		return ret;
-
-	mutex_lock(&rng->lock);
-
-	ret = qcom_rng_read(rng, dstn, dlen);
-
-	mutex_unlock(&rng->lock);
-	clk_disable_unprepare(rng->clk);
-
-	if (ret >= 0)
-		ret = 0;
-
-	return ret;
-}
-
-static int qcom_rng_seed(struct crypto_rng *tfm, const u8 *seed,
-			 unsigned int slen)
-{
-	return 0;
-}
-
 static int qcom_hwrng_init(struct hwrng *hwrng)
 {
 	struct qcom_rng *qrng = container_of(hwrng, struct qcom_rng, hwrng);
 
 	return clk_prepare_enable(qrng->clk);
@@ -130,135 +88,58 @@ static void qcom_hwrng_cleanup(struct hwrng *hwrng)
 	struct qcom_rng *qrng = container_of(hwrng, struct qcom_rng, hwrng);
 
 	clk_disable_unprepare(qrng->clk);
 }
 
-static int qcom_rng_enable(struct qcom_rng *rng)
-{
-	u32 val;
-	int ret;
-
-	ret = clk_prepare_enable(rng->clk);
-	if (ret)
-		return ret;
-
-	/* Enable PRNG only if it is not already enabled */
-	val = readl_relaxed(rng->base + PRNG_CONFIG);
-	if (val & PRNG_CONFIG_HW_ENABLE)
-		goto already_enabled;
-
-	val = readl_relaxed(rng->base + PRNG_LFSR_CFG);
-	val &= ~PRNG_LFSR_CFG_MASK;
-	val |= PRNG_LFSR_CFG_CLOCKS;
-	writel(val, rng->base + PRNG_LFSR_CFG);
-
-	val = readl_relaxed(rng->base + PRNG_CONFIG);
-	val |= PRNG_CONFIG_HW_ENABLE;
-	writel(val, rng->base + PRNG_CONFIG);
-
-already_enabled:
-	clk_disable_unprepare(rng->clk);
-
-	return 0;
-}
-
-static int qcom_rng_init(struct crypto_tfm *tfm)
-{
-	struct qcom_rng_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	ctx->rng = qcom_rng_dev;
-
-	if (!ctx->rng->match_data->skip_init)
-		return qcom_rng_enable(ctx->rng);
-
-	return 0;
-}
-
-static struct rng_alg qcom_rng_alg = {
-	.generate	= qcom_rng_generate,
-	.seed		= qcom_rng_seed,
-	.seedsize	= 0,
-	.base		= {
-		.cra_name		= "stdrng",
-		.cra_driver_name	= "qcom-rng",
-		.cra_flags		= CRYPTO_ALG_TYPE_RNG,
-		.cra_priority		= 300,
-		.cra_ctxsize		= sizeof(struct qcom_rng_ctx),
-		.cra_module		= THIS_MODULE,
-		.cra_init		= qcom_rng_init,
-	}
-};
-
 static int qcom_rng_probe(struct platform_device *pdev)
 {
+	const struct qcom_rng_match_data *match_data;
 	struct qcom_rng *rng;
 	int ret;
 
+	match_data = device_get_match_data(&pdev->dev);
+	if (match_data == NULL || !match_data->hwrng_support) {
+		dev_info(&pdev->dev, "TRNG support not detected\n");
+		/*
+		 * In this case the driver does nothing except the dev_info(),
+		 * but bind the device anyway to avoid effects on GCC state.
+		 */
+		return 0;
+	}
+
 	rng = devm_kzalloc(&pdev->dev, sizeof(*rng), GFP_KERNEL);
 	if (!rng)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, rng);
-	mutex_init(&rng->lock);
-
 	rng->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rng->base))
 		return PTR_ERR(rng->base);
 
 	rng->clk = devm_clk_get_optional(&pdev->dev, "core");
 	if (IS_ERR(rng->clk))
 		return PTR_ERR(rng->clk);
 
-	rng->match_data = (struct qcom_rng_match_data *)device_get_match_data(&pdev->dev);
-
-	qcom_rng_dev = rng;
-	ret = crypto_register_rng(&qcom_rng_alg);
-	if (ret) {
-		dev_err(&pdev->dev, "Register crypto rng failed: %d\n", ret);
-		qcom_rng_dev = NULL;
-		return ret;
-	}
-
-	if (rng->match_data->hwrng_support) {
-		rng->hwrng.name = "qcom_hwrng";
-		rng->hwrng.init = qcom_hwrng_init;
-		rng->hwrng.read = qcom_hwrng_read;
-		rng->hwrng.cleanup = qcom_hwrng_cleanup;
-		rng->hwrng.quality = QCOM_TRNG_QUALITY;
-		ret = devm_hwrng_register(&pdev->dev, &rng->hwrng);
-		if (ret) {
-			dev_err(&pdev->dev, "Register hwrng failed: %d\n", ret);
-			qcom_rng_dev = NULL;
-			goto fail;
-		}
-	}
-
-	return ret;
-fail:
-	crypto_unregister_rng(&qcom_rng_alg);
+	rng->hwrng.name = "qcom_hwrng";
+	rng->hwrng.init = qcom_hwrng_init;
+	rng->hwrng.read = qcom_hwrng_read;
+	rng->hwrng.cleanup = qcom_hwrng_cleanup;
+	rng->hwrng.quality = QCOM_TRNG_QUALITY;
+	ret = devm_hwrng_register(&pdev->dev, &rng->hwrng);
+	if (ret)
+		dev_err(&pdev->dev, "Register hwrng failed: %d\n", ret);
 	return ret;
 }
 
-static void qcom_rng_remove(struct platform_device *pdev)
-{
-	crypto_unregister_rng(&qcom_rng_alg);
-
-	qcom_rng_dev = NULL;
-}
-
 static struct qcom_rng_match_data qcom_prng_match_data = {
-	.skip_init = false,
 	.hwrng_support = false,
 };
 
 static struct qcom_rng_match_data qcom_prng_ee_match_data = {
-	.skip_init = true,
 	.hwrng_support = false,
 };
 
 static struct qcom_rng_match_data qcom_trng_match_data = {
-	.skip_init = true,
 	.hwrng_support = true,
 };
 
 static const struct acpi_device_id __maybe_unused qcom_rng_acpi_match[] = {
 	{ .id = "QCOM8160", .driver_data = (kernel_ulong_t)&qcom_prng_ee_match_data },
@@ -274,11 +155,10 @@ static const struct of_device_id __maybe_unused qcom_rng_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, qcom_rng_of_match);
 
 static struct platform_driver qcom_rng_driver = {
 	.probe = qcom_rng_probe,
-	.remove =  qcom_rng_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.of_match_table = qcom_rng_of_match,
 		.acpi_match_table = ACPI_PTR(qcom_rng_acpi_match),
 	}
-- 
2.54.0.1064.gd145956f57-goog


