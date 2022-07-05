Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7C9566668
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 11:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbiGEJnl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 05:43:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbiGEJnl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 05:43:41 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5DC925EA
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 02:43:39 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id t25so19600759lfg.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 02:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iGyDqd78yecegUSX/ayldySTMMUmKflthJqYkGSzxHo=;
        b=prjWTHqfk94IJ63eI8l0ZzZz5SkF7RWrFYDATXUqeP/E2bqwtBXsXCdvsO3AG9iXrB
         /8iGGkIXmbupD8vrkrBQWtGZOc6wyvFJvBl6MXeZWZVzPloEK3JquZbrKFofgMKlMJ90
         NO0Zl5/ibczC9GOi0e8YkUN3VRdTKGIiDlQfuUK0NGYfJRscHAMOeFbcXCCrWatndaEV
         1IeGzacUGm4P3NCNw3beRgT3hszXBnfJnNrkTDudqCu/cAGUvY6jj3F5oyqtoGOanEMU
         fBfMThHv6tdL79EDJ/qGr0alc9/i5HsWFyA8keVUORHnPZuczbORcBX6AGQqwX53qGr8
         T/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iGyDqd78yecegUSX/ayldySTMMUmKflthJqYkGSzxHo=;
        b=FCH2pzgzccSqi//2N8n6eEMVomiL99/vJ2roTPOXtaYhVnR30km8GVzB6T1GWndXnp
         Tt4Yc/rktJiVbROBD3pdYwYsWDzwgbvwc8Uu7piMBekqmMcppg5ybcTYi7dakytZmlmV
         ZMo71+Cf0NWs8q4vBUJSNcundTJdA2WxZJM57N7zfEsHLbM9M84UejpBXVz5g63+2IZ4
         2eDDKxGNI6JWooILNxQ9ASr+QkC4Hb2YFY/zDk/k9RCIR75W8+9+tlEkPwqSIIhvGh00
         cKbbw+o7N0XgXgVwDWE0IeRaBcwQhmOd+X3XM34pZijm9uugs4AyLMzauhPjODzrOp5U
         scNA==
X-Gm-Message-State: AJIora8Bob4m7a0Af8B0bL53iRHK5lE262UrgNPJgF1OxtBtZ/6uKGsQ
        ql0G0ygP/sDYhys05i1iHSYVDButHXJ4TQ==
X-Google-Smtp-Source: AGRyM1s9Y5jZ+nCAf20TRnEj2snM9NuMvCTKFhFiSntmTFLCa7uFukZEsX720MhSTZ946deEWwWvUA==
X-Received: by 2002:ac2:5bc1:0:b0:47f:7f73:53ee with SMTP id u1-20020ac25bc1000000b0047f7f7353eemr22592541lfn.311.1657014218166;
        Tue, 05 Jul 2022 02:43:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f7-20020a056512360700b00482f206b087sm491683lfs.39.2022.07.05.02.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 02:43:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 20/28] phy: qcom-qmp: split PCS_UFS V3 symbols to separate header
Date:   Tue,  5 Jul 2022 12:43:12 +0300
Message-Id: <20220705094320.1313312-21-dmitry.baryshkov@linaro.org>
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

Several registers defined in the PCS V3 namespace in reality belong to
the PCS_UFS V3 register space. Move them to the separate header and
rename them to explicitly mention PCS_UFS. While we are at it, correct
one register in the msm8998_usb3_pcs_tbl table to use PCS register name.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v3.h | 18 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v3.h     |  8 --------
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c        | 16 ++++++++--------
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c        |  2 +-
 drivers/phy/qualcomm/phy-qcom-qmp.h            |  1 +
 5 files changed, 28 insertions(+), 17 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v3.h

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v3.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v3.h
new file mode 100644
index 000000000000..ba1ea29d2884
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v3.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_UFS_V3_H_
+#define QCOM_PHY_QMP_PCS_UFS_V3_H_
+
+#define QPHY_V3_PCS_UFS_TX_LARGE_AMP_DRV_LVL		0x02c
+#define QPHY_V3_PCS_UFS_TX_SMALL_AMP_DRV_LVL		0x034
+#define QPHY_V3_PCS_UFS_RX_SYM_RESYNC_CTRL		0x134
+#define QPHY_V3_PCS_UFS_RX_MIN_HIBERN8_TIME		0x138
+#define QPHY_V3_PCS_UFS_RX_SIGDET_CTRL1			0x13c
+#define QPHY_V3_PCS_UFS_RX_SIGDET_CTRL2			0x140
+#define QPHY_V3_PCS_UFS_TX_MID_TERM_CTRL1		0x1bc
+#define QPHY_V3_PCS_UFS_MULTI_LANE_CTRL1		0x1c4
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v3.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v3.h
index 0b023df19126..ac13f2989a73 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v3.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v3.h
@@ -14,8 +14,6 @@
 #define QPHY_V3_PCS_TXMGN_V3				0x018
 #define QPHY_V3_PCS_TXMGN_V4				0x01c
 #define QPHY_V3_PCS_TXMGN_LS				0x020
-#define QPHY_V3_PCS_TX_LARGE_AMP_DRV_LVL		0x02c
-#define QPHY_V3_PCS_TX_SMALL_AMP_DRV_LVL		0x034
 #define QPHY_V3_PCS_TXDEEMPH_M6DB_V0			0x024
 #define QPHY_V3_PCS_TXDEEMPH_M3P5DB_V0			0x028
 #define QPHY_V3_PCS_TXDEEMPH_M6DB_V1			0x02c
@@ -53,15 +51,9 @@
 #define QPHY_V3_PCS_FLL_CNT_VAL_L			0x0cc
 #define QPHY_V3_PCS_FLL_CNT_VAL_H_TOL			0x0d0
 #define QPHY_V3_PCS_FLL_MAN_CODE			0x0d4
-#define QPHY_V3_PCS_RX_SYM_RESYNC_CTRL			0x134
-#define QPHY_V3_PCS_RX_MIN_HIBERN8_TIME			0x138
-#define QPHY_V3_PCS_RX_SIGDET_CTRL1			0x13c
-#define QPHY_V3_PCS_RX_SIGDET_CTRL2			0x140
 #define QPHY_V3_PCS_LP_WAKEUP_DLY_TIME_AUXCLK_MSB	0x1a8
 #define QPHY_V3_PCS_OSC_DTCT_ACTIONS			0x1ac
 #define QPHY_V3_PCS_SIGDET_CNTRL			0x1b0
-#define QPHY_V3_PCS_TX_MID_TERM_CTRL1			0x1bc
-#define QPHY_V3_PCS_MULTI_LANE_CTRL1			0x1c4
 #define QPHY_V3_PCS_RX_SIGDET_LVL			0x1d8
 #define QPHY_V3_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_LSB	0x1dc
 #define QPHY_V3_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_MSB	0x1e0
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index bfe5f562bcd0..701b03a13b17 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -389,14 +389,14 @@ static const struct qmp_phy_init_tbl sdm845_ufsphy_rx_tbl[] = {
 };
 
 static const struct qmp_phy_init_tbl sdm845_ufsphy_pcs_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_CTRL2, 0x6e),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TX_LARGE_AMP_DRV_LVL, 0x0a),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TX_SMALL_AMP_DRV_LVL, 0x02),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SYM_RESYNC_CTRL, 0x03),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TX_MID_TERM_CTRL1, 0x43),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_CTRL1, 0x0f),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_MIN_HIBERN8_TIME, 0x9a),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_MULTI_LANE_CTRL1, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_UFS_RX_SIGDET_CTRL2, 0x6e),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x0a),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_UFS_TX_SMALL_AMP_DRV_LVL, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_UFS_RX_SYM_RESYNC_CTRL, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_UFS_TX_MID_TERM_CTRL1, 0x43),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_UFS_RX_SIGDET_CTRL1, 0x0f),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_UFS_RX_MIN_HIBERN8_TIME, 0x9a),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_UFS_MULTI_LANE_CTRL1, 0x02),
 };
 
 static const struct qmp_phy_init_tbl sm8150_ufsphy_serdes_tbl[] = {
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 40ac61bcadac..aa7e193f2206 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -634,7 +634,7 @@ static const struct qmp_phy_init_tbl msm8998_usb3_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXMGN_LS, 0x6b),
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M6DB_V0, 0x15),
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M3P5DB_V0, 0x0d),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TX_LARGE_AMP_DRV_LVL, 0x15),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M6DB_V1, 0x15),
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M3P5DB_V1, 0x0d),
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M6DB_V2, 0x15),
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M3P5DB_V2, 0x0d),
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index cdbbcf6b5686..b139c8af5e8b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -26,6 +26,7 @@
 
 #include "phy-qcom-qmp-pcs-v3.h"
 #include "phy-qcom-qmp-pcs-misc-v3.h"
+#include "phy-qcom-qmp-pcs-ufs-v3.h"
 
 #include "phy-qcom-qmp-pcs-v4.h"
 #include "phy-qcom-qmp-pcs-pcie-v4.h"
-- 
2.35.1

