Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25C2B644448
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 14:13:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234435AbiLFNNc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 08:13:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234124AbiLFNN1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 08:13:27 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EA6CBCB0
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 05:13:23 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id d20so20261617edn.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 05:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YiSyzj5bxhBZ228Fs3MQ7cHv3+MhOBcyO/fL/boI7rc=;
        b=wZNMa6GRMWblKpM5+BYG4TZ93+J0JbB3wyWhS96DT1KLHDskQ91UyJz+E00I6nop9I
         Yygw6jp2BV2uPPnf1NVo4D9p8zRkfJevvTF0nvF7XcQy7Dn+KnQ5UF3zAbgbiGoJ1MoS
         z1ctJcABrO5S+ti8h703Gk/i5RJwnhxM/Zk9hSBTYCFfQPQFdntXE4SVSco/ILhCQR8r
         +Hurd8SYyPIVJ7gboGgqXlROLBBhmRN2n/3hUqF9Jx5ERuRpJ/4Zea9PWFxZoyOfY9IH
         eehhF+6IvJWA+cMxm7g2pNwZgkfFH4K1ldmN+cu+pB+NdJ13qkYbHsj7RkEdg8z959Kh
         JA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YiSyzj5bxhBZ228Fs3MQ7cHv3+MhOBcyO/fL/boI7rc=;
        b=drcpxSEyjqg37End9irPxCKYe+4w3hcHy4RQ7LfsndAR1bkLtQn009JXOxJHj0v2We
         qYUc6EeK6saDf/YuypduTgMQhYV4zoJ6+iihHGi3wnxpfoN2J3VaayJoJcBS7iQ9ZsS8
         MWY0zTEr1U/H5Ir619/jp/u2KcMNBvd3FlIYgh97e1XwWsFiskdaH1GHBN23seBu8IV6
         W0cotFwhpNEB+TnlRJ8UfBNrI9I6ohwSLJgucmQAEhNYFcH7ZKVobGO+6nbZAG96Ai4+
         7dpUAd30BV3l+F/xv3yOy8iDPdHAmLgE0aQk8UJfOO7a/2LmRCaVB4PUrfnXUnW86pOH
         dCCg==
X-Gm-Message-State: ANoB5pnMhu5ch8ZhQrgunTSgv7M44BEfJQ72vygW/nkt5uaW7H1ZmlpH
        AmwYvmvdDAsiP0R1yWZetVOQ5A==
X-Google-Smtp-Source: AA0mqf5uy5TCXiXUc8p+fw/TFXTA70BFmGyDXoL/PoRwT7Zq3z2FARqJTsQit3RVc269SNlgj4Eulg==
X-Received: by 2002:aa7:d558:0:b0:461:eea0:514c with SMTP id u24-20020aa7d558000000b00461eea0514cmr17246138edr.296.1670332401622;
        Tue, 06 Dec 2022 05:13:21 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id u2-20020a1709061da200b007b8a8fc6674sm7345775ejh.12.2022.12.06.05.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 05:13:21 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v6 04/10] arm64: dts: qcom: Add PM8550 pmic dtsi
Date:   Tue,  6 Dec 2022 15:12:46 +0200
Message-Id: <20221206131252.977369-5-abel.vesa@linaro.org>
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

