Return-Path: <linux-arm-msm+bounces-113265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Wj0gMMp/MGpvTwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:42:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAB068A708
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:42:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=j5yw40ph;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113265-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113265-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CD47302DE3B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 22:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC103BBFB5;
	Mon, 15 Jun 2026 22:42:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65893BA25E;
	Mon, 15 Jun 2026 22:42:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781563322; cv=none; b=XT/CDG8KYymJhQYULXHklr+B2OZ9pLnHU4XNlw7YcLB3eZo1vXNIU21FUEmF8qEBFxdH+kJNC6kNfuM6oeMd3iNCZP9nS5ZB3vgyK04rdqF3jdrX6LLohMIkocJsvsWryf46p7UaPIhfHhgSMKZafbud4/eihn0cedPohQzQ8nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781563322; c=relaxed/simple;
	bh=hXjLjT1QInnk1WS2VUkHhMt8NeNbwTljjkLeklpZAFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oZQZQkCzJFxBqRfCbyMFyaW5vBZ+W+69XbCxNXtDXo7AvUSiMxq4BpZcaswxQRK9yty9yvpff+4VwV2q+u6uxndvP07t7WaOe6gBrbeAegjEKSYdD9b2a3mOdFE9mdr0somZg3IPEeEW9xpmY6xub0SfBOAKMg6S+IdwMJ32P50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j5yw40ph; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC891F00A3F;
	Mon, 15 Jun 2026 22:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781563320;
	bh=PPXBit3hLFhiLMxmeudqMn5iFoCPhTD6OEjxNziNMNM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=j5yw40phTAZkmWIRFlMkyo/ICRoNDJ/Wqp7DKMO6Ubkmw1AmaV7Pd+Xedzuh9V1HL
	 9vRxzfecZFVfUEdlNAo57c2bNuhwQc7/cg5CgkxT4f1+1ehEbc+Q5p4n+uqTd1M5Dh
	 QYK7S3PdIBDlcPh0e2xk2dkFsbEGXIHde3/zdBtc0DoqtZBFMeMWDfap3mfw9zxUsL
	 4v7dZAr/t/ZVCNPl0GrklPD2YdVWLOuEt0xEYJ5WV0SVOrgiRTKHiCj6vljZ51udEG
	 9fkuRK9r5LJ0Pe2CMBNwpfZPezajteDVeYulBcN7bHC06Se8BS8vp1fhczZQJ0Remj
	 5/ft4/HDkdkoA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-kernel@vger.kernel.org,
	Gaurav Jain <gaurav.jain@nxp.com>,
	=?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Corentin Labbe <clabbe.montjoie@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 3/7] crypto: qcom-rng - Remove crypto_rng interface
Date: Mon, 15 Jun 2026 15:41:27 -0700
Message-ID: <20260615224131.69370-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615224131.69370-1-ebiggers@kernel.org>
References: <20260615224131.69370-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113265-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-crypto@vger.kernel.org,m:herbert@gondor.apana.org.au,m:linux-kernel@vger.kernel.org,m:gaurav.jain@nxp.com,m:horia.geanta@nxp.com,m:pankaj.gupta@nxp.com,m:clabbe.montjoie@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:ebiggers@kernel.org,m:stable@vger.kernel.org,m:clabbemontjoie@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ebiggers@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,nxp.com,gmail.com,oss.qualcomm.com,kernel.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3CAB068A708

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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/crypto/Kconfig    |   1 -
 drivers/crypto/qcom-rng.c | 158 +++++---------------------------------
 2 files changed, 19 insertions(+), 140 deletions(-)

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 216a00bad5d7..eb834d15d614 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -639,11 +639,10 @@ config CRYPTO_DEV_QCE_SW_MAX_LEN
 
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
2.54.0


