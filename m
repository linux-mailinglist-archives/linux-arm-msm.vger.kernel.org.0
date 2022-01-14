Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D08448E1AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 01:44:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238521AbiANAnt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jan 2022 19:43:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238506AbiANAnr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jan 2022 19:43:47 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24C0BC061748
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jan 2022 16:43:47 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id y16-20020a17090a6c9000b001b13ffaa625so20500073pjj.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jan 2022 16:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KPH9MdMa3cqYY1dvpEd/g8+Q5deKc0MlMiTcTnUUQhQ=;
        b=WKvsc+D6lFQmmv9j3obln12T77VzpHb7Rjj6wAzzwpLQwb2y15SMgdL3vjvUgDzxXV
         hTFTxwk4lmB14uFWtcElWVIPnEq5KwglY+III1A3wUB4fRCti06wMVTs1YfV8W7DliOg
         g7F4w7vSqsdGqIn+hXl233oWcDSPZUPkGpHp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KPH9MdMa3cqYY1dvpEd/g8+Q5deKc0MlMiTcTnUUQhQ=;
        b=OeAdQg3r2i+NnKnJsX3OoxAOSa7KC172nKO80BQn4xpjwGrB93ZScNrfEvmUgoh7rP
         MQWDzAQ5PkQsuyvXcKGAmn+cSr1SLtBxlLcc6o75BKZiE3mKbJRHeIJv759cgOnZZ2Oy
         bFohkyWjMdStoi5bAOx9RZS9zCyja8EqsOhqdsnfC2Y8t0g6omeE0wF43yJX3Zu7zVhf
         rV7uF0APplGDXGZcUyBmI72rdeevjICiqalD04JdKXjF7UCooP6Y4paejDd/XQs8tJWy
         s08WAbwLxozCvANl5UwzcjsW9qDPpjltXqURndam0VDfZRRNjS5sIGhqummybp9FUm8X
         U18Q==
X-Gm-Message-State: AOAM533Qhz8W8PfhXkued5sZL91SMWOU5gHuoJsjbLw7zwEofu8wXnP2
        g0bMhXjAUGXQrp/V8JfwmFzVVw==
X-Google-Smtp-Source: ABdhPJwga6MdqoYEM0yEgEBRrzFGTrEfCzIz4msejiiJRCDJu2kU2UyfSQYj8CRqK5bPun8Zs29BBA==
X-Received: by 2002:a17:90a:1b28:: with SMTP id q37mr7852559pjq.48.1642121026291;
        Thu, 13 Jan 2022 16:43:46 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:cf6e:9fa9:a398:4c9])
        by smtp.gmail.com with ESMTPSA id j4sm4061498pfj.217.2022.01.13.16.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 16:43:45 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     quic_rjendra@quicinc.com, sibis@codeaurora.org,
        kgodara1@codeaurora.org, mka@chromium.org, swboyd@chromium.org,
        pmaliset@codeaurora.org, Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: qcom: sc7280: Factor out Chrome common fragment
Date:   Thu, 13 Jan 2022 16:43:02 -0800
Message-Id: <20220113164233.3.Iac012fa8d727be46448d47027a1813ea716423ce@changeid>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220114004303.905808-1-dianders@chromium.org>
References: <20220114004303.905808-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This factors out a device tree fragment from some sc7280 device
trees. It represents the device tree bits that should be included for
"Chrome" based sc7280 boards. On these boards the bootloader (Coreboot
+ Depthcharge) configures things slightly different than the
bootloader that Qualcomm provides. The modem firmware on these boards
also works differently than on other Qulacomm products and thus the
reserved memory map needs to be adjusted.

NOTES:
- This is _not_ quite a no-op change. The "herobrine" and "idp"
  fragments here were different and it looks like someone simply
  forgot to update the herobrine version. This updates a few numbers
  to match IDP. This will also cause the `pmk8350_pon` to be disabled
  on idp/crd, which I belive is a correct change.
- At the moment this assumes LTE skus. Once it's clearer how WiFi SKUs
  will work (how much of the memory map they can reclaim) we may add
  an extra fragment that will rejigger one way or the other.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../boot/dts/qcom/sc7280-chrome-common.dtsi   | 97 +++++++++++++++++++
 .../qcom/sc7280-herobrine-herobrine-r0.dts    | 70 +------------
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi      | 75 +-------------
 3 files changed, 101 insertions(+), 141 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
new file mode 100644
index 000000000000..9d4f25f77152
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * sc7280 fragment for devices with Chrome bootloader
+ *
+ * This file mainly tries to abstract out the memory protections put into
+ * place by the Chrome bootloader which are different than what's put into
+ * place by Qualcomm's typical bootloader. It also has a smattering of other
+ * things that will hold true for any conceivable Chrome design
+ *
+ * Copyright 2022 Google LLC.
+ */
+
+/*
+ * Reserved memory changes
+ *
+ * Delete all unused memory nodes and define the peripheral memory regions
+ * required by the setup for Chrome boards.
+ */
+
+/delete-node/ &hyp_mem;
+/delete-node/ &xbl_mem;
+/delete-node/ &reserved_xbl_uefi_log;
+/delete-node/ &sec_apps_mem;
+
+/ {
+	reserved-memory {
+		adsp_mem: memory@86700000 {
+			reg = <0x0 0x86700000 0x0 0x2800000>;
+			no-map;
+		};
+
+		camera_mem: memory@8ad00000 {
+			reg = <0x0 0x8ad00000 0x0 0x500000>;
+			no-map;
+		};
+
+		venus_mem: memory@8b200000 {
+			reg = <0x0 0x8b200000 0x0 0x500000>;
+			no-map;
+		};
+
+		mpss_mem: memory@8b800000 {
+			reg = <0x0 0x8b800000 0x0 0xf600000>;
+			no-map;
+		};
+
+		wpss_mem: memory@9ae00000 {
+			reg = <0x0 0x9ae00000 0x0 0x1900000>;
+			no-map;
+		};
+
+		mba_mem: memory@9c700000 {
+			reg = <0x0 0x9c700000 0x0 0x200000>;
+			no-map;
+		};
+	};
+};
+
+/* The PMIC PON code isn't compatible w/ how Chrome EC/BIOS handle things. */
+&pmk8350_pon {
+	status = "disabled";
+};
+
+/*
+ * Chrome designs always boot from SPI flash hooked up to the qspi.
+ *
+ * It's expected that all boards will support "dual SPI" at 37.5 MHz.
+ * If some boards need a different speed or have a package that allows
+ * Quad SPI together with WP then those boards can easily override.
+ */
+&qspi {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_clk>, <&qspi_cs0>, <&qspi_data01>;
+
+	spi_flash: flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+
+		spi-max-frequency = <37500000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+};
+
+/* Modem setup is different on Chrome setups than typical Qualcomm setup */
+&remoteproc_mpss {
+	status = "okay";
+	compatible = "qcom,sc7280-mss-pil";
+	iommus = <&apps_smmu 0x124 0x0>, <&apps_smmu 0x488 0x7>;
+	memory-region = <&mba_mem &mpss_mem>;
+};
+
+/* Increase the size from 2.5MB to 8MB */
+&rmtfs_mem {
+	reg = <0x0 0x9c900000 0x0 0x800000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts
index 8676c93590b5..67680a13c234 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts
@@ -22,62 +22,15 @@
 #include "pm8350c.dtsi"
 #include "pmk8350.dtsi"
 
+#include "sc7280-chrome-common.dtsi"
+
 / {
 	model = "Google Herobrine (rev0)";
 	compatible = "google,herobrine",
 		     "qcom,sc7280";
 };
 
-/*
- * Reserved memory changes
- *
- * Delete all unused memory nodes and define the peripheral memory regions
- * required by the board dts.
- *
- */
-
-/delete-node/ &hyp_mem;
-/delete-node/ &xbl_mem;
-/delete-node/ &sec_apps_mem;
-
-/* Increase the size from 2MB to 8MB */
-&rmtfs_mem {
-	reg = <0x0 0x83600000 0x0 0x800000>;
-};
-
 / {
-	reserved-memory {
-		adsp_mem: memory@86700000 {
-			reg = <0x0 0x86700000 0x0 0x2800000>;
-			no-map;
-		};
-
-		camera_mem: memory@8ad00000 {
-			reg = <0x0 0x8ad00000 0x0 0x500000>;
-			no-map;
-		};
-
-		venus_mem: memory@8b200000 {
-			reg = <0x0 0x8b200000 0x0 0x500000>;
-			no-map;
-		};
-
-		mpss_mem: memory@8b800000 {
-			reg = <0x0 0x8b800000 0x0 0xf600000>;
-			no-map;
-		};
-
-		wpss_mem: memory@9ae00000 {
-			reg = <0x0 0x9ae00000 0x0 0x1900000>;
-			no-map;
-		};
-
-		mba_mem: memory@9c700000 {
-			reg = <0x0 0x9c700000 0x0 0x200000>;
-			no-map;
-		};
-	};
-
 	aliases {
 		serial0 = &uart5;
 		serial1 = &uart7;
@@ -691,10 +644,6 @@ &pmk8350_gpios {
 	status = "disabled"; /* No GPIOs are connected */
 };
 
-&pmk8350_pon {
-	status = "disabled";
-};
-
 &pmk8350_rtc {
 	status = "disabled";
 };
@@ -717,21 +666,6 @@ &qfprom {
 	vcc-supply = <&vdd_qfprom>;
 };
 
-&qspi {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&qspi_clk>, <&qspi_cs0>, <&qspi_data01>;
-
-	flash@0 {
-		compatible = "jedec,spi-nor";
-		reg = <0>;
-
-		spi-max-frequency = <37500000>;
-		spi-tx-bus-width = <2>;
-		spi-rx-bus-width = <2>;
-	};
-};
-
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index d623d71d8bd4..98c8f39ce459 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -13,6 +13,8 @@
 #include "pm8350c.dtsi"
 #include "pmk8350.dtsi"
 
+#include "sc7280-chrome-common.dtsi"
+
 / {
 	gpio-keys {
 		compatible = "gpio-keys";
@@ -45,58 +47,6 @@ nvme_3v3_regulator: nvme-3v3-regulator {
 	};
 };
 
-/*
- * Reserved memory changes
- *
- * Delete all unused memory nodes and define the peripheral memory regions
- * required by the board dts.
- *
- */
-
-/delete-node/ &hyp_mem;
-/delete-node/ &xbl_mem;
-/delete-node/ &reserved_xbl_uefi_log;
-/delete-node/ &sec_apps_mem;
-
-/* Increase the size from 2.5MB to 8MB */
-&rmtfs_mem {
-	reg = <0x0 0x9c900000 0x0 0x800000>;
-};
-
-/ {
-	reserved-memory {
-		adsp_mem: memory@86700000 {
-			reg = <0x0 0x86700000 0x0 0x2800000>;
-			no-map;
-		};
-
-		camera_mem: memory@8ad00000 {
-			reg = <0x0 0x8ad00000 0x0 0x500000>;
-			no-map;
-		};
-
-		venus_mem: memory@8b200000 {
-			reg = <0x0 0x8b200000 0x0 0x500000>;
-			no-map;
-		};
-
-		mpss_mem: memory@8b800000 {
-			reg = <0x0 0x8b800000 0x0 0xf600000>;
-			no-map;
-		};
-
-		wpss_mem: memory@9ae00000 {
-			reg = <0x0 0x9ae00000 0x0 0x1900000>;
-			no-map;
-		};
-
-		mba_mem: memory@9c700000 {
-			reg = <0x0 0x9c700000 0x0 0x200000>;
-			no-map;
-		};
-	};
-};
-
 &apps_rsc {
 	pm7325-regulators {
 		compatible = "qcom,pm7325-rpmh-regulators";
@@ -313,20 +263,6 @@ &qfprom {
 	vcc-supply = <&vreg_l1c_1p8>;
 };
 
-&qspi {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&qspi_clk>, <&qspi_cs0>, <&qspi_data01>;
-
-	flash@0 {
-		compatible = "jedec,spi-nor";
-		reg = <0>;
-		spi-max-frequency = <37500000>;
-		spi-tx-bus-width = <2>;
-		spi-rx-bus-width = <2>;
-	};
-};
-
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -335,13 +271,6 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
-&remoteproc_mpss {
-	status = "okay";
-	compatible = "qcom,sc7280-mss-pil";
-	iommus = <&apps_smmu 0x124 0x0>, <&apps_smmu 0x488 0x7>;
-	memory-region = <&mba_mem &mpss_mem>;
-};
-
 &sdhc_1 {
 	status = "okay";
 
-- 
2.34.1.703.g22d0c6ccf7-goog

