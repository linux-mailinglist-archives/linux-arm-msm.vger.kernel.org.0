Return-Path: <linux-arm-msm+bounces-15670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D84F18913BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 07:26:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F726B22686
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 06:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF174F5EA;
	Fri, 29 Mar 2024 06:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dZDaci52"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AF747F7D
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 06:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711692951; cv=none; b=hTVquRbQ3wNzM2fdUcbIcEbb9RELXLSFiYr22vtSf0q+e6G3q3PDq/A/4qqQKLNfi4E3i2+FW9Zubuj3NFUHUZfvKA87jMlSkntdvRPiKTAZQd0KZ2GQ0Kuozk1dap90anu1gkUOiBr/qlWr/Djkg9foVSnKswGbIZY6VT25B8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711692951; c=relaxed/simple;
	bh=0M5IsEA87/M+6H7Q4T52Tgd9zM79dBLWPhn+7+zmvE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l0H9e9qXqZnBn7ztaluoioFk0QrdoXKpqHbLUSVcmU5iDK6feEhmDW1Azs6IMYlMvQ8xNeULHnVS7vn/HYSyKQh+Z7YOiO8+nlZ1oB4bViBpEhAwTPAxF04i8qKPak4v1FyKYQOgQmcHA/StnOcb2ab65rSaoUzP7Tl073rUYuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dZDaci52; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d715638540so5079811fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 23:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711692948; x=1712297748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ArcwRWLp0xjA/Ge6AhRm6xs4hW1aHT2VtS2adOBVGyw=;
        b=dZDaci52aRHKtVphaNFWASFBeNPrhALvjW56w6Ztrm4p9KfiVI9nMT7VkxQCbkq6cu
         qby6i/7ZIrakdxZb041csazzj5OHgF74mV91i3BegQDd40hLQ8mjCnXE3NKGjFNGHOCe
         deoQjLnxnHeG6AlbNjk7pecHCWJCkcJgKNHUhT/1ZC8QysngRayYPyJ5S7SRmMtdHocz
         C7eVli/TJj6LjiQDGH+JE1Y/9oDcny+XgNE861LhFAxNUMjQek+ddCdNSNGZiZ1dHHcl
         uYzBnS2uBJ5WioNZ+BnD/GGkpm7VOI8Rc4zBIZFDqhLH3EcyVoVuZNAaOmFrrLpBRU7/
         N5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711692948; x=1712297748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ArcwRWLp0xjA/Ge6AhRm6xs4hW1aHT2VtS2adOBVGyw=;
        b=eHPxtNmi4lDliNKhFWtm+xxlw3k0K25IL82EnPULfl7LssVo5jQxx75oNPLsKuYQJB
         QPYJqv3Em4arzcJcExC1e8SqfeL3Yxz9yezFiliDD6LvJJh/VdKW3wfKzskt1sYHdW8e
         +JOr//3U+KgLNXDAHI+kKvCp21ztF1M5QMzlpAtcRbQXbHCh724w+fcOhM4YjZSSud9z
         12Ul90PwJf8aKs5vMGwJqTDJLtqWko/NwrgZOAwzZAstq/JkpAA3tbEIraiBFxBheo6M
         3XgCpmDkvLz4JOEo1r8gZ5hStjwWOjNjmSwR/4wihjuYjZ8JcOsOUf58LbbvCwMxAiq/
         1LcA==
X-Forwarded-Encrypted: i=1; AJvYcCX+itXT7KcR4Q2+cliKXrNINcgWqcIqtyTAXc0BaKUIAvAMcTvmTIV/oAmHgloRX8l7dU6vU3XehcrsfvBW1LCsvRfgRu3IEcTWfntPCw==
X-Gm-Message-State: AOJu0YyPJ/ExhHFDQqQ+4DxMR74K8fy3Zrkh3FPriDwd/R0bEf0MC/Tu
	k0FkU/VtMXzEm+iu2SWFFk4x1CPt1KH0QImVdJHSy8Ego0xNEEUGWUO3y9iCXjQ=
X-Google-Smtp-Source: AGHT+IFPxMhVDRin9KsPmfVGnbcfLzgCRad8RiNdRq94mejOH/EXlp7OaSE4Mxj+/h8uRN1FvFmCvw==
X-Received: by 2002:a2e:9a9a:0:b0:2d4:4b13:3413 with SMTP id p26-20020a2e9a9a000000b002d44b133413mr636015lji.22.1711692948046;
        Thu, 28 Mar 2024 23:15:48 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k17-20020a05651c0a1100b002d6cdee339csm494539ljq.103.2024.03.28.23.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 23:15:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 08:15:40 +0200
Subject: [PATCH v2 08/11] usb: typec: ucsi_glink: rework quirks
 implementation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-qcom-ucsi-fixes-v2-8-0f5d37ed04db@linaro.org>
References: <20240329-qcom-ucsi-fixes-v2-0-0f5d37ed04db@linaro.org>
In-Reply-To: <20240329-qcom-ucsi-fixes-v2-0-0f5d37ed04db@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1972;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0M5IsEA87/M+6H7Q4T52Tgd9zM79dBLWPhn+7+zmvE4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmBlyMw2Ot5elyAlJ5xQxuw2YguhLBmQHchEdVZ
 FSKyycBCPOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgZcjAAKCRCLPIo+Aiko
 1SH3B/wJ2N0HbhoiUHHI3yxn/WSPtr+jJ0Iuu3dCx+mRQ5FMxLkBtQXOYey/IIVnAuUuo53Myde
 w5gT8ysJTvHIDxI4cPeQsiacAz0wounCHEI890BqOD3yxMW3UWmYb5hljC6LhgnMivLfGsLljib
 vADpk4RJKlLGvGAE1QcRzR9L3oVb5ytdAcsAvhhR8/rXz8vjvS9w5o5vy+wr4Aj7DenWJgtGJar
 NtyZRxTPvukrx9OQAoPI5C5ViEILcEuQ1DB6aTGUCOZMpyB8PL95d6/1cyz5pXzGfv7M+Lei3Q8
 IBpn5AOhAUf0I4GpNjd92gGWzIDXI+p9cXvS8KjQH46+bQJH
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In preparation to adding more quirks, extract quirks to the static
variables and reference them through match->data. Otherwise adding
more quirks will add the table really cumbersome.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 932e7bf69447..d7a18950faab 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -297,12 +297,14 @@ static void pmic_glink_ucsi_destroy(void *data)
 	mutex_unlock(&ucsi->lock);
 }
 
+static unsigned long quirk_sc8180x = UCSI_NO_PARTNER_PDOS;
+
 static const struct of_device_id pmic_glink_ucsi_of_quirks[] = {
-	{ .compatible = "qcom,qcm6490-pmic-glink", .data = (void *)UCSI_NO_PARTNER_PDOS, },
-	{ .compatible = "qcom,sc8180x-pmic-glink", .data = (void *)UCSI_NO_PARTNER_PDOS, },
-	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = (void *)UCSI_NO_PARTNER_PDOS, },
-	{ .compatible = "qcom,sm8350-pmic-glink", .data = (void *)UCSI_NO_PARTNER_PDOS, },
-	{ .compatible = "qcom,sm8550-pmic-glink", .data = (void *)UCSI_NO_PARTNER_PDOS, },
+	{ .compatible = "qcom,qcm6490-pmic-glink", .data = &quirk_sc8180x, },
+	{ .compatible = "qcom,sc8180x-pmic-glink", .data = &quirk_sc8180x, },
+	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = &quirk_sc8180x, },
+	{ .compatible = "qcom,sm8350-pmic-glink", .data = &quirk_sc8180x, },
+	{ .compatible = "qcom,sm8550-pmic-glink", .data = &quirk_sc8180x, },
 	{}
 };
 
@@ -340,7 +342,7 @@ static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
 
 	match = of_match_device(pmic_glink_ucsi_of_quirks, dev->parent);
 	if (match)
-		ucsi->ucsi->quirks = (unsigned long)match->data;
+		ucsi->ucsi->quirks = *(unsigned long *)match->data;
 
 	ucsi_set_drvdata(ucsi->ucsi, ucsi);
 

-- 
2.39.2


