Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EAF1670F10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 01:51:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbjARAve (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 19:51:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbjARAuO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 19:50:14 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F4BD47ED4
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 16:38:52 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so407091wmc.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 16:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/5ShO46ItcCODQXADi0zaEWQnEHxlXkqIv58ku6QRo=;
        b=kU/K5+JwUdEK2iix5VXebSNJeEunE419mSZO7R5AZS6MO0uk/lZwYnVcHHuTJmLHVR
         QnJys09TZHq84MkDlWf0f0qfK+jp/NrN7K3NITnQfd0wFGX87XQchr+a2AnR53PaON3R
         RZ3EnKcHCOJ7Mp0OVYSAS8yboz6vdJMVgH8vfh6+8q9xndSB69v8lOSmQsEBRcdxPO0N
         rgEifvOO1HPJHYLO3FrNZAniQq5nSxvIPj2m1nYnsoIhS7JWF7LOxePIthie8O7R/e+e
         83Hcil86ajQSXbzXZ8xwrfbS+9FeHmLMb0Bi0BIhebqxx09wWjdP7aASKy1LSaw3dKZ7
         oC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/5ShO46ItcCODQXADi0zaEWQnEHxlXkqIv58ku6QRo=;
        b=7jL5pSS0AD7GF7gMvJmlOYlhsTQOAyuKY+i/pcuHdvtnZrjT67zJ4F4bkSUZOm1SLo
         NVv1Jec6K3DJlVFmoiAGJlV+qBTt0a7jU3khvG2Rij6HMI99Ie7bYaM98+Gr7cWmLq1K
         fixWD96IQRlFSwX/a/g+WLCQ17lR0hY4I0JXP6+sqD5DpIwxlsA/aZk0Nz07DIKlwL+0
         3I9W0fKA0jOYklWfiA1MI1vFglnQAqv9AU3DFq1wvqqDqyFVIsSFzhXWlOr7V3d4TVsW
         o8zyn7u7v53mF+EedBwANbEmctC+ohCsWFe0W0vn38YhksrCGZx2ABLK4Ttq3q5eJNY8
         uJuA==
X-Gm-Message-State: AFqh2kruCm6cmepRUgTTuI6HS2M7tAA9I0tbUsjrXNr+e+TjSnyamsz4
        LMJHIP3ZsR5pKr4vFeHY3Ku0vg==
X-Google-Smtp-Source: AMrXdXvqBdtfYnIYDTkkaelatA2CNWHw5sRu/pO2D2acw5bLqHCpSn5p/nfwRGgm03A4XbIrI4rCRg==
X-Received: by 2002:a05:600c:4f83:b0:3db:eab:a600 with SMTP id n3-20020a05600c4f8300b003db0eaba600mr1798656wmq.7.1674002330992;
        Tue, 17 Jan 2023 16:38:50 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id m9-20020a7bca49000000b003d98f92692fsm365199wml.17.2023.01.17.16.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 16:38:50 -0800 (PST)
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
Subject: [PATCH v2 6/7] phy: qcom-qmp: qserdes-lane-shared: Add v6 register offsets
Date:   Wed, 18 Jan 2023 02:38:33 +0200
Message-Id: <20230118003834.2330028-7-abel.vesa@linaro.org>
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
PCIE g4x2. Add the new lane shared PCIE specific offsets in a dedicated
header file.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../phy-qcom-qmp-qserdes-ln-shrd-v6.h         | 32 +++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-ln-shrd-v6.h

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-ln-shrd-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-ln-shrd-v6.h
new file mode 100644
index 000000000000..86d7d796d5d7
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-ln-shrd-v6.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_LN_SHRD_V6_H_
+#define QCOM_PHY_QMP_QSERDES_LN_SHRD_V6_H_
+
+#define QSERDES_V6_LN_SHRD_RXCLK_DIV2_CTRL			0xa0
+#define QSERDES_V6_LN_SHRD_RX_Q_EN_RATES			0xb0
+#define QSERDES_V6_LN_SHRD_DFE_DAC_ENABLE1			0xb4
+#define QSERDES_V6_LN_SHRD_TX_ADAPT_POST_THRESH1		0xc4
+#define QSERDES_V6_LN_SHRD_TX_ADAPT_POST_THRESH2		0xc8
+#define QSERDES_V6_LN_SHRD_RX_MODE_RATE_0_1_B0			0xd4
+#define QSERDES_V6_LN_SHRD_RX_MODE_RATE_0_1_B1			0xd8
+#define QSERDES_V6_LN_SHRD_RX_MODE_RATE_0_1_B2			0xdc
+#define QSERDES_V6_LN_SHRD_RX_MODE_RATE_0_1_B3			0xe0
+#define QSERDES_V6_LN_SHRD_RX_MODE_RATE_0_1_B4			0xe4
+#define QSERDES_V6_LN_SHRD_RX_MODE_RATE_0_1_B5			0xe8
+#define QSERDES_V6_LN_SHRD_RX_MODE_RATE_0_1_B6			0xec
+#define QSERDES_V6_LN_SHRD_RX_MARG_COARSE_THRESH1_RATE210	0xf0
+#define QSERDES_V6_LN_SHRD_RX_MARG_COARSE_THRESH1_RATE3		0xf4
+#define QSERDES_V6_LN_SHRD_RX_MARG_COARSE_THRESH2_RATE210	0xf8
+#define QSERDES_V6_LN_SHRD_RX_MARG_COARSE_THRESH2_RATE3		0xfc
+#define QSERDES_V6_LN_SHRD_RX_MARG_COARSE_THRESH3_RATE210	0x100
+#define QSERDES_V6_LN_SHRD_RX_MARG_COARSE_THRESH3_RATE3		0x104
+#define QSERDES_V6_LN_SHRD_RX_MARG_COARSE_THRESH4_RATE3		0x10c
+#define QSERDES_V6_LN_SHRD_RX_MARG_COARSE_THRESH5_RATE3		0x114
+#define QSERDES_V6_LN_SHRD_RX_MARG_COARSE_THRESH6_RATE3		0x11c
+#define QSERDES_V6_LN_SHRD_RX_SUMMER_CAL_SPD_MODE		0x128
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index e5974e6caf51..148663ee713a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -24,6 +24,7 @@
 #include "phy-qcom-qmp-qserdes-com-v6.h"
 #include "phy-qcom-qmp-qserdes-txrx-v6.h"
 #include "phy-qcom-qmp-qserdes-txrx-v6_20.h"
+#include "phy-qcom-qmp-qserdes-ln-shrd-v6.h"
 
 #include "phy-qcom-qmp-qserdes-pll.h"
 
-- 
2.34.1

