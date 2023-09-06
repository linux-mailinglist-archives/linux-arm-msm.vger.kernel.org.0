Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FEEC7936A6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 09:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232322AbjIFH6e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 03:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232256AbjIFH6d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 03:58:33 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76A421AB
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 00:58:29 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2bcfdadd149so57256931fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 00:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693987108; x=1694591908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zc6GA/fk2/gKuWwX+Ah3/04hrLBk2zRiGZ82j7q3als=;
        b=KovNeRrjhhqQfMc5tMaaUkMJM9aRIZaqcT44gQXQmlaD1V1BH4dOcXyBhLhVYmJ9pq
         NQthAhB5c6ydtjKcU+FFMNOMQ1Kfwxt4yojB3DkpByUTj2lt8pTTL9/4qbD5E3S94iQE
         MbKy6ri3DEYaG4jG4512tO0hlqwjnLb9Smporzm4AmR5F0VgRqXXHzFej4CwFnPruBZY
         u5lGkoRGW2Lmd2915Fm0nv43UqFwQCDA3IDTEb6fxMt1jKINIWgwmEqk6NzIZ2TdSwey
         gfDFXpW97xZZTLBJJ7Vyy0hHHj3NEWrN6amYZkPj1XqZXyYo/lqCCybgPxkqkncE7+Sp
         XErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693987108; x=1694591908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zc6GA/fk2/gKuWwX+Ah3/04hrLBk2zRiGZ82j7q3als=;
        b=mEYJjQ+GEXwnrLc8SKxDiEbPo7Cwv0QZUowxQqIHDeWpvr4Vaxb6+05sCdBae5h7Fo
         73Z0EHR3Yqhy7ZFok3nvWJ0lS/LxN70y/LxpGLBgHmaK7QVWF2YCvB+4ocE0PR8KPEcu
         4w6+cFlFRqpTlspHK+IlaNSzufiKqM6m8PRjVRvHYEUtXZY6xyXN+thswsS/WNbidXWc
         4LqG353BmJsQRL+MDf6LiLRToAhRqOs+z1LTyL0Lej8Ix2zTfy+iPyMPIiE8wYWodOU3
         nkUSH7OAjJW2PEMnc6TSkJGSawt6LI8VsSYtTbjFqewHvBAHZeBYCb2OMjmLv/0D2kgf
         goaA==
X-Gm-Message-State: AOJu0YwL4V0WCv2B2D2ELnmVcEeYTK9BxfEfeoQKNvdO4cqU1p59Vpia
        svLiNfmacxnHNCjyNm0tB0GYFg==
X-Google-Smtp-Source: AGHT+IFqqL99Rw3jobuZLC/7QEGC/tZ3+6nal7nC4ZD3QhD+uwyNc0oNCd3h8cENdgcSz2u3ygHA/g==
X-Received: by 2002:a2e:9b85:0:b0:2bd:19c5:3950 with SMTP id z5-20020a2e9b85000000b002bd19c53950mr1501661lji.33.1693987107822;
        Wed, 06 Sep 2023 00:58:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z10-20020a2e7e0a000000b002b9ec22d9fasm3268324ljc.29.2023.09.06.00.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 00:58:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH 4/4] phy: qcom-qmp-combo: use v6 registers in v6 regs layout
Date:   Wed,  6 Sep 2023 10:58:23 +0300
Message-Id: <20230906075823.7957-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230906075823.7957-1-dmitry.baryshkov@linaro.org>
References: <20230906075823.7957-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make sure that we use only v6 registers in qmp_v6_usb3phy_regs_layout.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c      | 12 ++++++------
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h |  2 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h     |  4 ++++
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index bff6231d7de3..9c71a132afea 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -194,14 +194,14 @@ static const unsigned int qmp_v5_5nm_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 };
 
 static const unsigned int qmp_v6_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
-	[QPHY_SW_RESET]			= QPHY_V5_PCS_SW_RESET,
-	[QPHY_START_CTRL]		= QPHY_V5_PCS_START_CONTROL,
-	[QPHY_PCS_STATUS]		= QPHY_V5_PCS_PCS_STATUS1,
-	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V5_PCS_POWER_DOWN_CONTROL,
+	[QPHY_SW_RESET]			= QPHY_V6_PCS_SW_RESET,
+	[QPHY_START_CTRL]		= QPHY_V6_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V6_PCS_PCS_STATUS1,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V6_PCS_POWER_DOWN_CONTROL,
 
 	/* In PCS_USB */
-	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V5_PCS_USB3_AUTONOMOUS_MODE_CTRL,
-	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V5_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
+	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V6_PCS_USB3_AUTONOMOUS_MODE_CTRL,
+	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V6_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
 
 	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V6_COM_RESETSM_CNTRL,
 	[QPHY_COM_C_READY_STATUS]	= QSERDES_V6_COM_C_READY_STATUS,
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
index 7c16af0b1cc3..0d0089898240 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
@@ -8,6 +8,8 @@
 
 /* Only for QMP V6 PHY - USB3 have different offsets than V5 */
 #define QPHY_V6_PCS_USB3_POWER_STATE_CONFIG1		0x00
+#define QPHY_V6_PCS_USB3_AUTONOMOUS_MODE_CTRL		0x08
+#define QPHY_V6_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR		0x14
 #define QPHY_V6_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL	0x18
 #define QPHY_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2	0x3c
 #define QPHY_V6_PCS_USB3_RCVR_DTCT_DLY_U3_L		0x40
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h
index c95d3fabd108..496c36522e55 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h
@@ -7,6 +7,10 @@
 #define QCOM_PHY_QMP_PCS_V6_H_
 
 /* Only for QMP V6 PHY - USB/PCIe PCS registers */
+#define QPHY_V6_PCS_SW_RESET			0x000
+#define QPHY_V6_PCS_PCS_STATUS1			0x014
+#define QPHY_V6_PCS_POWER_DOWN_CONTROL		0x040
+#define QPHY_V6_PCS_START_CONTROL		0x044
 #define QPHY_V6_PCS_LOCK_DETECT_CONFIG1		0x0c4
 #define QPHY_V6_PCS_LOCK_DETECT_CONFIG2		0x0c8
 #define QPHY_V6_PCS_LOCK_DETECT_CONFIG3		0x0cc
-- 
2.39.2

