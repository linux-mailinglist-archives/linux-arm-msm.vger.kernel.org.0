Return-Path: <linux-arm-msm+bounces-8464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC58883E141
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 19:26:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1A421C2187F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 18:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3417820DC1;
	Fri, 26 Jan 2024 18:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jDKe2ZOG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9AD20B35
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 18:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706293593; cv=none; b=u+GE+Aj8NmezMkJpdBagvEyZ5w4kICM/mxOs8rzPUmTHu4dwFXZFYIQiX5FcnA8U3EDE5+jeKLklOfpRChKlTBdsW0Lk/QgLoTkkgL6fpvvvj2bHNoIKa8OSMukPcg6IReEGzMXPrzz/XW16yLGrKVUnQTD+fp25WUzYoI87t30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706293593; c=relaxed/simple;
	bh=0tPYPq9OqCyaK2qdciiqePf9VS3u8McIRcRAIy4vqEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=anj8fJiGULGXMMmYN2WdzSRX7IL+H76mQv4BMw/z8bqXwednkQrU8M05GLA/YptOS0G9oJDtXHjwWDnpKTZlOcYuNW84+bg8jOHYpY9/kMIwDKxrKjzBtPpmqPOpxuUJLgPqiT6YL5swSwQJYkvL8w7OIUPl+Xm6NDUlslB/3xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jDKe2ZOG; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2cf3a095ba6so7706931fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 10:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706293589; x=1706898389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/0vQlu3/zRSTNUc/QWsRNBkw7wsjD404h/u9X2qZl0=;
        b=jDKe2ZOGGgrh5n1nxGBZ4jWy/k3CVFuDtvJHhFdkRgC/R4ilziG6YZbMU/BiP7uaSt
         5e0LOr5qMWP3qN7sRY2hiN2u8d+Bhw5KPQ79pGPre1SBf+G6h/9XrwYf/w4301vog0Q5
         pBVDVrW2pcjckChK8zjffcZgyX4CPbmdaz3lAkqyyR8sSMcWR/ep6R7tWtaABGWZr8wY
         bjvT/qDQiI/cvojRrbO5HPGT1pLNIDWydWcK/vHARGNCA4lKmK4wSXv8bfLI1DcBRLis
         m19S3XocGNE6AgaTLc+iJXIn7dguonREk6MU8DGzfnZAz3O4WpCz3RZ5UYV72enb53+N
         swIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706293589; x=1706898389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/0vQlu3/zRSTNUc/QWsRNBkw7wsjD404h/u9X2qZl0=;
        b=pg3HTRLc8QOVKES0pBhio5WG7inG9M4MzMivQQqp7VISayNZpAil56k2HSb7E1w8cY
         U72kG5yJ11rXcgqdGpVYTIi6zCjDwpCf4Ujgwl7BKykmGrTiG+UJviaZMbTfllP4qvfh
         7BkunYI1wMXy8MnRlDvaJ/oMT06JZCMysj6s/nnrB4llRLQrvyPeb4hO3NVXeIufmmRr
         Dez5FrHt4X42iW3jMd+mFAUXBKNHZBMx3E5QUspfEpDPYM+2NTkyDAXDHnfg5m6LPpgx
         +WySabB6bdCsCkQXTCAfXChE5fF+oZT9Kd4ceBclmFcF4uIWOjzpkt8uTA1dKA/M3Gt/
         M6Vg==
X-Gm-Message-State: AOJu0Yw+KTGSxJc4uRPIYmlmnOEw8pON5Z/fV7ZdVaFE/IqKUh3fDgpY
	VepcUejRLYsFmrmmyKJbK3HSblA4dQ62bI8QDk8ZsPiLClsuN7MtXV1pCsj1vyw=
X-Google-Smtp-Source: AGHT+IEPWX4Lz/H8/swWBAYAe0lk0wFuw6fBf2Hq+dQ3GRoiOiWAbkzoaY14FLVp7ZZ4TdxycFKtCg==
X-Received: by 2002:a2e:968f:0:b0:2cc:7df7:3649 with SMTP id q15-20020a2e968f000000b002cc7df73649mr130496lji.46.1706293589259;
        Fri, 26 Jan 2024 10:26:29 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l25-20020a2e8699000000b002cf30f27698sm232218lji.91.2024.01.26.10.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 10:26:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 20:26:23 +0200
Subject: [PATCH RESEND v3 04/15] drm/msm/dp: inline dp_power_(de)init
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-4-098d5f581dd3@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBls/lQIsAfKH/xrlU4ikbYWUv98SABGowk2KICx
 AtJJlyd9u+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbP5UAAKCRCLPIo+Aiko
 1Y25B/0TS/+5IJDY+MyW4gxKAkONHP+wLqnydxN+t6oMIT3SGOSLBWZRPUyUT3guCuXXTuM+i0D
 fRsL7UlkNZRFJ0/hlZwVwFsx+nwTDKF4yDG2YrQOCuFRQ5fDK44KGnf1ts0JZ8n36YWuwOd2dqs
 jm5djOU2r+DqjqeNmj2UYRfp/mJOTPIJPcMP4SFfGMoXayvr0QHOsQy/ipqcMqXFyfJuc1o9VUJ
 SWuD428c2AXwSXe5eKv+hvuLqF1Bll3PLkpk7YZW84RNYcAokT9FJAuiEj4EPBRpB0O/Jf4bFUi
 95pGM6M6Qljuffld8cPsSIyUKeXC7EtP+8/MhZ/1i09aUJ9h
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


