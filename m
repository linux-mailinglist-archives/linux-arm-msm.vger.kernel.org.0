Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAD7E637AC5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Nov 2022 14:58:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbiKXN6b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Nov 2022 08:58:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbiKXN6A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Nov 2022 08:58:00 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EAD912BFEA
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 05:57:03 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id z4so2606893wrr.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 05:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHSeOYzweUqdiAaQpWMehoqfdV5F74EQqR4/bC33sbI=;
        b=xZrXa0g1jjeEus9+uFv4HgQ8wPjCudivm1+AoyUKr291s+2j5/df3pKOpUyO2zEUYr
         X8Eru9FggZReuq+klfg9tlJb7wCk+pEA4q1wLvhOaxghOxkvWJvboHA6gsjDK0ABxD4s
         Fn4w0QrsmT/H3iiQgexS4aMelgBA3wQlwRG9XY4zHOZuujmv46ccHhwBcmwv3xoZfyTi
         MnjUoaBQ5JE2jyRHqzK6VWDKZf7idXIkz0pyMHxDraXEI8eDIZtlF21JJuBT/PBhUq2n
         mvbOJvXTu9PkNw6IjivGD6tpl8fwYy0MlYcqHkjDP71dyK3GJu46bNxMx1oL7ekfI57w
         Rm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHSeOYzweUqdiAaQpWMehoqfdV5F74EQqR4/bC33sbI=;
        b=o7J3ZFnAYLseL+WWEUgcz85mxIpupQsWOPLFDBa4yZsUMpgdee4x4aNp4b+5cNLzN/
         KTXvcAPzazKOIhkI4WdF4/mU3xdbSEOYkkVKMZ6RIoIR+PAK4Ed5s5z08ScUu/4fKWwU
         Q9iA5owASs0rGw9sul87sjw+lqEUuqADT10mBm5D20cdUIoVHFXOoY3Tfsu31KHjnGtS
         kxAEA0iUq9erhvBgKetqccIIHtNJnroVACVuBHP6KhP1twoqJL97kifMV7xCJXCHKJDx
         iSo9ZYrri7yyXhoLizyZWopD3nJP0A0TpLgWSnSvF5iswM85g0KEVhPguceJkNT9IpM8
         tMOQ==
X-Gm-Message-State: ANoB5plchmRd+QE3+nmuEqfAnTGy+ZYru5nvCw5mEIDBLJRbKzbrtsoZ
        UK9syoEdUnAjOw/7FspFP1QWhQelhsKspg==
X-Google-Smtp-Source: AA0mqf7agRUxC7fUS2R3GH0V79qYlZBwAYor8ju+noewQQlkf5N6+1Wnat9ymQsS8KTkDtdlYDCLuw==
X-Received: by 2002:a05:6000:5c6:b0:241:cb36:9dbf with SMTP id bh6-20020a05600005c600b00241cb369dbfmr13811264wrb.504.1669298216666;
        Thu, 24 Nov 2022 05:56:56 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v14-20020adfebce000000b00241d21d4652sm1414322wrn.21.2022.11.24.05.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 05:56:56 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 04/10] arm64: dts: qcom: Add PM8550 pmic dtsi
Date:   Thu, 24 Nov 2022 15:56:40 +0200
Message-Id: <20221124135646.1952727-5-abel.vesa@linaro.org>
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

Add nodes for PM8550 in separate dtsi file.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Changes since v1:
 * added Konrad's R-b tag

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

