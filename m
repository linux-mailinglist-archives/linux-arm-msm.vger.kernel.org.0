Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3A9C5F0AAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 13:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231545AbiI3LiV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 07:38:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231538AbiI3Lhr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 07:37:47 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01AA9157B93
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 04:29:30 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id a10so4516688ljq.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 04:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=nSXV1yHLDAgStureWR7slbpjLByUEvjTF6GIuS9e+gM=;
        b=imBifdOy+V/FOVkAVeUs1lbVmHIG3eONjAqhrKD2DMS3Pv8bIbGj0cFSoFrtGaSZDo
         q/HBSjzwaMHH0ytreCHrlKG/Or5JV2I5NpvU889zuXn3Sljf/Y5JrRdgcNQKsnXgpcOq
         SOUIfGPYZ6ncGKeXGr/h3aWrJpJiOmGVEONF21QgkcPk2ohk/zn93sUPfNKS+yvxnzUM
         ra6DNCIlN/aahwmqit7OOo8KgPSvp20eT417u+p3ZQ35tWsqxHLPzjkcvaq4iOILB9Jr
         nkXuOopwgaIEyhdnMuDzm3MaOI2I2+R2Jd8/9vliuk8iVP7BQSR3vD5VE7MO5uTuspmU
         MSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=nSXV1yHLDAgStureWR7slbpjLByUEvjTF6GIuS9e+gM=;
        b=SpygxypZ5ALe6xtP55r308kTQR6ce2g2CXbzMGKkFZmPIdTAC2rTyF+c500XMvgJOk
         oWbd8B4hRYPaWWF7BifZzzbHqc6Pwd8lDkzSP67FsBo9HgDP3g5W6UxvrYQUtIqddZDT
         pmRJ3LViBvq/VTq/P7uI1KxI5PxSoCTboiWLgwsrMW1SacAYdaatjEa+rBYylO3zjShs
         RTzEPbiZC1uc0mXJlWe/xEqG3cEBSey2lkS5APGTRrnj7WGnuVLXwfUkjsuY0EExqcg8
         ITaKq9Q1FHYy82RxKvAj1MQfiSkC2eiHaDf+ug9TZHGzDaxEYoo6Lm1rlSKYYCNR3yBh
         U/UA==
X-Gm-Message-State: ACrzQf2LUPLd1/F67NW8W/uNIyG0jX8QUJZzF5hMdj8a98UOUTGAXOyV
        HxKjOr9nLUnaWB9sE/bY4Wm5eg==
X-Google-Smtp-Source: AMsMyM7VuDXqbJCSXBQJg42SaSJQVyiQRZ+1grr10QR8mGZYiyyrDbH4dPitEv2Iy0fJSaI1g4byaA==
X-Received: by 2002:a2e:958a:0:b0:26a:a393:4480 with SMTP id w10-20020a2e958a000000b0026aa3934480mr2673724ljh.490.1664537368587;
        Fri, 30 Sep 2022 04:29:28 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v18-20020a197412000000b0049493c14b17sm264672lfe.181.2022.09.30.04.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 04:29:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v2 01/12] phy: qcom-qmp-pcie: rework regs layout arrays
Date:   Fri, 30 Sep 2022 14:29:15 +0300
Message-Id: <20220930112926.638543-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930112926.638543-1-dmitry.baryshkov@linaro.org>
References: <20220930112926.638543-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use symbolic names for the values inside reg layout arrays.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c   | 32 +++++++++++-----------
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h |  4 +++
 2 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 985e81d276be..053e2574254b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -87,24 +87,24 @@ enum qphy_reg_layout {
 };
 
 static const unsigned int ipq_pciephy_gen3_regs_layout[QPHY_LAYOUT_SIZE] = {
-	[QPHY_SW_RESET]				= 0x00,
-	[QPHY_START_CTRL]			= 0x44,
-	[QPHY_PCS_STATUS]			= 0x14,
-	[QPHY_PCS_POWER_DOWN_CONTROL]		= 0x40,
+	[QPHY_SW_RESET]				= QPHY_V4_PCS_SW_RESET,
+	[QPHY_START_CTRL]			= QPHY_V4_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]			= QPHY_V4_PCS_PCS_STATUS1,
+	[QPHY_PCS_POWER_DOWN_CONTROL]		= QPHY_V4_PCS_POWER_DOWN_CONTROL,
 };
 
 static const unsigned int pciephy_regs_layout[QPHY_LAYOUT_SIZE] = {
-	[QPHY_SW_RESET]			= 0x00,
-	[QPHY_START_CTRL]		= 0x08,
-	[QPHY_PCS_STATUS]		= 0x174,
-	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x04,
+	[QPHY_SW_RESET]			= QPHY_V2_PCS_SW_RESET,
+	[QPHY_START_CTRL]		= QPHY_V2_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V2_PCS_PCI_PCS_STATUS,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V2_PCS_POWER_DOWN_CONTROL,
 };
 
 static const unsigned int sdm845_qmp_pciephy_regs_layout[QPHY_LAYOUT_SIZE] = {
-	[QPHY_SW_RESET]			= 0x00,
-	[QPHY_START_CTRL]		= 0x08,
-	[QPHY_PCS_STATUS]		= 0x174,
-	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x04,
+	[QPHY_SW_RESET]			= QPHY_V3_PCS_SW_RESET,
+	[QPHY_START_CTRL]		= QPHY_V3_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V3_PCS_PCS_STATUS,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V3_PCS_POWER_DOWN_CONTROL,
 };
 
 static const unsigned int sdm845_qhp_pciephy_regs_layout[QPHY_LAYOUT_SIZE] = {
@@ -115,10 +115,10 @@ static const unsigned int sdm845_qhp_pciephy_regs_layout[QPHY_LAYOUT_SIZE] = {
 };
 
 static const unsigned int sm8250_pcie_regs_layout[QPHY_LAYOUT_SIZE] = {
-	[QPHY_SW_RESET]			= 0x00,
-	[QPHY_START_CTRL]		= 0x44,
-	[QPHY_PCS_STATUS]		= 0x14,
-	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x40,
+	[QPHY_SW_RESET]			= QPHY_V4_PCS_SW_RESET,
+	[QPHY_START_CTRL]		= QPHY_V4_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V4_PCS_PCS_STATUS1,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V4_PCS_POWER_DOWN_CONTROL,
 };
 
 static const struct qmp_phy_init_tbl msm8998_pcie_serdes_tbl[] = {
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h
index c8515f506872..2624a1ec3e73 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h
@@ -7,7 +7,9 @@
 #define QCOM_PHY_QMP_PCS_V2_H_
 
 /* Only for QMP V2 PHY - PCS registers */
+#define QPHY_V2_PCS_SW_RESET				0x000
 #define QPHY_V2_PCS_POWER_DOWN_CONTROL			0x004
+#define QPHY_V2_PCS_START_CONTROL			0x008
 #define QPHY_V2_PCS_TXDEEMPH_M6DB_V0			0x024
 #define QPHY_V2_PCS_TXDEEMPH_M3P5DB_V0			0x028
 #define QPHY_V2_PCS_TX_LARGE_AMP_DRV_LVL		0x034
@@ -43,4 +45,6 @@
 #define QPHY_V2_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_LSB	0x1dc
 #define QPHY_V2_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_MSB	0x1e0
 
+#define QPHY_V2_PCS_PCI_PCS_STATUS			0x174 /* PCI */
+
 #endif
-- 
2.35.1

