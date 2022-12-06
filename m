Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39E5364444C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 14:14:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234413AbiLFNN4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 08:13:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232910AbiLFNNl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 08:13:41 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1F231B1E5
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 05:13:26 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id gh17so6064827ejb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 05:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCy2ZKkP+o5zw4JnVQxbpcd6lL2PTAKfa9gdKzWsPa8=;
        b=iyGkgbdcHkaUI5kxxiAD5L5DoTE2+4DCW5JXmiCPVuMWRZt2906NYE+2uQq/yYySdX
         NnT6bqaVrhdBqO0SykdWfzSVF0Gq1cCLkDMck/gRbupCRJwWWe1BE9wgz7WBseifNs9o
         6LRGA3tvxUiXjzKd+/WH8iEmfRyXOghzGzU5pFfUydYfcvmzgzfGOyAu5C99rWDIgV6c
         FznDdybdu6MS0F3BeGtM1wgQuENcoBUDdXt3cPRUh8pGfi+emAZV8YShVgR8qUDD3Tqi
         5O6F8PK7ZAy0+Shvngn0lbjIn2oEdbj4Cw2RFwFZ0ZYCs+ESC03pBfAZ6XBifsnS2cSZ
         mN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCy2ZKkP+o5zw4JnVQxbpcd6lL2PTAKfa9gdKzWsPa8=;
        b=UQNF8+bgEu6rVnS33YB+V0a5FsoQByuqSuy/dwSib0KtTLu9BtwcAl+63p/VWSv4x1
         rxiCZnwCtWetBXfDhrkunjGdzX3L3VQsKEV1oEvyUiRTOZiIr6jAxTPSIstGr4SdI/3C
         VtEinlwnPnqhz+dB6ai8+65hCt4T5Z5Hm9IEuDmgTjUyvIm2QYWerGpp6BJBI+YUolYj
         Y5bKp6FSDxzytGw7fwe4ZQ7gkBa47/VY2fmfB0j/jn03/qnhroFQgG/R/5kPGCo7Dx0d
         VH24uUOgxhYA+jT5jSwa/39pSelaDWPz7jW9Iq+70Afxa8RvQ5ahOF4AwqouYd2fLI3+
         CVEQ==
X-Gm-Message-State: ANoB5pmZg3DnPHl96YR/+Eu69rMJTG9lrR+JdwzkcxoCqC8Zgj4E2i/5
        LpwsNvn6wcCz4Yovw7xFH5zciblb0ecEs9PX
X-Google-Smtp-Source: AA0mqf7pOISGsfHe5kUx9El3E05lCf20tKu+AogKpDLGg9Lolr37qT7oYu7/9mDbHNJOfe3YcVjgqg==
X-Received: by 2002:a17:906:6dd5:b0:78d:a633:b55 with SMTP id j21-20020a1709066dd500b0078da6330b55mr76507612ejt.106.1670332406502;
        Tue, 06 Dec 2022 05:13:26 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id u2-20020a1709061da200b007b8a8fc6674sm7345775ejh.12.2022.12.06.05.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 05:13:26 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v6 08/10] arm64: dts: qcom: Add PMK8550 pmic dtsi
Date:   Tue,  6 Dec 2022 15:12:50 +0200
Message-Id: <20221206131252.977369-9-abel.vesa@linaro.org>
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

Add nodes for PMK8550 in separate dtsi file.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
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

