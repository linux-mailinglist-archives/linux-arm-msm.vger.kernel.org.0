Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03310659BEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Dec 2022 21:23:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235536AbiL3UXA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Dec 2022 15:23:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235532AbiL3UWx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Dec 2022 15:22:53 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92EBC1C91B
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 12:22:51 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id bn26so1234875wrb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 12:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxTuDuP9N5RzZdY9G7Umgi4OKE3T+v4Fwox44/I+AkY=;
        b=acQDxCD/28bMgKK9caAIwu36B9tMXxx0SVsW5VMZzVIqzOSyY7AQQUJlpKyymiHZ3H
         13o7PsB2XjsqDdFPzLWWah2nz0zpFXx4d2A82ZGtDpZuBTsq/eit89z65vKUEbVE1aYd
         UA0D3Zb/XGR/YFC+KJ/WW5hJHHTQS1NU+fDATsPV+mBHEQPxSQH0YumNfYYY8G8/GKtq
         ojrBJtnlX8j05Ck2doW8zlhc+TUpJu1R72F7WRxCD6oe/T/xvdVgOzZ1D3A0IohEN1Ci
         HjOzw+YK1VAOBUiOiL3KcQaOYn8gWeDr4OK8NMOiDyMoMyGqTkBozrr760+aQiIgs8hR
         1PVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TxTuDuP9N5RzZdY9G7Umgi4OKE3T+v4Fwox44/I+AkY=;
        b=KzR4EzNeUN/f04/htYASTwmuJKITa2bbXtZPD6XxFBUANsIV+/i98h4bGSmM5Bg/9m
         XWr7poqcHgqjXfnp85Qy91b9n/9QpBiQi8YoC9Av3KlYtUkQhMlZ3BTHga4zMVMI+0F1
         20RxzSXzp2Pv5kPf8qYACZzzCBd/6syaNjA3Dn9BUFoHLLER0bJ0CNOUneUgMHW2d/i7
         NKV480ACbH7u9NdCEAXvhNXXFOZWfywJQuOJYyJccGTbGNiLu2LW9hNKEgYbNzVfy5eh
         afchfOH10Cwsq9jktMkXjiYXwRgUUd6SK6dIyGzscqyJ6U2jkztnOgqNgWLc6DYJFsg+
         EGZg==
X-Gm-Message-State: AFqh2kpPZTth/x5Ul9dt85RJK4qWV5zV1e+b0h9CO918qK8xgfyOwM8t
        U3A/u9J3JB1Ii3FU8jUVh1IfvQ==
X-Google-Smtp-Source: AMrXdXuYchUZ6Y0d3YLeZVNL+BE3VSK7N5iyrVC1/ZZvZL/RBCo9Tjxz+H1ejvWh6Pl2pa3R9+tRMA==
X-Received: by 2002:a5d:5408:0:b0:242:51ae:e9ca with SMTP id g8-20020a5d5408000000b0024251aee9camr20869876wrv.35.1672431771178;
        Fri, 30 Dec 2022 12:22:51 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id z1-20020adfdf81000000b00268aae5fb5bsm21359142wrl.3.2022.12.30.12.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 12:22:50 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v8 09/10] arm64: dts: qcom: Add PMR735d pmic dtsi
Date:   Fri, 30 Dec 2022 22:22:29 +0200
Message-Id: <20221230202230.2493494-10-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230202230.2493494-1-abel.vesa@linaro.org>
References: <20221230202230.2493494-1-abel.vesa@linaro.org>
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

