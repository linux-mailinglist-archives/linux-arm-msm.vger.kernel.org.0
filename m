Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B705E546D02
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 21:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349828AbiFJTKY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 15:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350377AbiFJTKR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 15:10:17 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D7A027149
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:10:15 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id a2so38126227lfg.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Szh/+Z07IcI8jfTvNDAfVavpgzjdHsWyTBhrJ2UqT74=;
        b=RHGV8MT9/OpqxBT9IWvbDXMMShBTtD5sp07tO6+NtDd6A8BVlUaJbDA98a3P2tfJ6R
         PAiMQU7VNQOXaM34IZLYE05MKmCqsMfqwLi7WB3n1UQETC94NXxvVOFFhXd/1BmFnk9B
         RFJV7Z8UuSzn3uDs6QYKEVPr483bLl3f4QU/lNcuCJw+Av3RZRVIclWGaGA+f6o8JF5k
         ND1tYPyE5kYJFM5wPQNnZ/g1fpSGQDR/zEStpWOFIqYjdE/CWbd5wmyFkDjrUAEWM4Wp
         SY66zVmQQaycDprflUjyYjD1RH72UMbJZ0ER9K9AT6s96adMMSfKhGIM+8PVc4NcAdEn
         G1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Szh/+Z07IcI8jfTvNDAfVavpgzjdHsWyTBhrJ2UqT74=;
        b=B0XlGrz3cUI3xbI+RkiERoNl38AacgAFWFqfA4pPwrzg843nb+mqdELLv1ELomLrcO
         2p1mpPGUSwDuQKqcMIXkqQMJuiHC/GmNvBg8wUMrWBEhberXaLsbiQvxIKOQiWktoKP2
         PZVrdR/fBrbRUd9IwyKRxi4adokJpvMGLoYh4TQ142UsQinsAA6MCeGQcjQ+/h8jfRCB
         FI6EjnqdDQXa+4Y3+c6YY1J/IR8yToM3jp9b7MA7v5+F+8uOzE/0JbdKQ7AT3matYATN
         LO6lzfNDz6EHPSg6txO9b8ZIDUXV5inlQ+HqNS+Q8SauDyWIHK2unV+8jSRhHWLw76Gr
         43FQ==
X-Gm-Message-State: AOAM531RqO/maEmJ6yBVHtGZbKqzhiuVJHCeSSCOUWbLPE0j8XKG0E9C
        sCRBgw+sV43UWvH5k/Nsd8dSng==
X-Google-Smtp-Source: ABdhPJwSFeA6BVoOI77Z7D3RC6XAv7DQKyRMxQWmkv0x5aUooMSI3/hLsriInMpvKsT2kDzTqNrGOQ==
X-Received: by 2002:a05:6512:228a:b0:479:4a8b:f2e1 with SMTP id f10-20020a056512228a00b004794a8bf2e1mr16461358lfu.256.1654888213866;
        Fri, 10 Jun 2022 12:10:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h2-20020a2e9002000000b00253e1833e8bsm26614ljg.117.2022.06.10.12.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 12:10:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH 28/28] phy: qcom-qmp-usb: define QPHY_V2_PCS_PLL_LOCK_CHK_DLY_TIME register
Date:   Fri, 10 Jun 2022 22:09:25 +0300
Message-Id: <20220610190925.3670081-29-dmitry.baryshkov@linaro.org>
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

Other PHYs tables directly reference QPHY_PLL_LOCK_CHK_DLY_TIME register
without using reglayout. Define corresponding register to be used by
msm8996 PHY tables and use it directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c        | 1 -
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c | 4 +---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c         | 4 +---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h       | 1 +
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c          | 1 -
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c          | 1 -
 6 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 3f2c89ffee21..01e1d3f7538b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -121,7 +121,6 @@ enum qphy_reg_layout {
 	QPHY_COM_START_CONTROL,
 	QPHY_COM_PCS_READY_STATUS,
 	/* PCS registers */
-	QPHY_PLL_LOCK_CHK_DLY_TIME,
 	QPHY_SW_RESET,
 	QPHY_START_CTRL,
 	QPHY_PCS_READY_STATUS,
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
index 5bbdf5675974..76afe55db7cc 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
@@ -121,7 +121,6 @@ enum qphy_reg_layout {
 	QPHY_COM_START_CONTROL,
 	QPHY_COM_PCS_READY_STATUS,
 	/* PCS registers */
-	QPHY_PLL_LOCK_CHK_DLY_TIME,
 	QPHY_SW_RESET,
 	QPHY_START_CTRL,
 	QPHY_PCS_READY_STATUS,
@@ -141,7 +140,6 @@ static const unsigned int pciephy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_COM_POWER_DOWN_CONTROL]	= 0x404,
 	[QPHY_COM_START_CONTROL]	= 0x408,
 	[QPHY_COM_PCS_READY_STATUS]	= 0x448,
-	[QPHY_PLL_LOCK_CHK_DLY_TIME]	= 0xa8,
 	[QPHY_SW_RESET]			= 0x00,
 	[QPHY_START_CTRL]		= 0x08,
 	[QPHY_PCS_STATUS]		= 0x174,
@@ -216,7 +214,7 @@ static const struct qmp_phy_init_tbl msm8996_pcie_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V2_PCS_PWRUP_RESET_DLY_TIME_AUXCLK, 0x00),
 	QMP_PHY_INIT_CFG(QPHY_V2_PCS_LP_WAKEUP_DLY_TIME_AUXCLK, 0x01),
 
-	QMP_PHY_INIT_CFG_L(QPHY_PLL_LOCK_CHK_DLY_TIME, 0x05),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_PLL_LOCK_CHK_DLY_TIME, 0x05),
 
 	QMP_PHY_INIT_CFG(QPHY_V2_PCS_ENDPOINT_REFCLK_DRIVE, 0x05),
 	QMP_PHY_INIT_CFG(QPHY_V2_PCS_POWER_DOWN_CONTROL, 0x02),
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 4d17169c5eb0..5b222bd17611 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -121,7 +121,6 @@ enum qphy_reg_layout {
 	QPHY_COM_START_CONTROL,
 	QPHY_COM_PCS_READY_STATUS,
 	/* PCS registers */
-	QPHY_PLL_LOCK_CHK_DLY_TIME,
 	QPHY_SW_RESET,
 	QPHY_START_CTRL,
 	QPHY_PCS_READY_STATUS,
@@ -148,7 +147,6 @@ static const unsigned int pciephy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_COM_POWER_DOWN_CONTROL]	= 0x404,
 	[QPHY_COM_START_CONTROL]	= 0x408,
 	[QPHY_COM_PCS_READY_STATUS]	= 0x448,
-	[QPHY_PLL_LOCK_CHK_DLY_TIME]	= 0xa8,
 	[QPHY_SW_RESET]			= 0x00,
 	[QPHY_START_CTRL]		= 0x08,
 	[QPHY_PCS_STATUS]		= 0x174,
@@ -435,7 +433,7 @@ static const struct qmp_phy_init_tbl ipq8074_pcie_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V2_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_LSB, 0x40),
 	QMP_PHY_INIT_CFG(QPHY_V2_PCS_PLL_LOCK_CHK_DLY_TIME_AUXCLK_LSB, 0x0),
 	QMP_PHY_INIT_CFG(QPHY_V2_PCS_LP_WAKEUP_DLY_TIME_AUXCLK, 0x40),
-	QMP_PHY_INIT_CFG_L(QPHY_PLL_LOCK_CHK_DLY_TIME, 0x73),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_PLL_LOCK_CHK_DLY_TIME, 0x73),
 	QMP_PHY_INIT_CFG(QPHY_V2_PCS_RX_SIGDET_LVL, 0x99),
 	QMP_PHY_INIT_CFG(QPHY_V2_PCS_TXDEEMPH_M6DB_V0, 0x15),
 	QMP_PHY_INIT_CFG(QPHY_V2_PCS_TXDEEMPH_M3P5DB_V0, 0xe),
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h
index 9593277cbd3a..c8515f506872 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h
@@ -24,6 +24,7 @@
 #define QPHY_V2_PCS_LOCK_DETECT_CONFIG3			0x088
 #define QPHY_V2_PCS_PWRUP_RESET_DLY_TIME_AUXCLK		0x0a0
 #define QPHY_V2_PCS_LP_WAKEUP_DLY_TIME_AUXCLK		0x0a4
+#define QPHY_V2_PCS_PLL_LOCK_CHK_DLY_TIME		0x0a8
 #define QPHY_V2_PCS_FLL_CNTRL1				0x0c0
 #define QPHY_V2_PCS_FLL_CNTRL2				0x0c4
 #define QPHY_V2_PCS_FLL_CNT_VAL_L			0x0c8
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 7ab129cd739b..c8583f5a54bd 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -121,7 +121,6 @@ enum qphy_reg_layout {
 	QPHY_COM_START_CONTROL,
 	QPHY_COM_PCS_READY_STATUS,
 	/* PCS registers */
-	QPHY_PLL_LOCK_CHK_DLY_TIME,
 	QPHY_SW_RESET,
 	QPHY_START_CTRL,
 	QPHY_PCS_READY_STATUS,
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index da2e6fe1336f..c54df83637b1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -121,7 +121,6 @@ enum qphy_reg_layout {
 	QPHY_COM_START_CONTROL,
 	QPHY_COM_PCS_READY_STATUS,
 	/* PCS registers */
-	QPHY_PLL_LOCK_CHK_DLY_TIME,
 	QPHY_SW_RESET,
 	QPHY_START_CTRL,
 	QPHY_PCS_READY_STATUS,
-- 
2.35.1

