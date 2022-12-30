Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0A70659C01
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Dec 2022 21:23:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235540AbiL3UWy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Dec 2022 15:22:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235478AbiL3UWs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Dec 2022 15:22:48 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2AB91B1D5
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 12:22:46 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id ja17so15766290wmb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 12:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YiSyzj5bxhBZ228Fs3MQ7cHv3+MhOBcyO/fL/boI7rc=;
        b=IDZHp4zzVVyrz/prOwSQ2iHR7r0wDt1Ps0+jGhemKfx2ZX+jYc4uGhOdQcnGqBjy8K
         82iI08m8PoGIf7zLIf+79SyRcpmWVMWvXmZJvt/nai8Tdi5eoO8QHPSopW6XPin5eW4w
         UUszan2mHhTIpvFPM6sqErq8kaGf+Wnsb3EevYmEfPb8O1gkE1SYneA63jafPATS8yd/
         iF9WPOfxaYdvwgewZ0jzMXRuRRbPbCkj+aWKoH8fWDY5BMaydzGavljEz7TumZ5VDYB7
         lNosUwywiHQM+MCrt4+PVcmRu+SAoPyNZg6gqGAoRoReR3m/Yb75xRYesTwuqUfuYqgk
         /qdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YiSyzj5bxhBZ228Fs3MQ7cHv3+MhOBcyO/fL/boI7rc=;
        b=JygIpYO1hwAxbXM5M1YnIT7+rVyf1Z/Q3J15yIX+nGIuxwW88CrnJN1Eqa06IVsEwU
         zcGPnXAm51tiYY+nB48Ktv1nqKH58jAcy+Z7/WFsJgcmmpqhP16DnIDcxx4BPDJfOsDM
         gOx22DqCU0VEJJMy0KtbuuHrrz+oRRpzmMX/n5HsBjTWeaSyJJA38CWQjdo7OTklYdOF
         PzlIGRP0aXgA2ncSuH+UP3he/hOb+QxaNDrTyrS1pV6UxQJBk3NgfP/RE07nDBgJY/II
         4GsiLkuRv6kUGN7ZZ0BoQ7uprV6luLSIeesgJSFtb8/bZTJvF13rNbY934b0prMtBZyJ
         aILg==
X-Gm-Message-State: AFqh2kruiN8uzMslPwQbzG1YNnjeJUFhcrOZgHj79p6TrSweOjEEsqXw
        iV7C0w8bOF03jrktPSlDtfSPwg==
X-Google-Smtp-Source: AMrXdXuyCtgvSLvoeRVhF2WUcSdfmCfyEKaRdXIwZzgBbrMfLbLqzZ+bp5ipgAcxgSUaQ1zGkfBKNw==
X-Received: by 2002:a05:600c:2d91:b0:3cf:735c:9d54 with SMTP id i17-20020a05600c2d9100b003cf735c9d54mr23116054wmg.1.1672431765129;
        Fri, 30 Dec 2022 12:22:45 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id z1-20020adfdf81000000b00268aae5fb5bsm21359142wrl.3.2022.12.30.12.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 12:22:44 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v8 04/10] arm64: dts: qcom: Add PM8550 pmic dtsi
Date:   Fri, 30 Dec 2022 22:22:24 +0200
Message-Id: <20221230202230.2493494-5-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230202230.2493494-1-abel.vesa@linaro.org>
References: <20221230202230.2493494-1-abel.vesa@linaro.org>
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

Add nodes for PM8550 in separate dtsi file.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8550.dtsi | 59 ++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8550.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pm8550.dtsi b/arch/arm64/boot/dts/qcom/pm8550.dtsi
new file mode 100644
index 000000000000..46396ec1a330
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm8550.dtsi
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
+		pm8550-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pm8550_temp_alarm>;
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
+	pm8550: pmic@1 {
+		compatible = "qcom,pm8550", "qcom,spmi-pmic";
+		reg = <0x1 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8550_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm8550_gpios: gpio@8800 {
+			compatible = "qcom,pm8550-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm8550_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
-- 
2.34.1

