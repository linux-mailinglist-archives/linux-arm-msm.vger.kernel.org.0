Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0E3C637ACF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Nov 2022 14:58:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbiKXN6z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Nov 2022 08:58:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230394AbiKXN6Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Nov 2022 08:58:16 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB71F1173EA
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 05:57:13 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id t25-20020a1c7719000000b003cfa34ea516so4547103wmi.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 05:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwYQ735SUBtDuMQ7DwTR5cdR1UgTXPek1jxsDhE3/Fw=;
        b=jR3BhqlYD0vL/n+SqZakUIShxC95IzJcCkMiaTyTZwaxYHvzgu9CEgT6aEJuMUx1DR
         3kmKm/kI4kRnWAxGo+KXq3Hd6h4PLcUBXt4wA/qPS0Kisx+W+fpuaoUfiJ3XRM2pvV/I
         sgRiMiUMA0GMGt7VflNx+Zecrb0HEpRdrppnLUhxh5A9L64XhHweNZmoxlPZl0v1Q016
         Yqrh/GOLWKqe7pJwyFb9UlDjryMkp905zTzbP3a5Q2ddbhhwaZSRrKv4UJ7Ftb5YopDg
         S5gstPrP/dmBIIzEO2Cc3Qibeg/eF1FZ0kdUESmydXxA/hLyQpwyUGCG5nnsxagvrsVr
         SJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RwYQ735SUBtDuMQ7DwTR5cdR1UgTXPek1jxsDhE3/Fw=;
        b=tA+eUjWzDj7SfsbHQoM9LLmFnOTJNwZtcA0mjSZ6d7Cwr26E/TiG+3as1jyMk7Mii0
         kpKOkB00gIX+xPy4xMbiTVLSuZQLKVYATy2ZFS9xSh+MzY1lsiSIEkm4LXRh5ZfGEo/k
         GBWR3D4ryaxxrgbJrkih3HBeDHwpq6ABtIAnFC/5cDjEvHtJTDB79vPimbFuDqw2gt7Q
         Nwga5j8m3ILJkWvE+Pl5NyNB4f71cYnDc/Ljq7ZkDFDpLCwaAN44uqQkYqmJe3VBH1t8
         KivCT/6y5wdIw9HHv/bRxPJp8kJaSJlBclge6nYS9psnMTEr2SaxI+y+oKiRguWBXihJ
         UHxQ==
X-Gm-Message-State: ANoB5pndPfKM+Lug6Lz/hf4oZHG225sq9B8uWwBBHB2qIGtYgqut41o0
        HRKntQrG1UAWWG4fCzm6UnPHXQ==
X-Google-Smtp-Source: AA0mqf5EnGOq0ZWF3j/xN+c/KGfhWHqHg8ViDO6o1dtsRfY5F0q8UabT/ghWTV3rdD6rpMKCZBW2Ug==
X-Received: by 2002:a05:600c:1c9d:b0:3cf:69ec:9628 with SMTP id k29-20020a05600c1c9d00b003cf69ec9628mr23909529wms.79.1669298221631;
        Thu, 24 Nov 2022 05:57:01 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v14-20020adfebce000000b00241d21d4652sm1414322wrn.21.2022.11.24.05.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 05:57:01 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 08/10] arm64: dts: qcom: Add PMK8550 pmic dtsi
Date:   Thu, 24 Nov 2022 15:56:44 +0200
Message-Id: <20221124135646.1952727-9-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221124135646.1952727-1-abel.vesa@linaro.org>
References: <20221124135646.1952727-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Neil Armstrong <neil.armstrong@linaro.org>

Add nodes for PMK8550 in separate dtsi file.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---

Changes since v1:
 * added the PBS reg and reg-name
 * added Konrad's R-b tag

 arch/arm64/boot/dts/qcom/pmk8550.dtsi | 55 +++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pmk8550.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
new file mode 100644
index 000000000000..47213d05bf92
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2022, Linaro Limited
+ */
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi_bus {
+	pmk8550: pmic@0 {
+		compatible = "qcom,pm8550", "qcom,spmi-pmic";
+		reg = <0x0 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmk8550_pon: pon@1300 {
+			compatible = "qcom,pm8998-pon";
+			reg = <0x1300>, <0x800>;
+			reg-names = "hlos", "pbs";
+
+			pon_pwrkey: pwrkey {
+				compatible = "qcom,pmk8350-pwrkey";
+				interrupts = <0x0 0x13 0x7 IRQ_TYPE_EDGE_BOTH>;
+				linux,code = <KEY_POWER>;
+				status = "disabled";
+			};
+
+			pon_resin: resin {
+				compatible = "qcom,pmk8350-resin";
+				interrupts = <0x0 0x13 0x6 IRQ_TYPE_EDGE_BOTH>;
+				status = "disabled";
+			};
+		};
+
+		pmk8550_rtc: rtc@6100 {
+			compatible = "qcom,pmk8350-rtc";
+			reg = <0x6100>, <0x6200>;
+			reg-names = "rtc", "alarm";
+			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
+			status = "disabled";
+		};
+
+		pmk8550_gpios: gpio@8800 {
+			compatible = "qcom,pmk8550-gpio", "qcom,spmi-gpio";
+			reg = <0xb800>;
+			gpio-controller;
+			gpio-ranges = <&pmk8550_gpios 0 0 6>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
-- 
2.34.1

