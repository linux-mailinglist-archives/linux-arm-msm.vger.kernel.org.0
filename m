Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBD9C546D06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 21:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350483AbiFJTKV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 15:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349911AbiFJTKQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 15:10:16 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24A0C635C
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:10:13 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id s10so101735ljh.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ccj6V6QGB2UfFukZSEFRfD15FtvXsbdPIyE/SsNZRzI=;
        b=g1TI68KUGFOJdqhB4h5Fi9dMlxE/bV/tjsP/Cl3s8jU3ssHvOUp8LWe30WZi2ZiUO3
         FOU53YNdOgwWuUuukaoxi0LiAj+v6W1WECTFjGczNNgv2E/in2kHWCgxEjc7mXMjsjIa
         +U7xpsttIotjFUGIgCAaroX9IOzWTJ0K9rNxa4cZ0vhXwT0+I+mU+dvh/Lbc+jrbrUMn
         CA/lt2qudGlPbwyRNANyu4jokKjQRyq0v4z79pLlM6h0AFNgS/k4FgmWOJcLWw7Xkzv5
         Rf2tdq3J3NvMWmyjKxDPD57U/ip5apn99w6hoT8QLhzVm8DXI7Zx2QDif4gt45Mdfc4v
         wRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ccj6V6QGB2UfFukZSEFRfD15FtvXsbdPIyE/SsNZRzI=;
        b=dzJQ8JYMaJbAvNw/Fa94TE3uBUd4/aUPsfa5s71PO82fSgauxnBbUxp0hqEb0iHcQn
         p0jUAe275m+3+q/VWaM/C3kiOOnXrHYMepJNwwhNWdSS3s6zfJrEwdUukLfGjoy9kr/f
         KEE0rF4u9zUXKLKxMpA9QYsVInJmaMXclk0k1KXqkFvMeeSL/nt1jhvE/3ee3GS3YI94
         WRI83onrF6Sa+nH6/qkPIkk5vKVnAeMTcdEsjptoGIIpZAm5GwlOtrDsxnkqzBXcgfLh
         scvIcWrE4pNec75DDCTAC+/T6dyozYXeHD97nbTgRcbDTg0Y0I8d+LMKcYHMUsmxKKud
         8qRw==
X-Gm-Message-State: AOAM532OH6cFlzl8FPM717+wm0TKT+knISeisTU5zcsPf0pIJJwV7ZNz
        aP1+zWha/fYZ7ilkJ6mQ9Dq5tw==
X-Google-Smtp-Source: ABdhPJyBPNCEPS3H1t8z9nZWRkqcYLhYXuKmpAumKkR6Zt0dd2g+QtGLCPLRbw/aKrlucN0p+rI29A==
X-Received: by 2002:a2e:934b:0:b0:24f:cce:5501 with SMTP id m11-20020a2e934b000000b0024f0cce5501mr64268868ljh.443.1654888212679;
        Fri, 10 Jun 2022 12:10:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h2-20020a2e9002000000b00253e1833e8bsm26614ljg.117.2022.06.10.12.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 12:10:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH 27/28] phy: qcom-qmp-usb: replace FLL layout writes for msm8996
Date:   Fri, 10 Jun 2022 22:09:24 +0300
Message-Id: <20220610190925.3670081-28-dmitry.baryshkov@linaro.org>
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
index 90a4bb8e86a4..5bbdf5675974 100644
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
index 5b3f612d1c2c..4d17169c5eb0 100644
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
index 98c6b5c8e2fc..da2e6fe1336f 100644
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

