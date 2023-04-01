Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8B26D34C4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Apr 2023 00:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbjDAWIg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Apr 2023 18:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbjDAWIf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Apr 2023 18:08:35 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62CE82C9D0
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Apr 2023 15:08:27 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id a11so26632465lji.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Apr 2023 15:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680386905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGkRD76uD7OXKz4EqwytB34LnS2rXp7QOWAbxt/JqAk=;
        b=Dd/vxYQVguwM1BNjjHEvOXpOK4Btzb9q0wk/ayUlAZjwl1a8QeFs4FjTueJiKl8pr+
         pm+z4eQ2ZoaYTD+x8FJA/FPSe88rxRmK3a/t/vG/t4RxOERQUNyyb7SDDKEU4+SabR76
         B/O7gWPDVNqnu8akwMkdBkjLYuaBQBjPBPVnONqVYUf99Y8LWWM/6a28tHtYKebLqoT6
         mROqxKGKAmAhX3pREMfxWtQo20NB+jVztw0qw3mNlRmztxv9VuLLaSre2EffBwgKgtEo
         g7nHsSb+Yz6jPYQYLrp1cPes8Gaf/Ow6uYRI3mgyI+UtcaODxGyK+zpLJ8dzlCjGXGZK
         B/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680386905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGkRD76uD7OXKz4EqwytB34LnS2rXp7QOWAbxt/JqAk=;
        b=XsYMsKKbi2b1K5EBaaYL4niF4l4JvgLpiCuUOy4OwvYTfYTEad0/Jhi34hWpUtxCNZ
         9JiSlRhBuoqxTZ1+h2x7t8Qf3MEr7xHRTQ1EEH6Ug8n7YHmSkLAWYSCXl34Aj7GFOtmj
         dez4GAtkhmDX7gESvc1JJrqaFDPJgOpW+kanRihVTfqbAhjE7LdQvR6InS+8NeSdc1BB
         rwZVhCLk5+Nilf0J2/AFIWMHLYLZfLoHD17IbpwFWxEFNKwQNuS7o4TCpNLYiim7LJgs
         A+Gvlh0yMO4KuebJwcirTJ8lP4+6reESl/ziGXWq7ZhrMfbM4TPV2oNBAm2zSk+qIrU8
         QLVg==
X-Gm-Message-State: AAQBX9ezfWSPQNbluun7X30plLZyOdcBO36dNs/K2BOqo/6XnWs26Rku
        fmJXs5vtdt4HF2N25Ay1sJ4fRA==
X-Google-Smtp-Source: AKy350YuIagO5QqOGb/PQPnYyzndtjqejr5GChId1RnzSZ/hYDurDo9gfWtskkjeeHjAN4ZuUeYktg==
X-Received: by 2002:a2e:8508:0:b0:2a6:3161:6eed with SMTP id j8-20020a2e8508000000b002a631616eedmr296752lji.32.1680386905148;
        Sat, 01 Apr 2023 15:08:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k17-20020a2e9211000000b0029bd4d0d3f2sm997590ljg.33.2023.04.01.15.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 15:08:24 -0700 (PDT)
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
Subject: [PATCH v2 22/22] arm64: dts: qcom sa8540p-pmics: switch to pm8150.dtsi
Date:   Sun,  2 Apr 2023 01:08:10 +0300
Message-Id: <20230401220810.3563708-23-dmitry.baryshkov@linaro.org>
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

sa8540-pmics.dtsi contains 4 stripped down versions of pm8150 PMIC
declarations. Change it to use pm8150.dtsi directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi | 96 ++++-----------------
 1 file changed, 19 insertions(+), 77 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi
index 1221be89b3de..201297b6bb19 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi
@@ -7,80 +7,22 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
-&spmi_bus {
-	pmm8540a: pmic@0 {
-		compatible = "qcom,pm8150", "qcom,spmi-pmic";
-		reg = <0x0 SPMI_USID>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		rtc@6000 {
-			compatible = "qcom,pm8941-rtc";
-			reg = <0x6000>, <0x6100>;
-			reg-names = "rtc", "alarm";
-			interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
-			wakeup-source;
-		};
-
-		pmm8540a_gpios: gpio@c000 {
-			compatible = "qcom,pm8150-gpio", "qcom,spmi-gpio";
-			reg = <0xc000>;
-			gpio-controller;
-			gpio-ranges = <&pmm8540a_gpios 0 0 10>;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-	};
-
-	pmm8540c: pmic@4 {
-		compatible = "qcom,pm8150", "qcom,spmi-pmic";
-		reg = <0x4 SPMI_USID>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		pmm8540c_gpios: gpio@c000 {
-			compatible = "qcom,pm8150-gpio", "qcom,spmi-gpio";
-			reg = <0xc000>;
-			gpio-controller;
-			gpio-ranges = <&pmm8540c_gpios 0 0 10>;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-	};
-
-	pmm8540e: pmic@8 {
-		compatible = "qcom,pm8150", "qcom,spmi-pmic";
-		reg = <0x8 SPMI_USID>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		pmm8540e_gpios: gpio@c000 {
-			compatible = "qcom,pm8150-gpio", "qcom,spmi-gpio";
-			reg = <0xc000>;
-			gpio-controller;
-			gpio-ranges = <&pmm8540e_gpios 0 0 10>;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-	};
-
-	pmm8540g: pmic@c {
-		compatible = "qcom,pm8150", "qcom,spmi-pmic";
-		reg = <0xc SPMI_USID>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		pmm8540g_gpios: gpio@c000 {
-			compatible = "qcom,pm8150-gpio", "qcom,spmi-gpio";
-			reg = <0xc000>;
-			gpio-controller;
-			gpio-ranges = <&pmm8540g_gpios 0 0 10>;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-	};
-};
+#define PMIC_SID 0
+#define PMIC_SID1 1
+#define PMIC_LABEL pmm8540a
+#include "pm8150.dtsi"
+
+#define PMIC_SID 4
+#define PMIC_SID1 5
+#define PMIC_LABEL pmm8540c
+#include "pm8150.dtsi"
+
+#define PMIC_SID 8
+#define PMIC_SID1 9
+#define PMIC_LABEL pmm8540e
+#include "pm8150.dtsi"
+
+#define PMIC_SID c
+#define PMIC_SID1 d
+#define PMIC_LABEL pmm8540g
+#include "pm8150.dtsi"
-- 
2.30.2

