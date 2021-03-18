Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6438340774
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Mar 2021 15:12:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231153AbhCROMS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Mar 2021 10:12:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231154AbhCROLv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Mar 2021 10:11:51 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C09AC061763
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Mar 2021 07:11:50 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id y1so7627760ljm.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Mar 2021 07:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/wK043G6fYURTvdPDAk0ML3GahfXpxH1zobeB6yAyd4=;
        b=KqwCZ5AeRJ9tYj0JaP7Q/4UNl2+ON0/tGN2LAd7Bx1TeaaA5u7e2mO/I33QG521i1n
         QUEz6wPHV6r/t7x891i8yy8QJWKZUe32EpYWONySHx32FEPUcsC+8teLUbZiaSxY48rj
         XcHLjRM57qZoOO44quJet/p2HmGUwY1jjnzXViMkXLUWw9A1+yzQQt1hrssbYb/S6PLz
         COD9k2WdKmQX0uT12qc+q1i63v5F9sVbszXNaURmZa5cAZOxKL9zuxejJZp5rFcwYEL5
         C9/xbLMnWjJm30mWRnOGovrMIfzFZDPywC+5SDhQPVNbG/59dPoDU6QSU/nGf4+Ihl3T
         881Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/wK043G6fYURTvdPDAk0ML3GahfXpxH1zobeB6yAyd4=;
        b=W56WGjK2ftXvouC6hkbD1kYogKabAxq+CZj7MieBrvGA2y8uivFExc8Y7vOfwyHBkL
         5snDdGIK1IAIT81Auu1e6sIm/IzQOV/FYnDCxzkgiDSQ5B8RYaK28AvM20i9hhUVlATk
         hWVRC3P8CzSaOlsPvXnbQDGe6ips5W4Vpa5rd3Ee9aod4U8MGZ1mEVLJ/jxZq7FiXj/P
         FvEe4D84Re72KsoS3AYM0booGLxRQRC1U5nYjNrgRsncqChkRdNCY3wP5kA1iGNVW3AY
         bKK9l7SbyRaiCIn/PSc2D2YDxOtE4gaYlysL2cwqBed+2EE8HVaElC0lOvpLbzmCojRh
         craQ==
X-Gm-Message-State: AOAM531McHLCF/KXL82dUasaIiNdqZR7lb4HT5UAYSyMPLbLD6V16GZD
        8i908ctsrmXNr4HHqx0N8kl+Yw==
X-Google-Smtp-Source: ABdhPJznc+b+qb15SpCPVoiBvwsW/UyJpOzgMfMBrWA8xttrdIPibW6s7OKQ/W5fVbbUj0wNzLsWXw==
X-Received: by 2002:a2e:a415:: with SMTP id p21mr2225207ljn.108.1616076708993;
        Thu, 18 Mar 2021 07:11:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f20sm254713ljn.123.2021.03.18.07.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 07:11:48 -0700 (PDT)
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
Subject: [PATCH v2 3/6] phy: qcom-qmp: rename common registers
Date:   Thu, 18 Mar 2021 17:11:41 +0300
Message-Id: <20210318141144.2147610-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210318141144.2147610-1-dmitry.baryshkov@linaro.org>
References: <20210318141144.2147610-1-dmitry.baryshkov@linaro.org>
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

