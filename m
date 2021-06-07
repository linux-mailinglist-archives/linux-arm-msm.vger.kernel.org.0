Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2B9039DB9C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jun 2021 13:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231582AbhFGLma (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Jun 2021 07:42:30 -0400
Received: from mail-pj1-f46.google.com ([209.85.216.46]:36446 "EHLO
        mail-pj1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231580AbhFGLma (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Jun 2021 07:42:30 -0400
Received: by mail-pj1-f46.google.com with SMTP id d5-20020a17090ab305b02901675357c371so11401752pjr.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jun 2021 04:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a7axnRN7J0TgpBrh+Kb0fw1d7DU02xsKPrnGXvbuVaw=;
        b=vVkRkAihLJJtBX4HTGi9pn9BV3vX7Qe0XrIoTcWjOPnHT24fkDYpqXhAkKoqgMzE6Z
         e7TNWfcRWEq/QJRDbFjc0Cf64Q5dyJSpaAOgeHImeR2OJJdN+0b/m7dqLv+LA8JiKluq
         EPUjauEqlo/yfXZFcahub8d6P7S66vhV6fupaRfD2LzkpUjSmf+sP+7rFpo0AmY6SAUB
         2Yolb/9yaq/v65/qSANPGCIe3S3PwAwyJxB+6BpAJXDgcksarZohaVyoOrq8A4wKACGt
         xb26UB665E97tauqd0Xxp9eIm3gL+KV1RSA3VzUNWFI1Z51tST2GRmwImSxfXr8KvuJ3
         x7wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a7axnRN7J0TgpBrh+Kb0fw1d7DU02xsKPrnGXvbuVaw=;
        b=SWJD2cDSknCOiKzjfog6orJKSSbaxUVKLfvP20cUC560Mw4mJvi2jHgOcYnY5b62fP
         AA5YKr6WNKccq4fAPSyyj+PTARgDiife4CHYvxTQIoyLGQjUVHpG5oSBF2WYGHpHCCY8
         yBYTJ/YWwiLvU/lcCKtV3ZacWaXfPC5+YXY9bjOR/Uq39TAz6z7VSemUdhAZCrjSPhEp
         3P3UIv1gJ/HvHOSH94ljUblqc1EVYheCbmtqTBjxn2ArKfyi+Ny2g0gk9mNBwXNuyF4W
         Dy594Xe03lY4ZUIerkzzLRM7pnKlSxWDhSplvx6eI3pu4JtDeWHW7wyoH3M/X/9CmuPQ
         abog==
X-Gm-Message-State: AOAM532OTfp8PNetbi66adXGzic7ff0p5rRfDWBYoVmCl15J2at+yEqB
        DOEPhDE1r5w/12Mz/QIJqZxt7ngxZKNEaw==
X-Google-Smtp-Source: ABdhPJxQCM2sTdShjg8xqQTg6oL/ZbHAuZxKnPCSh5Z09oDloWaPhHm+SamzN5DG2WUJvCpkb4dJsw==
X-Received: by 2002:a17:90a:e298:: with SMTP id d24mr19962376pjz.36.1623065978833;
        Mon, 07 Jun 2021 04:39:38 -0700 (PDT)
Received: from localhost.localdomain.name ([122.177.177.211])
        by smtp.gmail.com with ESMTPSA id j7sm7223939pjf.0.2021.06.07.04.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 04:39:38 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bhupesh.linux@gmail.com
Subject: [PATCH 6/8] arm64: dts: qcom: pmm8155au_1: Add base dts file
Date:   Mon,  7 Jun 2021 17:08:38 +0530
Message-Id: <20210607113840.15435-7-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
References: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
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
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: bhupesh.linux@gmail.com
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi | 134 ++++++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi b/arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi
new file mode 100644
index 000000000000..2392c742021d
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
+	pmm8155au_1_0: pmic@0 {
+		compatible = "qcom,pmm8155au-1", "qcom,spmi-pmic";
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
+			compatible = "qcom,pmm8155au-1-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmic@1 {
+		compatible = "qcom,pmm8155au-1", "qcom,spmi-pmic";
+		reg = <0x1 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
-- 
2.31.1

