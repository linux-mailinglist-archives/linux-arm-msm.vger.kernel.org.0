Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0400A673B1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 15:05:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231441AbjASOFf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 09:05:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231408AbjASOFS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 09:05:18 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECD197E69E
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 06:05:12 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so2857417wmq.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 06:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BKvO937CN7b3rAU1vn31s1fmXjqpKFZ3lngmWeAcJo=;
        b=ptLrFQQXuoDZ6k9sWUY+QMEn5svmh1VVRPmyeRLB4MTmBmNTij3/s8LNjpsz+Yk7nO
         Dj7CQ8rPJ01dGaJHu0pgNsFrQaY/srUS8856FfwuK1EJM8vdl59X1ZmxU7JuHzMvCZmR
         Kl51dy0N+fuO0VIJHF+bSKP1hLXRwhc+4L0UxWoz7+Jv6dQHgB+gf7iOCoVOQD8csEZS
         QfK9lNxGqjpPWO2dT4wYL8nVG87VnOpPhGGpJAuDGl1g/Ft/yK/seQ9gdi3lKnlvghjI
         fkZc8vN1g8JvJ+OoW/++rl3LY7IkHpB5MCbDbQHMC8HJQv13M9dFtPAKFmk6UO3xhfC4
         veFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/BKvO937CN7b3rAU1vn31s1fmXjqpKFZ3lngmWeAcJo=;
        b=JcbzP4e2xuKZB8/lkL9RczeAKmAo0e4hzl4nYzIfiLmfiSlLEIEWo7JZ3SYoUgUAZO
         t20Q7VM710pY6Xye/Mb4Otad+qXys2ce6mlQsfmLIm+KIc+TwB3sbhUV1dAQEU3PwlfB
         sblwZyxLLzaAWm0QHFEVJrZmP2/eW/NLf/ZbbvMXBKhID5F4U0suEuhf6R9VS4DfPG0Q
         cZHvSI1vVaJzd/3RRFNWNgXQjLYehIZ8134YwgnPSUPDTx7fDx9AmuDuyDqfXu3RKyKZ
         ba7PLGPC9yTQLgXua4NQeaGZaO607l2h+3abWZ/8Y/7GWtFmqZtVouEZ9EJ5QLJwGo0E
         AuBA==
X-Gm-Message-State: AFqh2kqGvYKiEpo18BpMh2sHT7ihFAQWJHMTXgJ9Gjxubmleqi6uTGp8
        5BQ5uAlWxmwjSangChyik6tP0w==
X-Google-Smtp-Source: AMrXdXvPDn+weyG/iT3LsejWDI6nDAHLLFzqJDNJ8s7tQx2P61gPOkq8t2aAeLjXe5ZBm1z1lhakAw==
X-Received: by 2002:a05:600c:35d5:b0:3db:fc4:d018 with SMTP id r21-20020a05600c35d500b003db0fc4d018mr7101903wmq.40.1674137111415;
        Thu, 19 Jan 2023 06:05:11 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id m10-20020a05600c4f4a00b003d96efd09b7sm5263883wmq.19.2023.01.19.06.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 06:05:10 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 03/12] phy: qcom-qmp: pcs: Add v6.20 register offsets
Date:   Thu, 19 Jan 2023 16:04:44 +0200
Message-Id: <20230119140453.3942340-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119140453.3942340-1-abel.vesa@linaro.org>
References: <20230119140453.3942340-1-abel.vesa@linaro.org>
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

The new SM8550 SoC bumps up the HW version of QMP phy to v6.20 for
PCIE g4x2. Add the new PCS offsets in a dedicated header file.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

This patchset relies on the following patchset:
https://lore.kernel.org/all/20230117224148.1914627-1-abel.vesa@linaro.org/

The v3 of this patchset is:
https://lore.kernel.org/all/20230118005328.2378792-1-abel.vesa@linaro.org/

Changes since v3:
 * added Dmitry's R-b tag

Changes since v2:
 * none

Changes since v1:
 * split all the offsets into separate patches, like Vinod suggested


 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6_20.h | 18 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |  2 ++
 2 files changed, 20 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6_20.h

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6_20.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6_20.h
new file mode 100644
index 000000000000..9c3f1e4950e6
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6_20.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_V6_20_H_
+#define QCOM_PHY_QMP_PCS_V6_20_H_
+
+/* Only for QMP V6_20 PHY - USB/PCIe PCS registers */
+#define QPHY_V6_20_PCS_G3S2_PRE_GAIN			0x178
+#define QPHY_V6_20_PCS_RX_SIGDET_LVL			0x190
+#define QPHY_V6_20_PCS_COM_ELECIDLE_DLY_SEL		0x1b8
+#define QPHY_V6_20_PCS_TX_RX_CONFIG1			0x1dc
+#define QPHY_V6_20_PCS_TX_RX_CONFIG2			0x1e0
+#define QPHY_V6_20_PCS_EQ_CONFIG4			0x1f8
+#define QPHY_V6_20_PCS_EQ_CONFIG5			0x1fc
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 80e3b5c860b6..760de4c76e5b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -40,6 +40,8 @@
 
 #include "phy-qcom-qmp-pcs-v6.h"
 
+#include "phy-qcom-qmp-pcs-v6_20.h"
+
 /* Only for QMP V3 & V4 PHY - DP COM registers */
 #define QPHY_V3_DP_COM_PHY_MODE_CTRL			0x00
 #define QPHY_V3_DP_COM_SW_RESET				0x04
-- 
2.34.1

