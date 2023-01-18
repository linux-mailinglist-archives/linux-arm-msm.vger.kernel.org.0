Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4A1670F61
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 02:05:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbjARBFK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 20:05:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbjARBEh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 20:04:37 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A6D346086
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 16:53:35 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id f19-20020a1c6a13000000b003db0ef4dedcso375575wmc.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 16:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=if8KkFAbX4tKZerzemH1jyXjHQrdZV5HL6+sFppcaEE=;
        b=SJNVTRYjI2THyGzGz4HIWJbpgDC80pm5TpQthPTezxX9Z6c5i50kK2OGjFxYrfqGgG
         hsrrgrf1rpZs01A1UApTtZTpeJjX+itfm+hUyDT5e4sF2Kph654Rs3K0xJyZFSm9X/vB
         iH6PbumTs/hSYn3CYJESHfccvQ/BPkGD9Nw0nlF6eg7pV4HdaEaX+agurT/bJX3HrcNh
         w96y1lJQEY9gdaIV/oPcqmuL+71UAj6REzNgKY0aqjefe6g1WoiIbunjGq7iRS+Supo2
         kbiaYd7AkXdpoHfSVMTw5hcynSYBXxoLMvsVemqv5xMyC0tSjAkQzxIFXnj+0D8RUd3i
         VuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=if8KkFAbX4tKZerzemH1jyXjHQrdZV5HL6+sFppcaEE=;
        b=bAtfV4sdy+S+FesArzhWr/9OfXdk68WwQv8RTkMjk1CFajUi1Tb4aqLmmINiL8TYcm
         YPQaOA9+PkXoK0SQgKeiK7pQuULY7F1NdwCcXdZvbbBTWhW3KCBvjuUAoPb3FUOgdbQu
         ziY26oYOjElFLJynVAF3tXewX7ri1BSXTFj/D6qhoCoWDAX6+hG4wIvbjmQKi9viCNED
         Se1+cFUugiQ0MwOxT3p7s+YO7xHVlCLyqPDxTnv2R6TntsM8t33Ung7MdfoNUaqfhb+H
         He2qfeLYrNXIAHGBLLu9oka+agee2sgY/tOwRtCPAqVMKw/0ug/bi9xCJzrLD9plBosZ
         wf6Q==
X-Gm-Message-State: AFqh2krwCGhVHQTf9nsu8b8fZgPSbc4cEGH3cah8DVYq9EGLehlq22BN
        HGAxZE/hBDj77nlTm8evLQs/+w==
X-Google-Smtp-Source: AMrXdXv+NWiZZieFqmutYe0qZrSrtRL7q341VEXulOX+8ZRRTChGZvprqXv7c+R+yW6X9wPHnKcwkw==
X-Received: by 2002:a7b:cc14:0:b0:3da:50b0:e96a with SMTP id f20-20020a7bcc14000000b003da50b0e96amr4761963wmh.29.1674003214077;
        Tue, 17 Jan 2023 16:53:34 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id t17-20020a05600001d100b00241d21d4652sm29609705wrx.21.2023.01.17.16.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 16:53:33 -0800 (PST)
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
Subject: [PATCH v3 2/8] phy: qcom-qmp: pcs: Add v6 register offsets
Date:   Wed, 18 Jan 2023 02:53:22 +0200
Message-Id: <20230118005328.2378792-3-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118005328.2378792-1-abel.vesa@linaro.org>
References: <20230118005328.2378792-1-abel.vesa@linaro.org>
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
UFS and PCIE g3x2. Add the new PCS offsets in a dedicated header file.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h | 16 ++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h        |  2 ++
 2 files changed, 18 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h
new file mode 100644
index 000000000000..18c4a3abe590
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_V6_H_
+#define QCOM_PHY_QMP_PCS_V6_H_
+
+/* Only for QMP V6 PHY - USB/PCIe PCS registers */
+#define QPHY_V6_PCS_REFGEN_REQ_CONFIG1		0xdc
+#define QPHY_V6_PCS_RX_SIGDET_LVL		0x188
+#define QPHY_V6_PCS_RATE_SLEW_CNTRL1		0x198
+#define QPHY_V6_PCS_EQ_CONFIG2			0x1e0
+#define QPHY_V6_PCS_PCS_TX_RX_CONFIG		0x1d0
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index a63a691b8372..80e3b5c860b6 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -38,6 +38,8 @@
 
 #include "phy-qcom-qmp-pcs-v5_20.h"
 
+#include "phy-qcom-qmp-pcs-v6.h"
+
 /* Only for QMP V3 & V4 PHY - DP COM registers */
 #define QPHY_V3_DP_COM_PHY_MODE_CTRL			0x00
 #define QPHY_V3_DP_COM_SW_RESET				0x04
-- 
2.34.1

