Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C81EA3A786D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jun 2021 09:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231162AbhFOHwI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 03:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbhFOHv6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 03:51:58 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8D5EC061767
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 00:49:54 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id t9so10743003pgn.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 00:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tz2MIbk3vc4zbAhiqlVvL6FoXwBOoa2e5bHBmg/V5nU=;
        b=CXCSx9xib+KGKWjG1OZ9WsJoW0LDDPa6D2AKy3FZ4NFO9vVZGYt0UP5RVvbEJWNfn2
         Fa507p6Cd7sgQzHTmAjp07h8oNZZWOI+tQ5paq51SexO6i43IVLNbvR+Mn4isuYvBRG3
         KUZaNl/OPNZl6zwV7BHf9avFVLQJuBPxi1YLAW9hUEsvI0Ahqi8EeYXKTxCjJt7EArRa
         lKrOGoa3soUFlwcDXlAxyw6aQJdXLRUnDGkm9UubOkCN7cj7nEVsYCVCeWpEuuj3g83r
         7Flxv79sxeMA+NrStDc7oSpaZ7aECCfGyjmmJDCSxFgesTFY5Bc5k3HTnQGUyOa8+v3i
         ZD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tz2MIbk3vc4zbAhiqlVvL6FoXwBOoa2e5bHBmg/V5nU=;
        b=jcojC4ye8+qhKjPVKt6Ocvz5vjITuXdvapi9MPBk4Gm2FfFEXpsYbx/c0vpHNW02Qz
         2iw6+y22Cb+oXE4UGdfjcDbp4zLOtTFdQO21eBxIWcMh9LH7No7IgZv1djiRQg/AyIA9
         frHoRndhN5HVlM3af382dMsuBnxFPvOIG4WOWaM7FvO57H2bfX3G2D4CLhGCUdtCQERA
         HMV53/RkV3IGl5FuIjHgDQiDRJvtOhOQIZX/hnB+MruP4VJ+7R3iDz8JJ+WoZIHwzfmq
         wPEy+cJTFs1/8bOidDlvewBT46tlNIiuJF2RxV8h3247Mkd2m/Km1O0D9RYM5ZfIwlTp
         by4A==
X-Gm-Message-State: AOAM531m/y1icdsWLDnZNIRxFeurne8pwENinjnbvj9NhvCyCQALMQb7
        Be15VqCbiwqFwG5wrm00+1va4pPfcbkX3Q==
X-Google-Smtp-Source: ABdhPJyrC1n2IsfufhYpSJ6RBIYEwCKnkWHyeXKSZ5HAqnwLTKbp3nPpCP88QoQeG3FjlG6fz/jfiQ==
X-Received: by 2002:a63:fa03:: with SMTP id y3mr21074370pgh.389.1623743394162;
        Tue, 15 Jun 2021 00:49:54 -0700 (PDT)
Received: from localhost.localdomain.name ([122.177.197.114])
        by smtp.gmail.com with ESMTPSA id c25sm14273097pfo.130.2021.06.15.00.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 00:49:53 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH v2 08/10] arm64: dts: qcom: pmm8155au_1: Add base dts file
Date:   Tue, 15 Jun 2021 13:15:41 +0530
Message-Id: <20210615074543.26700-9-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
References: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add base DTS file for pmm8155au_1 along with GPIOs, power-on, rtc and vadc
nodes.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi | 134 ++++++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi b/arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi
new file mode 100644
index 000000000000..b04c28e54470
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, Linaro Limited
+ */
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
+
+/ {
+	thermal-zones {
+		pmm8155au-1-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pmm8155au_1_temp>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus {
+	pmic@0 {
+		compatible = "qcom,pmm8155au", "qcom,spmi-pmic";
+		reg = <0x0 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pon: power-on@800 {
+			compatible = "qcom,pm8916-pon";
+			reg = <0x0800>;
+			pwrkey {
+				compatible = "qcom,pm8941-pwrkey";
+				interrupts = <0x0 0x8 0x0 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				bias-pull-up;
+				linux,code = <KEY_POWER>;
+
+				status = "disabled";
+			};
+		};
+
+		pmm8155au_1_temp: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x0 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			io-channels = <&pmm8155au_1_adc ADC5_DIE_TEMP>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmm8155au_1_adc: adc@3100 {
+			compatible = "qcom,spmi-adc5";
+			reg = <0x3100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
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
+		};
+
+		pmm8155au_1_adc_tm: adc-tm@3500 {
+			compatible = "qcom,spmi-adc-tm5";
+			reg = <0x3500>;
+			interrupts = <0x0 0x35 0x0 IRQ_TYPE_EDGE_RISING>;
+			#thermal-sensor-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		pmm8155au_1_rtc: rtc@6000 {
+			compatible = "qcom,pm8941-rtc";
+			reg = <0x6000>;
+			reg-names = "rtc", "alarm";
+			interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
+
+			status = "disabled";
+		};
+
+		pmm8155au_1_gpios: gpio@c000 {
+			compatible = "qcom,pmm8155au-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmic@1 {
+		compatible = "qcom,pmm8155au", "qcom,spmi-pmic";
+		reg = <0x1 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
-- 
2.31.1

