Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A515B643904
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 00:05:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbiLEXEo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 18:04:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234126AbiLEXEP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 18:04:15 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 073911EC61
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 15:04:14 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id qk9so2108569ejc.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 15:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxTuDuP9N5RzZdY9G7Umgi4OKE3T+v4Fwox44/I+AkY=;
        b=PNv8t5TQ6nHc1IgRghLS3MoblmEJNjJ/JXIraX33FWI2T04UqGUXlJE5Qr9FaR0UDQ
         4EwJSrcqbuvTOzn87f5pkppnAeFnQyCQSdYKrIEv6e/IPdu62ntwlopJ11QAzUjnsU5p
         jAEGOGazIPa1arj+ibzD02PB22Ykwy/YR/FowwOKk3Hzr0Eh7XCucmkRjqJmgXjyi0Og
         Mh6i5Wl8jLEfLYtBWKEGcfVXyA6+12BODA+vE32lm6O+vfQ8LUWsAF1FXLjbtYgm/24B
         zVAyfwr26V3cijEG4y10A3eW6Mq4mwyPcs/Imsv/64mfSIvQ6YgHQYbGD7BhfypeNrCX
         dxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TxTuDuP9N5RzZdY9G7Umgi4OKE3T+v4Fwox44/I+AkY=;
        b=5XdsYaebLvMT3is6ac6Czm1RcYvdNRIa2TOYJttSpQV3RpbcFoG7ioSqr1ivV+SAbe
         pMGURvgDzkTBRFPv6JiRW40MA7efunS9TRb6oy+gUW0uG72AXb3X5QG5GX62e7TR0bQm
         t7Qk7NH9FC8THw5fOntMigKUW1rp1BFHrIV3Q2o9PXFPpqbS17rsI51Q6jIav6b2xgq4
         3e7gt+tOifs5Hms7N8yFYgK2z0wgiOlN7+1Pi4RvQqgr6U/0nGKqn5EXm5SD+w+odQvv
         VtSy1Ucfkf0Ilq3EgKgm+wLklbj3suBxg5sMjwxYSCy3D2KPlvjnm7uvk2GUARqrHwqs
         8+hQ==
X-Gm-Message-State: ANoB5pmUf6+TYrE5ogagB9F1CxHJwIQssXIqAXzk6BU9IANbcONShq7v
        CL/nPjZ7E+ydHRq+25SVpNDJ7Q==
X-Google-Smtp-Source: AA0mqf7/CZZ6PwtPKFREqZaOJhY+er6xQMLopcuTqlMO6+NzODJw025tgX6jIL8LYbjObtwgYrSlGw==
X-Received: by 2002:a17:906:882:b0:7ad:e161:b026 with SMTP id n2-20020a170906088200b007ade161b026mr66697705eje.760.1670281453609;
        Mon, 05 Dec 2022 15:04:13 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id kw26-20020a170907771a00b00783f32d7eaesm6655642ejc.164.2022.12.05.15.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 15:04:13 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 09/10] arm64: dts: qcom: Add PMR735d pmic dtsi
Date:   Tue,  6 Dec 2022 01:03:41 +0200
Message-Id: <20221205230342.494923-10-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205230342.494923-1-abel.vesa@linaro.org>
References: <20221205230342.494923-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Neil Armstrong <neil.armstrong@linaro.org>

Add nodes for PMR735d in separate dtsi file.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmr735d.dtsi | 104 ++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pmr735d.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pmr735d.dtsi b/arch/arm64/boot/dts/qcom/pmr735d.dtsi
new file mode 100644
index 000000000000..41fb664a10b3
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmr735d.dtsi
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2022, Linaro Limited
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pmr735d-k-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pmr735d_k_temp_alarm>;
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
+			};
+		};
+
+		pmr735d-l-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pmr735d_l_temp_alarm>;
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
+			};
+		};
+	};
+};
+
+
+&spmi_bus {
+	pmr735d_k: pmic@a {
+		compatible = "qcom,pmr735d", "qcom,spmi-pmic";
+		reg = <0xa SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmr735d_k_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0xa 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmr735d_k_gpios: gpio@8800 {
+			compatible = "qcom,pmr735d-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmr735d_k_gpios 0 0 2>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmr735d_l: pmic@b {
+		compatible = "qcom,pmr735d", "qcom,spmi-pmic";
+		reg = <0xb SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmr735d_l_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0xb 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmr735d_l_gpios: gpio@8800 {
+			compatible = "qcom,pmr735d-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmr735d_l_gpios 0 0 2>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
-- 
2.34.1

