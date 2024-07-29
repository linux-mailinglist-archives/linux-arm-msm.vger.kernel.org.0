Return-Path: <linux-arm-msm+bounces-27242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF2093F38C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 13:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCD551F221C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 11:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7525145A1F;
	Mon, 29 Jul 2024 11:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zLI4BrKC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E09D14535A
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 11:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722251096; cv=none; b=FS5O1FVFM1NhOsEIfGCQoz01sg3SkgkEZ18F4ocfPghFSA5seuJrBfVvq6MRLNKZKGGE4YhggwxW9w/U9M7CSFxJHMzeUU/9r3w3GQSFqmwPL2YFipiPIrrDkBsLJv78t7HZSZHk2+sg7cm/0D0SRxGJMwBEM3uaqAmT5eBiHKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722251096; c=relaxed/simple;
	bh=wiHorBUhj641Q6oV/qrNPMJIqAneXVethyazgnIjMOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mXuNkGm4HnGpvdRkJycy7H9UCvvWwhz9YrnSi3Z20Bd8b7Hx9kI/fMDZbHLlD8QMibi/QAjRf9XnJbh+dGgzLJZNWwONGtR1jHgNgpgSt5vG1P63VSpwc9xeL6lGWWSyzxmdggnwVJbBmkVEuvqxRPIDELQLvYbHbMRkVyU0RFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zLI4BrKC; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52fc14d6689so3196106e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 04:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722251093; x=1722855893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5b8NfoF5bQE4HsyeOkUu3DqTVC6nI+j7dvweyg98M4=;
        b=zLI4BrKCFFarfrvXkl3+Ppsf2c8cn7tz0s9P5enhITMdxR7xruPwCgo0DhIxnR+64x
         CGmSRmDEN2pMFuA9G4JdjxS1HjLBVIe5dto1K/SOQzFg48QWq4lKdr7iX0MVsTZA7m2A
         BFBsbxBQzXEi4n+2BJjUNVRaycO/jqeMSKdcZanbpJuhD623xSxWyUIocGVBdbDa4m3V
         Vw0GmlXeZIFMXpTfMSkUcjbZYkjZAHjaC5ABvIKAUKtrZL3Rf9iigcLgzc4gfq7N6fvE
         vTxsGltgcDMUyMm9KKoMr8LUpbK1GqN1WlTtxR62FiSwY/z1WF/5X+MoGRmZPtoZmvjW
         uZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722251093; x=1722855893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5b8NfoF5bQE4HsyeOkUu3DqTVC6nI+j7dvweyg98M4=;
        b=Un8IwqMNXc/UrJ6TXkxeS48Gi1BDwsMqZAR33c6cBtPjbhXqdrmZS9nXTD7hIv4MF5
         z97i6oZ7755rMo1cihkn99v7O14qZypyukExfh+OWf3bNpAwWKaLgemCUQSMZ1oAPG1x
         5qWWQM1ittRo03rGSao/bmqZ2+001g/9DKH7x2yzDzgf7ZS0UDba83es6wbhhZPoYORS
         0zgnXYorH//yiwW3ZTFyT1MY7d4Wqm3BJK/DCDcNJckFBrvGyuVqJa5ztfVz5ZDFpCI7
         mcrsqAFyiN/eaPrPML4SqtFMcVcznMTXdIci47RmvKSIVxiZ8jGpiQtotJ09MC+9raq9
         ormg==
X-Gm-Message-State: AOJu0YyfnqoOFjEgL3q6sVTiAkPZQU39OdKTZeVSLijTaYMEaeXtO2+t
	3geRGNg4lzvXi24Erw1IDAjgMIJHP84fbxaqLFyrQ2dlYR8GrBp5IuQ/FUzU/fc=
X-Google-Smtp-Source: AGHT+IEWticA2JgqD+f2b33RyXUiYg6ZvRFfaaln3GF0wuNHAHlR4O+1NJnB3UC+hIDE8TVnZxy9gA==
X-Received: by 2002:a05:6512:2144:b0:52c:e0e1:9ae3 with SMTP id 2adb3069b0e04-5309b2c79fbmr4537532e87.57.1722251093170;
        Mon, 29 Jul 2024 04:04:53 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c09093sm1457806e87.172.2024.07.29.04.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 04:04:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Jul 2024 14:04:46 +0300
Subject: [PATCH 2/4] soc: qcom: smd-rpm: add qcom,smd-rpm compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240729-fix-smd-rpm-v1-2-99a96133cc65@linaro.org>
References: <20240729-fix-smd-rpm-v1-0-99a96133cc65@linaro.org>
In-Reply-To: <20240729-fix-smd-rpm-v1-0-99a96133cc65@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=wiHorBUhj641Q6oV/qrNPMJIqAneXVethyazgnIjMOI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmp3dSOFsAd6tXbImSKU999wihHa4LwRGlIU660
 LJFK58/xdyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZqd3UgAKCRCLPIo+Aiko
 1fmpB/9DTCcps5xKTTsXwvw54SmRRhEkKxdcn4RNE3WTfOPlbKtR0wZ8MqeYJhYWGPIbMF1yNZF
 bMOskjNxQy0qBjD2xVEvL3NJ3akT/XS1eUIhPRxJTspzDpYlj+/+k6VP7n9d89wPDx+iEsf0oIu
 qS7BQR8GTajjTNJWPcm0PY/LZblxpQyCuhkydGxUZjWeGcNJ7S+YImtPF+RpMurQQN38z3ERlp+
 I/2Dk0/vB/pz6Pz/KWF7f493/MEV/GR4xmdD3n3kZ+2dc+f1LHeZnNozKR31P/uKR91/obzsB7J
 3doE+erQmQUNBi5MsmhpiWToZfBTATHZpVZoIa80P7T36W3W
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The device node has the compatible string, so the glink channel name
isn't used for modprobing. Add the qcom,smd-rpm compatible to let the
module be automatically loaded when required.

Fixes: bcabe1e09135 ("soc: qcom: smd-rpm: Match rpmsg channel instead of compatible")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/smd-rpm.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
index b7056aed4c7d..ad12cacf80ce 100644
--- a/drivers/soc/qcom/smd-rpm.c
+++ b/drivers/soc/qcom/smd-rpm.c
@@ -224,12 +224,21 @@ static const struct rpmsg_device_id qcom_smd_rpm_id_table[] = {
 };
 MODULE_DEVICE_TABLE(rpmsg, qcom_smd_rpm_id_table);
 
+static const struct of_device_id smd_rpm_of_match[] = {
+	{ .compatible = "qcom,smd-rpm" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, smd_rpm_of_match);
+
 static struct rpmsg_driver qcom_smd_rpm_driver = {
 	.probe = qcom_smd_rpm_probe,
 	.remove = qcom_smd_rpm_remove,
 	.callback = qcom_smd_rpm_callback,
 	.id_table = qcom_smd_rpm_id_table,
-	.drv.name = "qcom_smd_rpm",
+	.drv = {
+		.name = "qcom_smd_rpm",
+		.of_match_table = smd_rpm_of_match,
+	},
 };
 
 static int __init qcom_smd_rpm_init(void)

-- 
2.39.2


