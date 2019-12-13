Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D404411DB82
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2019 02:09:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731428AbfLMBIl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 20:08:41 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:42156 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727513AbfLMBIl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 20:08:41 -0500
Received: by mail-pl1-f196.google.com with SMTP id x13so481319plr.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2019 17:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kkgyMWnJPA7zPuIRZMDlek4Ocs5Jn4Aj6e2Q5KIp8ZQ=;
        b=XXue9bSsn/QGwPyZsS9Yw5oDsyV6R7ISqQjzNtilrdV0LqHP7ydlrwoNZ0Fe1Z58oY
         5jqZZ/k9DgwzVES0emuhCdP43nT5SFJPwlfZWNmu9xvxF/F1I2p5/k8iMvZRG5uLeOHy
         1Tyw4wHmYFJ4ycLlJGE2SmTSuQLsGmg8VoA1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kkgyMWnJPA7zPuIRZMDlek4Ocs5Jn4Aj6e2Q5KIp8ZQ=;
        b=LDmNVnBGwIYyjK5EnT7d6Vd+oFVXbcOkVCkZex/iLrgseveXDTWF9Ay7froiu/hNkX
         rKlb0o5V/AUqw4oCq1lfvu9KcbGNxlOzcnKkmjMFcan+xv3F96s0ROrh1N98FFEPEGbD
         IbxPy+3DvH6BxIUvDd8PY72FaMpNgqaEsTvUOUrCbrhbt/qKWv7/RvYdffIymqvSOi4+
         ld9EUAfIJSf27plU7AK1NFEX3P+m8WvPO9Dv5iw0vNcMl2hUNvlz5k6HkgNRLn+7FEOk
         nQM6eJeEbSsvh2kAxAHwoMyy8Wuby04LbI1Huq7r+hIRsXIO3QNOpCNj77Vni3u0JnU7
         IPhQ==
X-Gm-Message-State: APjAAAVH9fnqycsWwapMut+5GCF9qb7fFTW5tydublP9FvNygFhGxBRV
        93A7N2twDcnPL/exTZVX7Ej2lw==
X-Google-Smtp-Source: APXvYqzxQMXTCdlwRfSZ1o1MO2oKXU5lgxZGM559VlbYDbYkUzeHc6zmlxEHFO1YwaaLKV2mD+KtHA==
X-Received: by 2002:a17:90a:fa13:: with SMTP id cm19mr12755762pjb.141.1576199320402;
        Thu, 12 Dec 2019 17:08:40 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id b22sm8652452pfd.63.2019.12.12.17.08.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2019 17:08:39 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rajeshwari <rkambl@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2] arm64: dts: qcom: sc7180: Fix node order
Date:   Thu, 12 Dec 2019 17:08:36 -0800
Message-Id: <20191212170824.v2.1.I55198466344789267ed1eb5ec555fd890c9fc6e1@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SC7180 device tree nodes should be ordered by address. Re-shuffle
some nodes which currently don't follow this convention.

Since we are already moving it add a missing leading zero to the
address in the 'reg' property of the 'interrupt-controller@b220000'
node.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- updated commit message
- added Doug's 'Reviewed-by' tag
- added leading zero to address of 'interrupt-controller@b220000'

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 74 ++++++++++++++--------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 52a58615ec06d..6876aae2e46b1 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -642,16 +642,6 @@ uart11: serial@a94000 {
 			};
 		};
 
-		pdc: interrupt-controller@b220000 {
-			compatible = "qcom,sc7180-pdc", "qcom,pdc";
-			reg = <0 0xb220000 0 0x30000>;
-			qcom,pdc-ranges = <0 480 15>, <17 497 98>,
-					  <119 634 4>, <124 639 1>;
-			#interrupt-cells = <2>;
-			interrupt-parent = <&intc>;
-			interrupt-controller;
-		};
-
 		tlmm: pinctrl@3500000 {
 			compatible = "qcom,sc7180-pinctrl";
 			reg = <0 0x03500000 0 0x300000>,
@@ -952,33 +942,6 @@ qspi: spi@88dc000 {
 			status = "disabled";
 		};
 
-		system-cache-controller@9200000 {
-			compatible = "qcom,sc7180-llcc";
-			reg = <0 0x09200000 0 0x200000>, <0 0x09600000 0 0x50000>;
-			reg-names = "llcc_base", "llcc_broadcast_base";
-			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
-		};
-
-		tsens0: thermal-sensor@c263000 {
-			compatible = "qcom,sc7180-tsens","qcom,tsens-v2";
-			reg = <0 0x0c263000 0 0x1ff>, /* TM */
-				<0 0x0c222000 0 0x1ff>; /* SROT */
-			#qcom,sensors = <15>;
-			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "uplow";
-			#thermal-sensor-cells = <1>;
-		};
-
-		tsens1: thermal-sensor@c265000 {
-			compatible = "qcom,sc7180-tsens","qcom,tsens-v2";
-			reg = <0 0x0c265000 0 0x1ff>, /* TM */
-				<0 0x0c223000 0 0x1ff>; /* SROT */
-			#qcom,sensors = <10>;
-			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "uplow";
-			#thermal-sensor-cells = <1>;
-		};
-
 		usb_1_hsphy: phy@88e3000 {
 			compatible = "qcom,sc7180-qusb2-phy";
 			reg = <0 0x088e3000 0 0x400>;
@@ -1028,6 +991,13 @@ usb_1_ssphy: phy@88e9200 {
 			};
 		};
 
+		system-cache-controller@9200000 {
+			compatible = "qcom,sc7180-llcc";
+			reg = <0 0x09200000 0 0x200000>, <0 0x09600000 0 0x50000>;
+			reg-names = "llcc_base", "llcc_broadcast_base";
+			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		usb_1: usb@a6f8800 {
 			compatible = "qcom,sc7180-dwc3", "qcom,dwc3";
 			reg = <0 0x0a6f8800 0 0x400>;
@@ -1072,6 +1042,36 @@ usb_1_dwc3: dwc3@a600000 {
 			};
 		};
 
+		pdc: interrupt-controller@b220000 {
+			compatible = "qcom,sc7180-pdc", "qcom,pdc";
+			reg = <0 0x0b220000 0 0x30000>;
+			qcom,pdc-ranges = <0 480 15>, <17 497 98>,
+					  <119 634 4>, <124 639 1>;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+		};
+
+		tsens0: thermal-sensor@c263000 {
+			compatible = "qcom,sc7180-tsens","qcom,tsens-v2";
+			reg = <0 0x0c263000 0 0x1ff>, /* TM */
+				<0 0x0c222000 0 0x1ff>; /* SROT */
+			#qcom,sensors = <15>;
+			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens1: thermal-sensor@c265000 {
+			compatible = "qcom,sc7180-tsens","qcom,tsens-v2";
+			reg = <0 0x0c265000 0 0x1ff>, /* TM */
+				<0 0x0c223000 0 0x1ff>; /* SROT */
+			#qcom,sensors = <10>;
+			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
+			#thermal-sensor-cells = <1>;
+		};
+
 		spmi_bus: spmi@c440000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0 0x0c440000 0 0x1100>,
-- 
2.24.1.735.g03f4e72817-goog

