Return-Path: <linux-arm-msm+bounces-31032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A7696E6CA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 02:26:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82227B23A45
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 00:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690A51E49B;
	Fri,  6 Sep 2024 00:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RtCqz4OX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22F31CF93
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Sep 2024 00:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725582345; cv=none; b=WvJp6PWkoWif9WMFpESqfvIPPMz1b427f6p1YK/wNyZTkc1ERS9+TbfHsaQiO0YcceWlNzF7LsNr+60rcwP88T+KHiSaNtuDJ4iTlXoRVg4zzxnNJiGzHacmLGWQO6U3mjYQlsSP+aQ8qje4M6ldO/NYQQ2VwzHvTKH6uWN/M2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725582345; c=relaxed/simple;
	bh=F9Uwhqqdr1QEO4Uf0e3N6m5hVQ48iQS/2mzlZua6pJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=DxpdTyvdlmPItT3gxx7PF6huIPOSg26bcII6rfCYkUpdEojhFR1nMl6ITtwMWCpwob4WyAWnMzqLMlC/WREm9yPMM1rQCfkY+DQ8SVwySDrfCRd1xI9bx6z8hPZPiF6r7mCSCZGsHk0lhSUAhyP9YBm20v2/JU3O/dKQ8OqIfnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RtCqz4OX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725582342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AXs+sSHMxW4xLKVsJ3yX9bT40+qBEQlZQpspzwecfqg=;
	b=RtCqz4OXU/cMnTL3ATRlyTvwGb/mk0GJiNK/QQGfh/6QxujmqAT0pgM8c7pRA8h6DRpaip
	N1XuPKRKXOdl9l0mwg+GaB6ni0nXWHWSUyVDopBh/GWvlrls7PJm9iu2QFjrHUq8KvdU0l
	5qUu8oZaTx6eSoN4Ki64tzD1umdwKMk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-XLeBbEMuM_mmvG3-hLui-w-1; Thu, 05 Sep 2024 20:25:41 -0400
X-MC-Unique: XLeBbEMuM_mmvG3-hLui-w-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7a8110f90a2so248434385a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 17:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725582341; x=1726187141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AXs+sSHMxW4xLKVsJ3yX9bT40+qBEQlZQpspzwecfqg=;
        b=Q7uagcVjsFf1BDfbun4qT/ubWcJxidy0grF4z1oobx6o3rzHuLa9uD3adI+6bvxzAq
         t1jMLakm7NNpv/stk8zMbACKZvxIU++nVA4cap1HP9vXFq3g7vl0AnluhRbHTSG2JFU/
         peJuTH7OMkWQUmoWxnzUpXSpieP0Q2HQrjVGw1aJ2ufoReAEsX77QscjJqaVz21YrmL7
         aZTGs4wB+LNJlIbYb72DufScFcw9wX6aUu/5wYzb3qtV/S410dpUZNnhdfZtpf2dvgaZ
         vXtf7pqvj4AJhw7WSIVi9oO+LtUdZkYIJdEJd0oYtlV7ky0dROMnKQNsURujkLJQmLmN
         hnDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMrR1IR6YPUDUsWSmwR5/lneLN2DKRhm/clvHT+ThoqJfRl6vaAtYt4zwh4QXw6gM+mGoM84C4jL2buA5S@vger.kernel.org
X-Gm-Message-State: AOJu0YyEa1BTQpc9ReVaLH9CCxODgedwq8vZLipbNzh/gdwbN+fU7Vkd
	SxAB4j8cii6anNl9SmLyWk7Lzt4p+Cwh3N6vCyhVWpiVQnL5nFUseZP58Cz/0wmGt4MDQ9qL3OU
	ROzyYUY4e+Ca1pcv5jcluqoHcudzJKHq9KNBPZHov8VFL+tUG70YqT2YVxa+73gs=
X-Received: by 2002:a05:620a:44d6:b0:79f:78a:f7b4 with SMTP id af79cd13be357-7a99738053cmr92038885a.42.1725582341056;
        Thu, 05 Sep 2024 17:25:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtgm5o2cQmEAwVZpksxYurvLL3zktTO4nmhdmHXqyWN7CwpD6yac08Ur1BLlemaReX6WXNvg==
X-Received: by 2002:a05:620a:44d6:b0:79f:78a:f7b4 with SMTP id af79cd13be357-7a99738053cmr92037685a.42.1725582340701;
        Thu, 05 Sep 2024 17:25:40 -0700 (PDT)
Received: from x1.redhat.com (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a98f026309sm120779185a.128.2024.09.05.17.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 17:25:38 -0700 (PDT)
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
Subject: [PATCH v3 2/2] crypto: qcom-rng: rename *_of_data to *_match_data
Date: Thu,  5 Sep 2024 20:25:21 -0400
Message-ID: <20240906002521.1163311-3-bmasney@redhat.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240906002521.1163311-1-bmasney@redhat.com>
References: <20240906002521.1163311-1-bmasney@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

The qcom-rng driver supports both ACPI and device tree based systems.
Let's rename all instances of *of_data to *match_data so that it's
not implied that this driver only supports device tree-based systems.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/crypto/qcom-rng.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/crypto/qcom-rng.c b/drivers/crypto/qcom-rng.c
index 6496b075a48d..09419e79e34c 100644
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
 
-	rng->of_data = (struct qcom_rng_of_data *)device_get_match_data(&pdev->dev);
+	rng->match_data = (struct qcom_rng_match_data *)device_get_match_data(&pdev->dev);
 
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
@@ -231,31 +231,31 @@ static void qcom_rng_remove(struct platform_device *pdev)
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
 
 static const struct acpi_device_id __maybe_unused qcom_rng_acpi_match[] = {
-	{ .id = "QCOM8160", .driver_data = (kernel_ulong_t)&qcom_prng_ee_of_data },
+	{ .id = "QCOM8160", .driver_data = (kernel_ulong_t)&qcom_prng_ee_match_data },
 	{}
 };
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


