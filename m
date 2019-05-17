Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0347E211DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2019 03:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbfEQBxN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 May 2019 21:53:13 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44328 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbfEQBxM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 May 2019 21:53:12 -0400
Received: by mail-pg1-f194.google.com with SMTP id z16so2448552pgv.11;
        Thu, 16 May 2019 18:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FW7rbiolPtohPhTITiFmu0+Zodqeamyvi8TgPw3jQyM=;
        b=BiGLY2KBL471rrDQaI58yXqH3Ujru8Z9KOHnpiRAGgc/8tDiPTtpjnk0Bw1VIgwa0d
         sHCDhq5dVEusem5ssrZkFmPJjgWrOntiVYwnGUxHxEo1BY5iREO6BIWHFFiliRxIQnYJ
         wRgxHYMzIdMWZ+F8oIRFRQl69P169yfcco9FMdY/f3IWRq8p27sQ4QA5iDUygBdb1r8e
         D5wwHH5hCDH83fC9o9eMCV1a0F+4ehWMscLm+3r7iEUOK1e51EWGy/WfR36h7m8zhS2Y
         sGBTJFvx+lJl58VAbQWqywFTdHrtWNDSVrpWL+WfRfGeewMHVNWL0G1q3VPtqsbdxdfD
         p0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FW7rbiolPtohPhTITiFmu0+Zodqeamyvi8TgPw3jQyM=;
        b=JrnAbpWN/tkjKulUn5NgifOwbQkjp2/paDM2GrTlphzJ817qjeFSun+dx6Ol3kAwGP
         a8M1DVSMyGi4syJc1nZ3+N4IdliNgVN4WjRR4ic23A+NG0P0vfuWe7AyXU46eAfCyCth
         j74wZ1eHop/NH6qsvlbHEHkth1CG7jav16SwSzcz3jQHOdo5aJEzdtsu7PNeBg422JYa
         CqnnHz8j9AxdIo5V2PEtfDEtNqbXsyQuB0n1aPnWvwcsJgy4Nt+eEkFixoRz2CA3JpEs
         hCVywOKPFPpXxPkTSf0YB4YbJd/hfAlQmkz4gzGZW1wrsdux/v2P7Zamb8UYoo4wzi65
         Ak+A==
X-Gm-Message-State: APjAAAWI81ie0Uh8HfygxyDHYFyAw4aCt4nnKTLH4fI+imQTmeI5OEDp
        9HsG5Mg8WG7RGi9siUVHQB9z9MKM63o=
X-Google-Smtp-Source: APXvYqz1vql2ACeAt7v9b3amgaArvV8veWozpK3bCsvSTlyCXswui0z5TM3Eql6cWdfeXtvqZmFNFw==
X-Received: by 2002:a65:610a:: with SMTP id z10mr54152176pgu.54.1558057990538;
        Thu, 16 May 2019 18:53:10 -0700 (PDT)
Received: from localhost ([67.139.178.66])
        by smtp.gmail.com with ESMTPSA id i12sm8318254pfd.33.2019.05.16.18.53.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 May 2019 18:53:09 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Brian Norris <briannorris@chromium.org>,
        Venkat Gopalakrishnan <venkatg@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sdm845-cheza: add initial cheza dt
Date:   Thu, 16 May 2019 18:52:46 -0700
Message-Id: <20190517015305.23194-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This is essentialy a squash of a bunch of history of cheza dt updates
from chromium kernel, some of which were themselves squashes of history
from older chromium kernels.

I don't claim any credit other than wanting to more easily boot upstream
kernel on cheza to have an easier way to test upstream driver work ;-)

I've added below in Cc tags all the original actual authors (apologies
if I missed any).

Cc: Douglas Anderson <dianders@chromium.org>
Cc: Sibi Sankar <sibis@codeaurora.org>
Cc: Evan Green <evgreen@chromium.org>
Cc: Matthias Kaehlcke <mka@chromium.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Brian Norris <briannorris@chromium.org>
Cc: Venkat Gopalakrishnan <venkatg@codeaurora.org>
Cc: Rajendra Nayak <rnayak@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
Updated from review comments and squashed.  I left out the the patch
related to deleting gpu_mem/zap_shader nodes as the corresponding
patch that adds them in sdm845.dtsi hasn't landed yet, but once it
has we will need to revisit that patch for cheza.

 arch/arm64/boot/dts/qcom/Makefile            |    3 +
 arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dts |  238 ++++
 arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dts |  238 ++++
 arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dts |  174 +++
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi   | 1326 ++++++++++++++++++
 5 files changed, 1979 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 21d548f02d39..cf325b263934 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -7,6 +7,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-angler-rev-101.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-mtp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r1.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dts b/arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dts
new file mode 100644
index 000000000000..bd7c25bb8d35
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dts
@@ -0,0 +1,238 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Cheza board device tree source
+ *
+ * Copyright 2018 Google LLC.
+ */
+
+/dts-v1/;
+
+#include "sdm845-cheza.dtsi"
+
+/ {
+	model = "Google Cheza (rev1)";
+	compatible = "google,cheza-rev1", "qcom,sdm845";
+
+	/*
+	 * FIXED REGULATORS (not in sdm845-cheza.dtsi) - parents above children
+	 */
+
+	/*
+	 * NOTE: Technically pp3500_a is not the exact same signal as
+	 * pp3500_a_vbob (there's a load switch between them and the EC can
+	 * control pp3500_a via "en_pp3300_a"), but from the AP's point of
+	 * view they are the same.
+	 */
+	pp3500_a:
+	pp3500_a_vbob: pp3500-a-vbob-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_bob";
+
+		/*
+		 * Comes on automatically when pp5000_ldo comes on, which
+		 * comes on automatically when ppvar_sys comes on
+		 */
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3500000>;
+		regulator-max-microvolt = <3500000>;
+
+		vin-supply = <&ppvar_sys>;
+	};
+
+	pp3300_dx_edp: pp3300-dx-edp-regulator {
+		/* Yes, it's really 3.5 despite the name of the signal */
+		regulator-min-microvolt = <3500000>;
+		regulator-max-microvolt = <3500000>;
+
+		vin-supply = <&pp3500_a>;
+	};
+};
+
+/* FIXED REGULATOR OVERRIDES (modifications to sdm845-cheza.dtsi) */
+
+/*
+ * L19 and L28 technically go to 3.3V, but most boards have old AOP firmware
+ * that limits them to 3.0, and trying to run at 3.3V with that old firmware
+ * prevents the system from booting.
+ */
+&src_pp3000_l19a {
+	regulator-min-microvolt = <3008000>;
+	regulator-max-microvolt = <3008000>;
+};
+
+&src_pp3300_l22a {
+	/delete-property/regulator-boot-on;
+	/delete-property/regulator-always-on;
+};
+
+&src_pp3300_l28a {
+	regulator-min-microvolt = <3008000>;
+	regulator-max-microvolt = <3008000>;
+};
+
+&src_vreg_bob {
+	regulator-min-microvolt = <3500000>;
+	regulator-max-microvolt = <3500000>;
+	vin-supply = <&pp3500_a_vbob>;
+};
+
+/*
+ * NON-REGULATOR OVERRIDES
+ * (modifications to sdm845-cheza.dtsi) - alphabetized by dtsi label
+ */
+
+/* PINCTRL - board-specific pinctrl */
+
+&tlmm {
+	gpio-line-names = "AP_SPI_FP_MISO",
+			  "AP_SPI_FP_MOSI",
+			  "AP_SPI_FP_CLK",
+			  "AP_SPI_FP_CS_L",
+			  "UART_AP_TX_DBG_RX",
+			  "UART_DBG_TX_AP_RX",
+			  "",
+			  "FP_RST_L",
+			  "FCAM_EN",
+			  "",
+			  "EDP_BRIJ_IRQ",
+			  "EC_IN_RW_ODL",
+			  "",
+			  "RCAM_MCLK",
+			  "FCAM_MCLK",
+			  "",
+			  "RCAM_EN",
+			  "CCI0_SDA",
+			  "CCI0_SCL",
+			  "CCI1_SDA",
+			  "CCI1_SCL",
+			  "FCAM_RST_L",
+			  "",
+			  "PEN_RST_L",
+			  "PEN_IRQ_L",
+			  "",
+			  "RCAM_VSYNC",
+			  "ESIM_MISO",
+			  "ESIM_MOSI",
+			  "ESIM_CLK",
+			  "ESIM_CS_L",
+			  "AP_PEN_1V8_SDA",
+			  "AP_PEN_1V8_SCL",
+			  "AP_TS_I2C_SDA",
+			  "AP_TS_I2C_SCL",
+			  "RCAM_RST_L",
+			  "",
+			  "AP_EDP_BKLTEN",
+			  "AP_BRD_ID1",
+			  "BOOT_CONFIG_4",
+			  "AMP_IRQ_L",
+			  "EDP_BRIJ_I2C_SDA",
+			  "EDP_BRIJ_I2C_SCL",
+			  "EN_PP3300_DX_EDP",
+			  "SD_CD_ODL",
+			  "BT_UART_RTS",
+			  "BT_UART_CTS",
+			  "BT_UART_RXD",
+			  "BT_UART_TXD",
+			  "AMP_I2C_SDA",
+			  "AMP_I2C_SCL",
+			  "AP_BRD_ID3",
+			  "",
+			  "AP_EC_SPI_CLK",
+			  "AP_EC_SPI_CS_L",
+			  "AP_EC_SPI_MISO",
+			  "AP_EC_SPI_MOSI",
+			  "FORCED_USB_BOOT",
+			  "AMP_BCLK",
+			  "AMP_LRCLK",
+			  "AMP_DOUT",
+			  "AMP_DIN",
+			  "AP_BRD_ID2",
+			  "PEN_PDCT_L",
+			  "HP_MCLK",
+			  "HP_BCLK",
+			  "HP_LRCLK",
+			  "HP_DOUT",
+			  "HP_DIN",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "BT_SLIMBUS_DATA",
+			  "BT_SLIMBUS_CLK",
+			  "AMP_RESET_L",
+			  "",
+			  "FCAM_VSYNC",
+			  "",
+			  "AP_SKU_ID1",
+			  "EC_WOV_BCLK",
+			  "EC_WOV_LRCLK",
+			  "EC_WOV_DOUT",
+			  "",
+			  "",
+			  "AP_H1_SPI_MISO",
+			  "AP_H1_SPI_MOSI",
+			  "AP_H1_SPI_CLK",
+			  "AP_H1_SPI_CS_L",
+			  "",
+			  "AP_SPI_CS0_L",
+			  "AP_SPI_MOSI",
+			  "AP_SPI_MISO",
+			  "",
+			  "",
+			  "AP_SPI_CLK",
+			  "",
+			  "RFFE6_CLK",
+			  "RFFE6_DATA",
+			  "BOOT_CONFIG_1",
+			  "BOOT_CONFIG_2",
+			  "BOOT_CONFIG_0",
+			  "EDP_BRIJ_EN",
+			  "",
+			  "USB_HS_TX_EN",
+			  "UIM2_DATA",
+			  "UIM2_CLK",
+			  "UIM2_RST",
+			  "UIM2_PRESENT",
+			  "UIM1_DATA",
+			  "UIM1_CLK",
+			  "UIM1_RST",
+			  "",
+			  "AP_SKU_ID2",
+			  "SDM_GRFC_8",
+			  "SDM_GRFC_9",
+			  "AP_RST_REQ",
+			  "HP_IRQ",
+			  "TS_RESET_L",
+			  "PEN_EJECT_ODL",
+			  "HUB_RST_L",
+			  "FP_TO_AP_IRQ",
+			  "AP_EC_INT_L",
+			  "",
+			  "",
+			  "TS_INT_L",
+			  "AP_SUSPEND_L",
+			  "SDM_GRFC_3",
+			  "",
+			  "H1_AP_INT_ODL",
+			  "QLINK_REQ",
+			  "QLINK_EN",
+			  "SDM_GRFC_2",
+			  "BOOT_CONFIG_3",
+			  "WMSS_RESET_L",
+			  "SDM_GRFC_0",
+			  "SDM_GRFC_1",
+			  "RFFE3_DATA",
+			  "RFFE3_CLK",
+			  "RFFE4_DATA",
+			  "RFFE4_CLK",
+			  "RFFE5_DATA",
+			  "RFFE5_CLK",
+			  "GNSS_EN",
+			  "WCI2_LTE_COEX_RXD",
+			  "WCI2_LTE_COEX_TXD",
+			  "AP_RAM_ID1",
+			  "AP_RAM_ID2",
+			  "RFFE1_DATA",
+			  "RFFE1_CLK";
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dts b/arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dts
new file mode 100644
index 000000000000..2b7230594ecb
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dts
@@ -0,0 +1,238 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Cheza board device tree source
+ *
+ * Copyright 2018 Google LLC.
+ */
+
+/dts-v1/;
+
+#include "sdm845-cheza.dtsi"
+
+/ {
+	model = "Google Cheza (rev2)";
+	compatible = "google,cheza-rev2", "qcom,sdm845";
+
+	/*
+	 * FIXED REGULATORS (not in sdm845-cheza.dtsi) - parents above children
+	 */
+
+	/*
+	 * NOTE: Technically pp3500_a is not the exact same signal as
+	 * pp3500_a_vbob (there's a load switch between them and the EC can
+	 * control pp3500_a via "en_pp3300_a"), but from the AP's point of
+	 * view they are the same.
+	 */
+	pp3500_a:
+	pp3500_a_vbob: pp3500-a-vbob-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_bob";
+
+		/*
+		 * Comes on automatically when pp5000_ldo comes on, which
+		 * comes on automatically when ppvar_sys comes on
+		 */
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3500000>;
+		regulator-max-microvolt = <3500000>;
+
+		vin-supply = <&ppvar_sys>;
+	};
+
+	pp3300_dx_edp: pp3300-dx-edp-regulator {
+		/* Yes, it's really 3.5 despite the name of the signal */
+		regulator-min-microvolt = <3500000>;
+		regulator-max-microvolt = <3500000>;
+
+		vin-supply = <&pp3500_a>;
+	};
+};
+
+/* FIXED REGULATOR OVERRIDES (modifications to sdm845-cheza.dtsi) */
+
+/*
+ * L19 and L28 technically go to 3.3V, but most boards have old AOP firmware
+ * that limits them to 3.0, and trying to run at 3.3V with that old firmware
+ * prevents the system from booting.
+ */
+&src_pp3000_l19a {
+	regulator-min-microvolt = <3008000>;
+	regulator-max-microvolt = <3008000>;
+};
+
+&src_pp3300_l22a {
+	/delete-property/regulator-boot-on;
+	/delete-property/regulator-always-on;
+};
+
+&src_pp3300_l28a {
+	regulator-min-microvolt = <3008000>;
+	regulator-max-microvolt = <3008000>;
+};
+
+&src_vreg_bob {
+	regulator-min-microvolt = <3500000>;
+	regulator-max-microvolt = <3500000>;
+	vin-supply = <&pp3500_a_vbob>;
+};
+
+/*
+ * NON-REGULATOR OVERRIDES
+ * (modifications to sdm845-cheza.dtsi) - alphabetized by dtsi label
+ */
+
+/* PINCTRL - board-specific pinctrl */
+
+&tlmm {
+	gpio-line-names = "AP_SPI_FP_MISO",
+			  "AP_SPI_FP_MOSI",
+			  "AP_SPI_FP_CLK",
+			  "AP_SPI_FP_CS_L",
+			  "UART_AP_TX_DBG_RX",
+			  "UART_DBG_TX_AP_RX",
+			  "BRIJ_SUSPEND",
+			  "FP_RST_L",
+			  "FCAM_EN",
+			  "",
+			  "EDP_BRIJ_IRQ",
+			  "EC_IN_RW_ODL",
+			  "",
+			  "RCAM_MCLK",
+			  "FCAM_MCLK",
+			  "",
+			  "RCAM_EN",
+			  "CCI0_SDA",
+			  "CCI0_SCL",
+			  "CCI1_SDA",
+			  "CCI1_SCL",
+			  "FCAM_RST_L",
+			  "FPMCU_BOOT0",
+			  "PEN_RST_L",
+			  "PEN_IRQ_L",
+			  "FPMCU_SEL_OD",
+			  "RCAM_VSYNC",
+			  "ESIM_MISO",
+			  "ESIM_MOSI",
+			  "ESIM_CLK",
+			  "ESIM_CS_L",
+			  "AP_PEN_1V8_SDA",
+			  "AP_PEN_1V8_SCL",
+			  "AP_TS_I2C_SDA",
+			  "AP_TS_I2C_SCL",
+			  "RCAM_RST_L",
+			  "",
+			  "AP_EDP_BKLTEN",
+			  "AP_BRD_ID1",
+			  "BOOT_CONFIG_4",
+			  "AMP_IRQ_L",
+			  "EDP_BRIJ_I2C_SDA",
+			  "EDP_BRIJ_I2C_SCL",
+			  "EN_PP3300_DX_EDP",
+			  "SD_CD_ODL",
+			  "BT_UART_RTS",
+			  "BT_UART_CTS",
+			  "BT_UART_RXD",
+			  "BT_UART_TXD",
+			  "AMP_I2C_SDA",
+			  "AMP_I2C_SCL",
+			  "AP_BRD_ID3",
+			  "",
+			  "AP_EC_SPI_CLK",
+			  "AP_EC_SPI_CS_L",
+			  "AP_EC_SPI_MISO",
+			  "AP_EC_SPI_MOSI",
+			  "FORCED_USB_BOOT",
+			  "AMP_BCLK",
+			  "AMP_LRCLK",
+			  "AMP_DOUT",
+			  "AMP_DIN",
+			  "AP_BRD_ID2",
+			  "PEN_PDCT_L",
+			  "HP_MCLK",
+			  "HP_BCLK",
+			  "HP_LRCLK",
+			  "HP_DOUT",
+			  "HP_DIN",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "BT_SLIMBUS_DATA",
+			  "BT_SLIMBUS_CLK",
+			  "AMP_RESET_L",
+			  "",
+			  "FCAM_VSYNC",
+			  "",
+			  "AP_SKU_ID1",
+			  "EC_WOV_BCLK",
+			  "EC_WOV_LRCLK",
+			  "EC_WOV_DOUT",
+			  "",
+			  "",
+			  "AP_H1_SPI_MISO",
+			  "AP_H1_SPI_MOSI",
+			  "AP_H1_SPI_CLK",
+			  "AP_H1_SPI_CS_L",
+			  "",
+			  "AP_SPI_CS0_L",
+			  "AP_SPI_MOSI",
+			  "AP_SPI_MISO",
+			  "",
+			  "",
+			  "AP_SPI_CLK",
+			  "",
+			  "RFFE6_CLK",
+			  "RFFE6_DATA",
+			  "BOOT_CONFIG_1",
+			  "BOOT_CONFIG_2",
+			  "BOOT_CONFIG_0",
+			  "EDP_BRIJ_EN",
+			  "",
+			  "USB_HS_TX_EN",
+			  "UIM2_DATA",
+			  "UIM2_CLK",
+			  "UIM2_RST",
+			  "UIM2_PRESENT",
+			  "UIM1_DATA",
+			  "UIM1_CLK",
+			  "UIM1_RST",
+			  "",
+			  "AP_SKU_ID2",
+			  "SDM_GRFC_8",
+			  "SDM_GRFC_9",
+			  "AP_RST_REQ",
+			  "HP_IRQ",
+			  "TS_RESET_L",
+			  "PEN_EJECT_ODL",
+			  "HUB_RST_L",
+			  "FP_TO_AP_IRQ",
+			  "AP_EC_INT_L",
+			  "",
+			  "",
+			  "TS_INT_L",
+			  "AP_SUSPEND_L",
+			  "SDM_GRFC_3",
+			  "",
+			  "H1_AP_INT_ODL",
+			  "QLINK_REQ",
+			  "QLINK_EN",
+			  "SDM_GRFC_2",
+			  "BOOT_CONFIG_3",
+			  "WMSS_RESET_L",
+			  "SDM_GRFC_0",
+			  "SDM_GRFC_1",
+			  "RFFE3_DATA",
+			  "RFFE3_CLK",
+			  "RFFE4_DATA",
+			  "RFFE4_CLK",
+			  "RFFE5_DATA",
+			  "RFFE5_CLK",
+			  "GNSS_EN",
+			  "WCI2_LTE_COEX_RXD",
+			  "WCI2_LTE_COEX_TXD",
+			  "AP_RAM_ID1",
+			  "AP_RAM_ID2",
+			  "RFFE1_DATA",
+			  "RFFE1_CLK";
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dts b/arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dts
new file mode 100644
index 000000000000..1ba67be08f81
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dts
@@ -0,0 +1,174 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Cheza board device tree source
+ *
+ * Copyright 2018 Google LLC.
+ */
+
+/dts-v1/;
+
+#include "sdm845-cheza.dtsi"
+
+/ {
+	model = "Google Cheza (rev3+)";
+	compatible = "google,cheza", "qcom,sdm845";
+};
+
+/* PINCTRL - board-specific pinctrl */
+
+&tlmm {
+	gpio-line-names = "AP_SPI_FP_MISO",
+			  "AP_SPI_FP_MOSI",
+			  "AP_SPI_FP_CLK",
+			  "AP_SPI_FP_CS_L",
+			  "UART_AP_TX_DBG_RX",
+			  "UART_DBG_TX_AP_RX",
+			  "BRIJ_SUSPEND",
+			  "FP_RST_L",
+			  "FCAM_EN",
+			  "",
+			  "EDP_BRIJ_IRQ",
+			  "EC_IN_RW_ODL",
+			  "",
+			  "RCAM_MCLK",
+			  "FCAM_MCLK",
+			  "",
+			  "RCAM_EN",
+			  "CCI0_SDA",
+			  "CCI0_SCL",
+			  "CCI1_SDA",
+			  "CCI1_SCL",
+			  "FCAM_RST_L",
+			  "FPMCU_BOOT0",
+			  "PEN_RST_L",
+			  "PEN_IRQ_L",
+			  "FPMCU_SEL_OD",
+			  "RCAM_VSYNC",
+			  "ESIM_MISO",
+			  "ESIM_MOSI",
+			  "ESIM_CLK",
+			  "ESIM_CS_L",
+			  "AP_PEN_1V8_SDA",
+			  "AP_PEN_1V8_SCL",
+			  "AP_TS_I2C_SDA",
+			  "AP_TS_I2C_SCL",
+			  "RCAM_RST_L",
+			  "",
+			  "AP_EDP_BKLTEN",
+			  "AP_BRD_ID0",
+			  "BOOT_CONFIG_4",
+			  "AMP_IRQ_L",
+			  "EDP_BRIJ_I2C_SDA",
+			  "EDP_BRIJ_I2C_SCL",
+			  "EN_PP3300_DX_EDP",
+			  "SD_CD_ODL",
+			  "BT_UART_RTS",
+			  "BT_UART_CTS",
+			  "BT_UART_RXD",
+			  "BT_UART_TXD",
+			  "AMP_I2C_SDA",
+			  "AMP_I2C_SCL",
+			  "AP_BRD_ID2",
+			  "",
+			  "AP_EC_SPI_CLK",
+			  "AP_EC_SPI_CS_L",
+			  "AP_EC_SPI_MISO",
+			  "AP_EC_SPI_MOSI",
+			  "FORCED_USB_BOOT",
+			  "AMP_BCLK",
+			  "AMP_LRCLK",
+			  "AMP_DOUT",
+			  "AMP_DIN",
+			  "AP_BRD_ID1",
+			  "PEN_PDCT_L",
+			  "HP_MCLK",
+			  "HP_BCLK",
+			  "HP_LRCLK",
+			  "HP_DOUT",
+			  "HP_DIN",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "BT_SLIMBUS_DATA",
+			  "BT_SLIMBUS_CLK",
+			  "AMP_RESET_L",
+			  "",
+			  "FCAM_VSYNC",
+			  "",
+			  "AP_SKU_ID0",
+			  "EC_WOV_BCLK",
+			  "EC_WOV_LRCLK",
+			  "EC_WOV_DOUT",
+			  "",
+			  "",
+			  "AP_H1_SPI_MISO",
+			  "AP_H1_SPI_MOSI",
+			  "AP_H1_SPI_CLK",
+			  "AP_H1_SPI_CS_L",
+			  "",
+			  "AP_SPI_CS0_L",
+			  "AP_SPI_MOSI",
+			  "AP_SPI_MISO",
+			  "",
+			  "",
+			  "AP_SPI_CLK",
+			  "",
+			  "RFFE6_CLK",
+			  "RFFE6_DATA",
+			  "BOOT_CONFIG_1",
+			  "BOOT_CONFIG_2",
+			  "BOOT_CONFIG_0",
+			  "EDP_BRIJ_EN",
+			  "",
+			  "USB_HS_TX_EN",
+			  "UIM2_DATA",
+			  "UIM2_CLK",
+			  "UIM2_RST",
+			  "UIM2_PRESENT",
+			  "UIM1_DATA",
+			  "UIM1_CLK",
+			  "UIM1_RST",
+			  "",
+			  "AP_SKU_ID1",
+			  "SDM_GRFC_8",
+			  "SDM_GRFC_9",
+			  "AP_RST_REQ",
+			  "HP_IRQ",
+			  "TS_RESET_L",
+			  "PEN_EJECT_ODL",
+			  "HUB_RST_L",
+			  "FP_TO_AP_IRQ",
+			  "AP_EC_INT_L",
+			  "",
+			  "",
+			  "TS_INT_L",
+			  "AP_SUSPEND_L",
+			  "SDM_GRFC_3",
+			  /*
+			   * AP_FLASH_WP_L is crossystem ABI. Rev3 schematics
+			   * call it BIOS_FLASH_WP_R_L.
+			   */
+			  "AP_FLASH_WP_L",
+			  "H1_AP_INT_ODL",
+			  "QLINK_REQ",
+			  "QLINK_EN",
+			  "SDM_GRFC_2",
+			  "BOOT_CONFIG_3",
+			  "WMSS_RESET_L",
+			  "SDM_GRFC_0",
+			  "SDM_GRFC_1",
+			  "RFFE3_DATA",
+			  "RFFE3_CLK",
+			  "RFFE4_DATA",
+			  "RFFE4_CLK",
+			  "RFFE5_DATA",
+			  "RFFE5_CLK",
+			  "GNSS_EN",
+			  "WCI2_LTE_COEX_RXD",
+			  "WCI2_LTE_COEX_TXD",
+			  "AP_RAM_ID0",
+			  "AP_RAM_ID1",
+			  "RFFE1_DATA",
+			  "RFFE1_CLK";
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
new file mode 100644
index 000000000000..1ebbd568dfd7
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -0,0 +1,1326 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Cheza device tree source (common between revisions)
+ *
+ * Copyright 2018 Google LLC.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "sdm845.dtsi"
+
+/* PMICs depend on spmi_bus label and so must come after SoC */
+#include "pm8005.dtsi"
+#include "pm8998.dtsi"
+
+/ {
+	aliases {
+		bluetooth0 = &bluetooth;
+		hsuart0 = &uart6;
+		serial0 = &uart9;
+		wifi0 = &wifi;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&cros_ec_pwm 0>;
+		enable-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+		power-supply = <&ppvar_sys>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ap_edp_bklten>;
+	};
+
+	/* FIXED REGULATORS - parents above children */
+
+	/* This is the top level supply and variable voltage */
+	ppvar_sys: ppvar-sys-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "ppvar_sys";
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	/* This divides ppvar_sys by 2, so voltage is variable */
+	src_vph_pwr: src-vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "src_vph_pwr";
+
+		/* EC turns on with switchcap_on_l; always on for AP */
+		regulator-always-on;
+		regulator-boot-on;
+
+		vin-supply = <&ppvar_sys>;
+	};
+
+	pp5000_a: pp5000-a-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "pp5000_a";
+
+		/* EC turns on with en_pp5000_a; always on for AP */
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		vin-supply = <&ppvar_sys>;
+	};
+
+	src_vreg_bob: src-vreg-bob-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "src_vreg_bob";
+
+		/* EC turns on with vbob_en; always on for AP */
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		vin-supply = <&ppvar_sys>;
+	};
+
+	pp3300_dx_edp: pp3300-dx-edp-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "pp3300_dx_edp";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 43 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&en_pp3300_dx_edp>;
+	};
+
+	/*
+	 * Apparently RPMh does not provide support for PM8998 S4 because it
+	 * is always-on; model it as a fixed regulator.
+	 */
+	src_pp1800_s4a: pm8998-smps4 {
+		compatible = "regulator-fixed";
+		regulator-name = "src_pp1800_s4a";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+
+		vin-supply = <&src_vph_pwr>;
+	};
+
+	/* BOARD-SPECIFIC TOP LEVEL NODES */
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pen_eject_odl>;
+
+		pen-insert {
+			label = "Pen Insert";
+			/* Insert = low, eject = high */
+			gpios = <&tlmm 119 GPIO_ACTIVE_LOW>;
+			linux,code = <SW_PEN_INSERTED>;
+			linux,input-type = <EV_SW>;
+			wakeup-source;
+		};
+	};
+
+	panel: panel {
+		compatible ="innolux,p120zdg-bf1";
+		power-supply = <&pp3300_dx_edp>;
+		backlight = <&backlight>;
+		no-hpd;
+
+		ports {
+			panel_in: port {
+				panel_in_edp: endpoint {
+					remote-endpoint = <&sn65dsi86_out>;
+				};
+			};
+		};
+	};
+};
+
+/*
+ * Reserved memory changes
+ *
+ * Putting this all together (out of order with the rest of the file) to keep
+ * all modifications to the memory map (from sdm845.dtsi) in one place.
+ */
+
+/*
+ * Our mpss_region is 8MB bigger than the default one and that conflicts
+ * with venus_mem and cdsp_mem.
+ *
+ * For venus_mem we'll delete and re-create at a different address.
+ *
+ * cdsp_mem isn't used on cheza right now so we won't bother re-creating it; but
+ * that also means we need to delete cdsp_pas.
+ */
+/delete-node/ &venus_mem;
+/delete-node/ &cdsp_mem;
+/delete-node/ &cdsp_pas;
+
+/* Increase the size from 120 MB to 128 MB */
+&mpss_region {
+	reg = <0 0x8e000000 0 0x8000000>;
+};
+
+/* Increase the size from 2MB to 8MB */
+&rmtfs_mem {
+	reg = <0 0x88f00000 0 0x800000>;
+};
+
+/ {
+	reserved-memory {
+		venus_mem: memory@96000000 {
+			reg = <0 0x96000000 0 0x500000>;
+			no-map;
+		};
+	};
+};
+
+&qspi {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_clk &qspi_cs0 &qspi_data01>;
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+
+		/*
+		 * In theory chip supports up to 104 MHz and controller up
+		 * to 80 MHz, but above 25 MHz wasn't reliable so we'll use
+		 * that for now.  b:117440651
+		 */
+		spi-max-frequency = <25000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+};
+
+
+&apps_rsc {
+	pm8998-rpmh-regulators {
+		compatible = "qcom,pm8998-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vdd-s1-supply = <&src_vph_pwr>;
+		vdd-s2-supply = <&src_vph_pwr>;
+		vdd-s3-supply = <&src_vph_pwr>;
+		vdd-s4-supply = <&src_vph_pwr>;
+		vdd-s5-supply = <&src_vph_pwr>;
+		vdd-s6-supply = <&src_vph_pwr>;
+		vdd-s7-supply = <&src_vph_pwr>;
+		vdd-s8-supply = <&src_vph_pwr>;
+		vdd-s9-supply = <&src_vph_pwr>;
+		vdd-s10-supply = <&src_vph_pwr>;
+		vdd-s11-supply = <&src_vph_pwr>;
+		vdd-s12-supply = <&src_vph_pwr>;
+		vdd-s13-supply = <&src_vph_pwr>;
+		vdd-l1-l27-supply = <&src_pp1025_s7a>;
+		vdd-l2-l8-l17-supply = <&src_pp1350_s3a>;
+		vdd-l3-l11-supply = <&src_pp1025_s7a>;
+		vdd-l4-l5-supply = <&src_pp1025_s7a>;
+		vdd-l6-supply = <&src_vph_pwr>;
+		vdd-l7-l12-l14-l15-supply = <&src_pp2040_s5a>;
+		vdd-l9-supply = <&src_pp2040_s5a>;
+		vdd-l10-l23-l25-supply = <&src_vreg_bob>;
+		vdd-l13-l19-l21-supply = <&src_vreg_bob>;
+		vdd-l16-l28-supply = <&src_vreg_bob>;
+		vdd-l18-l22-supply = <&src_vreg_bob>;
+		vdd-l20-l24-supply = <&src_vreg_bob>;
+		vdd-l26-supply = <&src_pp1350_s3a>;
+		vin-lvs-1-2-supply = <&src_pp1800_s4a>;
+
+		src_pp1125_s2a: smps2 {
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1100000>;
+		};
+
+		src_pp1350_s3a: smps3 {
+			regulator-min-microvolt = <1352000>;
+			regulator-max-microvolt = <1352000>;
+		};
+
+		src_pp2040_s5a: smps5 {
+			regulator-min-microvolt = <1904000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		src_pp1025_s7a: smps7 {
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <1028000>;
+		};
+
+		vdd_qusb_hs0:
+		vdda_hp_pcie_core:
+		vdda_mipi_csi0_0p9:
+		vdda_mipi_csi1_0p9:
+		vdda_mipi_csi2_0p9:
+		vdda_mipi_dsi0_pll:
+		vdda_mipi_dsi1_pll:
+		vdda_qlink_lv:
+		vdda_qlink_lv_ck:
+		vdda_qrefs_0p875:
+		vdda_pcie_core:
+		vdda_pll_cc_ebi01:
+		vdda_pll_cc_ebi23:
+		vdda_sp_sensor:
+		vdda_ufs1_core:
+		vdda_ufs2_core:
+		vdda_usb1_ss_core:
+		vdda_usb2_ss_core:
+		src_pp875_l1a: ldo1 {
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vddpx_10:
+		src_pp1200_l2a: ldo2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+
+			/* TODO: why??? */
+			regulator-always-on;
+		};
+
+		pp1000_l3a_sdr845: ldo3 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_wcss_cx:
+		vdd_wcss_mx:
+		vdda_wcss_pll:
+		src_pp800_l5a: ldo5 {
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vddpx_13:
+		src_pp1800_l6a: ldo6 {
+			regulator-min-microvolt = <1856000>;
+			regulator-max-microvolt = <1856000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		pp1800_l7a_wcn3990: ldo7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		src_pp1200_l8a: ldo8 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1248000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		pp1800_dx_pen:
+		src_pp1800_l9a: ldo9 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		src_pp1800_l10a: ldo10 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		pp1000_l11a_sdr845: ldo11 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1048000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_qfprom:
+		vdd_qfprom_sp:
+		vdda_apc1_cs_1p8:
+		vdda_gfx_cs_1p8:
+		vdda_qrefs_1p8:
+		vdda_qusb_hs0_1p8:
+		vddpx_11:
+		src_pp1800_l12a: ldo12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vddpx_2:
+		src_pp2950_l13a: ldo13 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		src_pp1800_l14a: ldo14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		src_pp1800_l15a: ldo15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		pp2700_l16a: ldo16 {
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2704000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		src_pp1300_l17a: ldo17 {
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		pp2700_l18a: ldo18 {
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/*
+		 * NOTE: this rail should have been called
+		 * src_pp3300_l19a in the schematic
+		 */
+		src_pp3000_l19a: ldo19 {
+			regulator-min-microvolt = <3304000>;
+			regulator-max-microvolt = <3304000>;
+
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		src_pp2950_l20a: ldo20 {
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		src_pp2950_l21a: ldo21 {
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		pp3300_hub:
+		src_pp3300_l22a: ldo22 {
+			regulator-min-microvolt = <3304000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			/*
+			 * HACK: Should add a usb hub node and driver
+			 * to turn this on and off at suspend/resume time
+			 */
+			regulator-boot-on;
+			regulator-always-on;
+		};
+
+		pp3300_l23a_ch1_wcn3990: ldo23 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdda_qusb_hs0_3p1:
+		src_pp3075_l24a: ldo24 {
+			regulator-min-microvolt = <3088000>;
+			regulator-max-microvolt = <3088000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		pp3300_l25a_ch0_wcn3990: ldo25 {
+			regulator-min-microvolt = <3304000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		pp1200_hub:
+		vdda_hp_pcie_1p2:
+		vdda_hv_ebi0:
+		vdda_hv_ebi1:
+		vdda_hv_ebi2:
+		vdda_hv_ebi3:
+		vdda_mipi_csi_1p25:
+		vdda_mipi_dsi0_1p2:
+		vdda_mipi_dsi1_1p2:
+		vdda_pcie_1p2:
+		vdda_ufs1_1p2:
+		vdda_ufs2_1p2:
+		vdda_usb1_ss_1p2:
+		vdda_usb2_ss_1p2:
+		src_pp1200_l26a: ldo26 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		pp3300_dx_pen:
+		src_pp3300_l28a: ldo28 {
+			regulator-min-microvolt = <3304000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		src_pp1800_lvs1: lvs1 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		src_pp1800_lvs2: lvs2 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+	};
+
+	pm8005-rpmh-regulators {
+		compatible = "qcom,pm8005-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vdd-s1-supply = <&src_vph_pwr>;
+		vdd-s2-supply = <&src_vph_pwr>;
+		vdd-s3-supply = <&src_vph_pwr>;
+		vdd-s4-supply = <&src_vph_pwr>;
+
+		src_pp600_s3c: smps3 {
+			regulator-min-microvolt = <600000>;
+			regulator-max-microvolt = <600000>;
+		};
+	};
+};
+
+&dsi0 {
+	status = "okay";
+	vdda-supply = <&vdda_mipi_dsi0_1p2>;
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&sn65dsi86_in>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+};
+
+&dsi0_phy {
+	status = "okay";
+	vdds-supply = <&vdda_mipi_dsi0_pll>;
+};
+
+edp_brij_i2c: &i2c3 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	sn65dsi86_bridge: bridge@2d {
+		compatible = "ti,sn65dsi86";
+		reg = <0x2d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&edp_brij_en &edp_brij_irq>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
+
+		enable-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
+
+		vpll-supply = <&src_pp1800_s4a>;
+		vccio-supply = <&src_pp1800_s4a>;
+		vcca-supply = <&src_pp1200_l2a>;
+		vcc-supply = <&src_pp1200_l2a>;
+
+		clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
+		clock-names = "refclk";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				sn65dsi86_in: endpoint {
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				sn65dsi86_out: endpoint {
+					remote-endpoint = <&panel_in_edp>;
+				};
+			};
+		};
+	};
+};
+
+ap_pen_1v8: &i2c11 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	digitizer@9 {
+		compatible = "wacom,w9013", "hid-over-i2c";
+		reg = <0x9>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pen_irq_l>, <&pen_pdct_l>, <&pen_rst_l>;
+
+		vdd-supply = <&pp3300_dx_pen>;
+		vddl-supply = <&pp1800_dx_pen>;
+		post-power-on-delay-ms = <100>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <24 IRQ_TYPE_LEVEL_LOW>;
+
+		hid-descr-addr = <0x1>;
+	};
+};
+
+amp_i2c: &i2c12 {
+	status = "okay";
+	clock-frequency = <400000>;
+};
+
+ap_ts_i2c: &i2c14 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	touchscreen@10 {
+		compatible = "elan,ekth3500";
+		reg = <0x10>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_int_l &ts_reset_l>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <125 IRQ_TYPE_LEVEL_LOW>;
+
+		vcc33-supply = <&src_pp3300_l28a>;
+
+		reset-gpios = <&tlmm 118 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&lpasscc {
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_mdp {
+	status = "okay";
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&sdhc_2 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdc2_clk &sdc2_cmd &sdc2_data &sd_cd_odl>;
+
+	vmmc-supply = <&src_pp2950_l21a>;
+	vqmmc-supply = <&vddpx_2>;
+
+	cd-gpios = <&tlmm 44 GPIO_ACTIVE_LOW>;
+};
+
+&spi0 {
+	status = "okay";
+};
+
+&spi10 {
+	status = "okay";
+
+	cros_ec: ec@0 {
+		compatible = "google,cros-ec-spi";
+		reg = <0>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <122 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ec_ap_int_l>;
+		spi-max-frequency = <3000000>;
+
+		cros_ec_pwm: ec-pwm {
+			compatible = "google,cros-ec-pwm";
+			#pwm-cells = <1>;
+		};
+
+		i2c_tunnel: i2c-tunnel {
+			compatible = "google,cros-ec-i2c-tunnel";
+			google,remote-bus = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		pdupdate {
+			compatible = "google,cros-ec-pd-update";
+		};
+	};
+};
+
+#include <arm/cros-ec-keyboard.dtsi>
+#include <arm/cros-ec-sbs.dtsi>
+
+&uart6 {
+	status = "okay";
+
+	bluetooth: wcn3990-bt {
+		compatible = "qcom,wcn3990-bt";
+		vddio-supply = <&src_pp1800_s4a>;
+		vddxo-supply = <&pp1800_l7a_wcn3990>;
+		vddrf-supply = <&src_pp1300_l17a>;
+		vddch0-supply = <&pp3300_l25a_ch0_wcn3990>;
+		max-speed = <3200000>;
+	};
+};
+
+&uart9 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	status = "okay";
+	pinctrl-names = "init", "default";
+	pinctrl-0 = <&ufs_dev_reset_assert>;
+	pinctrl-1 = <&ufs_dev_reset_deassert>;
+
+	vcc-supply = <&src_pp2950_l20a>;
+	vcc-max-microamp = <600000>;
+};
+
+&ufs_mem_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vdda_ufs1_core>;
+	vdda-pll-supply = <&vdda_ufs1_1p2>;
+};
+
+&usb_1 {
+	status = "okay";
+
+	/* We'll use this as USB 2.0 only */
+	qcom,select-utmi-as-pipe-clk;
+};
+
+&usb_1_dwc3 {
+	/*
+	 * The hardware design intends this port to be hooked up in peripheral
+	 * mode, so we'll hardcode it here.  Some details:
+	 * - SDM845 expects only a single Type C connector so it has only one
+	 *   native Type C port but cheza has two Type C connectors.
+	 * - The only source of DP is the single native Type C port.
+	 * - On cheza we want to be able to hook DP up to _either_ of the
+	 *   two Type C connectors and want to be able to achieve 4 lanes of DP.
+	 * - When you configure a Type C port for 4 lanes of DP you lose USB3.
+	 * - In order to make everything work, the native Type C port is always
+	 *   configured as 4-lanes DP so it's always available.
+	 * - The extra USB3 port on SDM845 goes to a USB 3 hub which is then
+	 *   sent to the two Type C connectors.
+	 * - The extra USB2 lines from the native Type C port are always
+	 *   setup as "peripheral" so that we can mux them over to one connector
+	 *   or the other if someone needs the connector configured as a gadget
+	 *   (but they only get USB2 speeds).
+	 *
+	 * All the hardware muxes would allow us to hook things up in different
+	 * ways to some potential benefit for static configurations (you could
+	 * achieve extra USB2 bandwidth by using two different ports for the
+	 * two conenctors or possibly even get USB3 peripheral mode), but in
+	 * each case you end up forcing to disconnect/reconnect an in-use
+	 * USB session in some cases depending on what you hotplug into the
+	 * other connector.  Thus hardcoding this as peripheral makes sense.
+	 */
+	dr_mode = "peripheral";
+
+	/*
+	 * We always need the high speed pins as 4-lanes DP in case someone
+	 * hotplugs a DP peripheral.  Thus limit this port to a max of high
+	 * speed.
+	 */
+	maximum-speed = "high-speed";
+
+	/*
+	 * We don't need the usb3-phy since we run in highspeed mode always, so
+	 * re-define these properties removing the superspeed USB PHY reference.
+	 */
+	phys = <&usb_1_hsphy>;
+	phy-names = "usb2-phy";
+};
+
+&usb_1_hsphy {
+	status = "okay";
+
+	vdd-supply = <&vdda_usb1_ss_core>;
+	vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
+	vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
+
+	qcom,imp-res-offset-value = <8>;
+	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
+	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
+	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
+};
+
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_dwc3 {
+	/* We have this hooked up to a hub and we always use in host mode */
+	dr_mode = "host";
+};
+
+&usb_2_hsphy {
+	status = "okay";
+
+	vdd-supply = <&vdda_usb2_ss_core>;
+	vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
+	vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
+
+	qcom,imp-res-offset-value = <8>;
+	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_22_8_MA>;
+};
+
+&usb_2_qmpphy {
+	status = "okay";
+
+	vdda-phy-supply = <&vdda_usb2_ss_1p2>;
+	vdda-pll-supply = <&vdda_usb2_ss_core>;
+};
+
+&wifi {
+	status = "okay";
+
+	vdd-0.8-cx-mx-supply = <&src_pp800_l5a >;
+	vdd-1.8-xo-supply = <&pp1800_l7a_wcn3990>;
+	vdd-1.3-rfa-supply = <&src_pp1300_l17a>;
+	vdd-3.3-ch0-supply = <&pp3300_l25a_ch0_wcn3990>;
+};
+
+/* PINCTRL - additions to nodes defined in sdm845.dtsi */
+
+&qspi_cs0 {
+	pinconf {
+		pins = "gpio90";
+		bias-disable;
+	};
+};
+
+&qspi_clk {
+	pinconf {
+		pins = "gpio95";
+		bias-disable;
+	};
+};
+
+&qspi_data01 {
+	pinconf {
+		pins = "gpio91", "gpio92";
+
+		/* High-Z when no transfers; nice to park the lines */
+		bias-pull-up;
+	};
+};
+
+&qup_i2c3_default {
+	pinconf {
+		pins = "gpio41", "gpio42";
+		drive-strength = <2>;
+
+		/* Has external pullup */
+		bias-disable;
+	};
+};
+
+&qup_i2c11_default {
+	pinconf {
+		pins = "gpio31", "gpio32";
+		drive-strength = <2>;
+
+		/* Has external pullup */
+		bias-disable;
+	};
+};
+
+&qup_i2c12_default {
+	pinconf {
+		pins = "gpio49", "gpio50";
+		drive-strength = <2>;
+
+		/* Has external pullup */
+		bias-disable;
+	};
+};
+
+&qup_i2c14_default {
+	pinconf {
+		pins = "gpio33", "gpio34";
+		drive-strength = <2>;
+
+		/* Has external pullup */
+		bias-disable;
+	};
+};
+
+&qup_spi0_default {
+	pinconf {
+		pins = "gpio0", "gpio1", "gpio2", "gpio3";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&qup_spi5_default {
+	pinconf {
+		pins = "gpio85", "gpio86", "gpio87", "gpio88";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&qup_spi10_default {
+	pinconf {
+		pins = "gpio53", "gpio54", "gpio55", "gpio56";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&qup_uart6_default {
+	/* Change pinmux to all 4 pins since CTS and RTS are connected */
+	pinmux {
+		pins = "gpio45", "gpio46",
+		       "gpio47", "gpio48";
+	};
+
+	pinconf-cts {
+		/*
+		 * Configure a pull-down on 45 (CTS) to match the pull of
+		 * the Bluetooth module.
+		 */
+		pins = "gpio45";
+		bias-pull-down;
+	};
+
+	pinconf-rts-tx {
+		/* We'll drive 46 (RTS) and 47 (TX), so no pull */
+		pins = "gpio46", "gpio47";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pinconf-rx {
+		/*
+		 * Configure a pull-up on 48 (RX). This is needed to avoid
+		 * garbage data when the TX pin of the Bluetooth module is
+		 * in tri-state (module powered off or not driving the
+		 * signal yet).
+		 */
+		pins = "gpio48";
+		bias-pull-up;
+	};
+};
+
+&qup_uart9_default {
+	pinconf-tx {
+		pins = "gpio4";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pinconf-rx {
+		pins = "gpio5";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+/* PINCTRL - board-specific pinctrl */
+&pm8005_gpio {
+	gpio-line-names = "",
+			  "",
+			  "SLB",
+			  "";
+};
+
+&pm8998_adc {
+	adc-chan@ADC5_AMUX_THM1_100K_PU {
+		reg = <ADC5_AMUX_THM1_100K_PU>;
+		label = "sdm_temp";
+	};
+
+	adc-chan@ADC5_AMUX_THM2_100K_PU {
+		reg = <ADC5_AMUX_THM2_100K_PU>;
+		label = "quiet_temp";
+	};
+
+	adc-chan@ADC5_AMUX_THM3_100K_PU {
+		reg = <ADC5_AMUX_THM3_100K_PU>;
+		label = "lte_temp_1";
+	};
+
+	adc-chan@ADC5_AMUX_THM4_100K_PU {
+		reg = <ADC5_AMUX_THM4_100K_PU>;
+		label = "lte_temp_2";
+	};
+
+	adc-chan@ADC5_AMUX_THM5_100K_PU {
+		reg = <ADC5_AMUX_THM5_100K_PU>;
+		label = "charger_temp";
+	};
+};
+
+&pm8998_gpio {
+	gpio-line-names = "",
+			  "",
+			  "SW_CTRL",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "CFG_OPT1",
+			  "WCSS_PWR_REQ",
+			  "",
+			  "CFG_OPT2",
+			  "SLB";
+};
+
+&tlmm {
+	/*
+	 * pinctrl settings for pins that have no real owners.
+	 */
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&bios_flash_wp_r_l>,
+		    <&ap_suspend_l_deassert>;
+
+	pinctrl-1 = <&bios_flash_wp_r_l>,
+		    <&ap_suspend_l_assert>;
+
+	/*
+	 * Hogs prevent usermode from changing the value. A GPIO can be both
+	 * here and in the pinctrl section.
+	 */
+	ap-suspend-l-hog {
+		gpio-hog;
+		gpios = <126 GPIO_ACTIVE_LOW>;
+		output-low;
+	};
+
+	ap_edp_bklten: ap-edp-bklten {
+		pinmux {
+			pins = "gpio37";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio37";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	bios_flash_wp_r_l: bios-flash-wp-r-l {
+		pinmux {
+			pins = "gpio128";
+			function = "gpio";
+			input-enable;
+		};
+
+		pinconf {
+			pins = "gpio128";
+			bias-disable;
+		};
+	};
+
+	ec_ap_int_l: ec-ap-int-l {
+		pinmux {
+		       pins = "gpio122";
+		       function = "gpio";
+		       input-enable;
+		};
+
+		pinconf {
+		       pins = "gpio122";
+		       bias-pull-up;
+		};
+	};
+
+	edp_brij_en: edp-brij-en {
+		pinmux {
+			pins = "gpio102";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio102";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	edp_brij_irq: edp-brij-irq {
+		pinmux {
+			pins = "gpio10";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio10";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+	};
+
+	en_pp3300_dx_edp: en-pp3300-dx-edp {
+		pinmux {
+			pins = "gpio43";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio43";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	h1_ap_int_odl: h1-ap-int-odl {
+		pinmux {
+			pins = "gpio129";
+			function = "gpio";
+			input-enable;
+		};
+
+		pinconf {
+			pins = "gpio129";
+			bias-pull-up;
+		};
+	};
+
+	pen_eject_odl: pen-eject-odl {
+		pinmux {
+			pins = "gpio119";
+			function = "gpio";
+			bias-pull-up;
+		};
+	};
+
+	pen_irq_l: pen-irq-l {
+		pinmux {
+			pins = "gpio24";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio24";
+
+			/* Has external pullup */
+			bias-disable;
+		};
+	};
+
+	pen_pdct_l: pen-pdct-l {
+		pinmux {
+			pins = "gpio63";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio63";
+
+			/* Has external pullup */
+			bias-disable;
+		};
+	};
+
+	pen_rst_l: pen-rst-l {
+		pinmux  {
+			pins = "gpio23";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio23";
+			bias-disable;
+			drive-strength = <2>;
+
+			/*
+			 * The pen driver doesn't currently support
+			 * driving this reset line.  By specifying
+			 * output-high here we're relying on the fact
+			 * that this pin has a default pulldown at boot
+			 * (which makes sure the pen was in reset if it
+			 * was powered) and then we set it high here to
+			 * take it out of reset.  Better would be if the
+			 * pen driver could control this and we could
+			 * remove "output-high" here.
+			 */
+			output-high;
+		};
+	};
+
+	sdc2_clk: sdc2-clk {
+		pinconf {
+			pins = "sdc2_clk";
+			bias-disable;
+
+			/*
+			 * It seems that mmc_test reports errors if drive
+			 * strength is not 16.
+			 */
+			drive-strength = <16>;
+		};
+	};
+
+	sdc2_cmd: sdc2-cmd {
+		pinconf {
+			pins = "sdc2_cmd";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+	};
+
+	sdc2_data: sdc2-data {
+		pinconf {
+			pins = "sdc2_data";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+	};
+
+	sd_cd_odl: sd-cd-odl {
+		pinmux {
+			pins = "gpio44";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio44";
+			bias-pull-up;
+		};
+	};
+
+	ts_int_l: ts-int-l {
+		pinmux  {
+			pins = "gpio125";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio125";
+			bias-pull-up;
+		};
+	};
+
+	ts_reset_l: ts-reset-l {
+		pinmux  {
+			pins = "gpio118";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio118";
+			bias-disable;
+			drive-strength = <2>;
+		};
+	};
+
+	ufs_dev_reset_assert: ufs_dev_reset_assert {
+		config {
+			pins = "ufs_reset";
+			bias-pull-down;		/* default: pull down */
+			/*
+			 * UFS_RESET driver strengths are having
+			 * different values/steps compared to typical
+			 * GPIO drive strengths.
+			 *
+			 * Following table clarifies:
+			 *
+			 * HDRV value | UFS_RESET | Typical GPIO
+			 *   (dec)    |   (mA)    |    (mA)
+			 *     0      |   0.8     |    2
+			 *     1      |   1.55    |    4
+			 *     2      |   2.35    |    6
+			 *     3      |   3.1     |    8
+			 *     4      |   3.9     |    10
+			 *     5      |   4.65    |    12
+			 *     6      |   5.4     |    14
+			 *     7      |   6.15    |    16
+			 *
+			 * POR value for UFS_RESET HDRV is 3 which means
+			 * 3.1mA and we want to use that. Hence just
+			 * specify 8mA to "drive-strength" binding and
+			 * that should result into writing 3 to HDRV
+			 * field.
+			 */
+			drive-strength = <8>;	/* default: 3.1 mA */
+			output-low; /* active low reset */
+		};
+	};
+
+	ufs_dev_reset_deassert: ufs_dev_reset_deassert {
+		config {
+			pins = "ufs_reset";
+			bias-pull-down;		/* default: pull down */
+			/*
+			 * default: 3.1 mA
+			 * check comments under ufs_dev_reset_assert
+			 */
+			drive-strength = <8>;
+			output-high; /* active low reset */
+		};
+	};
+
+	ap_suspend_l_assert: ap_suspend_l_assert {
+		config {
+			pins = "gpio126";
+			function = "gpio";
+			bias-no-pull;
+			drive-strength = <2>;
+			output-low;
+		};
+	};
+
+	ap_suspend_l_deassert: ap_suspend_l_deassert {
+		config {
+			pins = "gpio126";
+			function = "gpio";
+			bias-no-pull;
+			drive-strength = <2>;
+			output-high;
+		};
+	};
+};
-- 
2.20.1

