Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B96AD644455
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 14:14:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232896AbiLFNNm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 08:13:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234242AbiLFNNb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 08:13:31 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E44CE097
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 05:13:24 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id m18so4524162eji.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 05:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFy4mpBpGJLVajWjtu3C2lS5gW1c9EpDqZmyzJeWXJI=;
        b=MhG+Du30hB+Q9dP4fHNoqULnM7AnXs1dkLjGzg/3ect4fFzZ9JJKd/EXxh/qXjFfjS
         JZCfQb4nvnhnR64axE9gpKU85zRMAkHUem2EeC6t5ofgkSie/qhc70r6qieZeHFypwDS
         sQHK5wjIe1DHPXgPgfs9xbNnwAdcBe5u+eMQ37qIgujyv6dSujEi+ptvCHmAczGiEneQ
         WQkrjx0R3mcLx9rOQFzXLQuyLzHRL6es4i0AVQdUWgZ672M5769VmI9zyyClilgMIF5E
         JOXmu2RtJVivXHJob07HRSss9ezr71jQCV/DWtLLbUdT8nLfgs2z1eiucaLStiZoW12M
         t3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YFy4mpBpGJLVajWjtu3C2lS5gW1c9EpDqZmyzJeWXJI=;
        b=KKMCD6qlgFaKjH79zAIzovY4FMiO10CozL/mX6fidq2ZLgc98GuLuAmUPA7rWYH8/H
         v3ALW6z1V0ytSKOMwIpGmUhQI2Buf3cx93w5M/UqYep6wM1AHq4x8h/3fcesiVcg/Ddw
         3AE1ypk8Sgxr8VI0N3UxY57QzmOLMgAqivoh77o2+bh/cNZP98BVaXKOIhw/PlCvXFeJ
         dkbqtILkPRcVeZf7E6mVf9yRt/jfGyAPbCsev1iSjNNSR+5g01FzMpNLw8Ba9i0P/0JB
         B/zhFJFuaYZ3Cs9kPuHpF1doY/ICPjYsEOQ6cY+WshowPb1HAjw7LSiYXInxxJfz+OqY
         ND/w==
X-Gm-Message-State: ANoB5pmmlK4sGjUf1jYvcDWpxAQ0Ojnd1EtkudGhzyuSrQ/lK9t5ST0q
        hgusoSo/lS7izfiU2O0VvrvTiA==
X-Google-Smtp-Source: AA0mqf4vXaMtXQ+X7UFvIDOoR1CY+fF3duCPEyEB+S/0j43mNh+zs96ntlJYYjwixG27Jsg/hqkW/Q==
X-Received: by 2002:a17:906:49c4:b0:7c0:d23c:ead5 with SMTP id w4-20020a17090649c400b007c0d23cead5mr12978862ejv.606.1670332402901;
        Tue, 06 Dec 2022 05:13:22 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id u2-20020a1709061da200b007b8a8fc6674sm7345775ejh.12.2022.12.06.05.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 05:13:22 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v6 05/10] arm64: dts: qcom: Add PM8550b pmic dtsi
Date:   Tue,  6 Dec 2022 15:12:47 +0200
Message-Id: <20221206131252.977369-6-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206131252.977369-1-abel.vesa@linaro.org>
References: <20221206131252.977369-1-abel.vesa@linaro.org>
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

