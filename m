Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE45F6F9D0A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 02:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232011AbjEHAdW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 May 2023 20:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232149AbjEHAdS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 May 2023 20:33:18 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8003D9EC3
        for <linux-arm-msm@vger.kernel.org>; Sun,  7 May 2023 17:33:15 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f14e499ffcso2575958e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 May 2023 17:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683505994; x=1686097994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZ39LePwzfXGUX5T8kPy8FR1120Whr91g1ULF3PXJPQ=;
        b=fLv/w6nSTVC2C1/Q7ISdCiQd7n5tS52T31v/Pb3ESMpuqcloYojscVSDZXKzQfFsCZ
         2ba5zR2IZ6K8Cc2AP5BzpwqXMj2gf2GaARC99uaI0AwCIrc0L/vH7yqFSHU2Epx9gE77
         1JT0RoMjePLD8+hkEiiIII58kODj10fehq5/q3n7yIr3x98EVoa9xKLAUahL3bQ4zLL0
         hpDaKw6ZnypE1llninsKKb83EERQ+FXS0grE07bdYPjlzuvVZNBaviFAegC1SaMtY2Mo
         iF9hj5QOWwrhF/P3GUJ/zia3qejbJleh4W2IbJl4hktKKVBhhaIIX3+6nU02jTtGMu/g
         Ux1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683505994; x=1686097994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZ39LePwzfXGUX5T8kPy8FR1120Whr91g1ULF3PXJPQ=;
        b=Ya7ZeUmM9IEamWiToasTsF+u5EKIctCwftPB+Q+yEn6RLSo2ldYDiCME5KTC5lOvcd
         8iYHFF170wJURxJxjQ4Kn2387qCvE5VN1xo3NdmK+7H4FN/8ztBScsL4koq26L6NdQBk
         vK2wkiBNY0WGFQKbcqXphN9Of8Oi8Kg9P5cUsi6y73u9rCNCnVMLjoP3Q7jvIkSS34L9
         x7rdPMHQ93uUP/8kyqlBH1KijpCof0QqzhEGIHKPN6DaLiYejajOHYNUkWhMO5jLH2ug
         Gl3r6rmT+sHsW+lkWwnP64VAjI5N//bTRcPSozhkA06ky0GIg4t70AnYrTla0AKb4Dpu
         Q6Ow==
X-Gm-Message-State: AC+VfDzONf1JWrPoCIo7MCVY5EYmgTrkj5+Xo+tzW4RTEHuQdRgMAvMb
        Z/6Muc8i1XcgKsisTZXGyH9peg==
X-Google-Smtp-Source: ACHHUZ6c46A+L0LTHo+BJXLdpuWw6r0Yxf/FeK0ARsHgolnU7SgB6GwinbyprvwCrIKIEmaTbM0+dg==
X-Received: by 2002:ac2:442a:0:b0:4dd:afd7:8f1 with SMTP id w10-20020ac2442a000000b004ddafd708f1mr2070131lfl.52.1683505993858;
        Sun, 07 May 2023 17:33:13 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id m22-20020ac24256000000b004eca2b8b6bdsm1114807lfl.4.2023.05.07.17.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 17:33:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 5/6] ARM: dts: qcom: apq8074-dragonboard: add onboard leds
Date:   Mon,  8 May 2023 03:33:08 +0300
Message-Id: <20230508003309.2363787-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508003309.2363787-1-dmitry.baryshkov@linaro.org>
References: <20230508003309.2363787-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The dragonboard as three LEDs: red, green and blue. Add corresponding
description.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
index 2017bdf81677..16d609b85dfe 100644
--- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include "qcom-msm8974.dtsi"
 #include "qcom-pm8841.dtsi"
@@ -126,6 +127,29 @@ pinconf {
         };
 };
 
+&pm8941_lpg {
+        qcom,power-source = <1>;
+	status = "okay";
+
+	led@5 {
+		reg = <5>;
+                color = <LED_COLOR_ID_BLUE>;
+                function = LED_FUNCTION_INDICATOR;
+	};
+
+	led@6 {
+		reg = <6>;
+                color = <LED_COLOR_ID_GREEN>;
+                function = LED_FUNCTION_INDICATOR;
+	};
+
+	led@7 {
+		reg = <7>;
+                color = <LED_COLOR_ID_RED>;
+                function = LED_FUNCTION_INDICATOR;
+	};
+};
+
 &pm8941_resin {
 	status = "okay";
 	linux,code = <KEY_VOLUMEDOWN>;
-- 
2.39.2

