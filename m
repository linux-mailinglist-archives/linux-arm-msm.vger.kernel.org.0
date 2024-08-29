Return-Path: <linux-arm-msm+bounces-29881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF5D963799
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 03:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5146B1C22185
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 01:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41872746D;
	Thu, 29 Aug 2024 01:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U1XAPBih"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F9817C8D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 01:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724894496; cv=none; b=DX6KcAyo278GdACJpuet/jBEl3IR+v7o3OElxHWkEO3PLm668365H+PwoKyt7Y9TTk9VkaSWkgt011P4+yLU8R5QzyDu7k1ZdDJjRkI+/Amp6EbHySDhVTdJwHH0vLs5So1Dz5G7Pcaa8Ah6tdRJNvYcakY4PJa8QGJiSp9Ywiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724894496; c=relaxed/simple;
	bh=pVIsjIwUVSuD9f5vpgG6Je4vWyRG4TASquy5YfmS7vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=d/IxgYvWbf/vZMtU8cUPRsVXNKErk1o3kSbo7JZNXF2tpofyBiu8lRNIagaOlwyQXN6O64WgcWlw+U35xSgqYig3KQi4VnCOki3JyW9EuL1tezpKirI5Z/COkVrHWwArmYE65WGnxnG9c3yTqRskoX5QHWePjLD2h1P1arLY5RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U1XAPBih; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724894493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uPFXZeRskPV1LBySPC5AK+d7TuSi/RtTN6Kvr+xrijg=;
	b=U1XAPBihyi/jcsMsoqK2rPQxl5aOi/g6tsj6uKDmvdmzeHl+XymVEmR4IcA5jDwWZmGnnG
	EYtuFRjAfyJ5+iBBpwMOzW+OeZ8pi+G0pR6qD2Qv7HMUh57KRTDP6vdzBA5NXaN1axfqS5
	6wqm1mYJ7Fn2JzjRNUdR/Y72M/sdqZM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-rJaMkY4OMPWmqrRud3FHsA-1; Wed, 28 Aug 2024 21:21:30 -0400
X-MC-Unique: rJaMkY4OMPWmqrRud3FHsA-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6c1610cd159so3234556d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 18:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724894490; x=1725499290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPFXZeRskPV1LBySPC5AK+d7TuSi/RtTN6Kvr+xrijg=;
        b=ZPy76Chi1d5uQNrTRinNcAQATQN/4jtY6Sp+o5WDOP/52zAxQT8KbouuUqHl6ATuKj
         wVExLjKKfOdEekSwqqahDNoGZL1Jn2g+E5p/cXL5Hhfc2vFcURKNLg2UpuEtwrdgiTuA
         /W+xW3CsnyBi9RyUHTx2OBKldoSBesYfdTuPO89T8p/J6gfbusqBSe0/gpn7IOw53+Ev
         OFHwz9SgcNHcnDnFgwIO6p3gnxbUStiYtfiVGkpuMdJ18/8gV7I3dqD8mxwIeOwIHfrZ
         aYKt9WlmJqlHX1YMZxu2GJETrut5DLievlFEtKqcs/Bm9l4mCs/QPsFy42VwdLaPTlRQ
         1vrg==
X-Forwarded-Encrypted: i=1; AJvYcCXEUlFh7b0kZqLmV7D04Zvrza1RLOAeDlKf3+4txbGRYP3U7hdG4mFYCW4NhCw6MQr0zSCS4qaUKPx7Ztfh@vger.kernel.org
X-Gm-Message-State: AOJu0YxIMCumcesYeV9WdjkeTAHf1r4vqA+PCGXqZ9oxuy+FGyVIX2EK
	TRWdg+mcOIw7+N00Yck3HTPP810wkx0VjU5KRjo85egcvD/haIx67/nhA+1+XgmvW6romY+nufT
	89LGN4db8onGx4Itljsy6vp+4bhOCgw2fcRyOaMXYPus/jyaSoOrfS3h5w/mCZKE=
X-Received: by 2002:a05:6214:1946:b0:6bf:7efc:1117 with SMTP id 6a1803df08f44-6c33f33d66emr20160236d6.9.1724894490326;
        Wed, 28 Aug 2024 18:21:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+83JODhwFjiVeEZ7C0/0RpEBcm05e8lIief195xyZB9E5UbynGRmQWhUDqK+J30xjphpQgg==
X-Received: by 2002:a05:6214:1946:b0:6bf:7efc:1117 with SMTP id 6a1803df08f44-6c33f33d66emr20160006d6.9.1724894490020;
        Wed, 28 Aug 2024 18:21:30 -0700 (PDT)
Received: from x1.redhat.com (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c340c96825sm1013236d6.75.2024.08.28.18.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 18:21:28 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: herbert@gondor.apana.org.au
Cc: davem@davemloft.net,
	quic_omprsing@quicinc.com,
	neil.armstrong@linaro.org,
	quic_bjorande@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] crypto: qcom-rng: rename *_of_data to *_match_data
Date: Wed, 28 Aug 2024 21:20:04 -0400
Message-ID: <20240829012005.382715-2-bmasney@redhat.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240829012005.382715-1-bmasney@redhat.com>
References: <20240829012005.382715-1-bmasney@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

The qcom-rng driver supports both ACPI and device tree based systems.
Let's rename all instances of *_of_data to *_match_data in preparation
for fixing the ACPI support that was broken with commit
f29cd5bb64c2 ("crypto: qcom-rng - Add hw_random interface support").

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/crypto/qcom-rng.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/crypto/qcom-rng.c b/drivers/crypto/qcom-rng.c
index c670d7d0c11e..4ed545001b77 100644
--- a/drivers/crypto/qcom-rng.c
+++ b/drivers/crypto/qcom-rng.c
@@ -36,14 +36,14 @@ struct qcom_rng {
 	void __iomem *base;
 	struct clk *clk;
 	struct hwrng hwrng;
-	struct qcom_rng_of_data *of_data;
+	struct qcom_rng_match_data *match_data;
 };
 
 struct qcom_rng_ctx {
 	struct qcom_rng *rng;
 };
 
-struct qcom_rng_of_data {
+struct qcom_rng_match_data {
 	bool skip_init;
 	bool hwrng_support;
 };
@@ -155,7 +155,7 @@ static int qcom_rng_init(struct crypto_tfm *tfm)
 
 	ctx->rng = qcom_rng_dev;
 
-	if (!ctx->rng->of_data->skip_init)
+	if (!ctx->rng->match_data->skip_init)
 		return qcom_rng_enable(ctx->rng);
 
 	return 0;
@@ -196,7 +196,7 @@ static int qcom_rng_probe(struct platform_device *pdev)
 	if (IS_ERR(rng->clk))
 		return PTR_ERR(rng->clk);
 
-	rng->of_data = (struct qcom_rng_of_data *)of_device_get_match_data(&pdev->dev);
+	rng->match_data = (struct qcom_rng_match_data *)of_device_get_match_data(&pdev->dev);
 
 	qcom_rng_dev = rng;
 	ret = crypto_register_rng(&qcom_rng_alg);
@@ -206,7 +206,7 @@ static int qcom_rng_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	if (rng->of_data->hwrng_support) {
+	if (rng->match_data->hwrng_support) {
 		rng->hwrng.name = "qcom_hwrng";
 		rng->hwrng.read = qcom_hwrng_read;
 		rng->hwrng.quality = QCOM_TRNG_QUALITY;
@@ -231,17 +231,17 @@ static void qcom_rng_remove(struct platform_device *pdev)
 	qcom_rng_dev = NULL;
 }
 
-static struct qcom_rng_of_data qcom_prng_of_data = {
+static struct qcom_rng_match_data qcom_prng_match_data = {
 	.skip_init = false,
 	.hwrng_support = false,
 };
 
-static struct qcom_rng_of_data qcom_prng_ee_of_data = {
+static struct qcom_rng_match_data qcom_prng_ee_match_data = {
 	.skip_init = true,
 	.hwrng_support = false,
 };
 
-static struct qcom_rng_of_data qcom_trng_of_data = {
+static struct qcom_rng_match_data qcom_trng_match_data = {
 	.skip_init = true,
 	.hwrng_support = true,
 };
@@ -253,9 +253,9 @@ static const struct acpi_device_id __maybe_unused qcom_rng_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, qcom_rng_acpi_match);
 
 static const struct of_device_id __maybe_unused qcom_rng_of_match[] = {
-	{ .compatible = "qcom,prng", .data = &qcom_prng_of_data },
-	{ .compatible = "qcom,prng-ee", .data = &qcom_prng_ee_of_data },
-	{ .compatible = "qcom,trng", .data = &qcom_trng_of_data },
+	{ .compatible = "qcom,prng", .data = &qcom_prng_match_data },
+	{ .compatible = "qcom,prng-ee", .data = &qcom_prng_ee_match_data },
+	{ .compatible = "qcom,trng", .data = &qcom_trng_match_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_rng_of_match);
-- 
2.46.0


