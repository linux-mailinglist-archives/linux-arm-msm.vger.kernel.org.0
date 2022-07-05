Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7FCE566658
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 11:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbiGEJnd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 05:43:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbiGEJn3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 05:43:29 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74E00F23
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 02:43:26 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id z13so19543679lfj.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 02:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CywcAAinSEu1DyxLKI+3INxS4+tuturMu+HNalww4W4=;
        b=jvPyVEIY9mFgBfW7ZIYXTxKVStFpwFIwUMeP09doTCxGItt3GIWueUXv6Q2I7ogYOj
         Z0rqezBcNdKOdzsB82ht67j/kKmkmPvGi6AJ1yi4mtsoTFaSw8zqYDd/B6N2M2PynYef
         twuHqIrPGLUhVCu0ja19Z1Z+OEXwO4A6ZHZv3DrrGafs9DUWTAkNLVlw8Sw+VfdF3/RS
         MvbKaHTO6Dja9bfVOqhrWd/eydq6TIpl+fxwLGabNFHf98Bq0xQdyEv0qUiiNFKIYufu
         hkuJra+qfFMqj5+qp5I2/Ji0Qbkd7bS/cblSt57mO1G3Dqusi/ZTDMc9y821I5Rt7AEe
         Fb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CywcAAinSEu1DyxLKI+3INxS4+tuturMu+HNalww4W4=;
        b=3HOemnzbyNpAYDK2GTQXaE8nh8dQGdE/nLvldlC20ZjUTCdU5eW4TRboEU9LmkrQQz
         vmDdPGwqz66LL414dpTC9h3KbOCf+xbN8G1xc4auag8nMzf2q5qANL5EVpCOVBaqLnsR
         Nef0Y5ycaU9r7GvVyGKzGxMxZWAX99RW4KA5JbqQ0lpg2oiOEi4/4AVigwGWvoWYze45
         BxkUtgoS7rt+gkSGlguxmw30N2kEu63elX5hRHmkESjQ1f3uIGv4hW7OHghk+yOIJcnJ
         Ie425y0wiGBuFzk3X4xGWYlT3CZvip97Jkp6QE11/ApRTFpUO8bAmgbfmivOnKXtmZI8
         6fyQ==
X-Gm-Message-State: AJIora8pTMyxxq52xV7CpsrTFOQrvofBfs/rrbzAhfqaCaJP2hWRSDum
        8th+d7JEDTmJn4Fvi1hsCVSHhT+A9nAiog==
X-Google-Smtp-Source: AGRyM1vhjy6HO2xTq1+aIy15nBXzmgXOvVpjVoBkdJQt5UjpxLzAlFki71Uggc+84mNgr2/UQXLIiA==
X-Received: by 2002:a05:6512:1028:b0:47f:a07e:6e85 with SMTP id r8-20020a056512102800b0047fa07e6e85mr21738975lfr.294.1657014204740;
        Tue, 05 Jul 2022 02:43:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f7-20020a056512360700b00482f206b087sm491683lfs.39.2022.07.05.02.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 02:43:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 04/28] phy: qcom-qmp-pcie: split pcs_misc region for ipq6018 pcie gen3
Date:   Tue,  5 Jul 2022 12:42:56 +0300
Message-Id: <20220705094320.1313312-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220705094320.1313312-1-dmitry.baryshkov@linaro.org>
References: <20220705094320.1313312-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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
index 616be76f4ab0..d56357e2df4f 100644
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
@@ -1593,6 +1596,8 @@ static const struct qmp_phy_cfg ipq6018_pciephy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(ipq6018_pcie_rx_tbl),
 	.pcs_tbl		= ipq6018_pcie_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(ipq6018_pcie_pcs_tbl),
+	.pcs_misc_tbl		= ipq6018_pcie_pcs_misc_tbl,
+	.pcs_misc_tbl_num	= ARRAY_SIZE(ipq6018_pcie_pcs_misc_tbl),
 	.clk_list		= ipq8074_pciephy_clk_l,
 	.num_clks		= ARRAY_SIZE(ipq8074_pciephy_clk_l),
 	.reset_list		= ipq8074_pciephy_reset_l,
@@ -2374,6 +2379,10 @@ int qcom_qmp_phy_pcie_create(struct device *dev, struct device_node *np, int id,
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

