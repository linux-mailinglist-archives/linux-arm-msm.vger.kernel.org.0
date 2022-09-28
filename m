Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD0FF5EE9F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 01:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233695AbiI1XKc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 19:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233739AbiI1XKZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 19:10:25 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D46820F52
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 16:10:23 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id a8so22520739lff.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 16:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=lM73YaOk7Ye2eNHUAiU/uaRTXDAevXaPiBfAgPfz7sU=;
        b=y+uWwj+0jX1TgKw4ywyRYuXYNPvfvS00oVZ2561jOjdbS5OP8vMLlFlwBVzRnRaWga
         BIvtO3ZLjD+ZJSFguqaHQQqo11ocY/Wy1VTjwlz/lSOCq0hMhxcBK29Uf6nx5IVNSgQU
         zjRZ/XZo6iMBoMWvvCxvM+FCY7hnb5eKjneDnDW0d4lLd7qKyerzrUdzdWLDy6Ivbvsc
         c+gw8rKpYd5eHZ8e3xonbjiVAEgYp0r1KTmdFS2MGrLtRyfvFRjYi5KPj4PExrsdt05y
         ISmtTGAQ2Ne5s4sIDfksFbEsCMMQ8WaNvVLF1nX9hb3OoKamTAk9KLDLYn07L+fZVCX5
         F0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=lM73YaOk7Ye2eNHUAiU/uaRTXDAevXaPiBfAgPfz7sU=;
        b=hJLwgxGHX+KDuJ9792usSvknxttRkDHybcDizswJYoqrsV/2m5i/UUlgMzm+lgtl9Z
         UudkAx38trDneQN4RPn4evo5n/9vgFKuWa/jX5pYHBP8UyomTb/fP81bXK1AVpQMK78i
         6ZqXO1+zxI0HIz33nqRH6hAnDbGFd26B52aOJrDW3zf/PwcoEYvdVWsnVSIF9WGTcjK0
         uxs01Zuk0PQAxIafLQ7YjYwVpUEgNBhWjrgva410PbzE32PLel8g/n/7VEZWERa9AkqD
         jKlAhwiqBIVebVHU2XjmSM7fUDekzO02i/e0QD6dryf0uejRfL2JFC3yYGg9iE86iCxB
         skKw==
X-Gm-Message-State: ACrzQf3q3IBJcJzGoafCXi6dmx1ipTBtFEAbKBdSlLAkIkOTmySXXgIS
        dGAVrseq8BM4liRqtMe7QrlSfQ==
X-Google-Smtp-Source: AMsMyM7aOo/mpjs+kCiTH5ywyIukeD8EngtQUJCy+8AN146MGB48Mz85Rxdw8AinpcgPvVxXNSTnFw==
X-Received: by 2002:ac2:4c50:0:b0:49a:3768:da81 with SMTP id o16-20020ac24c50000000b0049a3768da81mr106417lfk.247.1664406622925;
        Wed, 28 Sep 2022 16:10:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o16-20020ac24950000000b0049d5733fb3fsm597587lfi.212.2022.09.28.16.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 16:10:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 09/18] phy: qcom-qmp-ufs: split UFS-specific v2 PCS registers to a separate header
Date:   Thu, 29 Sep 2022 02:10:05 +0300
Message-Id: <20220928231014.455201-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928231014.455201-1-dmitry.baryshkov@linaro.org>
References: <20220928231014.455201-1-dmitry.baryshkov@linaro.org>
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

Follow other QMP headers, split and rename UFS-specific PCS registers to
ease comparing regs differences.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v2.h    | 20 +++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h    | 11 ----------
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 18 ++++++++---------
 drivers/phy/qualcomm/phy-qcom-qmp.h           |  1 +
 4 files changed, 30 insertions(+), 20 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v2.h

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v2.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v2.h
new file mode 100644
index 000000000000..af870669a904
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v2.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_UFS_V2_H_
+#define QCOM_PHY_QMP_PCS_UFS_V2_H_
+
+#define QPHY_V2_PCS_UFS_TX_LARGE_AMP_DRV_LVL		0x034
+#define QPHY_V2_PCS_UFS_TX_LARGE_AMP_POST_EMP_LVL	0x038
+#define QPHY_V2_PCS_UFS_TX_SMALL_AMP_DRV_LVL		0x03c
+#define QPHY_V2_PCS_UFS_TX_SMALL_AMP_POST_EMP_LVL	0x040
+
+#define QPHY_V2_PCS_UFS_RX_MIN_STALL_NOCONFIG_TIME_CAP	0x0cc
+#define QPHY_V2_PCS_UFS_RX_SYM_RESYNC_CTRL			0x13c
+#define QPHY_V2_PCS_UFS_RX_MIN_HIBERN8_TIME			0x140
+#define QPHY_V2_PCS_UFS_RX_SIGDET_CTRL2			0x148
+#define QPHY_V2_PCS_UFS_RX_PWM_GEAR_BAND			0x154
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h
index 2624a1ec3e73..431e9148b8d0 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h
@@ -12,10 +12,6 @@
 #define QPHY_V2_PCS_START_CONTROL			0x008
 #define QPHY_V2_PCS_TXDEEMPH_M6DB_V0			0x024
 #define QPHY_V2_PCS_TXDEEMPH_M3P5DB_V0			0x028
-#define QPHY_V2_PCS_TX_LARGE_AMP_DRV_LVL		0x034
-#define QPHY_V2_PCS_TX_LARGE_AMP_POST_EMP_LVL		0x038
-#define QPHY_V2_PCS_TX_SMALL_AMP_DRV_LVL		0x03c
-#define QPHY_V2_PCS_TX_SMALL_AMP_POST_EMP_LVL		0x040
 #define QPHY_V2_PCS_ENDPOINT_REFCLK_DRIVE		0x054
 #define QPHY_V2_PCS_RX_IDLE_DTCT_CNTRL			0x058
 #define QPHY_V2_PCS_POWER_STATE_CONFIG1			0x060
@@ -32,13 +28,6 @@
 #define QPHY_V2_PCS_FLL_CNT_VAL_L			0x0c8
 #define QPHY_V2_PCS_FLL_CNT_VAL_H_TOL			0x0cc
 #define QPHY_V2_PCS_FLL_MAN_CODE			0x0d0
-
-/* UFS only ? */
-#define QPHY_V2_PCS_RX_MIN_STALL_NOCONFIG_TIME_CAP	0x0cc
-#define QPHY_V2_PCS_RX_SYM_RESYNC_CTRL			0x13c
-#define QPHY_V2_PCS_RX_MIN_HIBERN8_TIME			0x140
-#define QPHY_V2_PCS_RX_SIGDET_CTRL2			0x148
-#define QPHY_V2_PCS_RX_PWM_GEAR_BAND			0x154
 #define QPHY_V2_PCS_PLL_LOCK_CHK_DLY_TIME_AUXCLK_LSB	0x1a8
 #define QPHY_V2_PCS_OSC_DTCT_ACTIONS			0x1ac
 #define QPHY_V2_PCS_RX_SIGDET_LVL			0x1d8
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 738ec1e49ec6..e9c04b88f541 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -259,15 +259,15 @@ static const struct qmp_phy_init_tbl sm6115_ufsphy_rx_tbl[] = {
 };
 
 static const struct qmp_phy_init_tbl sm6115_ufsphy_pcs_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_V2_PCS_RX_PWM_GEAR_BAND, 0x15),
-	QMP_PHY_INIT_CFG(QPHY_V2_PCS_RX_SIGDET_CTRL2, 0x6d),
-	QMP_PHY_INIT_CFG(QPHY_V2_PCS_TX_LARGE_AMP_DRV_LVL, 0x0f),
-	QMP_PHY_INIT_CFG(QPHY_V2_PCS_TX_SMALL_AMP_DRV_LVL, 0x02),
-	QMP_PHY_INIT_CFG(QPHY_V2_PCS_RX_MIN_STALL_NOCONFIG_TIME_CAP, 0x28),
-	QMP_PHY_INIT_CFG(QPHY_V2_PCS_RX_SYM_RESYNC_CTRL, 0x03),
-	QMP_PHY_INIT_CFG(QPHY_V2_PCS_TX_LARGE_AMP_POST_EMP_LVL, 0x12),
-	QMP_PHY_INIT_CFG(QPHY_V2_PCS_TX_SMALL_AMP_POST_EMP_LVL, 0x0f),
-	QMP_PHY_INIT_CFG(QPHY_V2_PCS_RX_MIN_HIBERN8_TIME, 0x9a), /* 8 us */
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_UFS_RX_PWM_GEAR_BAND, 0x15),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_UFS_RX_SIGDET_CTRL2, 0x6d),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x0f),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_UFS_TX_SMALL_AMP_DRV_LVL, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_UFS_RX_MIN_STALL_NOCONFIG_TIME_CAP, 0x28),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_UFS_RX_SYM_RESYNC_CTRL, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_UFS_TX_LARGE_AMP_POST_EMP_LVL, 0x12),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_UFS_TX_SMALL_AMP_POST_EMP_LVL, 0x0f),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_UFS_RX_MIN_HIBERN8_TIME, 0x9a), /* 8 us */
 };
 
 static const struct qmp_phy_init_tbl sdm845_ufsphy_serdes_tbl[] = {
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 26274e3c0cf9..e6f327acbf19 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -24,6 +24,7 @@
 #include "phy-qcom-qmp-qserdes-pll.h"
 
 #include "phy-qcom-qmp-pcs-v2.h"
+#include "phy-qcom-qmp-pcs-ufs-v2.h"
 
 #include "phy-qcom-qmp-pcs-v3.h"
 #include "phy-qcom-qmp-pcs-misc-v3.h"
-- 
2.35.1

