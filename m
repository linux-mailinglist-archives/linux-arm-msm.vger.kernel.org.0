Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C102546CEC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 21:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348235AbiFJTJg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 15:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347158AbiFJTJf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 15:09:35 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A739C21A7
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:09:34 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id e4so154917ljl.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K8nNOMO0byBaUScXWiPH0ZuAT2sDaut3qghL3G2LDM4=;
        b=XWcORMykmO9MpJln/AClQi4eX7X4uPAxoclWltDE4dOC5LJdoYkpd+iwWg6qTz8KO5
         lQWsjhonIrssOeKjgcPgbXzLd/K2CTP9LPIgbSz2zNE7RTJS9KlHGo4z6my2ES1gcqle
         Xo13B31Prwz7gJqfjj3fiFHxFD6l0YtY7in4bWZ5oUKFvwuf+p0tFVp06i0tX5ZpRjpe
         G5CMvLS6jMrGPbgAN40JTFVfqISI0Ql9ABkjsA5QuWwnbYI/c7Zk4naIK/iAkwYq2WVZ
         cw3CgEIWx4ZQkUng+tjmnavBhmFX4QsCM1DifWXsOJzdTIaHHHRPGAd8GZ86VwNv+70r
         gAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K8nNOMO0byBaUScXWiPH0ZuAT2sDaut3qghL3G2LDM4=;
        b=KaeyEW5fF2Y15h7F5Huos2ls+14GpjfFQlLSWNmVUJDwvNBwcaCKRMSZ+4rAuaVScc
         K2N8MoWd9NeEM5+51S2F4EPp+GFgsnM2ZUfeS8uSrkCc9o9pxPeYb4gZf/IQrsuP+phw
         2Y++pZrtcGAFjQApGPXbe/RGmxUnJ2l6VlgV7sSgBfEf0ElOwtirqCHOkcV7RXv2IgHb
         lVEzo/YcBC8MhTJNvedpabcvoGvdXN/RCpolVg0+oR8Sz0bYaoZc6zFS+EShmyGw8a4/
         IpiLMTRxEKBKXpFubve1qCTE26j+19AXnKdiP/xUBR3SUS1zYqdvJs6hM1XpZU6fkgFA
         rVwQ==
X-Gm-Message-State: AOAM533a2e2X6uph4mpF0iBrrP7K7oEZgFxyDuATZR95D0/Cc4VGX8GN
        j0prAhSvBYu42KrU3Wj6FwxhUQ==
X-Google-Smtp-Source: ABdhPJzkHSbsOqnTczJiqKQbWV2C9i0OEVM+NnsCEiG4NdvbzboXbmRI10o85ewtUQNPkwgkBT4yNg==
X-Received: by 2002:a2e:b0e6:0:b0:255:6cf9:ea90 with SMTP id h6-20020a2eb0e6000000b002556cf9ea90mr26786189ljl.425.1654888173064;
        Fri, 10 Jun 2022 12:09:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h2-20020a2e9002000000b00253e1833e8bsm26614ljg.117.2022.06.10.12.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 12:09:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH 04/28] phy: qcom-qmp-pcie: split pcs_misc region for ipq6018 pcie gen3
Date:   Fri, 10 Jun 2022 22:09:01 +0300
Message-Id: <20220610190925.3670081-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610190925.3670081-1-dmitry.baryshkov@linaro.org>
References: <20220610190925.3670081-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Follow the example of other PCIe PHYs and use separate pcs_misc region
to access PCS_PCIE_* resources.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c |  9 +++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h      | 32 ++++++++++++------------
 2 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index b2cd0cf965d8..987f0b1d023c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -361,6 +361,9 @@ static const struct qmp_phy_init_tbl ipq6018_pcie_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(PCS_COM_P2U3_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
 	QMP_PHY_INIT_CFG(PCS_COM_RX_DCC_CAL_CONFIG, 0x01),
 	QMP_PHY_INIT_CFG(PCS_COM_EQ_CONFIG5, 0x01),
+};
+
+static const struct qmp_phy_init_tbl ipq6018_pcie_pcs_misc_tbl[] = {
 	QMP_PHY_INIT_CFG(PCS_PCIE_POWER_STATE_CONFIG2, 0x0d),
 	QMP_PHY_INIT_CFG(PCS_PCIE_POWER_STATE_CONFIG4, 0x07),
 	QMP_PHY_INIT_CFG(PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
@@ -1433,6 +1436,8 @@ static const struct qmp_phy_cfg ipq6018_pciephy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(ipq6018_pcie_rx_tbl),
 	.pcs_tbl		= ipq6018_pcie_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(ipq6018_pcie_pcs_tbl),
+	.pcs_misc_tbl		= ipq6018_pcie_pcs_misc_tbl,
+	.pcs_misc_tbl_num	= ARRAY_SIZE(ipq6018_pcie_pcs_misc_tbl),
 	.clk_list		= ipq8074_pciephy_clk_l,
 	.num_clks		= ARRAY_SIZE(ipq8074_pciephy_clk_l),
 	.reset_list		= ipq8074_pciephy_reset_l,
@@ -2207,6 +2212,10 @@ int qcom_qmp_phy_pcie_create(struct device *dev, struct device_node *np, int id,
 		qphy->pcs_misc = of_iomap(np, 3);
 	}
 
+	if (!qphy->pcs_misc &&
+	    of_device_is_compatible(dev->of_node, "qcom,ipq6018-qmp-pcie-phy"))
+		qphy->pcs_misc = qphy->pcs + 0x400;
+
 	if (!qphy->pcs_misc)
 		dev_vdbg(dev, "PHY pcs_misc-reg not used\n");
 
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index c07227f352b3..adb155a45923 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -121,22 +121,22 @@
 
 /* QMP V2 PHY for PCIE gen3 ports - PCS Misc registers */
 
-#define PCS_PCIE_POWER_STATE_CONFIG2			0x40c
-#define PCS_PCIE_POWER_STATE_CONFIG4			0x414
-#define PCS_PCIE_ENDPOINT_REFCLK_DRIVE			0x41c
-#define PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_L		0x440
-#define PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_H		0x444
-#define PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_L		0x448
-#define PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_H		0x44c
-#define PCS_PCIE_OSC_DTCT_CONFIG2			0x45c
-#define PCS_PCIE_OSC_DTCT_MODE2_CONFIG2			0x478
-#define PCS_PCIE_OSC_DTCT_MODE2_CONFIG4			0x480
-#define PCS_PCIE_OSC_DTCT_MODE2_CONFIG5			0x484
-#define PCS_PCIE_OSC_DTCT_ACTIONS			0x490
-#define PCS_PCIE_EQ_CONFIG1				0x4a0
-#define PCS_PCIE_EQ_CONFIG2				0x4a4
-#define PCS_PCIE_PRESET_P10_PRE				0x4bc
-#define PCS_PCIE_PRESET_P10_POST			0x4e0
+#define PCS_PCIE_POWER_STATE_CONFIG2			0x00c
+#define PCS_PCIE_POWER_STATE_CONFIG4			0x014
+#define PCS_PCIE_ENDPOINT_REFCLK_DRIVE			0x01c
+#define PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_L		0x040
+#define PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_H		0x044
+#define PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_L		0x048
+#define PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_H		0x04c
+#define PCS_PCIE_OSC_DTCT_CONFIG2			0x05c
+#define PCS_PCIE_OSC_DTCT_MODE2_CONFIG2			0x078
+#define PCS_PCIE_OSC_DTCT_MODE2_CONFIG4			0x080
+#define PCS_PCIE_OSC_DTCT_MODE2_CONFIG5			0x084
+#define PCS_PCIE_OSC_DTCT_ACTIONS			0x090
+#define PCS_PCIE_EQ_CONFIG1				0x0a0
+#define PCS_PCIE_EQ_CONFIG2				0x0a4
+#define PCS_PCIE_PRESET_P10_PRE				0x0bc
+#define PCS_PCIE_PRESET_P10_POST			0x0e0
 
 /* Only for QMP V2 PHY - QSERDES COM registers */
 #define QSERDES_COM_BG_TIMER				0x00c
-- 
2.35.1

