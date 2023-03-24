Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D88DE6C759C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbjCXCZ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231364AbjCXCZY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:24 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 738182A15A
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:23 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id h25so402404lfv.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0UkUAHHV030Q9Rz5orwTaamTqXyQfCNaYwLyt8g6O0=;
        b=XZtUhT+1Gn0aizoU8zZboFIJEZlCnFI6oqdMqyq5snl8wzRszLk7hlUZWHM8UNXSbU
         YSWkR8V7pMSJSbR5s05QpoO338+nEgHNNHScwWbKHs0lCkJWY4fHW5MyUninGg/9HEPL
         iLPXZgiNfw75664DhB/JzSd6cmEwrSxVyqLIC+8oNQbHiBSvmt/mC+ednuUugjCpC1T+
         YF33EnILx+P3ToP7HUQc2gFYMaMT0cDlhkPzjyx+Ex3Aw8vnwxNBEVaoY7M4WyA78mKP
         cUCFIPDsGAjqxWNCP4l+Sn4IbThUTcZGxtQL5yjl6aMRYQ9B2D6pjeGhiMd/ZCfPY6Pz
         hS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F0UkUAHHV030Q9Rz5orwTaamTqXyQfCNaYwLyt8g6O0=;
        b=l0Qn7IbZQvyTblyxHTuyca7UR7wfHk5yRfIk9p7TL/1XHyaCyjD/19ifi+R8Xr6l68
         72xynmHEcdZfhLfv5MR1FGsnTE13Kvnhn7VwzLKLgD+7pFyybh2DKGghPlZqxs0ckdbu
         4bUIuyY9qs+irYwdVamjbUmOCZtzL/VHiYNK8szo0uKnyT56gqGuRu1MHJ5yVI0xURXI
         1gJG85p5gAUgKKFGKCZKeU0BB2W+Y6aczs+IWzNDrsxhM3joigSAUizVWoFIhk4b7CMe
         fKw+CmG+TAu30ypX7ebo6UhvcjKGJP0T2d4pEAXvXR9eQoNjg2LdznUsFHaVs5TSr7dc
         xBNw==
X-Gm-Message-State: AAQBX9c8vz2CzRo7Iv8lHGBSHjInUNJQANmvnlKWMcG0PMngrsVj84Z/
        MfafoeQOlIaJWLHrNvNYzfyu6g==
X-Google-Smtp-Source: AKy350YDs2q5/qG0/+u/R2zfmdyySqEjCGoK0ZJpvsepQRQ5Tkbvho6Wz38FmgqMtpvwEa/pNFBRdw==
X-Received: by 2002:ac2:4884:0:b0:4ea:e628:356f with SMTP id x4-20020ac24884000000b004eae628356fmr178985lfc.48.1679624721820;
        Thu, 23 Mar 2023 19:25:21 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 06/41] phy: qcom-qmp: move PCS MISC V4 registers to separate header
Date:   Fri, 24 Mar 2023 05:24:39 +0300
Message-Id: <20230324022514.1800382-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
References: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move PCS MISC V4 registers to the separate header.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v4.h | 17 +++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c         |  1 +
 drivers/phy/qualcomm/phy-qcom-qmp.h             |  8 --------
 3 files changed, 18 insertions(+), 8 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v4.h

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v4.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v4.h
new file mode 100644
index 000000000000..e256a089f228
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v4.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_MISC_V4_H_
+#define QCOM_PHY_QMP_PCS_MISC_V4_H_
+
+/* Only for QMP V4 PHY - PCS_MISC registers */
+#define QPHY_V4_PCS_MISC_TYPEC_CTRL			0x00
+#define QPHY_V4_PCS_MISC_TYPEC_PWRDN_CTRL		0x04
+#define QPHY_V4_PCS_MISC_PCS_MISC_CONFIG1		0x08
+#define QPHY_V4_PCS_MISC_CLAMP_ENABLE			0x0c
+#define QPHY_V4_PCS_MISC_TYPEC_STATUS			0x10
+#define QPHY_V4_PCS_MISC_PLACEHOLDER_STATUS		0x14
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 269350687259..8a1dd5d80145 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -22,6 +22,7 @@
 
 #include "phy-qcom-qmp.h"
 #include "phy-qcom-qmp-pcs-misc-v3.h"
+#include "phy-qcom-qmp-pcs-misc-v4.h"
 #include "phy-qcom-qmp-pcs-usb-v4.h"
 #include "phy-qcom-qmp-pcs-usb-v5.h"
 
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 7ee4b0e07d11..1581d9b3d25c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -126,14 +126,6 @@
 #define QSERDES_V4_DP_PHY_AUX_INTERRUPT_STATUS		0x0d8
 #define QSERDES_V4_DP_PHY_STATUS			0x0dc
 
-/* Only for QMP V4 PHY - PCS_MISC registers */
-#define QPHY_V4_PCS_MISC_TYPEC_CTRL			0x00
-#define QPHY_V4_PCS_MISC_TYPEC_PWRDN_CTRL		0x04
-#define QPHY_V4_PCS_MISC_PCS_MISC_CONFIG1		0x08
-#define QPHY_V4_PCS_MISC_CLAMP_ENABLE			0x0c
-#define QPHY_V4_PCS_MISC_TYPEC_STATUS			0x10
-#define QPHY_V4_PCS_MISC_PLACEHOLDER_STATUS		0x14
-
 /* Only for QMP V6 PHY - DP PHY registers */
 #define QSERDES_V6_DP_PHY_AUX_INTERRUPT_STATUS		0x0e0
 #define QSERDES_V6_DP_PHY_STATUS			0x0e4
-- 
2.30.2

