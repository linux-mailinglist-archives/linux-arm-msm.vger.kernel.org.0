Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B6A039DB88
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jun 2021 13:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231462AbhFGLlg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Jun 2021 07:41:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231366AbhFGLlf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Jun 2021 07:41:35 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0304C06178B
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jun 2021 04:39:44 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id u7so8494487plq.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jun 2021 04:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ix3Z3iu5Sdv/B7LYx2J6tZXgGiemwrKhiSlqqq85Tao=;
        b=kTSgf7cpzEefZXwj/Gi0pLErE2/d8Xz0i2MKmf7fPxskKtL4Ap66mCqhKSxUMkFVsD
         e1NCuuSbL2YSOLMHyXqroWjo11J/c274RGqMf+oktKFxpcirue7p9iZxoqvjq5ktINvx
         QWaT2Nu+IflBUPy5SeuBJjteB6xokggeABOEwvzP/iIEE996+vye1MGS1CeTi/jd4noq
         Z4aSpIaKzATfZk20ADAtdXhvRwPNsDyW1CpyFsGdR26x+jnmHN0hcVulg0YUd6h3zAJj
         XuSfh0akC5UQL46cqiWFnHPrU3Zglyj0exMkUsLu2Pxb1ltDxYAJ2Zwd7NyYpnx8hTXQ
         l+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ix3Z3iu5Sdv/B7LYx2J6tZXgGiemwrKhiSlqqq85Tao=;
        b=ci5nqfq55AYXuZJOG3/SGhtqW40Bi2tF+Aws8ywGf0fdRJcMQpFdCwcWygd7Kszffe
         Vcf0xd/dZsmRWp9+HDZfLCrc0MwrK/PCVv7BmCdo0AQUHLH5L88XkxKwdGYf8eIMZS+U
         vyIkwtQT9SQZ+HonsXi+9yioo8kBPnuwUKuZWXiIX32SC3ZjjL54JF+I/TLokZLSG6x2
         xbpmPZ7SFEEsrNRBYZ2QBtuewNmt07EpIXfESkBWZMLWMGnAPIpVSn4zFrxJJBUqxi94
         ZvxtuRvYqaSvDh8btgk/5NrNDW/dICjr6sgofmRSrMRWjDByciygjLVdRrTUUtplb5MS
         v+zQ==
X-Gm-Message-State: AOAM532OBnAs2mmpJ9JmY8r0CHkH6G6cQDV+b25mLG5z7XMXmUCWVyhU
        p3O3xap73aB/0PYUKrlC4YWH8kzf0vmAeQ==
X-Google-Smtp-Source: ABdhPJxws8tbeEWl/MSug9iQQCtBEVPomYu6qYlDUP9up54p9iqpvXvSgdNOKLMUmgy6S2lqDqgc0w==
X-Received: by 2002:a17:90b:3ecb:: with SMTP id rm11mr19723250pjb.95.1623065983941;
        Mon, 07 Jun 2021 04:39:43 -0700 (PDT)
Received: from localhost.localdomain.name ([122.177.177.211])
        by smtp.gmail.com with ESMTPSA id j7sm7223939pjf.0.2021.06.07.04.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 04:39:43 -0700 (PDT)
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
Subject: [PATCH 7/8] arm64: dts: qcom: pmm8155au_2: Add base dts file
Date:   Mon,  7 Jun 2021 17:08:39 +0530
Message-Id: <20210607113840.15435-8-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
References: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add base DTS file for pmm8155au_2 along with GPIOs, power-on, rtc and vadc
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
 arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi | 107 ++++++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi b/arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi
new file mode 100644
index 000000000000..11c0c203a4e2
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, Linaro Limited
+ */
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pmm8155au-2-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pmm8155au_2_temp>;
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
+	pmic@4 {
+		compatible = "qcom,pmm8155au-2", "qcom,spmi-pmic";
+		reg = <0x4 SPMI_USID>;
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
+		pmm8155au_2_temp: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x4 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			io-channels = <&pmm8155au_2_adc ADC5_DIE_TEMP>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmm8155au_2_adc: adc@3100 {
+			compatible = "qcom,spmi-adc5";
+			reg = <0x3100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+			interrupts = <0x4 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
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
+		pmm8155au_2_gpios: gpio@c000 {
+			compatible = "qcom,pmm8155au-2-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmic@5 {
+		compatible = "qcom,pmm8155au-2", "qcom,spmi-pmic";
+		reg = <0x5 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
-- 
2.31.1

