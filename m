Return-Path: <linux-arm-msm+bounces-9959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DF12E84B9C4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 16:37:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2D64B2608B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 15:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 281F61350F9;
	Tue,  6 Feb 2024 15:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HziLtU4h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5761C1353F6
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Feb 2024 15:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707233132; cv=none; b=hZURwD4pjtEeQ55mo56ApnKco4EoeByI/fArLdK4B54mPE82Ffo/OWri+Ioaz8oBQWj1cuSHh6Sjh36yGdj79vWutdodrRaje1DarDsHIJHKOXPwgixozsX2D4qW/KQhenEts9ycfe3V/unktNwe8fQn4941XOUO2mnWllSsTbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707233132; c=relaxed/simple;
	bh=Y9SBvxL3i8hOtZuvMNwlA9B15SIgezUZD0NJHCCdIRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PMPp+q+8m5Yc3e6vBXfMyRvqRjFLcyCNOnW3ZbwXaz5FmwJEWmS2bN+mPM5OenGBhh8yF+swn4ogf0peHMXVCD2xAr05YiJ/GM1IhoJ368a8hNEDkAiNgWVXGRxqqgAxbYBI4W7vZjGmCZDgbz4CN1tt5hS6FXn19Ub0NJYWWKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HziLtU4h; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-511531f03f6so2159133e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Feb 2024 07:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707233121; x=1707837921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqDk/G5uYV0fUFhAiQ9tKg3kBuNCYQXF8fplVLAiXXU=;
        b=HziLtU4haUgv/7l+Xze58KcNglW5Hckfl2Fz1UFXMAsqkTLOIaz0000PqG2YgUaOsp
         7hXWtc+oH/Knp2tMzujLjZ/UHq24+UZowtPqqdC5LQvTAF/AW6AuWmYjvhO+MfHSxIts
         wD4q+h70QfmkOZ4Xvr4QORZKZBDWtczlZdS8wTZae08/OFIDRW20cjifLtatJcp6ymUG
         Iqe+HChwBVybMseSYIJiguyAwKgvbxvB5STuHHAg4FY+tjJgpHEryMqMMlCkJBUOoFNs
         t+vQS5Mnm8WVVSaTVXIS7AolM9t8o8FxGrjpr+jwevs2ne+EEhS+//dbzWOVTBhWx+ap
         Nz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707233121; x=1707837921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqDk/G5uYV0fUFhAiQ9tKg3kBuNCYQXF8fplVLAiXXU=;
        b=EGbxVa3LWgWoQaRMaOT29O7p84y5WiPTijIKGXduiWP2zof8cpIMyBPrxWepnlr6P9
         dAv12FsfoQwTJs8KpTa8iy+o2l1YkAcsYes+Bi7uOU9JidFdYE+bbqo7gpxJYNeqPFpf
         3W/x2t40rz7Pa72D4YEkLKdfgUneUxhO1f4QmeFKnEXcSJ+CRH+eDHQaqMXUzz3otjqc
         74ZT4j7kMLDErxzm3JNnqgQQ44OZ2jSIqVjVKV91O6YN4JtToYDHEcabzebV4G5Y8VAm
         T+UJj8ByAdbkkjqOa959FwKXNU2OMlUaGuQZaZp/tVdCp7OX2xGv/U11H7j1IWOcopQp
         iPaQ==
X-Gm-Message-State: AOJu0YwUSKhu0tQMU13C3DHe/SqZHv83U9+QG+3Jvp12igp1w0tfYMtR
	2V9oEH4/nNXqYBR8E13b4N7zzSa3kqBVmLujft5owcjioyFA6kMEd7FKRtZlMVs=
X-Google-Smtp-Source: AGHT+IElAGKQHNXsQParHwyLesFBcGk3g+EP3Bx516LC+i9+w8Nf0PmWMeLH+FF6N/P846DpHhTYHQ==
X-Received: by 2002:ac2:5e30:0:b0:511:4520:a308 with SMTP id o16-20020ac25e30000000b005114520a308mr1891956lfg.8.1707233120223;
        Tue, 06 Feb 2024 07:25:20 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUbez7L8Iy6rLRvCshXOUr8QIzdoxYegD3+jEU8/4uooO/dv2L1c+q5Z9DvsjdkOyc1atgv1m5QPnXjpgSh82XGQ7ogucH4BEmoY3wRfizBsWxcSNIjhA03ZsSe4Atbw8IlVyTOHSEt0um0hGW0ZrGa4CH7qnh9V7BWwMA9fVzVpkD5fnLre2ZM1RacUmUix2yZJBwOKuHA8dKLVLiMsskTeWLu7FPzWjBuTbC3zp24zqL631hHF+T9b4vpdqKzQJTy4w==
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u4-20020a056512128400b005114a6cbc57sm264624lfs.46.2024.02.06.07.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 07:25:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 06 Feb 2024 17:25:15 +0200
Subject: [PATCH 4/4] clk: qcom: videocc-*: switch to module_platform_driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240206-clk-module-platform-driver-v1-4-db799bd2feeb@linaro.org>
References: <20240206-clk-module-platform-driver-v1-0-db799bd2feeb@linaro.org>
In-Reply-To: <20240206-clk-module-platform-driver-v1-0-db799bd2feeb@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=5767;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Y9SBvxL3i8hOtZuvMNwlA9B15SIgezUZD0NJHCCdIRE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlwk9daaT3AuMcTPxahElLzNQ5pnMZKqVNWWO11
 ctFlKqdwOuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZcJPXQAKCRCLPIo+Aiko
 1UwpB/9M3b9QGcoDLILOJX53Shj/lSDEiDo8bONwkOKoDWEAQCuDxLBucaa8LP20NOQJh6ZkZBm
 4rc3nplGFk6OLDDhRYKJ2Vebl4uVyoYLFhQ1GqvkSjNEHowVSBSJVsYz4BfAF3p8BmVEg6nXp/l
 USOm4MyILqwhpttG7mg8mAm4+sgMBqBqAho5+w3ppSj9SgPmNMBj7um/AddfAowFGNth0F2lFaT
 B8zZPSGcNSqOvRyOPBn78KNQwQmTM4EMRmfZVVto1uavSyhzLlD8RF79lM0/AtUli1qdmXx4TM6
 ojcRB/cQksCfE5tt7DE55fHcYGQLJCcbvhm8izP2sifoii+c
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There is no need to register video clock controllers during subsys init
calls. Use module_platform_driver() instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/videocc-sc7180.c | 12 +-----------
 drivers/clk/qcom/videocc-sc7280.c | 12 +-----------
 drivers/clk/qcom/videocc-sdm845.c | 12 +-----------
 drivers/clk/qcom/videocc-sm8150.c | 12 +-----------
 drivers/clk/qcom/videocc-sm8250.c | 12 +-----------
 drivers/clk/qcom/videocc-sm8450.c | 12 +-----------
 drivers/clk/qcom/videocc-sm8550.c | 12 +-----------
 7 files changed, 7 insertions(+), 77 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
index 5b9b54f616b8..ae0f812f83e8 100644
--- a/drivers/clk/qcom/videocc-sc7180.c
+++ b/drivers/clk/qcom/videocc-sc7180.c
@@ -237,17 +237,7 @@ static struct platform_driver video_cc_sc7180_driver = {
 	},
 };
 
-static int __init video_cc_sc7180_init(void)
-{
-	return platform_driver_register(&video_cc_sc7180_driver);
-}
-subsys_initcall(video_cc_sc7180_init);
-
-static void __exit video_cc_sc7180_exit(void)
-{
-	platform_driver_unregister(&video_cc_sc7180_driver);
-}
-module_exit(video_cc_sc7180_exit);
+module_platform_driver(video_cc_sc7180_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("QTI VIDEOCC SC7180 Driver");
diff --git a/drivers/clk/qcom/videocc-sc7280.c b/drivers/clk/qcom/videocc-sc7280.c
index 615695d82319..cdd59c6f60df 100644
--- a/drivers/clk/qcom/videocc-sc7280.c
+++ b/drivers/clk/qcom/videocc-sc7280.c
@@ -309,17 +309,7 @@ static struct platform_driver video_cc_sc7280_driver = {
 	},
 };
 
-static int __init video_cc_sc7280_init(void)
-{
-	return platform_driver_register(&video_cc_sc7280_driver);
-}
-subsys_initcall(video_cc_sc7280_init);
-
-static void __exit video_cc_sc7280_exit(void)
-{
-	platform_driver_unregister(&video_cc_sc7280_driver);
-}
-module_exit(video_cc_sc7280_exit);
+module_platform_driver(video_cc_sc7280_driver);
 
 MODULE_DESCRIPTION("QTI VIDEO_CC sc7280 Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/videocc-sdm845.c b/drivers/clk/qcom/videocc-sdm845.c
index c77a4dd5d39c..b7f21ecad961 100644
--- a/drivers/clk/qcom/videocc-sdm845.c
+++ b/drivers/clk/qcom/videocc-sdm845.c
@@ -340,16 +340,6 @@ static struct platform_driver video_cc_sdm845_driver = {
 	},
 };
 
-static int __init video_cc_sdm845_init(void)
-{
-	return platform_driver_register(&video_cc_sdm845_driver);
-}
-subsys_initcall(video_cc_sdm845_init);
-
-static void __exit video_cc_sdm845_exit(void)
-{
-	platform_driver_unregister(&video_cc_sdm845_driver);
-}
-module_exit(video_cc_sdm845_exit);
+module_platform_driver(video_cc_sdm845_driver);
 
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/videocc-sm8150.c b/drivers/clk/qcom/videocc-sm8150.c
index f1456eaa87c4..7640b61563c0 100644
--- a/drivers/clk/qcom/videocc-sm8150.c
+++ b/drivers/clk/qcom/videocc-sm8150.c
@@ -277,17 +277,7 @@ static struct platform_driver video_cc_sm8150_driver = {
 	},
 };
 
-static int __init video_cc_sm8150_init(void)
-{
-	return platform_driver_register(&video_cc_sm8150_driver);
-}
-subsys_initcall(video_cc_sm8150_init);
-
-static void __exit video_cc_sm8150_exit(void)
-{
-	platform_driver_unregister(&video_cc_sm8150_driver);
-}
-module_exit(video_cc_sm8150_exit);
+module_platform_driver(video_cc_sm8150_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("QTI VIDEOCC SM8150 Driver");
diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index ad46c4014a40..6e7a267e7b2c 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -402,17 +402,7 @@ static struct platform_driver video_cc_sm8250_driver = {
 	},
 };
 
-static int __init video_cc_sm8250_init(void)
-{
-	return platform_driver_register(&video_cc_sm8250_driver);
-}
-subsys_initcall(video_cc_sm8250_init);
-
-static void __exit video_cc_sm8250_exit(void)
-{
-	platform_driver_unregister(&video_cc_sm8250_driver);
-}
-module_exit(video_cc_sm8250_exit);
+module_platform_driver(video_cc_sm8250_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("QTI VIDEOCC SM8250 Driver");
diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
index 16a61146e619..bfb6fd47e0ba 100644
--- a/drivers/clk/qcom/videocc-sm8450.c
+++ b/drivers/clk/qcom/videocc-sm8450.c
@@ -448,17 +448,7 @@ static struct platform_driver video_cc_sm8450_driver = {
 	},
 };
 
-static int __init video_cc_sm8450_init(void)
-{
-	return platform_driver_register(&video_cc_sm8450_driver);
-}
-subsys_initcall(video_cc_sm8450_init);
-
-static void __exit video_cc_sm8450_exit(void)
-{
-	platform_driver_unregister(&video_cc_sm8450_driver);
-}
-module_exit(video_cc_sm8450_exit);
+module_platform_driver(video_cc_sm8450_driver);
 
 MODULE_DESCRIPTION("QTI VIDEOCC SM8450 Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
index f3c9dfaee968..bd5dbaf9c64a 100644
--- a/drivers/clk/qcom/videocc-sm8550.c
+++ b/drivers/clk/qcom/videocc-sm8550.c
@@ -453,17 +453,7 @@ static struct platform_driver video_cc_sm8550_driver = {
 	},
 };
 
-static int __init video_cc_sm8550_init(void)
-{
-	return platform_driver_register(&video_cc_sm8550_driver);
-}
-subsys_initcall(video_cc_sm8550_init);
-
-static void __exit video_cc_sm8550_exit(void)
-{
-	platform_driver_unregister(&video_cc_sm8550_driver);
-}
-module_exit(video_cc_sm8550_exit);
+module_platform_driver(video_cc_sm8550_driver);
 
 MODULE_DESCRIPTION("QTI VIDEOCC SM8550 Driver");
 MODULE_LICENSE("GPL");

-- 
2.39.2


