Return-Path: <linux-arm-msm+bounces-110339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGvBJftGGmrP2ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 04:10:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 064B860AE2F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 04:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9185D305A5F3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 02:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE2E3126C2;
	Sat, 30 May 2026 02:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BGLnoD6e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57433239E60;
	Sat, 30 May 2026 02:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780106831; cv=none; b=Bsa/eBZ2v3Z8d+FK9pRM9SdtA3hcTslJvAUEVvFaLVzEYfm4mt1m2KklpFG8kNq5lxZ+BqD4QOGvP6wLBmFKlCBhGpUd4JYEWd/sq8+9jPk8yc7O59stkeCnMwS2+jFdR93ZF2pZNavWijYoUQNTrBjFnzQn3sJ47gYqewoTZ2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780106831; c=relaxed/simple;
	bh=1wcyuj7dq4hdewVAFqTdvs1tFjn6zSc7/qBQJmpq48E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PT3MMeno7VoOHrS56adyaGfYkUIbn9sEcXSx+Ub/jMrQxkobhFTx0n87A+Mkg+EccxQXPmmJpnSL8Ds6EBUyD5yF1c7Q011U8du/MeH5ItYHvY0ZHF+pknjQBW1Wkehg7yCQC4/KCd97ETgbccbP9U2GA2LlvtV0bX9EWZkCvSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BGLnoD6e; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D911F00899;
	Sat, 30 May 2026 02:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780106830;
	bh=0z/PWEVZMcEl2xNn3u/IQ3QAWI3jmJkJOckw6jHCQjM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BGLnoD6eLC69jbuIV+wkmHkKT3tp93PtLoujAf56mhIct2VPZxw4FhMWcurDGcnaR
	 19Mf8H7ralAwQi8qtteaKfeOyI6mcHEuo7Cu2i8jFvtavA9PLh6QId9upOucaXHg2l
	 hBr79CLhTtaN0GENQ9SKyega85KBUCI9SuHLwL8bRZL75MvQ0QVmPiiOw5jX/UBGZA
	 eGAP0CM0gvEeeBskQzpMK1FIkaWKKylq1lUY5YMDOD6BNwBfbEiRDZZYOzZxy9LoJb
	 +jr8tRP4MrEOFZQG//0DbeWwTgjwKZOwsIUqqYD6JJqpd+PXULqakL1SWF/+4YowD4
	 9ju+GYLJPDbUw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Om Prakash Singh <quic_omprsing@quicinc.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Olivia Mackall <olivia@selenic.com>,
	Eric Biggers <ebiggers@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/4] crypto: qcom-rng - Enable clock in hwrng case
Date: Fri, 29 May 2026 19:03:29 -0700
Message-ID: <20260530020332.143058-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530020332.143058-1-ebiggers@kernel.org>
References: <20260530020332.143058-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110339-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 064B860AE2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix qcom-rng.c to enable the clock before accessing the hardware.

Fixes: f29cd5bb64c2 ("crypto: qcom-rng - Add hw_random interface support")
Cc: stable@vger.kernel.org
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/crypto/qcom-rng.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/crypto/qcom-rng.c b/drivers/crypto/qcom-rng.c
index 150e5802e351..f31a7fe07ba7 100644
--- a/drivers/crypto/qcom-rng.c
+++ b/drivers/crypto/qcom-rng.c
@@ -111,17 +111,31 @@ static int qcom_rng_seed(struct crypto_rng *tfm, const u8 *seed,
 			 unsigned int slen)
 {
 	return 0;
 }
 
+static int qcom_hwrng_init(struct hwrng *hwrng)
+{
+	struct qcom_rng *qrng = container_of(hwrng, struct qcom_rng, hwrng);
+
+	return clk_prepare_enable(qrng->clk);
+}
+
 static int qcom_hwrng_read(struct hwrng *hwrng, void *data, size_t max, bool wait)
 {
 	struct qcom_rng *qrng = container_of(hwrng, struct qcom_rng, hwrng);
 
 	return qcom_rng_read(qrng, data, max);
 }
 
+static void qcom_hwrng_cleanup(struct hwrng *hwrng)
+{
+	struct qcom_rng *qrng = container_of(hwrng, struct qcom_rng, hwrng);
+
+	clk_disable_unprepare(qrng->clk);
+}
+
 static int qcom_rng_enable(struct qcom_rng *rng)
 {
 	u32 val;
 	int ret;
 
@@ -206,11 +220,13 @@ static int qcom_rng_probe(struct platform_device *pdev)
 		return ret;
 	}
 
 	if (rng->match_data->hwrng_support) {
 		rng->hwrng.name = "qcom_hwrng";
+		rng->hwrng.init = qcom_hwrng_init;
 		rng->hwrng.read = qcom_hwrng_read;
+		rng->hwrng.cleanup = qcom_hwrng_cleanup;
 		rng->hwrng.quality = QCOM_TRNG_QUALITY;
 		ret = devm_hwrng_register(&pdev->dev, &rng->hwrng);
 		if (ret) {
 			dev_err(&pdev->dev, "Register hwrng failed: %d\n", ret);
 			qcom_rng_dev = NULL;
-- 
2.54.0


