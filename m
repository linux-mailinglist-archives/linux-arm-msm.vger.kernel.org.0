Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42DDA62B9C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 11:45:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238925AbiKPKpT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 05:45:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238691AbiKPKo1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 05:44:27 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA63232B8D
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:32:32 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id l14so29178749wrw.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJmB7rTXqwXQrw5JmqT0j16NvKD+AGCAsfY/zDfG7uU=;
        b=cwTOA5lvgbmxpihc5QgI4YOd68xbRvTbDn4nTHpBs3l9/jyv3NF9m1B6IfDfmRF1bP
         kHw5zbFHtHQDJ83c2nVBBBTIqEafCHjS64+Bz+DEbLWZ4ro51k/glMpOJnYiVSZzGsts
         mUrzEp9Jqz5HaoHO/QmqiiNGq4cX0tNAQv7QokV9exxh9eYtTIbTnDZe3kcnk8eAPGdR
         m/UuwsuZYBLP5P+O/RJC4RupYLI9Sx7RcBCkmd8yDIJQpzke+Gsyp35yLldCnfN6VzhI
         abu8SkqPml8KwD5MvMTjHQ2Ia7Rnn/xr89O4gOxA5fts1bKKR9IcAuyj4Nyqnl6RAsi2
         xwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HJmB7rTXqwXQrw5JmqT0j16NvKD+AGCAsfY/zDfG7uU=;
        b=F5b7r723g+eNZwc+mpt7K7S7EPTnbgIqZVSTy0wWnWpmvSyl7ls3cZ9L+gSPn8j6Y9
         fPYjOisGmd/Uryfto069vwB0UEoy1H7V1aL10PIcVzZJJVVGAthZMBnukNmoaHidAdpM
         EgujsLdBTbSLWgCF6dxWLg/edGxKiKUi/FnZ3dtZn/MPqcvtCI7pSzRJxsjEEjcduzk6
         NpVSnUxZMXYRRvcBB7LsEAdkusas3EfQ09Gd8n2jz3FhJzaygKt8mQdzOBqPIEURI552
         vD3IUROh9Z0qcO4a2RQAsBZlvZR/IfTgqmvFR4odN/Degc3zV/bHsxb2ChQlTI3CCG7q
         oSww==
X-Gm-Message-State: ANoB5pkZlrjM97/sXP/9vcN9cok58PPZ6jT6WSH/ZGRT0O9SJZdRmsNt
        F49qCXFzlL0kK/FrLems8+qicg==
X-Google-Smtp-Source: AA0mqf6+8wJmy6LZfcFHIk1wpv2wMAFFD2W7Fiy5H44qQNX+e01BHtSV8p5tjRE/yWWCwEabQibJtA==
X-Received: by 2002:adf:fc02:0:b0:236:ea0d:e49b with SMTP id i2-20020adffc02000000b00236ea0de49bmr13688508wrr.472.1668594751261;
        Wed, 16 Nov 2022 02:32:31 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id bh9-20020a05600005c900b0022e36c1113fsm15107032wrb.13.2022.11.16.02.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:32:30 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 08/10] arm64: dts: qcom: Add PMK8550 pmic dtsi
Date:   Wed, 16 Nov 2022 12:31:44 +0200
Message-Id: <20221116103146.2556846-9-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221116103146.2556846-1-abel.vesa@linaro.org>
References: <20221116103146.2556846-1-abel.vesa@linaro.org>
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
---
 arch/arm64/boot/dts/qcom/pmk8550.dtsi | 54 +++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pmk8550.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
new file mode 100644
index 000000000000..1f707202f5da
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
@@ -0,0 +1,54 @@
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
+			reg = <0x1300>;
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

