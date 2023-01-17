Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 056B7670CB7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 00:08:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbjAQXIY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 18:08:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbjAQXHR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 18:07:17 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5D4D46145
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 14:42:03 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id r2so32168570wrv.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 14:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4JAOlLrfNOb5Pzbngp7SFMzqUr448EyrCcTc9stSxag=;
        b=ow2ryBuWHGNpoovOfcW+4/8qHuN3sy5YXZahWUs7z/JJ3ly5RMxDzmP5xTwUAhBM82
         ucjXIsz0eo1tNrr5e3Qucz3HhvWH+pVo00SdLBLsmSC2fJTx3w6EpSPRY1W3vGI4Tnx/
         RKO/afAmZl1DigOUL0j1jTXcjeCmALKBnhMFvMIFHo8xSJSxGsfcq9ivbcAOPtWjOevW
         7H8z+OyQgNa15W0YwCP4zPdE7WUvFvjpgaSMPzmGHJQ5n95S9lAtubb7te302RHd6O6B
         4+5Qf6iQ/q28NW+TO5gsalI63hlmeOrwoisJzCvA+7LZoYGQI2IEeyn1ny+WWyTsBHs4
         alqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4JAOlLrfNOb5Pzbngp7SFMzqUr448EyrCcTc9stSxag=;
        b=xXUcDnBxivKSX5PoQ56lZdtzt/0Y33b96kavAv8NL3S6vJ3L3yFBmiQ3POodyjnbPI
         GDf40qoA+LqDUkqTmNF0z7RKeVo5AN29udYKpO9Wag1yNuXi8UE3GHsl4MWmxXJbNIHm
         R34w+01R23L6ibIFbPyk8qOmUr7/hchOrJ3YnZw4iX/fA/oPODWPh/uzQSAnN6kpNYjj
         wVOnJ38GHAabsmlj5K16K6+B8WZSbZxzJkb2Nqf4FM93mIdnLCxXeP0gTdYSWsP1M1vJ
         950tIF3H1PH3nxQnMC7xKxvayKfu/uqAMDF5EjC3c5Hg+qrqmmhWNJDiZFUEklXb3zpl
         KPVw==
X-Gm-Message-State: AFqh2krpVzJzGy/YGQvGrfdZtfMpUqF3GPvhyusSxgGd4i7GomI18A+3
        T+Xp6QVcu/EYbbTv3jnqR9oeRg==
X-Google-Smtp-Source: AMrXdXuDosm1Q4675v4gyK0x9SGAQJBZjum2BYMUM8dfC2FFwxiWnyQ//Szl7PAnIiAqrSD9sFl6Rg==
X-Received: by 2002:adf:cd0a:0:b0:242:1f46:fb8c with SMTP id w10-20020adfcd0a000000b002421f46fb8cmr4251489wrm.41.1673995319622;
        Tue, 17 Jan 2023 14:41:59 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id m1-20020a5d6241000000b002bbdaf21744sm27024916wrv.113.2023.01.17.14.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 14:41:59 -0800 (PST)
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
Subject: [PATCH v5 4/6] phy: qcom-qmp: qserdes-txrx-ufs: Add v6 register offsets
Date:   Wed, 18 Jan 2023 00:41:46 +0200
Message-Id: <20230117224148.1914627-5-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117224148.1914627-1-abel.vesa@linaro.org>
References: <20230117224148.1914627-1-abel.vesa@linaro.org>
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

The new SM8550 SoC bumps up the HW version of QMP phy to v6 for USB,
UFS and PCIE g3x2. Add the new qserdes TX RX but UFS specific offsets
in a dedicated header file.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../phy-qcom-qmp-qserdes-txrx-ufs-v6.h        | 30 +++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       |  2 ++
 2 files changed, 32 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v6.h

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v6.h
new file mode 100644
index 000000000000..15bcb4ba9139
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v6.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_TXRX_UFS_V6_H_
+#define QCOM_PHY_QMP_QSERDES_TXRX_UFS_V6_H_
+
+#define QSERDES_UFS_V6_TX_RES_CODE_LANE_TX			0x28
+#define QSERDES_UFS_V6_TX_RES_CODE_LANE_RX			0x2c
+#define QSERDES_UFS_V6_TX_RES_CODE_LANE_OFFSET_TX		0x30
+#define QSERDES_UFS_V6_TX_RES_CODE_LANE_OFFSET_RX		0x34
+
+#define QSERDES_UFS_V6_RX_UCDR_FASTLOCK_FO_GAIN_RATE2		0x08
+#define QSERDES_UFS_V6_RX_UCDR_FASTLOCK_FO_GAIN_RATE4		0x10
+#define QSERDES_UFS_V6_RX_VGA_CAL_MAN_VAL			0x178
+#define QSERDES_UFS_V6_RX_MODE_RATE_0_1_B0			0x208
+#define QSERDES_UFS_V6_RX_MODE_RATE_0_1_B1			0x20c
+#define QSERDES_UFS_V6_RX_MODE_RATE_0_1_B3			0x214
+#define QSERDES_UFS_V6_RX_MODE_RATE_0_1_B6			0x220
+#define QSERDES_UFS_V6_RX_MODE_RATE2_B3				0x238
+#define QSERDES_UFS_V6_RX_MODE_RATE2_B6				0x244
+#define QSERDES_UFS_V6_RX_MODE_RATE3_B3				0x25c
+#define QSERDES_UFS_V6_RX_MODE_RATE3_B4				0x260
+#define QSERDES_UFS_V6_RX_MODE_RATE3_B5				0x264
+#define QSERDES_UFS_V6_RX_MODE_RATE3_B8				0x270
+#define QSERDES_UFS_V6_RX_MODE_RATE4_B3				0x280
+#define QSERDES_UFS_V6_RX_MODE_RATE4_B6				0x28c
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 110d8fb9309f..a5cdd58c5b4d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -27,6 +27,8 @@
 #include "phy-qcom-qmp-pcs-ufs-v4.h"
 #include "phy-qcom-qmp-pcs-ufs-v5.h"
 
+#include "phy-qcom-qmp-qserdes-txrx-ufs-v6.h"
+
 /* QPHY_SW_RESET bit */
 #define SW_RESET				BIT(0)
 /* QPHY_POWER_DOWN_CONTROL */
-- 
2.34.1

