Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB36624A8C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 20:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbiKJTWz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 14:22:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbiKJTWy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 14:22:54 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A3424385A
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 11:22:53 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id u11so2072050ljk.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 11:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MfHFl5+9oIb/dyhvDMfo1zDB+ckrHol7IiWxVPsX08=;
        b=tgLzPj+IYlTKIrVvOpxTHHbhUcNUwXijR3/SJfroscCNy0N9PbXO7hDJlhg/QBZBJk
         VUFz3PqQnigOL+vCrZ1BRLq9AvQxTi/SX/qVofVJMwU9AATm3PMlBJ37iGmlI2Z3mtZA
         Fg95toBl/t8H4Fy1UXx2rG0yeOwugQtNs0xLHVb0EOEnmGfWaEDItscqez4TqNqHZX78
         sOSWiBwZOgDZMK/rqcdnqf6fJqMhGvU0CnV/5EJcrOy8IkP08gA4SetEsOdQljj6YBzk
         y5pQdM3ulNvZxEFrV87aIQiHrIppVg8gDnBP8HexV98ml4l1r+wbe5gp0i4E2UkZ32UX
         jtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3MfHFl5+9oIb/dyhvDMfo1zDB+ckrHol7IiWxVPsX08=;
        b=SsIf6SCf+aNyi5xV95/OBNEQyQCzJG+OMbZYR6yVjBuPawWWFFrB4wEj4c96moxlsO
         2QkXhkF0T578yJuUcyN7lsXBrpbnDkImSG3efKp483Hj6WX69lwLmXQWazjZsqU7k7dy
         DpmpqSENtX7NYWyAfoxvwXPmRC0PlWxpoMr19g5fx1HAdtV/UlcBG7nAPJZ5xuuVLQKB
         Tvt+dQPDGbGNf7j7fft3J+fbZSh30OUPCl4aoqScox4BZzR4Vjgd5eLUt3jV6GghyFzB
         UhtIe7RbBkRQKkOjCymI7SI7td1PksKJbKsaOdcSPNfA+Jd5eOlglWTFRcthDOhJZ3ci
         7ljw==
X-Gm-Message-State: ACrzQf0mHsUmODAmNE8AsXl9DGzTeZMDdGvA8f2ATckGF9NxqvgiqLgS
        F5A+dUYmfMaW0b6fVHk2WMkDDA==
X-Google-Smtp-Source: AMsMyM4wTvoQO1C+IVec0e6vFvBYZQTDcCQwCyuIt5m9rXKfIHcA+NBp0E/IGWj1qjQVwMvwTJEzog==
X-Received: by 2002:a2e:8e90:0:b0:277:4145:8205 with SMTP id z16-20020a2e8e90000000b0027741458205mr9041688ljk.50.1668108171559;
        Thu, 10 Nov 2022 11:22:51 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h8-20020a05651c124800b0027758f0619fsm40345ljh.132.2022.11.10.11.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 11:22:51 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v3 03/13] phy: qcom-qmp-pcie: rework regs layout arrays
Date:   Thu, 10 Nov 2022 22:22:38 +0300
Message-Id: <20221110192248.873973-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221110192248.873973-1-dmitry.baryshkov@linaro.org>
References: <20221110192248.873973-1-dmitry.baryshkov@linaro.org>
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
index 8fa66458c259..7de0ac23ff0b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -77,24 +77,24 @@ enum qphy_reg_layout {
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
@@ -105,10 +105,10 @@ static const unsigned int sdm845_qhp_pciephy_regs_layout[QPHY_LAYOUT_SIZE] = {
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

