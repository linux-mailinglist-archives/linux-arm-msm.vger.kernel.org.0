Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0D63670F0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 01:51:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbjARAv1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 19:51:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbjARAuH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 19:50:07 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 280FB48582
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 16:38:47 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so379527wma.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 16:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0aJbCLNImI9LXSbsqFxABvt6t5tPg6gbPY4B/5o0nEw=;
        b=HudhzkXBQWW83l7EYUdJr0Y2d8LTf8yKwLNcudJrsioiuufXV0lD23oab0h/Ip4L4E
         g1dIQV6ANl2jthUSfQaubod+U426X8sO4a72b7Ql/ey6w7JE79KhY+D4Em0pjr2ZjbrI
         i0bJ0jW7qP5hnotuzUs30G/qF84YnByvMb0OqkON7vok6dRbkd5utfWMUK1K72Qzaa0L
         eMzXaIddvHW/GLgPJHkQ+zcq4yLQYTVuHS/24nrb9vohc3Vv5H5gToaIIE6xIIbFlZsn
         v2VDmh9/FGZX2F7q3LxD6wggrreGrky1/s5EIsq6JkLLz/QNk7bHP4bVbvrfF96olEYj
         qgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0aJbCLNImI9LXSbsqFxABvt6t5tPg6gbPY4B/5o0nEw=;
        b=1ttStEsxLoza95Cw4E7nXeMuirxTRXUJT4KBKM0WN069Wabp+VcWX74YLY4cwW3vrm
         Pwh4Kkh+/AZ3Bv5dTOelwrRVVh+5dx5JWwQBw3rjks/Wc3PK1FTx9k5lyfBBel31RckY
         0Xt4ncpuR6ES58TuOLZ6IvxBsqGYEB04/X9DsM+EA9zCYRatMbxgVEtZLjw8wv5MAGxY
         YAsBOvtC9wB8Wg+OlqTsg3/swqd8UoBmYR+lO6h5lb76wXe3gnUSLE4JQiQbYvNtQ/m3
         2Tzf/U0BE3oJlHBGbMPyoqAAq4D7tWhkxoFJbFRwjG5C1k4g+3ZrRWvd3OvE7zck9ImH
         yUqQ==
X-Gm-Message-State: AFqh2kqIdYkFcwCj3VWFNz3NvpzBrWifpg3+jbWBa8dRZBUyzJjLdgmw
        1I1TMy6PasUANlMgVKAik35UqQ==
X-Google-Smtp-Source: AMrXdXsFN7nfJnEj6H/mGba/NLDYNDSULEOa4lvBBggmpGz6tMrGjCUfw3ksWaHU5xzhjYnBopz7kA==
X-Received: by 2002:a05:600c:4347:b0:3da:fc2c:cda8 with SMTP id r7-20020a05600c434700b003dafc2ccda8mr4780307wme.6.1674002325710;
        Tue, 17 Jan 2023 16:38:45 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id m9-20020a7bca49000000b003d98f92692fsm365199wml.17.2023.01.17.16.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 16:38:45 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 2/7] phy: qcom-qmp: pcs: Add v6.20 register offsets
Date:   Wed, 18 Jan 2023 02:38:29 +0200
Message-Id: <20230118003834.2330028-3-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118003834.2330028-1-abel.vesa@linaro.org>
References: <20230118003834.2330028-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The new SM8550 SoC bumps up the HW version of QMP phy to v6.20 for
PCIE g4x2. Add the new PCS offsets in a dedicated header file.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
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

