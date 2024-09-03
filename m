Return-Path: <linux-arm-msm+bounces-30551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AAA96A9FE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 23:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0ADA4B21B1A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 21:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFDED149C50;
	Tue,  3 Sep 2024 21:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SQ4Td4DS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEDB126BE4
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 21:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725398570; cv=none; b=b1nQEqgRSiLSMS7uTMRdwK8qyy883FA/XQLQGCl/MTi4HXOBh/G47g27ldqTyghwmlN8T8sLEM4JZZbeAz6jn/Gy4nOKfC8n0ANmYUjgql1GIGpzWt/9lOd4/rn3IYX4Cliqong0qFYvo3jmNAFq49HZWffi60Zt1/qNAJhhAcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725398570; c=relaxed/simple;
	bh=XeVESrItEVM4R9ipyaNeknfhuHOQ4dILrBWsO0yCW3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=p3aaOA0vjoKOZ5aYCLqnZS+uS2fPAviUPO49YsnNNsDdhJaVyskULxX2d26IwNrrHfWjpk1q/iZGJoVmfv7SWGgMPL1MnaXPv6znWdCIdx9hS4qxTADkRT6pw5tbs6sq+QSeX1eTwRbImIrJG3kG6q5SPTguZt5rphdBFlhUq1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SQ4Td4DS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725398568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5OaxE+qf4J1jZnk8c8Xd2x+KJy3fbwff+kIsNtq2Opo=;
	b=SQ4Td4DSIcu5BDsv8KOsgG2sUCsevTeMQZodja7MEKK/vOPh4x0m4CZORZbKpCq2SWTbE/
	ucODV1iOTzDDJYNQCy8G5/NfjSYJnRosS99aWN5TSyeVL74CsbpiP/N6BwsWZFqZsTvQdU
	WhKluPPaD9W13EwbzdqZRL/Aj/kCSbE=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-Sp-iZDDzMt6_WeYb7zNo-A-1; Tue, 03 Sep 2024 17:22:47 -0400
X-MC-Unique: Sp-iZDDzMt6_WeYb7zNo-A-1
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-277f1e27d63so3955030fac.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2024 14:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725398566; x=1726003366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OaxE+qf4J1jZnk8c8Xd2x+KJy3fbwff+kIsNtq2Opo=;
        b=jyRMzt1E6QG2aQddJlYWUlMohCjdzJejRCqSw1o+1JUy8ZNv0KFNcMNL2BuGinr8ey
         Yucps+exNtIWTiz4x1taeWHWqrdRfyoYUNEhytvBOox2ELpglRZ0c+eS2IEI7dkzmsla
         97dOc9/fFM6mrFhprPi/nZTb2QKT8+Y4NC/j7nZEoGQFYBr2n4gDIHRhAKycWExpTMbY
         BaW0NUgpNHBgdX4dqKYvLXuKjF8iKnA5cvZucwS5cFUyOUhqQDFnNMpOL/FBfK+Ux2Q2
         Mx9reXgJ/+jlcadk493uE/WhYlXz4vGHa1QZOKzzKLJbhLoJpW70mgb0sz68CrsigwFR
         7D+g==
X-Forwarded-Encrypted: i=1; AJvYcCWuVUHNofYD8NXTEm7HRe4LRzRNawXXnOMvYzcgZRQSwAMOe5V9F3ybBKZ/31tWFflQa8zdegJ8jLBihxdk@vger.kernel.org
X-Gm-Message-State: AOJu0YxMsAfONx53+HGMVnq3lTxzL0OvAXSzDm5orQe0prciNFIwLlfK
	imNK2oBcBfJvlCKMBrxaT9VvHbYPlO92lINzjG5RS1T9jNye3c7cDPCQLAl43s31XZzUe+fkVcX
	qKbGOVW1BvTl5w138yPcaRXez2R8xMyPw09x5LLXqfJESb4WruyClzcrw4XT2jFM=
X-Received: by 2002:a05:6870:331e:b0:25e:7a1:ea8f with SMTP id 586e51a60fabf-277d06c897amr10603217fac.47.1725398566446;
        Tue, 03 Sep 2024 14:22:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5djy4RfXuBi03LceJtw15luMRH4Faxo5Y9BNdPLILRJ8AbHm4nzFztUWK6JYZrH61sMi09w==
X-Received: by 2002:a05:6870:331e:b0:25e:7a1:ea8f with SMTP id 586e51a60fabf-277d06c897amr10603204fac.47.1725398566139;
        Tue, 03 Sep 2024 14:22:46 -0700 (PDT)
Received: from x1.redhat.com (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a806bfb8c9sm564737185a.25.2024.09.03.14.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 14:22:44 -0700 (PDT)
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
Subject: [PATCH v2 1/2] crypto: qcom-rng: fix support for ACPI-based systems
Date: Tue,  3 Sep 2024 17:22:19 -0400
Message-ID: <20240903212230.707376-2-bmasney@redhat.com>
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
ACPI support was broken when the hw_random interface support was added.
Let's go ahead and fix this by adding a check for has_acpi_companion().

This fix was boot tested on a Qualcomm Amberwing server.

Fixes: f29cd5bb64c2 ("crypto: qcom-rng - Add hw_random interface support")
Reported-by: Ernesto A. Fernández <ernesto.mnd.fernandez@gmail.com>
Closes: https://lore.kernel.org/linux-arm-msm/20240828184019.GA21181@eaf/
Cc: stable@vger.kernel.org
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Note: I looked at updating the struct qcom_rng_acpi_match to have
driver_data point to &qcom_prng_ee_of_data, however that won't work
since struct acpi_device_id has a driver_data member of type
kernel_ulong_t. struct of_device_id has the data member set to
type const void *. As I get available time, I'll look to see if
it's possible to migrate struct acpi_device_id.driver_data from
a kernel_ulong_t to a const void * to match what's done in
struct of_device_id. That will allow removing the has_acpi_companion()
check in the future. I suspect that change is not going to be trivial
though.

 drivers/crypto/qcom-rng.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/crypto/qcom-rng.c b/drivers/crypto/qcom-rng.c
index c670d7d0c11e..7ba978f0ce8b 100644
--- a/drivers/crypto/qcom-rng.c
+++ b/drivers/crypto/qcom-rng.c
@@ -176,6 +176,21 @@ static struct rng_alg qcom_rng_alg = {
 	}
 };
 
+static struct qcom_rng_of_data qcom_prng_of_data = {
+	.skip_init = false,
+	.hwrng_support = false,
+};
+
+static struct qcom_rng_of_data qcom_prng_ee_of_data = {
+	.skip_init = true,
+	.hwrng_support = false,
+};
+
+static struct qcom_rng_of_data qcom_trng_of_data = {
+	.skip_init = true,
+	.hwrng_support = true,
+};
+
 static int qcom_rng_probe(struct platform_device *pdev)
 {
 	struct qcom_rng *rng;
@@ -196,7 +211,10 @@ static int qcom_rng_probe(struct platform_device *pdev)
 	if (IS_ERR(rng->clk))
 		return PTR_ERR(rng->clk);
 
-	rng->of_data = (struct qcom_rng_of_data *)of_device_get_match_data(&pdev->dev);
+	if (has_acpi_companion(&pdev->dev))
+		rng->of_data = &qcom_prng_ee_of_data;
+	else
+		rng->of_data = (struct qcom_rng_of_data *)of_device_get_match_data(&pdev->dev);
 
 	qcom_rng_dev = rng;
 	ret = crypto_register_rng(&qcom_rng_alg);
@@ -231,21 +249,6 @@ static void qcom_rng_remove(struct platform_device *pdev)
 	qcom_rng_dev = NULL;
 }
 
-static struct qcom_rng_of_data qcom_prng_of_data = {
-	.skip_init = false,
-	.hwrng_support = false,
-};
-
-static struct qcom_rng_of_data qcom_prng_ee_of_data = {
-	.skip_init = true,
-	.hwrng_support = false,
-};
-
-static struct qcom_rng_of_data qcom_trng_of_data = {
-	.skip_init = true,
-	.hwrng_support = true,
-};
-
 static const struct acpi_device_id __maybe_unused qcom_rng_acpi_match[] = {
 	{ .id = "QCOM8160", .driver_data = 1 },
 	{}
-- 
2.46.0


