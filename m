Return-Path: <linux-arm-msm+bounces-30552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACB196AA01
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 23:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE5501F259AA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 21:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7CEF1A3A9A;
	Tue,  3 Sep 2024 21:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U640d6iX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC1A190482
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 21:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725398573; cv=none; b=BVm8+3TS48HMmmVghPktNTMUBviKVpvvBvDMHe4ePgR/LzgGrmZ2DNtmh0YAePVHUlnyYM/q1C//j4Ga3IGStvlX2H+WQXzMcmcXmNqSobdA/Y2PgwOh0cAmhakE1uLb46xNj75X/1qN1qHl25vCy9KzjTQOSTOlsFohc6384lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725398573; c=relaxed/simple;
	bh=8P1Jum47rGgM7FDX62HMOHw91bamdwad0+5M/vSm+X0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=pj1DZ8tubQzZP2m80Hobf2YRQNQ7fhwYPPoqvFo8DcRgoIpwhu/0sYxoMBTiyoKDZz8U7HImzWk+eUa9uFIufgBR2m6j3tm5PfVQNWmVDvi2E+ug+5gKTPm/ZTLXr6vW9o6TuZkBGaT2ME6MVIACdq4NlZnuJIDWbp6QaB097AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U640d6iX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725398571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x8BQfqOVIo0s9x5Bh8x8Xi9+zxZ5VGhm3NLe1eX0SoQ=;
	b=U640d6iXbRZbI42cUA81k+AhotHl6t835KYw8r2TuY8aQKYFrN3u3dkwEYkhdisZOVJdGb
	O86/ING9HdXSDaepBrYNlRFwCsRZw4rtlCSDCdgsTsDlurZchU7tMBH46SShFx6AGaNKAE
	FnMcl0u//dYOdIGv8VLMl+eNPj4RXyw=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154--ns-XfxDMoCXay299kZ2Mg-1; Tue, 03 Sep 2024 17:22:50 -0400
X-MC-Unique: -ns-XfxDMoCXay299kZ2Mg-1
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-277e50bf7c8so3364865fac.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2024 14:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725398569; x=1726003369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x8BQfqOVIo0s9x5Bh8x8Xi9+zxZ5VGhm3NLe1eX0SoQ=;
        b=NhNbBxc+XIuAW1W/nP7zW57VWHZ0yYwwecrZMTy76WXxX6NAHAvEboX0/AV/7Z/9C9
         sYGwiK6JvyX7tFU9HuqPuZcJm4NKrm9v6Oje7cLFsLwXAdt3gFfJNGgrM0olPmeqfS78
         fY4F3eI9bSlQwC6JWQY1rLvgo4wWPbDpCYVOphkwoW7XhNAcARIc2fMcpd03Ey68OSbv
         KAnCtMe+9/odzDqcwACRZ5XykIa/Y6JRW7jWXZ/aD7ee551m4YQSbqWE8Q4Nhtmc9uhA
         h/1QCjR94On0qDBdsgQntO9ql+BTCcHupkHIEUL//AvHBpDZdckEUV8my/CzZYLjnrY+
         uI+w==
X-Forwarded-Encrypted: i=1; AJvYcCWmOiSYK4pr5wreRIjvAsLZKuX6QkfNd30mvmcNfUY+vpolavQMUcoe8yXzGOqFVQyg64NhpckJ8+dzaZcG@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi6MtKJ1wuThUvyDIsIrZ6xxr4AlSbKx6R03jt5dUg9hpmLfZf
	9gyvMyvbT4SNbne6ZeX5jmsHojk9Ifn60TnvJq7RezPCw9smQOknbWG5YcAsM6v4hukhWmo+y4d
	ODYGTwB1DMVSpfQ9EYHCAe9RnCBijm5VW0mFZXo9hd+15g8TRgrkZew32DB7KZdo=
X-Received: by 2002:a05:6870:ab13:b0:261:648:ddc5 with SMTP id 586e51a60fabf-277d0440313mr13448320fac.22.1725398569447;
        Tue, 03 Sep 2024 14:22:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkeRLWZ/sDG45fCql0Gm6F6kVH9oaiaaJPzDMm1J3AN0Z6MSDkiIcKaR6kgJxb0RqGP1wSkQ==
X-Received: by 2002:a05:6870:ab13:b0:261:648:ddc5 with SMTP id 586e51a60fabf-277d0440313mr13448302fac.22.1725398569071;
        Tue, 03 Sep 2024 14:22:49 -0700 (PDT)
Received: from x1.redhat.com (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a806bfb8c9sm564737185a.25.2024.09.03.14.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 14:22:47 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: herbert@gondor.apana.org.au
Cc: davem@davemloft.net,
	quic_omprsing@quicinc.com,
	neil.armstrong@linaro.org,
	quic_bjorande@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ernesto.mnd.fernandez@gmail.com,
	quic_jhugo@quicinc.com
Subject: [PATCH v2 2/2] crypto: qcom-rng: rename *_of_data to *_match_data
Date: Tue,  3 Sep 2024 17:22:20 -0400
Message-ID: <20240903212230.707376-3-bmasney@redhat.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240903212230.707376-1-bmasney@redhat.com>
References: <20240903212230.707376-1-bmasney@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

The qcom-rng driver supports both ACPI and device tree based systems.
Let's rename all instances of *_of_data to *_match_data so that it's
not implied that this driver only supports device tree.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/crypto/qcom-rng.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/crypto/qcom-rng.c b/drivers/crypto/qcom-rng.c
index 7ba978f0ce8b..f630962469c8 100644
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
@@ -176,17 +176,17 @@ static struct rng_alg qcom_rng_alg = {
 	}
 };
 
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
@@ -212,9 +212,10 @@ static int qcom_rng_probe(struct platform_device *pdev)
 		return PTR_ERR(rng->clk);
 
 	if (has_acpi_companion(&pdev->dev))
-		rng->of_data = &qcom_prng_ee_of_data;
+		rng->match_data = &qcom_prng_ee_match_data;
 	else
-		rng->of_data = (struct qcom_rng_of_data *)of_device_get_match_data(&pdev->dev);
+		rng->match_data =
+			(struct qcom_rng_match_data *)of_device_get_match_data(&pdev->dev);
 
 	qcom_rng_dev = rng;
 	ret = crypto_register_rng(&qcom_rng_alg);
@@ -224,7 +225,7 @@ static int qcom_rng_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	if (rng->of_data->hwrng_support) {
+	if (rng->match_data->hwrng_support) {
 		rng->hwrng.name = "qcom_hwrng";
 		rng->hwrng.read = qcom_hwrng_read;
 		rng->hwrng.quality = QCOM_TRNG_QUALITY;
@@ -256,9 +257,9 @@ static const struct acpi_device_id __maybe_unused qcom_rng_acpi_match[] = {
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


