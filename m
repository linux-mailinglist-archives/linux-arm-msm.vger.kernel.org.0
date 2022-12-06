Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A28F8644457
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 14:14:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234603AbiLFNNl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 08:13:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233178AbiLFNNb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 08:13:31 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A43913F25
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 05:13:24 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id n21so6026342ejb.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 05:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GBkrjGOYCG/vFk7NUYRuiiITSa0YV9dEfizXvTyQ5c=;
        b=YrpaHjwuDo4r0DOFwuwsECyHvnN/pZErxOwfbUQI5I8Ib1zoahU8Qno13NBen+P/KB
         k5JQRoUIOIjIG1UEDdRAXtJ3o2nl1SoNcUyGef6iZ6wWkvHG05cvaYRV357/hZic1Diu
         LsHvyZBG92aBGts2jXv+R2dDiuVJ1lrZ3sz6U2bo8sp+VH50HScTDvpDGYHJWwRO6EHv
         sCgcKy6NyMUfH0Fn4d62A1429mOvO4uxc357arTegrVfOa+Zn8mBLyoK+DfWwY0DeGut
         Jam5tQJZJ0iQqQmaZcvGCcxFg2fqBJq0vypfnyEeeIFrddP036Eop/xhVoJd7TUBmUkH
         FAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2GBkrjGOYCG/vFk7NUYRuiiITSa0YV9dEfizXvTyQ5c=;
        b=TkuHIWZiFU2Qz1C2E8lhVohPAF7UTntHEVBhMufv1esObMQV/svCU55ornbcG9PysZ
         Z1BZyYl31SaG3XnKNl+AOMahQIS2EZwOAUH9bM7HqTIBI3pq8Y0uKKlm7Q9r2dG/vH+/
         o3KBo0pnVLLTz3qz2gTvoANzWAxJ6UCbYwRKgQKyP84iVWjBs2B9qaYMPNVNYIXU9/pJ
         rXlkED7B+QwpMIJp6smqpKROhI16t1UBiwil0kr4UDmkymhNhKJsN22W3ORPyIvSivri
         mgEIviVJufS5DEhYdyCibHfb5rKrtUsfA7n62r5Fs+XHjF+0NuPQUxtO7dWbpn4QES1i
         clDQ==
X-Gm-Message-State: ANoB5plxlFZvJ3haoW1jLvoMK0mYDicYz1drbT6ujkBwYFJBc0CUy7qp
        7BsxlkLp5AxHNZn+ZQNOLduobg==
X-Google-Smtp-Source: AA0mqf63iltqML0x2pVQsXrHAR7YEA//oz9/L2AYQKAoQz2WbNhrERaoUHPl7YF228btXldruturDQ==
X-Received: by 2002:a17:907:76f2:b0:7c0:eb3c:1037 with SMTP id kg18-20020a17090776f200b007c0eb3c1037mr8561661ejc.663.1670332404074;
        Tue, 06 Dec 2022 05:13:24 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id u2-20020a1709061da200b007b8a8fc6674sm7345775ejh.12.2022.12.06.05.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 05:13:23 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v6 06/10] arm64: dts: qcom: Add PM8550ve pmic dtsi
Date:   Tue,  6 Dec 2022 15:12:48 +0200
Message-Id: <20221206131252.977369-7-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206131252.977369-1-abel.vesa@linaro.org>
References: <20221206131252.977369-1-abel.vesa@linaro.org>
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

Add nodes for PM8550ve in separate dtsi file.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8550ve.dtsi | 59 ++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8550ve.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pm8550ve.dtsi b/arch/arm64/boot/dts/qcom/pm8550ve.dtsi
new file mode 100644
index 000000000000..c47646a467be
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm8550ve.dtsi
@@ -0,0 +1,59 @@
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
+		pm8550ve-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pm8550ve_temp_alarm>;
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
+	pm8550ve: pmic@5 {
+		compatible = "qcom,pm8550", "qcom,spmi-pmic";
+		reg = <0x5 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8550ve_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x5 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm8550ve_gpios: gpio@8800 {
+			compatible = "qcom,pm8550ve-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm8550ve_gpios 0 0 8>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
-- 
2.34.1

