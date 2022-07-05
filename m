Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D66E566671
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 11:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiGEJny (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 05:43:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230404AbiGEJnt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 05:43:49 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79EEB25DB
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 02:43:45 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id l7so13064447ljj.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 02:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r40O6REgM4H+xDkzuTHsv/xRso8J5tjXKsdP8vEmFGA=;
        b=UPADZUSSp9NYZUnWo3/vOt3diwXiegfbIVCz4XFyYNek71jRBwAnTeLB3U/ykjg495
         6ASimyuWLXR++OkZIxXhTFCwbc8sshRpYdCbgpnbt9MjzJMntpxfHPgfD9sOYCmQ6wKU
         oYYRJTaiRhkbJliTxm7NiURciMELHQRZSJTLWwL5t2bNQLee028WpmtGbqiNxq27l+NA
         9PmeIOnV/tBYYjLxsTlDuaUqSOhCBAxQ8PFnZNz5E0CBZkMddzPEc3MmxuX97F9qpwzY
         cnMedtdvhq8QpZ3oQkKvt0uEc9cPkK0J6RPIrDlAv8eCoDix9swPSOxKBm4/tVNnw9bj
         FI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r40O6REgM4H+xDkzuTHsv/xRso8J5tjXKsdP8vEmFGA=;
        b=4oA73y0BlZr/icQcrZdZmzMCTphQK2n32CRykKujfYcsSDX9yuG2WxXu0KVA5hM//H
         mWAdzPmdtOpO+ca2CrYm/z6755LD4THE2CZ+9yo6jKBi1dzzv07xMvLvILhE85iXEMcU
         EBz97bLIY+focs87HuKOYuAfZ26mE82ghJr53vZdlZoe5bahLHHzUSbi2s+GiKmmQqt0
         Ncm9fb+ym6AmAsstLtknl2ofSiEvHJYtlHJS/YPwNGPj1kooDrO0BUOdigi3a6ahp+0E
         Xfow8M+Fv7E9aXEvQAMpqqgE5mEaDCUHhydyYqGrkNvNcgF5jOz0/AR7j6YJlv9dZYGi
         tXRA==
X-Gm-Message-State: AJIora9/NcVSxi8Fn3m8Nt9TNWwss7r2R1FNSOnQxUruBjfX5X7+PaXu
        i4hoJGkE1UXqTJiumrk763XSRA==
X-Google-Smtp-Source: AGRyM1vqo8NHOykUwtBSlALcOjZguUjofZb0obWika6f0RP6QzX1iMFQTWeiDVIDobmE22bSaYC7GA==
X-Received: by 2002:a2e:92c6:0:b0:255:84cb:4eea with SMTP id k6-20020a2e92c6000000b0025584cb4eeamr18611013ljh.204.1657014223877;
        Tue, 05 Jul 2022 02:43:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f7-20020a056512360700b00482f206b087sm491683lfs.39.2022.07.05.02.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 02:43:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 27/28] phy: qcom-qmp-usb: replace FLL layout writes for msm8996
Date:   Tue,  5 Jul 2022 12:43:19 +0300
Message-Id: <20220705094320.1313312-28-dmitry.baryshkov@linaro.org>
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

Other PHYs tables directly reference FLL registers without using
reglayout. Define corresponding registers to be used by msm8996 PHY
tables and use them directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     |  5 -----
 .../phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c  | 10 ----------
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 10 ----------
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h    |  7 +++++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       |  5 -----
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       | 20 +++++--------------
 6 files changed, 12 insertions(+), 45 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 2335658affdb..3f2c89ffee21 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -122,11 +122,6 @@ enum qphy_reg_layout {
 	QPHY_COM_PCS_READY_STATUS,
 	/* PCS registers */
 	QPHY_PLL_LOCK_CHK_DLY_TIME,
-	QPHY_FLL_CNTRL1,
-	QPHY_FLL_CNTRL2,
-	QPHY_FLL_CNT_VAL_L,
-	QPHY_FLL_CNT_VAL_H_TOL,
-	QPHY_FLL_MAN_CODE,
 	QPHY_SW_RESET,
 	QPHY_START_CTRL,
 	QPHY_PCS_READY_STATUS,
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
index 4b6ddc7ec862..4517f05fe45f 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
@@ -122,11 +122,6 @@ enum qphy_reg_layout {
 	QPHY_COM_PCS_READY_STATUS,
 	/* PCS registers */
 	QPHY_PLL_LOCK_CHK_DLY_TIME,
-	QPHY_FLL_CNTRL1,
-	QPHY_FLL_CNTRL2,
-	QPHY_FLL_CNT_VAL_L,
-	QPHY_FLL_CNT_VAL_H_TOL,
-	QPHY_FLL_MAN_CODE,
 	QPHY_SW_RESET,
 	QPHY_START_CTRL,
 	QPHY_PCS_READY_STATUS,
@@ -147,11 +142,6 @@ static const unsigned int pciephy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_COM_START_CONTROL]	= 0x408,
 	[QPHY_COM_PCS_READY_STATUS]	= 0x448,
 	[QPHY_PLL_LOCK_CHK_DLY_TIME]	= 0xa8,
-	[QPHY_FLL_CNTRL1]		= 0xc4,
-	[QPHY_FLL_CNTRL2]		= 0xc8,
-	[QPHY_FLL_CNT_VAL_L]		= 0xcc,
-	[QPHY_FLL_CNT_VAL_H_TOL]	= 0xd0,
-	[QPHY_FLL_MAN_CODE]		= 0xd4,
 	[QPHY_SW_RESET]			= 0x00,
 	[QPHY_START_CTRL]		= 0x08,
 	[QPHY_PCS_STATUS]		= 0x174,
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index fb41c90ed96a..59ba40c39ab3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -122,11 +122,6 @@ enum qphy_reg_layout {
 	QPHY_COM_PCS_READY_STATUS,
 	/* PCS registers */
 	QPHY_PLL_LOCK_CHK_DLY_TIME,
-	QPHY_FLL_CNTRL1,
-	QPHY_FLL_CNTRL2,
-	QPHY_FLL_CNT_VAL_L,
-	QPHY_FLL_CNT_VAL_H_TOL,
-	QPHY_FLL_MAN_CODE,
 	QPHY_SW_RESET,
 	QPHY_START_CTRL,
 	QPHY_PCS_READY_STATUS,
@@ -154,11 +149,6 @@ static const unsigned int pciephy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_COM_START_CONTROL]	= 0x408,
 	[QPHY_COM_PCS_READY_STATUS]	= 0x448,
 	[QPHY_PLL_LOCK_CHK_DLY_TIME]	= 0xa8,
-	[QPHY_FLL_CNTRL1]		= 0xc4,
-	[QPHY_FLL_CNTRL2]		= 0xc8,
-	[QPHY_FLL_CNT_VAL_L]		= 0xcc,
-	[QPHY_FLL_CNT_VAL_H_TOL]	= 0xd0,
-	[QPHY_FLL_MAN_CODE]		= 0xd4,
 	[QPHY_SW_RESET]			= 0x00,
 	[QPHY_START_CTRL]		= 0x08,
 	[QPHY_PCS_STATUS]		= 0x174,
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h
index 3fc3c0562d16..9593277cbd3a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h
@@ -24,6 +24,13 @@
 #define QPHY_V2_PCS_LOCK_DETECT_CONFIG3			0x088
 #define QPHY_V2_PCS_PWRUP_RESET_DLY_TIME_AUXCLK		0x0a0
 #define QPHY_V2_PCS_LP_WAKEUP_DLY_TIME_AUXCLK		0x0a4
+#define QPHY_V2_PCS_FLL_CNTRL1				0x0c0
+#define QPHY_V2_PCS_FLL_CNTRL2				0x0c4
+#define QPHY_V2_PCS_FLL_CNT_VAL_L			0x0c8
+#define QPHY_V2_PCS_FLL_CNT_VAL_H_TOL			0x0cc
+#define QPHY_V2_PCS_FLL_MAN_CODE			0x0d0
+
+/* UFS only ? */
 #define QPHY_V2_PCS_RX_MIN_STALL_NOCONFIG_TIME_CAP	0x0cc
 #define QPHY_V2_PCS_RX_SYM_RESYNC_CTRL			0x13c
 #define QPHY_V2_PCS_RX_MIN_HIBERN8_TIME			0x140
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 701b03a13b17..7ab129cd739b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -122,11 +122,6 @@ enum qphy_reg_layout {
 	QPHY_COM_PCS_READY_STATUS,
 	/* PCS registers */
 	QPHY_PLL_LOCK_CHK_DLY_TIME,
-	QPHY_FLL_CNTRL1,
-	QPHY_FLL_CNTRL2,
-	QPHY_FLL_CNT_VAL_L,
-	QPHY_FLL_CNT_VAL_H_TOL,
-	QPHY_FLL_MAN_CODE,
 	QPHY_SW_RESET,
 	QPHY_START_CTRL,
 	QPHY_PCS_READY_STATUS,
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index aa7e193f2206..ff1e10bfdea3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -122,11 +122,6 @@ enum qphy_reg_layout {
 	QPHY_COM_PCS_READY_STATUS,
 	/* PCS registers */
 	QPHY_PLL_LOCK_CHK_DLY_TIME,
-	QPHY_FLL_CNTRL1,
-	QPHY_FLL_CNTRL2,
-	QPHY_FLL_CNT_VAL_L,
-	QPHY_FLL_CNT_VAL_H_TOL,
-	QPHY_FLL_MAN_CODE,
 	QPHY_SW_RESET,
 	QPHY_START_CTRL,
 	QPHY_PCS_READY_STATUS,
@@ -142,11 +137,6 @@ enum qphy_reg_layout {
 };
 
 static const unsigned int usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
-	[QPHY_FLL_CNTRL1]		= 0xc0,
-	[QPHY_FLL_CNTRL2]		= 0xc4,
-	[QPHY_FLL_CNT_VAL_L]		= 0xc8,
-	[QPHY_FLL_CNT_VAL_H_TOL]	= 0xcc,
-	[QPHY_FLL_MAN_CODE]		= 0xd0,
 	[QPHY_SW_RESET]			= 0x00,
 	[QPHY_START_CTRL]		= 0x08,
 	[QPHY_PCS_STATUS]		= 0x17c,
@@ -318,11 +308,11 @@ static const struct qmp_phy_init_tbl msm8996_usb3_rx_tbl[] = {
 
 static const struct qmp_phy_init_tbl msm8996_usb3_pcs_tbl[] = {
 	/* FLL settings */
-	QMP_PHY_INIT_CFG_L(QPHY_FLL_CNTRL2, 0x03),
-	QMP_PHY_INIT_CFG_L(QPHY_FLL_CNTRL1, 0x02),
-	QMP_PHY_INIT_CFG_L(QPHY_FLL_CNT_VAL_L, 0x09),
-	QMP_PHY_INIT_CFG_L(QPHY_FLL_CNT_VAL_H_TOL, 0x42),
-	QMP_PHY_INIT_CFG_L(QPHY_FLL_MAN_CODE, 0x85),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_FLL_CNTRL2, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_FLL_CNTRL1, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_FLL_CNT_VAL_L, 0x09),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_FLL_CNT_VAL_H_TOL, 0x42),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_FLL_MAN_CODE, 0x85),
 
 	/* Lock Det settings */
 	QMP_PHY_INIT_CFG(QPHY_V2_PCS_LOCK_DETECT_CONFIG1, 0xd1),
-- 
2.35.1

