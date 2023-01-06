Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A94D66607E7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 21:12:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236541AbjAFUMA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 15:12:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236578AbjAFULP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 15:11:15 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A56278A76
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 12:11:02 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so1857841wms.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jan 2023 12:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFy4mpBpGJLVajWjtu3C2lS5gW1c9EpDqZmyzJeWXJI=;
        b=yIGDHeP2U4eQMnSVthoLFAh1h6HFCi4PQkL6gpLJ1mlqKuC4siZ31zaTMw8uT4WndO
         auZp01H5FQ+ajvqpm88noTQjwSCaPWlNmwIFGr+y4I8RoPs/Oxra0bdfww0SKH6V14L3
         T9+RPxd1Mv/73Q3CaLsU0mDotvihhYdCJYAKwD4xyPIQoDi9FFoSxifhkuw9F9UV1Xxm
         vbpwtvm3VXVD8t3taRGc2M7wSH/n1njg9PXWgryN0qF6tCmV2MhCTrHqB8B0mGOujPC6
         joKtWog34fP+68IWuRdgQEkTQSMfqOoBj7XCMSQsQURi7uT2zYpruNqj+GRMHPkDku/t
         HYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YFy4mpBpGJLVajWjtu3C2lS5gW1c9EpDqZmyzJeWXJI=;
        b=N3dxLOM6krJZ+R6D3s5KkYWoyK1OM39B1d9Sz77CjWrDzyk0NOfWItIERlUCRPkzVE
         3z7FivVrr1/3vQQQzXggzPsqiqUP7EmS1zsN1NOnT5ZbLLNd5LLknIC3eTrrn+dy3fMK
         hAeKLvSGnUtO3Zfa1KtTR0+sPtztKiL82Evfb9Uvvn7yfL2iI/NFYHdT6CjKn7mm3SCE
         thCbAHqmP9IwMuRhLZVcKUl0c3v1d6LqQOaQLMGOEHvuKsX2PVk1kUsDnyycbtHG7i9o
         YV/pbI0v+4NL9sV6eKDoPOgquYbPI0IXf99u1+i2pYVZPutGExy/mKuhZZjPnhP4HI1q
         tFAQ==
X-Gm-Message-State: AFqh2krwXZkl+hqUHhV2H+a6pc+eJ6D0rY3Ya6OjlgeVhYKi/UtnN7bP
        RkmF2pJDVl+gnbZ+nvg1O22Y5Q==
X-Google-Smtp-Source: AMrXdXt1UYWwAXdcOkbWzIzJuU5UgmNmp2BfQHskKwzw2hhIiTPgVPQ7MafgpipocT31LLyEyBlKhQ==
X-Received: by 2002:a1c:4b03:0:b0:3d9:103d:9081 with SMTP id y3-20020a1c4b03000000b003d9103d9081mr40104318wma.28.1673035860883;
        Fri, 06 Jan 2023 12:11:00 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id z14-20020a05600c220e00b003d99fad7511sm2665240wml.22.2023.01.06.12.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 12:11:00 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v9 05/10] arm64: dts: qcom: Add PM8550b pmic dtsi
Date:   Fri,  6 Jan 2023 22:10:42 +0200
Message-Id: <20230106201047.337409-6-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230106201047.337409-1-abel.vesa@linaro.org>
References: <20230106201047.337409-1-abel.vesa@linaro.org>
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

Add nodes for PM8550b in separate dtsi file.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8550b.dtsi | 59 +++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8550b.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pm8550b.dtsi b/arch/arm64/boot/dts/qcom/pm8550b.dtsi
new file mode 100644
index 000000000000..16bcfb64d735
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm8550b.dtsi
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
+		pm8550b-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pm8550b_temp_alarm>;
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
+	pm8550b: pmic@7 {
+		compatible = "qcom,pm8550", "qcom,spmi-pmic";
+		reg = <0x7 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8550b_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x7 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm8550b_gpios: gpio@8800 {
+			compatible = "qcom,pm8550b-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm8550b_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
-- 
2.34.1

