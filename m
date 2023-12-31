Return-Path: <linux-arm-msm+bounces-6154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD05820942
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 01:44:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 203FC2835FF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 00:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A38F10F0;
	Sun, 31 Dec 2023 00:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F5Bcg5Wn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCA1A31
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Dec 2023 00:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50e70b0b869so6192498e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Dec 2023 16:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703983439; x=1704588239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/0vQlu3/zRSTNUc/QWsRNBkw7wsjD404h/u9X2qZl0=;
        b=F5Bcg5WnF6nMa5Bmr2yxYwterq3Aww6cT5RFoTr5tSu5U0Uz+C8WHnMhggBakLG358
         G+qQL9X9OW6khmHVpwY7xPNb7bAf+BvrnbtZg7wshIQ8wcRpLrAnoPY7+DHW+FH5zGlh
         dQ5UY9fBlOM+sZ+11M0fIT0WvOJ2hSsfahiVz7OwT/b+lJexbNKjFkacGRXQXcppYZTu
         ZOD6V8+0rvFEqUDcON755MzEgd5QPb9X1SV9Mrl5DsnbfhbzHy/+JujrUFEW1U3Uwuyx
         jpZKHFBRXQTQynWe3jxogo7ASIC3xSzH+sV31IC2Bi5Ny41pFNmYH3FTk3IdeRABdCIk
         aIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983439; x=1704588239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/0vQlu3/zRSTNUc/QWsRNBkw7wsjD404h/u9X2qZl0=;
        b=AxGYVePVJcMsBOt/5chGySkPwqyUyc0dtdRg4maN/L7qnnGPZNN0VQLb3nPWlSz/zV
         n2bwrJju5boIfs1p3dk6W4o+ZmwZWEllghxKZtWvLkUaJLBF2YQjAOzNQBn6NOoOjIdN
         B7YMZ8iiWRT0X1eOeWZMzQTVQaJYztL993PzwCiyTpUZr4xzSyKZh7GZLH5BFcKVETXA
         1Oupg8Z92rEtc4jpZ5gvPDrL2fUmoEfy6q3gGFbXYk/XKLPzT/PUBIO0bjshtdmGx0Pf
         oWmyDvBxiksCizlzcT2BkOgse2JI9pOZQ5TY5ouRLMGtaqEQtIP/RXmQ0hb/qRKR31hT
         /s3A==
X-Gm-Message-State: AOJu0YwVf/t4Hy4epCGhNmpZdoVb0qDP1QieHx5s1RbMJVMzleVVQUd/
	lgJXb4jWckdZiwg9kAPQ9/+535naNFYly65a12LbjV16RnDX9w==
X-Google-Smtp-Source: AGHT+IEoyXx61x3+MguUboypWgx0K/Gx6rd7o3hHzROIyVLOr3aJhUpVy6la2L/HMi2ho2EfeqKlwQ==
X-Received: by 2002:ac2:4350:0:b0:50e:7f5e:24ac with SMTP id o16-20020ac24350000000b0050e7f5e24acmr3114902lfl.0.1703983439511;
        Sat, 30 Dec 2023 16:43:59 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n13-20020a05651203ed00b0050e84be8127sm1295995lfq.101.2023.12.30.16.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:43:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Dec 2023 02:43:51 +0200
Subject: [PATCH v2 04/15] drm/msm/dp: inline dp_power_(de)init
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231231-dp-power-parser-cleanup-v2-4-fc3e902a6f5b@linaro.org>
References: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
In-Reply-To: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2942;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0tPYPq9OqCyaK2qdciiqePf9VS3u8McIRcRAIy4vqEY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlkLlJ2ZPFfupZiPqo8YG7EvZ0wKX1rP2V88/pF
 PtnI/yKXByJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZC5SQAKCRCLPIo+Aiko
 1d+JB/9IA31potJBGv1YIX+5583YFgZ/0CkpvfUD7xcDfFN2l+wTelr5+rYEHo0nlmZ2QXwAZQw
 Npr5xIAelyEYrBLOZESwNlhbjVs3i7cyF2XjCx2NgcEOp80ify0G5Iy7aj+oSsuwBdSGndJADX0
 vOVttfATA53O6PnEcIure4bdPg22urOYUkDpkYPTYC94Ut834MnF1My5YvThanS3CVOH/B4Nnc3
 d2oR5M0RPGPUCUhiThF0FmsO2kkUDCXok/PUBV5caR6z8bBV74OQSvP2X7o7HWFiWxJVgOrsDk/
 fJR8MOO7fVL2Sa877BkPq2Hjt9dgrJnoeL2/HUSoqu++DFEs
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In preparation to cleanup of the dp_power module, inline dp_power_init()
and dp_power_deinit() functions, which are now just turning the clocks
on and off.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  4 ++--
 drivers/gpu/drm/msm/dp/dp_power.c   | 10 ----------
 drivers/gpu/drm/msm/dp/dp_power.h   | 21 ---------------------
 3 files changed, 2 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 67b48f0a6c83..8cd18705740f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -434,7 +434,7 @@ static void dp_display_host_init(struct dp_display_private *dp)
 		dp->dp_display.connector_type, dp->core_initialized,
 		dp->phy_initialized);
 
-	dp_power_init(dp->power);
+	dp_power_clk_enable(dp->power, DP_CORE_PM, true);
 	dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
 	dp_aux_init(dp->aux);
 	dp->core_initialized = true;
@@ -448,7 +448,7 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
 
 	dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
 	dp_aux_deinit(dp->aux);
-	dp_power_deinit(dp->power);
+	dp_power_clk_enable(dp->power, DP_CORE_PM, false);
 	dp->core_initialized = false;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index b095a5b47c8b..f49e3aede308 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -152,16 +152,6 @@ int dp_power_client_init(struct dp_power *dp_power)
 	return dp_power_clk_init(power);
 }
 
-int dp_power_init(struct dp_power *dp_power)
-{
-	return dp_power_clk_enable(dp_power, DP_CORE_PM, true);
-}
-
-int dp_power_deinit(struct dp_power *dp_power)
-{
-	return dp_power_clk_enable(dp_power, DP_CORE_PM, false);
-}
-
 struct dp_power *dp_power_get(struct device *dev, struct dp_parser *parser)
 {
 	struct dp_power_private *power;
diff --git a/drivers/gpu/drm/msm/dp/dp_power.h b/drivers/gpu/drm/msm/dp/dp_power.h
index 55ada51edb57..eb836b5aa24a 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.h
+++ b/drivers/gpu/drm/msm/dp/dp_power.h
@@ -22,27 +22,6 @@ struct dp_power {
 	bool stream_clks_on;
 };
 
-/**
- * dp_power_init() - enable power supplies for display controller
- *
- * @power: instance of power module
- * return: 0 if success or error if failure.
- *
- * This API will turn on the regulators and configures gpio's
- * aux/hpd.
- */
-int dp_power_init(struct dp_power *power);
-
-/**
- * dp_power_deinit() - turn off regulators and gpios.
- *
- * @power: instance of power module
- * return: 0 for success
- *
- * This API turns off power and regulators.
- */
-int dp_power_deinit(struct dp_power *power);
-
 /**
  * dp_power_clk_status() - display controller clocks status
  *

-- 
2.39.2


