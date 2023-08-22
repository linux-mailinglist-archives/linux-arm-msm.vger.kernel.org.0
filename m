Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51B617836B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 02:14:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231818AbjHVAOS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Aug 2023 20:14:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231860AbjHVAOQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Aug 2023 20:14:16 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B60D198
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Aug 2023 17:14:04 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fe2d152f62so6007269e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Aug 2023 17:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692663242; x=1693268042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJzRb2KpHC38eBb2OS1Esd6+Su8JFUz64dXbGn6QD2I=;
        b=ZrUraG+m84q8l6751vlPiZIhCwjRbc0HuMOErFNncVDTjD6bKNQPtbLc+gpRKX5PDP
         ygShWQVF197zbtmWxMR2BTh31AQgxl8+eMKTCK80EDXKO3eamWzmvMH4gE0IazuCG8lR
         BZNLTe24kqmZUIKYlEN/d5PjVZxdCEhcuOHtpLELRnzPfu3ybpY7Nll+zJZkUG8/OMkM
         iJFt7ahM9k9hOKMQxH3t2pKQ/LR6q6tJp7sgy7B8Jb2LocuwflN+4WFblEHEdV7QypYv
         VwGIkTA2Urg/sQyBdZZAD78dVS8uZogoubCWjusU//3i7i+zktxlnGPyu56KyRdHnmYZ
         GNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692663242; x=1693268042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJzRb2KpHC38eBb2OS1Esd6+Su8JFUz64dXbGn6QD2I=;
        b=enPXMx6Ri8jbu5Rw33v48m22uUuYjNXJYT6WQUnQz8F5CGubNe8GTBeLmjjhBiADo6
         WLtv9znqdXVDxcLwPS8VULZvdfUj4Mu4Mly/xM3cmMeLKCvFr2zYH1s/qVGsHhmvOtYC
         0MW5hw5wUT/04/TAtJFPmePDAEs7+cPZSOqg5nS50y2EFFpf6Ep5W0zZesMji0zkV3zv
         9fXICKpf20lY4WCAOcEUYrdW/uDfyrE4ctI1fXYQHj+tcME4T1s8R5CwXFELUf7bZapP
         B+atRGJ5TNTx1KJv0epaFXsxrFFwnMGgawzn8OYDSUFvjLEXWRhDR6aUTSPvaglHlWHi
         bJrg==
X-Gm-Message-State: AOJu0Yxf5Kd0j//TR0q/Oy9MmRTYLALQ1zifS84DYeaRkT3mrR+Ngk99
        N8/JCqEiYC9JTEA/WiezMYVy4Q==
X-Google-Smtp-Source: AGHT+IGTPZ9qs09ap8ZrlNeuDUK+WT2iI0csgsV09YcWy1oV4fMiHv4gvBorlnV3/1HXONwglh8i5w==
X-Received: by 2002:ac2:4e08:0:b0:4fd:f590:1ff7 with SMTP id e8-20020ac24e08000000b004fdf5901ff7mr7311693lfr.40.1692663242376;
        Mon, 21 Aug 2023 17:14:02 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id er23-20020a05651248d700b004fe36e673b8sm912024lfb.178.2023.08.21.17.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 17:14:01 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v3 14/32] ARM: dts: qcom: msm8960: split PMIC to separate dtsi files
Date:   Tue, 22 Aug 2023 03:13:31 +0300
Message-Id: <20230822001349.899298-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
References: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PMIC is not a part of the SoC, so move PMIC to a separate file and
include it from the board files.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8921.dtsi            | 40 +++++++++++++++++++
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts   |  1 +
 .../qcom/qcom-msm8960-samsung-expressatt.dts  |  3 +-
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi      | 38 +-----------------
 4 files changed, 45 insertions(+), 37 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom/pm8921.dtsi

diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
new file mode 100644
index 000000000000..414941f7a42f
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+
+&ssbi {
+	pm8921: pmic {
+		compatible = "qcom,pm8921";
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pwrkey@1c {
+			compatible = "qcom,pm8921-pwrkey";
+			reg = <0x1c>;
+			interrupt-parent = <&pm8921>;
+			interrupts = <50 IRQ_TYPE_EDGE_RISING>,
+				     <51 IRQ_TYPE_EDGE_RISING>;
+			debounce = <15625>;
+			pull-up;
+		};
+
+		pm8921_keypad: keypad@148 {
+			compatible = "qcom,pm8921-keypad";
+			reg = <0x148>;
+			interrupt-parent = <&pm8921>;
+			interrupts = <74 IRQ_TYPE_EDGE_RISING>,
+				     <75 IRQ_TYPE_EDGE_RISING>;
+			debounce = <15>;
+			scan-delay = <32>;
+			row-hold = <91500>;
+		};
+
+		rtc@11d {
+			compatible = "qcom,pm8921-rtc";
+			interrupt-parent = <&pm8921>;
+			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
+			reg = <0x11d>;
+			allow-set-time;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
index 4641b4f2195d..414881d34c60 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
@@ -2,6 +2,7 @@
 #include <dt-bindings/input/input.h>
 
 #include "qcom-msm8960.dtsi"
+#include "pm8921.dtsi"
 
 / {
 	model = "Qualcomm MSM8960 CDP";
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index 13e85c287498..2e7d98e132be 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/reset/qcom,gcc-msm8960.h>
 
 #include "qcom-msm8960.dtsi"
-#include <dt-bindings/reset/qcom,gcc-msm8960.h>
+#include "pm8921.dtsi"
 
 / {
 	model = "Samsung Galaxy Express SGH-I437";
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index ea2d961b266b..4a6b22bed1e4 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -259,48 +259,14 @@ gsbi5_serial: serial@16440000 {
 			};
 		};
 
-		ssbi@500000 {
+		ssbi: ssbi@500000 {
 			compatible = "qcom,ssbi";
 			reg = <0x500000 0x1000>;
 			qcom,controller-type = "pmic-arbiter";
 
-			pm8921: pmic {
-				compatible = "qcom,pm8921";
+			pmic {
 				interrupt-parent = <&msmgpio>;
 				interrupts = <104 IRQ_TYPE_LEVEL_LOW>;
-				#interrupt-cells = <2>;
-				interrupt-controller;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				pwrkey@1c {
-					compatible = "qcom,pm8921-pwrkey";
-					reg = <0x1c>;
-					interrupt-parent = <&pm8921>;
-					interrupts = <50 IRQ_TYPE_EDGE_RISING>,
-						     <51 IRQ_TYPE_EDGE_RISING>;
-					debounce = <15625>;
-					pull-up;
-				};
-
-				pm8921_keypad: keypad@148 {
-					compatible = "qcom,pm8921-keypad";
-					reg = <0x148>;
-					interrupt-parent = <&pm8921>;
-					interrupts = <74 IRQ_TYPE_EDGE_RISING>,
-						     <75 IRQ_TYPE_EDGE_RISING>;
-					debounce = <15>;
-					scan-delay = <32>;
-					row-hold = <91500>;
-				};
-
-				rtc@11d {
-					compatible = "qcom,pm8921-rtc";
-					interrupt-parent = <&pm8921>;
-					interrupts = <39 IRQ_TYPE_EDGE_RISING>;
-					reg = <0x11d>;
-					allow-set-time;
-				};
 			};
 		};
 
-- 
2.39.2

