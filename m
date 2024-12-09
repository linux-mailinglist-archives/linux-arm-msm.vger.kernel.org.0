Return-Path: <linux-arm-msm+bounces-41111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D505C9E98D0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 15:29:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C265166CA3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 14:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 922C71C5CB2;
	Mon,  9 Dec 2024 14:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sb7Ab0Jy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9791BEF98
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 14:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733754495; cv=none; b=aMxi5/wU0YdK1m66wLEMvK7DEgAJqUvh/xIfrhrfdCdKO+E83HviNPDW2GGED262eRds/kK+3pH5NOppz+m9d7Yqq3eSBSY6Mt4XqjNhmWTpD/OLwbDIpbaDPTiDWlaIkGseIyivI8Ld7uUfWEkwv+Je+39R0Ux8DAtR7ZLZQYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733754495; c=relaxed/simple;
	bh=4Pncka7UkbqC3Kr6dTBYDaYj7aCk4aNWEEI0msKMVYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BXH4eaWEsjS+EiIBFxj9fmQsYGSgMKRnYwGNNVSbcQ/Am3s9APHhB9u3Bn3Azg46jxQGroBGl3/0UQPmU0TwPs28zQBUaJEdYnGJ2JVfUZTcZyyHEKoNv2x4k9ZJAX27ilkt48X6wUZvKU452riDz4EmkfPq72VbuXL/imZaLYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sb7Ab0Jy; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d3d69e5b63so274731a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 06:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733754492; x=1734359292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LrcZWTWQ0k15XJUbH5JtpskXN7f1upsgnsfnkZdegjI=;
        b=sb7Ab0JyFnss/iVQCSkJSGTHY50aqNog2qntEX2JxNaC93MAxmY7eQIVOkbI8Yk+Rj
         ugNDm+5ghERCSyM5wUR3DybTEZ0+EiOrBok32J1qPh/gmjHKx4sWjju/QydXBv0d03ZO
         2gPaEK+81WgvOJgCZb9NWKNdSIEPfUUulQWPS18qRbp8JVpWAkHNmNF6Xi8dgAIUzo6Y
         E0D42nrsmN5/vb2SxANXBekHIO7PfMPM3x1EupJjPfP/kKonvll3fh4wizmHx5d5YSBL
         i5C+1HgMftpemHqirWfNvrqaNiTQLL4bqigemP332OnkXvqRPBFmdPi9s7Ii94glOkgL
         WYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733754492; x=1734359292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LrcZWTWQ0k15XJUbH5JtpskXN7f1upsgnsfnkZdegjI=;
        b=hKEH2IMgjr96XzhuG8FH5MM1UeuLgCd5GYU49wRcpsuCDA6qHluGpazXein51+iAn/
         12H2NbSbzY529JjvAUMg4+snHnXwKagW4UGS2pVdublyyNHSC/KbrjGgBr3mqnu31Mff
         XnUukdMNdspglXTfeNmYX4V1FhY0oFjQPzB5ZytVioUs0mFPosx14Klf0jJaNreqtpF+
         sVB2tabAEuLL5UtJbhGKk0NbQHh18jViQHCFLY5e9N6daJm0ppGcFXGZEUgtduOYfhtq
         /pqMdD58njRfy3Eis3dPdzTYWM/G0zYnHtkPPMmxAiRh1uNyREJYqD/GeBstQJmy3Bbo
         TVvg==
X-Gm-Message-State: AOJu0Ywtkr8eiwO7W4gj7PStPd7M1kOFQDEq5YlnGR5HuwX+BrC0EpKg
	95kGKBrL7kAlcC9yN1YbS41zoi9KDUeGm/gpziyIMM+XNcSR+OmOEH8J0bE7rWLVy3OnATOvCPG
	V
X-Gm-Gg: ASbGncsrUJF2c5iRLD6zmShBsyyXY8iywIm8nQ0flWqeEvNDWG4/D+hMHVMQ2wnvw/j
	qlp3T3aRi6IfkHEKwRZWo3uLQPzeacns4u3FqFeR40oNP8v9ZB2xU8UHDrTpFeGOCSwhj9JMXu5
	ITvd2/8RTSBk7dse8Nunm3BiQB90ZN4cLUmmsnlgu5AHbVGCrpdNCjDyZcbDeX3RebXO0fjEwAO
	DRTSo5MK/xAZpe2LjehnsdSOG5rFpa/wz4r1vcE/LINpO8M9IB1CgKRhpfLWd6Waw==
X-Google-Smtp-Source: AGHT+IGIC4nihlegOu+zGJNRmS1inLtFDYhfYoyLnPOcGjTxisgrxlM7itNNq6OP/G6KrPRubQfqmw==
X-Received: by 2002:a05:6402:34cc:b0:5d0:e852:dca0 with SMTP id 4fb4d7f45d1cf-5d3be81e011mr4688593a12.11.1733754491700;
        Mon, 09 Dec 2024 06:28:11 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3eb109bc9sm2887141a12.42.2024.12.09.06.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 06:28:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Dec 2024 15:27:57 +0100
Subject: [PATCH v2 4/6] firmware: qcom: scm: Cleanup global '__scm' on
 probe failures
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-4-9061013c8d92@linaro.org>
References: <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-0-9061013c8d92@linaro.org>
In-Reply-To: <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-0-9061013c8d92@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Mukesh Ojha <quic_mojha@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Kuldeep Singh <quic_kuldsing@quicinc.com>, 
 Elliot Berman <quic_eberman@quicinc.com>, 
 Andrew Halaney <ahalaney@redhat.com>, 
 Avaneesh Kumar Dwivedi <quic_akdwived@quicinc.com>, 
 Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3735;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=4Pncka7UkbqC3Kr6dTBYDaYj7aCk4aNWEEI0msKMVYU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnVv5wKJ3snnQ32fKmGQYLiZQPLTv8ECJLqCGcu
 p+OThngBuGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ1b+cAAKCRDBN2bmhouD
 1znjD/9qFOmwH7EqcgmSmws3GrBG1kNHApje+Hb6f3HSbGA6xwTpY4a5MCKp8puH7byva5VWb8X
 AlcUBNdSw0I05Ht453ijS58bi4em89CRfewtVIfoIANIWx9sBRr22ncb69geC1BBdVM0R7oXWR3
 iqorscnZJLpBdtuHuBIHPy4l4cImbcXQ06T9t9EchU6hygspsy45zPryfElpKZ/J0R/rjR8mu5D
 DFSDkjIJ51nZxjx7flk3q8TMy5P4sURMQMiVJ0UL+vVrxkjfx2hBo+tupoyKBpgi2FDWs8SoE+g
 IlSXK90rzqGgYlVZYH4mv5oUOH85s5+bfaSRZ6zBBb+3K6blJOI7IiuCwZt8wwmI+76F49y5tN4
 TH2s5uTmHLpY+mqd/AWtNl5TekyN5zccQ/7HVDvIGoMo8LWqpYaCb0mfMZwJYMltyIyhvR+5cCx
 aZUHsozwgTf0Nt2LriuKgdgq8QmN9Rlv9O+vtNBJpjHUpUjvJbBsXSx5G5WfgMGNyL2Jxnfirjn
 +O4PeEYzFdBpjOyAl6aNMuGrV/+fKOEOFIvxL4OHTjxbIPWPoY3MM+z8ggX73N5aQKiezJ8kX58
 bnrAk9V5D2bwp3ZOtnsh9lDWR3PQS1axlCHpY1f883pgv7bZjH+JfBLRGZx4i1vzmh1r8GaRA0U
 0EGCaQ+oLJbsryg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

If SCM driver fails the probe, it should not leave global '__scm'
variable assigned, because external users of this driver will assume the
probe finished successfully.  For example TZMEM parts ('__scm->mempool')
are initialized later in the probe, but users of it (__scm_smc_call())
rely on the '__scm' variable.

This fixes theoretical NULL pointer exception, triggered via introducing
probe deferral in SCM driver with call trace:

  qcom_tzmem_alloc+0x70/0x1ac (P)
  qcom_tzmem_alloc+0x64/0x1ac (L)
  qcom_scm_assign_mem+0x78/0x194
  qcom_rmtfs_mem_probe+0x2d4/0x38c
  platform_probe+0x68/0xc8

Fixes: 40289e35ca52 ("firmware: qcom: scm: enable the TZ mem allocator")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I am not really sure if authors wanted the cleanup at this point.

Also, I am not sure about commit introducing it (Fixes tag) thus not
Cc-ing stable.

Changes in v2:
1. Store NULL
---
 drivers/firmware/qcom/qcom_scm.c | 42 +++++++++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 93212c8f20ad65ecc44804b00f4b93e3eaaf8d95..bfb925586e05f7d3fb7f00e3d3d3eae4e35f39c0 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2036,13 +2036,17 @@ static int qcom_scm_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq < 0) {
-		if (irq != -ENXIO)
-			return irq;
+		if (irq != -ENXIO) {
+			ret = irq;
+			goto err;
+		}
 	} else {
 		ret = devm_request_threaded_irq(__scm->dev, irq, NULL, qcom_scm_irq_handler,
 						IRQF_ONESHOT, "qcom-scm", __scm);
-		if (ret < 0)
-			return dev_err_probe(scm->dev, ret, "Failed to request qcom-scm irq\n");
+		if (ret < 0) {
+			dev_err_probe(scm->dev, ret, "Failed to request qcom-scm irq\n");
+			goto err;
+		}
 	}
 
 	__get_convention();
@@ -2061,14 +2065,18 @@ static int qcom_scm_probe(struct platform_device *pdev)
 		qcom_scm_disable_sdi();
 
 	ret = of_reserved_mem_device_init(__scm->dev);
-	if (ret && ret != -ENODEV)
-		return dev_err_probe(__scm->dev, ret,
-				     "Failed to setup the reserved memory region for TZ mem\n");
+	if (ret && ret != -ENODEV) {
+		dev_err_probe(__scm->dev, ret,
+			      "Failed to setup the reserved memory region for TZ mem\n");
+		goto err;
+	}
 
 	ret = qcom_tzmem_enable(__scm->dev);
-	if (ret)
-		return dev_err_probe(__scm->dev, ret,
-				     "Failed to enable the TrustZone memory allocator\n");
+	if (ret) {
+		dev_err_probe(__scm->dev, ret,
+			      "Failed to enable the TrustZone memory allocator\n");
+		goto err;
+	}
 
 	memset(&pool_config, 0, sizeof(pool_config));
 	pool_config.initial_size = 0;
@@ -2076,9 +2084,11 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	pool_config.max_size = SZ_256K;
 
 	__scm->mempool = devm_qcom_tzmem_pool_new(__scm->dev, &pool_config);
-	if (IS_ERR(__scm->mempool))
-		return dev_err_probe(__scm->dev, PTR_ERR(__scm->mempool),
-				     "Failed to create the SCM memory pool\n");
+	if (IS_ERR(__scm->mempool)) {
+		dev_err_probe(__scm->dev, PTR_ERR(__scm->mempool),
+			      "Failed to create the SCM memory pool\n");
+		goto err;
+	}
 
 	/*
 	 * Initialize the QSEECOM interface.
@@ -2094,6 +2104,12 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	WARN(ret < 0, "failed to initialize qseecom: %d\n", ret);
 
 	return 0;
+
+err:
+	/* Paired with smp_load_acquire() in qcom_scm_is_available(). */
+	smp_store_release(&__scm, NULL);
+
+	return ret;
 }
 
 static void qcom_scm_shutdown(struct platform_device *pdev)

-- 
2.43.0


