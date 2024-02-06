Return-Path: <linux-arm-msm+bounces-9957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B412084B986
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 16:29:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F4BB1F2623E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 15:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8FAD134737;
	Tue,  6 Feb 2024 15:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="buKwKyat"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87811350FA
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Feb 2024 15:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707233126; cv=none; b=Fybtye7XASw1rvfY0WybkQFpOVBwiafo15GJG/FcE4KFFbeaPCIhuQMHmoxI4I4Zvc5e483KN7QL9x/R7wMzQr+C+dNXDrzqM7xz47SZxUbD61zbiAOvP/kQE/j5FecIinTreZ8iMa2zh70gzhR59SG8+hr5NTQQFVXcjXcGaUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707233126; c=relaxed/simple;
	bh=qh1mmGDPB/lNTNdTCk/MXTX136OI5scb0cvj+QYp8h0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eE3ImDQqCIOQx49UAgl7aL6buadS8fFchASsywXjVpXC9OMVwJv6mYVLTBM+VjW8ULqqGYM6FHduSFrIb4xclkC1YmWWKJwjQwugMsNBr6QXuJNosUtoIZexHGzSJ7iAokuMgxEf1kkMl1s/T5DTeJ/6lxSLZWt39oxECEVqaiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=buKwKyat; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51124d43943so9167617e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Feb 2024 07:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707233119; x=1707837919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7+YVokhD5wVV0qW4lEaps8SH0Q795cXPgXf8g7iQX8=;
        b=buKwKyat+ngFNVKQrhPBO9dbtIE+UZndU/nTEnlRQ6/iXMrnSzlZuXqvrK5fqvXPki
         40cFSWMbbJOhhifBo2si/8Bd263cXaISh1SM/FYmCXiBV94bzJ/+OEIrUGB/fUFHWocn
         kjJNsk8Fxe0rSvmZj4WJLSuPswAwPA9QdgPIvSga3/SGGdGNnoHzoA4Da4ftAl2aepYN
         /hoJAOVsjGdeFLCMJvZFyNiccDK1bJRFOAN1F2lJ1TYUj1gc3ciSlUPzUCklTZsZ55vM
         7mr33uGXEOo7DptvoB0SibKQaj7uct9sNILKpPCWYBoe0ymeFkDTOkqyi3PDRtk1SsPJ
         DDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707233119; x=1707837919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7+YVokhD5wVV0qW4lEaps8SH0Q795cXPgXf8g7iQX8=;
        b=XXCD9FlE1i8BQy2nz8S/D1DSnhlZz2Rs5INQHbcci0D446nO+MKncQSnALRiFKo6Vj
         ygm46KiMW0hbBKhLYeJ9XdejNwkzgRuN6hm7ud5HMIR4NE1MGBpy5uHoQEhqaWBR//Bu
         IOZANOzyXBYKMNpCNoCoC1O4MYz5TzUzJu4RoS9+mJNPhPjnR2cDTdjnMDCtOqIUsdvl
         iPHURpvwTvcegO6VBd7+uWQWtJB8vxyKknmSedLa0hVng+58WwdKCoeqxdV4nScrd0yf
         XCxHnVYtK7NInxN8N7LhGTgVLiwmCiQnOd9Q4+PJ78ZbUKNJWTvCTw4EWWW3CsnomR7J
         WPAg==
X-Gm-Message-State: AOJu0YyYwZK7nz1+u3t1al2ONDnATYzd7Jsgpy+GGUOpGkDA4N+uXvLv
	YrK64TgYWs8Dz7T/bslrb7VTML8TmM0vHHfn3t4MrwU1j9FkP5gEJCezhOqtfGVJ2le2sVtYXco
	i
X-Google-Smtp-Source: AGHT+IEFJLz35xrgc6CB1WI5bxf4XJMOAzl/yvNbUwgyYEqFYnmbrmNoxoyfizhhvKXppj3VzI83kQ==
X-Received: by 2002:a05:6512:2385:b0:511:6256:3b8d with SMTP id c5-20020a056512238500b0051162563b8dmr312140lfv.5.1707233119466;
        Tue, 06 Feb 2024 07:25:19 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWjZkMCe5t8DeBtWZ95TAqs9HjrhaaAvnU2XmrcBfeURLvVKw8rLo/6ExXdqX6bQjKgUiQKpA2/FExl6X2k/c+qKpY1gM2SW/Y4k+b6Bc/t0hVk4LXnnl13h04oO4sxt3D8GMUjRsqFWKh2RcFJTxsmGW/PBn2W3qmjNhleFV2w38rJMI4h1+6BZsEB/VePlhhFq/P6BpfmggtNR211ekLJe23284p/LXTeQiBJLYk5jYy1wF2mTeucSacqs5Yk63I7sA==
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u4-20020a056512128400b005114a6cbc57sm264624lfs.46.2024.02.06.07.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 07:25:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 06 Feb 2024 17:25:14 +0200
Subject: [PATCH 3/4] clk: qcom: gpucc-*: switch to module_platform_driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240206-clk-module-platform-driver-v1-3-db799bd2feeb@linaro.org>
References: <20240206-clk-module-platform-driver-v1-0-db799bd2feeb@linaro.org>
In-Reply-To: <20240206-clk-module-platform-driver-v1-0-db799bd2feeb@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=6407;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=qh1mmGDPB/lNTNdTCk/MXTX136OI5scb0cvj+QYp8h0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlwk9cffHvzbr5UkC8F7eKmrgXwo1KYYyBCICby
 7smFpjbqDWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZcJPXAAKCRCLPIo+Aiko
 1XaGCACJ80IVTc7bpJ5frbKqWvZKazYViCYyTHRZ4xPa6YbhOz8sEhRr8UfJq2f9dM4E3DcbJJE
 5IvCABK8vksU3JdrbGWmOS0NRQ5QHtWr15L8UtDy0jqUeM5xK5/pQ8sJ9CdVpYVranBuloUg0F5
 Lk7jj3qItjKCYPFrgNruo4vTTmRlZUETfKRvCIzsL/NVX7974mh6knTaxWKfdoIVSVvyaH8QBoh
 iodXptdkPh5D6Nx4tjkwtqxW9a+Ek4Kbkuv/SBADyZ7QDNa3IepnvM/lqrbuJf3+YzEtI0xxsTy
 KCYq5IQmKjCWxOICBi6NSZAfKMOnKjrk5poznQar/RyFtxTG
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There is no need to register GPU clock controllers during subsys init
calls. Use module_platform_driver() instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gpucc-sa8775p.c | 12 +-----------
 drivers/clk/qcom/gpucc-sc7180.c  | 12 +-----------
 drivers/clk/qcom/gpucc-sc7280.c  | 12 +-----------
 drivers/clk/qcom/gpucc-sdm845.c  | 12 +-----------
 drivers/clk/qcom/gpucc-sm8150.c  | 12 +-----------
 drivers/clk/qcom/gpucc-sm8250.c  | 12 +-----------
 drivers/clk/qcom/gpucc-sm8350.c  | 12 +-----------
 drivers/clk/qcom/gpucc-sm8550.c  | 12 +-----------
 8 files changed, 8 insertions(+), 88 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sa8775p.c b/drivers/clk/qcom/gpucc-sa8775p.c
index 26ecfa63be19..1167c42da39d 100644
--- a/drivers/clk/qcom/gpucc-sa8775p.c
+++ b/drivers/clk/qcom/gpucc-sa8775p.c
@@ -609,17 +609,7 @@ static struct platform_driver gpu_cc_sa8775p_driver = {
 	},
 };
 
-static int __init gpu_cc_sa8775p_init(void)
-{
-	return platform_driver_register(&gpu_cc_sa8775p_driver);
-}
-subsys_initcall(gpu_cc_sa8775p_init);
-
-static void __exit gpu_cc_sa8775p_exit(void)
-{
-	platform_driver_unregister(&gpu_cc_sa8775p_driver);
-}
-module_exit(gpu_cc_sa8775p_exit);
+module_platform_driver(gpu_cc_sa8775p_driver);
 
 MODULE_DESCRIPTION("SA8775P GPUCC driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gpucc-sc7180.c b/drivers/clk/qcom/gpucc-sc7180.c
index 3f92f0b43be6..66f5b48cbf87 100644
--- a/drivers/clk/qcom/gpucc-sc7180.c
+++ b/drivers/clk/qcom/gpucc-sc7180.c
@@ -252,17 +252,7 @@ static struct platform_driver gpu_cc_sc7180_driver = {
 	},
 };
 
-static int __init gpu_cc_sc7180_init(void)
-{
-	return platform_driver_register(&gpu_cc_sc7180_driver);
-}
-subsys_initcall(gpu_cc_sc7180_init);
-
-static void __exit gpu_cc_sc7180_exit(void)
-{
-	platform_driver_unregister(&gpu_cc_sc7180_driver);
-}
-module_exit(gpu_cc_sc7180_exit);
+module_platform_driver(gpu_cc_sc7180_driver);
 
 MODULE_DESCRIPTION("QTI GPU_CC SC7180 Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/gpucc-sc7280.c b/drivers/clk/qcom/gpucc-sc7280.c
index 1490cd45a654..68a3e007df1f 100644
--- a/drivers/clk/qcom/gpucc-sc7280.c
+++ b/drivers/clk/qcom/gpucc-sc7280.c
@@ -476,17 +476,7 @@ static struct platform_driver gpu_cc_sc7280_driver = {
 	},
 };
 
-static int __init gpu_cc_sc7280_init(void)
-{
-	return platform_driver_register(&gpu_cc_sc7280_driver);
-}
-subsys_initcall(gpu_cc_sc7280_init);
-
-static void __exit gpu_cc_sc7280_exit(void)
-{
-	platform_driver_unregister(&gpu_cc_sc7280_driver);
-}
-module_exit(gpu_cc_sc7280_exit);
+module_platform_driver(gpu_cc_sc7280_driver);
 
 MODULE_DESCRIPTION("QTI GPU_CC SC7280 Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/gpucc-sdm845.c b/drivers/clk/qcom/gpucc-sdm845.c
index 970d7414bdf0..c87c3215dfe3 100644
--- a/drivers/clk/qcom/gpucc-sdm845.c
+++ b/drivers/clk/qcom/gpucc-sdm845.c
@@ -203,17 +203,7 @@ static struct platform_driver gpu_cc_sdm845_driver = {
 	},
 };
 
-static int __init gpu_cc_sdm845_init(void)
-{
-	return platform_driver_register(&gpu_cc_sdm845_driver);
-}
-subsys_initcall(gpu_cc_sdm845_init);
-
-static void __exit gpu_cc_sdm845_exit(void)
-{
-	platform_driver_unregister(&gpu_cc_sdm845_driver);
-}
-module_exit(gpu_cc_sdm845_exit);
+module_platform_driver(gpu_cc_sdm845_driver);
 
 MODULE_DESCRIPTION("QTI GPUCC SDM845 Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/gpucc-sm8150.c b/drivers/clk/qcom/gpucc-sm8150.c
index c89a5b59ddb7..135601629cba 100644
--- a/drivers/clk/qcom/gpucc-sm8150.c
+++ b/drivers/clk/qcom/gpucc-sm8150.c
@@ -315,17 +315,7 @@ static struct platform_driver gpu_cc_sm8150_driver = {
 	},
 };
 
-static int __init gpu_cc_sm8150_init(void)
-{
-	return platform_driver_register(&gpu_cc_sm8150_driver);
-}
-subsys_initcall(gpu_cc_sm8150_init);
-
-static void __exit gpu_cc_sm8150_exit(void)
-{
-	platform_driver_unregister(&gpu_cc_sm8150_driver);
-}
-module_exit(gpu_cc_sm8150_exit);
+module_platform_driver(gpu_cc_sm8150_driver);
 
 MODULE_DESCRIPTION("QTI GPUCC SM8150 Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/gpucc-sm8250.c b/drivers/clk/qcom/gpucc-sm8250.c
index 9c1f8ce32da4..84f7f65c8d42 100644
--- a/drivers/clk/qcom/gpucc-sm8250.c
+++ b/drivers/clk/qcom/gpucc-sm8250.c
@@ -331,17 +331,7 @@ static struct platform_driver gpu_cc_sm8250_driver = {
 	},
 };
 
-static int __init gpu_cc_sm8250_init(void)
-{
-	return platform_driver_register(&gpu_cc_sm8250_driver);
-}
-subsys_initcall(gpu_cc_sm8250_init);
-
-static void __exit gpu_cc_sm8250_exit(void)
-{
-	platform_driver_unregister(&gpu_cc_sm8250_driver);
-}
-module_exit(gpu_cc_sm8250_exit);
+module_platform_driver(gpu_cc_sm8250_driver);
 
 MODULE_DESCRIPTION("QTI GPU_CC SM8250 Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/gpucc-sm8350.c b/drivers/clk/qcom/gpucc-sm8350.c
index 8dc54dff983f..38505d1388b6 100644
--- a/drivers/clk/qcom/gpucc-sm8350.c
+++ b/drivers/clk/qcom/gpucc-sm8350.c
@@ -621,17 +621,7 @@ static struct platform_driver gpu_cc_sm8350_driver = {
 	},
 };
 
-static int __init gpu_cc_sm8350_init(void)
-{
-	return platform_driver_register(&gpu_cc_sm8350_driver);
-}
-subsys_initcall(gpu_cc_sm8350_init);
-
-static void __exit gpu_cc_sm8350_exit(void)
-{
-	platform_driver_unregister(&gpu_cc_sm8350_driver);
-}
-module_exit(gpu_cc_sm8350_exit);
+module_platform_driver(gpu_cc_sm8350_driver);
 
 MODULE_DESCRIPTION("QTI GPU_CC SM8350 Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/gpucc-sm8550.c b/drivers/clk/qcom/gpucc-sm8550.c
index 2fa8673424d7..836cefa8896d 100644
--- a/drivers/clk/qcom/gpucc-sm8550.c
+++ b/drivers/clk/qcom/gpucc-sm8550.c
@@ -594,17 +594,7 @@ static struct platform_driver gpu_cc_sm8550_driver = {
 	},
 };
 
-static int __init gpu_cc_sm8550_init(void)
-{
-	return platform_driver_register(&gpu_cc_sm8550_driver);
-}
-subsys_initcall(gpu_cc_sm8550_init);
-
-static void __exit gpu_cc_sm8550_exit(void)
-{
-	platform_driver_unregister(&gpu_cc_sm8550_driver);
-}
-module_exit(gpu_cc_sm8550_exit);
+module_platform_driver(gpu_cc_sm8550_driver);
 
 MODULE_DESCRIPTION("QTI GPUCC SM8550 Driver");
 MODULE_LICENSE("GPL");

-- 
2.39.2


