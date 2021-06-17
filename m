Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 791613AAB3B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 07:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbhFQFsn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 01:48:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbhFQFsh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 01:48:37 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64210C06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 22:46:29 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id q25so4083706pfh.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 22:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TTzo1X6mV9W2PxKItj/q6YwMruyeGBnEnmIaedUDegw=;
        b=dmOWihjEIb+styuVVaPUeGrioleqeiisos1r++nvYs953nJgoC8wUz+lmrbchRgDHr
         C3VncXUxuIl0teSUshnNh4qNoLtNC8k546EGf8ex5vxe5eSX4v6jwQ407g9dxQLTVbwQ
         f2KYTy+/r6sAT8eJnY9y/DWximSLDaFyB5ebEtPL+a3oOa5cm08jpIti0hPearI2ET5P
         EomgxepYXSqdsVnL0FTbGqqmUa8WQzVTdNYzogclAX9GUUzMB1K+VFIagHtv0wvmbpJy
         bk38MFYwfRc76RP9YSJzASZLuv/4t7D/VNuOHj4dos+7q90Uw1vNHdtqi44oecO4obqC
         XPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TTzo1X6mV9W2PxKItj/q6YwMruyeGBnEnmIaedUDegw=;
        b=t8B0Tgl/sRZ8c9V9HZT1+tmOQ5zeZALza4wfmI0M5MfYuupOIZMJsX2NJ9lDm3NGh8
         b9AIW+NBhYRxnVRLVunCKqcLLl3t7cEo8bWW6cffWvkmHEM4ffGP37lUq7ZTIrwC9ohX
         hi3jF8cz0H1JBIIWOL7owo3g3X90RIV/r+exuePsT8sVz690/Z8DThGBtxnVBaFmk5jM
         YgdFhqcoad8eGLzCVBu3klcgxP/EsnhB0VvhSdraX6mPSV8WmNT+khaOic1DVJGo6S/O
         r1QaxDBkJowR5P/MDi7YBHObKai2K3DX7fUHkHvw7X7KMi1EiQIT2nDeQf0Wu3b+jwsV
         0S0g==
X-Gm-Message-State: AOAM532wzEdZc61Vp/dodNt1E/IFJOnnPWKVO5h5RFAVPfT2HIvpc10p
        D2XEQgOfqSQ1S89qglCtdlb4ISn7cW/qSA==
X-Google-Smtp-Source: ABdhPJzjqkH/+emHIXDX18dHKKV3NouPjTTgnfGaa1BcmvB6qbp6amy7YkFUW9idD+coWTM96YkKcQ==
X-Received: by 2002:a63:5915:: with SMTP id n21mr3380529pgb.58.1623908788767;
        Wed, 16 Jun 2021 22:46:28 -0700 (PDT)
Received: from localhost.name ([122.177.46.2])
        by smtp.gmail.com with ESMTPSA id y27sm3882700pff.202.2021.06.16.22.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 22:46:28 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 3/5] arm64: dts: qcom: pmm8155au_1: Add base dts file
Date:   Thu, 17 Jun 2021 11:15:46 +0530
Message-Id: <20210617054548.353293-4-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617054548.353293-1-bhupesh.sharma@linaro.org>
References: <20210617054548.353293-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add base DTS file for pmm8155au_1 along with GPIOs, power-on, rtc and vadc
nodes.

Cc: Mark Brown <broonie@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
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

