Return-Path: <linux-arm-msm+bounces-62295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCB7AE79B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 10:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBDCA179302
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 08:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47042215F48;
	Wed, 25 Jun 2025 08:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ps44ne/N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8AB20C476
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 08:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750839297; cv=none; b=HVZtTDQuO6ffxX7l+PlJcYoRozlO5KNmTd+ewRkNOKB4v3M02iM2mTdQXivvePC6eFbDwxntNTP+9QVzDEl3y3FB2rskQ9iPX4JKC/bqnJ+qJtOir3CASbJQuJ/HgC+zkN+9wnXy/QT3bahVoGYPMz6hWIX8XwsxzgmfsfzUsvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750839297; c=relaxed/simple;
	bh=8Umv0GICVXLT9H7bfDDY+Zf8OCwlXg77+esz+ITnPB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IlCfDud6qtKDW1a06bj7jUJzPhzUSZBdF66vdCuvGNAF8f8/VIyl5EDsWQFTNPj7jo4//IY7YpXV/IbNuoqW+ng5xIBjckn7afCer6dTY5RZrO/96+duqJLGdaLSp/L+sErGfdqRLcbUQ/yYMkaDZZXA5HMXxoFa66FapbvCAqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ps44ne/N; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-453634d8609so9593335e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 01:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750839294; x=1751444094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8QBVgDcPo7Z/gjm/L/DW/jQw9Dpe2glH8p+7yq9P44M=;
        b=ps44ne/NFBudVyg+4FwpemdAbjtx8atXI1gTWjXwncpbIG5gAhi0oq7LOVw9RDCK0i
         xaegC3yURsxuriI4Jc2bXQN1AZ1kxYIWYWMftL/gdEHI35jpzw3nUUtukW8bKQzMXA5x
         BiUXNE6eOOeLIHn+nhyKUPOjegHgVG05hcfmbIgF1RCh7ITQNDtAcNCbD/2KiJVN9esX
         UBMKNMXd7mBF7xOFZbS+Ym9S38ylB/VshOgK3jF/FecrooINwR7jORyiIC9/YfCRKhOa
         1dO9f3ob3Q1Nd/1/JhRbCiPSHrNrtzEWIx5mxF3eWsl/VhUEcS3UCQue27VM9orjDsOB
         A9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750839294; x=1751444094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8QBVgDcPo7Z/gjm/L/DW/jQw9Dpe2glH8p+7yq9P44M=;
        b=GFDbF/usoA8giQb0dbEImgW5sNIfmc/LBJiwKmdSPTd1n0p+D1dyBck6m361myzGWj
         q6KbapQTI+dMgVzxUvIE8uzOXVdPdv1qDfX2000yRItFgWQ60KWSDvzM7BwObIv2bfMB
         yfyTJj4ox9EZY0LJjXqgxpORRIW6pd8KqzX3W50Xn+plgGz98bvy+cImME+bS9BsYogv
         vSZBFWFmR9TASmiz6zwyarEJs35SIMac5BEAoZSXSpdrzjIUhXxnexDnwexYLrvPRVR6
         A+AGRvcXMPqGroGPAM4fOsXu+jsSft+J2ARZD9HxoA4fgsogV7J+jTnwm33UDoFfckr8
         nDlw==
X-Gm-Message-State: AOJu0Yz1sVc4VXqEaeCWCVQPpJXkvOkE0f7A0pyi6Nf/a68CusNX4EYB
	QpQwU/bcfNIshZMuyIsNW9eMXSU6lmOcwNgJE1xoVWfWIKB3nMhhDMl9NUjy36BMwGY=
X-Gm-Gg: ASbGncuDxJ3vCjwpRWkC/SXIaXTsEQCCsK5EQvjUG+NHeGDbi4iuy/0JOb2gF2vtrGA
	23EPdFAT+UiK9iOJn43aDFaQqry9TuBI1ED9zMXAD/hWhKmSN/6o0a8COZNKCjPuabExHBklk6h
	iJMXxj00WChzX9QtMw0eIXsDbwen9YoQ2A+Rh4QpNnB6a3sMldbXpLwLbEbrEM7IAhxg3W90i8F
	vszKnJdp1MNfsH+G0gIVVlvUtqW0ThHBc8yL9xn4PmJ4SPi2qnBuXmpZQGFq9VPipYfZBLb3dpT
	eZ7imwm9RsN9JtyuE6BAtp5fgL0E9SKc+NjXuZeq1CzZqF+jRYg3Effm8kqHFlDu5is=
X-Google-Smtp-Source: AGHT+IFNgNiG2Ztw/oR7f4JDlp7GiPOsr16RydSMGAZUirG7y0HR7D5ZVuTS9kBzTaf7W/kXpN6jGg==
X-Received: by 2002:a05:600c:4fd2:b0:442:f4a3:b5f2 with SMTP id 5b1f17b1804b1-45381ab4403mr16170345e9.6.1750839293752;
        Wed, 25 Jun 2025 01:14:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45380705351sm20215035e9.0.2025.06.25.01.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 01:14:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 10:14:51 +0200
Subject: [PATCH 4/4] firmware: qcom: scm: request the waitqueue irq *after*
 initializing SCM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-qcom-scm-race-v1-4-45601e1f248b@linaro.org>
References: <20250625-qcom-scm-race-v1-0-45601e1f248b@linaro.org>
In-Reply-To: <20250625-qcom-scm-race-v1-0-45601e1f248b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2364;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=WAejpHm2zxrZJBXpdQ3X3+gbcsisAGeTsZWllPcnvVk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW6/5L3o/CKqhgpj7XEAIb423ovwfa9zx4oBik
 ku6GviTFXCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFuv+QAKCRARpy6gFHHX
 ckV/D/0cIBqLLdI1q+I7qwkYxogp1KdGIJY8gdysCR1uTWvOZ7CVXIqsoEQULeexm2qONp1wb9n
 jFKoX7cnQc3L1KGcunsyqnTCCraR0HV85ljXYUhBQxRjaOW66XsCnO6T6ubvXoGmUCXJ/cMfaZm
 7CvzczqJl8lv9+1yCtrBIeODyejwx3ttyT1vvCRzhc07EKXzw/PPgsCkX1HiJd+AKdpI4FBiqaa
 A84yon0MDiw4pvXaIVtvWz8IX/tOYO0AhMWlnMb92mK32q44VwaydO+PQ1gTfyJ7o4uzmyTA02w
 TF6WzdZ1+jmZagTrzIfxKXL4phwQJw5Zx1c4eyQ80gEyqyE+uKb1tCH/HMEzUZH7mXqTG6L1tt2
 mur47bnJPalaPGQf3M6p7Hym1LlN515Xf4/9xOV4+W811i78cIKyIRuVAxhxCUxPUnk9rUms5Um
 LJh0Dvm3X+hEbizB2XYB0MlPgKa4ALZ+UbKfPwhY22CAQcWixqbAuv3l1Am2qwXxMmTGNAP/xFj
 nB5cPJTQH1s9TVhLukcT904s3FVrHQ96dRNGYgi0kmQ2WRArljdMwaVNxcdzVFop9VDRqj7Mqx7
 B4Mzdj0tAUEYs6DjhhC2TB5lQ1F/mQG4mjZ4q7yeC7JRZ8hi3yvq579YLqic0gxoNdbcOgrqNQU
 a6YDSNp7TrBv3Ew==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's a subtle race in the SCM driver: we assign the __scm pointer
before requesting the waitqueue interrupt. Assigning __scm marks the SCM
API as ready to accept calls. It's possible that a user makes a call
right after we set __scm and the firmware raises an interrupt before the
driver's ready to service it. Move the __scm assignment after we request
the interrupt.

This has the added benefit of allowing us to drop the goto label.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/firmware/qcom/qcom_scm.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 561d4db7a847419fe5f9f034b09554de6a16a161..3d1532b9a5b4183f091b94b9f61395e661a50e2c 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2270,24 +2270,21 @@ static int qcom_scm_probe(struct platform_device *pdev)
 		return dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
 				     "Failed to create the SCM memory pool\n");
 
-	/* Paired with smp_load_acquire() in qcom_scm_is_available(). */
-	smp_store_release(&__scm, scm);
-
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq < 0) {
-		if (irq != -ENXIO) {
-			ret = irq;
-			goto err;
-		}
+		if (irq != -ENXIO)
+			return irq;
 	} else {
-		ret = devm_request_threaded_irq(__scm->dev, irq, NULL, qcom_scm_irq_handler,
-						IRQF_ONESHOT, "qcom-scm", __scm);
-		if (ret < 0) {
-			dev_err_probe(scm->dev, ret, "Failed to request qcom-scm irq\n");
-			goto err;
-		}
+		ret = devm_request_threaded_irq(scm->dev, irq, NULL, qcom_scm_irq_handler,
+						IRQF_ONESHOT, "qcom-scm", scm);
+		if (ret < 0)
+			return dev_err_probe(scm->dev, ret,
+					     "Failed to request qcom-scm irq\n");
 	}
 
+	/* Paired with smp_load_acquire() in qcom_scm_is_available(). */
+	smp_store_release(&__scm, scm);
+
 	__get_convention();
 
 	/*
@@ -2317,12 +2314,6 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	WARN(ret < 0, "failed to initialize qseecom: %d\n", ret);
 
 	return 0;
-
-err:
-	/* Paired with smp_load_acquire() in qcom_scm_is_available(). */
-	smp_store_release(&__scm, NULL);
-
-	return ret;
 }
 
 static void qcom_scm_shutdown(struct platform_device *pdev)

-- 
2.48.1


