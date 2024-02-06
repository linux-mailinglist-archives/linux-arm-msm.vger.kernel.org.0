Return-Path: <linux-arm-msm+bounces-9956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6896784B983
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 16:29:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BD772927A9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 15:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF921353FD;
	Tue,  6 Feb 2024 15:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qk9LK/KT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905A0133999
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Feb 2024 15:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707233124; cv=none; b=dXYWg9L5AkegWj7POweii1YP8G7OkKkzEqr1FBqXC1ktc3mDmUu5379zrcjpS7YwyNgvDeaQJ2m+whcsqgmST4rgbOB1nAVMHDEVte1D0DOKohVC6INESXYEIgAPnwRDldAdr7tb6XlytLGEIxlQS0VIh1k2tNZXQ+MUQSLjGTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707233124; c=relaxed/simple;
	bh=Fql+a8tRt2YVJzAnqeHw0bgDB4KVonjRDm2gaC6Sd98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=el8NZPhGVweuqT/+MjbZ209oYLJZYprBoUou34NJBFJvu9L73trc3uD+QyqXuzoCm//qQTN/HBny4hTNhAILjLddXz47E0BJk6YVf9BIffaSHYGcUNTKtdp6Cgm/EZ2+AKgxOulEN4Y0iPwoRiM9Z77AN4uQxG66RRyYUMeff28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qk9LK/KT; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5115fcef9e9so871202e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Feb 2024 07:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707233119; x=1707837919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rlx3QI7AecwFxZsp1g5N7+Cd8M7MGWHOiX8rVVieN2E=;
        b=Qk9LK/KT9dUH5nI26q00JyJLh7df7Soz1AYXxHRYC9HXrdMfz3OAMLlXX9y/EiFS3D
         1MJPnM+aU6WTYdgV8n6jU0iwIS2IaEA8dC6tifDE9/t4e1F7BekO6hCTuCp7aDDRE7/U
         rtXu3SrBjz7izYwQy9CkvTlY7Oq71k6Xm6TRwxPiBZRJzQC5o7yuahNtVK7Notugcsz9
         ZY7WRdOJhkg/n37k8Bh7r3x9aN+6BWV42/1YKztPh8H0shK8Yar5kKt8NMfkbgjl/pvL
         UdfDPTzFvl8qR7iOGOCxX1pMKejVwe1J8WgUFN2uFZepOlJr28amneG5IMrADRGsWahf
         +DzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707233119; x=1707837919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rlx3QI7AecwFxZsp1g5N7+Cd8M7MGWHOiX8rVVieN2E=;
        b=Wmrk7zlk5K00KPr9M2RvLZ0KnRw02ruXC31ubkKw6qW+2rGdDqCDC0MXNqgC98OemG
         aaOHXRQOk6mv3oDc+zgNmfjoHaedDRq4YNS67ii/NvFMFEJjaAx+oP2I34fEf3oXTco8
         5nINIS//cTGIuCO51wfNS7zfP+BKN6scQWsPryHoKakIhwOiclTbZ/C0uEdkRfh2nLFy
         uDntXXalO8psAg3cgsjUy71WL6/gX1kIHSkZgYfdrDsuxFI9bOYJSStSAvcTugJVTQOZ
         vy9l/KVnKxK7cD98psvK5aO65Q2KPn9niOm+QYYATXv8iSr6CEKBIDiSGDPjRZXS1RAn
         EbsA==
X-Gm-Message-State: AOJu0YyGrHk6oRbedxsudeG7CzcQdArDS2NyqhPdEFAUfiK5+hU9AHD5
	YUg91lTqwtT4IDzN0s73pnEbWRrOX3bzUzz+qMtaZ650ZxYOekyROtt0qyDcjFI=
X-Google-Smtp-Source: AGHT+IGtQKSHAtAMzXGsQTqTG12MyyJgH1e+qu8+ezRm45baYhcn6Lu5ec97DJ3V2QQ8qxe+vEy24A==
X-Received: by 2002:a19:6717:0:b0:511:475b:7079 with SMTP id b23-20020a196717000000b00511475b7079mr2002976lfc.43.1707233118853;
        Tue, 06 Feb 2024 07:25:18 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXhNlGnS+6C7zLH8/rit/oBY72xVsWXI0bAMh0MxKGXLs8mhCNOKBg2ds1t4OEocOmaTdT3nFBN1oxenfGrFlaNZbr+tBYYQuL0hRyGRAPkhi9s+U3R0sE2KSdwP39CUdrgatL9rzpjfqWNPRJar3oEa7zPusuvl26g3natw7P7zVTk7gaG1lTSovlLNTDD1BtNUaieHRWOZf4FVuuAoqMboT/bkK4H4rQbF8Eu3b+tOEWxnvshxRDTLBnbFVMwYF2Iew==
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u4-20020a056512128400b005114a6cbc57sm264624lfs.46.2024.02.06.07.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 07:25:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 06 Feb 2024 17:25:13 +0200
Subject: [PATCH 2/4] clk: qcom: dispcc-*: switch to module_platform_driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240206-clk-module-platform-driver-v1-2-db799bd2feeb@linaro.org>
References: <20240206-clk-module-platform-driver-v1-0-db799bd2feeb@linaro.org>
In-Reply-To: <20240206-clk-module-platform-driver-v1-0-db799bd2feeb@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=9703;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Fql+a8tRt2YVJzAnqeHw0bgDB4KVonjRDm2gaC6Sd98=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlwk9ch8K3ciEUWF46a54BO+HAyHPDfwJFYRiIO
 +7W1PJlh4eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZcJPXAAKCRCLPIo+Aiko
 1RqaCACOC/FEL3YlAgQbhVPnQoDu5lz9a7uMnxojHC4YIHFJ1r6K0zp8xRZqyhOztF0+eDqMBAj
 oJhVmJyxRGbAWRLDvWwTU6Qij7KAP1ZCQ5oPV2YNSZkywM0uRg44UGuul+l2KISOlxQly29O4T7
 7vWmU8G+vWEzVLx2mnwCYDWPtmPtheUdnp009c1ZFhm4kzlG6hr1/Gd2pMLNJCKrtA+xd42RpNB
 lLrvoK5QwUZmUU801BQ5ZW/8jXo1BszhG32wqLImr+044kpIs3fbhX853k9jAS7uf1GHhTnmh2v
 EZxd4poEarZwMddzh18rrgwfDVFy2MTFcgnJmthl2ZAdtvq1
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There is no need to register display clock controllers during subsys init
calls. Use module_platform_driver() instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-qcm2290.c  | 12 +-----------
 drivers/clk/qcom/dispcc-sc7180.c   | 12 +-----------
 drivers/clk/qcom/dispcc-sc7280.c   | 12 +-----------
 drivers/clk/qcom/dispcc-sc8280xp.c | 12 +-----------
 drivers/clk/qcom/dispcc-sdm845.c   | 12 +-----------
 drivers/clk/qcom/dispcc-sm6125.c   | 12 +-----------
 drivers/clk/qcom/dispcc-sm6350.c   | 12 +-----------
 drivers/clk/qcom/dispcc-sm6375.c   | 12 +-----------
 drivers/clk/qcom/dispcc-sm8250.c   | 12 +-----------
 drivers/clk/qcom/dispcc-sm8450.c   | 12 +-----------
 drivers/clk/qcom/dispcc-sm8550.c   | 12 +-----------
 drivers/clk/qcom/dispcc-sm8650.c   | 12 +-----------
 12 files changed, 12 insertions(+), 132 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 9206f0eed446..f3ac886d0226 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -539,17 +539,7 @@ static struct platform_driver disp_cc_qcm2290_driver = {
 	},
 };
 
-static int __init disp_cc_qcm2290_init(void)
-{
-	return platform_driver_register(&disp_cc_qcm2290_driver);
-}
-subsys_initcall(disp_cc_qcm2290_init);
-
-static void __exit disp_cc_qcm2290_exit(void)
-{
-	platform_driver_unregister(&disp_cc_qcm2290_driver);
-}
-module_exit(disp_cc_qcm2290_exit);
+module_platform_driver(disp_cc_qcm2290_driver);
 
 MODULE_DESCRIPTION("QTI DISP_CC qcm2290 Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
index 9536bfc72a43..38d7859981c7 100644
--- a/drivers/clk/qcom/dispcc-sc7180.c
+++ b/drivers/clk/qcom/dispcc-sc7180.c
@@ -724,17 +724,7 @@ static struct platform_driver disp_cc_sc7180_driver = {
 	},
 };
 
-static int __init disp_cc_sc7180_init(void)
-{
-	return platform_driver_register(&disp_cc_sc7180_driver);
-}
-subsys_initcall(disp_cc_sc7180_init);
-
-static void __exit disp_cc_sc7180_exit(void)
-{
-	platform_driver_unregister(&disp_cc_sc7180_driver);
-}
-module_exit(disp_cc_sc7180_exit);
+module_platform_driver(disp_cc_sc7180_driver);
 
 MODULE_DESCRIPTION("QTI DISP_CC SC7180 Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/dispcc-sc7280.c b/drivers/clk/qcom/dispcc-sc7280.c
index ad596d567f6a..95d56f49a1de 100644
--- a/drivers/clk/qcom/dispcc-sc7280.c
+++ b/drivers/clk/qcom/dispcc-sc7280.c
@@ -895,17 +895,7 @@ static struct platform_driver disp_cc_sc7280_driver = {
 	},
 };
 
-static int __init disp_cc_sc7280_init(void)
-{
-	return platform_driver_register(&disp_cc_sc7280_driver);
-}
-subsys_initcall(disp_cc_sc7280_init);
-
-static void __exit disp_cc_sc7280_exit(void)
-{
-	platform_driver_unregister(&disp_cc_sc7280_driver);
-}
-module_exit(disp_cc_sc7280_exit);
+module_platform_driver(disp_cc_sc7280_driver);
 
 MODULE_DESCRIPTION("QTI DISP_CC sc7280 Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/dispcc-sc8280xp.c b/drivers/clk/qcom/dispcc-sc8280xp.c
index 30f636b9f0ec..3ebf02d459f4 100644
--- a/drivers/clk/qcom/dispcc-sc8280xp.c
+++ b/drivers/clk/qcom/dispcc-sc8280xp.c
@@ -3202,17 +3202,7 @@ static struct platform_driver disp_cc_sc8280xp_driver = {
 	},
 };
 
-static int __init disp_cc_sc8280xp_init(void)
-{
-	return platform_driver_register(&disp_cc_sc8280xp_driver);
-}
-subsys_initcall(disp_cc_sc8280xp_init);
-
-static void __exit disp_cc_sc8280xp_exit(void)
-{
-	platform_driver_unregister(&disp_cc_sc8280xp_driver);
-}
-module_exit(disp_cc_sc8280xp_exit);
+module_platform_driver(disp_cc_sc8280xp_driver);
 
 MODULE_DESCRIPTION("Qualcomm SC8280XP dispcc driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
index 735adfefc379..501dc29f8054 100644
--- a/drivers/clk/qcom/dispcc-sdm845.c
+++ b/drivers/clk/qcom/dispcc-sdm845.c
@@ -872,17 +872,7 @@ static struct platform_driver disp_cc_sdm845_driver = {
 	},
 };
 
-static int __init disp_cc_sdm845_init(void)
-{
-	return platform_driver_register(&disp_cc_sdm845_driver);
-}
-subsys_initcall(disp_cc_sdm845_init);
-
-static void __exit disp_cc_sdm845_exit(void)
-{
-	platform_driver_unregister(&disp_cc_sdm845_driver);
-}
-module_exit(disp_cc_sdm845_exit);
+module_platform_driver(disp_cc_sdm845_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("QTI DISPCC SDM845 Driver");
diff --git a/drivers/clk/qcom/dispcc-sm6125.c b/drivers/clk/qcom/dispcc-sm6125.c
index 87b27053ddb6..1cc5f220a3c4 100644
--- a/drivers/clk/qcom/dispcc-sm6125.c
+++ b/drivers/clk/qcom/dispcc-sm6125.c
@@ -693,17 +693,7 @@ static struct platform_driver disp_cc_sm6125_driver = {
 	},
 };
 
-static int __init disp_cc_sm6125_init(void)
-{
-	return platform_driver_register(&disp_cc_sm6125_driver);
-}
-subsys_initcall(disp_cc_sm6125_init);
-
-static void __exit disp_cc_sm6125_exit(void)
-{
-	platform_driver_unregister(&disp_cc_sm6125_driver);
-}
-module_exit(disp_cc_sm6125_exit);
+module_platform_driver(disp_cc_sm6125_driver);
 
 MODULE_DESCRIPTION("QTI DISPCC SM6125 Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/dispcc-sm6350.c b/drivers/clk/qcom/dispcc-sm6350.c
index ea6f54ed846e..839435362010 100644
--- a/drivers/clk/qcom/dispcc-sm6350.c
+++ b/drivers/clk/qcom/dispcc-sm6350.c
@@ -781,17 +781,7 @@ static struct platform_driver disp_cc_sm6350_driver = {
 	},
 };
 
-static int __init disp_cc_sm6350_init(void)
-{
-	return platform_driver_register(&disp_cc_sm6350_driver);
-}
-subsys_initcall(disp_cc_sm6350_init);
-
-static void __exit disp_cc_sm6350_exit(void)
-{
-	platform_driver_unregister(&disp_cc_sm6350_driver);
-}
-module_exit(disp_cc_sm6350_exit);
+module_platform_driver(disp_cc_sm6350_driver);
 
 MODULE_DESCRIPTION("QTI DISP_CC SM6350 Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/dispcc-sm6375.c b/drivers/clk/qcom/dispcc-sm6375.c
index caa1b90a5ff2..d81d4e3c0b0d 100644
--- a/drivers/clk/qcom/dispcc-sm6375.c
+++ b/drivers/clk/qcom/dispcc-sm6375.c
@@ -594,17 +594,7 @@ static struct platform_driver disp_cc_sm6375_driver = {
 	},
 };
 
-static int __init disp_cc_sm6375_init(void)
-{
-	return platform_driver_register(&disp_cc_sm6375_driver);
-}
-subsys_initcall(disp_cc_sm6375_init);
-
-static void __exit disp_cc_sm6375_exit(void)
-{
-	platform_driver_unregister(&disp_cc_sm6375_driver);
-}
-module_exit(disp_cc_sm6375_exit);
+module_platform_driver(disp_cc_sm6375_driver);
 
 MODULE_DESCRIPTION("QTI DISPCC SM6375 Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index e17bb8b543b5..9567219ac9b2 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -1383,17 +1383,7 @@ static struct platform_driver disp_cc_sm8250_driver = {
 	},
 };
 
-static int __init disp_cc_sm8250_init(void)
-{
-	return platform_driver_register(&disp_cc_sm8250_driver);
-}
-subsys_initcall(disp_cc_sm8250_init);
-
-static void __exit disp_cc_sm8250_exit(void)
-{
-	platform_driver_unregister(&disp_cc_sm8250_driver);
-}
-module_exit(disp_cc_sm8250_exit);
+module_platform_driver(disp_cc_sm8250_driver);
 
 MODULE_DESCRIPTION("QTI DISPCC SM8250 Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/dispcc-sm8450.c b/drivers/clk/qcom/dispcc-sm8450.c
index 2c4aecd75186..2afa2c9d3c97 100644
--- a/drivers/clk/qcom/dispcc-sm8450.c
+++ b/drivers/clk/qcom/dispcc-sm8450.c
@@ -1815,17 +1815,7 @@ static struct platform_driver disp_cc_sm8450_driver = {
 	},
 };
 
-static int __init disp_cc_sm8450_init(void)
-{
-	return platform_driver_register(&disp_cc_sm8450_driver);
-}
-subsys_initcall(disp_cc_sm8450_init);
-
-static void __exit disp_cc_sm8450_exit(void)
-{
-	platform_driver_unregister(&disp_cc_sm8450_driver);
-}
-module_exit(disp_cc_sm8450_exit);
+module_platform_driver(disp_cc_sm8450_driver);
 
 MODULE_DESCRIPTION("QTI DISPCC SM8450 Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
index f96d8b81fd9a..3a97f7897932 100644
--- a/drivers/clk/qcom/dispcc-sm8550.c
+++ b/drivers/clk/qcom/dispcc-sm8550.c
@@ -1808,17 +1808,7 @@ static struct platform_driver disp_cc_sm8550_driver = {
 	},
 };
 
-static int __init disp_cc_sm8550_init(void)
-{
-	return platform_driver_register(&disp_cc_sm8550_driver);
-}
-subsys_initcall(disp_cc_sm8550_init);
-
-static void __exit disp_cc_sm8550_exit(void)
-{
-	platform_driver_unregister(&disp_cc_sm8550_driver);
-}
-module_exit(disp_cc_sm8550_exit);
+module_platform_driver(disp_cc_sm8550_driver);
 
 MODULE_DESCRIPTION("QTI DISPCC SM8550 Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/dispcc-sm8650.c b/drivers/clk/qcom/dispcc-sm8650.c
index f3b1d9d16bae..4ccee9fabad8 100644
--- a/drivers/clk/qcom/dispcc-sm8650.c
+++ b/drivers/clk/qcom/dispcc-sm8650.c
@@ -1802,17 +1802,7 @@ static struct platform_driver disp_cc_sm8650_driver = {
 	},
 };
 
-static int __init disp_cc_sm8650_init(void)
-{
-	return platform_driver_register(&disp_cc_sm8650_driver);
-}
-subsys_initcall(disp_cc_sm8650_init);
-
-static void __exit disp_cc_sm8650_exit(void)
-{
-	platform_driver_unregister(&disp_cc_sm8650_driver);
-}
-module_exit(disp_cc_sm8650_exit);
+module_platform_driver(video_cc_sm8650_driver);
 
 MODULE_DESCRIPTION("QTI DISPCC SM8650 Driver");
 MODULE_LICENSE("GPL");

-- 
2.39.2


