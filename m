Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE420644F2B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 00:01:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbiLFXBT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 18:01:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbiLFXBO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 18:01:14 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE6D94A589
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 15:01:10 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id t17so10013370eju.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 15:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q4rFInHPvXMY21RVSYqFleaDBM1EbzDLtUryUWQU3DY=;
        b=xODzVUxFLqWArOfIsoJ/cwDzAMNe3TxzVs+Uv8HP0t8uAit9gaxj4H4xuGh6NTkXYR
         VbTj/m8H51J1nWnLVhHfgVi/SKCTZI5/iRKmRZjnTRVgssf/bC/dDGJ7wMGr99Lvx/Tw
         Wyho7IJaC0cgCrOcBr+15RBMwNlA+AHG40WMZLwvl2l8oV1G+PU2QzKy1nQROT+AxfNX
         JfkZa/E+b/oBrip+INe1feU4Z9If5mbGDxTv2p6ulU/pRWX/zOJobJEMPb/Q6qWARY+v
         LZsrDB6Yh7yWamSuREF7FfWJgHIdCOsexVNTP2rtzCtGC1oSCIZzDks7jmO7LG/wM25f
         uqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q4rFInHPvXMY21RVSYqFleaDBM1EbzDLtUryUWQU3DY=;
        b=Rnb3HY5Ha+9W/izpcdS+WGmVyxqt9uNEQxGzTWnQeY1K7XN0W5c67obTk8/toKN0j5
         tS8sJRvfJGdkz9IVP4c3C9YrwukaWytA3mYQaiXvPodCecLQ01MkxojG5a7Nxj5Bd0rr
         9wQ67xRLly/jCJh9UgA4LT13G8/PTAinGVeRRRTtuVfErge7C53BVgJM0COz19dO1wUW
         0zO+689N/PYFqWXz/WPEuokkfRXsETs86H2Pdp4gHaRO7bSW0VafDVZeHh5lBbmX+iy6
         DLVdHWJhTRvNsYo3MUjrBvjZQbH5aGGMQ5bDOjYngtDS/gMeJY2qAsLVlI21dVotmqkP
         501A==
X-Gm-Message-State: ANoB5pnhsBWWxSZS+NeYasbdw5S46lVxRVDGJ4Vta/EHYftBoZuFdtsR
        2cpF4TFl4+qpAzKxZzRY4SkW2A==
X-Google-Smtp-Source: AA0mqf5vDbcSX0l0nDKGs0KRc4DH00ZILDoJLgHzhYo3HD2wcSdIkdbBa+6Fe2NbP/mcekDq57g2Yg==
X-Received: by 2002:a17:906:60d0:b0:78d:3f87:1725 with SMTP id f16-20020a17090660d000b0078d3f871725mr23827030ejk.492.1670367669238;
        Tue, 06 Dec 2022 15:01:09 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id p10-20020a170906838a00b007c0dacbe00bsm4239320ejx.115.2022.12.06.15.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 15:01:08 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v7 03/10] arm64: dts: qcom: Add pm8010 pmic dtsi
Date:   Wed,  7 Dec 2022 01:00:55 +0200
Message-Id: <20221206230102.1521053-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206230102.1521053-1-abel.vesa@linaro.org>
References: <20221206230102.1521053-1-abel.vesa@linaro.org>
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

Add nodes for pm8010 in separate dtsi file.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8010.dtsi | 84 ++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8010.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pm8010.dtsi b/arch/arm64/boot/dts/qcom/pm8010.dtsi
new file mode 100644
index 000000000000..0ea641e12209
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm8010.dtsi
@@ -0,0 +1,84 @@
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
+		pm8010-m-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pm8010_m_temp_alarm>;
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
+		pm8010-n-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pm8010_n_temp_alarm>;
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
+	pm8010_m: pmic@c {
+		compatible = "qcom,pm8010", "qcom,spmi-pmic";
+		reg = <0xc SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8010_m_temp_alarm: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0xc 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+	};
+
+	pm8010_n: pmic@d {
+		compatible = "qcom,pm8010", "qcom,spmi-pmic";
+		reg = <0xd SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8010_n_temp_alarm: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0xd 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+	};
+};
-- 
2.34.1

