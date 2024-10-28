Return-Path: <linux-arm-msm+bounces-36157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 550FA9B2F35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 12:49:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99A6AB2182A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 11:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C070A1D89EF;
	Mon, 28 Oct 2024 11:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ol0mUU0o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CC81D79B3
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 11:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730116168; cv=none; b=QovlXOAUKfgjNoTdtDm8f4GZ4HqoCnr7QHpxKIICOMwN86cbFrN61lpDNdGzcU5q008xLKrTfTdZHqOv44Co/4YnuR3xIGzkxSBud5OwDZ81im5Qc9niFeOX0IIJXwslGYMMgeLhcUGm7zaNPPt4IvNEPBuVOVzTlP3deCtXKyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730116168; c=relaxed/simple;
	bh=dFghqADYMbSL+guev7kK1X/DtcuvYC+qJqgVPidJ+3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=afAG3fcNkpyl1ot/b7mbpZcx2LZy9ywKFHw7KS+/ZLEhweVEYoQ7yr/U3ob9jxGGGGbtnr9GZNwvrN6yExWG0n2FoAHIBJ81C/gK2wIOthq7TY4t3U/CNrjZqBAzlZTX5wJ3xklKLOgNeSiKD+BgLC8TE48fsKVyVqji/5G3/ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ol0mUU0o; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539fe76e802so4912877e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 04:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730116163; x=1730720963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VqmvUC9mUBY81VNYk4RmO3UDZ88zAWNWEvKa6xvfBdA=;
        b=ol0mUU0o4k2Jbf0s3PKgi7YMj15HtJ96HiOtsh+1+gX+zxNmBm1FxtuPT6pXeCTEj3
         Gk+ECIpa3agNtoHzQuZ9/V/yiiEmEXR7jRwfyU/RZor48FSe9VEsQeWbPKY/NCkBtF8P
         1BM0KV947p/8MflfnH2FpKl23OwuMH+6zGRiUvmTjgeqZoecodf7t8F/RQLIxo+OpM5V
         ZXq8wxWHzJyjc2lokO6JRlsA4GbIMQCUC6qSuNS8bJCOmMbSasPB911sJveqUfnaiMod
         vM4uEXDH+YqPxOqNkXhqLDpt5xKFQrFHEfvVHew6UGtQX72wJZ2unOgXN6KYqUmpwOwB
         RD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730116163; x=1730720963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VqmvUC9mUBY81VNYk4RmO3UDZ88zAWNWEvKa6xvfBdA=;
        b=ssuyGqD73IvvCsSWy1UA6LLJ98pv5UH59abpNDX4UwAriQoneFyH9PPAEUUtyJMUf0
         cF8rQ3Rh4W+IBYA/4VYLpU1tcgtdsw/H1f+vfVf9BF1T9IyqiNZkjvGaUSvg9axncz0v
         NKdtKARnMZMGd6AhZ/+XvCSjr7UdAKReC9parOGYxBjqJVxsqR22pP7zxpIlupJOunAn
         V58lekl1CwDBURsH0mweLxxoU1iFE+5ijOzCIO2aZ8huGH9eGfS7lQjHpekY0oVJSwwr
         8X+XKSJ2W4vKIqI9WlC85q92PBqXQYzxbUXHTeoO2WjnJd5oDOQQpHTG69DexjzGzPuv
         Atkg==
X-Gm-Message-State: AOJu0YwFJSbSeyIiJm8gIoWNDIc3PjJtfVOaWwZJ3wntQdiYXOMtzkPB
	J74UufYwgkyacApnp74JN27hFk2PIgNseVDKLETKYNLx0rVtZLqRcEIRX/eSgBo=
X-Google-Smtp-Source: AGHT+IFCBFQVwMmMDF/1rXBfglFe8gtvZb2+qpDl4CdOJk48ndJWKJGzOzxpV5lLnpQrnF8u7NjzQg==
X-Received: by 2002:a05:6512:33cf:b0:52c:df6f:a66 with SMTP id 2adb3069b0e04-53b34b39628mr2359421e87.58.1730116163397;
        Mon, 28 Oct 2024 04:49:23 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10a5c6sm1042385e87.19.2024.10.28.04.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 04:49:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 28 Oct 2024 13:49:16 +0200
Subject: [PATCH 3/3] drm/msm/dp: tidy up platform data names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-msm-dp-rename-v1-3-a2564e9457b0@linaro.org>
References: <20241028-msm-dp-rename-v1-0-a2564e9457b0@linaro.org>
In-Reply-To: <20241028-msm-dp-rename-v1-0-a2564e9457b0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4825;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=dFghqADYMbSL+guev7kK1X/DtcuvYC+qJqgVPidJ+3I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnH3o9hSNwX8nlxeM1HjSFvP+l6UmtoczeT12jJ
 6FQLwOy2U+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZx96PQAKCRCLPIo+Aiko
 1QM4B/sFhh+X0mTw7UUzLwrmpaCbAKOovwQlT2iXbBC25RFr2J2HdUS4qFB5bH3dlirFzXetMdl
 Q/Ax97WUoS8BnwAxlsnPIOZOHMyg3bHs8xRSSKwDt+Cha9xBTXaal6s1xUKGEbvtP28UVF9ybp/
 XAbgxBLtE45NUK0ZEqD5zdbcrsiKWt7i0FVpZwuBalqp5MXmd/2qkWwFxrDcOIctz4LFQTZ6Bhj
 esWjhy/xLLYxzuFk9YY7VoYfFlpf3EYs97SCB6xe+JkQMNw40ZQcQ4rwIqm/qStRiBDuOERjz2u
 7CffZgeS2ZYMq0a0EAm7RhmJdNkpr8CNMliNlWZ/juJkJKc7
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Follow the established symbol name pattern and rename platform data
structures.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 38 ++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5cc349f672c0..aba925aab7ad 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -118,7 +118,7 @@ struct msm_dp_desc {
 	bool wide_bus_supported;
 };
 
-static const struct msm_dp_desc sa8775p_dp_descs[] = {
+static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
 	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
@@ -126,25 +126,25 @@ static const struct msm_dp_desc sa8775p_dp_descs[] = {
 	{}
 };
 
-static const struct msm_dp_desc sc7180_dp_descs[] = {
+static const struct msm_dp_desc msm_dp_desc_sc7180[] = {
 	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{}
 };
 
-static const struct msm_dp_desc sc7280_dp_descs[] = {
+static const struct msm_dp_desc msm_dp_desc_sc7280[] = {
 	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{}
 };
 
-static const struct msm_dp_desc sc8180x_dp_descs[] = {
+static const struct msm_dp_desc msm_dp_desc_sc8180x[] = {
 	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
 	{}
 };
 
-static const struct msm_dp_desc sc8280xp_dp_descs[] = {
+static const struct msm_dp_desc msm_dp_desc_sc8280xp[] = {
 	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
@@ -156,12 +156,12 @@ static const struct msm_dp_desc sc8280xp_dp_descs[] = {
 	{}
 };
 
-static const struct msm_dp_desc sm8650_dp_descs[] = {
+static const struct msm_dp_desc msm_dp_desc_sm8650[] = {
 	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{}
 };
 
-static const struct msm_dp_desc x1e80100_dp_descs[] = {
+static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
 	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
@@ -170,18 +170,18 @@ static const struct msm_dp_desc x1e80100_dp_descs[] = {
 };
 
 static const struct of_device_id msm_dp_dt_match[] = {
-	{ .compatible = "qcom,sa8775p-dp", .data = &sa8775p_dp_descs },
-	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_descs },
-	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_descs },
-	{ .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_descs },
-	{ .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_descs },
-	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_descs },
-	{ .compatible = "qcom,sc8280xp-dp", .data = &sc8280xp_dp_descs },
-	{ .compatible = "qcom,sc8280xp-edp", .data = &sc8280xp_dp_descs },
-	{ .compatible = "qcom,sdm845-dp", .data = &sc7180_dp_descs },
-	{ .compatible = "qcom,sm8350-dp", .data = &sc7180_dp_descs },
-	{ .compatible = "qcom,sm8650-dp", .data = &sm8650_dp_descs },
-	{ .compatible = "qcom,x1e80100-dp", .data = &x1e80100_dp_descs },
+	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
+	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
+	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },
+	{ .compatible = "qcom,sc7280-edp", .data = &msm_dp_desc_sc7280 },
+	{ .compatible = "qcom,sc8180x-dp", .data = &msm_dp_desc_sc8180x },
+	{ .compatible = "qcom,sc8180x-edp", .data = &msm_dp_desc_sc8180x },
+	{ .compatible = "qcom,sc8280xp-dp", .data = &msm_dp_desc_sc8280xp },
+	{ .compatible = "qcom,sc8280xp-edp", .data = &msm_dp_desc_sc8280xp },
+	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sc7180 },
+	{ .compatible = "qcom,sm8350-dp", .data = &msm_dp_desc_sc7180 },
+	{ .compatible = "qcom,sm8650-dp", .data = &msm_dp_desc_sm8650 },
+	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },
 	{}
 };
 

-- 
2.39.5


