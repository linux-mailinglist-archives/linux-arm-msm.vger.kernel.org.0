Return-Path: <linux-arm-msm+bounces-18211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DC08AD758
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 00:37:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A69391C21A2F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 22:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CDD01D545;
	Mon, 22 Apr 2024 22:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LSzMa7Ku"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9C52C870
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 22:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713825438; cv=none; b=GHjFwJBtEbye2N7jjk01aOv7Cl3BxKkEuvEXdCBgQe7NMqtsQGKhXTqpwY2DYFMe5zgjQ31x8jD6VXtOf1m12pGi8cbVvArIBmzx6+gpFsTkUur6VC4Z9tqU7QHXvAX5VamYhL+lxHSAZmq4NQ8vLv/a7XmDkatFoc7XTKSUE+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713825438; c=relaxed/simple;
	bh=Cii6kyVhoCjnR1EFaDCX3ZeATOu7sU5LZqUH89zu4zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mUXiFG3dA7510rReXqEyVTuIYXZDyeLeuGrkCpM0j66Of4lutCCbT9gooxhlkOoelVTj0SJua13pD+KCA1TlQ4kCnja1DwL21adh17f5NTGvFQlW88QTrvBfUR1NpVd2ngPogd037paP7hjKKsgHbmCevqysYGETAV+xAuUeF+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LSzMa7Ku; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-516d3a470d5so6104376e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 15:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713825434; x=1714430234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sN4dmO/8mUVWu5VazSYlBARXV3xD+CQkYmZfIuCW6rY=;
        b=LSzMa7Ku/XPvrwzAmiOa+oUPrKT5U4bbtWdPGzk1NXArKLzrfBlFwVwB7+7jq4LRaV
         HmH+HZQ0kABb/wTfpe4Lo1cLSod9AW/Fln5h5mjNFANoItRQmeIJRZDV0TSZbPsn9Jzv
         fPcyPdQcLFsTUYs/8onsoen+Q2H9NtW85RcYikbDX22DLoPYsmgUD+PIhQkk3EDD73RN
         LvZ2Qd0QJOmo+ZgIosIvvKDeoUCV3GjRRSrQ1clHi2FMhLp4A5Bu1gX6DUbGvhqLqcsu
         cxIRfU3NrD4TCDCahxXBIYe6rhgGaF9ZQYnDsHW2px8gdbGQkqnCjNsxcHafC8MNkkE9
         ZvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713825434; x=1714430234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sN4dmO/8mUVWu5VazSYlBARXV3xD+CQkYmZfIuCW6rY=;
        b=eWFZDg0GHB4klS8huBs2+d4raU65HsX6J/+t+b8tc+et5BPr4R6+LMuthnGndp4m2x
         fWWXKoy4GPO0LxXpaXe/rFM6Sl1cTgkCfocY3VRJ02MCug0aifTb4j71fTDkIkKltkcx
         52cM1P2XOCbx1R0qGA38FsjMVLd/mFnpBXFRmUYtoeIrLHUVzQ8SQ2vwW74LPPRX+CKe
         LgEaxJMAFKqdT7O+RbwGSTaUm5dnnrHCxn3Kd3iKW1R9fGBBiUvOlEx7m6vHFmPX6NM9
         kf7gvzCxrv0YUQuYtRrbv15Wm5fvhrFJhvh0CVSFyaSaDQhJwXCNrl6/6ZSxc2VnpDXv
         3YIg==
X-Gm-Message-State: AOJu0Yw0141Aj1ff7JT5rN0fNSqxWasaZ/bhjuH+yH4Cl+Y7tVhjeI+/
	XYnXJseLVpuIpJEglNZ2i+iu9RVDCuMFS6MztQpqGrTnp6g++DPRLK074rPqY9zr5xGdF1bIG1V
	A
X-Google-Smtp-Source: AGHT+IFRP5nt0l9htHFmTSXCzG83rg/sivf++l1q7XOuy7iHKdKksDNr4eQFZOkUAGf+cDYSj2p3VQ==
X-Received: by 2002:a19:e049:0:b0:51a:1f56:f96d with SMTP id g9-20020a19e049000000b0051a1f56f96dmr6823390lfj.51.1713825434652;
        Mon, 22 Apr 2024 15:37:14 -0700 (PDT)
Received: from [127.0.1.1] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id r3-20020ac25f83000000b00513c4e41140sm1841271lfe.204.2024.04.22.15.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 15:37:14 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 23 Apr 2024 00:37:00 +0200
Subject: [PATCH 2/2] drm/msm/dsi: Remove dsi_phy_write_[un]delay()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240423-topic-msm_cleanup-v1-2-b30f39f43b90@linaro.org>
References: <20240423-topic-msm_cleanup-v1-0-b30f39f43b90@linaro.org>
In-Reply-To: <20240423-topic-msm_cleanup-v1-0-b30f39f43b90@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev

These are dummy wrappers that do literally nothing interesting.
Remove them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  3 --
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c |  3 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 81 +++++++++++++++++++-----------
 3 files changed, 54 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 7df4d852e6fa..109d767a476b 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -12,9 +12,6 @@
 
 #include "dsi.h"
 
-#define dsi_phy_write_udelay(offset, data, delay_us) { writel((data), (offset)); udelay(delay_us); }
-#define dsi_phy_write_ndelay(offset, data, delay_ns) { writel((data), (offset)); ndelay(delay_ns); }
-
 struct msm_dsi_phy_ops {
 	int (*pll_init)(struct msm_dsi_phy *phy);
 	int (*enable)(struct msm_dsi_phy *phy,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index b128c4acea23..1723f0e4faa4 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -374,7 +374,8 @@ static void pll_14nm_software_reset(struct dsi_pll_14nm *pll_14nm)
 	writel(0, cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL);
 
 	/* pll sw reset */
-	dsi_phy_write_udelay(cmn_base + REG_DSI_14nm_PHY_CMN_CTRL_1, 0x20, 10);
+	writel(0x20, cmn_base + REG_DSI_14nm_PHY_CMN_CTRL_1);
+	udelay(10);
 	wmb();	/* make sure register committed */
 
 	writel(0, cmn_base + REG_DSI_14nm_PHY_CMN_CTRL_1);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index b3e914954f4a..db99526d11df 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -104,9 +104,10 @@ static void pll_28nm_software_reset(struct dsi_pll_28nm *pll_28nm)
 	 * Add HW recommended delays after toggling the software
 	 * reset bit off and back on.
 	 */
-	dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_TEST_CFG,
-			     DSI_28nm_PHY_PLL_TEST_CFG_PLL_SW_RESET, 1);
-	dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_TEST_CFG, 0x00, 1);
+	writel(DSI_28nm_PHY_PLL_TEST_CFG_PLL_SW_RESET, base + REG_DSI_28nm_PHY_PLL_TEST_CFG);
+	udelay(1);
+	writel(0, base + REG_DSI_28nm_PHY_PLL_TEST_CFG);
+	udelay(1);
 }
 
 /*
@@ -303,21 +304,25 @@ static int _dsi_pll_28nm_vco_prepare_hpm(struct dsi_pll_28nm *pll_28nm)
 	 * Add necessary delays recommended by hardware.
 	 */
 	val = DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRDN_B;
-	dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 1);
+	writel(val, base + REG_DSI_28nm_PHY_PLL_GLB_CFG);
+	udelay(1);
 
 	val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRGEN_PWRDN_B;
-	dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 200);
+	writel(val, base + REG_DSI_28nm_PHY_PLL_GLB_CFG);
+	udelay(200);
 
 	val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_LDO_PWRDN_B;
-	dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 500);
+	writel(val, base + REG_DSI_28nm_PHY_PLL_GLB_CFG);
+	udelay(500);
 
 	val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_ENABLE;
-	dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 600);
+	writel(val, base + REG_DSI_28nm_PHY_PLL_GLB_CFG);
+	udelay(600);
 
 	for (i = 0; i < 2; i++) {
 		/* DSI Uniphy lock detect setting */
-		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2,
-				     0x0c, 100);
+		writel(0x0c, base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2);
+		udelay(100);
 		writel(0x0d, base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2);
 
 		/* poll for PLL ready status */
@@ -333,22 +338,28 @@ static int _dsi_pll_28nm_vco_prepare_hpm(struct dsi_pll_28nm *pll_28nm)
 		 * Add necessary delays recommended by hardware.
 		 */
 		val = DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRDN_B;
-		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 1);
+		writel(val, base + REG_DSI_28nm_PHY_PLL_GLB_CFG);
+		udelay(1);
 
 		val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRGEN_PWRDN_B;
-		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 200);
+		writel(val, base + REG_DSI_28nm_PHY_PLL_GLB_CFG);
+		udelay(200);
 
 		val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_LDO_PWRDN_B;
-		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 250);
+		writel(val, base + REG_DSI_28nm_PHY_PLL_GLB_CFG);
+		udelay(250);
 
 		val &= ~DSI_28nm_PHY_PLL_GLB_CFG_PLL_LDO_PWRDN_B;
-		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 200);
+		writel(val, base + REG_DSI_28nm_PHY_PLL_GLB_CFG);
+		udelay(200);
 
 		val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_LDO_PWRDN_B;
-		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 500);
+		writel(val, base + REG_DSI_28nm_PHY_PLL_GLB_CFG);
+		udelay(500);
 
 		val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_ENABLE;
-		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 600);
+		writel(val, base + REG_DSI_28nm_PHY_PLL_GLB_CFG);
+		udelay(600);
 	}
 
 	if (unlikely(!locked))
@@ -399,20 +410,23 @@ static int dsi_pll_28nm_vco_prepare_8226(struct clk_hw *hw)
 	writel(0x34, base + REG_DSI_28nm_PHY_PLL_CAL_CFG1);
 
 	val = DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRDN_B;
-	dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 200);
+	writel(val, base + REG_DSI_28nm_PHY_PLL_GLB_CFG);
+	udelay(200);
 
 	val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRGEN_PWRDN_B;
-	dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 200);
+	writel(val, base + REG_DSI_28nm_PHY_PLL_GLB_CFG);
+	udelay(200);
 
 	val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_LDO_PWRDN_B;
 	val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_ENABLE;
-	dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 600);
+	writel(val, base + REG_DSI_28nm_PHY_PLL_GLB_CFG);
+	udelay(600);
 
 	for (i = 0; i < 7; i++) {
 		/* DSI Uniphy lock detect setting */
 		writel(0x0d, base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2);
-		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2,
-				0x0c, 100);
+		writel(0x0c, base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2);
+		udelay(100);
 		writel(0x0d, base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2);
 
 		/* poll for PLL ready status */
@@ -427,15 +441,18 @@ static int dsi_pll_28nm_vco_prepare_8226(struct clk_hw *hw)
 		 * PLL power up sequence.
 		 * Add necessary delays recommended by hardware.
 		 */
-		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_PWRGEN_CFG, 0x00, 50);
+		writel(0x00, base + REG_DSI_28nm_PHY_PLL_PWRGEN_CFG);
+		udelay(50);
 
 		val = DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRDN_B;
 		val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRGEN_PWRDN_B;
-		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 100);
+		writel(val, base + REG_DSI_28nm_PHY_PLL_GLB_CFG);
+		udelay(100);
 
 		val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_LDO_PWRDN_B;
 		val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_ENABLE;
-		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 600);
+		writel(val, base + REG_DSI_28nm_PHY_PLL_GLB_CFG);
+		udelay(600);
 	}
 
 	if (unlikely(!locked))
@@ -466,21 +483,27 @@ static int dsi_pll_28nm_vco_prepare_lp(struct clk_hw *hw)
 	 * PLL power up sequence.
 	 * Add necessary delays recommended by hardware.
 	 */
-	dsi_phy_write_ndelay(base + REG_DSI_28nm_PHY_PLL_CAL_CFG1, 0x34, 500);
+	writel(0x34, base + REG_DSI_28nm_PHY_PLL_CAL_CFG1);
+	ndelay(500);
 
 	val = DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRDN_B;
-	dsi_phy_write_ndelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 500);
+	writel(val, base + REG_DSI_28nm_PHY_PLL_GLB_CFG);
+	ndelay(500);
 
 	val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRGEN_PWRDN_B;
-	dsi_phy_write_ndelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 500);
+	writel(val, base + REG_DSI_28nm_PHY_PLL_GLB_CFG);
+	ndelay(500);
 
 	val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_LDO_PWRDN_B |
 		DSI_28nm_PHY_PLL_GLB_CFG_PLL_ENABLE;
-	dsi_phy_write_ndelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 500);
+	writel(val, base + REG_DSI_28nm_PHY_PLL_GLB_CFG);
+	ndelay(500);
 
 	/* DSI PLL toggle lock detect setting */
-	dsi_phy_write_ndelay(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2, 0x04, 500);
-	dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2, 0x05, 512);
+	writel(0x04, base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2);
+	ndelay(500);
+	writel(0x05, base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2);
+	udelay(512);
 
 	locked = pll_28nm_poll_for_ready(pll_28nm, max_reads, timeout_us);
 

-- 
2.40.1


