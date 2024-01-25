Return-Path: <linux-arm-msm+bounces-8358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B6083D02A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 00:02:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 777E31C21D13
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 23:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5778E125BA;
	Thu, 25 Jan 2024 23:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rGoTcdkM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9523912B60
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 23:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706223762; cv=none; b=PM7MpLdq53iaSYDmo9q8ElgK1vKJNdaOwU9gtW1ZtY0Dlefa5I/1txZZMq90EcV0X+xgje712FFpAR7rzbFPyI4B6PS4tYrDeGmt8e+aid/6X/iGJc3/rp21tBvkvcZ8SAm4wQqeFGCvd0AUgaR7501SmuC4qpq0fzo8ivwvrGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706223762; c=relaxed/simple;
	bh=0tPYPq9OqCyaK2qdciiqePf9VS3u8McIRcRAIy4vqEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XmDSje3xIF5OlRfkDrXKkdIcMtmotJ9EC4H2GOr+smnhWch4wqRbDCnqyc/0OTvtYuGjQta5cvH/DfcYP72+VXxcyE5BCCf9S/UjaT9erCl2+LmlijUOss6dKa67PhQ9r4ucmVrAmMjNV7EVe/XzM7QDjTUkch+D7NWypSsApWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rGoTcdkM; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2cddb0ee311so80141681fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 15:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706223759; x=1706828559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/0vQlu3/zRSTNUc/QWsRNBkw7wsjD404h/u9X2qZl0=;
        b=rGoTcdkMFyTQ8qFgMPJ7JaPhkNa6Jf3nUU57GcTPxfyn0MFaPQTCxVI/ed2UO0gsig
         MEKpwjYP0KkfcpzU0pe8/3xBlmDprUykQ9inBxNeOgb7ZrGYl24VGJJMJG9hTj5DqVKm
         BXlelwEmSzmLuCUCAjsdqxs+3ncMLvRViejoH8Ad/MRvT5GIg1FnTERPdX1mpU5Viozc
         WLdVue+cgJouzCH7AAfPiOxQwUxpvze0YbFYPI5dftEBVe2rTx8TTBO82gEp/+swQqEK
         dtplHwaF6hcBsM13+SECu9kgf1OQCQ2sG2g68SYNX5y5AL5Ds/MKAHosDBCKUVl6XsTb
         AbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706223759; x=1706828559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/0vQlu3/zRSTNUc/QWsRNBkw7wsjD404h/u9X2qZl0=;
        b=Aw4XnDnQRxVgED+JTDMsJDLzP+RyN87wAI2HLQS9I1rLXKLg2nj08sjk0QnuYGjPeW
         ecAh7ZGxTWgyOCDBpxuD6TWaHLcySgBDDzBz/VA63AykscjxdX5g8TkXzPLRHvK4ZKHD
         t5LEe49ZyL8aXqZoqooc9fa4FbfYZvOKoeKuvosMINa5vg0XTs2ZaPsbLnpwkGlswO1G
         WxMmqC9BAGy6tDixrkagGyBwAxuhEvPpu/iftnLqxmYLMvwopcIwpt5KnaPsiRWjvH9v
         Kul95Vkja/s1OCWGIUfmNVmkz7U9Ht1rC4+SXWyl/qpjNPGn4RKfs8At+z0pMJMwball
         JaFA==
X-Gm-Message-State: AOJu0Yz09lENfkTqm/gkL3e/7ggiFhLq0FLymSgl3UAEpE2Th3xf2PKC
	vF3TPFgHx3wzporywW45Iu5Li+TlZh0Hb+V69YwDIg6I1x6XW/6NesJZ32PZt08=
X-Google-Smtp-Source: AGHT+IFmCQ6i0uDhhnc3xOqmapw5U3T/E35MDEyJJumvsB02zEf5PIaMLIeoJt6Zw/EgDqXrw1dDnQ==
X-Received: by 2002:a2e:b5a5:0:b0:2cf:1a77:5c35 with SMTP id f5-20020a2eb5a5000000b002cf1a775c35mr106688ljn.31.1706223758555;
        Thu, 25 Jan 2024 15:02:38 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x19-20020a2e8813000000b002cdfc29b46dsm405872ljh.88.2024.01.25.15.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 15:02:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 01:02:33 +0200
Subject: [PATCH v3 04/15] drm/msm/dp: inline dp_power_(de)init
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-4-e2e46f4d390c@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-e2e46f4d390c@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-e2e46f4d390c@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlsuiHWgQXViiZRP5edLDuCxm4LY7Y510OLaPpc
 IjoFJXqsyiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbLohwAKCRCLPIo+Aiko
 1Qb3B/wOvG7lg14CAtpdP5XCkVtmS67SC6E7qtPuE0617cLjLFsQ/HqieG41K/6zPumu8Tzo8u9
 ARLbFw8Iwhu/VgzKPlbwecrK5bXJimAqKtdDvsPU1tHP0moOSZGV6wRLd+MuFrQPrduloIvddX6
 purGO5/g1r0iHPUa6Jn6s/27Tj8i73cigP2xfpX7BAXQ5Wv6sVkqf7MpnAxko3pXDuR+/MadYOk
 EBqheMuv74hhrYNyCwNPn9zKKVjgsv6cF9kfaVBeHS1Js/RQDWP00r4kFGp638cUU5UEYkqyD/k
 v174iUYgnVAkTa3HPXiRRXTFDSsBgCgq6HU7JqjPfv7f32JL
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


