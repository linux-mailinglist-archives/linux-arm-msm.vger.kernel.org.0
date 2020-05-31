Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 188761E999F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2020 19:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728354AbgEaRrK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 31 May 2020 13:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728347AbgEaRrJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 31 May 2020 13:47:09 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0DFCC061A0E;
        Sun, 31 May 2020 10:47:08 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id k26so9144351wmi.4;
        Sun, 31 May 2020 10:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wt153X3SfGeLU/28PiLxyW7Eg/sDzOciAysSAgQvX4I=;
        b=su+/USQKJq4UqSIn5rk1NuF6PU5Dp0PySUOCq9diRI10J8VtkT3jaAxBwfvOK0OeIw
         M+FFfh9ADXn6EBjZbfcJ3S4gMnCWW3KV+0LEF5JUbJabGbBlDQPBYMLIMXY4YmA64zFJ
         Fa/B9R30zXOj7jasDYt/7pjoSwgNnZPXWza0+TomqPJVXY6kYC9m/W/2cpKu9XLFJa7/
         g+gm0zOfHHNCEMv/SA10xHRuzyJy3GiC9slC39gCOucP2T1/Rb1WSAw7OBGDKvBn8FWR
         rf0ldQcgVFE7EewyxhbENfsIZkEVk72YbUhnvghS2UKfcQlN8lzIMTwWMGSkv4dDOHSR
         aavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wt153X3SfGeLU/28PiLxyW7Eg/sDzOciAysSAgQvX4I=;
        b=sU56qPoWo6XcRU7DhonO+7e9Yb33aQh2LAM7GPPxdIbdoA/mgPi5i5k65TitnXD6IJ
         aGvLN4o2MQojOQCO/8HAqRMM7GFjEUkOXWcIO6UyWMZ7p+6Tlr4cvoUzhTeUmTsvzwju
         wLH6L7jJRte8AIvVkxKOJv7z+/TJkfn4qj/icSr2mOO54QbgpjFJh6LkCDbg34K0itwv
         3NBVfMQcyWH7B02aV0/C7T/lfIKJafWigoQljhdsApdlnu8r2rSrYs7e2VY6saQMZ5lt
         9gyIBukfeTpGPC1eIAbqXFLz4D5v25U3auK2ZWD/XT+Izq80N0tCIstI09/y1Wyz8C6C
         Iadw==
X-Gm-Message-State: AOAM5327LSjQrIkP+XPA7dMGiboRJP6yFxyGMDH6abnAj9vp1YaR8i5i
        KxceL4jRzocTrkER3Jnabvo=
X-Google-Smtp-Source: ABdhPJyKLnkCUWM88yGl6jCAA+Hq6hrKlFtvmexOpR1Mb/cj34UcdXQ/yUqdXl6wqdyNv7XC8ibOvw==
X-Received: by 2002:a1c:9cd5:: with SMTP id f204mr17605713wme.105.1590947227683;
        Sun, 31 May 2020 10:47:07 -0700 (PDT)
Received: from localhost.localdomain (abad130.neoplus.adsl.tpnet.pl. [83.6.167.130])
        by smtp.googlemail.com with ESMTPSA id x186sm9716494wmg.8.2020.05.31.10.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 10:47:07 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] Add compatible strings and the include files for the msm8992 GCC.
Date:   Sun, 31 May 2020 19:46:08 +0200
Message-Id: <20200531174612.260113-3-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531174612.260113-1-konradybcio@gmail.com>
References: <20200531174612.260113-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit adds the include files and documents compatible
strings for the msm8992 GCC driver

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 .../devicetree/bindings/clock/qcom,gcc.yaml   |   2 +
 include/dt-bindings/clock/qcom,gcc-msm8992.h  | 144 ++++++++++++++++++
 include/dt-bindings/reset/qcom,gcc-msm8992.h  |   8 +
 3 files changed, 154 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8992.h
 create mode 100644 include/dt-bindings/reset/qcom,gcc-msm8992.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
index e533bb0cfd2b..66e51f2c0c27 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
@@ -26,6 +26,7 @@ description: |
   - dt-bindings/reset/qcom,gcc-msm8660.h
   - dt-bindings/clock/qcom,gcc-msm8974.h
   - dt-bindings/reset/qcom,gcc-msm8974.h
+  - dt-bindings/reset/qcom,gcc-msm8992.h
   - dt-bindings/clock/qcom,gcc-msm8994.h
   - dt-bindings/clock/qcom,gcc-mdm9615.h
   - dt-bindings/reset/qcom,gcc-mdm9615.h
@@ -45,6 +46,7 @@ properties:
       - qcom,gcc-msm8974
       - qcom,gcc-msm8974pro
       - qcom,gcc-msm8974pro-ac
+      - qcom,gcc-msm8992
       - qcom,gcc-msm8994
       - qcom,gcc-mdm9615
       - qcom,gcc-sdm630
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8992.h b/include/dt-bindings/clock/qcom,gcc-msm8992.h
new file mode 100644
index 000000000000..8591a881005d
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gcc-msm8992.h
@@ -0,0 +1,144 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2016, The Linux Foundation. All rights reserved.
+ */
+
+
+#ifndef _DT_BINDINGS_CLK_MSM_GCC_8992_H
+#define _DT_BINDINGS_CLK_MSM_GCC_8992_H
+
+#define GPLL0_EARLY                     0
+#define GPLL0                           1
+#define GPLL4_EARLY                     2
+#define GPLL4                           3
+#define USB30_MASTER_CLK_SRC            4
+#define BLSP1_QUP1_I2C_APPS_CLK_SRC     5
+#define BLSP1_QUP1_SPI_APPS_CLK_SRC     6
+#define BLSP1_QUP2_I2C_APPS_CLK_SRC     7
+#define BLSP1_QUP2_SPI_APPS_CLK_SRC     8
+#define BLSP1_QUP3_I2C_APPS_CLK_SRC     9
+#define BLSP1_QUP3_SPI_APPS_CLK_SRC     10
+#define BLSP1_QUP4_I2C_APPS_CLK_SRC     11
+#define BLSP1_QUP4_SPI_APPS_CLK_SRC     12
+#define BLSP1_QUP5_I2C_APPS_CLK_SRC     13
+#define BLSP1_QUP5_SPI_APPS_CLK_SRC     14
+#define BLSP1_QUP6_I2C_APPS_CLK_SRC     15
+#define BLSP1_QUP6_SPI_APPS_CLK_SRC     16
+#define BLSP1_UART1_APPS_CLK_SRC        17
+#define BLSP1_UART2_APPS_CLK_SRC        18
+#define BLSP1_UART3_APPS_CLK_SRC        19
+#define BLSP1_UART4_APPS_CLK_SRC        20
+#define BLSP1_UART5_APPS_CLK_SRC        21
+#define BLSP1_UART6_APPS_CLK_SRC        22
+#define BLSP2_QUP1_I2C_APPS_CLK_SRC     23
+#define BLSP2_QUP1_SPI_APPS_CLK_SRC     24
+#define BLSP2_QUP2_I2C_APPS_CLK_SRC     25
+#define BLSP2_QUP2_SPI_APPS_CLK_SRC     26
+#define BLSP2_QUP3_I2C_APPS_CLK_SRC     27
+#define BLSP2_QUP3_SPI_APPS_CLK_SRC     28
+#define BLSP2_QUP4_I2C_APPS_CLK_SRC     29
+#define BLSP2_QUP4_SPI_APPS_CLK_SRC     30
+#define BLSP2_QUP5_I2C_APPS_CLK_SRC     31
+#define BLSP2_QUP5_SPI_APPS_CLK_SRC     32
+#define BLSP2_QUP6_I2C_APPS_CLK_SRC     33
+#define BLSP2_QUP6_SPI_APPS_CLK_SRC     34
+#define BLSP2_UART1_APPS_CLK_SRC        35
+#define BLSP2_UART2_APPS_CLK_SRC        36
+#define BLSP2_UART3_APPS_CLK_SRC        37
+#define BLSP2_UART4_APPS_CLK_SRC        38
+#define BLSP2_UART5_APPS_CLK_SRC        39
+#define BLSP2_UART6_APPS_CLK_SRC        40
+#define GP1_CLK_SRC                     41
+#define GP2_CLK_SRC                     42
+#define GP3_CLK_SRC                     43
+#define PCIE_0_AUX_CLK_SRC              44
+#define PCIE_0_PIPE_CLK_SRC             45
+#define PDM2_CLK_SRC                    46
+#define SDCC1_APPS_CLK_SRC              47
+#define SDCC2_APPS_CLK_SRC              48
+#define SDCC3_APPS_CLK_SRC              49
+#define SDCC4_APPS_CLK_SRC              50
+#define TSIF_REF_CLK_SRC                51
+#define USB30_MOCK_UTMI_CLK_SRC         52
+#define USB3_PHY_AUX_CLK_SRC            53
+#define USB_HS_SYSTEM_CLK_SRC           54
+#define GCC_BLSP1_AHB_CLK               55
+#define GCC_BLSP1_QUP1_I2C_APPS_CLK     56
+#define GCC_BLSP1_QUP1_SPI_APPS_CLK     57
+#define GCC_BLSP1_QUP2_I2C_APPS_CLK     58
+#define GCC_BLSP1_QUP2_SPI_APPS_CLK     59
+#define GCC_BLSP1_QUP3_I2C_APPS_CLK     60
+#define GCC_BLSP1_QUP3_SPI_APPS_CLK     61
+#define GCC_BLSP1_QUP4_I2C_APPS_CLK     62
+#define GCC_BLSP1_QUP4_SPI_APPS_CLK     63
+#define GCC_BLSP1_QUP5_I2C_APPS_CLK     64
+#define GCC_BLSP1_QUP5_SPI_APPS_CLK     65
+#define GCC_BLSP1_QUP6_I2C_APPS_CLK     66
+#define GCC_BLSP1_QUP6_SPI_APPS_CLK     67
+#define GCC_BLSP1_UART1_APPS_CLK        69
+#define GCC_BLSP1_UART2_APPS_CLK        70
+#define GCC_BLSP1_UART3_APPS_CLK        71
+#define GCC_BLSP1_UART4_APPS_CLK        72
+#define GCC_BLSP1_UART5_APPS_CLK        73
+#define GCC_BLSP1_UART6_APPS_CLK        74
+#define GCC_BLSP2_AHB_CLK               75
+#define GCC_BLSP2_QUP1_I2C_APPS_CLK     76
+#define GCC_BLSP2_QUP1_SPI_APPS_CLK     77
+#define GCC_BLSP2_QUP2_I2C_APPS_CLK     78
+#define GCC_BLSP2_QUP2_SPI_APPS_CLK     79
+#define GCC_BLSP2_QUP3_I2C_APPS_CLK     80
+#define GCC_BLSP2_QUP3_SPI_APPS_CLK     81
+#define GCC_BLSP2_QUP4_I2C_APPS_CLK     82
+#define GCC_BLSP2_QUP4_SPI_APPS_CLK     83
+#define GCC_BLSP2_QUP5_I2C_APPS_CLK     84
+#define GCC_BLSP2_QUP5_SPI_APPS_CLK     85
+#define GCC_BLSP2_QUP6_I2C_APPS_CLK     86
+#define GCC_BLSP2_QUP6_SPI_APPS_CLK     87
+#define GCC_BLSP2_UART1_APPS_CLK        88
+#define GCC_BLSP2_UART2_APPS_CLK        89
+#define GCC_BLSP2_UART3_APPS_CLK        90
+#define GCC_BLSP2_UART4_APPS_CLK        91
+#define GCC_BLSP2_UART5_APPS_CLK        92
+#define GCC_BLSP2_UART6_APPS_CLK        93
+#define GCC_BOOT_ROM_AHB_CLK            94
+#define GCC_GP1_CLK                     95
+#define GCC_GP2_CLK                     96
+#define GCC_GP3_CLK                     97
+#define GCC_MSS_CFG_AHB_CLK             98
+#define GCC_MSS_Q6_BIMC_AXI_CLK         99
+#define GCC_PCIE_0_AUX_CLK              100
+#define GCC_PCIE_0_CFG_AHB_CLK          101
+#define GCC_PCIE_0_MSTR_AXI_CLK         102
+#define GCC_PCIE_0_PIPE_CLK             103
+#define GCC_PCIE_0_SLV_AXI_CLK          104
+#define GCC_PDM2_CLK                    105
+#define GCC_PDM_AHB_CLK                 106
+#define GCC_PRNG_AHB_CLK                107
+#define GCC_SDCC1_AHB_CLK               108
+#define GCC_SDCC1_APPS_CLK              109
+#define GCC_SDCC2_AHB_CLK               110
+#define GCC_SDCC2_APPS_CLK              111
+#define GCC_SDCC3_AHB_CLK               112
+#define GCC_SDCC3_APPS_CLK              113
+#define GCC_SDCC4_AHB_CLK               114
+#define GCC_SDCC4_APPS_CLK              115
+#define GCC_SYS_NOC_USB3_AXI_CLK        116
+#define GCC_TSIF_AHB_CLK                117
+#define GCC_TSIF_REF_CLK                118
+#define GCC_USB2_HS_PHY_SLEEP_CLK       119
+#define GCC_USB30_MASTER_CLK            120
+#define GCC_USB30_MOCK_UTMI_CLK         121
+#define	GCC_USB30_SLEEP_CLK             122
+#define GCC_USB3_PHY_AUX_CLK            123
+#define GCC_USB3_PHY_PIPE_CLK           124
+#define GCC_USB_HS_AHB_CLK              125
+#define GCC_USB_HS_SYSTEM_CLK           126
+#define GCC_USB_PHY_CFG_AHB2PHY_CLK     127
+
+
+/* Indexes for GDSCs */
+#define PCIE_GDSC                       0
+#define PCIE_0_GDSC                     1
+#define USB30_GDSC                      2
+
+#endif
diff --git a/include/dt-bindings/reset/qcom,gcc-msm8992.h b/include/dt-bindings/reset/qcom,gcc-msm8992.h
new file mode 100644
index 000000000000..558dfeffdeef
--- /dev/null
+++ b/include/dt-bindings/reset/qcom,gcc-msm8992.h
@@ -0,0 +1,8 @@
+#ifndef _DT_BINDINGS_RESET_MSM_GCC_8992_H
+#define _DT_BINDINGS_RESET_MSM_GCC_8992_H
+
+#define PCIE_PHY_0_RESET 0
+#define QUSB2_PHY_RESET 1
+#define USB3_PHY_RESET 2
+
+#endif
-- 
2.26.2

