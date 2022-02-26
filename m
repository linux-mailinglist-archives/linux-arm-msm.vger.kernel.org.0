Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE1C4C5822
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Feb 2022 21:57:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbiBZUvT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Feb 2022 15:51:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbiBZUvS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Feb 2022 15:51:18 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 939252668D3
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Feb 2022 12:50:43 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id p20so12135336ljo.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Feb 2022 12:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JB5Hp7egyGG1aqXfw3ffSMON5CVbgLKo1ODkm8HQykk=;
        b=AQfw8N8XtcX4GtrlN6Wg5l9+dzN2CwyrUG1gHPAxgVw1tIsP9SrOoxJdzhasUKyWyB
         NGcYfTwmUrAXhxXpTw5rIqXI1w15Z77NMeh5sDChyvuVPXpTSrhRJbo17Sg/vLo5pbzY
         7JzfPLDHz1oq7/RVUdATy+Z8tDgawHxGpYiPPfdxh1itTsS5Pci9+iQFN0Gdj5wCEYxr
         g2XvxAV6eMljj9fgr2FNju7inD3yvtqD/AOSBr15dOxMWVyPkMGQNZ4AlsEcj/1BRImT
         0Pm+pLhnhnxA2fwPdwzdVAQFBs1YR9UYoniirQwXsjrxKBERKYTwC8LkFIdKbHSo6SEC
         AsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JB5Hp7egyGG1aqXfw3ffSMON5CVbgLKo1ODkm8HQykk=;
        b=W/QuxiDnoFRnKVYu76SNyjyWU09SJNi8VfH1JUAl4IWC4B3XSqALtTgyvqZG3choxF
         M8wKa43pQJm3ZgTHcPceF1nwunrh2pUrzZIMew1KAIfcMffEIzYMOz14TUQILUu2n6QW
         R/yz7xSfU3GwAmDyx2OJ17zbeAm0HK7PYmGaS4Ku+RUTmJm7CPfSPPLvbrx2BYlb6dz5
         Zg+M8MCSyIF9kWlUqrc88aQIzUnc0+sE0w5pj/2aDclPPLuGfZTiL9cUthEg2iEEOAqV
         m/LOlRmos93ZXpg8IR3gUjBB5D93Q73q7eoPxQcZ7SWbYeuoF7ePzYfN6MZ0JzzAKzBh
         eA2Q==
X-Gm-Message-State: AOAM530R+PE96JL2QRtIOCaIaJFsfGiMBxTIbH6tWlc4G9Xg2ZKtE4XX
        VhvqxTHrZzz+nuvtITUx1uJE/2+QWOHNHQ==
X-Google-Smtp-Source: ABdhPJzT9vdLlCCOqH6Ztmiw7FeMd2tEOJ4v3pRDGgdXH5uVzQ3lI1s7zVn1f5xUTxxnAUpnv4JdkA==
X-Received: by 2002:a05:651c:2cb:b0:23d:3168:915b with SMTP id f11-20020a05651c02cb00b0023d3168915bmr9136564ljo.22.1645908641976;
        Sat, 26 Feb 2022 12:50:41 -0800 (PST)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m27-20020ac24adb000000b004433bbaa3fdsm527162lfp.174.2022.02.26.12.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 12:50:41 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 7/7] arm64: dts: qcom: add pm8450 support
Date:   Sat, 26 Feb 2022 23:50:35 +0300
Message-Id: <20220226205035.1826360-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220226205035.1826360-1-dmitry.baryshkov@linaro.org>
References: <20220226205035.1826360-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add PM8450 PMIC device tree include file. It is going to be used by
SM8450-based devices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8450.dtsi | 59 ++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8450.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pm8450.dtsi b/arch/arm64/boot/dts/qcom/pm8450.dtsi
new file mode 100644
index 000000000000..ae5bce3cf46e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm8450.dtsi
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
+		pm8450-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pm8450_temp_alarm>;
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
+	pm8450: pmic@7 {
+		compatible = "qcom,pm8450", "qcom,spmi-pmic";
+		reg = <0x7 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8450_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x7 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm8450_gpios: gpio@8800 {
+			compatible = "qcom,pm8450-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm8450_gpios 0 0 4>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
-- 
2.30.2

