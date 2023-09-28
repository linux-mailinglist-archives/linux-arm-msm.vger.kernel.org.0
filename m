Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2482E7B18A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 12:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231676AbjI1Ky4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 06:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbjI1Kyz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 06:54:55 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E20CE19E
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 03:54:49 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c16757987fso125651641fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 03:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695898488; x=1696503288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=94VHlZVsf6bXdjIfoogRbhmFUuCTuzhRqvR0EtjE+eY=;
        b=R4Fl541IdQaa6AXrI3nwjDpNH0LBB5KUieRN9GKRhu3Agyoglymjwywe/TKl1ToBaK
         +1sQX+0JYwwlQO3cRnrKIakz7ul/w6kO6NPm7v7SzP1ItrdexIkHT/8m5uW3LNrV3Rk2
         4J0EvnqC/HZzPGS7OoniLIE6H3/pu/xCX0wkFH7qXxwUYlLcHD9GyvqZEVaowgPEXtKe
         J6KErqcCunb1Hqzf4ezfQz5ed5pOa/+CxQPhPPsajNGs9OouCIDf37Ul4mzw4i5cb2/O
         NvL7XCQ0JZnLJ7baVL3pazk5TicjT3MFDC6QALUcc1xcIAxJA+46M9K59/WJQsL+u63H
         E/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695898488; x=1696503288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=94VHlZVsf6bXdjIfoogRbhmFUuCTuzhRqvR0EtjE+eY=;
        b=iiFx1d7yzCUByaxUI4f8k3N9g84aRi35GDfZookwo3vsrVC4sCGQBpeTAin5oybVgB
         JC1ijG4QAQsoX+QA4QuZzw+CEn0YPmzyAaT8dhgyQ3byvsVqnOyBOG+JIO2hyahQmxoi
         CoKqU6IYBB0U3fapD7n8LGScy5j6g0QDAR6dzlQOWsxgigJJFcwLK239G1hjtUEXwGE+
         rAyZuy5NsRMTpHSSrD6amo5mRuXfBXWbMy41ow3DYXq1yHUoMYAvNX9AX60rQen5CbjV
         MIgMWJ4fbBAV6dIWbCBbcg4E4fDcf8F7PB0qU8nx2+pBQGYs/drcRktwIuLZ8Q6Yvzzi
         OJ9A==
X-Gm-Message-State: AOJu0YwXc38x+kAsGDOp0Eofik7j2WD7LXQV4FfkhKBZy4lhxuYbdv8Z
        PTriP8vs0Xhjkg2+3bX/XcLlGg==
X-Google-Smtp-Source: AGHT+IGdePFOtUBL5hIpIiNS1i8PagrhLzfXQarBvR6qslkMvha7/O9Bbpqng3QVL4pnGiccUZX1QQ==
X-Received: by 2002:a2e:7a19:0:b0:2bf:f32a:1f70 with SMTP id v25-20020a2e7a19000000b002bff32a1f70mr822992ljc.11.1695898488213;
        Thu, 28 Sep 2023 03:54:48 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y24-20020a2e9d58000000b002b47a15a2eesm3551455ljj.45.2023.09.28.03.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 03:54:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v3 2/3] phy: qcom-qmp-usb: move PCS v6 register to the proper header
Date:   Thu, 28 Sep 2023 13:54:44 +0300
Message-Id: <20230928105445.1210861-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928105445.1210861-1-dmitry.baryshkov@linaro.org>
References: <20230928105445.1210861-1-dmitry.baryshkov@linaro.org>
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

The commit 39bbf82d8c2b ("phy: qcom-qmp: pcs-usb: Add v6 register
offsets") incorrectly added plain PCS registers to the PCS_USB header.
Move them to a proper location.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h | 16 ----------------
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h     | 16 ++++++++++++++--
 2 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
index cf4464849006..7c16af0b1cc3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
@@ -7,22 +7,6 @@
 #define QCOM_PHY_QMP_PCS_USB_V6_H_
 
 /* Only for QMP V6 PHY - USB3 have different offsets than V5 */
-#define QPHY_V6_PCS_LOCK_DETECT_CONFIG1		0xc4
-#define QPHY_V6_PCS_LOCK_DETECT_CONFIG2		0xc8
-#define QPHY_V6_PCS_LOCK_DETECT_CONFIG3		0xcc
-#define QPHY_V6_PCS_LOCK_DETECT_CONFIG6		0xd8
-#define QPHY_V6_PCS_REFGEN_REQ_CONFIG1		0xdc
-#define QPHY_V6_PCS_POWER_STATE_CONFIG1		0x90
-#define QPHY_V6_PCS_RX_SIGDET_LVL			0x188
-#define QPHY_V6_PCS_RCVR_DTCT_DLY_P1U2_L		0x190
-#define QPHY_V6_PCS_RCVR_DTCT_DLY_P1U2_H		0x194
-#define QPHY_V6_PCS_CDR_RESET_TIME			0x1b0
-#define QPHY_V6_PCS_ALIGN_DETECT_CONFIG1		0x1c0
-#define QPHY_V6_PCS_ALIGN_DETECT_CONFIG2		0x1c4
-#define QPHY_V6_PCS_PCS_TX_RX_CONFIG		0x1d0
-#define QPHY_V6_PCS_EQ_CONFIG1			0x1dc
-#define QPHY_V6_PCS_EQ_CONFIG5			0x1ec
-
 #define QPHY_V6_PCS_USB3_POWER_STATE_CONFIG1		0x00
 #define QPHY_V6_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL	0x18
 #define QPHY_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2	0x3c
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h
index 18c4a3abe590..47cedb860fef 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h
@@ -7,10 +7,22 @@
 #define QCOM_PHY_QMP_PCS_V6_H_
 
 /* Only for QMP V6 PHY - USB/PCIe PCS registers */
-#define QPHY_V6_PCS_REFGEN_REQ_CONFIG1		0xdc
+#define QPHY_V6_PCS_POWER_STATE_CONFIG1		0x090
+#define QPHY_V6_PCS_LOCK_DETECT_CONFIG1		0x0c4
+#define QPHY_V6_PCS_LOCK_DETECT_CONFIG2		0x0c8
+#define QPHY_V6_PCS_LOCK_DETECT_CONFIG3		0x0cc
+#define QPHY_V6_PCS_LOCK_DETECT_CONFIG6		0x0d8
+#define QPHY_V6_PCS_REFGEN_REQ_CONFIG1		0x0dc
 #define QPHY_V6_PCS_RX_SIGDET_LVL		0x188
+#define QPHY_V6_PCS_RCVR_DTCT_DLY_P1U2_L	0x190
+#define QPHY_V6_PCS_RCVR_DTCT_DLY_P1U2_H	0x194
 #define QPHY_V6_PCS_RATE_SLEW_CNTRL1		0x198
-#define QPHY_V6_PCS_EQ_CONFIG2			0x1e0
+#define QPHY_V6_PCS_CDR_RESET_TIME		0x1b0
+#define QPHY_V6_PCS_ALIGN_DETECT_CONFIG1	0x1c0
+#define QPHY_V6_PCS_ALIGN_DETECT_CONFIG2	0x1c4
 #define QPHY_V6_PCS_PCS_TX_RX_CONFIG		0x1d0
+#define QPHY_V6_PCS_EQ_CONFIG1			0x1dc
+#define QPHY_V6_PCS_EQ_CONFIG2			0x1e0
+#define QPHY_V6_PCS_EQ_CONFIG5			0x1ec
 
 #endif
-- 
2.39.2

