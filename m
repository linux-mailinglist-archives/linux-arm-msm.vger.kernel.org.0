Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9E72624A91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 20:22:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbiKJTW6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 14:22:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbiKJTW5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 14:22:57 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA006450B3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 11:22:55 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id d3so2081339ljl.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 11:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KRFeywLNNuDZJ4Mp7G6ZbG2RCFU6+hEVO/xb+Ggmz0=;
        b=dwGyBubg3dcIbysbm/xDcf1nJpMb/uR7ZJc+xoBF0Z9KtbmCSEMNF0G2p3Ozg8gbUg
         weyutlW+ZJ/R0jGuAbfSAius9E0xr4ePaRUfG138jE24UJOVcgud5lhvEDVJdzPDu3JM
         LCr3CyDljtWJENVpR0rAK3NRKX+uRBpXahPf0XPiwLVTh1ShGu9ZxyiNrjf1Vd8CNXJH
         NKAktzV61sA2PUQ7gL8o9VOiFOfesb50Qy+U/MFP4CTWgkjFmAxEybgv2wY8QbXMpfFx
         WyPG5JVDsqOX78g0bkpBnFqPJ0NKSgEqFBVFr6pTwkcezariF54XamfiJ7flPnTpGy2w
         rrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2KRFeywLNNuDZJ4Mp7G6ZbG2RCFU6+hEVO/xb+Ggmz0=;
        b=w0GxYnRgnKkP0ZhqRRnHpDQxoyggGgkurgYHnfYG5EWLDpxzX3L0k1rFvFCMLQ1hP9
         KNb69WLA0StZQoAnKipWQnT9Dxtli2A2w0BLyFaS9+r45Z6beHDrUxl6MK7by6U8qw8O
         oOws9lWxu5bREeS7pq9F6YelLXuvh9nUIf0hLn0YrRIqjLAsgk7CXiKCHA5LbqauEGPN
         uZxoV7zeiKb/QrqBAPMucgvhT+rlhLGNv0Noy364DAT/2WMzC1QX0y9ONcj5RIOdQdx9
         2dQcn+Z47sBqqJJWQJOJPcXtdcBewQLI3P0WklWgnjRYImB/UDUBbYb6nQo0HRT6Vfhc
         SdZQ==
X-Gm-Message-State: ACrzQf3Tc0X+F9TeNieXnlvjheyEWKy34b0ylI94RDhAXzPu0+mYejZ+
        c4BO1Q30HjlClG3OAZLc4J7FKg==
X-Google-Smtp-Source: AMsMyM52darwT8rBGdk3D0L4t2ehD4UcRxM6I63PTdK9Q+n16FbH+2roDD8uU9QFvQDWEtvL5jTlog==
X-Received: by 2002:a2e:956:0:b0:277:35ca:5f01 with SMTP id 83-20020a2e0956000000b0027735ca5f01mr9335644ljj.214.1668108174107;
        Thu, 10 Nov 2022 11:22:54 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h8-20020a05651c124800b0027758f0619fsm40345ljh.132.2022.11.10.11.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 11:22:53 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v3 07/13] phy: qcom-qmp-ufs: rework regs layout arrays
Date:   Thu, 10 Nov 2022 22:22:42 +0300
Message-Id: <20221110192248.873973-8-dmitry.baryshkov@linaro.org>
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
index 9a425be05ac2..8a7a3bfbd8d3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -72,21 +72,21 @@ enum qphy_reg_layout {
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

