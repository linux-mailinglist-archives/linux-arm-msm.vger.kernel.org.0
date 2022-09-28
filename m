Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 655DA5EE9F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 01:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234109AbiI1XKf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 19:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234014AbiI1XK0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 19:10:26 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5261547B85
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 16:10:25 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id o2so22518316lfc.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 16:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=XDcCF1vrlBnm4gVS8t+NWQ6J4+E2G+Ecc89KIMSAhA0=;
        b=gt2KILkcEcRcINZ/FaK4j+vJnyyAZ859UHbzVd0NoqYzJhmUIRpE/F/U9AhJvC48A0
         r2rcobBAQ49Ne/H6KpL8azRZXupuJijgQnTbJ1bgaDXdMcd5qyhYojVjM4OJQGTiBPKM
         c9baxPTY34cHmBwY9ggwgNufspSlDG7GtHzr2q+/BWeQq4oy8ti4Y+3KjOlNbQRaMmQu
         NowIqowZ0oARD8icHI7lieH2jJi3ueFFyjhzuToBtVgvwbq5jYAN2qM6vGdWBdX3r61P
         pB3m58TQZHwaA6J2zvJViLsZa0d4ltkb4nkNixKgjUfqwqG6ceV9UxlqYu7CMAIPU5nk
         L3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=XDcCF1vrlBnm4gVS8t+NWQ6J4+E2G+Ecc89KIMSAhA0=;
        b=77NTuGiSYTJZMJOEA2IQBwUnwYuDClr/2PrQ6RvadqrutaXus9dTYBjt8FkH4IwONI
         xJhxu1sqz3RQCxfLYTScfWz2+TyBYRgf3tDr3uyNQ/Xi8HS/E3V0BnuaQFw2fQjYESCd
         6eDeb0hlLRP9mZ3FM+ZNk6Evrcb76ljTXz+Uh9KxGA6J28FyPJxyMRa7rzDuKliThO/K
         QsqOO/oXL6CWsO3Ax0BciOhUvCA+v1rp2c2Ud3YSalT4YEog9I/RbhWcKWe2PozqV/xe
         sx6i58c6EjG4X/6ljhZ23HVXS2jvUY+zTcnZqJRoKyEO1ISAHZbga4iQigJ8UOqN5xpg
         0G1A==
X-Gm-Message-State: ACrzQf1BcuN4nuAXs3e0pXM6J4Xi5xxDK5VcxYvnGFDcqrmiwM6pACYB
        nSJrKogP2xF56bijP3ArgVqFMA==
X-Google-Smtp-Source: AMsMyM5HAKuCjX4+5veSvat/rc9xwACD6O5QzNCoJ225l4mKWRF3fycDoanN4lSpL274SjWlN8BXAA==
X-Received: by 2002:a05:6512:33c6:b0:497:9df1:a25a with SMTP id d6-20020a05651233c600b004979df1a25amr109821lfg.562.1664406623684;
        Wed, 28 Sep 2022 16:10:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o16-20020ac24950000000b0049d5733fb3fsm597587lfi.212.2022.09.28.16.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 16:10:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 10/18] phy: qcom-qmp-ufs: rework regs layout arrays
Date:   Thu, 29 Sep 2022 02:10:06 +0300
Message-Id: <20220928231014.455201-11-dmitry.baryshkov@linaro.org>
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

Use symbolic names for the values inside reg layout arrays. New register
names are added following the PCS register layout that is used by the
particular PHY.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v2.h |  5 +++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v3.h |  3 +++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c        | 18 +++++++++---------
 3 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v2.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v2.h
index af870669a904..a0803a8783d2 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v2.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v2.h
@@ -6,6 +6,9 @@
 #ifndef QCOM_PHY_QMP_PCS_UFS_V2_H_
 #define QCOM_PHY_QMP_PCS_UFS_V2_H_
 
+#define QPHY_V2_PCS_UFS_PHY_START			0x000
+#define QPHY_V2_PCS_UFS_POWER_DOWN_CONTROL		0x004
+
 #define QPHY_V2_PCS_UFS_TX_LARGE_AMP_DRV_LVL		0x034
 #define QPHY_V2_PCS_UFS_TX_LARGE_AMP_POST_EMP_LVL	0x038
 #define QPHY_V2_PCS_UFS_TX_SMALL_AMP_DRV_LVL		0x03c
@@ -17,4 +20,6 @@
 #define QPHY_V2_PCS_UFS_RX_SIGDET_CTRL2			0x148
 #define QPHY_V2_PCS_UFS_RX_PWM_GEAR_BAND			0x154
 
+#define QPHY_V2_PCS_UFS_READY_STATUS			0x168
+
 #endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v3.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v3.h
index ba1ea29d2884..adea13c3a9e6 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v3.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v3.h
@@ -6,12 +6,15 @@
 #ifndef QCOM_PHY_QMP_PCS_UFS_V3_H_
 #define QCOM_PHY_QMP_PCS_UFS_V3_H_
 
+#define QPHY_V3_PCS_UFS_PHY_START			0x000
+#define QPHY_V3_PCS_UFS_POWER_DOWN_CONTROL		0x004
 #define QPHY_V3_PCS_UFS_TX_LARGE_AMP_DRV_LVL		0x02c
 #define QPHY_V3_PCS_UFS_TX_SMALL_AMP_DRV_LVL		0x034
 #define QPHY_V3_PCS_UFS_RX_SYM_RESYNC_CTRL		0x134
 #define QPHY_V3_PCS_UFS_RX_MIN_HIBERN8_TIME		0x138
 #define QPHY_V3_PCS_UFS_RX_SIGDET_CTRL1			0x13c
 #define QPHY_V3_PCS_UFS_RX_SIGDET_CTRL2			0x140
+#define QPHY_V3_PCS_UFS_READY_STATUS			0x160
 #define QPHY_V3_PCS_UFS_TX_MID_TERM_CTRL1		0x1bc
 #define QPHY_V3_PCS_UFS_MULTI_LANE_CTRL1		0x1c4
 
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index e9c04b88f541..72cae70d0507 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -87,21 +87,21 @@ enum qphy_reg_layout {
 };
 
 static const unsigned int msm8996_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
-	[QPHY_START_CTRL]		= 0x00,
-	[QPHY_PCS_READY_STATUS]		= 0x168,
-	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x04,
+	[QPHY_START_CTRL]		= QPHY_V2_PCS_UFS_PHY_START,
+	[QPHY_PCS_READY_STATUS]		= QPHY_V2_PCS_UFS_READY_STATUS,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V2_PCS_UFS_POWER_DOWN_CONTROL,
 };
 
 static const unsigned int sdm845_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
-	[QPHY_START_CTRL]		= 0x00,
-	[QPHY_PCS_READY_STATUS]		= 0x160,
-	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x04,
+	[QPHY_START_CTRL]		= QPHY_V3_PCS_UFS_PHY_START,
+	[QPHY_PCS_READY_STATUS]		= QPHY_V3_PCS_UFS_READY_STATUS,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V3_PCS_UFS_POWER_DOWN_CONTROL,
 };
 
 static const unsigned int sm6115_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
-	[QPHY_START_CTRL]		= 0x00,
-	[QPHY_PCS_READY_STATUS]		= 0x168,
-	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x04,
+	[QPHY_START_CTRL]		= QPHY_V2_PCS_UFS_PHY_START,
+	[QPHY_PCS_READY_STATUS]		= QPHY_V2_PCS_UFS_READY_STATUS,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V2_PCS_UFS_POWER_DOWN_CONTROL,
 };
 
 static const unsigned int sm8150_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
-- 
2.35.1

