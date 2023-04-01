Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C35406D34A5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Apr 2023 00:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbjDAWI0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Apr 2023 18:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230241AbjDAWIW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Apr 2023 18:08:22 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF0E2FF0D
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Apr 2023 15:08:20 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id q14so26638127ljm.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Apr 2023 15:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680386899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgfrnwWfT0ZByQejr3H6Nf3Cbs6AKTJqWqNsjbKuQAg=;
        b=pSlZejAKAfCt8wjCs7PP47yjBAGcetQT5QN4KyE4e+eWoDmRMAudONk5ZwdJVliefa
         nZ4c3lY+qMmc5ObDtk7qa3knOsnWPGSm4QWPzFFoWiEXUTHU2kILuNV1EpVFyrfmTxZf
         bSIT1gG4n5vUQF8MIPCCwZgogD8w0Uwq1w4s9rxPBFRSQ4aF6x8eVCYUzPmC7d1pLp7F
         QHQRB1H9t5rrhxq3hlKcJdKd8Ano0CLZQwRubzg3E5cVGXgQH77/YBN6Qn2MKvCWt94N
         m/uGpmhnuK+SBnF3N28ey5sH+OonEDFnyW4jlsUq85CyFYxcuGSEJXeZvuWpco3DypQk
         eXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680386899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DgfrnwWfT0ZByQejr3H6Nf3Cbs6AKTJqWqNsjbKuQAg=;
        b=e1nOx77aZvV2jkrrqEy1SnAyEXU0xUgwroI144DnctZvG+TnQp2avuFG3IXTRpJgzf
         Kth3OZ+msV9y1aVnAqPq/v5XX7KxZfO7GiSgV3bI6xwZNqXtf3Nzj+QWEgOWOw4tH3Zx
         zPlcTt393xszD/1zivPfGwU8Dkg6uVuxSzPnFDTYnzQGwL2s9/O27rMXM1pVT7nHFKMk
         QMZmAG/R4GiqYYhI9wpAj1/vmqvnexzzg2Ljk6rosPQThNdcx8HHkzzqYC4Q4bW8kVBa
         zlG6KpqJiSfigyKRCb5wyy2XXxsZeMaJkFlHkQ80kfK5jgUYYE5UdJ7DSnu1W5KH5veu
         YY4A==
X-Gm-Message-State: AAQBX9eMXuPY16xWNfn9p59GlMs4/HVTHSZlo/QEEYMj6OWPURgpedkR
        d1YlEyND9RP1CX4mj4vB9A1TnQ==
X-Google-Smtp-Source: AKy350aBTXWUHkOoWWpMiB5LjRWMtYr+sdwftDAorySY6Rt+TMIBXriebG11fJ5qLoogFUA1yoY4qQ==
X-Received: by 2002:a2e:8715:0:b0:298:a7c3:c26a with SMTP id m21-20020a2e8715000000b00298a7c3c26amr9124268lji.25.1680386899049;
        Sat, 01 Apr 2023 15:08:19 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k17-20020a2e9211000000b0029bd4d0d3f2sm997590ljg.33.2023.04.01.15.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 15:08:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org
Subject: [PATCH v2 12/22] arm64: dts: qcom: pm8350: allow overriding SID and label
Date:   Sun,  2 Apr 2023 01:08:00 +0300
Message-Id: <20230401220810.3563708-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230401220810.3563708-1-dmitry.baryshkov@linaro.org>
References: <20230401220810.3563708-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The platform can use several instances of PM8350 PMIC. Allow overriding
the SID and node labels inside pm8350.dtsi.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8350.dtsi          | 29 ++++++++++++++-----
 arch/arm64/boot/dts/qcom/pmic-dyn-footer.dtsi |  3 ++
 arch/arm64/boot/dts/qcom/pmic-dyn-header.dtsi |  6 ++++
 3 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8350.dtsi b/arch/arm64/boot/dts/qcom/pm8350.dtsi
index 9fb963df4b41..b7b14b5fe67d 100644
--- a/arch/arm64/boot/dts/qcom/pm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350.dtsi
@@ -6,12 +6,23 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
+/* (Sadly) this PMIC can be configured to be at different SIDs */
+#ifndef PMIC_SID
+	#define PMIC_SID 1
+#endif
+
+#ifndef PMIC_LABEL
+	#define PMIC_LABEL pm8350
+#endif
+
+#include "pmic-dyn-header.dtsi"
+
 / {
 	thermal-zones {
-		pm8350-thermal {
+		NODE(thermal) {
 			polling-delay-passive = <100>;
 			polling-delay = <0>;
-			thermal-sensors = <&pm8350_temp_alarm>;
+			thermal-sensors = <&LABEL(temp_alarm)>;
 
 			trips {
 				trip0 {
@@ -31,27 +42,29 @@ crit {
 };
 
 &spmi_bus {
-	pm8350: pmic@1 {
+	PMIC_LABEL: pmic@PMIC_SID {
 		compatible = "qcom,pm8350", "qcom,spmi-pmic";
-		reg = <0x1 SPMI_USID>;
+		reg = <PMIC_SID SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		pm8350_temp_alarm: temp-alarm@a00 {
+		LABEL(temp_alarm): temp-alarm@a00 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0xa00>;
-			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			interrupts = <PMIC_SID 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
 		};
 
-		pm8350_gpios: gpio@8800 {
+		LABEL(gpios): gpio@8800 {
 			compatible = "qcom,pm8350-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
 			gpio-controller;
-			gpio-ranges = <&pm8350_gpios 0 0 10>;
+			gpio-ranges = <&LABEL(gpios) 0 0 10>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
 	};
 };
+
+#include "pmic-dyn-footer.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/pmic-dyn-footer.dtsi b/arch/arm64/boot/dts/qcom/pmic-dyn-footer.dtsi
index 1c81269f0783..29b10e7fb8c3 100644
--- a/arch/arm64/boot/dts/qcom/pmic-dyn-footer.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmic-dyn-footer.dtsi
@@ -9,5 +9,8 @@
 #undef _LABEL
 #undef __LABEL
 
+#undef NODE
+
 #undef PMIC_SID
 #undef PMIC_LABEL
+#undef PMIC_NODE
diff --git a/arch/arm64/boot/dts/qcom/pmic-dyn-header.dtsi b/arch/arm64/boot/dts/qcom/pmic-dyn-header.dtsi
index 75f0448568bd..bb41c9387aba 100644
--- a/arch/arm64/boot/dts/qcom/pmic-dyn-header.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmic-dyn-header.dtsi
@@ -9,6 +9,12 @@
  * pmic-dyn-footer.dtsi.
  */
 
+#ifndef PMIC_NODE
+	#define PMIC_NODE PMIC_LABEL
+#endif
+
 #define LABEL(name) _LABEL(PMIC_LABEL, name)
 #define _LABEL(pmic, name) __LABEL(pmic, name)
 #define __LABEL(pmic, name) pmic ## _ ## name
+
+#define NODE(name) PMIC_NODE ##-##  name
-- 
2.30.2

