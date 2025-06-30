Return-Path: <linux-arm-msm+bounces-63061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 971A1AEDC68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 14:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC551162655
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 12:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54CBF28A402;
	Mon, 30 Jun 2025 12:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="u2NpsNCI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92D228A1DA
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 12:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751285538; cv=none; b=ZADvZiX44hPjDuNILxbiBhwdj85gqYuhiKFOTOXQGhu8jTNpMbjH2Rzn7HTCFli+fDA8Ec/wujT/CtvZXvR/QYDL4D7R2TqZ71+FpS+gyygJ7ZA1QCUyxtBOLQVGGXaoTLmnHtx5keP2L0Lbum2liS0LsBdaW5D+NSwAMkFYLAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751285538; c=relaxed/simple;
	bh=BKfqqka86bDL0dJyNuOG9LjYml165Lxh5NhMO1RrfhA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sDDHiz01QEnIE/cJNlSMaquVhwanQApmfrvfaIkjXIBkIh1g3TRtTuw545rME4h2ZKHXRupomFX+udKaTn5ZlNXIrj0Nn4Qyhv76zZVn5GlGDXe9/9V0hI28A8WYxf6/4XTJrQa+wcOg0zIoavQykp0zGFlNCFCdtOtx8hCcnxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=u2NpsNCI; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a52874d593so1732409f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 05:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751285535; x=1751890335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QlXPJik67OJ+ji5i52hXuqCUQwHGO8iJergE6aP1vs=;
        b=u2NpsNCIPQa0/7jy5FSxDDbRejKyurQgt0oiypcar3yNiWL5F96Xr6Ak+6kgFecw29
         UIn47MGrLRF9UdsZfLkqUmfcE5XR01pXPbRmQaCMzCoveSTtBWZTA02tUmAWSgHXqyiM
         c913l+sfSDlp3P9StUV1yrpJEvR69SFJrgWl28a6Cnt3mpiOnEIbBRUN9roqgnPOI2Gk
         HGDtgAw99jMXR+GJfA79VlsItADByiaVf5Zin6vSry/jiSipIGwF5N8Ei1nDedL8fRu/
         EmqjRBT40jaYgHroMeWm4H5nFeuI9Qwhh4KwJ+pkpVTzqYwdHpQHD5tfi4WwqmLWB4Ee
         Gfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751285535; x=1751890335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QlXPJik67OJ+ji5i52hXuqCUQwHGO8iJergE6aP1vs=;
        b=w1LCDXCxT/cW5Zet5sgFf1llveGBMY5MXlN4FJ1XSpjIWrTJ3YPoKsm+f64BVPhxhl
         7REQSwdHdqRBi52C52Btj2Ed2lnqYfJQJdGkWAd3tAXxgTLoeUs7lmosO0tPDGDLDRnM
         hGvLJayg+rdwDU68PRS/7Od/GueUjQKiINh6VBW4JBCdukdWIZxqpWVK3xQwCUrEhDAr
         qhM5ytCKrjF0SMyhheekkgMArUakNknpZCNxvkdtxdv4KrsyuEvxvv+leTz7ezJV/fuw
         TBaOa+4fBUwyR+sSZhGpvrIdDfYGPxQxrpLi6rDECCyNN7xU/avDzwmcQ19nPw5w3VYO
         CMRA==
X-Gm-Message-State: AOJu0Yzsida9joZ2/+no/6ZsMppkdtItQMvFFHhqt68ADP5GOz1ADTo5
	W5+6lnDyiMEcY1+MtDtRT8uCelJTpph5kWlSlJxHIPE5Pmg3KP0CBYT7HbjhOx7AMRQ=
X-Gm-Gg: ASbGncvPiyTPtIlQ4Zl0CQHWHn5Z1Lrt4Lj9Whn4aqxwl0XkK1yOdCcMHRwkFatsxg1
	GNiSM8Gx7zfPQpDIIbCTokHBAdqFx/7/uEbuOVcIB4h8tri1nQh219TQJQZUotZzfNh65eosXPI
	AszJG9PpE+clNZn0STJSqAMP5kzXR0sdTm8T0bcc9qpzLNXOitnktH4YN26JGC66nMJ7BfarTMG
	7rqn31dJdlBICL5UYkVXZX5ynD9UjYbeTpcsO1GbMcsGN2iVkkRIGRQrnGpKKse6VgXbPrc7B9z
	HWDxtCbfIjOiSpqIu0W0R3Yay0PZp3L5gCkO1mHwn1CJ4i3w9dezaK9/
X-Google-Smtp-Source: AGHT+IFQXwxIM2HUr1IQmwXbE2oEZjblR7pgcFR+7RdIC1AVXJ7VrKdoozRAzizI1O0LoBUAsA/j2A==
X-Received: by 2002:a5d:584b:0:b0:3a5:3e64:1ac4 with SMTP id ffacd0b85a97d-3a8fee64d08mr12789954f8f.33.1751285534948;
        Mon, 30 Jun 2025 05:12:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:19e3:6e9c:f7cd:ff6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c800eaasm10470472f8f.37.2025.06.30.05.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 05:12:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 30 Jun 2025 14:12:05 +0200
Subject: [PATCH v2 4/4] firmware: qcom: scm: request the waitqueue irq
 *after* initializing SCM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-qcom-scm-race-v2-4-fa3851c98611@linaro.org>
References: <20250630-qcom-scm-race-v2-0-fa3851c98611@linaro.org>
In-Reply-To: <20250630-qcom-scm-race-v2-0-fa3851c98611@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2669;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=PcAqvM6FBpCoLkNCxS4qTB03W5O8x/84hACrv61h9wk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoYn8Yx15pNqlt0atuJpYpP50OvajemYIKa09s+
 ekM0xLA3tyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGJ/GAAKCRARpy6gFHHX
 ch39D/9oDWM+eSjmgaVqiQPFLysRWcTpuyu6+mfAoyuIOI4xMyTNBOVzEH3DBCI1mFYnFA3b+W1
 mzSkILp7RIA/JbCx5b4xhxyxrdELnMDBojM9UWwGlmtcs2o+mV7TskNvGGs+Kyy/0nzHwBxdDzo
 LLhjEQ065UtVT84EyQvnfc3U1rH+r2dvWUCrH36TC9wn4yRykeF4+A0UNBYtK0n3N97dIJxJ4dH
 7aq2N+C+9CB9F9een5g5Ue7bhb5R65xMCT4v0xpkFPK01Wmmsr6AMoDPZ47yTO15u5vcSIHD8eI
 IZs4Q8fAwg3/dKPNAWS7BchTT0KejeRVRtViyBkoqnBwAh+b5DsRYoNkepK8I1FFSs+i6WRkJBs
 XyNbOncDGTYGqqQJNFOmNZjkCGeNetxEywG7N2SjSZkmdAKkoA/cQY/h/ko1fN3eljMGnd7/1vP
 rXTiJ6Mh017fjIICDjhQNr4Rb8NTfzodV04ji8/FCSq8t1rWNJxEKB4CEhFf8nC6dV8gyOZcWrw
 CzlPuZWljCl7vM/Onps19IJugJS7Zmb48M2zo9E7A/MrNWxw/oCYFkgWxnNcYvJCpck5p3+nLX9
 MeibYJ9/VLCOVwQHJwOqZfc0Jdepsc5ya6YsUm522BCdQB5jGbDjTXXNVX83FRNfaeX6690pQxl
 CBsWjW6CY+GT0VQ==
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/firmware/qcom/qcom_scm.c | 36 ++++++++++++++----------------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index b6e0420bb2b72247e4d772b66314d81f336f5d9d..26cd0458aacd67dcd36f065675e969cea97eb465 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2276,29 +2276,27 @@ static int qcom_scm_probe(struct platform_device *pdev)
 		return dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
 				     "Failed to create the SCM memory pool\n");
 
+	irq = platform_get_irq_optional(pdev, 0);
+	if (irq < 0) {
+		if (irq != -ENXIO)
+			return irq;
+	} else {
+		ret = devm_request_threaded_irq(scm->dev, irq, NULL, qcom_scm_irq_handler,
+						IRQF_ONESHOT, "qcom-scm", scm);
+		if (ret < 0)
+			return dev_err_probe(scm->dev, ret,
+					     "Failed to request qcom-scm irq\n");
+	}
+
 	/*
 	 * Paired with smp_load_acquire() in qcom_scm_is_available().
 	 *
 	 * This marks the SCM API as ready to accept user calls and can only
-	 * be called after the TrustZone memory pool is initialized.
+	 * be called after the TrustZone memory pool is initialized and the
+	 * waitqueue interrupt requested.
 	 */
 	smp_store_release(&__scm, scm);
 
-	irq = platform_get_irq_optional(pdev, 0);
-	if (irq < 0) {
-		if (irq != -ENXIO) {
-			ret = irq;
-			goto err;
-		}
-	} else {
-		ret = devm_request_threaded_irq(__scm->dev, irq, NULL, qcom_scm_irq_handler,
-						IRQF_ONESHOT, "qcom-scm", __scm);
-		if (ret < 0) {
-			dev_err_probe(scm->dev, ret, "Failed to request qcom-scm irq\n");
-			goto err;
-		}
-	}
-
 	__get_convention();
 
 	/*
@@ -2328,12 +2326,6 @@ static int qcom_scm_probe(struct platform_device *pdev)
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


