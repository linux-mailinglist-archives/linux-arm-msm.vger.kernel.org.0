Return-Path: <linux-arm-msm+bounces-61028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 87349AD64FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 03:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2DDD07AC9A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 01:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03137082F;
	Thu, 12 Jun 2025 01:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FVunQLJa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D004F135A53
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 01:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749690946; cv=none; b=Gwf4gXlY/eOXny18bPVvDWXv5ZbHNVCylX+XRNfcWTsgezx/yJyR1gT4zD8F09lhG1q9MDmD3sKt7ipzApTZ+HHduZ6eqRLtDYaZSYUDQ1b9Cr+lXgqzHD8bNK2P79QOzttBfydig4+DVyz3+bN06tJgf0EVXwvtc/2JL7wryRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749690946; c=relaxed/simple;
	bh=IMi0ADJmNFhdUTuPsCvNz20Avnzqg/FLQjL/Lp+bix4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EmFLcZ1ym9h9VDr6uD7u72iRLDTvHbZc2LWsewpmA7vDutwfPzOK9fG4tDf2NjkmFtdsOSxQ1MVVM8VpJt774e2PYuaelSFu8pFTSUHT9agbJqUweTsjX7XxJhzpLlEFDCjicY3n0JxSfZaj7HEX5wDfM4tzNG8NDKxevUz+PxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FVunQLJa; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32a8abb1613so569281fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 18:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749690943; x=1750295743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+gi7OuH3v0fsslSod+wg7r1kDbClC/Q60uMP2imoSx0=;
        b=FVunQLJatUJOXwrKVTGxyqcSh6CqF2Xylkz0r4H1Yh7RrmG08sfTdH4u/g17hN0RDz
         hUNCgEGlHTSTLslibbSOEH7wsE9Y7bYpIDMdYfcPKp3OMyI0Uvq692z2Okoem72ALFmj
         XjchoJehTtXHBD9AMH0DQE1mMReCwrqeK4UnzT/mRz8NSNV0AGLxAHQr4epmQ92HILV4
         3WEkxJudF/LLLwUhp1rcSNGWM6OoflunRXLSxUFyZDkj+oa4fj1teybLgWWkUexFIolo
         G8yuOZdV23GzjJQzqd5pdSJDSNVos9xlL4bOgLMr/WklERgNjGCcgL2Jsb0H4wbCz/rm
         vEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749690943; x=1750295743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+gi7OuH3v0fsslSod+wg7r1kDbClC/Q60uMP2imoSx0=;
        b=l767ZqR4GQcREVeLLaW0frzOfvmrSL/Rj2R7JO+D8L622sQgcgC6E9JNO4kPUkeaaX
         WD6g+Hyca5TYHdLJsbFfwnE70cXmJnu0pKzp+PjjeSvWS+xAQ2v0vm5A9EA7MhfYTgWY
         cnXZVUpfSv9I1/DUSMeccWHzkzdfrK52U2Hs5lJedWUArXGoPV0lmHYrtYvM4tbMBHQ5
         6yK8ekWt+1ZahRWqsT9tahOVfDkZOfbPjBKOIPlOAKd55n+DSXb0JrI+MiaMIg5Js/IM
         EXmFQFcVbbK5goRP9TPO8HKAJsXQTN5/Ot3im+FuM23QJHvNEMBQwh3tk5fWD7dunDLm
         Q3Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWzQx/9vgGGhBAqmTmqZ09T7+pPYKDwjrCnkXHRLyLZN89PfeaNMEn0HeRBv88lVoryr71wbFfQKYmXrCz7@vger.kernel.org
X-Gm-Message-State: AOJu0YyfjezbC7C45aIQC5vTxK6rIkHBYBo0MLPZEKC5SikbEXyPX+DG
	Cpjw4pPjiX4TajF/YbTIdbwN3dp4NjGXUbpjWobFqyII6q5/9tMtCu3Sywuxrc3/vmQ=
X-Gm-Gg: ASbGncvDTMIGAILx3zRhjKRLfJ8RwHj4wix6uUYO6pXYMdiX7vQb1iXhMC1vW4e2DrB
	8UnNG74Sbc3ZRnZUYOOCjRhMcc1O7d5QZTAkkssZyW4Lmxkp3pD6a9fTk1WSQ2rJnIYPZ0nJ8sh
	/zAsnfFPlsI8ETzjP2zOOSMSlgjh0TvZhp3XyT3CrxfZa096KIWLzXV5vnTCSUm2hTOC3u2xlbn
	FOUDSKnEgwfvBbN1CisN6xsjzQPPPL0fceBmYfobz2cV9Csr00zrOwgcO9w1T/hE6DXfJzn1WjO
	qEErwjqVT7k2uvH1NB5JisOklE6rhdCM0yd+/5RWVFiWydJfcJomRaed41CBr1U6hwxnbv6xr4n
	BuzQbX7gQ8bN/xCD6usOXS5EUWjQV4fzmIQS7faCrabs4PBiVzL4=
X-Google-Smtp-Source: AGHT+IFPMkepThXh+hpHafQU+8mg6c4yfS3OBn21itTHnwbLfxR1NdOOPbci4HOxrZLuvpBH2+aJIw==
X-Received: by 2002:a05:6512:33ca:b0:553:30fc:cedb with SMTP id 2adb3069b0e04-5539c11831amr554733e87.10.1749690942952;
        Wed, 11 Jun 2025 18:15:42 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553a7018069sm62808e87.157.2025.06.11.18.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 18:15:42 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 03/10] media: qcom: camss: csiphy: simplify arguments of lanes_enable and lanes_disable
Date: Thu, 12 Jun 2025 04:15:24 +0300
Message-ID: <20250612011531.2923701-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In some of .lanes_enable and .lanes_disable functions the second argument
of csiphy_config type is either unused or it can be derived from the
main function argument, this lets to remove it from the list of arguments.

Apart of being the simplification the change is needed for further updates
to CSIPHY part of the CAMSS driver to get CSIPHY combo mode feature and
a related to it management of non-statically assigned CSIPHY media pads.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../media/platform/qcom/camss/camss-csiphy-2ph-1-0.c  | 10 ++++------
 .../media/platform/qcom/camss/camss-csiphy-3ph-1-0.c  | 11 ++++-------
 drivers/media/platform/qcom/camss/camss-csiphy.c      |  4 ++--
 drivers/media/platform/qcom/camss/camss-csiphy.h      |  4 +---
 4 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
index 9d67e7fa6366..d9735f61fffc 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
@@ -95,10 +95,9 @@ static u8 csiphy_settle_cnt_calc(s64 link_freq, u32 timer_clk_rate)
 }
 
 static void csiphy_lanes_enable(struct csiphy_device *csiphy,
-				struct csiphy_config *cfg,
 				s64 link_freq, u8 lane_mask)
 {
-	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
+	struct csiphy_lanes_cfg *c = &csiphy->cfg.csi2->lane_cfg;
 	u8 settle_cnt;
 	u8 val, l = 0;
 	int i = 0;
@@ -114,7 +113,7 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 	val |= lane_mask << 1;
 	writel_relaxed(val, csiphy->base + CAMSS_CSI_PHY_GLBL_PWR_CFG);
 
-	val = cfg->combo_mode << 4;
+	val = csiphy->cfg.combo_mode << 4;
 	writel_relaxed(val, csiphy->base + CAMSS_CSI_PHY_GLBL_RESET);
 
 	for (i = 0; i <= c->num_data; i++) {
@@ -134,10 +133,9 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 	}
 }
 
-static void csiphy_lanes_disable(struct csiphy_device *csiphy,
-				 struct csiphy_config *cfg)
+static void csiphy_lanes_disable(struct csiphy_device *csiphy)
 {
-	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
+	struct csiphy_lanes_cfg *c = &csiphy->cfg.csi2->lane_cfg;
 	u8 l = 0;
 	int i = 0;
 
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index f732a76de93e..69d95bfeb9d2 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -638,10 +638,9 @@ static u8 csiphy_settle_cnt_calc(s64 link_freq, u32 timer_clk_rate)
 }
 
 static void csiphy_gen1_config_lanes(struct csiphy_device *csiphy,
-				     struct csiphy_config *cfg,
 				     u8 settle_cnt)
 {
-	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
+	struct csiphy_lanes_cfg *c = &csiphy->cfg.csi2->lane_cfg;
 	int i, l = 0;
 	u8 val;
 
@@ -758,10 +757,9 @@ static bool csiphy_is_gen2(u32 version)
 }
 
 static void csiphy_lanes_enable(struct csiphy_device *csiphy,
-				struct csiphy_config *cfg,
 				s64 link_freq, u8 lane_mask)
 {
-	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
+	struct csiphy_lanes_cfg *c = &csiphy->cfg.csi2->lane_cfg;
 	struct csiphy_device_regs *regs = csiphy->regs;
 	u8 settle_cnt;
 	u8 val;
@@ -791,7 +789,7 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 	if (csiphy_is_gen2(csiphy->camss->res->version))
 		csiphy_gen2_config_lanes(csiphy, settle_cnt);
 	else
-		csiphy_gen1_config_lanes(csiphy, cfg, settle_cnt);
+		csiphy_gen1_config_lanes(csiphy, settle_cnt);
 
 	/* IRQ_MASK registers - disable all interrupts */
 	for (i = 11; i < 22; i++) {
@@ -800,8 +798,7 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 	}
 }
 
-static void csiphy_lanes_disable(struct csiphy_device *csiphy,
-				 struct csiphy_config *cfg)
+static void csiphy_lanes_disable(struct csiphy_device *csiphy)
 {
 	struct csiphy_device_regs *regs = csiphy->regs;
 
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 1ba3fc2e33ac..f561811b7617 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -295,7 +295,7 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
 		wmb();
 	}
 
-	csiphy->res->hw_ops->lanes_enable(csiphy, cfg, link_freq, lane_mask);
+	csiphy->res->hw_ops->lanes_enable(csiphy, link_freq, lane_mask);
 
 	return 0;
 }
@@ -308,7 +308,7 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
  */
 static void csiphy_stream_off(struct csiphy_device *csiphy)
 {
-	csiphy->res->hw_ops->lanes_disable(csiphy, &csiphy->cfg);
+	csiphy->res->hw_ops->lanes_disable(csiphy);
 }
 
 
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index d82dafd1d270..3b73248f1364 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -72,10 +72,8 @@ struct csiphy_hw_ops {
 				struct device *dev);
 	void (*reset)(struct csiphy_device *csiphy);
 	void (*lanes_enable)(struct csiphy_device *csiphy,
-			     struct csiphy_config *cfg,
 			     s64 link_freq, u8 lane_mask);
-	void (*lanes_disable)(struct csiphy_device *csiphy,
-			      struct csiphy_config *cfg);
+	void (*lanes_disable)(struct csiphy_device *csiphy);
 	irqreturn_t (*isr)(int irq, void *dev);
 	int (*init)(struct csiphy_device *csiphy);
 };
-- 
2.49.0


