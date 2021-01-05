Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CDE12EAAD0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 13:30:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730265AbhAEM2x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 07:28:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730263AbhAEM2x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 07:28:53 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 030DBC06138C
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 04:27:53 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id y8so16270781plp.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 04:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9yrapoIFWFXnJoruSV2ugYcl0aEsm2fIqrky/FpMYSA=;
        b=cNLBKbGGZrfZJA0wAwjWx5kTwwMxj6uzcsuXUmFZgljfktHiIICCNKP+Q2ebrEvGpy
         M35LGcLRsY1uQgBgsI3Ee41HKY+R6i7iuW6+3kg1cuymZKXWDYZw4+IXrXLBp3K1Bbj7
         Vcl10vshW4Dp6eOdCkQFrGXv5UFRBbuIkV4AozZ5MjZi4gqPGlXCBWJ0AUCmEYB2I7aX
         WpkAZutKor4Zxg87xszOa5epgJNDtM9n4Y2P1QBlvjfpU8bQ+mbiGLfORAXDOJrCyAzM
         DkInldxad76mVrpzkUyxXoOuBLhm73FSVe5ufIK8VHHShfnOIWlcQTKUngiYJobn5QpJ
         94QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9yrapoIFWFXnJoruSV2ugYcl0aEsm2fIqrky/FpMYSA=;
        b=FnQQ6dDy/wWtyOnUNzhOUFFsJqGJIWLh5goJze/262Z+0ZhBV4INEvuHN0kjOJvZuc
         OKvVZKWGlomCRdUrqCck+TkTrEBJZ5moUIZq3FjrYyzGXNH3zwYJjdlfrM4haKS4zP4p
         0Gl3IaGZC0wrr6OoHdxLFbx13EDuLbrmGXAxbgsf119ciaDc6E93aCNZBMx2Y1Va/+fq
         CDILzh2oz3yoldpCim0QrLYxvRzc/WeLUjayKmevyTlRlEz8VAxIWDNCY+Ye+e2CaQxh
         K4BaCS153EyFjTuUX+DHzh5rUuqfMJFvGQFpBt5g2Cftr/QH37pKpF8U7ES+1UK9ulOQ
         r6Rw==
X-Gm-Message-State: AOAM530SUlH50uuze+Y0SQQNBnHqiGIb9Z6FprFSEne5a3j9xPNodciQ
        MlGTAC1qKPOcbxyTzDQHNg5y
X-Google-Smtp-Source: ABdhPJz824UFtTZ4y46H0IT9cX50zWMpGUrnWuZt6a+E6XWanO3f41OlxOeQxioScpsYIlzvPTtCSQ==
X-Received: by 2002:a17:90b:4a0d:: with SMTP id kk13mr3787877pjb.23.1609849672490;
        Tue, 05 Jan 2021 04:27:52 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id t22sm64745402pgm.18.2021.01.05.04.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 04:27:52 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 17/18] ARM: dts: qcom: Add PMIC pmx55 dts
Date:   Tue,  5 Jan 2021 17:56:48 +0530
Message-Id: <20210105122649.13581-18-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
References: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

This adds DTS for PMIC PMX55 found in Qualcomm platforms.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-pmx55.dtsi | 91 +++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-pmx55.dtsi

diff --git a/arch/arm/boot/dts/qcom-pmx55.dtsi b/arch/arm/boot/dts/qcom-pmx55.dtsi
new file mode 100644
index 000000000000..05f033334716
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-pmx55.dtsi
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: BSD-3-Clause
+
+/*
+ * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2020, Linaro Limited
+ */
+
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi_bus {
+	pmic@8 {
+		compatible = "qcom,pmx55", "qcom,spmi-pmic";
+		reg = <0x8 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		power-on@800 {
+			compatible = "qcom,pm8916-pon";
+			reg = <0x0800>;
+
+			status = "disabled";
+		};
+
+		pmx55_temp: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x8 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			io-channels = <&pmx55_adc ADC5_DIE_TEMP>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmx55_adc: adc@3100 {
+			compatible = "qcom,spmi-adc5";
+			reg = <0x3100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+			interrupts = <0x8 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
+
+			ref-gnd@0 {
+				reg = <ADC5_REF_GND>;
+				qcom,pre-scaling = <1 1>;
+				label = "ref_gnd";
+			};
+
+			vref-1p25@1 {
+				reg = <ADC5_1P25VREF>;
+				qcom,pre-scaling = <1 1>;
+				label = "vref_1p25";
+			};
+
+			die-temp@6 {
+				reg = <ADC5_DIE_TEMP>;
+				qcom,pre-scaling = <1 1>;
+				label = "die_temp";
+			};
+
+			chg-temp@9 {
+				reg = <ADC5_CHG_TEMP>;
+				qcom,pre-scaling = <1 1>;
+				label = "chg_temp";
+			};
+		};
+
+		pmx55_gpios: gpio@c000 {
+			compatible = "qcom,pmx55-gpio", "qcom,spmi-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <0x8 0xc0 0x0 IRQ_TYPE_NONE>,
+				     <0x8 0xc1 0x0 IRQ_TYPE_NONE>,
+				     <0x8 0xc3 0x0 IRQ_TYPE_NONE>,
+				     <0x8 0xc4 0x0 IRQ_TYPE_NONE>,
+				     <0x8 0xc5 0x0 IRQ_TYPE_NONE>,
+				     <0x8 0xc7 0x0 IRQ_TYPE_NONE>,
+				     <0x8 0xc8 0x0 IRQ_TYPE_NONE>;
+		};
+	};
+
+	pmic@9 {
+		compatible = "qcom,pmx55", "qcom,spmi-pmic";
+		reg = <0x9 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
-- 
2.25.1

