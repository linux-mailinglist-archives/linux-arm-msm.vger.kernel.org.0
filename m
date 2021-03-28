Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4FEE34BF10
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Mar 2021 22:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231499AbhC1Uxl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Mar 2021 16:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231422AbhC1UxH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Mar 2021 16:53:07 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38615C0613B8
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Mar 2021 13:53:07 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id u4so13678426ljo.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Mar 2021 13:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/wK043G6fYURTvdPDAk0ML3GahfXpxH1zobeB6yAyd4=;
        b=G9hxHhWJ9vD5m4dH9UVV8VlG5MTbLecLyI5Z31EvB2qRumVbw1qL7U4sZpV0fsJ1yI
         K4lEm3h3stz5cP4xNW0VUigxJvPd5EGZXmeUfuylspElhnu8POpIIrAyNqWQUGuu52MF
         G1+OmM+0o+WlCMCNo5qUiNZ41BRtsPCgZ9hDTUh+BYfSefZC6caMMeiwgfSY5EluELdJ
         BEdODvdB579I7aGi1Rf+21e/rebt6W8gDLFo30B53egRAYmuxZTfNNmWMgfE8ENxTXJI
         eZmByzGJgMCON6g58DGe+ZrpG6gSVJX77OU3StgUbDL76uCIav9TcU01HEo7EVJ/hSrS
         QSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/wK043G6fYURTvdPDAk0ML3GahfXpxH1zobeB6yAyd4=;
        b=WODAiqgMUrJTxE7RX4fHR09WeVPs/o8EbQzJ7gczjAaGHYBUV4+2bf93/xVQph8LtJ
         o17P1LXM243uMBDAWzRh38h6w8UlxJj7+Cw+tMoBkYM6l0uNPraoIsUSc8m6Ul2DHNsK
         /C1LWduTt6EXP07BcO37RqlT5jTDdThfn+g+S7uYxOfqCwTQBm/5ZkZQWQk3vqM71AEk
         NJ+Rmh8aUol+oO/gZcp3OGJifm68lOiSP6bkc6cExPiSwdQ7oNfgq1LF+8BLNTibfoyu
         sRxOEhPXOWBk7f3mciNksAK0UA+rtE1OeZjixrjafOPbZwrKuBeZmJMHPJ2oBTXrc4DZ
         J8tA==
X-Gm-Message-State: AOAM531oxiBFAmC3zLq33QJDljdHurYQrLoVwwkHNJG2SMvzSTp35T5+
        ST8hDVchr3SXpc7CwjTVnecr9A==
X-Google-Smtp-Source: ABdhPJwRErA2i0tAdVWQtluqS4xIOFcviiEOB9fuE+l52XyGiz3VD1KkDwE4rmhxCyaZpNCndeU7Pg==
X-Received: by 2002:a2e:8919:: with SMTP id d25mr9694500lji.187.1616964785661;
        Sun, 28 Mar 2021 13:53:05 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j19sm1589788lfb.15.2021.03.28.13.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 13:53:05 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Manu Gautam <mgautam@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 4/7] phy: qcom-qmp: rename common registers
Date:   Sun, 28 Mar 2021 23:52:54 +0300
Message-Id: <20210328205257.3348866-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210328205257.3348866-1-dmitry.baryshkov@linaro.org>
References: <20210328205257.3348866-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A plenty of DP PHY registers are common between V3 and V4. To simplify
V4 code, rename all common registers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 50 ++++++++++++++---------------
 drivers/phy/qualcomm/phy-qcom-qmp.h | 37 ++++++++++-----------
 2 files changed, 44 insertions(+), 43 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 4150096fd350..097bc005ba43 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -2435,20 +2435,20 @@ static void qcom_qmp_v3_phy_dp_aux_init(struct qmp_phy *qphy)
 {
 	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
 	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
-	       qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
+	       qphy->pcs + QSERDES_DP_PHY_PD_CTL);
 
 	/* Turn on BIAS current for PHY/PLL */
 	writel(QSERDES_V3_COM_BIAS_EN | QSERDES_V3_COM_BIAS_EN_MUX |
 	       QSERDES_V3_COM_CLKBUF_L_EN | QSERDES_V3_COM_EN_SYSCLK_TX_SEL,
 	       qphy->serdes + QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN);
 
-	writel(DP_PHY_PD_CTL_PSR_PWRDN, qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
+	writel(DP_PHY_PD_CTL_PSR_PWRDN, qphy->pcs + QSERDES_DP_PHY_PD_CTL);
 
 	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
 	       DP_PHY_PD_CTL_LANE_0_1_PWRDN |
 	       DP_PHY_PD_CTL_LANE_2_3_PWRDN | DP_PHY_PD_CTL_PLL_PWRDN |
 	       DP_PHY_PD_CTL_DP_CLAMP_EN,
-	       qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
+	       qphy->pcs + QSERDES_DP_PHY_PD_CTL);
 
 	writel(QSERDES_V3_COM_BIAS_EN |
 	       QSERDES_V3_COM_BIAS_EN_MUX | QSERDES_V3_COM_CLKBUF_R_EN |
@@ -2456,16 +2456,16 @@ static void qcom_qmp_v3_phy_dp_aux_init(struct qmp_phy *qphy)
 	       QSERDES_V3_COM_CLKBUF_RX_DRIVE_L,
 	       qphy->serdes + QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN);
 
-	writel(0x00, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG0);
-	writel(0x13, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG1);
-	writel(0x24, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG2);
-	writel(0x00, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG3);
-	writel(0x0a, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG4);
-	writel(0x26, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG5);
-	writel(0x0a, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG6);
-	writel(0x03, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG7);
-	writel(0xbb, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG8);
-	writel(0x03, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG9);
+	writel(0x00, qphy->pcs + QSERDES_DP_PHY_AUX_CFG0);
+	writel(0x13, qphy->pcs + QSERDES_DP_PHY_AUX_CFG1);
+	writel(0x24, qphy->pcs + QSERDES_DP_PHY_AUX_CFG2);
+	writel(0x00, qphy->pcs + QSERDES_DP_PHY_AUX_CFG3);
+	writel(0x0a, qphy->pcs + QSERDES_DP_PHY_AUX_CFG4);
+	writel(0x26, qphy->pcs + QSERDES_DP_PHY_AUX_CFG5);
+	writel(0x0a, qphy->pcs + QSERDES_DP_PHY_AUX_CFG6);
+	writel(0x03, qphy->pcs + QSERDES_DP_PHY_AUX_CFG7);
+	writel(0xbb, qphy->pcs + QSERDES_DP_PHY_AUX_CFG8);
+	writel(0x03, qphy->pcs + QSERDES_DP_PHY_AUX_CFG9);
 	qphy->dp_aux_cfg = 0;
 
 	writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
@@ -2556,9 +2556,9 @@ static int qcom_qmp_v3_phy_configure_dp_phy(struct qmp_phy *qphy)
 	 *	writel(0x4c, qphy->pcs + QSERDES_V3_DP_PHY_MODE);
 	 */
 	val |= DP_PHY_PD_CTL_LANE_2_3_PWRDN;
-	writel(val, qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
+	writel(val, qphy->pcs + QSERDES_DP_PHY_PD_CTL);
 
-	writel(0x5c, qphy->pcs + QSERDES_V3_DP_PHY_MODE);
+	writel(0x5c, qphy->pcs + QSERDES_DP_PHY_MODE);
 	writel(0x05, qphy->pcs + QSERDES_V3_DP_PHY_TX0_TX1_LANE_CTL);
 	writel(0x05, qphy->pcs + QSERDES_V3_DP_PHY_TX2_TX3_LANE_CTL);
 
@@ -2588,11 +2588,11 @@ static int qcom_qmp_v3_phy_configure_dp_phy(struct qmp_phy *qphy)
 	clk_set_rate(dp_clks->dp_link_hw.clk, dp_opts->link_rate * 100000);
 	clk_set_rate(dp_clks->dp_pixel_hw.clk, pixel_freq);
 
-	writel(0x04, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG2);
-	writel(0x01, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
-	writel(0x05, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
-	writel(0x01, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
-	writel(0x09, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
+	writel(0x04, qphy->pcs + QSERDES_DP_PHY_AUX_CFG2);
+	writel(0x01, qphy->pcs + QSERDES_DP_PHY_CFG);
+	writel(0x05, qphy->pcs + QSERDES_DP_PHY_CFG);
+	writel(0x01, qphy->pcs + QSERDES_DP_PHY_CFG);
+	writel(0x09, qphy->pcs + QSERDES_DP_PHY_CFG);
 
 	writel(0x20, qphy->serdes + QSERDES_V3_COM_RESETSM_CNTRL);
 
@@ -2603,7 +2603,7 @@ static int qcom_qmp_v3_phy_configure_dp_phy(struct qmp_phy *qphy)
 			10000))
 		return -ETIMEDOUT;
 
-	writel(0x19, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
+	writel(0x19, qphy->pcs + QSERDES_DP_PHY_CFG);
 
 	if (readl_poll_timeout(qphy->pcs + QSERDES_V3_DP_PHY_STATUS,
 			status,
@@ -2612,9 +2612,9 @@ static int qcom_qmp_v3_phy_configure_dp_phy(struct qmp_phy *qphy)
 			10000))
 		return -ETIMEDOUT;
 
-	writel(0x18, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
+	writel(0x18, qphy->pcs + QSERDES_DP_PHY_CFG);
 	udelay(2000);
-	writel(0x19, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
+	writel(0x19, qphy->pcs + QSERDES_DP_PHY_CFG);
 
 	return readl_poll_timeout(qphy->pcs + QSERDES_V3_DP_PHY_STATUS,
 			status,
@@ -2636,7 +2636,7 @@ static int qcom_qmp_v3_dp_phy_calibrate(struct qmp_phy *qphy)
 	qphy->dp_aux_cfg %= ARRAY_SIZE(cfg1_settings);
 	val = cfg1_settings[qphy->dp_aux_cfg];
 
-	writel(val, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG1);
+	writel(val, qphy->pcs + QSERDES_DP_PHY_AUX_CFG1);
 
 	return 0;
 }
@@ -3898,7 +3898,7 @@ static int qcom_qmp_phy_power_off(struct phy *phy)
 
 	if (cfg->type == PHY_TYPE_DP) {
 		/* Assert DP PHY power down */
-		writel(DP_PHY_PD_CTL_PSR_PWRDN, qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
+		writel(DP_PHY_PD_CTL_PSR_PWRDN, qphy->pcs + QSERDES_DP_PHY_PD_CTL);
 	} else {
 		/* PHY reset */
 		if (!cfg->no_pcs_sw_reset)
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 71ce3aa174ae..981d8ee891c0 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -349,13 +349,13 @@
 #define QPHY_V3_PCS_MISC_OSC_DTCT_MODE2_CONFIG4		0x5c
 #define QPHY_V3_PCS_MISC_OSC_DTCT_MODE2_CONFIG5		0x60
 
-/* Only for QMP V3 PHY - DP PHY registers */
-#define QSERDES_V3_DP_PHY_REVISION_ID0			0x000
-#define QSERDES_V3_DP_PHY_REVISION_ID1			0x004
-#define QSERDES_V3_DP_PHY_REVISION_ID2			0x008
-#define QSERDES_V3_DP_PHY_REVISION_ID3			0x00c
-#define QSERDES_V3_DP_PHY_CFG				0x010
-#define QSERDES_V3_DP_PHY_PD_CTL			0x018
+/* QMP PHY - DP PHY registers */
+#define QSERDES_DP_PHY_REVISION_ID0			0x000
+#define QSERDES_DP_PHY_REVISION_ID1			0x004
+#define QSERDES_DP_PHY_REVISION_ID2			0x008
+#define QSERDES_DP_PHY_REVISION_ID3			0x00c
+#define QSERDES_DP_PHY_CFG				0x010
+#define QSERDES_DP_PHY_PD_CTL				0x018
 # define DP_PHY_PD_CTL_PWRDN				0x001
 # define DP_PHY_PD_CTL_PSR_PWRDN			0x002
 # define DP_PHY_PD_CTL_AUX_PWRDN			0x004
@@ -363,18 +363,19 @@
 # define DP_PHY_PD_CTL_LANE_2_3_PWRDN			0x010
 # define DP_PHY_PD_CTL_PLL_PWRDN			0x020
 # define DP_PHY_PD_CTL_DP_CLAMP_EN			0x040
-#define QSERDES_V3_DP_PHY_MODE				0x01c
-#define QSERDES_V3_DP_PHY_AUX_CFG0			0x020
-#define QSERDES_V3_DP_PHY_AUX_CFG1			0x024
-#define QSERDES_V3_DP_PHY_AUX_CFG2			0x028
-#define QSERDES_V3_DP_PHY_AUX_CFG3			0x02c
-#define QSERDES_V3_DP_PHY_AUX_CFG4			0x030
-#define QSERDES_V3_DP_PHY_AUX_CFG5			0x034
-#define QSERDES_V3_DP_PHY_AUX_CFG6			0x038
-#define QSERDES_V3_DP_PHY_AUX_CFG7			0x03c
-#define QSERDES_V3_DP_PHY_AUX_CFG8			0x040
-#define QSERDES_V3_DP_PHY_AUX_CFG9			0x044
+#define QSERDES_DP_PHY_MODE				0x01c
+#define QSERDES_DP_PHY_AUX_CFG0				0x020
+#define QSERDES_DP_PHY_AUX_CFG1				0x024
+#define QSERDES_DP_PHY_AUX_CFG2				0x028
+#define QSERDES_DP_PHY_AUX_CFG3				0x02c
+#define QSERDES_DP_PHY_AUX_CFG4				0x030
+#define QSERDES_DP_PHY_AUX_CFG5				0x034
+#define QSERDES_DP_PHY_AUX_CFG6				0x038
+#define QSERDES_DP_PHY_AUX_CFG7				0x03c
+#define QSERDES_DP_PHY_AUX_CFG8				0x040
+#define QSERDES_DP_PHY_AUX_CFG9				0x044
 
+/* Only for QMP V3 PHY - DP PHY registers */
 #define QSERDES_V3_DP_PHY_AUX_INTERRUPT_MASK		0x048
 # define PHY_AUX_STOP_ERR_MASK				0x01
 # define PHY_AUX_DEC_ERR_MASK				0x02
-- 
2.30.2

