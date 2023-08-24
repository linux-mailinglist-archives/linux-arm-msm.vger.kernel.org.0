Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD79B787A24
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Aug 2023 23:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240895AbjHXVUY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Aug 2023 17:20:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243645AbjHXVUC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Aug 2023 17:20:02 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 912BA1BCA
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 14:20:00 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fe15bfb1adso388019e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 14:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692911998; x=1693516798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mp3OxMlQ5f/3XEucj+vCtx08B1iilIkI8HF7qdGL8lY=;
        b=WMBR48fEAtiuOFYSaAKrg4lOQzMbcPMvh+ryvhJwfZ4uZTZdNM0rVvoS1cIA4hyEzG
         VdZWINIra6uL44IR7Qc2lAj5Gmkc2f9zT5CkOWzAcKyFW3WNtABjwbsf/LmGvG/JVq9w
         4AvbBSXX0yMWQAn/xNUkecOLsApdGquNJ20+q/07/NXyD7OGxyw8uUCMQgHKU6AFjP8P
         vadmUQ4nt3s8EaKA//L/0njnc0pKYoVLSdszEU868p4rhU/2te5Z+SlWV4iw8pV0+VcW
         GL7Fz/UAFtojRpuGGHwiL3KEXmER7VykqJHuCPvihXmbVZ2XABICrEhxF8kOZ3p9YbSM
         TjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692911998; x=1693516798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mp3OxMlQ5f/3XEucj+vCtx08B1iilIkI8HF7qdGL8lY=;
        b=dwcYrA84Tu9TDk8vYLt6H4r7eGOpDe35caslbYEjzi32C/gl46PpS1QYmDpkFQxZ3O
         ltjNkk3KhtQdz7TSJIYNCoc18PEj1sy7a9JCY30I9tipZ0OA9PL0xAGIiDoOz02JECgT
         PBpqwqP1og8xAWRAecQz7EKdR1Qy6wLRsIw0SNoRXaOPp4KcorVYZw5A480E9jL882bf
         gL/cFmw+oumDR9/vd6nrypmYZlg0lSGWkiPDiUjl/5TC6oBqBnquNc/KmfD1lA+pAdqA
         pFlUoXne6JF18Obe8Is1tCl1+XluhPtsPxVrIyo0RKuNDNrXEYE6gfSGRh0nJ3EFj3Tc
         zgsA==
X-Gm-Message-State: AOJu0YyhWLMWyrOb73auLlvJyh3faKIxVK3ge57t2lqd/zx0sSbPyIU/
        f6mRtWfHS8XhZknsM9A8DkLdQg==
X-Google-Smtp-Source: AGHT+IHyH9FMI2+xgQbIvbU7paqUhcBUhQrFf+ntRdkpX+dNWu28gijxu2GMP5ehPe1DYBin4RC8gQ==
X-Received: by 2002:ac2:4557:0:b0:4fd:fef8:7a81 with SMTP id j23-20020ac24557000000b004fdfef87a81mr10715275lfm.55.1692911998388;
        Thu, 24 Aug 2023 14:19:58 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j29-20020a056512029d00b004fe4ab686b4sm17690lfp.167.2023.08.24.14.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 14:19:57 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v3 05/16] phy: qcom-qmp: move PCS MISC V4 registers to separate header
Date:   Fri, 25 Aug 2023 00:19:41 +0300
Message-Id: <20230824211952.1397699-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230824211952.1397699-1-dmitry.baryshkov@linaro.org>
References: <20230824211952.1397699-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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
index 411cf0ae148d..42a1a3f00759 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -21,6 +21,7 @@
 
 #include "phy-qcom-qmp.h"
 #include "phy-qcom-qmp-pcs-misc-v3.h"
+#include "phy-qcom-qmp-pcs-misc-v4.h"
 #include "phy-qcom-qmp-pcs-usb-v4.h"
 #include "phy-qcom-qmp-pcs-usb-v5.h"
 
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 32d897684755..71f063f4a56e 100644
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
 #define QSERDES_V5_DP_PHY_STATUS			0x0dc
 
 /* Only for QMP V6 PHY - DP PHY registers */
-- 
2.39.2

